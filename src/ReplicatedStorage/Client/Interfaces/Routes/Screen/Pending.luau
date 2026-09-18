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
--            File: ReplicatedStorage.Client.Interfaces.Routes.Screen.Pending
--                              Dumped in 0.000730 seconds
--                          Bytecode version 9  |  4 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Player = require(Namespaces:WaitForChild("Player"))
local Hooks = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useStore = require(Hooks:WaitForChild("useStore"))
local Components = v1.Parent.Parent.Parent:WaitForChild("Components")
local Primitives = Components:WaitForChild("Primitives")
local Frame = require(Primitives:WaitForChild("Frame"))
local Components_2 = v1.Parent.Parent.Parent:WaitForChild("Components")
local Utilities = Components_2:WaitForChild("Utilities")
local TransparencyGroup = require(Utilities:WaitForChild("TransparencyGroup"))
return function(p1) -- Line: 27 -- upvalues: react (val), useStore (val), Player (val), Frame (val), TransparencyGroup (val)
    local u5, v1
    v1, u5 = react.useState(false)
    local u10 = useStore(Player.Store, function(p1) -- Line: 30
        return p1
    end)
    react.useEffect(function() -- Line: 34 -- upvalues: u10 (val), u5 (val)
        local client = u10
        if client then
            client = u10.client
            if client then
                client = u10.client.status == 3
            end
        end
        u5(client)
    end, {u10})
    return react.createElement(Frame, {}, {PermDeath = react.createElement(TransparencyGroup, {ZIndex = 100, Enabled = v1, Tween = TweenInfo.new(3)}, {Background = react.createElement("Frame", {
        BackgroundTransparency = 0,
        ZIndex = 100,
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        Size = UDim2.fromScale(1, 1),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
    }), View = react.createElement("ImageLabel", {
        Image = "rbxassetid://135589412519765",
        ImageTransparency = 0.85,
        BackgroundTransparency = 0,
        ZIndex = 101,
        ImageColor3 = Color3.fromRGB(82, 134, 255),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BorderColor3 = Color3.fromRGB(27, 42, 53),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(2, 2),
    }), Body = react.createElement(TransparencyGroup, {
        ZIndex = 102,
        Enabled = v1,
        Tween = TweenInfo.new(2, Enum.EasingStyle.Linear),
        Delays = {Enabled = 3},
    }, {Header = react.createElement("TextLabel", {
        Text = "You are pending.",
        TextSize = 50,
        BackgroundTransparency = 1,
        Font = Enum.Font.SourceSansBold,
        TextColor3 = Color3.fromRGB(196, 196, 196),
        Size = UDim2.fromScale(1, 0.05),
        Position = UDim2.fromScale(0.5, 0.495),
        AnchorPoint = Vector2.new(0.5, 1),
    }), Body = react.createElement("TextLabel", {
        Text = "Please wait while a staff member processes your join.",
        TextSize = 20,
        BackgroundTransparency = 1,
        TextTransparency = 0.5,
        Font = Enum.Font.SourceSans,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        Size = UDim2.fromScale(1, 0.015),
        Position = UDim2.fromScale(0.5, 0.495),
        AnchorPoint = Vector2.new(0.5, 0),
    })})})})
end