# SPT 4.1 – Beta Mods

Overview of all mods in beta testing · Last updated: **2026-08-15 20:22** · 14 mods with download, 4 in development.

This page only lists mods that are **not (yet) released on [Forge](https://forge.sp-tarkov.com)** — released mods get their updates there.

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
| [**AutoIFF**](#autoiff) | `2.0.0+8ad12c6` | 2026-08-15 | Client | Automatically identifies the target you are currently aiming at as **Friendly** or **Hostile**, and alerts you when you are marked as a **Scav traitor**. | – | [⬇ ZIP](https://github.com/maschine34675/spt-beta-hub/raw/main/downloads/AutoIFF-2.0.0-8ad12c6.zip) |
| [**BangAndClear**](#bangandclear) | `0.9.0+3111b16` | 2026-08-11 | Client | An SPT 4.0 client mod for tactical door work: crack a door open a few degrees, put a grenade through the gap, close the door, wait for the bang. | – | [⬇ ZIP](https://github.com/maschine34675/spt-beta-hub/raw/main/downloads/BangAndClear-0.9.0-3111b16.zip) |
| [**BtrTurretControl**](#btrturretcontrol) | `1.0.0+37e08ef` | 2026-08-14 | Client | Client-only SPT mod that lets a seated BTR passenger take direct control of the gun turret. | – | [⬇ ZIP](https://github.com/maschine34675/spt-beta-hub/raw/main/downloads/BtrTurretControl-1.0.0-37e08ef.zip) |
| [**ClusterGrenade**](#clustergrenade) | `2.2.1+5fe2678` | 2026-08-13 | Client + Server | Cluster grenade for SPT: instead of shrapnel, the explosion releases several impact bomblets (frag or flash, weighted mix). Also adds a 40x46mm cluster round for grenade… | – | [⬇ ZIP](https://github.com/maschine34675/spt-beta-hub/raw/main/downloads/ClusterGrenade-2.2.1-5fe2678.zip) |
| [**CombatSlide**](#combatslide) | `2.0.0+c57f2f8` | 2026-08-09 | Client | Press crouch while sprinting to keep sliding at decreasing speed – a "combat slide" like in other shooters. | – | [⬇ ZIP](https://github.com/maschine34675/spt-beta-hub/raw/main/downloads/CombatSlide-2.0.0-c57f2f8.zip) |
| [**CorpseRun**](#corpserun) | `0.9.0+0a62fa2` | 2026-08-14 | Client + Server | After dying in a raid, optionally respawn (naked), loot your own corpse and continue the raid; giving up ends the raid normally. | – | [⬇ ZIP](https://github.com/maschine34675/spt-beta-hub/raw/main/downloads/CorpseRun-0.9.0-0a62fa2.zip) |
| [**KillAndDamageInfo**](#killanddamageinfo) | `0.9.0+6554e72` ⚠️Debug | 2026-08-15 | Client | KillAndDamageInfo shows the combat information the game keeps to itself: what your kills died to, who killed you and in what state they were, what each hit actually did… | – | [⬇ ZIP](https://github.com/maschine34675/spt-beta-hub/raw/main/downloads/KillAndDamageInfo-0.9.0-6554e72.zip) |
| [**Killcam**](#killcam) | `1.0.0+aec3dc4` | 2026-08-09 | Client | "Killcam light": on death the camera switches to the killer's first-person view for about 6 seconds; the death panel shows the killer's name and remaining HP. | – | [⬇ ZIP](https://github.com/maschine34675/spt-beta-hub/raw/main/downloads/Killcam-1.0.0-aec3dc4.zip) |
| [**KillcamReplay**](#killcamreplay) | `0.9.2+8dd53d0` ⚠️Debug | 2026-08-14 | Client | True killcam: on death, the killer's final moments are replayed from their point of view, based on the recorded movement of the last seconds before the kill. | – | [⬇ ZIP](https://github.com/maschine34675/spt-beta-hub/raw/main/downloads/KillcamReplay-0.9.2-8dd53d0.zip) |
| [**ModSourceDebugger**](#modsourcedebugger) | `1.2.1+19c0f81` | 2026-08-04 | Client + Server | Debugging tool: traces item templates and UI elements back to the mod that added them (tooltips + UI inspector). | – | [⬇ ZIP](https://github.com/maschine34675/spt-beta-hub/raw/main/downloads/ModSourceDebugger-1.2.1-19c0f81.zip) |
| [**QuestMarkers**](#questmarkers) | `0.1.0+393f10d` | 2026-08-15 | Client | World-anchored HUD markers for your unfinished quest objectives: zones to visit, spots to place items or beacons at, and quest items lying in the raid. No more running… | – | [⬇ ZIP](https://github.com/maschine34675/spt-beta-hub/raw/main/downloads/QuestMarkers-0.1.0-393f10d.zip) |
| [**RaidInfoPanels**](#raidinfopanels) | `1.0.0+c7ec48b` | 2026-08-15 | Client | Stable replacement for the GamePanelHUD weapon/health panels on SPT 4.x. | <a href="#raidinfopanels"><img src="assets/RaidInfoPanels/preview.png" height="60"></a> | [⬇ ZIP](https://github.com/maschine34675/spt-beta-hub/raw/main/downloads/RaidInfoPanels-1.0.0-c7ec48b.zip) |
| [**StashFilter**](#stashfilter) | `1.0.0+f287253` | 2026-08-13 | Client | StashFilter adds a filter and sort panel to the stash search window, so you can find the right weapon, armor piece, magazine, round, med or attachment without scrolling… | <a href="#stashfilter"><img src="assets/StashFilter/demo.gif" height="60"></a> | [⬇ ZIP](https://github.com/maschine34675/spt-beta-hub/raw/main/downloads/StashFilter-1.0.0-f287253.zip) |
| [**SurroundAudio**](#surroundaudio) | `1.0.0+a29569c` | 2026-08-14 | Client | Experimental proof of concept: plays SPT on a real surround speaker setup (5.1/7.1) instead of binaural headphone audio. | – | [⬇ ZIP](https://github.com/maschine34675/spt-beta-hub/raw/main/downloads/SurroundAudio-1.0.0-a29569c.zip) |

## 🚧 In development – no build yet

| Mod | Type | Description |
|---|---|---|
| **AdaptiveArsenal** | Server | Adaptive Arsenal is an SPT 4.0 C# server mod prototype that tracks equipment usage after raids. |
| **AiStoryQuests** | Client + Server | Experiment: AI-generated story quests (providers: OpenAI/Anthropic/Ollama, own API key required). |
| **AutoWishlist** | Client + Server | – |
| **StashSort** | Client | – |

---

## AutoIFF

**Type:** Client · **Version:** `2.0.0+8ad12c6` · **Updated:** 2026-08-15 12:04 · [⬇ Download](https://github.com/maschine34675/spt-beta-hub/raw/main/downloads/AutoIFF-2.0.0-8ad12c6.zip)

<details><summary><b>Show usage notes</b></summary>

### AutoIFF — Automatic Identify Friend or Foe

Automatically identifies the target you are currently aiming at as **Friendly** or **Hostile**, and alerts you when you are marked as a **Scav traitor**.

Based on [LightsAutomaticIdentifier](https://hub.sp-tarkov.com/files/file/2669-lightsautomaticidentifier/) by **Light** (MIT License).

---

#### Features

- **Target identification** — aim at any bot to identify it as Friendly or Hostile after a short delay
- **Bot role display** — shows the target's role: PMC (USEC/BEAR), Scav, Sniper Scav, Raider, Boss (Killa, Reshala, Gluhar, Sanitar, Tagilla, Knight, Zryachiy, Shturman, Kaban, Kolontay, Partisan), Boss Follower, Cultist, Infected, and more
- **Skill scaling** — identification time and range are affected by your Attention, Perception, and Search skill levels, including Elite bonuses
- **Identification memory** — previously identified targets are remembered for 60 seconds (configurable), so you don't have to re-identify them
- **Scav traitor detection** — detects the exact moment a Scav group marks you as hostile and shows a flash alert in the bottom-right corner. The counter increments each time an additional group finds out, giving you a sense of how far the information has spread across the map
- **Activation mode** — set to *Automatic* (Scav raids only), *AlwaysOn*, *AlwaysOff*, or *Hotkey* (toggle on/off via a configurable keybind)
- **Friendly-only mode** — instantly highlights friendly targets only, with no identification delay; hostile targets show no label — useful for preventing friendly fire in any raid type
- **Fika support** — works in coop raids, including headless-hosted ones (see below)
- **Conflict detection** — if the original LightsAutomaticIdentifier is also installed, AutoIFF disables itself and shows a warning in-game

---

#### How It Works

While aiming down sights, a raycast is fired from the player camera. When it hits a bot within range, a short identification timer begins. Once complete, the target is labeled Friendly or Hostile based on whether it has registered the player as an enemy.

Scav traitor detection hooks directly into `BotsGroup.AddEnemy` — the single point through which all enemy-registration paths converge (direct hit response, group propagation, and zone-wide spread). This means the alert fires at the earliest possible moment, with no polling.

---

#### Fika Support

AutoIFF works with [Fika](https://project-fika.gitbook.io/) coop raids (requires Fika 2.4.x or newer; AutoIFF only needs to be installed on your own client):

- **When you are the raid host** (or playing regular SPT), bots run locally and identification uses the exact hostility data, just like in singleplayer.
- **When you join a raid hosted by someone else — including a headless host** — bot AI only exists on the host, so exact hostility data is not available on your machine. AutoIFF then derives friend-or-foe from the bot's role and your faction:
  - Human coop players are always shown as **Friendly** with their nickname
  - Bots that are hostile by default (e.g. everything vs. PMCs; cultists, Killa, Shturman, the Goons vs. player Scavs) are shown as **Hostile**
  - Bots that are *not* hostile at spawn but escalate when approached or provoked (e.g. bosses, Raiders, and Rogues vs. player Scavs) are shown as **Wary** in orange
  - If you damage an innocent Scav as a player Scav, AutoIFF assumes traitor status: the traitor warning fires and Scavs are labeled Hostile for the rest of the raid

The `Wary` label and the traitor assumption only exist in these client-joined coop raids — everywhere else the mod shows the bot AI's real state.

---

#### Configuration

All settings are available via BepInEx's configuration system (e.g. with [BepInEx Configuration Manager](https://hub.sp-tarkov.com/files/file/1304-bepinex-configuration-manager/)).

| Section | Setting | Default | Description |
|---|---|---|---|
| General | ActivationMode | Automatic | Automatic / AlwaysOn / AlwaysOff / Hotkey |
| General | ActivationHotkey | *(unbound)* | Keybind to toggle the mod when using Hotkey mode |
| General | FriendlyOnly | false | Only show friendly targets (no delay, hostile targets show nothing) |
| Identification | BaseIdentificationTime | 0.7s | Base time to identify a target |
| Identification | IdentificationRange | 100m | Maximum identification range |
| Identification | DistanceMultiplier | 0.1 | How much distance slows identification |
| Identification | MemoryDuration | 60s | How long identified targets are remembered |
| Skills | UseSkillScaling | true | Scale values based on Attention, Perception, Search |
| Display | ShowDistance | false | Show distance to target |
| Display | ShowBotRole | true | Show bot role below the Friendly/Hostile label |
| Display | ShowTraitorWarning | true | Show Scav traitor alert |
| Display | TraitorAlertDuration | 5s | How long each traitor alert stays on screen |

---

#### Credits

Original concept and implementation by **Light** — [LightsAutomaticIdentifier](https://hub.sp-tarkov.com/files/file/2669-lightsautomaticidentifier/).

</details>

---

## BangAndClear

**Type:** Client · **Version:** `0.9.0+3111b16` · **Updated:** 2026-08-11 12:08 · [⬇ Download](https://github.com/maschine34675/spt-beta-hub/raw/main/downloads/BangAndClear-0.9.0-3111b16.zip)

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
| CloseDelaySeconds | 1.5 | Delay between the grenade leaving the hand and the door closing. |
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

**Type:** Client + Server · **Version:** `2.2.1+5fe2678` · **Updated:** 2026-08-13 19:00 · [⬇ Download](https://github.com/maschine34675/spt-beta-hub/raw/main/downloads/ClusterGrenade-2.2.1-5fe2678.zip)

**Components:** Client `2.2.1+5fe2678` · Server `2.2.1+5fe2678`

<details><summary><b>Show usage notes</b></summary>

### ClusterGrenade Mod

Cluster grenade for SPT: instead of shrapnel, the explosion releases several impact-fuzed bomblets (frag or flash, weighted mix). There is also a 40x46mm cluster round for grenade launchers (MSGL, M203, FN40GL).

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

## CombatSlide

**Type:** Client · **Version:** `2.0.0+c57f2f8` · **Updated:** 2026-08-09 12:53 · [⬇ Download](https://github.com/maschine34675/spt-beta-hub/raw/main/downloads/CombatSlide-2.0.0-c57f2f8.zip)

_No detailed description yet._

---

## CorpseRun

**Type:** Client + Server · **Version:** `0.9.0+0a62fa2` · **Updated:** 2026-08-14 10:03 · [⬇ Download](https://github.com/maschine34675/spt-beta-hub/raw/main/downloads/CorpseRun-0.9.0-0a62fa2.zip)

**Components:** Client `0.9.0+0a62fa2` · Server `0.9.0+119da90`

_No detailed description yet._

---

## KillAndDamageInfo

**Type:** Client · **Version:** `0.9.0+6554e72` · **Updated:** 2026-08-15 13:40 · ⚠️ Debug build · [⬇ Download](https://github.com/maschine34675/spt-beta-hub/raw/main/downloads/KillAndDamageInfo-0.9.0-6554e72.zip)

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

**Raid analysis overlay** (default key: F7, rebindable)

- **Heatmap** — a body silhouette with color-coded zones showing where you got
  hit and where you hit others, with hit counts and damage per zone.
- **Ammo** — per ammunition type: shots fired, hits, accuracy, armor
  penetration rate, average and total damage.
- **Weapons** — per weapon: shots, hits, accuracy, damage and kills.
- **Distance** — a bar chart of your hits grouped by engagement range.
- **Overview** — totals for both directions, damage your armor absorbed,
  bullets that ricocheted off you (including helmet ricochets — in the vanilla
  game those are nearly indistinguishable from a near miss), accuracy,
  headshot rate and penetration rates.
- **Records** — per-raid highlights: longest hit, hardest hit dealt and
  taken, most hits on one target.
- Everything is shown separately for damage **received** and **dealt**, and
  weapon fire is blocked while the mouse is over the window.

Every feature group can be disabled individually in the configuration.

#### Requirements and compatibility

- SPT 4.1.x (developed and tested on 4.1.1).
- Client-only BepInEx plugin — no server component, no profile changes.
- No dependencies beyond a standard SPT install.
- Statistics cover the whole raid even when another mod lets you die and
  respawn more than once per raid.
- Fika: not tested in Fika sessions.

#### Installation

Extract the release ZIP into your SPT installation directory. The plugin ends
up at:

`BepInEx/plugins/maschine-KillAndDamageInfo.dll`

To remove the mod, delete that file.

#### Usage

- Play normally — the kill list, death screen and treatment screen additions
  appear automatically after a raid.
- Press **F7** (rebindable) during or after a raid to open the raid analysis
  window. Switch tabs at the top, toggle between **Received** and **Dealt** at
  the top right, and drag the title bar to move the window. Statistics reset
  when the next raid starts.
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

## Killcam

**Type:** Client · **Version:** `1.0.0+aec3dc4` · **Updated:** 2026-08-09 12:56 · [⬇ Download](https://github.com/maschine34675/spt-beta-hub/raw/main/downloads/Killcam-1.0.0-aec3dc4.zip)

> **Tester note:** Predecessor of **KillcamReplay** – do not install both at the same time.

_No detailed description yet._

---

## KillcamReplay

**Type:** Client · **Version:** `0.9.2+8dd53d0` · **Updated:** 2026-08-14 09:14 · ⚠️ Debug build · [⬇ Download](https://github.com/maschine34675/spt-beta-hub/raw/main/downloads/KillcamReplay-0.9.2-8dd53d0.zip)

> **Tester note:** Successor of **Killcam** – do not install both at the same time.

<details><summary><b>Show usage notes</b></summary>

GUID `com.maschine.KillcamReplay`, Assembly `maschine-KillcamReplay` — naming scheme as in
[EasyMounting](https://github.com/maschine34675/EasyMounting).

A true killcam for SPT: on death, the final action is played back **from the killer's point
of view** — not a live view of the killer (as in KillAndDamageInfo), but a replay of the
recorded view direction and position of the last seconds before the kill.

#### How it works

**Recording (during the raid):**
A `SnapshotRecorder` samples at a fixed rate (default 20 Hz), for every living player/bot,
the camera position (`Player.CameraPosition`), view direction (`Player.Rotation`, yaw/pitch),
body pose (`PoseLevel`, `IsInPronePose`) and the world pose of the held weapon
(`PlayerBones.WeaponRoot.Original`) into a ring buffer (default 15 s). Shots are marked with
a timestamp via a postfix on `Player.OnMakingShot`. During the replay, a script-free mesh
copy of the killer's weapon (`WeaponGhost`) travels along its recorded track in front of the
camera — you can see what he aims with and where; the muzzle flash sits at its muzzle.

**Replay (on death):**
`Player.OnDead` provides the killer (`LastAggressor`). The window of the last N seconds
(default 5 s) is extracted from his ring buffer. `LocalGame.Stop()` is deferred (same
pattern as the KillAndDamageInfo killcam) and the main camera is interpolated along the
recorded path (position: lerp, yaw/pitch: LerpAngle). The pose is applied in
`Application.onBeforeRender` — after all `LateUpdate`s, so the still-running
`PlayerCameraController` (corpse cam) cannot overwrite the rendered image. Deliberately,
**no** controller is destroyed or created: `PlayerCameraController.Destroy` detaches the
`EffectsController` from the player, whose death handler then throws NullRefs and aborts the
end-of-raid sequence (soft lock). The death fade (`EffectsController.method_9`,
DeathFade + FastBlur) is suppressed via prefix during the replay, otherwise it would sit
black on top of it.

**Slow motion:**
The last `SlowMoSeconds` (default 1.5 s) before the kill run in slow motion
(`SlowMoFactor`, default 0.35×) — purely via the playback clock, no `Time.timeScale`;
the live world keeps running normally. Smooth transition over 0.4 s when entering the window.
The deferred-stop delay accounts for the stretched wall-clock time.

**Soft ending (live tail):**
At the end of the recorded path (the kill moment) the replay does not end abruptly: a short
fade to black (~0.2 s), under full black the scene switches to the live world (puppet
removed, hidden bots and your own corpse visible again — only the killer stays hidden),
fade back, then the camera follows **the killer's eyes live** for `LiveTailSeconds`
(default 2 s) (`FollowKillerInTail`; fallback: last replay position if he has died in the
meantime). Afterwards the replay itself fades to black and holds black until the re-invoked
`LocalGame.Stop` has raised its own blackscreen (detected via
`DeferStopPatch.StopReinvokedAt` + 1.5 s; emergency timeout 5 s) — so the corpse cam never
flashes up between replay end and the end-of-raid transition. During the live tail the
killer himself stays hidden (the camera sits in his eyes), but his **held weapon is shown
again** (`LivePlayerHider.ShowHeldWeapon`) — it rides on his live hands and reads like a
natural first-person view; weapon views newly created while reloading also stay visible
(excluded from the refresh sweep). If `Stop` was not deferred (e.g. because a respawn mod
intercepted the death), the camera is returned directly after the tail — no black hold,
which would otherwise cover the respawn prompt. In the F9 debug replay the tail is
deliberately disabled (the player is alive and would be blind for that long).

**Victim ghost (phase 2/3):**
During the replay you watch yourself through the killer's eyes. Two representations:

- **Real character model** (`GhostPuppet`, default): The `BoneRecorder` records the
  complete skeleton of the local player (only the local player — which is what keeps it
  affordable: ~a few hundred transform reads per tick, flat preallocated arrays, a few MB).
  On replay the corpse is cloned — `Corpse.CreateCorpse` converts the real, dressed player
  GameObject in place, so the clone wears clothing + gear. Before stripping, every renderer
  on the clone is forced to `shadowCastingMode = On` — otherwise head/upper body stay
  invisible, because EFT renders them on your own player in first person with
  `ShadowCastingMode.ShadowsOnly` (the corpse conversion never resets that) and a raw clone
  copies this state along. The obvious route via
  `PlayerBody.UpdatePlayerRenders(ThirdPerson, ...)` — the game's own method for this — does
  NOT work on the clone: it iterates `PlayerBody.BodySkins`, which is only populated at
  runtime (Awake/Equip) and is empty on a clone whose Awake we deliberately never run
  (silent no-op, no error). The direct renderer sweep bypasses that entirely. The clone is
  instantiated under an INACTIVE holder (no Awake runs), all scripts/physics/animator are
  stripped via `DestroyImmediate` (no Awake → no OnDestroy side effects), bones are mapped
  by hierarchy path and overwritten per frame with the recorded poses — **no animator
  needed**, exact playback of gait, lean and aiming. The source (corpse or live body) is
  hidden after cloning so it does not stay visible next to the running ghost.
- **Silhouette** (`ReplayGhost`, automatic fallback): capsule body with pose-dependent
  height, head sphere, view-direction bar — in case puppet creation fails or
  `UseRealModelGhost` is off.

In the F9 debug replay the ghost is your own path (puppet source = living body; your own
head stays invisible there for FPS reasons): stand in front of a bot, F9, watch yourself.

#### Performance budget

- **Idle cost per frame:** 2 float comparisons (sample not due → early-out).
- **Per sample tick (20×/s):** per living player 1 transform read + 1 Vector2 read +
  1 struct write into a preallocated array. With ~30 bots: microsecond range.
- **No GC allocations in the hot path:** ring buffers are preallocated (structs), the
  track dictionary only grows when a new player spawns. Extracting the replay window
  allocates only once, on death.
- **Memory:** 32 bytes/snapshot × 20 Hz × 15 s ≈ 9.6 KB per player; with 40 players ≈ 385 KB.
  The bone recorder (local player only) takes a few MB depending on skeleton size
  (logged at raid start).

#### Configuration (BepInEx F12 / config file)

| Option | Default | Description |
|---|---|---|
| Recording.SampleRate | 20 Hz | Recording rate |
| Recording.BufferSeconds | 15 s | Ring buffer length |
| Replay.Duration | 10 s | Replay length |
| Replay.LiveTailSeconds | 5 s | Keep showing live after replay end (0 = off) |
| Replay.SlowMoSeconds | 1.5 s | Play the last N seconds before the kill in slow motion (0 = off) |
| Replay.SlowMoFactor | 0.35 | Playback speed inside the slow-motion window |
| Replay.FollowKillerInTail | true | Follow the killer live during the tail instead of staying static |
| Replay.HudTopFraction | 0.87 | Vertical position of the killcam HUD (fraction of screen height from the top) |
| Replay.ShowMuzzleFlashes | true | 3D muzzle flashes at recorded shot timestamps |
| Replay.ShowKillerWeapon | true | Mesh copy of the killer's weapon travels its recorded track in front of the camera |
| Replay.DeathReplay | true | Replay on your own death |
| Replay.ShowVictimGhost | true | Show your own silhouette (ghost) in the replay |
| Replay.UseRealModelGhost | true | Real character model instead of silhouette (automatic fallback) |
| Replay.HideLiveBots | true | Hide living bots during the replay |
| Replay.InvertPitch | false | Invert vertical view direction (in case the camera tilts the wrong way) |
| Debug.ReplayKey | F9 | Immediately play a replay of the nearest bot (testing without dying) |

#### Known limitations (prototype)

- **The world keeps running live** — living bots (including the killer) are hidden during
  the replay though (`LivePlayerHider`: `Renderer.enabled`, AI/logic keep running; restored
  afterwards). Equipment views (weapon, chest rig, backpack, headwear, ...) are pooled
  objects (`AssetPoolObject`) attached to a bone — not guaranteed to be descendants of
  `player.gameObject` — so `PlayerBody.SlotViews` (the game's own authoritative list of
  every currently equipped view) is traversed additionally and its `Renderers` are hidden
  explicitly. The weapon **in the hands** is NOT a SlotView model (the slot suppresses its
  body model while the item is held) — it is a separate view object of the hands controller
  under the `WeaponRoot` bone and is swept separately. A flashlight moreover is not a
  renderer but a `UnityEngine.Light` component (typically sitting on the hand weapon) that
  keeps shining when only the mesh is hidden — so all `Light` components (player hierarchy,
  slots, WeaponRoot) are disabled as well. Your own corpse/live body (the puppet source) is
  also hidden as soon as the clone is up. Additional actors as ghosts (e.g. the killer in a
  third-person view) would be a later extension.
- **Muzzle flash = approximation** — at recorded shot timestamps a point light + stretched
  glow ellipsoid appears in shot direction for ~70 ms (`ShotFlash`; Unity has no cone
  primitive): killer shots just in front of/below the camera (his eyes ARE the camera, his
  weapon is not rendered), own shots at the estimated muzzle of the puppet weapon (furthest
  +Z extent of the copied meshes). No particle effect, no sound. Can be disabled via
  `ShowMuzzleFlashes`.
- **Hidden bots are re-swept every 0.5 s** (`RefreshHidden`): reloading and weapon switching
  create NEW view objects mid-replay (magazine in the hand, round, different weapon) that
  did not exist at the initial hide and would otherwise be visible, floating freely.
- **The Odin NullRef on corpse cloning is no longer logged**: it comes from the item scripts
  of the slot-view equipment (holster/back weapon), is demonstrably without consequence
  (the components are stripped right afterwards) — the Unity logger is muted exactly for the
  synchronous `Instantiate` call.
- **The "Killed in Action" panel** appears as a UI overlay on top of the replay (as with the
  KillAndDamageInfo killcam).
- **Weapon on the puppet = pure mesh copy**: the Odin/Sirenix deserialization of the weapon
  item throws an (internally caught) NullReferenceException on raw cloning and leaves the
  weapon mesh empty. So the weapon is not cloned at all; its meshes are copied individually
  (`AttachWeaponMeshes`: new GameObjects with sharedMesh + sharedMaterials, without any
  scripts) and attached to the puppet's mapped WeaponRoot bone — they ride on the recorded
  hand animation. Skinned meshes (e.g. straps) are skipped; moving weapon parts (bolt etc.)
  are static in the copy.
- **Coexistence with KillAndDamageInfo:** its live killcam also owns the death sequence
  (deferred stop + camera takeover). If that mod is loaded, the death replay disables itself
  automatically (log warning); the F9 debug replay still works. To test the death replay,
  temporarily remove the KillAndDamageInfo DLL from `BepInEx/plugins`.
- **Respawn compatibility (e.g. CorpseRun):** recording is deliberately NOT stopped
  permanently on your own death (only during the ~10 s a replay actively occupies the
  screen) — otherwise recording would end for good after the first death and every further
  replay in the same round would fail with "Killer track too short". The `BoneRecorder`
  detects a character switch (new player GameObject after respawn) and reinitializes itself
  automatically. Verified in-game with CorpseRun (multiple deaths/replays in one round).

#### Build

```
dotnet build -c Debug
```

Automatically copies DLL + PDB to `C:\SPT\BepInEx\plugins\`.

</details>

---

## ModSourceDebugger

**Type:** Client + Server · **Version:** `1.2.1+19c0f81` · **Updated:** 2026-08-04 20:02 · [⬇ Download](https://github.com/maschine34675/spt-beta-hub/raw/main/downloads/ModSourceDebugger-1.2.1-19c0f81.zip)

**Components:** Client `1.2.1+19c0f81` · Server `1.2.1+d481132`

_No detailed description yet._

---

## QuestMarkers

**Type:** Client · **Version:** `0.1.0+393f10d` · **Updated:** 2026-08-15 12:50 · [⬇ Download](https://github.com/maschine34675/spt-beta-hub/raw/main/downloads/QuestMarkers-0.1.0-393f10d.zip)

<details><summary><b>Show usage notes</b></summary>

World-anchored HUD markers for your unfinished quest objectives: zones to
visit, spots to place items or beacons at, and quest items lying in the raid.
No more running circles around a vague quest description - the marker floats
where the objective is, with the quest name and the distance.

#### Main features

- **Markers anchored in the world.** Objectives on screen get a pin whose tip
  sits on the spot, with the quest name and distance below it; objectives off
  screen get an arrow at the screen border pointing toward them. Distant
  markers are drawn slightly smaller, which reads as depth rather than as a
  flat overlay.
- **An icon per kind of objective**, in its own colour, on the pin and on the
  edge arrow: a gold flag for a place to reach, a green crate for something
  to leave behind, a violet antenna for a beacon, an orange burst for a
  flare, a blue case for a quest item to find.
- **A glance, not a permanent overlay.** The markers show for a few seconds
  per keypress and then fade out again (configurable, including "stay").
- **Only what is still open.** Completed conditions disappear, picked-up
  quest items too. Objectives of other maps never show.
- **Click-through glass.** The HUD ignores mouse and keyboard entirely; the
  game stays fully playable while it is visible.
- **Honest when the picture lies.** While aiming through a magnified optic
  (whose lens renders its own camera) the markers fade out instead of
  pointing at wrong pixels. Scav raids show no PMC quest markers.

#### Requirements and compatibility

- SPT 4.1 (client mod only, nothing to install server-side).
- [Anvil-WebOverlay](https://forge.sp-tarkov.com/) library (hard dependency)
  and the Microsoft WebView2 runtime it needs - current Windows 10/11 already
  includes it.
- Borderless windowed or windowed mode (exclusive fullscreen cannot show an
  overlay over the game).

#### Installation

Extract the release zip over your SPT folder; it places
`BepInEx/plugins/maschine-QuestMarkers.dll`. Install the Anvil-WebOverlay zip
first if you do not have it yet.

#### Usage and default controls

**F6** shows the markers for five seconds - a quick glance to orient
yourself, then they are out of the way again. The key works while moving,
and the same peek happens automatically when a raid starts. Set *Auto-hide
after* to 0 if you would rather have them stay until you toggle them off.

| Section | Option | Default | Meaning |
|---|---|---|---|
| General | Show in raid automatically | on | Show the markers whenever a raid starts. |
| General | Toggle key | F6 | Show or hide the markers during a raid. |
| Filter | Maximum distance | 0 (unlimited) | Hide markers farther away than this many meters. |
| Filter | Maximum markers | 12 | At most this many markers at once; the closest objectives win. |
| Display | Show quest names | on | Print the quest name under each marker. |
| Display | Show distances | on | Print the distance under each marker. |
| Display | Edge arrows | on | Point at off-screen objectives with border arrows. |
| Display | Auto-hide after | 5 s | Hide the markers again this many seconds after they appeared. 0 keeps them visible. |
| Display | Marker size | 1.0 | Overall size of the markers. |
| Display | Size at distance | 0.8 | How large a far marker is compared to a close one; 1 makes every marker the same size. |
| Display | Distance for smallest size | 250 m | Where that smallest size is reached. |

#### Known limitations

- Markers show through walls - there is no occlusion. For "go there"
  guidance that is usually what you want.
- Kill counters, handovers, skill and trader conditions have no world
  position and therefore no marker.
- A zone id that exists several times in a map is shown as one marker at the
  combined center.

#### Support

Please include your exact SPT and mod versions, what you expected, what
happened instead, and the client log
(`BepInEx/LogOutput.log`) when reporting a problem.

#### License, credits, third-party

MIT. Renders through the [Anvil-WebOverlay](https://github.com/maschine34675/WebOverlay)
library. The quest-condition walk follows the approach proven by the
DynamicMaps and GTFO mods (both MIT) - thanks to their authors; no code was
copied.

</details>

---

## RaidInfoPanels

**Type:** Client · **Version:** `1.0.0+c7ec48b` · **Updated:** 2026-08-15 19:57 · [⬇ Download](https://github.com/maschine34675/spt-beta-hub/raw/main/downloads/RaidInfoPanels-1.0.0-c7ec48b.zip)

<img src="assets/RaidInfoPanels/preview.png" width="440"> <img src="assets/RaidInfoPanels/puppet_preview.png" width="440">

<details><summary><b>Show usage notes</b></summary>

Stable replacement for the GamePanelHUD weapon/health panels on SPT 4.x.

#### Why a rewrite instead of a fork?

The original mod [GamePanelHUD](https://github.com/kmyuhkyuk/GamePanelHUD) depends on [KmyTarkovApi](https://github.com/kmyuhkyuk/KmyTarkovApi), which among other things patches `GameWorld` and `TriggerWithId`. Interventions like that can cause side effects (users report broken airdrops, for example). This mod only reads game state and draws UI — **no Harmony patches**.

#### Panels

| Panel | Content |
|---|---|
| **Weapon** (bottom right) | Weapon name, magazine + round, caliber, fire mode |
| **Health** (bottom left) | HP, hydration, energy incl. regeneration rate |

#### Configuration

BepInEx config: `BepInEx/config/com.maschine.RaidInfoPanels.cfg`

- General: master switch, update interval
- Weapon/Health: enable individually, position, colors, warning thresholds

#### Build

```powershell
dotnet build Development/RaidInfoPanels/RaidInfoPanels.csproj -c Release
```

The DLL is automatically copied to `BepInEx/plugins/maschine-RaidInfoPanels.dll`.

#### Planned

- Hit, kill, grenade and compass panels as separate modules
- Configuration via ConfigurationManager

</details>

---

## StashFilter

**Type:** Client · **Version:** `1.0.0+f287253` · **Updated:** 2026-08-13 16:32 · [⬇ Download](https://github.com/maschine34675/spt-beta-hub/raw/main/downloads/StashFilter-1.0.0-f287253.zip)

<img src="assets/StashFilter/demo.gif" width="440">

<details><summary><b>Show usage notes</b></summary>

StashFilter adds a filter and sort panel to the stash search window, so you can
find the right weapon, armor piece, magazine, round, med or attachment without
scrolling through the whole search result.

#### Features

The panel opens automatically next to the stash search window and offers six
tabs. Every tab starts with no filter set — filters apply as soon as you click
a button, and each tab has its own Reset.

- **Weapons** — filter by caliber, fire mode and weapon class; sort by fire
  rate, ergonomics, recoil sum, accuracy, muzzle velocity, caliber or type.
- **Armor** — filter by item type (vest/plate), armor class 1–6 and armor type
  (light/heavy); sort by class, durability, effective durability, speed
  penalty or ergonomics penalty. Every armor item and plate also gets a live
  **Effective Durability** attribute in its inspect window — a button on the
  Armor tab turns this on or off at any time.
- **Mags** — filter by caliber, capacity, fill state (empty/loaded) and
  failure-to-feed category (matching the game's own None…Very High display);
  sort by capacity, load speed, check speed, ergonomics, malfunction chance or
  caliber. Magazines that accept several calibers (for example 7.62x39 AK mags
  that also take .366 TKM) match every caliber they accept.
- **Ammo** — filter by caliber, penetration threshold (20+/30+/40+/50+),
  tracer and subsonic; sort by damage (total, including pellet count for
  buckshot), penetration, armor damage, fragmentation chance, velocity, recoil
  or caliber. Loose rounds and ammo boxes are both matched — boxes are
  classified by the rounds they contain.
- **Meds** — filter by type (medkit/drug/medical/stim) and by the effect an
  item cures (heavy/light bleed, fracture, pain, contusion, toxication,
  radiation, surgery); sort by remaining HP pool, maximum HP, use time or
  number of cured effects.
- **Mods** — filter weapon attachments by type (sights, magnifying optics, red
  dots, suppressors, muzzle devices, foregrips, pistol grips, stocks, barrels,
  handguards, receivers, mounts, tactical devices, other) and by magnification
  (1x / 2x+ / 4x+ / 6x+); sort by ergonomics, recoil %, accuracy %, velocity,
  zoom, sighting range or weight.

The panel drives the game's own type tabs where possible (for example
selecting a magazine filter also narrows the vanilla view to magazines), works
together with the search text field, is draggable, and blocks clicks from
falling through to the inventory behind it.

#### Requirements and compatibility

- SPT 4.1.x (developed and tested on 4.1.1).
- Client-only BepInEx plugin — no server component, no profile changes.
- No dependencies beyond a standard SPT install.
- Fika: the mod only touches the local stash-search UI and is expected to
  work, but it has not been specifically tested in Fika sessions.

#### Installation

Extract the release ZIP into your SPT installation directory. The plugin ends
up at:

`BepInEx/plugins/maschine-StashFilter.dll`

To remove the mod, delete that file.

#### Usage

1. Open the stash search window as usual.
2. The StashFilter panel appears beside it. Pick a tab, click filter buttons
   to narrow the result, and pick a sort mode — clicking the active sort mode
   again flips between ascending and descending (shown as an arrow on the
   button).
3. **Reset** clears the current tab; closing and reopening the search window
   clears all filters. The panel remembers the last selected tab, and tabs
   with an active filter or sort are marked with a dot.

The only option — whether armor items carry the Effective Durability
attribute — is toggled directly on the Armor tab and remembered in
`BepInEx/config/com.maschine.StashFilter.cfg`. The panel itself is positioned
by dragging its title bar.

#### Known limitations

- Only items that the vanilla stash search itself lists can be filtered.
  Attachments installed on a weapon are not part of the search result, so
  they do not appear in the Mods tab either.
- A few magnified vanilla scopes carry incorrect zoom values in the game data
  (for example the ELCAN Specter OS4x, the Nightforce NXS 2.5-10x and the NPZ
  PAG-17). These land in the 1x magnification bucket and sort low on zoom —
  the filter faithfully reflects what the game data says.
- Stimulators remove bleeds through a separate buff system; the Meds "Cures"
  filter only sees regular heal effects, so stims are best found via the type
  filter.
- The "Reflex" mod category deliberately lists collimators only; iron sights
  (mostly stripped weapon halves) are reachable via "Sights" or the 1x
  magnification bucket instead.
- Revolver cylinders report no accepted caliber, so they only match the
  "All" caliber filter on the Mags tab.

#### Support

Please report problems with:

- exact StashFilter and SPT versions;
- what you expected and what happened instead;
- short reproduction steps (which tab, which filters);
- your `BepInEx/LogOutput.log` from the session.

#### License

MIT — see [LICENSE](LICENSE).

</details>

---

## SurroundAudio

**Type:** Client · **Version:** `1.0.0+a29569c` · **Updated:** 2026-08-14 15:46 · [⬇ Download](https://github.com/maschine34675/spt-beta-hub/raw/main/downloads/SurroundAudio-1.0.0-a29569c.zip)

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
- ChannelTestKey (default F10): two phases - first discrete tones per output channel (FL, FR, Center, LFE at 60 Hz, rears; bypasses the panner entirely), then 3D-panned tones around the listener (the game's path, some bleed into adjacent speakers is normal). Logs the active audio configuration to the BepInEx console.



Known limitations



- Vertical hearing is inherently reduced: height cues (enemy above/below on Interchange, Labs, Streets) came from the HRTF processing that this mod disables. A flat 5.1 layout cannot reproduce them - sounds from other floors image at ear level.
- The LFE (.1) channel is never driven by game sounds; let your receiver's bass management handle it. (The F10 direct test does drive it.)
- Toggling settings mid-raid applies best-effort to live sources; a raid restart gives a clean state. In particular, looping sounds started while KeepReverb was off stay dry after re-enabling it until the loop is re-triggered.
- VOIP (Dissonance) is untouched.



Troubleshooting



- No sound from the rears: press F10 and check the BepInEx console. If it logs "active: Stereo" although Mode5point1 was requested, Windows presents the device as stereo - reconfigure the output device (Configure Speakers > 5.1) and disable Windows Sonic/Atmos.
- Muddy/washed-out positioning: some virtual surround (Windows Sonic, Dolby Atmos for Headphones, vendor drivers) is still active on top of the real 5.1 output - turn it off.
- Phase 1 of the F10 test plays clean discrete tones but game sounds seem misplaced: report it - that points at a specific game path, not at your setup.



Installation



As usual, unzip to your SPT folder

</details>

---

_This page is generated automatically (`tools/Generate-BetaHub.ps1`) – make changes there or in `mods.json`, not here._
