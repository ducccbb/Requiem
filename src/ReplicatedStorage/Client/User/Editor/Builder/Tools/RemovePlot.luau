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
--          File: ReplicatedStorage.Client.User.Editor.Builder.Tools.RemovePlot
--                              Dumped in 0.000906 seconds
--                          Bytecode version 9  |  8 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Building = require(Namespaces:WaitForChild("Building"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Signals = require(Common_2:WaitForChild("Signals"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_3:WaitForChild("Packages")
local trove = require(Packages:WaitForChild("trove"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Chunk = Common_3:WaitForChild("Chunk")
local Zone = require(Chunk:WaitForChild("Zone"))
local Universal = script.Parent.Parent.Parent:WaitForChild("Universal")
local UserPlacementHandler = require(Universal:WaitForChild("UserPlacementHandler"))
local u101 = Color3.fromRGB(110, 175, 255)
local u103 = trove.new()
return {
    onToolSelected = function(p1) -- Line: 33 -- upvalues: Zone (val), UserPlacementHandler (val), u101 (val), Signals (val), Building (val), u103 (val)
        local v1
        local Model = Instance.new("Model")
        local u4 = nil
        local Part = Instance.new("Part")
        Part.Size = Vector3.new(Zone.ZONE_SIZE.X, 2048, Zone.ZONE_SIZE.Y)
        Part.Anchored = true
        Part.CanCollide = false
        Part.CanTouch = false
        Part.CanQuery = false
        Part.Color = Color3.fromRGB(255, 0, 0)
        Part.Transparency = 1
        Part.Parent = Model
        UserPlacementHandler.setPropSettings(UserPlacementHandler.Presets.WireframeBox)
        local v2 = UserPlacementHandler.onBeginModelPlacement(Model, function(p1) -- Line: 52 -- upvalues: Zone (upval), u4 (ref), u101 (upval), Part (val)
            local v1 = Zone.getZoneFromPosition(p1.Position)
            local v2 = Zone.getZoneWorldPosition(v1)
            local v3 = Zone.getZoneRegionFolder():FindFirstChild(Zone.getZoneId(v1))
            local function updateBeamColor(p1, p2) -- Line: 63
                for i, j in p1:GetDescendants() do
                    if j:IsA("Beam") then
                        j.Color = ColorSequence.new(p2)
                    end
                end
            end
            if v3 then
                if u4 and u4 ~= v3 then
                    updateBeamColor(u4, u101)
                end
                u4 = v3
                updateBeamColor(v3, Color3.fromRGB(255, 0, 0))
            elseif u4 and not v3 then
                updateBeamColor(u4, u101)
                u4 = nil
            end
            local v4 = CFrame.new(v2)
            return v4 + Vector3.new(0, Part.Size.Y / 2, 0)
        end)
        v2 = v2:Connect(function(p1) -- Line: 85 -- upvalues: UserPlacementHandler (upval), Signals (upval), Building (upval)
            UserPlacementHandler.onSuccessfulPlacement()
            Signals.Toast:Fire({message = "Sent a request to the server to delete the plot.", type = "info"})
            Building.DeletePlot.post({location = p1:GetPivot()})
        end)
        v1 = Zone.getZoneRegionFolder()
        local u45 = {}
        for i, j in v1:GetChildren() do
            if j:IsA("BasePart") then
                Zone.showZoneFullBoundingBox(j, u101)
                table.insert(u45, j)
            end
        end
        local u64 = v1.ChildAdded:Connect(function(p1) -- Line: 109 -- upvalues: Zone (upval), u101 (upval), u45 (val)
            if not (p1:IsA("BasePart")) then
                return
            end
            task.delay(0.1, function() -- Line: 115 -- upvalues: Zone (upval), p1 (val), u101 (upval)
                Zone.showZoneFullBoundingBox(p1, u101)
            end)
            table.insert(u45, p1)
        end)
        u103:Add(v2)
        u103:Add(function() -- Line: 123 -- upvalues: UserPlacementHandler (upval), Model (val), u45 (val), Zone (upval), u64 (val)
            UserPlacementHandler.onEndModelPlacement()
            Model:Destroy()
            local v1 = u45
            local v2 = nil
            local v3 = nil
            for i, j in v1, v2, v3 do
                Zone.hideZoneFullBoundingBox(j)
            end
            u64:Disconnect()
        end)
        return u103
    end,
}