# ODMG deep semantic audit

- CRITICAL: 0
- HIGH: 0
- MEDIUM: 0
- LOW: 0
- INFO: 2
- PASS: 31

| Severity | Check | Finding | Evidence |
|---|---|---|---|
| INFO | `effect:ejector-adapter` | EjectorParticle is absent; Scarlet GasPart emitters are explicitly partitioned as the movement, boost, and slide fallback. | scarlet.rbxl + Movement:_setBoostParticles |
| INFO | `version:canonical-source` | Current decompiled Requiem and the clean 2024 branch implement different ejector/slide architectures; exactness cannot target both simultaneously. This audit treats current Requiem as canonical and uses 2024 only for PlayerSlide. | Ejector/Default.luau + CharacterMovementRunner.luau versus BaseGearEjector.ts + ClientSlideMovement.ts |
| PASS | `animation:asset-111466842883640` | Animation 111466842883640 is mapped. | Common/Animations/Gear.luau versus ODMG:Animations |
| PASS | `animation:asset-120620528209768` | Animation 120620528209768 is mapped. | Common/Animations/Gear.luau versus ODMG:Animations |
| PASS | `animation:asset-76656511162291` | Animation 76656511162291 is mapped. | Common/Animations/Gear.luau versus ODMG:Animations |
| PASS | `animation:asset-92644101274615` | Animation 92644101274615 is mapped. | Common/Animations/Gear.luau versus ODMG:Animations |
| PASS | `animation:asset-98227138288925` | Animation 98227138288925 is mapped. | Common/Animations/Gear.luau versus ODMG:Animations |
| PASS | `animation:source-of-truth` | Requiem animation IDs are authoritative for the ported movement actions. | ODMG:Animations fallback loop |
| PASS | `audio:movement-cues` | Movement audio cues are mapped. | Ejector reeling/orbit handlers |
| PASS | `audit-tool:semantic-coverage` | The existing audit validates the slide handoff semantically. | tools/port-audit.ps1 |
| PASS | `cleanup:release-state` | ClearPhysics clears release state. | Movement:ClearPhysics |
| PASS | `effect:asset-MovementParticle` | MovementParticle exists or is explicitly mapped to Scarlet's GasPart emitters. | scarlet.rbxl string inventory; a newer unsaved Studio place must be checked separately |
| PASS | `effect:asset-SlideParticle` | SlideParticle exists or is explicitly mapped to Scarlet's GasPart emitters. | scarlet.rbxl string inventory; a newer unsaved Studio place must be checked separately |
| PASS | `input:boost-goal-gate` | Boost activation is scoped to an active grapple goal. | ODMG:InputConnections and Ejector onGearGoalStepped |
| PASS | `input:toggle-settings` | Toggle input modes are supported. | Ejector/Winches keybind setup |
| PASS | `legacy:dead-momentum` | Dead legacy momentum work is removed. | ODMG:CoreStep |
| PASS | `legacy:ground-dash` | Legacy ground Dash input is removed or explicitly isolated. | ODMG:InputConnections/ODMG:Dash |
| PASS | `movement:runtime-guards` | Current Requiem movement guards are represented. | Ejector.onGearGoalStepped/onBeginSimulatedMomentum |
| PASS | `orbit:turn-response` | Orbit turn-response curve matches current Requiem. | Ejector lines 968-973 versus Movement lines 619-621 |
| PASS | `player-slide:2024-contract` | PlayerSlide contains the 2024 lifecycle contracts. | ClientSlideMovement.ts versus Movement/PlayerSlide.luau |
| PASS | `player-slide:key-release` | LeftControl release does not cancel the 2024 slide. | ODMG/init.luau and ClientSlideMovement.slide |
| PASS | `raycast:respect-can-collide` | Raycast query semantics match Requiem. | Movement/WallInteraction/PlayerSlide raycast parameters |
| PASS | `release:collision-group` | Release Spherecast uses the Universal collision group. | Movement:_stepRelease |
| PASS | `release:gravity-tween` | Low-speed release tween is present. | Ejector.onBeginSimulatedMomentum versus Movement:_beginRelease |
| PASS | `slide:coast-physics` | Slide coast physics exist in the implementation module. | Movement/Sliding.luau |
| PASS | `slide:instant-stop` | Instant-stop input is connected. | CharacterMovementRunner.onInstantStop |
| PASS | `slide:launch-effects` | Point launch includes animation/effect ownership. | CharacterMovementRunner.onPointLaunch versus Movement/Sliding.luau::_tryLaunch |
| PASS | `slide:not-dead-code` | Sliding.luau is instantiated. | Movement/init.luau imports |
| PASS | `slide:release-preserves-state` | Release preserves the slide state long enough for the coast solver to take ownership. | Movement/init.luau::_beginRelease |
| PASS | `slide:runtime-handoff` | Momentum slide is wired into the active movement state machine. | Movement/init.luau versus Movement/Sliding.luau and CharacterMovementRunner.onSlideStateChanged |
| PASS | `slide:status-effects` | Slide status effects are represented. | CharacterMovementRunner.onSlideStateChanged |
| PASS | `states:conflict-arbitration` | Movement states are bridged into Scarlet state leases. | Movement:SetSlidingState/SetWallState and Requiem ClientStateHandler |
| PASS | `wall-hang:ray-grid` | Wall-hang ray grid matches Raycast.checkForWallInfront. | WallInteraction:_scanHangWall versus Common/Utilities/Raycast.luau |