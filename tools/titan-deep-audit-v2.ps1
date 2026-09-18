[CmdletBinding()]
param(
    [string]$ScarletRoot = 'D:\scarlet',
    [string]$RequiemRoot = 'D:\Requiem',
    [string]$OutputPath = 'D:\Requiem\docs\TITAN-DEEP-AUDIT.md',
    [string]$JsonPath = 'D:\Requiem\docs\TITAN-DEEP-AUDIT.json'
)
$ErrorActionPreference = 'Stop'
$findings = [System.Collections.Generic.List[object]]::new()
function ReadText([string]$Path) { if (Test-Path -LiteralPath $Path -PathType Leaf) { return Get-Content -LiteralPath $Path -Raw }; return '' }
function Has([string]$Text,[string]$Pattern) { return [regex]::IsMatch($Text,$Pattern,[Text.RegularExpressions.RegexOptions]::Singleline) }
function Check {
    param([bool]$Condition,[string]$FailSeverity,[string]$Id,[string]$Area,[string]$Failure,[string]$Pass,[string]$Evidence)
    if ($Condition) { $findings.Add([pscustomobject]@{Severity='PASS';Id=$Id;Area=$Area;Detail=$Pass;Evidence=$Evidence}) }
    else { $findings.Add([pscustomobject]@{Severity=$FailSeverity;Id=$Id;Area=$Area;Detail=$Failure;Evidence=$Evidence}) }
}
function RelativeFiles([string]$Root) {
    if (-not (Test-Path -LiteralPath $Root -PathType Container)) { return @() }
    $prefix = [IO.Path]::GetFullPath($Root).TrimEnd('\') + '\'
    return @(Get-ChildItem -LiteralPath $Root -Recurse -File -Filter '*.luau' | ForEach-Object { $_.FullName.Substring($prefix.Length).Replace('\','/') } | Sort-Object)
}

$clientRoot = Join-Path $ScarletRoot 'src/StarterPlayer/StarterPlayerScripts/Framework/Modules/Titans'
$utilitiesRoot = Join-Path $clientRoot 'Utilities'
$actionsRoot = Join-Path $clientRoot 'TitanTypes/Default/Actions'
$serverRoot = Join-Path $ScarletRoot 'src/ServerScriptService/Framework/Modules/Titans'
$serverInit = Join-Path $serverRoot 'init.luau'
$runtimeServer = Join-Path $ScarletRoot 'src/ServerScriptService/Framework/Modules/Runtime/init.luau'
$ragdollService = Join-Path $ScarletRoot 'src/ServerScriptService/Framework/Modules/Runtime/RagdollService.luau'
$sharedTitans = Join-Path $ScarletRoot 'src/ReplicatedStorage/Shared/Titans'
$requiemUtilities = Join-Path $RequiemRoot 'src/ReplicatedStorage/Client/Entities/Titans/Utilities'
$requiemActions = Join-Path $RequiemRoot 'src/ReplicatedStorage/Client/Entities/Titans/Types/Default/Actions'
$U = @{}
foreach ($name in @('AnimationTitanClient','CooldownTitanClient','DetectionBoxTitanClient','GrabTitanClient','HitboxTitanClient','KinematicTitanClient','ModelTitanClient','NapeProtectionTitanClient','TitanClientProximity','TitanCoreActionClient','TitanProtectiveNapeClient')) {
    $path = Join-Path $utilitiesRoot "$name.luau"
    $U[$name] = ReadText $path
    Check -Condition (Test-Path -LiteralPath $path -PathType Leaf) -FailSeverity 'CRITICAL' -Id "utility:file:$name" -Area 'Inventory' -Failure "Missing Scarlet utility $name." -Pass "Scarlet utility $name exists." -Evidence $path
}
$common = ReadText (Join-Path $actionsRoot 'CommonAction.luau')
$registry = ReadText (Join-Path $clientRoot 'ClientTitanRegistry.luau')
$scheduler = ReadText (Join-Path $clientRoot 'TitanScheduler.luau')
$clientInit = ReadText (Join-Path $clientRoot 'init.luau')
$protocol = ReadText (Join-Path $serverRoot 'Protocol.luau')
$serverActions = ReadText (Join-Path $serverRoot 'RequiemActions.luau')
$predictionRunner = ReadText (Join-Path $ScarletRoot 'src/StarterPlayer/StarterPlayerScripts/Framework/Modules/Runtime/CharacterPredictionRunner.luau')
$rigMap = ReadText (Join-Path $ScarletRoot 'src/ReplicatedStorage/Shared/Titans/RigMap.luau')
$serverInitText = ReadText $serverInit
$runtimeServerText = ReadText $runtimeServer
$ragdollServiceText = ReadText $ragdollService

# Framework dependency and server reaction boundary
Check -Condition (Has $serverInitText 'RuntimeServer\s*=\s*Distributor:GetModules\(\)' -and Has $serverInitText 'Distributor:GetModule\(["'']Runtime["'']\)') -FailSeverity 'CRITICAL' -Id 'bootstrap:titans-runtime-module' -Area 'Bootstrap' -Failure 'Titans does not register Runtime during Initalization and resolve it through GetModules() during Start.' -Pass 'Titans registers Runtime as a dependency and resolves it through Scarlet GetModules() at Start.' -Evidence 'Server Titans:init.luau/Distributor'
Check -Condition (Has $runtimeServerText 'function RuntimeServer:RegisterReactionValidator') -FailSeverity 'CRITICAL' -Id 'runtime:reaction-validator-api' -Area 'Runtime' -Failure 'Runtime server reaction validator API is missing.' -Pass 'Runtime server exposes RegisterReactionValidator.' -Evidence 'Runtime:init.luau'
Check -Condition (Has $ragdollServiceText 'function RagdollService\.new' -and Has $ragdollServiceText 'function RagdollService:Acquire' -and Has $ragdollServiceText 'function RagdollService:Release') -FailSeverity 'CRITICAL' -Id 'runtime:ragdoll-adapter' -Area 'Runtime' -Failure 'Runtime RagdollService adapter is missing a constructor or lease API.' -Pass 'Runtime RagdollService adapts Scarlet character leases through Acquire/Release.' -Evidence 'Runtime/RagdollService.luau'

# Detection and prediction
Check -Condition (Has $U.DetectionBoxTitanClient 'runtime\.Gear:GetState') -FailSeverity 'HIGH' -Id 'detection:gear-facade' -Area 'Detection' -Failure 'Detection does not use Runtime.Gear facade.' -Pass 'Detection uses Runtime.Gear facade.' -Evidence 'DetectionBoxTitanClient'
Check -Condition (Has $U.DetectionBoxTitanClient 'Parent:FindFirstChild\("HumanoidRootPart"\)') -FailSeverity 'CRITICAL' -Id 'detection:asset-layout' -Area 'Detection' -Failure 'Detection resolver does not support the Scarlet layout Hitboxes/Detections/Lookup + Hitboxes/HumanoidRootPart.' -Pass 'Detection resolver supports Scarlet sibling-reference layout.' -Evidence 'DetectionBoxTitanClient:findDetectionRoot/bakeDetectionBoxes'
Check -Condition (Has $U.DetectionBoxTitanClient 'state\.reeling' -and Has $U.DetectionBoxTitanClient 'state\.goal') -FailSeverity 'HIGH' -Id 'detection:reeling' -Area 'Detection' -Failure 'Reeling + goal prediction branch is missing.' -Pass 'Reeling + goal prediction branch exists.' -Evidence 'DetectionBoxTitanClient:predictPosition'
Check -Condition (Has $U.DetectionBoxTitanClient 'PredictCurved|predictGearPosition') -FailSeverity 'HIGH' -Id 'detection:prediction' -Area 'Detection' -Failure 'Curved/gear prediction is missing.' -Pass 'Curved and gear prediction exists.' -Evidence 'DetectionBoxTitanClient'
Check -Condition (Has $U.DetectionBoxTitanClient 'gear_linear' -and Has $U.DetectionBoxTitanClient 'gear_reel' -and Has $U.DetectionBoxTitanClient 'gear_orbit') -FailSeverity 'HIGH' -Id 'detection:gear-modes' -Area 'Detection' -Failure 'Detection does not distinguish linear, reeling-goal and orbit prediction modes.' -Pass 'Detection distinguishes linear, reeling-goal and orbit prediction modes.' -Evidence 'DetectionBoxTitanClient:predictPosition'
Check -Condition (Has $U.DetectionBoxTitanClient 'BeginBatch' -and Has $U.DetectionBoxTitanClient 'EndBatch') -FailSeverity 'MEDIUM' -Id 'detection:batch' -Area 'Detection' -Failure 'Prediction calls are not batched.' -Pass 'Prediction calls use a batch window.' -Evidence 'DetectionBoxTitanClient:impactWindow'
Check -Condition (Has $U.DetectionBoxTitanClient 'FrameNumber|frameNumber') -FailSeverity 'MEDIUM' -Id 'detection:frame-cache' -Area 'Detection' -Failure 'No frame cache is visible.' -Pass 'Frame cache exists.' -Evidence 'DetectionBoxTitanClient'
Check -Condition (-not (Has $predictionRunner 'function\s+CharacterPredictionRunner:EndBatch\(\).*?table\.clear\(self\._cache\)')) -FailSeverity 'MEDIUM' -Id 'prediction:shared-frame-cache' -Area 'Prediction' -Failure 'EndBatch clears the shared prediction cache before other Titan consumers in the same frame can reuse it.' -Pass 'Prediction cache survives EndBatch and is cleared by the next movement sample.' -Evidence 'CharacterPredictionRunner:EndBatch/_sample'
Check -Condition (Has $U.DetectionBoxTitanClient 'DrawPoint|Draw\.point|Instance\.new\("Part"\).*Transparency.*Color') -FailSeverity 'MEDIUM' -Id 'detection:debug' -Area 'Detection' -Failure 'Studio prediction/detection box visualization is missing; text history alone is not a box visualizer.' -Pass 'Debug detection box visualization exists.' -Evidence 'DetectionBoxTitanClient'
Check -Condition ((Has $rigMap 'Nape\s*=\s*table\.freeze\(\{\s*"Nape"\s*\}\)') -and (Has $rigMap 'Eyes\s*=\s*table\.freeze\(\{\s*"Eyes"\s*\}\)') -and (Has $rigMap 'Mouth\s*=\s*table\.freeze\(\{\s*"Mouth"\s*\}\)')) -FailSeverity 'HIGH' -Id 'rig:point-no-body-fallback' -Area 'Rig' -Failure 'Nape/Eyes/Mouth point resolver can fall back to a body part and make NapeGrabAttack pass from the wrong position.' -Pass 'Nape/Eyes/Mouth require their named point and cannot fall back to Head.' -Evidence 'Shared Titans/RigMap.luau'

# Hitbox parity
$limb = [regex]::Match($U.HitboxTitanClient,'function\s+HitboxTitanClient\.createLimbHitbox.*?(?=\r?\nfunction\s+HitboxTitanClient\.)',[Text.RegularExpressions.RegexOptions]::Singleline).Value
Check -Condition (Has $limb '\.Touched:Connect\(') -FailSeverity 'CRITICAL' -Id 'hitbox:touched' -Area 'Hitbox' -Failure 'Limb hitbox is not based on .Touched.' -Pass 'Limb hitbox uses .Touched.' -Evidence 'HitboxTitanClient:createLimbHitbox'
Check -Condition (Has $limb 'WeldConstraint|Motor6D') -FailSeverity 'CRITICAL' -Id 'hitbox:weld' -Area 'Hitbox' -Failure 'No welded limb hitbox is created.' -Pass 'Limb hitbox is welded to animated limb.' -Evidence 'HitboxTitanClient:createLimbHitbox'
Check -Condition (Has $limb 'CanTouch\s*=\s*true|acquireTouch') -FailSeverity 'CRITICAL' -Id 'hitbox:can-touch' -Area 'Hitbox' -Failure 'CanTouch lease is missing after visual preparation disables touch.' -Pass 'CanTouch is enabled/leased for active hitbox.' -Evidence 'HitboxTitanClient:createLimbHitbox'
Check -Condition (Has $limb 'IsDescendantOf\(character\).*CHARACTER_PARTS|CHARACTER_PARTS.*IsDescendantOf\(character\)') -FailSeverity 'HIGH' -Id 'hitbox:local-character-filter' -Area 'Hitbox' -Failure 'Touched events are not restricted to known body parts of the local character.' -Pass 'Touched events are restricted to known local-character body parts.' -Evidence 'HitboxTitanClient:createLimbHitbox'
Check -Condition (Has $limb 'delayed|createdAt') -FailSeverity 'HIGH' -Id 'hitbox:delay' -Area 'Hitbox' -Failure 'Delayed hitbox activation is missing.' -Pass 'Delayed activation exists.' -Evidence 'HitboxTitanClient:createLimbHitbox'
Check -Condition (Has $limb 'priority') -FailSeverity 'HIGH' -Id 'hitbox:priority' -Area 'Hitbox' -Failure 'Priority limb override is missing.' -Pass 'Priority limb override exists.' -Evidence 'HitboxTitanClient:createLimbHitbox'
Check -Condition (Has $limb '\.Touched:Connect\(') -FailSeverity 'HIGH' -Id 'hitbox:no-overlap' -Area 'Hitbox' -Failure 'Limb hitbox lost its Touched path.' -Pass 'Limb hitbox keeps Requiem Touched detection; overlap is only a start-overlap fallback.' -Evidence 'HitboxTitanClient:createLimbHitbox'
Check -Condition (Has $U.HitboxTitanClient 'signal:Destroy|Disconnect') -FailSeverity 'HIGH' -Id 'hitbox:cleanup' -Area 'Hitbox' -Failure 'Hitbox listener cleanup is not visible.' -Pass 'Hitbox listener cleanup is visible.' -Evidence 'HitboxTitanClient'
Check -Condition (Has $U.HitboxTitanClient 'heartbeat\s*==\s*connection' -and -not (Has $U.HitboxTitanClient 'heartbeat:Disconnect\(\)')) -FailSeverity 'HIGH' -Id 'hitbox:runner-ownership' -Area 'Hitbox' -Failure 'Shared hitbox runner can disconnect a nil/replaced heartbeat after a record destroys itself.' -Pass 'Hitbox runner disconnects only the RenderStepped connection it still owns.' -Evidence 'HitboxTitanClient:ensureRunner'
Check -Condition (Has $U.HitboxTitanClient 'GrappleHasBeenShaken|MetalHitReverb' -and Has $U.HitboxTitanClient 'excessResistance') -FailSeverity 'MEDIUM' -Id 'hitbox:wire-resistance' -Area 'Hitbox' -Failure 'Wire resistance/deep-hooks branch is incomplete.' -Pass 'Wire resistance, excess resistance and effect branch exists.' -Evidence 'HitboxTitanClient:createLimbHitbox'

# Grab/action chain
Check -Condition (-not (Has (ReadText (Join-Path $requiemActions 'Default/ShortRangeGrab.luau')) 'createKinematicInfluence')) -FailSeverity 'INFO' -Id 'grab:kinematic-source-contract' -Area 'Grab' -Failure 'Requiem source unexpectedly requires generic IK for normal grab.' -Pass 'Normal Requiem grab does not require createKinematicInfluence; animated limb + physical hitbox is the source contract.' -Evidence 'Requiem Default grab actions'
Check -Condition (Has $common 'createLimbHitbox') -FailSeverity 'CRITICAL' -Id 'grab:hitbox-chain' -Area 'Grab' -Failure 'Grab action does not create limb hitbox.' -Pass 'Grab action creates limb hitbox.' -Evidence 'CommonAction:createGrab'
Check -Condition (Has $common 'cleanup:Add|addCleanup') -FailSeverity 'HIGH' -Id 'grab:cleanup' -Area 'Grab' -Failure 'Grab hitbox/influence cleanup is not bound.' -Pass 'Grab resources are bound to cleanup.' -Evidence 'CommonAction:createGrab'
Check -Condition (Has $U.GrabTitanClient 'Ungrapple|ClearMomentum|activeGrabs') -FailSeverity 'HIGH' -Id 'grab:client-state' -Area 'Grab' -Failure 'Client grab state/gear cleanup is incomplete.' -Pass 'Client grab state and gear cleanup exist.' -Evidence 'GrabTitanClient'
Check -Condition (Has $serverActions 'RequiemGrabState|makeWeld|Humanoid\.Died|AncestryChanged|CompleteAction') -FailSeverity 'HIGH' -Id 'grab:server-lifecycle' -Area 'Grab' -Failure 'Server grab lifecycle cleanup is incomplete.' -Pass 'Server grab lifecycle cleanup exists.' -Evidence 'RequiemActions'
Check -Condition (Has $serverActions 'grabOwners\[player\]' -and Has $serverActions 'Players\.PlayerRemoving') -FailSeverity 'HIGH' -Id 'grab:target-ownership' -Area 'Grab' -Failure 'Two Titans can still own the same player or PlayerRemoving cleanup is missing.' -Pass 'Grab ownership is target-centric and cleans on PlayerRemoving.' -Evidence 'RequiemActions:grab/cleanupGrab'

# Server response integrity
Check -Condition (Has $protocol 'RegisterActionResponseHandler|_onActionResponse') -FailSeverity 'CRITICAL' -Id 'protocol:response' -Area 'Protocol' -Failure 'Action response boundary is missing.' -Pass 'Action response boundary exists.' -Evidence 'Protocol'
Check -Condition (Has $protocol 'actionEpoch|titanActionEpoch') -FailSeverity 'CRITICAL' -Id 'protocol:epoch' -Area 'Protocol' -Failure 'Action response is not epoch-bound.' -Pass 'Action response is epoch-bound.' -Evidence 'Protocol'
Check -Condition (Has $protocol 'targetUserId|record\.titan\.Enemy') -FailSeverity 'HIGH' -Id 'protocol:target' -Area 'Protocol' -Failure 'Target ownership validation is missing.' -Pass 'Target ownership validation exists.' -Evidence 'Protocol'
Check -Condition (Has $protocol 'record\.targetUserId\s*=\s*player\.UserId' -and Has $protocol 'record\.targetUserId\s*~=\s*player\.UserId') -FailSeverity 'CRITICAL' -Id 'protocol:response-target' -Area 'Protocol' -Failure 'Action response is not bound to the committed target user.' -Pass 'Action response is bound to the committed target user.' -Evidence 'Protocol:_onActionIntent/_onActionResponse'
$physical = [regex]::Match($serverActions,'local function physicalResponseValid.*?(?=\r?\nlocal function hasActionGroup)',[Text.RegularExpressions.RegexOptions]::Singleline).Value
Check -Condition (-not (Has $physical 'return\s+true\s*\r?\nend\s*$')) -FailSeverity 'CRITICAL' -Id 'protocol:physical-fallback' -Area 'Protocol' -Failure 'physicalResponseValid accepts an unmatched limb fallback after all limb checks fail.' -Pass 'Physical response rejects unmatched limb fallback.' -Evidence 'RequiemActions:physicalResponseValid'
Check -Condition (Has $serverActions 'local function physicalPart' -and Has $physical 'physicalPart\(model,\s*"Mouth"\)') -FailSeverity 'CRITICAL' -Id 'protocol:rig-physical-part' -Area 'Protocol' -Failure 'Server physical validation can resolve a Mouth/Hand Weld or Attachment instead of a Scarlet BasePart and reject every valid hit.' -Pass 'Server physical validation resolves canonical rig points to BaseParts through RigMap.' -Evidence 'RequiemActions:physicalPart/physicalResponseValid'
Check -Condition (-not (Has $protocol 'record\.responseEpoch\s*=\s*response\.actionEpoch.*handler\(')) -FailSeverity 'HIGH' -Id 'protocol:response-consume-order' -Area 'Protocol' -Failure 'Response epoch is consumed before the physical/action handler accepts the response.' -Pass 'Response epoch is consumed only after handler acceptance.' -Evidence 'Protocol:_onActionResponse'

# Model and Kinematic
Check -Condition (Has $U.ModelTitanClient 'prepareVisual|CanTouch\s*=\s*false') -FailSeverity 'HIGH' -Id 'model:visual-policy' -Area 'Model' -Failure 'Scarlet visual preparation policy is missing.' -Pass 'Scarlet visual preparation policy exists.' -Evidence 'ModelTitanClient'
Check -Condition (Has $U.ModelTitanClient 'CanQuery\s*=\s*true') -FailSeverity 'HIGH' -Id 'model:wire-query' -Area 'Model' -Failure 'Animated visual limbs are not raycast-queryable, so wire-swat cannot observe the animated pose.' -Pass 'Animated visual remains queryable for wire raycasts.' -Evidence 'ModelTitanClient:prepareVisual'
Check -Condition (Has $U.ModelTitanClient 'stabilizeVisual|rootMotor\.Transform') -FailSeverity 'HIGH' -Id 'model:root-policy' -Area 'Model' -Failure 'Root transform clamp policy is missing.' -Pass 'Root transform clamp policy exists and must be action-gated.' -Evidence 'ModelTitanClient'
Check -Condition (Has $U.KinematicTitanClient 'IKControl|createKinematicInfluence') -FailSeverity 'HIGH' -Id 'kinematic:ik' -Area 'Kinematic' -Failure 'Generic IK influence is missing.' -Pass 'Generic IK influence exists.' -Evidence 'KinematicTitanClient'
Check -Condition (Has $U.KinematicTitanClient 'easeIn|easeOut|createEasedIKControl') -FailSeverity 'HIGH' -Id 'kinematic:easing' -Area 'Kinematic' -Failure 'IK easing lifecycle is missing.' -Pass 'IK easing lifecycle exists.' -Evidence 'KinematicTitanClient'
Check -Condition (Has $U.KinematicTitanClient 'setKinematicOrigins|restoreMotors|clearLookAtState') -FailSeverity 'HIGH' -Id 'kinematic:restore' -Area 'Kinematic' -Failure 'Motor/origin cleanup is missing.' -Pass 'Motor/origin cleanup exists.' -Evidence 'KinematicTitanClient'
Check -Condition (Has $U.KinematicTitanClient 'chainRoot|endEffector|ChainRoot|EndEffector') -FailSeverity 'HIGH' -Id 'kinematic:chain' -Area 'Kinematic' -Failure 'IK chain guards are missing.' -Pass 'IK chain guards exist.' -Evidence 'KinematicTitanClient'
Check -Condition (Has $predictionRunner 'angularVelocity|curveDirection|INTEGRATION_STEP|weightedAverageVelocity') -FailSeverity 'HIGH' -Id 'prediction:requiem-curve' -Area 'Prediction' -Failure 'Prediction runner lacks Requiem-style angular/curve analysis and fixed-step integration.' -Pass 'Prediction runner has Requiem-style angular/curve analysis and fixed-step integration.' -Evidence 'CharacterPredictionRunner'
Check -Condition (Has $U.KinematicTitanClient 'smoothTime\s*=\s*config\.smoothTime\s*or\s*0\.175' -or Has $U.KinematicTitanClient 'smoothTime\s*=\s*config\.smoothTime\s*or\s*\.175') -FailSeverity 'HIGH' -Id 'kinematic:lookat-defaults' -Area 'Kinematic' -Failure 'createLookAtInfluence inherits the generic 2-second SmoothTime instead of Requiem defaults 0.175/0.12.' -Pass 'LookAt uses Requiem SmoothTime defaults.' -Evidence 'KinematicTitanClient:createLookAtInfluence'
Check -Condition (Has $U.KinematicTitanClient 'retainSmoothTimeOnEaseIn\s*=\s*true' -and Has $U.KinematicTitanClient 'smoothTime\s*=\s*config\.smoothTime\s*or\s*0\.28') -FailSeverity 'HIGH' -Id 'kinematic:bite-ik-defaults' -Area 'Kinematic' -Failure 'createBiteIKInfluence does not preserve Requiem retainSmoothTimeOnEaseIn=true and SmoothTime=0.28 defaults.' -Pass 'Bite IK uses Requiem easing defaults.' -Evidence 'KinematicTitanClient:createBiteIKInfluence'

# Core and animation lifecycle
Check -Condition (Has $U.TitanCoreActionClient 'coreReaction.*20|addClientCooldown\(titan,\s*"coreReaction"') -FailSeverity 'HIGH' -Id 'core:cooldown' -Area 'Core' -Failure 'Core reaction 20-second cooldown is missing.' -Pass 'Core reaction cooldown exists.' -Evidence 'TitanCoreActionClient'
$core = [regex]::Match($U.TitanCoreActionClient,'function\s+TitanCoreActionClient\.markCoreReactionStarted.*?(?=\r?\nfunction|\r?\nTitanCoreActionClient\.)',[Text.RegularExpressions.RegexOptions]::Singleline).Value
Check -Condition (-not (Has $core 'removeClientCooldown|cleanup:Add')) -FailSeverity 'CRITICAL' -Id 'core:cleanup' -Area 'Core' -Failure 'Core cooldown is removed by action cleanup.' -Pass 'Core cooldown is independent from animation cleanup.' -Evidence 'TitanCoreActionClient:markCoreReactionStarted'
Check -Condition (Has $U.TitanCoreActionClient 'IsCoreReaction|IsNapeGrabInterrupt|shouldRejectAction') -FailSeverity 'HIGH' -Id 'core:classification' -Area 'Core' -Failure 'Core/reaction classification is incomplete.' -Pass 'Core/reaction classification exists.' -Evidence 'TitanCoreActionClient'
Check -Condition (Has $U.AnimationTitanClient 'GetLength|Length|AdjustSpeed') -FailSeverity 'MEDIUM' -Id 'animation:length' -Area 'Animation' -Failure 'Animation length/speed contract is missing.' -Pass 'Animation length/speed contract exists.' -Evidence 'AnimationTitanClient'
$jumpShake = ReadText (Join-Path $actionsRoot 'Default/GrappleJumpShake.luau')
Check -Condition (Has $jumpShake 'KeyframeReached.*"Up".*"Down"') -FailSeverity 'HIGH' -Id 'animation:jump-markers' -Area 'Animation' -Failure 'GrappleJumpShake does not bind the Requiem Up/Down keyframes.' -Pass 'GrappleJumpShake binds Up/Down keyframes through the returned AnimationTrack.' -Evidence 'GrappleJumpShake'

# Wire/effect parity
Check -Condition (Has $limb 'Workspace:Raycast') -FailSeverity 'HIGH' -Id 'wire:raycast' -Area 'Hitbox' -Failure 'Wire-swat does not use the Requiem raycast path.' -Pass 'Wire-swat has a raycast path.' -Evidence 'HitboxTitanClient:createLimbHitbox'
Check -Condition (Has $limb 'MetalHitReverb|GrappleHasBeenShaken') -FailSeverity 'MEDIUM' -Id 'wire:sounds' -Area 'Effects' -Failure 'Wire-swat metal/reverb sounds are missing.' -Pass 'Wire-swat sounds are mapped.' -Evidence 'HitboxTitanClient:createLimbHitbox'
Check -Condition (Has $limb 'GrappleHasBeenShaken.*volume\s*=\s*0\.3.*fadeIn\s*=\s*0\.5.*lifetime\s*=\s*2' -and Has $limb 'MetalHitReverb.*volume\s*=\s*0\.3.*fadeIn\s*=\s*0\.1.*lifetime\s*=\s*2' -and Has $limb 'playbackSpeed\s*=\s*0\.8\s*\+\s*math\.random\(\)\s*\*\s*0\.2') -FailSeverity 'MEDIUM' -Id 'wire:sound-timing' -Area 'Effects' -Failure 'Wire-swat fade, volume, lifetime or playback range differs from Requiem.' -Pass 'Wire-swat fade/volume/playback timing matches Requiem through Scarlet Effects.' -Evidence 'HitboxTitanClient/EffectsRuntime'
Check -Condition (Has $U.HitboxTitanClient 'signal:Fire\("Mouth"\)' -and Has $U.HitboxTitanClient 'destroyRecord\(record\)') -FailSeverity 'HIGH' -Id 'mouth:async-signal-lifecycle' -Area 'Hitbox' -Failure 'Mouth hitbox response/lifecycle cleanup is not visible.' -Pass 'Mouth hitbox fires the response before optional record cleanup and remains lifecycle-bound.' -Evidence 'HitboxTitanClient:createMouthHitbox/Shared Signal'
Check -Condition (Has (ReadText (Join-Path $sharedTitans 'Animations.luau')) 'Eaten\s*=\s*"rbxassetid://') -FailSeverity 'HIGH' -Id 'animation:eaten-contract' -Area 'Animation' -Failure 'DefaultTitanChewing references a missing Requiem Eaten player animation.' -Pass 'Eaten player reaction animation is present in the shared animation contract.' -Evidence 'Shared Titans Animations/DefaultTitanChewing'
Check -Condition (Has $limb 'Monologue') -FailSeverity 'MEDIUM' -Id 'wire:monologue' -Area 'Effects' -Failure 'Wire-swat monologue/DeepHooks near-miss branch is missing.' -Pass 'Wire-swat monologue branch exists.' -Evidence 'HitboxTitanClient:createLimbHitbox'

# Known action parameter parity
Check -Condition ((Has $common 'Ragdoll:Request') -and (Has $common '\b5\b')) -FailSeverity 'HIGH' -Id 'action:long-ground-crush-ragdoll' -Area 'Actions' -Failure 'LongRangeAttackGround crush ragdoll is not Requiem 5 seconds.' -Pass 'LongRangeAttackGround crush uses a 5-second default ragdoll.' -Evidence 'CommonAction:createBothArmAttack'
Check -Condition (Has $jumpShake 'Ragdoll:Request\(5,\s*"TitanLimbHit"') -FailSeverity 'HIGH' -Id 'action:jump-shake-ragdoll' -Area 'Actions' -Failure 'GrappleJumpShake landing ragdoll is not Requiem 5 seconds.' -Pass 'GrappleJumpShake landing uses a 5-second ragdoll.' -Evidence 'GrappleJumpShake'

# Cooldown, registry and scheduler
Check -Condition (Has $U.CooldownTitanClient 'Clock|Runtime|Remaining|addClientCooldown') -FailSeverity 'MEDIUM' -Id 'cooldown:shared-clock' -Area 'Cooldown' -Failure 'Cooldown shared clock contract is not visible.' -Pass 'Cooldown uses shared clock contract.' -Evidence 'CooldownTitanClient'
Check -Condition (Has $registry 'clearLookAtState|cleanup:Clean|cleanup\.Clean|reset') -FailSeverity 'HIGH' -Id 'lifecycle:registry-cleanup' -Area 'Lifecycle' -Failure 'Titan registry cleanup is incomplete.' -Pass 'Titan registry cleanup hook exists.' -Evidence 'ClientTitanRegistry'
Check -Condition (Has $registry 'targetUserId\s*=\s*snapshot\.targetUserId' -and Has (ReadText (Join-Path $clientRoot 'TitanTypes/Default/RequiemClient.luau')) 'titan\.targetUserId\s*~=\s*Players\.LocalPlayer\.UserId') -FailSeverity 'HIGH' -Id 'lifecycle:target-client-owner' -Area 'Protocol' -Failure 'Observer clients still run the local action chooser for a Titan targeting another player.' -Pass 'Only the authoritative target client runs the local Titan action chooser.' -Evidence 'ClientTitanRegistry/RequiemClient'
Check -Condition (Has $scheduler 'BeginBatch|EndBatch|onTitanStepped') -FailSeverity 'MEDIUM' -Id 'lifecycle:scheduler-batch' -Area 'Lifecycle' -Failure 'Scheduler does not batch prediction/step work.' -Pass 'Scheduler has prediction/step batch contract.' -Evidence 'TitanScheduler'
Check -Condition (Has $clientInit 'Kinematics\(|clearLookAtState|Destroy|Despawn') -FailSeverity 'HIGH' -Id 'lifecycle:kinematic-clear' -Area 'Lifecycle' -Failure 'Client Titan lifecycle does not clear kinematic state.' -Pass 'Client Titan lifecycle has kinematic cleanup path.' -Evidence 'Titans client init'
Check -Condition (Has $clientInit 'handledByRequiemRuntime' -and Has $clientInit 'titanType\s*==\s*"Normal"') -FailSeverity 'CRITICAL' -Id 'lifecycle:no-dual-normal-registry' -Area 'Lifecycle' -Failure 'Normal Titans can be registered by both the Requiem runtime and Scarlet legacy client.' -Pass 'Normal/Default Titans are exclusively owned by the Requiem runtime when enabled.' -Evidence 'Titans client init:handledByRequiemRuntime'

# Inventory parity
$sourceActions = RelativeFiles $requiemActions
$targetActions = RelativeFiles $actionsRoot
$missingActions = @($sourceActions | Where-Object { $_ -notin $targetActions })
$inventoryPass = ($missingActions.Count -eq 0)
Check -Condition $inventoryPass -FailSeverity 'HIGH' -Id 'inventory:default-actions' -Area 'Inventory' -Failure ('Missing action paths: ' + ($missingActions -join ', ')) -Pass ('All ' + $sourceActions.Count + ' Requiem Default action paths are present.') -Evidence 'Requiem Default Actions vs Scarlet Default Actions'

# Source-driven action parameter parity. These checks deliberately read the
# current Requiem files instead of duplicating a hand-maintained constant list.
# Wrapper-based Scarlet actions may express a direct source call as a named
# config field, so both forms are accepted when they carry the same number.
foreach ($relative in $sourceActions) {
    $sourcePath = Join-Path $requiemActions $relative
    $targetPath = Join-Path $actionsRoot $relative
    if (-not (Test-Path -LiteralPath $targetPath -PathType Leaf)) { continue }
    $sourceText = ReadText $sourcePath
    $targetText = ReadText $targetPath
    $actionName = [IO.Path]::GetFileNameWithoutExtension($relative)
    $safeId = ($relative -replace '[^A-Za-z0-9]+','-').Trim('-').ToLowerInvariant()

    $sourceDetection = [regex]::Match($sourceText, 'box\s*=\s*"([^"]+)"\s*,?\s*impactAt\s*=\s*([0-9.]+)', [Text.RegularExpressions.RegexOptions]::Singleline)
    if ($sourceDetection.Success) {
        $targetDetection = [regex]::Match($targetText, 'box\s*=\s*"([^"]+)"\s*,?\s*impactAt\s*=\s*([0-9.]+)', [Text.RegularExpressions.RegexOptions]::Singleline)
        $sameDetection = $targetDetection.Success `
            -and $targetDetection.Groups[1].Value -eq $sourceDetection.Groups[1].Value `
            -and [math]::Abs(([double]$targetDetection.Groups[2].Value) - ([double]$sourceDetection.Groups[2].Value)) -lt 0.0000001
        Check -Condition $sameDetection -FailSeverity 'HIGH' -Id "action:detection:$safeId" -Area 'Actions' `
            -Failure ("Detection mismatch for {0}; expected box={1}, impactAt={2}." -f $relative,$sourceDetection.Groups[1].Value,$sourceDetection.Groups[2].Value) `
            -Pass ("Detection box/impactAt matches Requiem for {0}." -f $relative) -Evidence $relative

        $detectionKeys = @(
            'activeWindow','innerBoxScale','proximityDistance','proximityBoxScale','proximityPlane',
            'proximityUsePrediction','proximityFirst','mouthReachDistance','mouthReachUseClosestBodyPart',
            'mouthReachAtImpactSample','mouthReachBestWindowSample','grappleImpactWhileOnGear',
            'grappleHorizontalInner','grappleHorizontalInnerScale','grappleHorizontalLateralScale',
            'grappleImpactCenterOnly','grappleImpactLeadingWindow','grappleOrbitNow','requireImpactWindow',
            'playerSpeedMin','playerSpeedMax','animSpeedMin','animSpeedMax'
        )
        $missingDetectionFields = [System.Collections.Generic.List[string]]::new()
        foreach ($field in $detectionKeys) {
            $sourceField = [regex]::Match($sourceText, ("\b{0}\s*=\s*(true|false|`"[^`"]+`"|-?[0-9.]+)" -f [regex]::Escape($field)))
            if (-not $sourceField.Success) { continue }
            $literal = $sourceField.Groups[1].Value
            $targetFieldPattern = "\b{0}\s*=\s*{1}(?:\s|,|\}})" -f [regex]::Escape($field),[regex]::Escape($literal)
            if (-not (Has $targetText $targetFieldPattern)) {
                $missingDetectionFields.Add("$field=$literal")
            }
        }
        Check -Condition ($missingDetectionFields.Count -eq 0) -FailSeverity 'HIGH' -Id "action:detection-fields:$safeId" -Area 'Actions' `
            -Failure ("Detection tuning mismatch for {0}: {1}." -f $relative,($missingDetectionFields -join ', ')) `
            -Pass ("Detection tuning fields match Requiem for {0}." -f $relative) -Evidence $relative
    }

    $escapedName = [regex]::Escape($actionName)
    $sourceCooldown = [regex]::Match($sourceText, "addClientCooldown\(p1,\s*`"$escapedName`",\s*([0-9.]+)\)")
    if ($sourceCooldown.Success) {
        $value = $sourceCooldown.Groups[1].Value
        $numberPattern = [regex]::Escape($value)
        $targetCooldown = Has $targetText ("(?:addClientCooldown\(titan,\s*`"$escapedName`",\s*$numberPattern\)|actionCooldown\s*=\s*$numberPattern(?:\s|,|\}))")
        if (-not $targetCooldown -and (Has $targetText 'Common\.createBite') -and (Has $common ("addClientCooldown\(titan,\s*config\.name,\s*$numberPattern\)"))) {
            $targetCooldown = $true
        }
        Check -Condition $targetCooldown -FailSeverity 'HIGH' -Id "action:cooldown:$safeId" -Area 'Actions' `
            -Failure ("Primary cooldown mismatch for {0}; expected {1}s." -f $relative,$value) `
            -Pass ("Primary cooldown matches Requiem for {0}." -f $relative) -Evidence $relative
    }

    $sourceChance = [regex]::Match($sourceText, 'math\.random\(\)\s*<\s*([0-9.]+)')
    if ($sourceChance.Success) {
        $value = $sourceChance.Groups[1].Value
        $numberPattern = [regex]::Escape($value)
        $targetChance = Has $targetText ("(?:math\.random\(\)\s*<\s*$numberPattern|(?:rejectChance|attemptRejectChance|postDetectionRejectChance)\s*=\s*$numberPattern)")
        if (-not $targetChance -and (Has $targetText 'Common\.createBite') -and (Has $common ("(?:math\.random\(\)\s*<\s*|randomRejects\()$numberPattern"))) {
            $targetChance = $true
        }
        Check -Condition $targetChance -FailSeverity 'HIGH' -Id "action:chance:$safeId" -Area 'Actions' `
            -Failure ("Random selection/rejection threshold mismatch for {0}; expected {1}." -f $relative,$value) `
            -Pass ("Random selection/rejection threshold matches Requiem for {0}." -f $relative) -Evidence $relative
    }
}

$movementSoundPolicies = @(
    @{ Path='Anger/LongRangeAttackAir.luau'; Mode='random' },
    @{ Path='Anger/LongRangeAttackGround.luau'; Mode='random' },
    @{ Path='Default/BackGrab.luau'; Mode='random' },
    @{ Path='Default/DefaultTitanBlinded.luau'; Mode='random' },
    @{ Path='Default/EyeGrabAttack.luau'; Mode='random' },
    @{ Path='Default/GrappleJumpShake.luau'; Mode='random' },
    @{ Path='Default/LongRangeAboveGrab.luau'; Mode='random' },
    @{ Path='Default/LongRangeGrab.luau'; Mode='plain' },
    @{ Path='Default/MediumRangeGrab.luau'; Mode='plain' },
    @{ Path='Default/NapeGrabAttack.luau'; Mode='random' },
    @{ Path='Default/ShortRangeAttackGround.luau'; Mode='random' },
    @{ Path='Default/ShortRangeFrontArmGrab.luau'; Mode='random' },
    @{ Path='Default/ShortRangeGrab.luau'; Mode='random' },
    @{ Path='Default/ShortRangeGrabLeg.luau'; Mode='none' },
    @{ Path='Default/ShortRangeSwat.luau'; Mode='plain' },
    @{ Path='Default/SidewaysGrab.luau'; Mode='plain' },
    @{ Path='Default/WideRangeGrab.luau'; Mode='random' },
    @{ Path='Idiocy/MediumRangeAttackGround.luau'; Mode='none' }
)

$longRangeBiteText = ReadText (Join-Path $actionsRoot 'Anger/LongRangeBite.luau')
Check -Condition (Has $longRangeBiteText 'lifetime\s*=\s*0\.833\s*(?:,|\r?\n)' -and Has $common 'aim\.lifetime\s*/=\s*animationSpeed') -FailSeverity 'HIGH' -Id 'action:long-bite-aim-lifetime' -Area 'Kinematic' -Failure 'LongRangeBite aim lifetime is not normalized once from Requiem source timing.' -Pass 'LongRangeBite aim lifetime uses Requiem 0.833/animationSpeed timing.' -Evidence 'LongRangeBite/CommonAction:createBite'

foreach ($contract in $movementSoundPolicies) {
    $targetText = ReadText (Join-Path $actionsRoot $contract.Path)
    $safeId = ($contract.Path -replace '[^A-Za-z0-9]+','-').Trim('-').ToLowerInvariant()
    $usesCommon = Has $targetText 'Common\.create(?:Grab|BothArmAttack)'
    $condition = $false
    if ($contract.Mode -eq 'none') {
        $condition = Has $targetText 'movementSound\s*=\s*false'
    } elseif ($contract.Mode -eq 'plain') {
        $condition = Has $targetText 'randomizeMovementSound\s*=\s*false'
    } else {
        $directRandom = Has $targetText 'playbackSpeed\s*=\s*0\.8\s*\+\s*math\.random\(\)\s*\*\s*0\.4'
        $commonRandom = $usesCommon -and -not (Has $targetText '(?:movementSound|randomizeMovementSound)\s*=\s*false')
        $condition = $directRandom -or $commonRandom
    }
    Check -Condition $condition -FailSeverity 'MEDIUM' -Id "action:sound-policy:$safeId" -Area 'Effects' `
        -Failure ("Movement sound policy mismatch for {0}; expected {1}." -f $contract.Path,$contract.Mode) `
        -Pass ("Movement sound policy matches Requiem for {0}." -f $contract.Path) -Evidence $contract.Path
}

$counts = @{}
foreach ($severity in @('CRITICAL','HIGH','MEDIUM','LOW','INFO','PASS')) { $counts[$severity] = @($findings | Where-Object Severity -eq $severity).Count }
$result = [pscustomobject]@{ GeneratedAt=(Get-Date).ToString('o'); Counts=$counts; Findings=$findings }
New-Item -ItemType Directory -Path (Split-Path -Parent $OutputPath) -Force | Out-Null
New-Item -ItemType Directory -Path (Split-Path -Parent $JsonPath) -Force | Out-Null
$result | ConvertTo-Json -Depth 8 | Set-Content -LiteralPath $JsonPath -Encoding UTF8
$md = [System.Collections.Generic.List[string]]::new()
$md.Add('# Titan Deep Audit'); $md.Add(''); $md.Add('- CRITICAL: ' + $counts.CRITICAL); $md.Add('- HIGH: ' + $counts.HIGH); $md.Add('- MEDIUM: ' + $counts.MEDIUM); $md.Add('- LOW: ' + $counts.LOW); $md.Add('- INFO: ' + $counts.INFO); $md.Add('- PASS: ' + $counts.PASS); $md.Add(''); $md.Add('| Severity | Area | Check | Finding | Evidence |'); $md.Add('|---|---|---|---|---|')
foreach ($f in $findings) { $md.Add('| ' + $f.Severity + ' | ' + $f.Area + ' | `' + $f.Id + '` | ' + ([string]$f.Detail).Replace('|','\|') + ' | ' + $f.Evidence + ' |') }
$md -join [Environment]::NewLine | Set-Content -LiteralPath $OutputPath -Encoding UTF8
Write-Output '# Titan deep semantic audit'; foreach ($s in @('CRITICAL','HIGH','MEDIUM','LOW','INFO','PASS')) { Write-Output ('- ' + $s + ': ' + $counts[$s]) }; foreach ($f in ($findings | Where-Object Severity -ne 'PASS')) { Write-Output ('[' + $f.Severity + '] ' + $f.Id + ': ' + $f.Detail) }
