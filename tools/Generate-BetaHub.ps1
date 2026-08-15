#Requires -Version 7
<#
.SYNOPSIS
  Generiert die Beta-Hub-Uebersicht fuer die SPT-Mods: README.md mit Tabelle,
  Screenshots und Downloads, dazu die ZIP-Pakete in downloads/.

  Aufruf nach dem Bauen der Mods:
    pwsh tools/Generate-BetaHub.ps1          # nur generieren
    pwsh tools/Generate-BetaHub.ps1 -Push    # generieren + commit + push

  Forge-Filter: Mods, die bereits auf Forge (https://sp-mod.com) veroeffentlicht sind,
  werden automatisch NICHT gelistet. Erkennung per Forge-API: pro Mod werden die
  Plugin-GUIDs aus dem Quellcode gezogen ([BepInPlugin("com.maschine....")], Fallback
  com.maschine.<ordnername>) und in EINER Abfrage gegen
  GET /api/v0/mods?filter[guid]=... geprueft. Das Ergebnis wird in
  forge-published.json gecacht; ist die API nicht erreichbar, gilt der Cache.
  Ohne API UND ohne Cache bricht das Skript ab (lieber kein Update als
  veroeffentlichte Mods zu listen).

  Optionale Overrides pro Mod in mods.json (alle Schluessel optional):
    "ModName": {
      "enabled":     false,                  # false = nie listen; true = listen, auch
                                             # wenn als veroeffentlicht erkannt
      "description": "Kurztext fuer die Tabelle",
      "notes":       "Zusatzhinweis fuer Tester (Markdown)",
      "screenshots": ["rel/pfad/im/mod-ordner.png"]
    }
#>
[CmdletBinding()]
param(
    [string]$DevRoot = 'D:\SPT41\Development',
    [string]$HubRoot = (Split-Path $PSScriptRoot -Parent),
    [string]$Branch  = 'main',
    [switch]$Push
)

$ErrorActionPreference = 'Stop'
$warnings = [System.Collections.Generic.List[string]]::new()
function Warn([string]$msg) {
    $warnings.Add($msg)
    Write-Host "WARNUNG: $msg" -ForegroundColor Yellow
}

# ---------------------------------------------------------------- Konfiguration
$config = @{}
$configPath = Join-Path $HubRoot 'mods.json'
if (Test-Path $configPath) {
    $config = Get-Content $configPath -Raw | ConvertFrom-Json -AsHashtable
}
function Cfg([string]$mod, [string]$key) {
    if ($config.ContainsKey($mod) -and $config[$mod] -is [hashtable] -and $config[$mod].ContainsKey($key)) {
        return $config[$mod][$key]
    }
    return $null
}

# ---------------------------------------------------------------- Hilfsfunktionen
function Get-AlnumLower([string]$s) { return (($s -replace '[^A-Za-z0-9]', '')).ToLower() }

function Trunc([string]$s, [int]$n) {
    if (-not $s) { return $s }
    $s = $s.Trim()
    if ($s.Length -le $n) { return $s }
    $cut = $s.Substring(0, $n)
    $i = $cut.LastIndexOf(' ')
    if ($i -gt 40) { $cut = $cut.Substring(0, $i) }
    return "$cut…"
}

function TableCell([string]$s) {
    if (-not $s) { return '–' }
    return (($s -replace '\r?\n', ' ') -replace '\|', '\|').Trim()
}

# Liest README.md eines Mods: Body (Titelzeile entfernt, Ueberschriften demotet)
# und ersten Textabsatz fuer die Tabelle.
function Read-ModReadme([string]$modDir, [string]$modName) {
    $path = Join-Path $modDir 'README.md'
    if (-not (Test-Path $path)) { return $null }
    $lines = @((Get-Content $path -Raw) -split "`r?`n")
    $nameKeys = @((Get-AlnumLower $modName), (Get-AlnumLower "maschine-$modName"))

    $start = 0
    while ($start -lt $lines.Count -and [string]::IsNullOrWhiteSpace($lines[$start])) { $start++ }
    if ($start -lt $lines.Count) {
        $t = Get-AlnumLower (($lines[$start] -replace '^#+\s*', '').Trim())
        if ($t -in $nameKeys) { $start++ }
    }
    $body = ''
    if ($start -lt $lines.Count) { $body = ($lines[$start..($lines.Count - 1)] -join "`n").Trim() }

    $paras = [System.Collections.Generic.List[string]]::new()
    $buf = @()
    foreach ($ln in ($body -split "`n")) {
        $trim = $ln.Trim()
        if ($trim -eq '' -or $trim -match '^(#|!\[|<|\[!\[)') {
            if ($buf.Count) { $paras.Add($buf -join ' '); $buf = @() }
            if ($paras.Count -ge 5) { break }
            continue
        }
        $buf += $trim
    }
    if ($buf.Count) { $paras.Add($buf -join ' ') }
    # Klartext-Ueberschriften ("Overview", "Summary", ...) nicht als Beschreibung verwenden
    $para = $paras | Where-Object { $_ -notmatch '^[A-Za-z][A-Za-z ()&/\-]{0,39}$' } | Select-Object -First 1

    $body = [regex]::Replace($body, '(?m)^(#{1,4})', '##$1')
    return @{ Body = $body; Para = $para }
}

# ProductVersion einer DLL -> Version + eindeutige Build-Kennung.
# "2.0.0+7e1450e97..." -> Version 2.0.0, Id 7e1450e (Commit).
# Ohne Commit-Hash: Kurz-Hash (SHA256) der Datei als Kennung.
function Get-DllInfo([System.IO.FileInfo]$dll) {
    $pv = [System.Diagnostics.FileVersionInfo]::GetVersionInfo($dll.FullName).ProductVersion
    $version = $pv
    $id = $null
    if ($pv -and $pv -match '^(?<v>[0-9][^+ ]*)\+(?<h>[0-9a-fA-F]{7,40})') {
        $version = $Matches['v']
        $id = $Matches['h'].Substring(0, 7).ToLower()
    }
    else {
        if (-not $version) { $version = '0.0.0' }
        $id = (Get-FileHash $dll.FullName -Algorithm SHA256).Hash.Substring(0, 7).ToLower()
    }
    [pscustomobject]@{
        Path    = $dll.FullName
        Dir     = $dll.DirectoryName
        Version = $version
        Id      = $id
        Stamp   = $dll.LastWriteTime
        IsDebug = ($dll.FullName -match '\\[Dd]ebug\\')
    }
}

function Find-NewestDll([string]$modDir, [string]$assemblyName) {
    Get-ChildItem -Path $modDir -Recurse -Filter "$assemblyName.dll" -File -ErrorAction SilentlyContinue |
        Where-Object { $_.FullName -notmatch '\\(obj|artifacts|dist|packages|node_modules|\.git)\\' } |
        Sort-Object LastWriteTime -Descending | Select-Object -First 1
}

# Vorhandenes, selbst gebautes Release-Zip des Mods (nur wenn Version passt).
function Find-ReleaseZip([string]$modDir, [string]$version, [string[]]$preferredPrefixes) {
    $dirs = @($modDir, (Join-Path $modDir 'artifacts'), (Join-Path $modDir 'dist')) | Where-Object { Test-Path $_ }
    $zips = @(foreach ($d in $dirs) { Get-ChildItem $d -Filter *.zip -File -ErrorAction SilentlyContinue })
    $zips = @($zips | Where-Object { $_.Name -match [regex]::Escape($version) })
    if (-not $zips) { return $null }
    foreach ($p in $preferredPrefixes) {
        $hit = $zips | Where-Object { $_.BaseName -like "$p-*" } |
            Sort-Object LastWriteTime -Descending | Select-Object -First 1
        if ($hit) { return $hit }
    }
    return ($zips | Sort-Object LastWriteTime -Descending | Select-Object -First 1)
}

# Plugin-GUID-Kandidaten eines Mods: BepInPlugin-Literale aus dem Quellcode
# plus konstruierte Fallbacks (com.maschine.<ordnername>, com.<prefix>.<name>
# fuer Assemblies wie "Anvil-WebOverlay").
function Get-ModGuidCandidates([string]$modDir, [string]$modName) {
    $guids = [System.Collections.Generic.HashSet[string]]::new()
    $csFiles = @(Get-ChildItem $modDir -Recurse -Filter *.cs -File -ErrorAction SilentlyContinue |
        Where-Object { $_.FullName -notmatch '\\(bin|obj|artifacts|dist|packages|node_modules|\.git)\\' })
    if ($csFiles) {
        foreach ($hit in ($csFiles | Select-String -Pattern '\[BepInPlugin\(\s*"(com\.[^"]+)"' -AllMatches)) {
            foreach ($mm in $hit.Matches) { [void]$guids.Add($mm.Groups[1].Value.ToLower()) }
        }
    }
    [void]$guids.Add("com.maschine.$($modName.ToLower())")
    foreach ($proj in @(Get-ChildItem $modDir -Recurse -Depth 3 -Filter *.csproj -File -ErrorAction SilentlyContinue |
        Where-Object { $_.FullName -notmatch '\\(bin|obj|artifacts|dist|packages|node_modules|\.git)\\' })) {
        $praw = Get-Content $proj.FullName -Raw
        if ($praw -match '<AssemblyName>([^<]+)</AssemblyName>') {
            $an = $Matches[1].Trim()
            if ($an -match '^([A-Za-z0-9]+)-(.+)$' -and $Matches[1].ToLower() -ne 'maschine') {
                [void]$guids.Add(("com.{0}.{1}" -f $Matches[1], ($Matches[2] -replace '[^A-Za-z0-9]', '')).ToLower())
            }
        }
    }
    return $guids
}

# Fragt die Forge-API, welche der Kandidaten-GUIDs veroeffentlicht sind.
# Erfolg -> Cache aktualisieren; Fehler -> Cache verwenden; sonst Abbruch.
function Get-ForgePublishedGuids([string[]]$candidates, [string]$cachePath) {
    $found = [System.Collections.Generic.List[string]]::new()
    $ua = 'BetaHubGenerator/1.0 (+https://github.com/maschine34675/spt-beta-hub)'
    try {
        $url = 'https://sp-mod.com/api/v0/mods?per_page=100&fields=guid&filter[guid]=' +
            [uri]::EscapeDataString(($candidates -join ','))
        while ($url) {
            $resp = Invoke-RestMethod -Uri $url -UserAgent $ua -TimeoutSec 60
            foreach ($m in $resp.data) { $found.Add(([string]$m.guid).ToLower()) }
            $url = $resp.links.next
        }
        @{ fetchedAt = (Get-Date).ToString('o'); publishedGuids = @($found) } |
            ConvertTo-Json | Set-Content $cachePath -Encoding utf8NoBOM
        return @{ Guids = @($found); Source = 'Forge-API (live)' }
    }
    catch {
        if (Test-Path $cachePath) {
            $cache = Get-Content $cachePath -Raw | ConvertFrom-Json
            Warn "Forge-API nicht erreichbar ($($_.Exception.Message)) – verwende Cache vom $($cache.fetchedAt)"
            return @{ Guids = @($cache.publishedGuids); Source = "Cache vom $($cache.fetchedAt)" }
        }
        throw "Forge-API nicht erreichbar und kein Cache (forge-published.json) vorhanden – Abbruch, damit keine veroeffentlichten Mods gelistet werden. ($($_.Exception.Message))"
    }
}

# ---------------------------------------------------------------- Vorbereitung
$downloadsDir = Join-Path $HubRoot 'downloads'
$assetsRoot   = Join-Path $HubRoot 'assets'
New-Item -ItemType Directory -Force $downloadsDir | Out-Null
if (Test-Path $assetsRoot) { Remove-Item $assetsRoot -Recurse -Force }
New-Item -ItemType Directory -Force $assetsRoot | Out-Null

# Download-Basis: Raw-URL, sobald ein GitHub-Remote existiert (direkter Download).
$rawBase = $null
$originUrl = git -C $HubRoot remote get-url origin 2>$null
if ($LASTEXITCODE -eq 0 -and $originUrl -match 'github\.com[:/](?<o>[^/]+)/(?<r>[^/.]+?)(\.git)?$') {
    $rawBase = "https://github.com/$($Matches['o'])/$($Matches['r'])/raw/$Branch"
}

# Projekte, die nie mit ausgeliefert werden.
$SkipProjectPattern = '(?i)(\.|^)(Tests?|DevTool|DebugServer|WebViewProbe|Demo)$'

# ---------------------------------------------------------------- Mods einsammeln
$built     = [System.Collections.Generic.List[object]]::new()
$unbuilt   = [System.Collections.Generic.List[object]]::new()
$published = [System.Collections.Generic.List[string]]::new()

$modDirs = Get-ChildItem $DevRoot -Directory | Where-Object { $_.Name -notmatch '^[_.]' } | Sort-Object Name

# ---- Forge-Abgleich: welche Mods sind bereits veroeffentlicht?
$modGuids = @{}
$allCandidates = [System.Collections.Generic.HashSet[string]]::new()
foreach ($dir in $modDirs) {
    $g = Get-ModGuidCandidates $dir.FullName $dir.Name
    $modGuids[$dir.Name] = $g
    foreach ($x in $g) { [void]$allCandidates.Add($x) }
}
$forge = Get-ForgePublishedGuids @($allCandidates) (Join-Path $HubRoot 'forge-published.json')
Write-Host "Forge-Abgleich ($($forge.Source)): $($forge.Guids.Count) GUIDs als veroeffentlicht erkannt"

foreach ($dir in $modDirs) {
    $modName = $dir.Name
    $modDir  = $dir.FullName
    $csprojs = @(Get-ChildItem $modDir -Recurse -Depth 3 -Filter *.csproj -File -ErrorAction SilentlyContinue |
        Where-Object { $_.FullName -notmatch '\\(obj|bin|artifacts|dist|packages|node_modules|\.git)\\' })
    if (-not $csprojs) { continue }

    $enabledCfg = Cfg $modName 'enabled'
    if ($enabledCfg -eq $false) { Write-Host "  $modName : per mods.json deaktiviert"; continue }
    if ($enabledCfg -ne $true) {
        $pubHit = @($modGuids[$modName] | Where-Object { $_ -in $forge.Guids })
        if ($pubHit.Count) { $published.Add("$modName ($($pubHit[0]))"); continue }
    }

    # ---- Projekte klassifizieren
    $parts = [System.Collections.Generic.List[object]]::new()
    foreach ($cs in $csprojs) {
        $base = [IO.Path]::GetFileNameWithoutExtension($cs.Name)
        if ($base -match $SkipProjectPattern) { continue }
        $raw = Get-Content $cs.FullName -Raw
        if ($raw -match '<OutputType>\s*(Win)?Exe') { continue }

        $an = $null
        if ($raw -match '<AssemblyName>([^<]+)</AssemblyName>') { $an = $Matches[1].Trim() }
        if (-not $an) { $an = $base }
        $an = $an -replace '\$\((MSBuild)?ProjectName\)', $base

        $kind =
            if ($raw -match 'SPTarkov\.Server') { 'server' }
            elseif ($raw -match 'BepInEx|Assembly-CSharp|spt-reflection|spt-common|spt-core|EscapeFromTarkov_Data') { 'client' }
            else { $null }
        if (-not $kind) { Warn "$modName : Projekt '$($cs.Name)' nicht klassifizierbar – uebersprungen"; continue }

        $csVer = $null
        if ($raw -match '<Version>\s*([0-9][^<]*?)\s*</Version>') { $csVer = $Matches[1] }
        elseif ($raw -match '<AssemblyVersion>\s*([0-9][^<]*?)\s*</AssemblyVersion>') { $csVer = $Matches[1] }

        $dllFile = Find-NewestDll $modDir $an
        $dll = if ($dllFile) { Get-DllInfo $dllFile } else { $null }
        if (-not $dll) { Warn "$modName : kein Build fuer Projekt '$($cs.Name)' ($an.dll) gefunden" }
        elseif ($csVer -and -not $dll.Version.StartsWith(($csVer -split '\.')[0..2] -join '.')) {
            Warn "$modName : Quellcode-Version $csVer, gebaute DLL ist $($dll.Version) – neu bauen?"
        }

        $parts.Add([pscustomobject]@{
            Kind         = $kind
            AssemblyName = $an
            ProjectDir   = $cs.DirectoryName
            Dll          = $dll
        })
    }
    if (-not $parts.Count) { continue }

    # ---- README + Beschreibung
    $readme = Read-ModReadme $modDir $modName
    $desc = Cfg $modName 'description'
    if (-not $desc -and $readme) { $desc = $readme.Para }

    $clientParts = @($parts | Where-Object { $_.Kind -eq 'client' -and $_.Dll })
    $serverParts = @($parts | Where-Object { $_.Kind -eq 'server' -and $_.Dll })
    $typParts = @()
    if (@($parts | Where-Object Kind -eq 'client').Count) { $typParts += 'Client' }
    if (@($parts | Where-Object Kind -eq 'server').Count) { $typParts += 'Server' }
    $typ = $typParts -join ' + '

    # ---- kein Build vorhanden -> "in Entwicklung"
    if (-not $clientParts.Count -and -not $serverParts.Count) {
        $unbuilt.Add([pscustomobject]@{ Name = $modName; Typ = $typ; Desc = $desc })
        continue
    }
    if ((@($parts | Where-Object { -not $_.Dll }).Count) -gt 0) {
        Warn "$modName : nur teilweise gebaut – Paket enthaelt nur die gebauten Teile!"
    }

    $primary = if ($clientParts.Count) { $clientParts[0].Dll } else { $serverParts[0].Dll }
    $version = $primary.Version
    $allDlls = @($clientParts + $serverParts | ForEach-Object Dll)
    $stamp   = ($allDlls | Sort-Object Stamp -Descending | Select-Object -First 1).Stamp
    $isDebug = [bool]($allDlls | Where-Object IsDebug)

    # ---- Paket bauen (Regel 1: vorhandenes Release-Zip; Regel 2: selbst packen)
    $prefixes = @()
    if ($clientParts.Count) { $prefixes += $clientParts[0].AssemblyName }
    $prefixes += "maschine-$modName", $modName
    $relZip = Find-ReleaseZip $modDir $version $prefixes

    $zipName = $null; $pkgNote = $null
    if ($relZip) {
        $id = (Get-FileHash $relZip.FullName -Algorithm SHA256).Hash.Substring(0, 7).ToLower()
        $zipName = "$modName-$version-$id.zip"
        $zipPath = Join-Path $downloadsDir $zipName
        if (-not (Test-Path $zipPath)) { Copy-Item $relZip.FullName $zipPath }
        $stamp = $relZip.LastWriteTime
        $isDebug = $false
        $pkgNote = "vorhandenes Release-Zip '$($relZip.Name)' uebernommen"
        $newest = ($allDlls | Sort-Object Stamp -Descending | Select-Object -First 1)
        if ($newest.Stamp -gt $relZip.LastWriteTime.AddMinutes(5)) {
            Warn "$modName : neuester DLL-Build ($($newest.Stamp.ToString('yyyy-MM-dd HH:mm'))) ist neuer als das Release-Zip ($($relZip.LastWriteTime.ToString('yyyy-MM-dd HH:mm'))) – ggf. Release neu bauen"
        }
    }
    else {
        $id = $primary.Id
        $zipName = "$modName-$version-$id.zip"
        $zipPath = Join-Path $downloadsDir $zipName
        if (-not (Test-Path $zipPath)) {
            $staging = Join-Path ([IO.Path]::GetTempPath()) ("betahub-" + [guid]::NewGuid().ToString('N'))
            New-Item -ItemType Directory -Path $staging | Out-Null
            try {
                foreach ($p in $clientParts) {
                    $pl = Join-Path $staging 'BepInEx\plugins'
                    New-Item -ItemType Directory -Force $pl | Out-Null
                    Copy-Item $p.Dll.Path (Join-Path $pl "$($p.AssemblyName).dll")
                }
                foreach ($p in $serverParts) {
                    $sv = Join-Path $staging "SPT_Runtime\user\mods\$modName"
                    New-Item -ItemType Directory -Force $sv | Out-Null
                    Copy-Item (Join-Path $p.Dll.Dir '*') $sv -Recurse -Force
                    Get-ChildItem $sv -Recurse -Filter *.pdb -File | Remove-Item -Force
                    # Content-Ordner aus dem Projektordner nachziehen, falls nicht im Build-Output
                    foreach ($content in 'db', 'config', 'Config') {
                        $src = Join-Path $p.ProjectDir $content
                        $dst = Join-Path $sv $content
                        if ((Test-Path $src) -and -not (Test-Path $dst)) { Copy-Item $src $dst -Recurse }
                    }
                }
                Compress-Archive -Path (Join-Path $staging '*') -DestinationPath $zipPath -Force
            }
            finally { Remove-Item $staging -Recurse -Force -ErrorAction SilentlyContinue }
        }
        $pkgNote = 'aus Build-Output gepackt'
    }
    # alte Zips desselben Mods entfernen (nur die aktuelle Kennung bleibt)
    Get-ChildItem $downloadsDir -Filter "$modName-*.zip" -File |
        Where-Object Name -ne $zipName | Remove-Item -Force

    # ---- Screenshots / Medien
    $imgExt = '\.(png|jpe?g|gif|webp)$'
    $vidExt = '\.(mp4|webm)$'
    $shotCfg = Cfg $modName 'screenshots'
    $mediaFiles = @()
    if ($shotCfg) {
        foreach ($rel in $shotCfg) {
            $pp = Join-Path $modDir $rel
            if (Test-Path $pp) { $mediaFiles += Get-Item $pp }
            else { Warn "$modName : Screenshot '$rel' aus mods.json nicht gefunden" }
        }
    }
    else {
        $mediaFiles = @(Get-ChildItem $modDir -File -ErrorAction SilentlyContinue |
            Where-Object { $_.Name -match "$imgExt|$vidExt" })
        $ss = Join-Path $modDir 'screenshots'
        if (Test-Path $ss) {
            $mediaFiles += Get-ChildItem $ss -Recurse -File | Where-Object { $_.Name -match "$imgExt|$vidExt" }
        }
    }
    $images = @(); $videos = @()
    if ($mediaFiles.Count) {
        $assetDir = Join-Path $assetsRoot $modName
        New-Item -ItemType Directory -Force $assetDir | Out-Null
        foreach ($f in $mediaFiles) {
            Copy-Item $f.FullName (Join-Path $assetDir $f.Name) -Force
            $rel = "assets/$modName/$($f.Name)"
            if ($f.Name -match $imgExt) { $images += $rel } else { $videos += $rel }
        }
    }

    # Relative Medien-Links im README-Body auf assets/ umbiegen
    $body = if ($readme) { $readme.Body } else { $null }
    if ($body -and $mediaFiles.Count) {
        foreach ($f in $mediaFiles) {
            $esc = [regex]::Escape($f.Name)
            $body = $body -replace "\((?:\./)?(?:[\w.-]+/)*$esc\)", "(assets/$modName/$($f.Name))"
            $body = $body -replace "src=`"(?:\./)?(?:[\w.-]+/)*$esc`"", "src=`"assets/$modName/$($f.Name)`""
        }
    }

    $built.Add([pscustomobject]@{
        Name    = $modName
        Typ     = $typ
        Version = $version
        Id      = $id
        Stamp   = $stamp
        IsDebug = $isDebug
        Desc    = $desc
        Notes   = (Cfg $modName 'notes')
        Body    = $body
        Images  = $images
        Videos  = $videos
        Zip     = $zipName
        PkgNote = $pkgNote
        Parts   = @($clientParts + $serverParts)
    })
    Write-Host ("  {0,-28} {1}+{2}  ({3})" -f $modName, $version, $id, $pkgNote)
}

# ---------------------------------------------------------------- README schreiben
function DownloadUrl([string]$zipName) {
    if ($rawBase) { return "$rawBase/downloads/$zipName" }
    return "downloads/$zipName"
}

$md = [System.Collections.Generic.List[string]]::new()
$now = Get-Date -Format 'yyyy-MM-dd HH:mm'
$md.Add('# SPT 4.1 – Beta Mods')
$md.Add('')
$md.Add("Overview of all mods in beta testing · Last updated: **$now** · $($built.Count) mods with download, $($unbuilt.Count) in development.")
$md.Add('')
$md.Add('This page only lists mods that are **not (yet) released on [Forge](https://sp-mod.com/)** — released mods get their updates there.')
$md.Add('')
$md.Add('**Installation:** Grab the ZIP via the download link and extract it into the SPT root folder')
$md.Add('(the folder containing `EscapeFromTarkov.exe`), overwriting existing files.')
$md.Add('The ZIPs contain the correct folder structure: client mods go to `BepInEx\plugins\`,')
$md.Add('server mods to `SPT_Runtime\user\mods\`. For **Client + Server** mods both parts are in the ZIP')
$md.Add('and both must be installed.')
$md.Add('')
$md.Add('**Build ID:** Dev builds do not always get a new version number – the unique identifier is')
$md.Add('the part after the `+` (commit ID or file hash), e.g. `1.2.0+7b65898`.')
$md.Add('Please always include it when reporting issues.')
$md.Add('')
$md.Add('| Mod | Version | Updated | Type | Description | Preview | Download |')
$md.Add('|---|---|---|---|---|---|---|')
foreach ($m in $built) {
    $anchor = $m.Name.ToLower()
    $ver = "``$($m.Version)+$($m.Id)``" + $(if ($m.IsDebug) { ' ⚠️Debug' } else { '' })
    $preview = if ($m.Images.Count) { "<a href=`"#$anchor`"><img src=`"$($m.Images[0])`" height=`"60`"></a>" } else { '–' }
    $descCell = TableCell (Trunc $m.Desc 170)
    if ($descCell -eq '–') { $descCell = '_(description to follow)_' }
    $md.Add("| [**$($m.Name)**](#$anchor) | $ver | $($m.Stamp.ToString('yyyy-MM-dd')) | $($m.Typ) | $descCell | $preview | [⬇ ZIP]($(DownloadUrl $m.Zip)) |")
}
$md.Add('')

if ($unbuilt.Count) {
    $md.Add('## 🚧 In development – no build yet')
    $md.Add('')
    $md.Add('| Mod | Type | Description |')
    $md.Add('|---|---|---|')
    foreach ($u in $unbuilt) {
        $d = TableCell (Trunc $u.Desc 170)
        $md.Add("| **$($u.Name)** | $($u.Typ) | $d |")
    }
    $md.Add('')
}

$md.Add('---')
$md.Add('')
foreach ($m in $built) {
    $md.Add("## $($m.Name)")
    $md.Add('')
    $dbg = if ($m.IsDebug) { ' · ⚠️ Debug build' } else { '' }
    $md.Add("**Type:** $($m.Typ) · **Version:** ``$($m.Version)+$($m.Id)`` · **Updated:** $($m.Stamp.ToString('yyyy-MM-dd HH:mm'))$dbg · [⬇ Download]($(DownloadUrl $m.Zip))")
    $md.Add('')
    if ($m.Parts.Count -gt 1) {
        $partLine = ($m.Parts | ForEach-Object {
            "$(if ($_.Kind -eq 'client') { 'Client' } else { 'Server' }) ``$($_.Dll.Version)+$($_.Dll.Id)``"
        }) -join ' · '
        $md.Add("**Components:** $partLine")
        $md.Add('')
    }
    if ($m.Notes) {
        $md.Add("> **Tester note:** $($m.Notes)")
        $md.Add('')
    }
    if ($m.Images.Count) {
        $shown = $m.Images | Select-Object -First 4
        $md.Add(($shown | ForEach-Object { "<img src=`"$_`" width=`"440`">" }) -join ' ')
        $md.Add('')
    }
    foreach ($v in $m.Videos) {
        $md.Add("🎬 [Demo video]($v)")
        $md.Add('')
    }
    if ($m.Body) {
        $md.Add('<details><summary><b>Show usage notes</b></summary>')
        $md.Add('')
        $md.Add($m.Body)
        $md.Add('')
        $md.Add('</details>')
    }
    else {
        $md.Add('_No detailed description yet._')
    }
    $md.Add('')
    $md.Add('---')
    $md.Add('')
}
$md.Add('_This page is generated automatically (`tools/Generate-BetaHub.ps1`) – make changes there or in `mods.json`, not here._')

Set-Content -Path (Join-Path $HubRoot 'README.md') -Value ($md -join "`n") -Encoding utf8NoBOM

# Pakete entfernen, die zu keiner (mehr) gelisteten Mod gehoeren
$validZips = @($built | ForEach-Object Zip)
Get-ChildItem $downloadsDir -Filter *.zip -File | Where-Object { $_.Name -notin $validZips } |
    ForEach-Object { Write-Host "  entferne nicht mehr gelistetes Paket: $($_.Name)"; Remove-Item $_.FullName -Force }

# ---------------------------------------------------------------- Abschluss
Write-Host ''
Write-Host "Fertig: $($built.Count) Mods paketiert, $($unbuilt.Count) ohne Build." -ForegroundColor Green
if ($published.Count) {
    Write-Host "Auf Forge veroeffentlicht, daher nicht gelistet ($($published.Count)):" -ForegroundColor Cyan
    $published | ForEach-Object { Write-Host "  - $_" }
}
if ($warnings.Count) {
    Write-Host "$($warnings.Count) Warnung(en) – siehe oben." -ForegroundColor Yellow
}

if ($Push) {
    Push-Location $HubRoot
    try {
        git add -A
        $status = git status --porcelain
        if ($status) {
            git commit -m "Beta-Hub Update $now" | Out-Host
            git push origin $Branch | Out-Host
        }
        else {
            Write-Host 'Keine Änderungen – nichts zu pushen.'
        }
    }
    finally { Pop-Location }
}
