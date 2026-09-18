# Scarlet Port Audit

- Area: Gear
- PASS: 66
- ERROR: 0
- INFO: 0

| Result | Area | Check | Detail |
|---|---|---|---|
| PASS | Gear | `file:src/StarterPlayer/StarterPlayerScripts/Framework/Modules/ODMG/Movement/init.luau` | File exists. |
| PASS | Gear | `file:src/StarterPlayer/StarterPlayerScripts/Framework/Modules/ODMG/Movement/Constants.luau` | File exists. |
| PASS | Gear | `file:src/StarterPlayer/StarterPlayerScripts/Framework/Modules/ODMG/Movement/Slacking.luau` | File exists. |
| PASS | Gear | `file:src/StarterPlayer/StarterPlayerScripts/Framework/Modules/ODMG/Movement/WallInteraction.luau` | File exists. |
| PASS | Gear | `file:src/StarterPlayer/StarterPlayerScripts/Framework/Modules/ODMG/Movement/PlayerSlide.luau` | File exists. |
| PASS | Gear | `file:src/StarterPlayer/StarterPlayerScripts/Framework/Modules/ODMG/Movement/Sliding.luau` | File exists. |
| PASS | Gear | `file:src/StarterPlayer/StarterPlayerScripts/Framework/Modules/ODMG/Grapples.luau` | File exists. |
| PASS | Gear | `file:src/StarterPlayer/StarterPlayerScripts/Framework/Modules/ODMG/init.luau` | File exists. |
| PASS | Gear | `file:src/StarterPlayer/StarterPlayerScripts/Framework/Modules/Runtime/GearRuntime.luau` | File exists. |
| PASS | Gear | `file:src/ServerScriptService/Framework/Modules/Individual/Data/Default.luau` | File exists. |
| PASS | Gear | `file:src/ReplicatedStorage/Client/User/Equipment/Gear/Components/Ejector/Default.luau` | File exists. |
| PASS | Gear | `file:src/ReplicatedStorage/Client/User/Equipment/Gear/Components/Winches/Default.luau` | File exists. |
| PASS | Gear | `file:src/ReplicatedStorage/Client/User/Equipment/Gear/Components/Gyroscope/Default.luau` | File exists. |
| PASS | Gear | `file:src/ReplicatedStorage/Client/User/Equipment/Gear/Components/Housing/Default.luau` | File exists. |
| PASS | Gear | `pipeline:requiem-controller` | ODMG loads the Requiem movement controller. |
| PASS | Gear | `pipeline:requiem-step` | CoreStep delegates physics to Requiem movement. |
| PASS | Gear | `momentum-slide:module` | The current Requiem momentum-slide controller is loaded. |
| PASS | Gear | `momentum-slide:construct` | The momentum-slide controller is instantiated, not left as dead code. |
| PASS | Gear | `momentum-slide:handoff` | Final grapple release hands GearVelocity/GearGyro to the slide solver. |
| PASS | Gear | `momentum-slide:step` | The active scheduler steps coast momentum. |
| PASS | Gear | `momentum-slide:velocity` | Momentum slide owns dedicated coast velocity. |
| PASS | Gear | `momentum-slide:gyro` | Momentum slide owns dedicated coast orientation. |
| PASS | Gear | `state:grappling` | Grapple ownership is published to Scarlet States. |
| PASS | Gear | `state:sliding` | Slide ownership is published to Scarlet States. |
| PASS | Gear | `momentum-slide:release-order` | Release preserves SLIDING until coast physics captures the gear movers. |
| PASS | Gear | `pipeline:legacy-step` | Forbidden marker absent: Legacy Scarlet GearType movement is still active. |
| PASS | Gear | `gas:exact-call` | Requiem movement uses exact gas consumption without Scarlet double-throttling. |
| PASS | Gear | `gas:exact-api` | ODMG exposes exact gas consumption while retaining the legacy caller contract. |
| PASS | Gear | `runtime:reeling` | Runtime reeling is sourced from live movement state. |
| PASS | Gear | `runtime:slacking` | Runtime slacking is sourced from live movement state. |
| PASS | Gear | `runtime:snapshot` | GearRuntime exposes slacking without internal ODMG reads. |
| PASS | Gear | `constant:BASE_SPEED` | Requiem neutral constant BASE_SPEED is defined. |
| PASS | Gear | `constant:BASE_GAS_BOOST` | Requiem neutral constant BASE_GAS_BOOST is defined. |
| PASS | Gear | `constant:TOTAL_TIME_FOR_MAX_VELOCITY` | Requiem neutral constant TOTAL_TIME_FOR_MAX_VELOCITY is defined. |
| PASS | Gear | `constant:MAXIMUM_VELOCITY_MULTIPLIER` | Requiem neutral constant MAXIMUM_VELOCITY_MULTIPLIER is defined. |
| PASS | Gear | `constant:BASE_REEL_BOOST` | Requiem neutral constant BASE_REEL_BOOST is defined. |
| PASS | Gear | `constant:MAX_VELOCITY_REEL_BOOST` | Requiem neutral constant MAX_VELOCITY_REEL_BOOST is defined. |
| PASS | Gear | `movement:function Movement:SetReeling` | Movement contains function Movement:SetReeling. |
| PASS | Gear | `movement:function Movement:SetSlacking` | Movement contains function Movement:SetSlacking. |
| PASS | Gear | `movement:function Movement:_stepRelease` | Movement contains function Movement:_stepRelease. |
| PASS | Gear | `movement:function Movement:_applyGearVelocity` | Movement contains function Movement:_applyGearVelocity. |
| PASS | Gear | `movement:BodyVelocity` | Movement contains BodyVelocity. |
| PASS | Gear | `movement:BodyGyro` | Movement contains BodyGyro. |
| PASS | Gear | `slacking:constraint` | Slacking uses Requiem-style physical rope constraint. |
| PASS | Gear | `wall:run` | Wall-running entry logic exists. |
| PASS | Gear | `wall:hang` | Wall-hanging interaction exists. |
| PASS | Gear | `animation:movement-adapter` | Movement uses Scarlet's existing animation facade rather than a second animator stack. |
| PASS | Gear | `animation:slide` | Ground slide animation is restored from the Requiem grappling branch. |
| PASS | Gear | `animation:orbit` | Orbit action/idle animation transitions are restored. |
| PASS | Gear | `animation:wall` | Wall-run animation is bound to wall-run lifecycle. |
| PASS | Gear | `orbit:direct-input` | Orbit direction reads live A/D input like Requiem. |
| PASS | Gear | `orbit:vertical-input` | Requiem directional input keeps the S downward component. |
| PASS | Gear | `wall:space-input` | Wall-run uses Space input, not gas-boost state. |
| PASS | Gear | `release:slide-decay` | Release momentum includes Requiem's delayed slide-particle decay window. |
| PASS | Gear | `release:body-force` | Release momentum preserves Requiem low-speed gravity compensation. |
| PASS | Gear | `release:immediate-hook` | Final grapple release starts momentum at the goal=nil boundary. |
| PASS | Gear | `slide:controller` | LeftControl has the separate Requiem ClientSlideMovement controller. |
| PASS | Gear | `slide:ground-slope` | Player slide validates slope angle like Requiem. |
| PASS | Gear | `slide:obstacle` | Player slide cancels on the forward obstacle ray. |
| PASS | Gear | `slide:velocity` | Player slide starts with Requiem 1.3x horizontal momentum. |
| PASS | Gear | `slide:input-conflict` | LeftControl routes to player slide when no grapple goal exists. |
| PASS | Gear | `effects:grapple` | Normal grapple and gas boost particles are mutually exclusive. |
| PASS | Gear | `effects:slide` | Ground slide owns its particle lifecycle. |
| PASS | Gear | `conflict:slacking` | Slacking/wall/release branches clear conflicting gear effects. |
| PASS | Gear | `keybind:reeling` | Reeling defaults to Requiem LeftShift. |
| PASS | Gear | `keybind:slacking` | Slacking defaults to Requiem LeftControl. |