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
--File: ReplicatedStorage.Client.Interfaces.Components.Menu.Progression.Vow.Upgrade.VowProgress
--                              Dumped in 0.000819 seconds
--                          Bytecode version 9  |  5 functions

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
local Utilities = script.Parent.Parent.Parent.Parent.Parent:WaitForChild("Utilities")
local TransparencyGroup = require(Utilities:WaitForChild("TransparencyGroup"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_3:WaitForChild("Client")
local Interfaces = Client:WaitForChild("Interfaces")
local Hooks = Interfaces:WaitForChild("Hooks")
local useAsyncEffect = require(Hooks:WaitForChild("useAsyncEffect"))
return function(p1) -- Line: 30 -- upvalues: react (val), useAsyncEffect (val), Promise (val), TransparencyGroup (val)
    local u6, v1, v2, v3, v4, v5, v6
    local v7 = {}
    v5, u6 = react.useState(p1.Enabled)
    useAsyncEffect(function() -- Line: 36 -- upvalues: Promise (upval), u6 (val), p1 (val)
        return Promise.delay(0):andThen(function() -- Line: 37 -- upvalues: u6 (upval), Promise (upval), p1 (upval)
            u6(false)
            return Promise.delay(0.2):andThen(function() -- Line: 40 -- upvalues: u6 (upval), p1 (upval)
                u6(p1.Enabled)
            end)
        end)
    end, {p1.Rerenderer})
    local MaxProgress = p1.MaxProgress
    local v8 = 1
    local u136 = p1
    for i = 1, MaxProgress, v8 do
        v6 = tostring(i)
        v1 = {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.fromScale(0.072, 0),
            Size = UDim2.fromScale(0.1, 0.625),
            LayoutOrder = i,
        }
        v2 = {}
        v3 = {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Rotation = 45,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(1, 1),
        }
        v4 = {Stroke = react.createElement("UIStroke", {Thickness = 2, Color = Color3.fromRGB(56, 59, 70)})}
        v2.Stroke = react.createElement("Frame", v3, v4)
        v2.Ratio = react.createElement("UIAspectRatioConstraint")
        v3 = {
            BackgroundTransparency = 0.4,
            BorderSizePixel = 0,
            Rotation = 45,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(0.7, 0.7),
        }
        v4 = i <= u136.Progress
        v3.Visible = v4
        v2.Filling = react.createElement("Frame", v3)
        v7[v6] = react.createElement("Frame", v1, v2)
    end
    local v9 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 1.07),
        Size = UDim2.fromScale(0.742, 0.0889),
    }
    v6 = {}
    v1 = {}
    local Enabled = v5
    if Enabled then
        Enabled = u136.Enabled
    end
    v1.Enabled = Enabled
    v1.Tween = TweenInfo.new(0.5)
    v1.Delays = {Enabled = 0.3, Disabled = 0}
    v6.Transparency = react.createElement(TransparencyGroup, v1, {Layout = react.createElement("UIListLayout", {
        HorizontalFlex = Enum.UIFlexAlignment.SpaceEvenly,
        ItemLineAlignment = Enum.ItemLineAlignment.Center,
        VerticalFlex = Enum.UIFlexAlignment.SpaceEvenly,
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
    })}, v7)
    return react.createElement("Frame", v9, v6)
end