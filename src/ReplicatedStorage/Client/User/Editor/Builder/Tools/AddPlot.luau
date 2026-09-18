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
--           File: ReplicatedStorage.Client.User.Editor.Builder.Tools.AddPlot
--                              Dumped in 0.000798 seconds
--                          Bytecode version 9  |  7 functions

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
    onToolSelected = function(p1) -- Line: 33 -- upvalues: Zone (val), UserPlacementHandler (val), Signals (val), Building (val), u101 (val), u103 (val)
        local v1, v2
        local Model = Instance.new("Model")
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
        v1 = UserPlacementHandler.onBeginModelPlacement(Model, function(p1) -- Line: 51 -- upvalues: Zone (upval), Part (val)
            local Y
            local Position = p1.Position
            local v1 = Zone.getZoneFromPosition(Position)
            local v2 = Zone.getZoneWorldPosition(v1)
            local v3 = RaycastParams.new()
            v3.RespectCanCollide = true
            local v4 = Position + Vector3.new(0, 5000, 0)
            local v5 = Vector3.new(0, -6000, 0)
            local v6 = workspace:Raycast(v4, v5, v3)
            Y = if v6 and v6.Position then v6.Position.Y else 0
            v5 = CFrame.new(v2)
            return v5 + Vector3.new(0, Y + Part.Size.Y / 2, 0)
        end)
        v1 = v1:Connect(function(p1) -- Line: 70 -- upvalues: UserPlacementHandler (upval), Zone (upval), Signals (upval), Building (upval)
            UserPlacementHandler.onSuccessfulPlacement()
            local v1 = Zone.getZoneFromPosition(p1:GetPivot().Position)
            local v2 = Zone.getZoneId(v1)
            if Zone.getZoneRegionFolder():FindFirstChild(v2) then
                Signals.Editor.Building.UpdateZonePermissionPage:Fire(v2)
                return
            end
            Signals.Toast:Fire({message = "Sent a request to the server to create the plot.", type = "info"})
            Building.CreatePlot.post({location = p1:GetPivot()})
        end)
        v2 = Zone.getZoneRegionFolder()
        local u44 = {}
        for i, j in v2:GetChildren() do
            if j:IsA("BasePart") then
                Zone.showZoneFullBoundingBox(j, u101)
                table.insert(u44, j)
            end
        end
        local u63 = v2.ChildAdded:Connect(function(p1) -- Line: 106 -- upvalues: Zone (upval), u101 (upval), u44 (val)
            if not (p1:IsA("BasePart")) then
                return
            end
            task.delay(0.1, function() -- Line: 112 -- upvalues: Zone (upval), p1 (val), u101 (upval)
                Zone.showZoneFullBoundingBox(p1, u101)
            end)
            table.insert(u44, p1)
        end)
        u103:Add(v1)
        u103:Add(function() -- Line: 120 -- upvalues: UserPlacementHandler (upval), Model (val), u44 (val), Zone (upval), u63 (val)
            UserPlacementHandler.onEndModelPlacement()
            Model:Destroy()
            local v1 = u44
            local v2 = nil
            local v3 = nil
            for i, j in v1, v2, v3 do
                Zone.hideZoneFullBoundingBox(j)
            end
            u63:Disconnect()
        end)
        return u103
    end,
}