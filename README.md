# SPT 4.1 – Beta Mods

Overview of all mods in beta testing · Last updated: **2026-09-18 11:35** · 8 mods with download, 3 in development.

This page only lists mods that are **not (yet) released on [Forge](https://sp-mod.com/)** — released mods get their updates there.

**Installation:** Grab the ZIP via the download link and extract it into the SPT root folder
(the folder containing `EscapeFromTarkov.exe`), overwriting existing files.
The ZIPs contain the correct folder structure: client mods go to `BepInEx\plugins\`,
server mods to `SPT_Runtime\user\mods\`. For **Client + Server** mods both parts are in the ZIP
and both must be installed.

**Build ID:** Dev builds do not always get a new version number – the unique identifier is
the part after the `+` (commit ID or file hash), e.g. `1.2.0+7b65898`.
Please always include it when reporting issues.

| Mod | Version | Updated | Type | Description | Preview | Download |
|---|---|---|---|---|---|---|
| [**BangAndClear**](#bangandclear) | `0.9.2+9882bbc` | 2026-08-26 | Client | An SPT 4.0 client mod for tactical door work: crack a door open a few degrees, put a grenade through the gap, close the door, wait for the bang. | – | [⬇ ZIP](https://github.com/maschine34675/spt-beta-hub/raw/main/downloads/BangAndClear-0.9.2-9882bbc.zip) |
| [**BtrTurretControl**](#btrturretcontrol) | `1.0.0+37e08ef` | 2026-08-14 | Client | Client-only SPT mod that lets a seated BTR passenger take direct control of the gun turret. | – | [⬇ ZIP](https://github.com/maschine34675/spt-beta-hub/raw/main/downloads/BtrTurretControl-1.0.0-37e08ef.zip) |
| [**ClusterGrenade**](#clustergrenade) | `2.6.0+c0f3830` | 2026-08-20 | Client + Server | Cluster grenade for SPT: instead of shrapnel, the explosion releases several impact bomblets. Also adds a 40mm cluster round and HE ammunition<br><sub>🔌 requires <a href="https://sp-mod.com/mod/2310/wtt-commonlib">WTT - CommonLib</a></sub> | – | [⬇ ZIP](https://github.com/maschine34675/spt-beta-hub/raw/main/downloads/ClusterGrenade-2.6.0-c0f3830.zip) |
| [**DoorDash**](#doordash) | `1.2.0+9735133` | 2026-09-12 | Client | > Blow open doors without stopping. | – | [⬇ ZIP](https://github.com/maschine34675/spt-beta-hub/raw/main/downloads/DoorDash-1.2.0-9735133.zip) |
| [**KillAndDamageInfo**](#killanddamageinfo) | `1.0.0+b0ab19c` | 2026-08-24 | Client | KillAndDamageInfo shows the combat information the game keeps to itself: what your kills died to, who killed you and in what state they were, what each hit actually did… | – | [⬇ ZIP](https://github.com/maschine34675/spt-beta-hub/raw/main/downloads/KillAndDamageInfo-1.0.0-b0ab19c.zip) |
| [**LootOutline**](#lootoutline) | `0.1.0+b66c9b5` | 2026-09-08 | Client | Weiße Konturen um Gegenstände, die in Tarkov auf dem Boden liegen — die Optik, die man aus PUBG oder Arena Breakout kennt. Für SPT 4.1. | – | [⬇ ZIP](https://github.com/maschine34675/spt-beta-hub/raw/main/downloads/LootOutline-0.1.0-b66c9b5.zip) |
| [**ModSourceDebugger**](#modsourcedebugger) | `2.0.0+7371199` | 2026-08-15 | Client + Server | Debugging tool: traces item templates and UI elements back to the mod that added them (tooltips + UI inspector). | – | [⬇ ZIP](https://github.com/maschine34675/spt-beta-hub/raw/main/downloads/ModSourceDebugger-2.0.0-7371199.zip) |
| [**SurroundAudio**](#surroundaudio) | `1.0.0+f693bc7` | 2026-08-23 | Client | Replaces Tarkov's binaural (headphone) audio with real 5.1/7.1 output, so you can play on a surround speaker system instead of headphones. | – | [⬇ ZIP](https://github.com/maschine34675/spt-beta-hub/raw/main/downloads/SurroundAudio-1.0.0-f693bc7.zip) |

## 🚧 In development – no build yet

| Mod | Type | Description |
|---|---|---|
| **AdaptiveArsenal** | Server | Adaptive Arsenal is an SPT 4.0 C# server mod prototype that tracks equipment usage after raids. |
| **AiStoryQuests** | Client + Server | Experiment: AI-generated story quests (providers: OpenAI/Anthropic/Ollama, own API key required). |
| **AutoWishlist** | Client + Server | – |

---

## BangAndClear

**Type:** Client · **Version:** `0.9.2+9882bbc` · **Updated:** 2026-08-26 22:13 · [⬇ Download](https://github.com/maschine34675/spt-beta-hub/raw/main/downloads/BangAndClear-0.9.2-9882bbc.zip)

<details><summary><b>Show usage notes</b></summary>

An SPT 4.0 client mod for tactical door work: crack a door open a few degrees, put a grenade
through the gap, close the door, wait for the bang.

No new animations - EFT doors rotate procedurally, so the crack reuses the vanilla door curve
and hand animation, and the throw is the vanilla underhand toss.

#### Door actions

- **Bang & clear** - the full maneuver as one action: cracks the door (if it isn't already),
  pulls up your top-priority grenade, aims at the gap, underhand-throws it through and closes
  the door again. Replaces the permanently disabled "Bang & clear" stub BSG left in the menu.
  Greyed out when you carry no grenade.
- **Crack Open** - just open the door ~15° and leave it. For AI and game logic the door still
  counts as closed. Throw manually, peek, listen.
- **Close Crack** - close a cracked door (full open also works from the cracked state).

#### Config (F12)

| Setting | Default | Description |
|---|---|---|
| Enabled | true | Add the actions to door menus. |
| CrackAngleDegrees | 15 | How far the door swings open when cracked. |
| CrackSpeed | 1.0 | Speed multiplier for the crack movement. |
| SqueakVolume | 0.35 | Volume of the squeak while cracking. |
| AutoCloseDoor | true | Bang & clear closes the door after the throw. |
| CloseDelaySeconds | 0.5 | Delay between the grenade leaving the hand and the door closing. |
| IgnoreDoorCollision | true | The scripted throw can't bounce back off the door leaf (frame/walls still block). |
| GuidedThrow | true | Redirect the toss through the gap regardless of standing position (speed kept, direction corrected). |
| AimSpeedDegPerSec | 360 | Turn speed of the scripted aim toward the gap. |
| AimHeightMeters | 0.9 | Aim height above your feet; lower rolls, higher tosses. |

#### Notes & compatibility

- Cracked doors keep `EDoorState.Shut`, so bots treat them as closed and will open them
  normally when pathing through - no bots bumping into half-open doors.
- The door's occlusion portal is kept open while cracked so the room behind the gap renders.
- Locked doors, sliding doors, keycard doors and exfil doors are excluded.
- Bang & clear uses the regular grenade hands controller (the vanilla quick-throw controller
  only supports the overhand toss), so the character really draws the grenade, underhand-throws
  it and returns to the weapon - all vanilla animations and voice lines.
- A grenade already held in the hands is used directly - even with the pin pulled for an
  overhand throw (the toss then goes overhand instead of underhand).
- Otherwise the grenade is picked like vanilla quick throw: quickslot priority grenade first,
  then the grenade slots.
- The door close is anchored to the moment the grenade actually leaves the hand, plus
  CloseDelaySeconds.
- Breaching a cracked door snaps it shut for a frame before the kick (vanilla kick curve
  starts at the closed angle) - cosmetic only.
- SPT single player only for now. In Fika co-op the crack angle is not synced to other clients.

#### Install

Drop `maschine-BangAndClear.dll` into `BepInEx/plugins/`.

</details>

---

## BtrTurretControl

**Type:** Client · **Version:** `1.0.0+37e08ef` · **Updated:** 2026-08-14 17:24 · [⬇ Download](https://github.com/maschine34675/spt-beta-hub/raw/main/downloads/BtrTurretControl-1.0.0-37e08ef.zip)

> **Tester note:** You still have to pay for the taxi service to not get thrown out on departure

<details><summary><b>Show usage notes</b></summary>

Client-only SPT mod that lets a seated BTR passenger take direct control of the gun turret.

#### Current state (v0.1.2 skeleton)

- Toggle turret mode with `F` (configurable) while `Inside` the BTR
- Scroll-wheel interaction entry: `BTR Turret: Operate` / `BTR Turret: Exit`
- Mouse aim drives `BTRTurretServer.targetPosition`
- Left mouse button fires through the existing `shooterBTR` gunner bot
- Main FPS camera is temporarily mounted to `machineGunLaunchPoint`
- Debug spawn: skips the vanilla 5-10 minute BTR timer and starts the route from the real enter point
- Manual debug hotkey: `F7` forces spawn if the BTR is not active yet

The BTR depot is intentionally off-map at roughly `(1000, 0, 1000)`. That is only a staging area. When spawn works correctly, `MoveEnable()` teleports the vehicle to the configured route enter point (for example `p7` on Streets) and the client view is synced there.

#### Build

```powershell
dotnet build BtrTurretControl.csproj -c Release
```

The DLL is copied to `BepInEx\plugins\` automatically.

#### Config

`BepInEx\config\com.maschine.BtrTurretControl.cfg`

- `ToggleTurretKey` (default `F`)
- `MouseSensitivity`
- `AllowFireWhileMoving` (default `false`)
- `InstantSpawnOnRaidStart` (default `true`, disable for normal BTR timing)
- `ForceSpawnBtrKey` (default `F7`)
- `MinBootstrapWaitSeconds` (default `3`)
- `FallbackSpawnAfterSeconds` (default `8`)
- `LogSpawnDiagnostics` (default `true`)

#### Known limitations

- Turret mode auto-exits while the BTR is driving unless `AllowFireWhileMoving` is enabled
- Interaction label is hardcoded English (no locale entry yet)
- Camera restore may need more work with third-person / optic states
- Friendly-fire / betrayal rules are unchanged

#### Next steps

- HUD crosshair overlay for turret view
- Hold turret mode across short BTR pauses at destinations
- Optional localization key for the interaction prompt

</details>

---

## ClusterGrenade

**Type:** Client + Server · **Version:** `2.6.0+c0f3830` · **Updated:** 2026-08-20 12:00 · [⬇ Download](https://github.com/maschine34675/spt-beta-hub/raw/main/downloads/ClusterGrenade-2.6.0-c0f3830.zip)

> 🔌 **Requires:** [WTT - CommonLib](https://sp-mod.com/mod/2310/wtt-commonlib) — install separately, not included in the ZIP.

**Components:** Client `2.6.0+c0f3830` · Server `2.6.0+c0f3830`

<details><summary><b>Show usage notes</b></summary>

### ClusterGrenade Mod

Cluster grenade for SPT: instead of shrapnel, the explosion releases several impact-fuzed bomblets (frag or flash, weighted mix). There is also a 40x46mm cluster round for grenade launchers (MSGL, M203, FN40GL). The former airburst round has moved into its own mod, **Airburst**.

#### Components

| Part | Path |
|------|------|
| Client mod (BepInEx) | `ClusterGrenade.Client/` |
| Server mod (SPT + WTT) | `ClusterGrenade.Server/` |
| Server item | `SPT_Runtime/user/mods/ClusterGrenade/db/CustomItems/ClusterGrenade.json` |

**Item ID:** `67d4f0c8a1b2e30123456789`

#### How WTT-ServerCommonLib + JSON fit together

**WTT-ServerCommonLib is a library, not an auto-loader.** It does not scan all `user/mods/*/db/CustomItems/` folders.

| Component | Role |
|------------|--------|
| `WTT-ServerCommonLib.dll` | Shared library (API for loading items/locales/loot) |
| `WTT-PackNStrap.dll` | **Content mod** — calls `CreateCustomItems()` on startup and reads JSON **only** from its own mod folder |
| `db/CustomItems/*.json` | Data — only loaded if **your** server DLL reads it |

That is why the JSON works in `WTT-PackNStrap/db/CustomItems/` (where `WTT-PackNStrap.dll` lives), but not on its own in `ClusterGrenade/` without a server DLL.

#### Installation

##### 1. Server mod

The folder `SPT_Runtime/user/mods/ClusterGrenade/` needs **both**:

```
ClusterGrenade/
├── maschine-ClusterGrenade.Server.dll    ← loads the JSON
└── db/CustomItems/
    └── ClusterGrenade.json
```

**Prerequisite:** [WTT-ServerCommonLib](https://github.com/WelcomeToTarkov/WTT-CommonLib) must be installed (`com.wtt.commonlib`).

Build both projects (without touching the live SPT install):

```powershell
cd C:\SPT\Development\ClusterGrenade
dotnet build .\ClusterGrenade.slnx -c Release
```

The outputs then live under `ClusterGrenade.Client/bin/Release/` and
`ClusterGrenade.Server/bin/Release/`. To deliberately build and install both
components:

```powershell
dotnet build .\ClusterGrenade.slnx -c Release -p:DeployToSpt=true -p:SptRoot=C:\SPT
```

This copies `maschine-ClusterGrenade.Client.dll` to `BepInEx/plugins/` and
`maschine-ClusterGrenade.Server.dll` plus the item JSON to
`SPT_Runtime/user/mods/ClusterGrenade/`.

##### 2. Testing

1. Restart the SPT server
2. Start the game
3. Buy the cluster grenade from Skier (LL2, ~18,500 ₽) or spawn it via give-ui
4. Throw it and watch: on detonation, sub-grenades (RGO with impact fuze) fly in all directions

#### Configuration

`BepInEx/config/com.maschine.ClusterGrenade.cfg`

| Setting | Default | Description |
|-------------|----------|--------------|
| `Enabled` | `true` | Mod on/off |
| `ClusterGrenadeTemplateId` | `67d4f0c8a1b2e30123456789` | Must match the server item ID |
| `SubGrenadeCount` | `8` | Number of sub-grenades (1–24) |
| `ScatterForce` | `6` | Scatter impulse |
| `UpwardForce` | `3` | Upward impulse |

##### Bomblet selection

Each sub-grenade is rolled individually at throw time using the current weights (no restart needed, adjustable live in the BepInEx F12 menu under the "Bomblets" section):

| Setting | Default | Description |
|-------------|----------|--------------|
| `FragBombletTemplateId` | `67d4f0c8a1b2e3012345678c` | Frag bomblet (impact fuze, shrapnel damage) |
| `FlashBombletTemplateId` | `67d4f0c8a1b2e3012345678d` | Flash bomblet (impact fuze, blinds/stuns, no damage) |
| `FragBombletWeight` | `70` | Relative weight (0–100) for frag bomblets |
| `FlashBombletWeight` | `30` | Relative weight (0–100) for flash bomblets |

A weight of `0` effectively disables a type, `100` makes the selection deterministic.

##### 40mm cluster round

The 40x46mm cluster round (M381 clone, at Skier LL2, ~8,500 ₽) spreads bomblets on impact using the same weights as the hand grenade. It fits all 40x46 launchers (MSGL drum, M203, FN40GL); the GP-25 uses a different caliber (40mmRU) and is not covered.

| Setting | Default | Description |
|-------------|----------|--------------|
| `ClusterShellTemplateId` | `67d4f0c8a1b2e3012345678e` | Must match the server item ID |
| `ShellSubGrenadeCount` | `5` | Number of sub-grenades per 40mm impact (1–24) |

##### Explosive and flash ammunition

For seven common calibers (9x19, 5.45x39, 5.56x45, 7.62x39, 7.62x51, 7.62x54R, 12/70) there is one **explosive round** (HE, red tracer) and one **flash round** (flash, green tracer) each — all at Skier LL2:

- **HE:** Normal bullet plus an explosion on impact (fragments + blast). The fuze only arms after ~7 m of flight — below that you only get the bullet damage.
- **Flash:** Deals no damage at all, but blinds and stuns anyone looking towards the impact (vanilla Zvezda mechanic).

Both are purely server-side (no client logic) and work in any weapon that fires the respective base caliber.

#### Technical notes

- **Server:** The cluster grenade/bomblets are RGD-5 clones, the 40mm round is an M381 clone with `FragmentsCount: 0` and `ExplosionStrength: 0`; WTT's `addCaliberToAllCloneLocations` registers the round in all 40x46 filters
- **Client:** A Harmony postfix on `Grenade.Explosion()` (thrown grenade) or `ClientGameWorld.ShotDelegate()` (40mm impact) spawns sub-grenades via `GrenadeFactory.Create()`

</details>

---

## DoorDash

**Type:** Client · **Version:** `1.2.0+9735133` · **Updated:** 2026-09-12 18:56 · [⬇ Download](https://github.com/maschine34675/spt-beta-hub/raw/main/downloads/DoorDash-1.2.0-9735133.zip)

<details><summary><b>Show usage notes</b></summary>

### DoorDash — SPT 4.1 port

> Blow open doors without stopping.

Sprint into a door and ram it open — no interaction prompt, no stopping. Occasionally the door is
knocked clean off its frame and tumbles through the room as a physics object.

**This is a port of [tarkin](https://sp-mod.com/mod/2214/doordash)'s DoorDash to SPT 4.1.** The
original mod targets SPT 4.0 and does not run on 4.1. All credit for the mod itself goes to tarkin;
this port only updates the renamed game APIs and fixes a handful of pre-existing bugs. Plugin GUID,
config keys, file name and install path are unchanged, so it drops in over an existing install.

- Original mod: https://sp-mod.com/mod/2214/doordash
- Original source: https://github.com/bmpq/spt-doordash
- License: MIT (see `LICENSE`)

---

#### Requirements

- SPT 4.1 with BepInEx
- No other dependencies

#### Installation

Extract into your SPT folder so that the DLL lands in `BepInEx/plugins/tarkin/doordash.dll`.
If you are upgrading from the 4.0 version, this overwrites the old file in place — do not keep both.

#### Configuration

Everything is under `BepInEx/config/com.tarkin.doordash.cfg` and in the F12 menu (most entries are
marked advanced). Existing config files from the 4.0 version keep working; the two entries below are
the only additions.

| Setting | Section | Default | Description |
|---------|---------|---------|-------------|
| `Impact Damage Per Speed` | Physical Door | `8` | Damage a flying door deals per m/s of its speed |
| `Impact Damage Max` | Physical Door | `120` | Upper limit for a single door impact |

#### Compatibility

- **[DualSideDoorBreach](https://github.com/maschine34675/DualSideDoorBreach)** — fully supported.
  That mod hooks DoorDash reflectively to allow sprint rams from both sides of a door; this port
  keeps the exact type, method, parameter and field names it binds to, and keeps the ram committing
  in the same frame as the door query, which its key handling relies on.
- **Fika** — untested and not supported, same as the original. The dislodge roll and the resulting
  door physics are computed independently on each machine, so a knocked-out door will behave
  differently for each player.

---

#### Changes in this port

##### Ported to SPT 4.1

Three renamed game types, nothing else in the mod's API surface moved:
`LayerMaskClass` → `LayersMaskController`, `DamageInfoStruct` → `EFT.Ballistics.DamageInfo`,
`ShotIdStruct` → `EFT.Ballistics.ShotId`. The project now builds against the game's own assemblies
(`netstandard2.1`, direct references) instead of NuGet packages and a `$(SPTPath)` variable.

##### Bugs fixed along the way

- **Dislodged doors no longer break the door for the rest of the raid.** When the physics conversion
  triggered, vanilla's breach was skipped entirely, so the door stayed in an interacting, never-broken
  state: bots refused to path through it and the occlusion portal stayed shut. The door is now marked
  broken and open, as a completed breach would.
- **Doors that cannot be converted are no longer swallowed.** The conversion only works on doors with
  a mesh collider; on any other door the roll used to consume the breach and leave the door shut.
  It now falls through to the normal breach.
- **A flying door no longer instantly kills whoever it touches.** Impact damage was the square of the
  door's speed times 100 — about 10,000 damage at default settings, through any armour. It is now
  linear in speed and capped.
- **Raid end no longer logs `Can't remove LocalPlayer`.** Caused by a `[RequireComponent]` attribute
  that kept Unity from tearing the player component down.
- **Ram detection no longer depends on which way you are facing.** The two probe rays were offset in
  world space, so they collapsed into one whenever the player looked along the world X axis.
- **No more NullReferenceExceptions** from a door without a breach sound, from a physics door that
  failed to initialise, or from a double conversion of the same door.
- Breach-sound material matching is now case-insensitive (the metal-door damage multiplier could
  silently never apply).
- A failing Harmony patch no longer silently disables the whole mod.
- The mod no longer throws on a Fika headless host, which has no local player. (It still does nothing
  useful there — see Compatibility.)

</details>

---

## KillAndDamageInfo

**Type:** Client · **Version:** `1.0.0+b0ab19c` · **Updated:** 2026-08-24 13:56 · [⬇ Download](https://github.com/maschine34675/spt-beta-hub/raw/main/downloads/KillAndDamageInfo-1.0.0-b0ab19c.zip)

<details><summary><b>Show usage notes</b></summary>

KillAndDamageInfo shows the combat information the game keeps to itself: what
your kills died to, who killed you and in what state they were, what each hit
actually did — and a full per-raid statistics window on a hotkey.

#### Features

**Raid-end kill list**

- Every kill entry additionally shows the ammunition used.
- Targets you damaged but did not kill get their own **Damaged** entries with
  total damage, hit count and armor penetrations — so an almost-kill no longer
  looks like a miss.

**Death screen**

- The "killed by" line is extended with the killer's weapon, ammunition and
  distance.
- The killer's **remaining HP** is shown next to their name — see how close
  the fight really was.
- The 3D character model shows **the killer with their equipment** instead of
  your own character, including their level badge (hidden for Scavs, as in the
  vanilla kill list).

**Post-raid treatment screen**

- Body-part damage tooltips additionally show the weapon and the distance of
  the hits.

**Raid analysis overlay** (default key: F10, rebindable)

- **Heatmap** — a body silhouette with color-coded zones showing where you got
  hit and where you hit others, with hit counts and damage per zone.
- **Ammo** — per ammunition type: shots fired, hits, accuracy, armor
  penetration rate, average and total damage.
- **Weapons** — per weapon: shots, hits, accuracy, damage and kills.
- **Distance** — a bar chart of your hits grouped by engagement range.
- **Overview** — totals for both directions, damage your armor absorbed,
  bullets that ricocheted off you (including helmet ricochets — in the vanilla
  game those are nearly indistinguishable from a near miss), accuracy,
  headshot rate, penetration rates, and what the raid cost you: the handbook
  value of every round you fired, and that value per kill.
- **Records** — per-raid highlights: longest hit, hardest hit dealt and
  taken, most hits on one target.
- Everything is shown separately for damage **received** and **dealt**.

Every feature group can be disabled individually in the configuration.

#### Requirements and compatibility

- SPT 4.1.x (developed and tested on 4.1.1).
- Client-only BepInEx plugin — no server component, no profile changes.
- No dependencies beyond a standard SPT install.
- Statistics cover the whole raid even when another mod lets you die and
  respawn more than once per raid.
- Fika: the raid analysis overlay does not work. Fika replaces the game's
  damage handling, so no hits are recorded and the window stays empty. The
  kill list and death screen additions still work, except that the killer's
  weapon is missing when the shot came in over the network. This is based on
  source analysis, not on a live coop test.

#### Installation

Extract the release ZIP into your SPT installation directory. The plugin ends
up at:

`BepInEx/plugins/maschine-KillAndDamageInfo.dll`

To remove the mod, delete that file.

#### Usage

- Play normally — the kill list, death screen and treatment screen additions
  appear automatically after a raid.
- Press **F10** (rebindable) during or after a raid to open the raid analysis
  window. Statistics reset when the next raid starts.
- **During a raid the window only reads.** It asks for no mouse cursor, so you
  keep playing with it open - and nothing it draws can swallow your fire. The
  price is that the tabs, the **Received**/**Dealt** switch, the scroll areas
  and dragging the window all need a cursor, so they wait until the raid is
  over. Afterwards, on the menu screens, the game shows its own cursor and the
  window is fully interactive.
- Options live in `BepInEx/config/com.maschine.KillAndDamageInfo.cfg` and can
  also be changed in-game with a configuration manager: the overlay key and
  one on/off switch per feature group (kill list ammo, damaged targets, death
  screen details, killer 3D model, damage tooltips, analysis overlay).

#### Known limitations

- Statistics are per raid only; there is no career/long-term aggregation.
- Accuracy counts individual projectiles, so every shotgun pellet counts as
  one shot. Melee and grenade hits carry no ballistics data and are excluded
  from shot counts and accuracy (shown as "—").
- Penetration rate only counts hits where armor was actually involved; pure
  flesh hits do not distort the number.
- Ammunition cost uses handbook base prices, not flea market values, and only
  covers rounds fired from firearms. Ammunition without a handbook entry is
  left out of the total.
- "Shots" and "Hits" come from two different game systems; in rare cases (for
  example one bullet passing through two body parts) the columns can disagree
  by a hit while the accuracy percentage stays consistent.
- Deaths without an attacker (falls, bleed-outs, mines) show the vanilla death
  screen — there is no killer to display.

#### Support

Please report problems with:

- exact KillAndDamageInfo and SPT versions;
- what you expected and what happened instead;
- short reproduction steps (which screen, which tab);
- your `BepInEx/LogOutput.log` from the session.

#### License

MIT — see [LICENSE](LICENSE).

</details>

---

## LootOutline

**Type:** Client · **Version:** `0.1.0+b66c9b5` · **Updated:** 2026-09-08 19:34 · [⬇ Download](https://github.com/maschine34675/spt-beta-hub/raw/main/downloads/LootOutline-0.1.0-b66c9b5.zip)

<details><summary><b>Show usage notes</b></summary>

Weiße Konturen um Gegenstände, die in Tarkov auf dem Boden liegen — die Optik, die man aus PUBG
oder Arena Breakout kennt. Für SPT 4.1.

Status: **M0 im Spiel bestätigt** (SPT 4.1, 2560×1440, DeferredShading — Material kam aus dem
Spiel-Material `Hidden_HighLightMesh`, 5 Passes). Leichen sind dazugekommen und noch ungetestet.

#### Wie es funktioniert

EFT bringt den passenden Shader selbst mit: `Hidden/HighLightMesh`, samt fertig konfiguriertem
Material `Hidden_HighLightMesh`. Das Spiel benutzt ihn für das Hideout-Bereichs-Highlight und den
Item-Inspektionsbildschirm (siehe `HighLightMesh` im Dekompilat). Das Verfahren:

1. Eine einkanalige Maske (`R8`) leeren.
2. Alle Silhouetten per `CommandBuffer.DrawRenderer` hineinzeichnen — Pass 3, der zeichnet ohne
   Tiefentest, die Kontur ist also durch Wände sichtbar.
3. Eigene Hände und Waffe schwarz darüberstempeln, damit die Kontur nicht über die eigene Waffe läuft.
4. Das Kamerabild durch Pass 4 blitten. Der findet die Kanten der Maske und färbt sie ein.

Weil die Kante im Bildraum gefunden wird, ist die Linienbreite in **Pixeln** angegeben und schrumpft
nicht mit der Entfernung. Genau das macht weit entfernte Beute lesbar.

Der Einhängepunkt ist `CameraEvent.AfterImageEffectsOpaque` an `CameraManager.Instance.Camera` — die
Stelle, die das Spiel für denselben Effekt selbst benutzt.

**Der Shader kommt vom Spiel, deshalb braucht diese Mod kein eigenes AssetBundle.** Das ist der
entscheidende Unterschied zu früheren Anläufen: `loot-outline` (SPT 4.0, nie released) hatte eine
vollständige eigene Shader-Pipeline, aber das Bundle dazu wurde nie gebaut — real lief dort nur ein
`GL`-Fallback, der Drahtgitter-Quader statt Silhouetten zeichnet.

Als Render-Blaupause diente `SPT-PitFireTeam`, das dieselbe Maschinerie erwiesenermaßen unter 4.1
für Squad-Mitglieder betreibt.

#### Was ausgewählt wird

- **Lose Beute** über `GameWorld.LootItems` — die Registry, durch die jedes Loot-Objekt läuft. Kein
  Szenen-Scan. Renderer kommen aus `LootItem._renderers`, das die Klasse ohnehin für sich pflegt.
- **Container** über `GameWorld.LootList`, gefiltert auf `LootableContainer`. Die führen keine
  Renderer-Liste, werden also einmalig gescannt und zwischengespeichert.
- **Leichen** über dieselbe Registry — `Corpse` erbt von `LootItem`. Deren `CacheComponents` ist leer
  überschrieben, die Renderer kommen also aus `PlayerBody.GetRenderersNonAlloc`. Das liefert Körper
  **und** getragene Ausrüstung, die Silhouette zeigt also Helm, Rig und Rucksack mit.

Gefiltert wird über Entfernung, Höhe, Mindestgröße und eine Obergrenze auf die nächsten N Objekte.

Leichen weichen an drei Stellen ab, jeweils aus einem Grund:
- **Eigene Reichweite** (15 m statt 8 m). Eine Leiche aus der Distanz zu finden ist der Zweck.
- **Kein Höhen-Cull.** Der Filter existiert für die hunderte Bodenitems; bei Leichen bringt er nichts
  und würde bei 15 m alles verstecken, was hangabwärts oder eine Etage tiefer liegt.
- **Position aus `TrackableTransform` (dem Becken), nicht aus dem Root-Transform.** Die
  `Corpse`-Komponente hängt am GameObject des toten Spielers; dessen Root bleibt stehen, während das
  Ragdoll wegrollt. Das Spiel überschreibt `TrackableTransform` genau deshalb
  ([`InteractableObject.cs:18`](../\_decompiled/EFT.Interactive/InteractableObject.cs) →
  [`Corpse.cs:101`](../\_decompiled/EFT.Interactive/Corpse.cs)). Die feine Entfernungsmessung nimmt
  danach die Renderer-Bounds.
- Der LOD-Filter wird auf Leichen **nicht** angewandt: was `PlayerBody` herausgibt, ist der Satz, mit
  dem das Spiel die Leiche selbst zeichnet — daran herumzufiltern riskiert, den ganzen Körper
  wegzuwerfen.

#### Konfiguration

Alles über das F12-Menü, wirkt sofort. Die wichtigsten:

| Einstellung | Default | Wirkung |
|---|---|---|
| `Detection Range` | 8 m | Ab wann eine Kontur erscheint |
| `Interact Hide Distance` | 1.4 m | Kontur aus, sobald man nah genug zum Aufheben ist |
| `Outline Width` | 1.5 px | Linienstärke, entfernungsunabhängig |
| `Max Outlined Objects` | 60 | Obergrenze, bewusst nicht 0 |
| `Outline Containers` | an | Kisten, Taschen, Spinde |
| `Outline Corpses` | an | Leichen samt getragener Ausrüstung |
| `Corpse Detection Range` | 15 m | Eigene Reichweite für Leichen |
| `Verbose Logging` | aus | Erste Anlaufstelle, wenn keine Kontur erscheint |

#### Bekannte Grenzen und nächste Schritte

- **M1 — Budget.** Frustum-Test fehlt noch: Objekte hinter dem Rücken kosten aktuell Draw-Calls, bis
  die Obergrenze greift. Dazu Messung in Interchange/Resort und in einer Arena-Runde mit vielen
  Leichen. `Max Outlined Objects` ist zusätzlich renderer-begrenzt (das Achtfache des Objektwerts),
  weil eine Leiche ein bis zwei Größenordnungen mehr Renderer mitbringt als ein Item; wie oft das
  greift, steht im Verbose-Log unter „dropped by the cap".
- **M2 — Lebenszyklus.** Mehrere Raids hintereinander, Kamerawechsel, Auflösungswechsel, Fika-Headless.
- **M3 — Optik.** Die Kontur läuft derzeit noch durch die Post-Processing-Kette und wird von TAA
  gejittert. `AfterImageEffectsOpaque` gegen `AfterEverything` und gegen eine eigene
  `OnRenderImage`-Komponente vergleichen. Alpha-Fade über Distanz.
- **M4 — Sichtlinien-Modus** (optional). Die Occlusion-Passes des Shaders sind undokumentiert; das
  kann ein eigenes Shader-Bundle erzwingen und hat deshalb ein hartes Abbruchkriterium.
- **M5 — Container-Feinschliff.** Leere Container ausblenden, Türzustand berücksichtigen.
- **Leichen-Nachlese.** Der Renderer-Satz einer Leiche hat kein billiges Änderungssignal, deshalb
  wird er alle 10 s neu aufgelöst. Falls sich zeigt, dass Ausplündern (Rucksack weg) sichtbar
  nachhinkt, muss das an ein Event statt an einen Timer.

**Konflikt im Blick behalten:** pitFireTeam hängt einen CommandBuffer an dieselbe Kamera und denselben
`CameraEvent` und blittet ebenfalls vollflächig. Ein Regressionstest mit ausgelöstem Squad-Ping gehört
dazu.

#### Bauen

```
dotnet build -c Release
```

Kopiert die DLL selbst nach `..\..\BepInEx\plugins`. Für eine andere Installation:
`-p:SptRoot=D:\SPT41\` mit abschließendem Backslash.

</details>

---

## ModSourceDebugger

**Type:** Client + Server · **Version:** `2.0.0+7371199` · **Updated:** 2026-08-15 22:05 · [⬇ Download](https://github.com/maschine34675/spt-beta-hub/raw/main/downloads/ModSourceDebugger-2.0.0-7371199.zip)

**Components:** Client `2.0.0+7371199` · Server `2.0.0+7371199`

<details><summary><b>Show usage notes</b></summary>

### ModSourceDebugger — Technical Summary

A two-part SPT debugging tool that traces **item template origins** and **UI element ownership** back to the mod that added them.

#### Architecture

| Component | Type | Role |
|---|---|---|
| `maschine-ModSourceDebugger.Client.dll` | BepInEx client mod | Tooltips, UI inspector, reads manifest |
| `maschine-ModSourceDebugger.Server.dll` | SPT 4.x server mod | Builds authoritative item manifest after all mods load |

Both share the same SPT install root (`Application.dataPath` on client, server working directory on server).

---

#### Item Source Tracking

##### Server (authoritative)

Runs at `PostSptModLoader + 100`, after all DB mods finish:

1. Loads vanilla template IDs from `SPT_Data/database/templates/items.json`
2. Recursively scans `user/mods/**/*.json` for item IDs (`newId`, `_id`, `_tpl`, top-level keys, etc.)
3. Diff against live DB via `DatabaseService.GetItems()` — anything non-vanilla not found in JSON → `source: database`
4. Writes `SPT/user/sptappdata/mod-source-manifest.json`

##### Client (display + fallback)

1. Loads server manifest if present
2. Falls back to local JSON scan for entries not in manifest
3. All IDs normalized to lowercase (fixes Massivesoft-style mixed-case hex IDs)
4. Harmony postfix on `SimpleTooltip.Show` appends mod/file/source when hovering items
5. `ItemView.OnPointerEnter/Exit` tracks the currently hovered item

---

#### UI Source Tracking

UI mods often clone vanilla elements (`GameObject.Instantiate`) without mod-specific names — so name matching alone fails.

##### Three detection layers, scored by priority

1. **Instantiate tagging** — Harmony postfix on `Object.Instantiate`; stack trace identifies calling plugin assembly; adds `ModUiSourceMarker` to UI `RectTransform`s
2. **Scored resolution** (`UiPluginResolver`) — collects candidates from:
   - `ModUiSourceMarker` on self/ancestors
   - GameObject name hints (`UnloadAllMagazinesButton` → `UnloadAllMagazines`)
   - `Button.onClick` listener delegate assembly (via reflection on `UnityEventBase.m_Calls`)
   - `MonoBehaviour` component assembly (walk up hierarchy)
   - Infrastructure components (e.g. `DrawMultiSelect` from Tyfon.UIFixes) are deprioritized
3. **Alt + hover** — raycasts UI under cursor, shows path + best-scoring plugin match in tooltip

---

#### Limitations

- Items added purely via C# with no JSON definition → `Unknown server mod` (DB-only)
- Vanilla item overrides (same template ID, changed stats) → not distinguishable from vanilla
- UI patched via Harmony only (no `Instantiate`, no custom components) → hard to attribute
- Instantiate tags only apply to objects created after the mod loads (stash must be reopened)

</details>

---

## SurroundAudio

**Type:** Client · **Version:** `1.0.0+f693bc7` · **Updated:** 2026-08-23 12:44 · [⬇ Download](https://github.com/maschine34675/spt-beta-hub/raw/main/downloads/SurroundAudio-1.0.0-f693bc7.zip)

> **Tester note:** **Beta - feedback wanted.** Requires your Windows output device to be configured for the same layout (Configure Speakers > 5.1) with Windows Sonic/Atmos **off**.

When reporting, please include your speaker layout and how it is connected (HDMI to receiver / analog), plus the `maschine-SurroundAudio` lines from the BepInEx console. To verify your channels, bind `ChannelTestKey` in the F12 config menu and run the test.

Known: vertical cues (enemy above/below) are weaker than with binaural headphones - that is inherent to speaker playback, not a bug.

<details><summary><b>Show usage notes</b></summary>

Overview



Experimental proof of concept: plays SPT on a real surround speaker setup (5.1/7.1) instead of binaural headphone audio.

Tarkov renders all positional audio through the Meta XR Audio spatializer, which produces binaural stereo made for headphones. This mod switches Unity's output to a multichannel speaker mode and disables the binaural spatializer per source, so Unity's native 3D panner distributes sounds onto the actual speaker channels - including center and rears.

Occlusion (walls muffling sound), distance rolloff, in-game headsets (ComTac etc.) and ambience all keep working: they run on Unity DSP and are independent of the spatializer. The main environment reverb also survives untouched - it is mixer-based (indoor reverb bus, outdoor TarkovReverb/Delay, baked gunshot tails), applied after panning and therefore correctly audible on all speakers. KeepReverb only gates a small additional Meta XR acoustics share.



Requirements



- The Windows default output device must be configured for the same layout (Sound control panel > Speakers > Configure > 5.1).
- Windows Sonic / Dolby Atmos / vendor virtual surround must be OFF.
- On HDMI receivers, pick the HDMI output as default device and configure it as 5.1.



Configuration (F12)



- Enabled: master switch.
- SpeakerMode: Stereo / Quad / Mode5point1 / Mode7point1 (default 5.1). Other enum values are not meaningful.
- DisableHrtf: disables the binaural spatializer per source (required for real surround).
- KeepReverb: keep the small Meta XR acoustics reverb share (default on). The main mixer-based environment reverb is always active and unaffected.
- OwnSounds2D: your own footsteps/gear/voice as 2D stereo (default on). The game parents these sources at your feet; on 5.1 they would otherwise image loudly to the rear-left.
- ChannelTestKey (UNBOUND by default - assign a key in the F12 config menu to use it): two phases - first discrete tones per output channel (FL, FR, Center, LFE at 60 Hz, rears; bypasses the panner entirely), then 3D-panned tones around the listener (the game path, some bleed into adjacent speakers is normal). Logs the active audio configuration to the BepInEx console.



Known limitations



- Vertical hearing is inherently reduced: height cues (enemy above/below on Interchange, Labs, Streets) came from the HRTF processing that this mod disables. A flat 5.1 layout cannot reproduce them - sounds from other floors image at ear level.
- The LFE (.1) channel is never driven by game sounds; let your receiver's bass management handle it. (The direct channel test does drive it.)
- Toggling settings mid-raid applies best-effort to live sources; a raid restart gives a clean state. In particular, looping sounds started while KeepReverb was off stay dry after re-enabling it until the loop is re-triggered.
- VOIP (Dissonance) is untouched.



Troubleshooting



- No sound from the rears: bind ChannelTestKey in the F12 config menu, run the test and check the BepInEx console. If it logs "active: Stereo" although Mode5point1 was requested, Windows presents the device as stereo - reconfigure the output device (Configure Speakers > 5.1) and disable Windows Sonic/Atmos.
- Muddy/washed-out positioning: some virtual surround (Windows Sonic, Dolby Atmos for Headphones, vendor drivers) is still active on top of the real 5.1 output - turn it off.
- Phase 1 of the channel test plays clean discrete tones but game sounds seem misplaced: report it - that points at a specific game path, not at your setup.



Installation



As usual, unzip to your SPT folder

</details>

---

_This page is generated automatically (`tools/Generate-BetaHub.ps1`) – make changes there or in `mods.json`, not here._
