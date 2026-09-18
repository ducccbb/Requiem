# Titan Deep Audit

- CRITICAL: 0
- HIGH: 0
- MEDIUM: 0
- LOW: 0
- INFO: 0
- PASS: 165

| Severity | Area | Check | Finding | Evidence |
|---|---|---|---|---|
| PASS | Inventory | `utility:file:AnimationTitanClient` | Scarlet utility AnimationTitanClient exists. | D:\scarlet\src\StarterPlayer\StarterPlayerScripts\Framework\Modules\Titans\Utilities\AnimationTitanClient.luau |
| PASS | Inventory | `utility:file:CooldownTitanClient` | Scarlet utility CooldownTitanClient exists. | D:\scarlet\src\StarterPlayer\StarterPlayerScripts\Framework\Modules\Titans\Utilities\CooldownTitanClient.luau |
| PASS | Inventory | `utility:file:DetectionBoxTitanClient` | Scarlet utility DetectionBoxTitanClient exists. | D:\scarlet\src\StarterPlayer\StarterPlayerScripts\Framework\Modules\Titans\Utilities\DetectionBoxTitanClient.luau |
| PASS | Inventory | `utility:file:GrabTitanClient` | Scarlet utility GrabTitanClient exists. | D:\scarlet\src\StarterPlayer\StarterPlayerScripts\Framework\Modules\Titans\Utilities\GrabTitanClient.luau |
| PASS | Inventory | `utility:file:HitboxTitanClient` | Scarlet utility HitboxTitanClient exists. | D:\scarlet\src\StarterPlayer\StarterPlayerScripts\Framework\Modules\Titans\Utilities\HitboxTitanClient.luau |
| PASS | Inventory | `utility:file:KinematicTitanClient` | Scarlet utility KinematicTitanClient exists. | D:\scarlet\src\StarterPlayer\StarterPlayerScripts\Framework\Modules\Titans\Utilities\KinematicTitanClient.luau |
| PASS | Inventory | `utility:file:ModelTitanClient` | Scarlet utility ModelTitanClient exists. | D:\scarlet\src\StarterPlayer\StarterPlayerScripts\Framework\Modules\Titans\Utilities\ModelTitanClient.luau |
| PASS | Inventory | `utility:file:NapeProtectionTitanClient` | Scarlet utility NapeProtectionTitanClient exists. | D:\scarlet\src\StarterPlayer\StarterPlayerScripts\Framework\Modules\Titans\Utilities\NapeProtectionTitanClient.luau |
| PASS | Inventory | `utility:file:TitanClientProximity` | Scarlet utility TitanClientProximity exists. | D:\scarlet\src\StarterPlayer\StarterPlayerScripts\Framework\Modules\Titans\Utilities\TitanClientProximity.luau |
| PASS | Inventory | `utility:file:TitanCoreActionClient` | Scarlet utility TitanCoreActionClient exists. | D:\scarlet\src\StarterPlayer\StarterPlayerScripts\Framework\Modules\Titans\Utilities\TitanCoreActionClient.luau |
| PASS | Inventory | `utility:file:TitanProtectiveNapeClient` | Scarlet utility TitanProtectiveNapeClient exists. | D:\scarlet\src\StarterPlayer\StarterPlayerScripts\Framework\Modules\Titans\Utilities\TitanProtectiveNapeClient.luau |
| PASS | Bootstrap | `bootstrap:titans-runtime-module` | Titans registers Runtime as a dependency and resolves it through Scarlet GetModules() at Start. | Server Titans:init.luau/Distributor |
| PASS | Runtime | `runtime:reaction-validator-api` | Runtime server exposes RegisterReactionValidator. | Runtime:init.luau |
| PASS | Runtime | `runtime:ragdoll-adapter` | Runtime RagdollService adapts Scarlet character leases through Acquire/Release. | Runtime/RagdollService.luau |
| PASS | Detection | `detection:gear-facade` | Detection uses Runtime.Gear facade. | DetectionBoxTitanClient |
| PASS | Detection | `detection:asset-layout` | Detection resolver supports Scarlet sibling-reference layout. | DetectionBoxTitanClient:findDetectionRoot/bakeDetectionBoxes |
| PASS | Detection | `detection:reeling` | Reeling + goal prediction branch exists. | DetectionBoxTitanClient:predictPosition |
| PASS | Detection | `detection:prediction` | Curved and gear prediction exists. | DetectionBoxTitanClient |
| PASS | Detection | `detection:gear-modes` | Detection distinguishes linear, reeling-goal and orbit prediction modes. | DetectionBoxTitanClient:predictPosition |
| PASS | Detection | `detection:batch` | Prediction calls use a batch window. | DetectionBoxTitanClient:impactWindow |
| PASS | Detection | `detection:frame-cache` | Frame cache exists. | DetectionBoxTitanClient |
| PASS | Prediction | `prediction:shared-frame-cache` | Prediction cache survives EndBatch and is cleared by the next movement sample. | CharacterPredictionRunner:EndBatch/_sample |
| PASS | Detection | `detection:debug` | Debug detection box visualization exists. | DetectionBoxTitanClient |
| PASS | Rig | `rig:point-no-body-fallback` | Nape/Eyes/Mouth require their named point and cannot fall back to Head. | Shared Titans/RigMap.luau |
| PASS | Hitbox | `hitbox:touched` | Limb hitbox uses .Touched. | HitboxTitanClient:createLimbHitbox |
| PASS | Hitbox | `hitbox:weld` | Limb hitbox is welded to animated limb. | HitboxTitanClient:createLimbHitbox |
| PASS | Hitbox | `hitbox:can-touch` | CanTouch is enabled/leased for active hitbox. | HitboxTitanClient:createLimbHitbox |
| PASS | Hitbox | `hitbox:local-character-filter` | Touched events are restricted to known local-character body parts. | HitboxTitanClient:createLimbHitbox |
| PASS | Hitbox | `hitbox:delay` | Delayed activation exists. | HitboxTitanClient:createLimbHitbox |
| PASS | Hitbox | `hitbox:priority` | Priority limb override exists. | HitboxTitanClient:createLimbHitbox |
| PASS | Hitbox | `hitbox:no-overlap` | Limb hitbox keeps Requiem Touched detection; overlap is only a start-overlap fallback. | HitboxTitanClient:createLimbHitbox |
| PASS | Hitbox | `hitbox:cleanup` | Hitbox listener cleanup is visible. | HitboxTitanClient |
| PASS | Hitbox | `hitbox:runner-ownership` | Hitbox runner disconnects only the RenderStepped connection it still owns. | HitboxTitanClient:ensureRunner |
| PASS | Hitbox | `hitbox:wire-resistance` | Wire resistance, excess resistance and effect branch exists. | HitboxTitanClient:createLimbHitbox |
| PASS | Grab | `grab:kinematic-source-contract` | Normal Requiem grab does not require createKinematicInfluence; animated limb + physical hitbox is the source contract. | Requiem Default grab actions |
| PASS | Grab | `grab:hitbox-chain` | Grab action creates limb hitbox. | CommonAction:createGrab |
| PASS | Grab | `grab:cleanup` | Grab resources are bound to cleanup. | CommonAction:createGrab |
| PASS | Grab | `grab:client-state` | Client grab state and gear cleanup exist. | GrabTitanClient |
| PASS | Grab | `grab:server-lifecycle` | Server grab lifecycle cleanup exists. | RequiemActions |
| PASS | Grab | `grab:target-ownership` | Grab ownership is target-centric and cleans on PlayerRemoving. | RequiemActions:grab/cleanupGrab |
| PASS | Protocol | `protocol:response` | Action response boundary exists. | Protocol |
| PASS | Protocol | `protocol:epoch` | Action response is epoch-bound. | Protocol |
| PASS | Protocol | `protocol:target` | Target ownership validation exists. | Protocol |
| PASS | Protocol | `protocol:response-target` | Action response is bound to the committed target user. | Protocol:_onActionIntent/_onActionResponse |
| PASS | Protocol | `protocol:physical-fallback` | Physical response rejects unmatched limb fallback. | RequiemActions:physicalResponseValid |
| PASS | Protocol | `protocol:rig-physical-part` | Server physical validation resolves canonical rig points to BaseParts through RigMap. | RequiemActions:physicalPart/physicalResponseValid |
| PASS | Protocol | `protocol:response-consume-order` | Response epoch is consumed only after handler acceptance. | Protocol:_onActionResponse |
| PASS | Model | `model:visual-policy` | Scarlet visual preparation policy exists. | ModelTitanClient |
| PASS | Model | `model:wire-query` | Animated visual remains queryable for wire raycasts. | ModelTitanClient:prepareVisual |
| PASS | Model | `model:root-policy` | Root transform clamp policy exists and must be action-gated. | ModelTitanClient |
| PASS | Kinematic | `kinematic:ik` | Generic IK influence exists. | KinematicTitanClient |
| PASS | Kinematic | `kinematic:easing` | IK easing lifecycle exists. | KinematicTitanClient |
| PASS | Kinematic | `kinematic:restore` | Motor/origin cleanup exists. | KinematicTitanClient |
| PASS | Kinematic | `kinematic:chain` | IK chain guards exist. | KinematicTitanClient |
| PASS | Prediction | `prediction:requiem-curve` | Prediction runner has Requiem-style angular/curve analysis and fixed-step integration. | CharacterPredictionRunner |
| PASS | Kinematic | `kinematic:lookat-defaults` | LookAt uses Requiem SmoothTime defaults. | KinematicTitanClient:createLookAtInfluence |
| PASS | Kinematic | `kinematic:bite-ik-defaults` | Bite IK uses Requiem easing defaults. | KinematicTitanClient:createBiteIKInfluence |
| PASS | Core | `core:cooldown` | Core reaction cooldown exists. | TitanCoreActionClient |
| PASS | Core | `core:cleanup` | Core cooldown is independent from animation cleanup. | TitanCoreActionClient:markCoreReactionStarted |
| PASS | Core | `core:classification` | Core/reaction classification exists. | TitanCoreActionClient |
| PASS | Animation | `animation:length` | Animation length/speed contract exists. | AnimationTitanClient |
| PASS | Animation | `animation:jump-markers` | GrappleJumpShake binds Up/Down keyframes through the returned AnimationTrack. | GrappleJumpShake |
| PASS | Hitbox | `wire:raycast` | Wire-swat has a raycast path. | HitboxTitanClient:createLimbHitbox |
| PASS | Effects | `wire:sounds` | Wire-swat sounds are mapped. | HitboxTitanClient:createLimbHitbox |
| PASS | Effects | `wire:sound-timing` | Wire-swat fade/volume/playback timing matches Requiem through Scarlet Effects. | HitboxTitanClient/EffectsRuntime |
| PASS | Hitbox | `mouth:async-signal-lifecycle` | Mouth hitbox fires the response before optional record cleanup and remains lifecycle-bound. | HitboxTitanClient:createMouthHitbox/Shared Signal |
| PASS | Animation | `animation:eaten-contract` | Eaten player reaction animation is present in the shared animation contract. | Shared Titans Animations/DefaultTitanChewing |
| PASS | Effects | `wire:monologue` | Wire-swat monologue branch exists. | HitboxTitanClient:createLimbHitbox |
| PASS | Actions | `action:long-ground-crush-ragdoll` | LongRangeAttackGround crush uses a 5-second default ragdoll. | CommonAction:createBothArmAttack |
| PASS | Actions | `action:jump-shake-ragdoll` | GrappleJumpShake landing uses a 5-second ragdoll. | GrappleJumpShake |
| PASS | Cooldown | `cooldown:shared-clock` | Cooldown uses shared clock contract. | CooldownTitanClient |
| PASS | Lifecycle | `lifecycle:registry-cleanup` | Titan registry cleanup hook exists. | ClientTitanRegistry |
| PASS | Protocol | `lifecycle:target-client-owner` | Only the authoritative target client runs the local Titan action chooser. | ClientTitanRegistry/RequiemClient |
| PASS | Lifecycle | `lifecycle:scheduler-batch` | Scheduler has prediction/step batch contract. | TitanScheduler |
| PASS | Lifecycle | `lifecycle:kinematic-clear` | Client Titan lifecycle has kinematic cleanup path. | Titans client init |
| PASS | Lifecycle | `lifecycle:no-dual-normal-registry` | Normal/Default Titans are exclusively owned by the Requiem runtime when enabled. | Titans client init:handledByRequiemRuntime |
| PASS | Inventory | `inventory:default-actions` | All 30 Requiem Default action paths are present. | Requiem Default Actions vs Scarlet Default Actions |
| PASS | Actions | `action:detection:anger-longrangeattackair-luau` | Detection box/impactAt matches Requiem for Anger/LongRangeAttackAir.luau. | Anger/LongRangeAttackAir.luau |
| PASS | Actions | `action:detection-fields:anger-longrangeattackair-luau` | Detection tuning fields match Requiem for Anger/LongRangeAttackAir.luau. | Anger/LongRangeAttackAir.luau |
| PASS | Actions | `action:cooldown:anger-longrangeattackair-luau` | Primary cooldown matches Requiem for Anger/LongRangeAttackAir.luau. | Anger/LongRangeAttackAir.luau |
| PASS | Actions | `action:chance:anger-longrangeattackair-luau` | Random selection/rejection threshold matches Requiem for Anger/LongRangeAttackAir.luau. | Anger/LongRangeAttackAir.luau |
| PASS | Actions | `action:detection:anger-longrangeattackground-luau` | Detection box/impactAt matches Requiem for Anger/LongRangeAttackGround.luau. | Anger/LongRangeAttackGround.luau |
| PASS | Actions | `action:detection-fields:anger-longrangeattackground-luau` | Detection tuning fields match Requiem for Anger/LongRangeAttackGround.luau. | Anger/LongRangeAttackGround.luau |
| PASS | Actions | `action:cooldown:anger-longrangeattackground-luau` | Primary cooldown matches Requiem for Anger/LongRangeAttackGround.luau. | Anger/LongRangeAttackGround.luau |
| PASS | Actions | `action:chance:anger-longrangeattackground-luau` | Random selection/rejection threshold matches Requiem for Anger/LongRangeAttackGround.luau. | Anger/LongRangeAttackGround.luau |
| PASS | Actions | `action:detection:anger-longrangebite-luau` | Detection box/impactAt matches Requiem for Anger/LongRangeBite.luau. | Anger/LongRangeBite.luau |
| PASS | Actions | `action:detection-fields:anger-longrangebite-luau` | Detection tuning fields match Requiem for Anger/LongRangeBite.luau. | Anger/LongRangeBite.luau |
| PASS | Actions | `action:cooldown:anger-longrangebite-luau` | Primary cooldown matches Requiem for Anger/LongRangeBite.luau. | Anger/LongRangeBite.luau |
| PASS | Actions | `action:chance:anger-longrangebite-luau` | Random selection/rejection threshold matches Requiem for Anger/LongRangeBite.luau. | Anger/LongRangeBite.luau |
| PASS | Actions | `action:detection:anger-mediumrangebite-luau` | Detection box/impactAt matches Requiem for Anger/MediumRangeBite.luau. | Anger/MediumRangeBite.luau |
| PASS | Actions | `action:detection-fields:anger-mediumrangebite-luau` | Detection tuning fields match Requiem for Anger/MediumRangeBite.luau. | Anger/MediumRangeBite.luau |
| PASS | Actions | `action:cooldown:anger-mediumrangebite-luau` | Primary cooldown matches Requiem for Anger/MediumRangeBite.luau. | Anger/MediumRangeBite.luau |
| PASS | Actions | `action:chance:anger-mediumrangebite-luau` | Random selection/rejection threshold matches Requiem for Anger/MediumRangeBite.luau. | Anger/MediumRangeBite.luau |
| PASS | Actions | `action:detection:default-angrystomp-luau` | Detection box/impactAt matches Requiem for Default/AngryStomp.luau. | Default/AngryStomp.luau |
| PASS | Actions | `action:detection-fields:default-angrystomp-luau` | Detection tuning fields match Requiem for Default/AngryStomp.luau. | Default/AngryStomp.luau |
| PASS | Actions | `action:cooldown:default-angrystomp-luau` | Primary cooldown matches Requiem for Default/AngryStomp.luau. | Default/AngryStomp.luau |
| PASS | Actions | `action:detection:default-backgrab-luau` | Detection box/impactAt matches Requiem for Default/BackGrab.luau. | Default/BackGrab.luau |
| PASS | Actions | `action:detection-fields:default-backgrab-luau` | Detection tuning fields match Requiem for Default/BackGrab.luau. | Default/BackGrab.luau |
| PASS | Actions | `action:cooldown:default-backgrab-luau` | Primary cooldown matches Requiem for Default/BackGrab.luau. | Default/BackGrab.luau |
| PASS | Actions | `action:cooldown:default-eyegrabattack-luau` | Primary cooldown matches Requiem for Default/EyeGrabAttack.luau. | Default/EyeGrabAttack.luau |
| PASS | Actions | `action:detection:default-longrangeabovegrab-luau` | Detection box/impactAt matches Requiem for Default/LongRangeAboveGrab.luau. | Default/LongRangeAboveGrab.luau |
| PASS | Actions | `action:detection-fields:default-longrangeabovegrab-luau` | Detection tuning fields match Requiem for Default/LongRangeAboveGrab.luau. | Default/LongRangeAboveGrab.luau |
| PASS | Actions | `action:cooldown:default-longrangeabovegrab-luau` | Primary cooldown matches Requiem for Default/LongRangeAboveGrab.luau. | Default/LongRangeAboveGrab.luau |
| PASS | Actions | `action:detection:default-longrangegrab-luau` | Detection box/impactAt matches Requiem for Default/LongRangeGrab.luau. | Default/LongRangeGrab.luau |
| PASS | Actions | `action:detection-fields:default-longrangegrab-luau` | Detection tuning fields match Requiem for Default/LongRangeGrab.luau. | Default/LongRangeGrab.luau |
| PASS | Actions | `action:cooldown:default-longrangegrab-luau` | Primary cooldown matches Requiem for Default/LongRangeGrab.luau. | Default/LongRangeGrab.luau |
| PASS | Actions | `action:chance:default-longrangegrab-luau` | Random selection/rejection threshold matches Requiem for Default/LongRangeGrab.luau. | Default/LongRangeGrab.luau |
| PASS | Actions | `action:detection:default-longrangekick-luau` | Detection box/impactAt matches Requiem for Default/LongRangeKick.luau. | Default/LongRangeKick.luau |
| PASS | Actions | `action:detection-fields:default-longrangekick-luau` | Detection tuning fields match Requiem for Default/LongRangeKick.luau. | Default/LongRangeKick.luau |
| PASS | Actions | `action:cooldown:default-longrangekick-luau` | Primary cooldown matches Requiem for Default/LongRangeKick.luau. | Default/LongRangeKick.luau |
| PASS | Actions | `action:chance:default-longrangekick-luau` | Random selection/rejection threshold matches Requiem for Default/LongRangeKick.luau. | Default/LongRangeKick.luau |
| PASS | Actions | `action:detection:default-mediumrangegrab-luau` | Detection box/impactAt matches Requiem for Default/MediumRangeGrab.luau. | Default/MediumRangeGrab.luau |
| PASS | Actions | `action:detection-fields:default-mediumrangegrab-luau` | Detection tuning fields match Requiem for Default/MediumRangeGrab.luau. | Default/MediumRangeGrab.luau |
| PASS | Actions | `action:cooldown:default-mediumrangegrab-luau` | Primary cooldown matches Requiem for Default/MediumRangeGrab.luau. | Default/MediumRangeGrab.luau |
| PASS | Actions | `action:detection:default-mediumrangekick-luau` | Detection box/impactAt matches Requiem for Default/MediumRangeKick.luau. | Default/MediumRangeKick.luau |
| PASS | Actions | `action:detection-fields:default-mediumrangekick-luau` | Detection tuning fields match Requiem for Default/MediumRangeKick.luau. | Default/MediumRangeKick.luau |
| PASS | Actions | `action:cooldown:default-mediumrangekick-luau` | Primary cooldown matches Requiem for Default/MediumRangeKick.luau. | Default/MediumRangeKick.luau |
| PASS | Actions | `action:cooldown:default-napegrabattack-luau` | Primary cooldown matches Requiem for Default/NapeGrabAttack.luau. | Default/NapeGrabAttack.luau |
| PASS | Actions | `action:cooldown:default-napegrabswats-luau` | Primary cooldown matches Requiem for Default/NapeGrabSwats.luau. | Default/NapeGrabSwats.luau |
| PASS | Actions | `action:chance:default-napegrabswats-luau` | Random selection/rejection threshold matches Requiem for Default/NapeGrabSwats.luau. | Default/NapeGrabSwats.luau |
| PASS | Actions | `action:detection:default-shortrangeattackground-luau` | Detection box/impactAt matches Requiem for Default/ShortRangeAttackGround.luau. | Default/ShortRangeAttackGround.luau |
| PASS | Actions | `action:detection-fields:default-shortrangeattackground-luau` | Detection tuning fields match Requiem for Default/ShortRangeAttackGround.luau. | Default/ShortRangeAttackGround.luau |
| PASS | Actions | `action:cooldown:default-shortrangeattackground-luau` | Primary cooldown matches Requiem for Default/ShortRangeAttackGround.luau. | Default/ShortRangeAttackGround.luau |
| PASS | Actions | `action:chance:default-shortrangeattackground-luau` | Random selection/rejection threshold matches Requiem for Default/ShortRangeAttackGround.luau. | Default/ShortRangeAttackGround.luau |
| PASS | Actions | `action:detection:default-shortrangefrontarmgrab-luau` | Detection box/impactAt matches Requiem for Default/ShortRangeFrontArmGrab.luau. | Default/ShortRangeFrontArmGrab.luau |
| PASS | Actions | `action:detection-fields:default-shortrangefrontarmgrab-luau` | Detection tuning fields match Requiem for Default/ShortRangeFrontArmGrab.luau. | Default/ShortRangeFrontArmGrab.luau |
| PASS | Actions | `action:cooldown:default-shortrangefrontarmgrab-luau` | Primary cooldown matches Requiem for Default/ShortRangeFrontArmGrab.luau. | Default/ShortRangeFrontArmGrab.luau |
| PASS | Actions | `action:detection:default-shortrangegrab-luau` | Detection box/impactAt matches Requiem for Default/ShortRangeGrab.luau. | Default/ShortRangeGrab.luau |
| PASS | Actions | `action:detection-fields:default-shortrangegrab-luau` | Detection tuning fields match Requiem for Default/ShortRangeGrab.luau. | Default/ShortRangeGrab.luau |
| PASS | Actions | `action:cooldown:default-shortrangegrab-luau` | Primary cooldown matches Requiem for Default/ShortRangeGrab.luau. | Default/ShortRangeGrab.luau |
| PASS | Actions | `action:detection:default-shortrangegrableg-luau` | Detection box/impactAt matches Requiem for Default/ShortRangeGrabLeg.luau. | Default/ShortRangeGrabLeg.luau |
| PASS | Actions | `action:detection-fields:default-shortrangegrableg-luau` | Detection tuning fields match Requiem for Default/ShortRangeGrabLeg.luau. | Default/ShortRangeGrabLeg.luau |
| PASS | Actions | `action:cooldown:default-shortrangegrableg-luau` | Primary cooldown matches Requiem for Default/ShortRangeGrabLeg.luau. | Default/ShortRangeGrabLeg.luau |
| PASS | Actions | `action:detection:default-shortrangeswat-luau` | Detection box/impactAt matches Requiem for Default/ShortRangeSwat.luau. | Default/ShortRangeSwat.luau |
| PASS | Actions | `action:detection-fields:default-shortrangeswat-luau` | Detection tuning fields match Requiem for Default/ShortRangeSwat.luau. | Default/ShortRangeSwat.luau |
| PASS | Actions | `action:cooldown:default-shortrangeswat-luau` | Primary cooldown matches Requiem for Default/ShortRangeSwat.luau. | Default/ShortRangeSwat.luau |
| PASS | Actions | `action:detection:default-sidewaysgrab-luau` | Detection box/impactAt matches Requiem for Default/SidewaysGrab.luau. | Default/SidewaysGrab.luau |
| PASS | Actions | `action:detection-fields:default-sidewaysgrab-luau` | Detection tuning fields match Requiem for Default/SidewaysGrab.luau. | Default/SidewaysGrab.luau |
| PASS | Actions | `action:cooldown:default-sidewaysgrab-luau` | Primary cooldown matches Requiem for Default/SidewaysGrab.luau. | Default/SidewaysGrab.luau |
| PASS | Actions | `action:detection:default-widerangegrab-luau` | Detection box/impactAt matches Requiem for Default/WideRangeGrab.luau. | Default/WideRangeGrab.luau |
| PASS | Actions | `action:detection-fields:default-widerangegrab-luau` | Detection tuning fields match Requiem for Default/WideRangeGrab.luau. | Default/WideRangeGrab.luau |
| PASS | Actions | `action:cooldown:default-widerangegrab-luau` | Primary cooldown matches Requiem for Default/WideRangeGrab.luau. | Default/WideRangeGrab.luau |
| PASS | Actions | `action:chance:default-widerangegrab-luau` | Random selection/rejection threshold matches Requiem for Default/WideRangeGrab.luau. | Default/WideRangeGrab.luau |
| PASS | Actions | `action:detection:idiocy-mediumrangeattackground-luau` | Detection box/impactAt matches Requiem for Idiocy/MediumRangeAttackGround.luau. | Idiocy/MediumRangeAttackGround.luau |
| PASS | Actions | `action:detection-fields:idiocy-mediumrangeattackground-luau` | Detection tuning fields match Requiem for Idiocy/MediumRangeAttackGround.luau. | Idiocy/MediumRangeAttackGround.luau |
| PASS | Actions | `action:cooldown:idiocy-mediumrangeattackground-luau` | Primary cooldown matches Requiem for Idiocy/MediumRangeAttackGround.luau. | Idiocy/MediumRangeAttackGround.luau |
| PASS | Kinematic | `action:long-bite-aim-lifetime` | LongRangeBite aim lifetime uses Requiem 0.833/animationSpeed timing. | LongRangeBite/CommonAction:createBite |
| PASS | Effects | `action:sound-policy:anger-longrangeattackair-luau` | Movement sound policy matches Requiem for Anger/LongRangeAttackAir.luau. | Anger/LongRangeAttackAir.luau |
| PASS | Effects | `action:sound-policy:anger-longrangeattackground-luau` | Movement sound policy matches Requiem for Anger/LongRangeAttackGround.luau. | Anger/LongRangeAttackGround.luau |
| PASS | Effects | `action:sound-policy:default-backgrab-luau` | Movement sound policy matches Requiem for Default/BackGrab.luau. | Default/BackGrab.luau |
| PASS | Effects | `action:sound-policy:default-defaulttitanblinded-luau` | Movement sound policy matches Requiem for Default/DefaultTitanBlinded.luau. | Default/DefaultTitanBlinded.luau |
| PASS | Effects | `action:sound-policy:default-eyegrabattack-luau` | Movement sound policy matches Requiem for Default/EyeGrabAttack.luau. | Default/EyeGrabAttack.luau |
| PASS | Effects | `action:sound-policy:default-grapplejumpshake-luau` | Movement sound policy matches Requiem for Default/GrappleJumpShake.luau. | Default/GrappleJumpShake.luau |
| PASS | Effects | `action:sound-policy:default-longrangeabovegrab-luau` | Movement sound policy matches Requiem for Default/LongRangeAboveGrab.luau. | Default/LongRangeAboveGrab.luau |
| PASS | Effects | `action:sound-policy:default-longrangegrab-luau` | Movement sound policy matches Requiem for Default/LongRangeGrab.luau. | Default/LongRangeGrab.luau |
| PASS | Effects | `action:sound-policy:default-mediumrangegrab-luau` | Movement sound policy matches Requiem for Default/MediumRangeGrab.luau. | Default/MediumRangeGrab.luau |
| PASS | Effects | `action:sound-policy:default-napegrabattack-luau` | Movement sound policy matches Requiem for Default/NapeGrabAttack.luau. | Default/NapeGrabAttack.luau |
| PASS | Effects | `action:sound-policy:default-shortrangeattackground-luau` | Movement sound policy matches Requiem for Default/ShortRangeAttackGround.luau. | Default/ShortRangeAttackGround.luau |
| PASS | Effects | `action:sound-policy:default-shortrangefrontarmgrab-luau` | Movement sound policy matches Requiem for Default/ShortRangeFrontArmGrab.luau. | Default/ShortRangeFrontArmGrab.luau |
| PASS | Effects | `action:sound-policy:default-shortrangegrab-luau` | Movement sound policy matches Requiem for Default/ShortRangeGrab.luau. | Default/ShortRangeGrab.luau |
| PASS | Effects | `action:sound-policy:default-shortrangegrableg-luau` | Movement sound policy matches Requiem for Default/ShortRangeGrabLeg.luau. | Default/ShortRangeGrabLeg.luau |
| PASS | Effects | `action:sound-policy:default-shortrangeswat-luau` | Movement sound policy matches Requiem for Default/ShortRangeSwat.luau. | Default/ShortRangeSwat.luau |
| PASS | Effects | `action:sound-policy:default-sidewaysgrab-luau` | Movement sound policy matches Requiem for Default/SidewaysGrab.luau. | Default/SidewaysGrab.luau |
| PASS | Effects | `action:sound-policy:default-widerangegrab-luau` | Movement sound policy matches Requiem for Default/WideRangeGrab.luau. | Default/WideRangeGrab.luau |
| PASS | Effects | `action:sound-policy:idiocy-mediumrangeattackground-luau` | Movement sound policy matches Requiem for Idiocy/MediumRangeAttackGround.luau. | Idiocy/MediumRangeAttackGround.luau |
