[CmdletBinding()]
param(
	[string]$ScarletRoot = 'D:\scarlet',
	[string]$RequiemRoot = 'D:\Requiem',
	[string]$Requiem2024Root = 'C:\Users\ducsh\Downloads\requiem-main (1)\requiem-main',
	[string]$OutputPath,
	[string]$JsonPath,
	[switch]$Strict
)

$ErrorActionPreference = 'Stop'
$findings = [System.Collections.Generic.List[object]]::new()

function Add-Finding {
	param(
		[ValidateSet('CRITICAL', 'HIGH', 'MEDIUM', 'LOW', 'INFO', 'PASS')]
		[string]$Severity,
		[string]$Id,
		[string]$Detail,
		[string]$Evidence
	)
	$findings.Add([pscustomobject]@{
		Severity = $Severity
		Id = $Id
		Detail = $Detail
		Evidence = $Evidence
	})
}

function Read-Text {
	param([string]$Path)
	if (-not (Test-Path -LiteralPath $Path -PathType Leaf)) {
		throw "Missing audit input: $Path"
	}
	return Get-Content -LiteralPath $Path -Raw
}

function Has-Pattern {
	param([string]$Text, [string]$Pattern)
	return [regex]::IsMatch($Text, $Pattern, [Text.RegularExpressions.RegexOptions]::Singleline)
}

function Add-Check {
	param(
		[bool]$Condition,
		[string]$FailureSeverity,
		[string]$Id,
		[string]$FailureDetail,
		[string]$PassDetail,
		[string]$Evidence
	)
	if ($Condition) {
		Add-Finding 'PASS' $Id $PassDetail $Evidence
	} else {
		Add-Finding $FailureSeverity $Id $FailureDetail $Evidence
	}
}

$movementPath = Join-Path $ScarletRoot 'src\StarterPlayer\StarterPlayerScripts\Framework\Modules\ODMG\Movement\init.luau'
$slidePath = Join-Path $ScarletRoot 'src\StarterPlayer\StarterPlayerScripts\Framework\Modules\ODMG\Movement\Sliding.luau'
$playerSlidePath = Join-Path $ScarletRoot 'src\StarterPlayer\StarterPlayerScripts\Framework\Modules\ODMG\Movement\PlayerSlide.luau'
$wallPath = Join-Path $ScarletRoot 'src\StarterPlayer\StarterPlayerScripts\Framework\Modules\ODMG\Movement\WallInteraction.luau'
$odmgPath = Join-Path $ScarletRoot 'src\StarterPlayer\StarterPlayerScripts\Framework\Modules\ODMG\init.luau'
$grapplesPath = Join-Path $ScarletRoot 'src\StarterPlayer\StarterPlayerScripts\Framework\Modules\ODMG\Grapples.luau'
$legacyAuditPath = Join-Path $ScarletRoot 'tools\port-audit.ps1'
$placePath = Join-Path $ScarletRoot 'scarlet.rbxl'
$ejectorPath = Join-Path $RequiemRoot 'src\ReplicatedStorage\Client\User\Equipment\Gear\Components\Ejector\Default.luau'
$winchesPath = Join-Path $RequiemRoot 'src\ReplicatedStorage\Client\User\Equipment\Gear\Components\Winches\Default.luau'
$housingPath = Join-Path $RequiemRoot 'src\ReplicatedStorage\Client\User\Equipment\Gear\Components\Housing\Default.luau'
$characterMovementPath = Join-Path $RequiemRoot 'src\ReplicatedStorage\Client\User\Character\CharacterMovementRunner.luau'
$playerSlide2024Path = Join-Path $Requiem2024Root 'src\client\entities\player\movement\ClientSlideMovement.ts'

$movement = Read-Text $movementPath
$sliding = Read-Text $slidePath
$playerSlide = Read-Text $playerSlidePath
$wall = Read-Text $wallPath
$odmg = Read-Text $odmgPath
$grapples = Read-Text $grapplesPath
$legacyAudit = Read-Text $legacyAuditPath
$ejector = Read-Text $ejectorPath
$winches = Read-Text $winchesPath
$housing = Read-Text $housingPath
$characterMovement = Read-Text $characterMovementPath
$playerSlide2024 = Read-Text $playerSlide2024Path

# Current Requiem's momentum slide is a state handoff between Ejector and
# CharacterMovementRunner. Merely having Sliding.luau on disk is insufficient.
$slidingRequired = Has-Pattern $movement 'require\(script\.Sliding\)'
$slidingConstructed = Has-Pattern $movement 'Sliding\.new\('
$slidingStepped = Has-Pattern $movement '(StepGrappling|BeginCoast|StepCoast)\('
Add-Check ($slidingRequired -and $slidingConstructed -and $slidingStepped) 'CRITICAL' 'slide:runtime-handoff' `
	'Current Requiem momentum slide is dead: Sliding.luau is not required, constructed, and stepped by Movement.' `
	'Momentum slide is wired into the active movement state machine.' `
	'Movement/init.luau versus Movement/Sliding.luau and CharacterMovementRunner.onSlideStateChanged'

$beginReleaseMatch = [regex]::Match(
	$movement,
	'function Movement:_beginRelease.*?(?=\r?\nfunction Movement:)',
	[Text.RegularExpressions.RegexOptions]::Singleline
)
$beginReleaseClearsSlide = $beginReleaseMatch.Success -and (Has-Pattern $beginReleaseMatch.Value 'SetSlidingState\(false\)')
Add-Check (-not $beginReleaseClearsSlide) 'CRITICAL' 'slide:release-preserves-state' `
	'_beginRelease clears Sliding before the GearVelocity/GearGyro handoff can occur.' `
	'Release preserves the slide state long enough for the coast solver to take ownership.' `
	'Movement/init.luau::_beginRelease'

Add-Check (Has-Pattern $sliding 'SlideGearVelocity' -and Has-Pattern $sliding 'SlideGearGyro') 'HIGH' 'slide:coast-physics' `
	'Slide coast physics are absent.' 'Slide coast physics exist in the implementation module.' 'Movement/Sliding.luau'
Add-Check (Has-Pattern $movement 'Sliding\.new\(') 'CRITICAL' 'slide:not-dead-code' `
	'Sliding.luau exists but is dead code.' 'Sliding.luau is instantiated.' 'Movement/init.luau imports'
Add-Check (Has-Pattern ($sliding + $movement) 'Launch.*EmitDashEffect|EmitDashEffect.*Launch|sendReplicatedEffect|Server\(\):Dash') 'HIGH' 'slide:launch-effects' `
	'Point launch lacks Requiem launch animation and replicated Dash effect.' `
	'Point launch includes animation/effect ownership.' `
	'CharacterMovementRunner.onPointLaunch versus Movement/Sliding.luau::_tryLaunch'
Add-Check (Has-Pattern $sliding 'LeftShift' -and Has-Pattern $sliding 'SetStopping') 'HIGH' 'slide:instant-stop' `
	'LeftShift instant-stop branch is not connected.' 'Instant-stop input is connected.' 'CharacterMovementRunner.onInstantStop'
Add-Check (Has-Pattern ($sliding + $movement) 'FieldOfView|WalkSpeed|JumpPower') 'MEDIUM' 'slide:status-effects' `
	'Slide/stop does not reproduce jump lock, walk-speed, and FOV leases.' `
	'Slide status effects are represented.' 'CharacterMovementRunner.onSlideStateChanged'

# The 2024 crouch slide is a different feature and must not be counted as the
# current gear-release momentum slide.
Add-Check (Has-Pattern $playerSlide 'ClientSprint|IsAnyBusy|COMBAT|Stunned|JumpRequest|SLIDE_JUMP') 'HIGH' 'player-slide:2024-contract' `
	'PlayerSlide is only a partial 2024 port: sprint/busy/combat/stun/jump contracts are missing.' `
	'PlayerSlide contains the 2024 lifecycle contracts.' 'ClientSlideMovement.ts versus Movement/PlayerSlide.luau'
$stopsOnKeyRelease = Has-Pattern $odmg 'SlackingKeybind:Ended\(function\(\).*?StopPlayerSlide\(\)'
Add-Check (-not $stopsOnKeyRelease) 'MEDIUM' 'player-slide:key-release' `
	'Scarlet stops the 2024 slide when LeftControl is released; Requiem only starts it on Begin.' `
	'LeftControl release does not cancel the 2024 slide.' 'ODMG/init.luau and ClientSlideMovement.slide'

# Release momentum fidelity.
Add-Check (Has-Pattern $movement 'TweenService.*Create\(.*BodyForce|Create\(.*releaseBodyForce') 'HIGH' 'release:gravity-tween' `
	'Low-speed release keeps a fixed upward BodyForce for 1.5s instead of tweening Force to zero.' `
	'Low-speed release tween is present.' 'Ejector.onBeginSimulatedMomentum versus Movement:_beginRelease'
Add-Check (Has-Pattern $movement 'CollisionGroup\s*=\s*["'']Universal["'']') 'MEDIUM' 'release:collision-group' `
	'Release Spherecast omits Requiem CollisionGroup="Universal".' `
	'Release Spherecast uses the Universal collision group.' 'Movement:_stepRelease'
Add-Check (Has-Pattern $movement 'SWIMMING|TouchingWater|no_physics|busy\(\)') 'HIGH' 'movement:runtime-guards' `
	'Water/swimming/no_physics/busy guards from current Requiem are not mapped.' `
	'Current Requiem movement guards are represented.' 'Ejector.onGearGoalStepped/onBeginSimulatedMomentum'

# Current Requiem publishes movement states; these are part of conflict
# arbitration, not optional UI data.
Add-Check ((Has-Pattern $movement 'SetMovementState\("SLIDING"|SetMovementState\("WALL_') -and (Has-Pattern $odmg 'States:Acquire') -and (Has-Pattern $grapples 'SetMovementState\("GRAPPLING"')) 'CRITICAL' 'states:conflict-arbitration' `
	'GRAPPLING/SLIDING/WALL_SLIDING/WALL_HANGING are not published to Scarlet States, so other solvers cannot arbitrate ownership.' `
	'Movement states are bridged into Scarlet state leases.' 'Movement:SetSlidingState/SetWallState and Requiem ClientStateHandler'

# The current wall-hang ray grid is generated by Raycast.checkForWallInfront
# from x=-1.2..1.2 step 1 and y=0..5 step 2, with spacing .5 and >=4 hits.
$wallHangGrid = Has-Pattern $wall 'for\s+x\s*=\s*-1\.2\s*,\s*1\.2\s*,\s*1' -and Has-Pattern $wall 'for\s+y\s*=\s*0\s*,\s*5\s*,\s*2'
Add-Check $wallHangGrid 'HIGH' 'wall-hang:ray-grid' `
	'Wall-hang uses a hand-written 2x2 grid; Requiem samples a 3x3 grid and accepts any 4 valid hits.' `
	'Wall-hang ray grid matches Raycast.checkForWallInfront.' 'WallInteraction:_scanHangWall versus Common/Utilities/Raycast.luau'
$wallQueriesMatch = Has-Pattern $wall 'params\.RespectCanCollide\s*=\s*false'
$playerSlideQueriesMatch = -not (Has-Pattern $playerSlide 'RespectCanCollide\s*=\s*true')
Add-Check ($wallQueriesMatch -and $playerSlideQueriesMatch) 'MEDIUM' 'raycast:respect-can-collide' `
	'Scarlet forces RespectCanCollide=true although the audited Requiem raycasts leave it false.' `
	'Raycast query semantics match Requiem.' 'Movement/WallInteraction/PlayerSlide raycast parameters'

# Directional solver and input lifecycle.
Add-Check (Has-Pattern $movement 'normalizeAlpha.*0\.0175.*0\.03.*240') 'MEDIUM' 'orbit:turn-response' `
	'Orbit smoothing uses fixed ORBIT_DIRECTION_RESPONSE=10 instead of Requiem velocity-gain-dependent 0.0175..0.03 curve.' `
	'Orbit turn-response curve matches current Requiem.' 'Ejector lines 968-973 versus Movement lines 619-621'
Add-Check (Has-Pattern $odmg 'Toggle Reeling|Toggle Slacking') 'MEDIUM' 'input:toggle-settings' `
	'Toggle Reeling and Toggle Slacking settings are absent.' 'Toggle input modes are supported.' 'Ejector/Winches keybind setup'
$boostMatch = [regex]::Match(
	$odmg,
	'local BoostKeybind\s*=.*?(?=\r?\n\s*local ReelingKeybind)',
	[Text.RegularExpressions.RegexOptions]::Singleline
)
$boostHasGoalGate = $boostMatch.Success -and (Has-Pattern $boostMatch.Value '(HasGoal|HasActiveGrapple|GetGoal)')
Add-Check $boostHasGoalGate 'HIGH' 'input:boost-goal-gate' `
	'Boost is activated globally; pressing Space without a grapple can play gas effects/sound and conflicts with wall-run.' `
	'Boost activation is scoped to an active grapple goal.' 'ODMG:InputConnections and Ejector onGearGoalStepped'
Add-Check (Has-Pattern $movement 'ReelingEnd|OrbitChangeSound|Gear\.Orbit') 'MEDIUM' 'audio:movement-cues' `
	'Reeling start/end and orbit-direction audio cues are missing.' 'Movement audio cues are mapped.' 'Ejector reeling/orbit handlers'

# Clearing physics must terminate temporal solvers, not just unparent movers.
Add-Check (Has-Pattern $movement 'function Movement:ClearPhysics\(\).*?self\._release\s*=\s*nil') 'HIGH' 'cleanup:release-state' `
	'ClearPhysics does not clear _release; old simulated momentum can resume after a temporary suppression.' `
	'ClearPhysics clears release state.' 'Movement:ClearPhysics'
Add-Check (-not (Has-Pattern $odmg 'tick\(\)\s*-\s*\(self\.LeftAt.*?self:Dash' -or Has-Pattern $odmg 'tick\(\)\s*-\s*\(self\.RightAt.*?self:Dash')) 'HIGH' 'legacy:ground-dash' `
	'Legacy Scarlet double-tap ground Dash remains active after the movement replacement.' `
	'Legacy ground Dash input is removed or explicitly isolated.' 'ODMG:InputConnections/ODMG:Dash'
Add-Check (-not (Has-Pattern $odmg 'self:AdjustMomentum\(\)')) 'LOW' 'legacy:dead-momentum' `
	'Legacy AdjustMomentum still runs every frame although RequiemMovement never consumes self.Momentum.' `
	'Dead legacy momentum work is removed.' 'ODMG:CoreStep'

# Animation identity is part of the requested port. Existing Scarlet names
# currently win over the Requiem IDs, which is an adapter policy rather than an
# exact port.
$scarletAssetsWin = Has-Pattern $odmg 'if\s+not\s+Package:FindFirstChild\(Name\)'
Add-Check (-not $scarletAssetsWin) 'HIGH' 'animation:source-of-truth' `
	'Existing Scarlet animations override Requiem IDs; the result is not animation-faithful.' `
	'Requiem animation IDs are authoritative for the ported movement actions.' 'ODMG:Animations fallback loop'
foreach ($asset in @('92644101274615', '76656511162291', '111466842883640', '98227138288925', '120620528209768')) {
	Add-Check (Has-Pattern $odmg ([regex]::Escape($asset))) 'HIGH' "animation:asset-$asset" `
		"Required current-Requiem movement animation $asset is not mapped." `
		"Animation $asset is mapped." 'Common/Animations/Gear.luau versus ODMG:Animations'
}

if (Test-Path -LiteralPath $placePath -PathType Leaf) {
	$placeAscii = [Text.Encoding]::GetEncoding(28591).GetString([IO.File]::ReadAllBytes($placePath))
	foreach ($effectName in @('MovementParticle', 'SlideParticle')) {
		$hasNamedAsset = $placeAscii.Contains($effectName)
		$hasScarletAdapter = $placeAscii.Contains('GasPart') -and (Has-Pattern $movement "name\s*==\s*[`"']$effectName[`"']")
		Add-Check ($hasNamedAsset -or $hasScarletAdapter) 'HIGH' "effect:asset-$effectName" `
			"$effectName is referenced by code but is absent from the saved Scarlet place asset tree." `
			"$effectName exists or is explicitly mapped to Scarlet's GasPart emitters." `
			'scarlet.rbxl string inventory; a newer unsaved Studio place must be checked separately'
	}
	if (-not $placeAscii.Contains('EjectorParticle') -and $placeAscii.Contains('GasPart')) {
		Add-Finding 'INFO' 'effect:ejector-adapter' `
			'EjectorParticle is absent; Scarlet GasPart emitters are explicitly partitioned as the movement, boost, and slide fallback.' `
			'scarlet.rbxl + Movement:_setBoostParticles'
	}
}

# The legacy marker audit checks that names exist; it cannot detect dead code,
# wrong ownership, or parameter/formula mismatches.
$legacyRequiresSliding = Has-Pattern $legacyAudit 'require\(script\.Sliding\)|slide:runtime-handoff|BeginCoast|StepCoast'
Add-Check $legacyRequiresSliding 'HIGH' 'audit-tool:semantic-coverage' `
	'The existing port-audit can report PASS while momentum slide is dead and parameters are wrong.' `
	'The existing audit validates the slide handoff semantically.' 'tools/port-audit.ps1'

Add-Finding 'INFO' 'version:canonical-source' `
	'Current decompiled Requiem and the clean 2024 branch implement different ejector/slide architectures; exactness cannot target both simultaneously. This audit treats current Requiem as canonical and uses 2024 only for PlayerSlide.' `
	'Ejector/Default.luau + CharacterMovementRunner.luau versus BaseGearEjector.ts + ClientSlideMovement.ts'

$order = @{ CRITICAL = 0; HIGH = 1; MEDIUM = 2; LOW = 3; INFO = 4; PASS = 5 }
$sorted = @($findings | Sort-Object @{ Expression = { $order[$_.Severity] } }, Id)
$counts = @{}
foreach ($severity in @('CRITICAL', 'HIGH', 'MEDIUM', 'LOW', 'INFO', 'PASS')) {
	$counts[$severity] = @($sorted | Where-Object Severity -eq $severity).Count
}

$lines = [System.Collections.Generic.List[string]]::new()
$lines.Add('# ODMG deep semantic audit')
$lines.Add('')
$lines.Add("- CRITICAL: $($counts.CRITICAL)")
$lines.Add("- HIGH: $($counts.HIGH)")
$lines.Add("- MEDIUM: $($counts.MEDIUM)")
$lines.Add("- LOW: $($counts.LOW)")
$lines.Add("- INFO: $($counts.INFO)")
$lines.Add("- PASS: $($counts.PASS)")
$lines.Add('')
$lines.Add('| Severity | Check | Finding | Evidence |')
$lines.Add('|---|---|---|---|')
foreach ($finding in $sorted) {
	$detail = ([string]$finding.Detail).Replace('|', '\|').Replace("`r", ' ').Replace("`n", ' ')
	$evidence = ([string]$finding.Evidence).Replace('|', '\|').Replace("`r", ' ').Replace("`n", ' ')
	$lines.Add("| $($finding.Severity) | ``$($finding.Id)`` | $detail | $evidence |")
}
$report = $lines -join [Environment]::NewLine

if ($OutputPath) {
	$resolved = if ([IO.Path]::IsPathRooted($OutputPath)) { $OutputPath } else { Join-Path $RequiemRoot $OutputPath }
	$parent = Split-Path -Parent $resolved
	if ($parent -and -not (Test-Path -LiteralPath $parent)) { New-Item -ItemType Directory -Path $parent -Force | Out-Null }
	[IO.File]::WriteAllText($resolved, $report, [Text.UTF8Encoding]::new($false))
}
if ($JsonPath) {
	$resolved = if ([IO.Path]::IsPathRooted($JsonPath)) { $JsonPath } else { Join-Path $RequiemRoot $JsonPath }
	$parent = Split-Path -Parent $resolved
	if ($parent -and -not (Test-Path -LiteralPath $parent)) { New-Item -ItemType Directory -Path $parent -Force | Out-Null }
	[IO.File]::WriteAllText($resolved, (@{ Counts = $counts; Findings = $sorted } | ConvertTo-Json -Depth 6), [Text.UTF8Encoding]::new($false))
}

Write-Output $report
if ($Strict -and ($counts.CRITICAL + $counts.HIGH) -gt 0) { exit 1 }
