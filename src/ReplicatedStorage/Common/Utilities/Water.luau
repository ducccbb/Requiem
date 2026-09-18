-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

--[[
__________                   __               __    __________              .__
\______   \_______  ____    |__| ____   _____/  |_  \______   \ ____ _____  |  |
 |     ___/\_  __ \/  _ \   |  |/ __ \_/ ___\   __\  |       _// __ \\__  \ |  |
 |    |     |  | \(  <_> )  |  \  ___/\  \___|  |    |    |   \  ___/ / __ \|  |__
 |____|     |__|   \____/\__|  |\___  >\___  >__|    |____|_  /\___  >____  /____/
                        \______|    \/     \/               \/     \/     \/
]]
--                           Project Real  |  Luau Decompiler
--                                   Made by @zinvera
--                    File: ReplicatedStorage.Common.Utilities.Water
--                              Dumped in 0.000601 seconds
--                          Bytecode version 9  |  6 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local CollectionService = game:GetService("CollectionService")
local Workspace = game:GetService("Workspace")
local function isWaterTagged(p1) -- Line: 15 -- upvalues: CollectionService (val)
    return CollectionService:HasTag(p1, "Water")
end
local function isPositionInWater(p1, p2, p3) -- Line: 19 -- upvalues: Workspace (val), isWaterTagged (val)
    local v1 = OverlapParams.new()
    v1.FilterType = Enum.RaycastFilterType.Exclude
    if p2 then
        v1.FilterDescendantsInstances = p2
    end
    for i, j in Workspace:GetPartBoundsInRadius(p1, p3 or 1.05, v1) do
        if j:IsA("BasePart") and isWaterTagged(j) then
            return j
        end
    end
    return nil
end
local function getCharacterHalfHeight(p1) -- Line: 70
    return p1:GetExtentsSize().Y / 2
end
local v2 = {
    isCharacterTouchingWater = function(p1) -- Line: 74 -- upvalues: getCharacterHalfHeight (val), isPositionInWater (val)
        local v1, v2
        local HumanoidRootPart = p1:FindFirstChild("HumanoidRootPart")
        if not HumanoidRootPart then
            return false
        end
        local v3 = getCharacterHalfHeight(p1)
        local v4 = {0, -v3 * 0.35, -v3 * 0.7, -v3}
        local v5 = nil
        local v6 = nil
        for i, j in v4, v5, v6 do
            v2 = HumanoidRootPart.Position + Vector3.new(0, j, 0)
            v1 = {p1}
            if isPositionInWater(v2, v1, 1.05) then
                return true
            end
        end
        return false
    end,
    isPositionInWater = isPositionInWater,
    isWaterTagged = isWaterTagged,
}
function v2.getWaterSurfaceY(p1, p2) -- Line: 37 -- upvalues: isPositionInWater (val)
    local v1, v2
    local Y = p1.Y
    if isPositionInWater(p1, p2, 0.3) then
        local v3
        v1 = 6
        v2 = 0.25
        for i = 0.25, v1, v2 do
            v3 = Vector3.new(p1.X, Y + i, p1.Z)
            if not (isPositionInWater(v3, p2, 0.3)) then
                return Y + i - 0.3
            end
        end
        return nil
    else
        local v4
        v1 = false
        v2 = 6
        local v5 = 0.25
        for j = 0.25, v2, v5 do
            v4 = p1 - Vector3.new(0, j, 0)
            if isPositionInWater(v4, p2, 0.3) then
                Y = p1.Y - j
                v1 = true
                break
            end
        end
        if not v1 then
            return nil
        end
    end
end
return v2