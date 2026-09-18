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
--        File: ReplicatedStorage.Client.Interfaces.Components.Universal.Loading
--                               Dumped in 0.00153 seconds
--                          Bytecode version 9  |  12 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Promise = require(Common:WaitForChild("Promise"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_2:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local Utilities = v1.Parent.Parent:WaitForChild("Utilities")
local Color = require(Utilities:WaitForChild("Color"))
local Hooks = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useAsyncEffect = require(Hooks:WaitForChild("useAsyncEffect"))
local Hooks_2 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useConstants = require(Hooks_2:WaitForChild("useConstants"))
local Hooks_3 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useMotion = require(Hooks_3:WaitForChild("useMotion"))
local Hooks_4 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useTheme = require(Hooks_4:WaitForChild("useTheme"))
local function peak(p1, p2) -- Line: 33
    if p1 > p2 then
        return 0
    end
    local v1 = p2 / 2
    if p1 <= v1 then
        return p1 / v1
    end
    return (p2 - p1) / v1
end
return function(p1) -- Line: 46 -- upvalues: useMotion (val), useTheme (val), useConstants (val), useAsyncEffect (val), Promise (val), react (val), Color (val), peak (val)
    local Padding_2, u4, v1
    v1, u4 = useMotion(0)
    local v2 = useTheme()
    local v3 = useConstants()
    local Padding = p1.Padding
    if Padding then
        Padding = typeof(p1.Padding) == "UDim2"
    end
    useAsyncEffect(function() -- Line: 53 -- upvalues: p1 (val), u4 (val), Promise (upval)
        local createSpringAnimation
        if not p1.Enabled then
            u4:immediate(0)
            return
        end
        function createSpringAnimation() -- Line: 59 -- upvalues: u4 (upval), Promise (upval), createSpringAnimation (val)
            u4:immediate(0)
            u4:spring(1, {frequency = 1})
            return Promise.delay(0.6666666666666666):andThen(function() -- Line: 65 -- upvalues: createSpringAnimation (upval)
                return createSpringAnimation()
            end)
        end
        return createSpringAnimation()
    end, {p1.Enabled})
    local createElement = react.createElement
    local v4 = {BackgroundTransparency = 0, BorderSizePixel = 0, ZIndex = 10}
    local v5 = UDim2.fromScale(1, 1)
    if not Padding then
        Padding_2 = UDim2.fromOffset(v3.Padding.Sizes[p1.Padding or "None"] * 2, v3.Padding.Sizes[p1.Padding or "None"] * 2)
    else
        Padding_2 = p1.Padding
        if not Padding_2 then
            Padding_2 = UDim2.fromOffset(v3.Padding.Sizes[p1.Padding or "None"] * 2, v3.Padding.Sizes[p1.Padding or "None"] * 2)
        end
    end
    v4.Size = v5 + Padding_2
    v4.BackgroundColor3 = Color.Darken(v2.PageBackground, 0.6)
    v4.Visible = p1.Enabled
    v4.AnchorPoint = Vector2.new(0.5, 0.5)
    v4.Position = UDim2.fromScale(0.5, 0.5)
    local v6 = {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, p1.Corner or 4)})}
    local v7 = {BorderSizePixel = 0, AnchorPoint = Vector2.new(0.5, 0.5)}
    local v8 = UDim2.fromScale(0.5, 0.5)
    v7.Position = v8 + UDim2.fromOffset(-20, 0)
    v7.BackgroundColor3 = Color3.fromRGB(191, 191, 191)
    v7.Size = v1:map(function(p1) -- Line: 95 -- upvalues: peak (upval)
        local v1 = peak(p1, 0.333)
        local v2 = UDim2.fromOffset(10, 10)
        return v2 + UDim2.fromOffset(v1 * 3, v1 * 3)
    end)
    v7.BackgroundTransparency = v1:map(function(p1) -- Line: 101 -- upvalues: peak (upval)
        local v1 = 1 - peak(p1, 0.333)
        return (math.clamp(v1, 0.2, 0.8))
    end)
    v6.BulbA = react.createElement("Frame", v7, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(1, 1)})})
    v7 = {BorderSizePixel = 0, AnchorPoint = Vector2.new(0.5, 0.5)}
    v8 = UDim2.fromScale(0.5, 0.5)
    v7.Position = v8 + UDim2.fromOffset(0, 0)
    v7.BackgroundColor3 = Color3.fromRGB(191, 191, 191)
    v7.Size = v1:map(function(p1) -- Line: 115 -- upvalues: peak (upval)
        local v1 = peak(p1, 0.666)
        local v2 = UDim2.fromOffset(10, 10)
        return v2 + UDim2.fromOffset(v1 * 3, v1 * 3)
    end)
    v7.BackgroundTransparency = v1:map(function(p1) -- Line: 121 -- upvalues: peak (upval)
        local v1 = 1 - peak(p1, 0.666)
        return (math.clamp(v1, 0.2, 0.8))
    end)
    v6.BulbB = react.createElement("Frame", v7, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(1, 1)})})
    v7 = {BorderSizePixel = 0, AnchorPoint = Vector2.new(0.5, 0.5)}
    v8 = UDim2.fromScale(0.5, 0.5)
    v7.Position = v8 + UDim2.fromOffset(20, 0)
    v7.BackgroundColor3 = Color3.fromRGB(191, 191, 191)
    v7.Size = v1:map(function(p1) -- Line: 135 -- upvalues: peak (upval)
        local v1 = peak(p1, 1)
        local v2 = UDim2.fromOffset(10, 10)
        return v2 + UDim2.fromOffset(v1 * 3, v1 * 3)
    end)
    v7.BackgroundTransparency = v1:map(function(p1) -- Line: 141 -- upvalues: peak (upval)
        local v1 = 1 - peak(p1, 1)
        return (math.clamp(v1, 0.2, 0.8))
    end)
    v6.BulbC = react.createElement("Frame", v7, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(1, 1)})})
    return createElement("Frame", v4, v6)
end