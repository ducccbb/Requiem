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
--     File: ReplicatedStorage.Client.User.Equipment.Tools.Special.Ceremonial Relic
--                              Dumped in 0.000701 seconds
--                          Bytecode version 9  |  5 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local CollectionService = game:GetService("CollectionService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Alive = require(Common:WaitForChild("Alive"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Config = require(Common_2:WaitForChild("Config"))
local State = script.Parent.Parent.Parent.Parent:WaitForChild("State")
local ClientStateHandler = require(State:WaitForChild("ClientStateHandler"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Types = Common_3:WaitForChild("Types")
local u103 = Config.define({TARGET_RAYCAST_DISTANCE = 20})
local u104 = nil
local u105 = nil
local u106 = nil
local u107 = nil
return {
    equipped = function(p1) -- Line: 55 -- upvalues: u107 (ref), CollectionService (val), u104 (ref), RunService (val), Workspace (val), UserInputService (val), u103 (val), ClientStateHandler (val), u106 (ref), Alive (val), Players (val), u105 (ref)
        u107 = Instance.new("Highlight")
        u107.FillTransparency = 1
        u107.OutlineTransparency = 0.5
        local u9 = RaycastParams.new()
        u9.FilterDescendantsInstances = {CollectionService:GetTagged("Character")}
        u9.FilterType = Enum.RaycastFilterType.Include
        u104 = RunService.RenderStepped:Connect(function() -- Line: 66 -- upvalues: Workspace (upval), UserInputService (upval), u103 (upval), u9 (val), ClientStateHandler (upval), u107 (upval), u106 (upval), Alive (upval), Players (upval)
            local MouseLocation = UserInputService:GetMouseLocation()
            local v1 = Workspace.CurrentCamera:ScreenPointToRay(MouseLocation.X, MouseLocation.Y - game:GetService("GuiService"):GetGuiInset().Y)
            local v2 = Workspace:Raycast(v1.Origin, v1.Direction * u103.TARGET_RAYCAST_DISTANCE, u9)
            if not v2 or ClientStateHandler.isStateBusy(ClientStateHandler.States.BANDAGING) or not v2.Instance or not (v2.Instance.Parent:IsA("Model")) or not (v2.Instance.Parent:FindFirstChildWhichIsA("Humanoid")) then
                u107.Adornee = nil
                u107.Parent = nil
                u106 = nil
                return
            end
            u106 = Alive.getPlayerFromCharacter(v2.Instance.Parent)
            if u106 == Players.LocalPlayer then
                u107.Adornee = nil
                u107.Parent = nil
                u106 = nil
                return
            end
            if u107.Adornee == v2.Instance.Parent then
                return
            end
            u107.Adornee = v2.Instance.Parent
            u107.Parent = v2.Instance.Parent
        end)
        u105 = UserInputService.InputBegan:Connect(function(a1, p2) -- Line: 106 -- upvalues: u106 (upval), u107 (upval), Alive (upval), p1 (val)
            if p2 or a1.UserInputType ~= Enum.UserInputType.MouseButton1 or not u106 or not u107.Parent or not (Alive.getAliveCharacter(u106)) then
                return
            end
            p1(u106)
        end)
    end,
    unequipped = function() -- Line: 127 -- upvalues: u104 (ref), u105 (ref), u107 (ref), u106 (ref)
        if u104 then
            u104:Disconnect()
        end
        if u105 then
            u105:Disconnect()
        end
        if u107 then
            u107:Destroy()
        end
        u106 = nil
    end,
    data = {description = "A ceremonial relic of unknown origin.", category = require(Types:WaitForChild("Item")).CATEGORIES.Special},
}