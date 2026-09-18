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
--           File: ReplicatedStorage.Client.User.Equipment.Tools.Economy.Marcs
--                              Dumped in 0.000878 seconds
--                          Bytecode version 9  |  6 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Signals = require(Common:WaitForChild("Signals"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Utilities = Common_2:WaitForChild("Utilities")
local State = require(Utilities:WaitForChild("State"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Types = Common_3:WaitForChild("Types")
local v2 = {
    description = "A set of marcs, which can be spent at your discretion.",
    attributes = {"Official Currency"},
    category = require(Types:WaitForChild("Item")).CATEGORIES.Economy,
}
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_4:WaitForChild("Common")
local Alive = require(Common_4:WaitForChild("Alive"))
local u100 = nil
local u101 = nil
local u102 = nil
local u103 = nil
local u104 = nil
return {
    equipped = function(p1, p2) -- Line: 49 -- upvalues: Alive (val), State (val), u104 (ref), u100 (ref), RunService (val), Workspace (val), UserInputService (val), u102 (ref), u101 (ref), u103 (ref), Signals (val)
        if not p2 then
            return
        end
        local u7 = Alive.getAliveCharacter(Alive.LocalPlayer)
        if not u7 then
            return
        end
        local isGiveMarcsPopupOpen = State("isGiveMarcsPopupOpen")
        State("maximumAmount")(p2.meta[1])
        u104 = Instance.new("Highlight")
        if not u104 then
            return
        end
        u104.OutlineColor = Color3.fromRGB(19, 157, 255)
        u104.FillColor = Color3.fromRGB(65, 157, 255)
        u104.OutlineTransparency = 0
        u104.FillTransparency = 0.65
        u104.DepthMode = Enum.HighlightDepthMode.Occluded
        u100 = RunService.RenderStepped:Connect(function() -- Line: 75 -- upvalues: Workspace (upval), UserInputService (upval), u7 (val), u104 (upval), u102 (upval), Alive (upval)
            local v1
            local MouseLocation = UserInputService:GetMouseLocation()
            local v2 = Workspace.CurrentCamera:ScreenPointToRay(MouseLocation.X, MouseLocation.Y - game:GetService("GuiService"):GetGuiInset().Y)
            local v3 = RaycastParams.new()
            v3.FilterType = Enum.RaycastFilterType.Exclude
            v3.FilterDescendantsInstances = {u7}
            local v4 = Workspace:Raycast(v2.Origin, v2.Direction * 100, v3)
            if not v4 then
                u104.Adornee = nil
                u104.Parent = nil
                u102 = nil
                return
            end
            local Instance = v4.Instance
            if Instance then
                Instance = v4.Instance.Parent
            end
            if Instance then
                v1 = Alive.findPlayer(Instance.Name)
                if not v1 then
                    u104.Adornee = nil
                    u104.Parent = nil
                    u102 = nil
                    return
                end
                u104.Adornee = Instance
                u104.Parent = Instance
                u102 = v1
                return
            end
            if not (Instance:IsA("Model")) then
                u104.Adornee = nil
                u104.Parent = nil
                u102 = nil
                return
            end
            v1 = Alive.findPlayer(Instance.Name)
            if not v1 then
                u104.Adornee = nil
                u104.Parent = nil
                u102 = nil
                return
            end
            u104.Adornee = Instance
            u104.Parent = Instance
            u102 = v1
        end)
        u101 = UserInputService.InputBegan:Connect(function(p1) -- Line: 117 -- upvalues: u102 (upval), u103 (upval), isGiveMarcsPopupOpen (val)
            if p1.UserInputType ~= Enum.UserInputType.MouseButton1 or not u102 or u103 then
                return
            end
            u103 = u102
            isGiveMarcsPopupOpen(true)
        end)
        Signals.GiveMarcs:Connect(function(a1, p2) -- Line: 135 -- upvalues: u103 (upval), p1 (val)
            local v1 = {target = u103, amount = a1}
            if p2 == "close" then
                u103 = nil
                return
            end
            p1(v1)
            u103 = nil
        end)
    end,
    unequipped = function() -- Line: 155 -- upvalues: u100 (ref), u101 (ref), u102 (ref), u104 (ref), u103 (ref), State (val)
        if u100 then
            u100:Disconnect()
            u100 = nil
        end
        if u101 then
            u101:Disconnect()
            u101 = nil
        end
        if u102 then
            u102 = nil
        end
        if u104 then
            u104:Destroy()
            u104 = nil
        end
        if u103 then
            u103 = nil
        end
        State("isGiveMarcsPopupOpen")(false)
    end,
    data = v2,
}