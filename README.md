# SPT 4.1 – Beta Mods

Overview of all mods in beta testing · Last updated: **2026-10-11 16:37** · 4 mods with download, 1 in development.

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
| [**SurroundAudio**](#surroundaudio) | `1.0.0+f693bc7` | 2026-08-23 | Client | Replaces Tarkov's binaural (headphone) audio with real 5.1/7.1 output, so you can play on a surround speaker system instead of headphones. | – | [⬇ ZIP](https://github.com/maschine34675/spt-beta-hub/raw/main/downloads/SurroundAudio-1.0.0-f693bc7.zip) |

## 🚧 In development – no build yet

| Mod | Type | Description |
|---|---|---|
| **AiStoryQuests** | Client + Server | Experiment: AI-generated story quests (providers: OpenAI/Anthropic/Ollama, own API key required). |

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
