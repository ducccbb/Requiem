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
--                     File: ReplicatedStorage.Common.World.TreeFall
--                              Dumped in 0.000858 seconds
--                          Bytecode version 9  |  13 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Workspace = game:GetService("Workspace")
local u21 = Vector3.new(-5473, -180.357, 1580.8)
local function onGetModelBottom(p1) -- Line: 44
    local BoundingBox, BoundingBox_2
    BoundingBox, BoundingBox_2 = p1:GetBoundingBox()
    return BoundingBox.Position - BoundingBox.UpVector * (BoundingBox_2.Y / 2)
end
local function onGetGroundPosition(p1, p2) -- Line: 55 -- upvalues: Workspace (val)
    local v1 = RaycastParams.new()
    v1.FilterType = Enum.RaycastFilterType.Exclude
    v1.FilterDescendantsInstances = {p1}
    local v2 = p2 + Vector3.new(0, 5, 0)
    local v3 = Vector3.new(0, -1000, 0)
    local v4 = Workspace:Raycast(v2, v3, v1)
    if v4 then
        return v4.Position
    end
    return p2
end
local function onGetAwayDirection(p1, p2) -- Line: 74 -- upvalues: u21 (val)
    local v1 = p2
    if not v1 then
        v1 = u21
    end
    local v2 = Vector3.new(p1.X - v1.X, 0, p1.Z - v1.Z)
    if v2.Magnitude < 0.01 then
        return (Vector3.new(1, 0, 0))
    end
    return v2.Unit
end
local function onGetFallAxis(p1) -- Line: 90
    local v1 = p1:Cross(Vector3.yAxis)
    if v1.Magnitude < 0.001 then
        return Vector3.xAxis
    end
    return v1.Unit
end
local function onGetRotatedPivot(p1, p2, p3, p4) -- Line: 107
    local v1 = CFrame.new(p2) * CFrame.fromAxisAngle(p3, -math.rad(p4))
    return v1 * CFrame.new(-p2) * p1
end
local function onGetFallenPivot(p1, p2, p3) -- Line: 119 -- upvalues: onGetRotatedPivot (val)
    return onGetRotatedPivot(p1, p2, p3, 85)
end
return {
    FALL_ANGLE = 85,
    FALL_DURATION = 8,
    WORKSPACE_STAMP_ATTRIBUTE = "FemaleTitanTreeFallStamp",
    ORIGIN_POINT = u21,
    fallEaseIn = function(p1) -- Line: 35
        return p1 * p1 * p1 * p1
    end,
    getRotatedPivot = onGetRotatedPivot,
    getFallenPivot = onGetFallenPivot,
    getRandomFallAt = function(p1) -- Line: 128
        return p1 + math.random(5, 60)
    end,
    buildEntry = function(p1, p2, p3, p4) -- Line: 140 -- upvalues: onGetGroundPosition (val), onGetModelBottom (val), onGetAwayDirection (val), onGetFallAxis (val)
        if p1:GetAttribute("Fallen") then
            return nil
        end
        local Pivot = p1:GetPivot()
        local v1 = onGetGroundPosition(p1, onGetModelBottom(p1))
        local v2 = onGetAwayDirection(Pivot.Position, p4)
        local v3 = onGetFallAxis(v2)
        return {
            standingPivot = Pivot,
            bottom = v1,
            axis = v3,
            fallAt = p2,
            stamp = p3,
        }
    end,
    storeEntryAttributes = function(p1, p2) -- Line: 165
        p1:SetAttribute("FallEventStamp", p2.stamp)
        p1:SetAttribute("FallAt", p2.fallAt)
        p1:SetAttribute("FallStandingPivot", p2.standingPivot)
        p1:SetAttribute("FallBottom", p2.bottom)
        p1:SetAttribute("FallAxis", p2.axis)
    end,
    readEntryFromAttributes = function(p1, p2) -- Line: 179
        if p1:GetAttribute("Fallen") then
            return nil
        end
        local Attribute = p1:GetAttribute("FallEventStamp")
        local Attribute_2 = p1:GetAttribute("FallAt")
        local Attribute_3 = p1:GetAttribute("FallStandingPivot")
        local Attribute_4 = p1:GetAttribute("FallBottom")
        local Attribute_5 = p1:GetAttribute("FallAxis")
        if typeof(Attribute) ~= "number" then
            return nil
        end
        if not p2 then
            if typeof(Attribute_2) ~= "number" or typeof(Attribute_3) ~= "CFrame" or typeof(Attribute_4) ~= "Vector3" or typeof(Attribute_5) ~= "Vector3" then
                return nil
            end
            return {
                standingPivot = Attribute_3,
                bottom = Attribute_4,
                axis = Attribute_5,
                fallAt = Attribute_2,
                stamp = Attribute,
            }
        end
        if Attribute ~= p2 or typeof(Attribute_2) ~= "number" or typeof(Attribute_3) ~= "CFrame" or typeof(Attribute_4) ~= "Vector3" or typeof(Attribute_5) ~= "Vector3" then
            return nil
        end
        return {
            standingPivot = Attribute_3,
            bottom = Attribute_4,
            axis = Attribute_5,
            fallAt = Attribute_2,
            stamp = Attribute,
        }
    end,
    commitTree = function(p1, p2) -- Line: 229 -- upvalues: onGetFallenPivot (val)
        if p1:GetAttribute("Fallen") then
            return
        end
        for i, j in p1:GetDescendants() do
            if j:IsA("BasePart") then
                j.Anchored = true
            end
        end
        p1:PivotTo(onGetFallenPivot(p2.standingPivot, p2.bottom, p2.axis))
        p1:SetAttribute("Fallen", true)
    end,
}