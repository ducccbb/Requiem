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
--  File: ReplicatedStorage.Client.Interfaces.Components.Screen.Stories.GearDrum.story
--                               Dumped in 0.00475 seconds
--                          Bytecode version 9  |  22 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
game:GetService("GuiService")
game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Promise = require(Common:WaitForChild("Promise"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_2:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local Utilities = v1.Parent.Parent.Parent:WaitForChild("Utilities")
local QuickStory = require(Utilities:WaitForChild("QuickStory"))
local Primitives = v1.Parent.Parent.Parent:WaitForChild("Primitives")
local Frame = require(Primitives:WaitForChild("Frame"))
local Hooks = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useAsyncEffect = require(Hooks:WaitForChild("useAsyncEffect"))
local Hooks_2 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useMotion = require(Hooks_2:WaitForChild("useMotion"))
local Hooks_3 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useRem = require(Hooks_3:WaitForChild("useRem"))
local u124 = Color3.fromRGB(246, 150, 255)
local u129 = Color3.fromRGB(108, 255, 238)
local v3 = {Enabled = false}
local function GearTrainerKeyNode(p1) -- Line: 52 -- upvalues: useRem (val), useMotion (val), react (val), Frame (val), u124 (val), u129 (val)
    local u16, v1, v2
    local v3 = useRem()
    if p1.Node.Side ~= 1 then
        v1 = 1
    else
        v1 = 0
    end
    local v4 = UDim2.fromScale(v1, 0.5)
    v1, u16 = useMotion(v4.X.Scale)
    react.useEffect(function() -- Line: 58 -- upvalues: u16 (val), p1 (val)
        local v1
        if p1.Node.Side ~= 1 then
            v1 = -0.05
        else
            v1 = 0.05
        end
        u16:linear(0.5 + v1, {speed = 1 / p1.Node.Speed})
    end, {})
    local createElement = react.createElement
    local v5 = {BackgroundTransparency = 0, ZIndex = 1, AnchorPoint = Vector2.new(0.5, 0.5), Position = v1:map(function(p1) -- Line: 66
        return UDim2.fromScale(p1, 0.5)
    end)}
    local v6 = v3(15)
    v5.Size = UDim2.fromOffset(v6, v3(15))
    if p1.Node.Side ~= 1 then
        v2 = u129
    else
        v2 = u124
        if not v2 then
            v2 = u129
        end
    end
    v5.BackgroundColor3 = v2
    return createElement(Frame, v5, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(1, 0)})})
end
local function GearTrainerMinigame(p1) -- Line: 80 -- upvalues: useRem (val), react (val), useMotion (val), useAsyncEffect (val), Promise (val), GearTrainerKeyNode (val), Frame (val), u124 (val)
    local Enabled, u11, u12, u17, u21, u22, u31, u36, u6, u7, v1, v2, v3
    local v4 = useRem()
    u6, u7 = react.useState(false)
    u11, u12 = react.useState(false)
    v3, u17 = react.useState({})
    u21, u22 = react.useBinding(0)
    local v5 = useMotion(0)
    v1, u31 = react.useBinding(0)
    _, u36 = react.useBinding(0)
    react.useEffect(function() -- Line: 94 -- upvalues: u7 (val), p1 (val), u12 (val), u17 (val), u22 (val), u36 (val), u31 (val)
        u7(p1.Enabled)
        if not p1.Enabled then
            u12(false)
            u17({})
            u22(0)
            u36(0)
            u31(0)
        end
    end, {p1.Enabled})
    useAsyncEffect(function() -- Line: 106 -- upvalues: u6 (val), Promise (upval), u12 (val)
        if not u6 then
            return
        end
        return Promise.delay(0.1):andThen(function() -- Line: 112 -- upvalues: u12 (upval)
            u12(true)
        end)
    end, {u6})
    react.useEffect(function() -- Line: 117 -- upvalues: u11 (val), u21 (val), u17 (val), u22 (val)
        if not u11 then
            return
        end
        local u3 = coroutine.create(function() -- Line: 124 -- upvalues: u21 (upval), u17 (upval), u22 (upval)
            local u0 = 0
            while task.wait(1) do
                local u8 = u21:getValue() + 1
                u17(function(p1) -- Line: 136 -- upvalues: u0 (ref), u22 (upval), u8 (val)
                    local v1 = math.random(10, 20) / 10 * 1
                    table.insert(p1, {
                        Side = math.random(1, 2),
                        Speed = v1,
                        Scored = function(p1) end,
                    })
                    u0 = v1
                    u22(u8)
                    return table.clone(p1)
                end)
            end
        end)
        coroutine.resume(u3)
        return function() -- Line: 157 -- upvalues: u3 (val)
            coroutine.close(u3)
        end
    end, {u11})
    local v6 = {}
    for k, v in pairs(v3) do
        v2 = tostring(k)
        v6[v2] = react.createElement(GearTrainerKeyNode, {Enabled = u11 and u6, Node = v})
    end
    local v7 = {BackgroundTransparency = 1}
    Enabled = u11
    if Enabled then
        Enabled = p1.Enabled
    end
    v7.Visible = Enabled
    local v8 = {}
    local v9 = {
        BackgroundTransparency = 1,
        TextSize = 36,
        TextTransparency = 0.2,
        Size = UDim2.fromScale(1, 0.1),
        Text = v5:map(function(p1) -- Line: 178
            return (tostring((math.floor((math.max(p1, 0))))))
        end),
        Font = Enum.Font.SourceSansBold,
        TextColor3 = u124,
        AnchorPoint = Vector2.new(1, 1),
    }
    local v10 = UDim2.fromScale(1, 1)
    v9.Position = v10 + UDim2.fromOffset(-50, -50)
    v9.TextXAlignment = Enum.TextXAlignment.Right
    v8.Score = react.createElement("TextLabel", v9)
    v9 = {
        BackgroundTransparency = 1,
        TextSize = 20,
        TextTransparency = 0.5,
        Size = UDim2.fromScale(1, 0.1),
        Text = v1:map(function(p1) -- Line: 193
            return "Strike " .. tostring((math.max(p1, 0)))
        end),
        Font = Enum.Font.SourceSansBold,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        AnchorPoint = Vector2.new(1, 1),
    }
    v10 = UDim2.fromScale(1, 1)
    v9.Position = v10 + UDim2.fromOffset(-50, -86)
    v9.TextXAlignment = Enum.TextXAlignment.Right
    v8.Strikes = react.createElement("TextLabel", v9)
    v9 = {BackgroundTransparency = 0, AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5)}
    v10 = v4(400)
    v9.Size = UDim2.fromOffset(v10, v4(20))
    v9.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
    local v11 = {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(1, 0)}), Stroke = react.createElement("UIStroke", {Thickness = 1, Color = Color3.fromRGB(60, 60, 60)})}
    local v12 = {BackgroundTransparency = 0, AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5)}
    local v13 = v4(40)
    v12.Size = UDim2.fromOffset(v13, v4(40))
    v12.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
    v11.Center = react.createElement(Frame, v12, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(1, 0)})})
    v8.Bar = react.createElement(Frame, v9, v11, v6)
    return react.createElement(Frame, v7, v8)
end
local function GearTrainerMinigameTimer(p1) -- Line: 236 -- upvalues: react (val), useMotion (val), useRem (val), useAsyncEffect (val), Promise (val), Frame (val)
    local u10, u14, u18, u4, u5, v1, v2, v3
    u4, u5 = react.useState(false)
    v1, u10 = react.useState(4)
    v2, u14 = useMotion(100)
    v3, u18 = useMotion(1)
    local v4 = useRem()
    react.useEffect(function() -- Line: 245 -- upvalues: u5 (val), p1 (val), u10 (val), u14 (val), u18 (val)
        u5(p1.Enabled)
        if not p1.Enabled then
            u10(4)
            u14:immediate(100)
            u18:immediate(1)
        end
    end, {p1.Enabled})
    useAsyncEffect(function() -- Line: 256 -- upvalues: u4 (val), u10 (val), u14 (val), u18 (val), Promise (upval)
        if not u4 then
            return
        end
        local function incrementTimer() -- Line: 261 -- upvalues: u10 (upval), u14 (upval), u18 (upval)
            u10(function(p1) -- Line: 262 -- upvalues: u14 (upval), u18 (upval)
                u14:immediate(100)
                u18:immediate(0)
                u14:spring(40, {frequency = 1})
                u18:spring(1, {frequency = 1})
                return p1 - 1
            end)
        end
        local v1 = {}
        local v2 = Promise.delay(1):andThen(incrementTimer)
        local v3 = Promise.delay(2):andThen(incrementTimer)
        local v4 = Promise.delay(3):andThen(incrementTimer)
        v1[1] = v2
        v1[2] = v3
        v1[3] = v4
        v1[4] = Promise.delay(4):andThen(incrementTimer)
        return Promise.all(v1)
    end, {u4})
    local v5 = {BackgroundTransparency = 1}
    local v6 = v4(300)
    v5.Size = UDim2.fromOffset(v6, v4(300))
    return react.createElement(Frame, v5, {Label = react.createElement("TextLabel", {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 1),
        Text = v1,
        Font = Enum.Font.SourceSansBold,
        TextSize = v2,
        TextTransparency = v3,
        TextColor3 = Color3.fromRGB(255, 255, 255),
    })})
end
return QuickStory(v3, function(p1) -- Line: 306 -- upvalues: react (val), Frame (val), GearTrainerMinigame (val)
    return react.createElement(Frame, {}, {Minigame = react.createElement(GearTrainerMinigame, {
        Enabled = p1.Enabled,
        Result = function(a1) -- Line: 311 -- upvalues: p1 (val)
            p1.Completed(a1)
        end,
    })})
end)