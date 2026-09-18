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
-- File: ReplicatedStorage.Client.Interfaces.Components.Menu.Progression.Vow.VowProgress
--                               Dumped in 0.00162 seconds
--                          Bytecode version 9  |  7 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Promise = require(Common:WaitForChild("Promise"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_2:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local Utilities = script.Parent.Parent.Parent.Parent:WaitForChild("Utilities")
local TransparencyGroup = require(Utilities:WaitForChild("TransparencyGroup"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_3:WaitForChild("Client")
local Interfaces = Client:WaitForChild("Interfaces")
local Hooks = Interfaces:WaitForChild("Hooks")
local useAsyncEffect = require(Hooks:WaitForChild("useAsyncEffect"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_4:WaitForChild("Client")
local Interfaces_2 = Client_2:WaitForChild("Interfaces")
local Hooks_2 = Interfaces_2:WaitForChild("Hooks")
local useMotion = require(Hooks_2:WaitForChild("useMotion"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_5:WaitForChild("Client")
local Interfaces_3 = Client_3:WaitForChild("Interfaces")
local Hooks_3 = Interfaces_3:WaitForChild("Hooks")
local useRem = require(Hooks_3:WaitForChild("useRem"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_6:WaitForChild("Client")
local Interfaces_4 = Client_4:WaitForChild("Interfaces")
local Hooks_4 = Interfaces_4:WaitForChild("Hooks")
local useTheme = require(Hooks_4:WaitForChild("useTheme"))
return function(p1) -- Line: 34 -- upvalues: useTheme (val), useMotion (val), useRem (val), useAsyncEffect (val), Promise (val), react (val), TransparencyGroup (val)
    local u6, v1
    local v2 = useTheme()
    v1, u6 = useMotion(0)
    local v3 = useRem()
    useAsyncEffect(function() -- Line: 41 -- upvalues: p1 (val), Promise (upval), u6 (val)
        if not p1.Enabled then
            return Promise.delay(0):andThen(function() -- Line: 43 -- upvalues: u6 (upval)
                u6:immediate(0)
            end)
        end
        u6:immediate(0)
        return Promise.delay(0.3):andThen(function() -- Line: 50 -- upvalues: u6 (upval), p1 (upval)
            u6:spring(p1.Progress / 100)
        end)
    end, {p1.Enabled})
    react.useEffect(function() -- Line: 55 -- upvalues: p1 (val), u6 (val)
        if not p1.Enabled then
            u6:immediate(0)
            return
        end
        u6:spring(p1.Progress / 100)
    end, {p1.Progress})
    local v4 = {Enabled = p1.Enabled, Tween = TweenInfo.new(0.5)}
    local v5 = {}
    local v6 = {
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundColor3 = Color3.fromRGB(31, 33, 39),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(1.32, 0.558),
    }
    local v7 = v3(800)
    v6.Size = UDim2.fromOffset(v7, 9)
    v5.Bar = react.createElement("Frame", v6, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 10)}), Frame = react.createElement("Frame", {
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundColor3 = v2.Bar,
        Position = UDim2.fromScale(0, 0.5),
        Size = v1:map(function(p1) -- Line: 85
            return UDim2.fromScale(p1, 1)
        end),
    }, {uICorner2 = react.createElement("UICorner", {CornerRadius = UDim.new(0, 10)})}), Padding = react.createElement("UIPadding", {PaddingBottom = UDim.new(0, 3), PaddingLeft = UDim.new(0, 3), PaddingRight = UDim.new(0, 3), PaddingTop = UDim.new(0, 3)}), Stroke = react.createElement("UIStroke", {Color = v2.Stroke})})
    v6 = {
        BorderSizePixel = 0,
        ZIndex = 2,
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundColor3 = v2.PageBackground,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
    }
    v7 = UDim2.fromScale(1.32, 0.558)
    local v8 = v3(800)
    v6.Position = v7 + UDim2.fromOffset(v8, 0)
    v6.Size = UDim2.fromOffset(52, 52)
    v5.Label = react.createElement("Frame", v6, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(1, 0)}), Stroke = react.createElement("UIStroke", {Color = v2.Stroke}), Label = react.createElement("TextLabel", {
        TextScaled = true,
        TextSize = 14,
        TextTransparency = 0.35,
        TextWrapped = true,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        LayoutOrder = 1,
        ZIndex = 2,
        FontFace = Font.new("rbxasset://fonts/families/Guru.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal),
        Text = tostring(p1.Level),
        TextColor3 = v2.Primary,
        TextYAlignment = Enum.TextYAlignment.Bottom,
        AnchorPoint = Vector2.new(0.5, 0.5),
        AutomaticSize = Enum.AutomaticSize.X,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(0.8, 0.8),
    })})
    return react.createElement(TransparencyGroup, v4, v5)
end