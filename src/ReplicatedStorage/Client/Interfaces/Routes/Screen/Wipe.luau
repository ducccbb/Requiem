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
--             File: ReplicatedStorage.Client.Interfaces.Routes.Screen.Wipe
--                              Dumped in 0.000849 seconds
--                          Bytecode version 9  |  6 functions

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
local Vitality = require(Namespaces:WaitForChild("Vitality"))
local Hooks = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useAlertPopup = require(Hooks:WaitForChild("useAlertPopup"))
local Hooks_2 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useStore = require(Hooks_2:WaitForChild("useStore"))
local Components = v1.Parent.Parent.Parent:WaitForChild("Components")
local Inputs = Components:WaitForChild("Inputs")
local Button = require(Inputs:WaitForChild("Button"))
local Components_2 = v1.Parent.Parent.Parent:WaitForChild("Components")
local Primitives = Components_2:WaitForChild("Primitives")
local Frame = require(Primitives:WaitForChild("Frame"))
local Components_3 = v1.Parent.Parent.Parent:WaitForChild("Components")
local Utilities = Components_3:WaitForChild("Utilities")
local TransparencyGroup = require(Utilities:WaitForChild("TransparencyGroup"))
return function(p1) -- Line: 29 -- upvalues: useAlertPopup (val), Vitality (val), react (val), useStore (val), Frame (val), TransparencyGroup (val), Button (val)
    local u8, v1
    local u3 = useAlertPopup(function(p1) -- Line: 30 -- upvalues: Vitality (upval)
        if not p1 then
            return
        end
        Vitality.Wipe.post()
    end)
    v1, u8 = react.useState(false)
    local u13 = useStore(Vitality.Store, function(p1) -- Line: 42
        return p1
    end)
    react.useEffect(function() -- Line: 46 -- upvalues: u13 (val), u8 (val)
        if u13.wiped == 1 then
            u8(true)
        end
    end, {u13.wiped})
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
        Text = "You have died.",
        TextSize = 50,
        BackgroundTransparency = 1,
        Font = Enum.Font.SourceSansBold,
        TextColor3 = Color3.fromRGB(196, 196, 196),
        Size = UDim2.fromScale(1, 0.05),
        Position = UDim2.fromScale(0.5, 0.495),
        AnchorPoint = Vector2.new(0.5, 1),
    }), Body = react.createElement("TextLabel", {
        Text = "Please confirm your death, or request a void accordingly.",
        TextSize = 20,
        BackgroundTransparency = 1,
        TextTransparency = 0.5,
        Font = Enum.Font.SourceSans,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        Size = UDim2.fromScale(1, 0.015),
        Position = UDim2.fromScale(0.5, 0.495),
        AnchorPoint = Vector2.new(0.5, 0),
    }), Stats = react.createElement(TransparencyGroup, {
        ZIndex = 2,
        Enabled = v1,
        Tween = TweenInfo.new(2, Enum.EasingStyle.Linear),
        Delays = {Enabled = 5},
    }, {Button = react.createElement(Button, {
        Text = "Wipe Character",
        Color = Color3.fromRGB(24, 59, 136),
        Native = {AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.55)},
        Clicked = function() -- Line: 127 -- upvalues: u3 (val)
            u3("Wipe Character", "This action is irreversible, and will delete all of your character's data.", Color3.fromRGB(255, 0, 0))
        end,
    })})})})})
end