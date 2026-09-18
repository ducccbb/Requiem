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
--            File: ReplicatedStorage.Client.Interfaces.Routes.Screen.Oxygen
--                              Dumped in 0.000938 seconds
--                          Bytecode version 9  |  6 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local Components = script.Parent.Parent.Parent:WaitForChild("Components")
local Utilities = Components:WaitForChild("Utilities")
local TransparencyGroup = require(Utilities:WaitForChild("TransparencyGroup"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Utilities_2 = Common:WaitForChild("Utilities")
local State = require(Utilities_2:WaitForChild("State"))
return function() -- Line: 22 -- upvalues: State (val), react (val), TransparencyGroup (val)
    local oxygen, oxygen_2, u10, u15, u22, v1, v2, v3
    _, _, oxygen, oxygen_2 = State("oxygen")
    v1, u10 = react.useBinding(1)
    v2, u15 = react.useState(false)
    v3, u22 = react.useState(TweenInfo.new(0.3))
    react.useEffect(function() -- Line: 28 -- upvalues: oxygen (val), u10 (val), u22 (val), u15 (val), oxygen_2 (val)
        local v1, v2
        local v3 = oxygen(function(p1) -- Line: 29 -- upvalues: u10 (upval), u22 (upval), u15 (upval)
            local v1
            if not p1 then
                u10(1)
                u22(TweenInfo.new(0.1))
                u15(false)
                return
            end
            local v2 = p1.maxOxygen or 100
            u10((p1.oxygen or v2) / v2)
            local v3 = p1.visible == true
            if not v3 then
                v1 = 0.1
            else
                v1 = 0.3
            end
            u22(TweenInfo.new(v1))
            u15(v3)
        end)
        v1 = oxygen_2()
        if v1 then
            local v4
            v2 = v1.maxOxygen or 100
            u10((v1.oxygen or v2) / v2)
            local v5 = v1.visible == true
            if not v5 then
                v4 = 0.1
            else
                v4 = 0.3
            end
            u22(TweenInfo.new(v4))
            u15(v5)
        end
        return v3
    end, {})
    return react.createElement(TransparencyGroup, {Enabled = v2, Tween = v3}, {Frame = react.createElement("Frame", {
        BackgroundTransparency = 0.7,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.8),
        Size = UDim2.fromOffset(638, 11),
    }, {Container = react.createElement("Frame", {
        BackgroundTransparency = 0.7,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(189, 189, 189),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
    }, {Value = react.createElement("Frame", {
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundColor3 = v1:map(function(p1) -- Line: 82
            local v1 = Color3.fromRGB(82, 196, 255)
            local v2 = Color3.fromRGB(255, 82, 82)
            return v1:Lerp(v2, 1 - p1)
        end),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0, 0.5),
        Size = v1:map(function(p1) -- Line: 88
            return UDim2.fromScale(p1, 1)
        end),
    })}), Padding = react.createElement("UIPadding", {PaddingBottom = UDim.new(0, 2), PaddingLeft = UDim.new(0, 2), PaddingRight = UDim.new(0, 2), PaddingTop = UDim.new(0, 2)}), Stroke = react.createElement("UIStroke", {Transparency = 0.8, BorderOffset = UDim.new(0, 3), Color = Color3.fromRGB(255, 255, 255)})})})
end