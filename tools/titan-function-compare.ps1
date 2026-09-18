[CmdletBinding()]
param(
    [string]$ScarletRoot = 'D:\scarlet',
    [string]$RequiemRoot = 'D:\Requiem',
    [string]$OutputPath = 'D:\Requiem\docs\TITAN-FUNCTION-COMPARE.md',
    [string]$JsonPath = 'D:\Requiem\docs\TITAN-FUNCTION-COMPARE.json'
)
$ErrorActionPreference = 'Stop'

function ReadText([string]$Path) {
    if (Test-Path -LiteralPath $Path -PathType Leaf) { return Get-Content -LiteralPath $Path -Raw }
    return ''
}
function Normalize([string]$Text) {
    if (-not $Text) { return '' }
    $value = [regex]::Replace($Text, '--[^\r\n]*', '')
    $value = [regex]::Replace($value, '\s+', ' ')
    return $value.Trim().ToLowerInvariant()
}
function FunctionInventory([string]$Text) {
    $items = @{}
    if (-not $Text) { return $items }
    # Covers named/local functions and table exports such as
    # createLimbHitbox = function(...), which is how the Requiem dump exposes
    # most public utility APIs.
    $patterns = @(
        '(?m)\b(?:local\s+)?function\s+([A-Za-z_][A-Za-z0-9_:.]*)\s*\(',
        '(?m)\b([A-Za-z_][A-Za-z0-9_]*)\s*=\s*function\s*\('
    )
    foreach ($pattern in $patterns) {
        foreach ($match in [regex]::Matches($Text, $pattern)) {
            $name = $match.Groups[1].Value
            if (-not $items.ContainsKey($name)) {
                $start = $match.Index
                $end = [math]::Min($Text.Length - $start, 1800)
                $items[$name] = Normalize($Text.Substring($start, $end))
            }
        }
    }
    return $items
}
function MarkerSet([string]$Text) {
    $markers = @('Touched','WeldConstraint','CanTouch','CanQuery','Raycast','RenderStepped','Heartbeat','GetState','PredictCurved','reeling','goal','Nape','Eyes','Mouth','Ragdoll','Monologue','DeepHooks','SmoothTime','IKControl','Cleanup','Disconnect')
    $result = @{}
    foreach ($marker in $markers) { $result[$marker] = [regex]::IsMatch($Text, [regex]::Escape($marker), [Text.RegularExpressions.RegexOptions]::IgnoreCase) }
    return $result
}

$clientRoot = Join-Path $ScarletRoot 'src/StarterPlayer/StarterPlayerScripts/Framework/Modules/Titans'
$sourceRoot = Join-Path $RequiemRoot 'src/ReplicatedStorage/Client/Entities/Titans'
$maps = @(
    @{ Name='DetectionBoxTitanClient'; Target='Utilities/DetectionBoxTitanClient.luau'; Source='Utilities/DetectionBoxTitanClient.luau' },
    @{ Name='HitboxTitanClient'; Target='Utilities/HitboxTitanClient.luau'; Source='Utilities/HitboxTitanClient.luau' },
    @{ Name='KinematicTitanClient'; Target='Utilities/KinematicTitanClient.luau'; Source='Utilities/KinematicTitanClient.luau' },
    @{ Name='ModelTitanClient'; Target='Utilities/ModelTitanClient.luau'; Source='Utilities/ModelTitanClient.luau' },
    @{ Name='GrabTitanClient'; Target='Utilities/GrabTitanClient.luau'; Source='Utilities/GrabTitanClient.luau' },
    @{ Name='TitanCoreActionClient'; Target='Utilities/TitanCoreActionClient.luau'; Source='Utilities/TitanCoreActionClient.luau' },
    @{ Name='TitanProtectiveNapeClient'; Target='Utilities/TitanProtectiveNapeClient.luau'; Source='Utilities/TitanProtectiveNapeClient.luau' },
    @{ Name='NapeProtectionTitanClient'; Target='Utilities/NapeProtectionTitanClient.luau'; Source='Utilities/NapeProtectionTitanClient.luau' },
    @{ Name='ShortRangeAttackGround'; Target='TitanTypes/Default/Actions/Default/ShortRangeAttackGround.luau'; Source='Types/Default/Actions/Default/ShortRangeAttackGround.luau' },
    @{ Name='ShortRangeGrab'; Target='TitanTypes/Default/Actions/Default/ShortRangeGrab.luau'; Source='Types/Default/Actions/Default/ShortRangeGrab.luau' },
    @{ Name='NapeGrabAttack'; Target='TitanTypes/Default/Actions/Default/NapeGrabAttack.luau'; Source='Types/Default/Actions/Default/NapeGrabAttack.luau' },
    @{ Name='EyeGrabAttack'; Target='TitanTypes/Default/Actions/Default/EyeGrabAttack.luau'; Source='Types/Default/Actions/Default/EyeGrabAttack.luau' },
    @{ Name='CommonAction'; Target='TitanTypes/Default/Actions/CommonAction.luau'; Source='Types/Default/Actions/CommonAction.luau' }
)

$rows = [System.Collections.Generic.List[object]]::new()
foreach ($map in $maps) {
    $targetPath = Join-Path $clientRoot $map.Target
    $sourcePath = Join-Path $sourceRoot $map.Source
    $targetText = ReadText $targetPath
    $sourceText = ReadText $sourcePath
    $targetFunctions = FunctionInventory $targetText
    $sourceFunctions = FunctionInventory $sourceText
    $missing = @($sourceFunctions.Keys | Where-Object { -not $targetFunctions.ContainsKey($_) } | Sort-Object)
    $extra = @($targetFunctions.Keys | Where-Object { -not $sourceFunctions.ContainsKey($_) } | Sort-Object)
    $shared = @($sourceFunctions.Keys | Where-Object { $targetFunctions.ContainsKey($_) } | Sort-Object)
    $rows.Add([pscustomobject]@{
        Module = $map.Name
        TargetExists = [bool]$targetText
        SourceExists = [bool]$sourceText
        SourceFunctions = $sourceFunctions.Count
        TargetFunctions = $targetFunctions.Count
        SharedFunctions = $shared.Count
        MissingFunctions = ($missing -join ', ')
        ExtraFunctions = ($extra -join ', ')
        SourceMarkers = (MarkerSet $sourceText)
        TargetMarkers = (MarkerSet $targetText)
    })
}

$allMarkers = @('Touched','WeldConstraint','CanTouch','CanQuery','Raycast','RenderStepped','Heartbeat','GetState','PredictCurved','reeling','goal','Nape','Eyes','Mouth','Ragdoll','Monologue','DeepHooks','SmoothTime','IKControl','Cleanup','Disconnect')
$markerRows = foreach ($row in $rows) {
    foreach ($marker in $allMarkers) {
        if ($row.SourceMarkers[$marker] -and -not $row.TargetMarkers[$marker]) {
            [pscustomobject]@{ Module=$row.Module; Marker=$marker; Finding='Source marker missing from Scarlet target' }
        }
    }
}

$summary = [pscustomobject]@{
    GeneratedAt = (Get-Date).ToString('o')
    Modules = $rows
    MarkerGaps = @($markerRows)
}
$summary | ConvertTo-Json -Depth 8 | Set-Content -LiteralPath $JsonPath -Encoding UTF8
$lines = [System.Collections.Generic.List[string]]::new()
$lines.Add('# Titan Function-by-Function Comparison')
$lines.Add('')
$lines.Add("Generated: $($summary.GeneratedAt)")
$lines.Add('')
$lines.Add('| Module | Source funcs | Scarlet funcs | Shared | Missing source functions | Extra Scarlet functions |')
$lines.Add('|---|---:|---:|---:|---|---|')
foreach ($row in $rows) {
    $lines.Add("| $($row.Module) | $($row.SourceFunctions) | $($row.TargetFunctions) | $($row.SharedFunctions) | $($row.MissingFunctions -replace '\|','\\|') | $($row.ExtraFunctions -replace '\|','\\|') |")
}
$lines.Add('')
$lines.Add('## Marker gaps')
$lines.Add('')
if (-not $markerRows) { $lines.Add('No source marker gaps detected.') }
else {
    $lines.Add('| Module | Marker | Finding |'); $lines.Add('|---|---|---|')
    foreach ($gap in $markerRows) { $lines.Add("| $($gap.Module) | $($gap.Marker) | $($gap.Finding) |") }
}
$lines | Set-Content -LiteralPath $OutputPath -Encoding UTF8
Write-Output "Wrote $OutputPath"
Write-Output "Wrote $JsonPath"
Write-Output ("Modules compared: {0}; marker gaps: {1}" -f $rows.Count, @($markerRows).Count)
