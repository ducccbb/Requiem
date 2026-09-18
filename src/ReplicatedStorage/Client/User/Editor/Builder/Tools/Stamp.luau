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
--            File: ReplicatedStorage.Client.User.Editor.Builder.Tools.Stamp
--                              Dumped in 0.000664 seconds
--                          Bytecode version 9  |  5 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local CollectionService = game:GetService("CollectionService")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Types = Common:WaitForChild("Types")
local Building = Types:WaitForChild("Building")
local Placeables = require(Building:WaitForChild("Placeables"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Chunk = Common_2:WaitForChild("Chunk")
local Prop = require(Chunk:WaitForChild("Prop"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Signals = require(Common_3:WaitForChild("Signals"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_4:WaitForChild("Packages")
local trove = require(Packages:WaitForChild("trove"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_5:WaitForChild("Common")
local Chunk_2 = Common_4:WaitForChild("Chunk")
local Zone = require(Chunk_2:WaitForChild("Zone"))
local Universal = script.Parent.Parent.Parent:WaitForChild("Universal")
local UserPlacementHandler = require(Universal:WaitForChild("UserPlacementHandler"))
local u127 = trove.new()
local u128 = nil
return {
    onToolSelected = function(p1, p2, p3) -- Line: 36 -- upvalues: Placeables (val), u127 (val), UserPlacementHandler (val), Zone (val), u128 (ref), Prop (val), CollectionService (val), Workspace (val), Signals (val)
        local BoundingBox
        local v1 = Placeables.getItemModelFromPath(p1)
        if not v1 then
            return u127
        end
        local u12 = string.split(p1, "/")[1]
        local v2 = Placeables.getSystemFromCategory(u12)
        if not v2 or not (v2.getItemFromPath(p1)) then
            return u127
        end
        UserPlacementHandler.setPropSettings(UserPlacementHandler.Presets.WireframeBox)
        _, BoundingBox = v1:GetBoundingBox()
        local v3 = UserPlacementHandler.onBeginModelPlacement(v1, function(p1, a2) -- Line: 58 -- upvalues: p2 (val), UserPlacementHandler (upval), Zone (upval), BoundingBox (val), p3 (val), u128 (upval), Prop (upval), u12 (val), CollectionService (upval), Workspace (upval)
            local v1, v2, v3, v4
            if p2 then
                UserPlacementHandler.setIsValidPlacement(true)
                return p1
            end
            v1, v2 = Zone.clampBoundingBoxToZones(p1, BoundingBox, p3, u128)
            u128 = v2
            if not v2 then
                UserPlacementHandler.setIsValidPlacement(false)
                return v1
            end
            _, v3 = Prop.getHighestFloorPoint(a2)
            local v5 = u12 == "Decorations"
            if not v5 then
                v4 = 10
            else
                v4 = 0.5
            end
            if v4 >= v3 then
                UserPlacementHandler.setIsValidPlacement(true)
            else
                UserPlacementHandler.setIsValidPlacement(false)
            end
            v4 = OverlapParams.new()
            v4.FilterType = Enum.RaycastFilterType.Include
            v4.FilterDescendantsInstances = {CollectionService:GetTagged(u12)}
            if 0 < #Workspace:GetPartBoundsInBox(v1, BoundingBox, v4) then
                UserPlacementHandler.setIsValidPlacement(false)
            end
            return v1
        end)
        v3 = v3:Connect(function(a1) -- Line: 92 -- upvalues: UserPlacementHandler (upval), Signals (upval), p1 (val)
            UserPlacementHandler.onSuccessfulPlacement()
            Signals.Editor.Building.Place:Fire({location = a1:GetPivot(), asset = p1})
        end)
        u127:Add(v3)
        u127:Add(function() -- Line: 108 -- upvalues: UserPlacementHandler (upval), u128 (upval)
            UserPlacementHandler.onEndModelPlacement()
            u128 = nil
        end)
        return u127
    end,
}