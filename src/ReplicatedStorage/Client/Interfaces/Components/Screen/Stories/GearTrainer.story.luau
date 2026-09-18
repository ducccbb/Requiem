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
-- File: ReplicatedStorage.Client.Interfaces.Components.Screen.Stories.GearTrainer.story
--                               Dumped in 0.00555 seconds
--                          Bytecode version 9  |  28 functions

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
local Utilities = v1.Parent.Parent.Parent:WaitForChild("Utilities")
local QuickStory = require(Utilities:WaitForChild("QuickStory"))
local Primitives = v1.Parent.Parent.Parent:WaitForChild("Primitives")
local Frame = require(Primitives:WaitForChild("Frame"))
local Primitives_2 = v1.Parent.Parent.Parent:WaitForChild("Primitives")
require(Primitives_2:WaitForChild("Shadow"))
local Hooks = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useAsyncEffect = require(Hooks:WaitForChild("useAsyncEffect"))
local Hooks_2 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useMotion = require(Hooks_2:WaitForChild("useMotion"))
local Hooks_3 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useRem = require(Hooks_3:WaitForChild("useRem"))
local u127 = Color3.fromRGB(246, 150, 255)
local u132 = Color3.fromRGB(108, 255, 238)
local function GearTrainerKeyNode(p1) -- Line: 50 -- upvalues: useRem (val), useMotion (val), react (val), useAsyncEffect (val), Promise (val), Frame (val), u132 (val), u127 (val)
    local u10, u15, u19, u23, u27, u31, u36, u40, u44, u6, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11
    local u2 = useRem()
    v6, u6 = useMotion(1)
    v8, u10 = useMotion(0)
    v10, u15 = react.useState(true)
    v11, u19 = useMotion(1)
    v1, u23 = useMotion(1)
    v2, u27 = useMotion(0)
    v3, u31 = useMotion(1)
    v4, u36 = react.useState(false)
    v5, u40 = useMotion(0)
    v7, u44 = useMotion(1)
    local Length = p1.Node.Length
    local Speed = p1.Node.Speed
    local Angle = p1.Node.Angle
    useAsyncEffect(function() -- Line: 73 -- upvalues: p1 (val), u19 (val), u23 (val), u6 (val), Promise (upval), u15 (val), u10 (val), u36 (val), u44 (val), u40 (val), Speed (val), u31 (val), u27 (val)
        if not p1.Enabled then
            u19:immediate(1)
            return
        end
        u23:spring(0.7, {frequency = 1})
        u19:spring(0, {frequency = 2})
        u6:linear(0, {speed = 1})
        local v1 = {}
        local v2 = Promise.delay(0.8):andThen(function() -- Line: 92 -- upvalues: u15 (upval), u10 (upval), u19 (upval), p1 (upval), u36 (upval), u44 (upval), u40 (upval), Speed (upval)
            u15(false)
            u10:spring(1, {frequency = 1})
            u19:spring(1, {frequency = 0.7})
            if 0 < p1.Node.Length then
                u36(true)
                u44:immediate(1)
                u44:spring(0, {frequency = 0.5})
                u40:linear(1, {speed = 1 / Speed})
            end
        end)
        local v3 = Promise.delay(Speed + 0.8):andThen(function() -- Line: 117 -- upvalues: p1 (upval), u31 (upval), u44 (upval)
            if 0 < p1.Node.Length then
                u31:linear(1, {speed = 3.3333333333333335})
                u44:spring(1, {frequency = 0.2})
            end
        end)
        v1[1] = v2
        v1[2] = v3
        v1[3] = Promise.delay(0.3):andThen(function() -- Line: 129 -- upvalues: p1 (upval), u27 (upval), u31 (upval)
            if 0 < p1.Node.Length then
                u27:linear(1, {speed = 1.1111111111111112})
                u31:linear(0, {speed = 2})
            end
        end)
        return Promise.all(v1)
    end, {p1.Enabled})
    local v12 = UDim2.fromScale(p1.Node.Position.X, p1.Node.Position.Y)
    local v13 = {BackgroundTransparency = 1, ZIndex = 1, AnchorPoint = Vector2.new(0.5, 0.5), Position = v12}
    local v14 = u2(92)
    v13.Size = UDim2.fromOffset(v14, u2(92))
    v13.Rotation = Angle
    local v15 = {}
    local v16 = {ZIndex = -1, BackgroundTransparency = v3:map(function(p1) -- Line: 154
        return 0.5 + 0.5 * p1
    end), Size = v2:map(function(p1) -- Line: 157 -- upvalues: u2 (val), Length (val)
        local v1 = u2(92)
        local v2 = v1 + u2(p1 * Length)
        return UDim2.fromOffset(v2, u2(92))
    end), AnchorPoint = Vector2.new(0, 0.5)}
    local v17 = u2(-46)
    v16.Position = v12 + UDim2.fromOffset(v17, 0)
    v16.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    local v18 = {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(1, 0)}), Outer = react.createElement(Frame, {BackgroundTransparency = 1, ZIndex = 2, Size = UDim2.fromScale(1, 1)}, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(1, 0)}), Stroke = react.createElement("UIStroke", {Thickness = u2(6), Color = u132, Transparency = v3})})}
    local v19 = {BackgroundTransparency = 1, ZIndex = 1}
    local v20 = u2(82)
    v19.Size = UDim2.fromOffset(v20, u2(82))
    v19.AnchorPoint = Vector2.new(0, 0.5)
    v19.Position = v5:map(function(p1) -- Line: 189 -- upvalues: u2 (val), Length (val)
        local v1 = UDim2.fromScale(0, 0.5)
        local v2 = u2(p1 * Length)
        return v1 + UDim2.fromOffset(v2, u2(0))
    end)
    v19.Visible = v4
    v18.Movement = react.createElement(Frame, v19, {Stroke = react.createElement("UIStroke", {Thickness = u2(6), Color = Color3.fromRGB(255, 255, 255), Transparency = v7}), Corner = react.createElement("UICorner", {CornerRadius = UDim.new(1, 0)})})
    v19 = {
        BackgroundTransparency = 1,
        ZIndex = 2,
        Size = v8:map(function(p1) -- Line: 207 -- upvalues: u2 (val)
            local v1 = u2(p1 * 20 + 92)
            return UDim2.fromOffset(v1, u2(p1 * 20 + 92))
        end),
        Position = UDim2.fromScale(0, 0.5),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        AnchorPoint = Vector2.new(0, 0.5),
        Rotation = -Angle,
    }
    local v21 = {}
    local v22 = {BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1)}
    if p1.Node.Count % 2 ~= 0 then
        v9 = "E"
    else
        v9 = "Q"
    end
    v22.Text = v9
    v22.Font = Enum.Font.SourceSansLight
    v22.TextSize = u2(46)
    v22.TextColor3 = Color3.fromRGB(255, 255, 255)
    v22.TextTransparency = v11
    v21.Label = react.createElement("TextLabel", v22)
    v22 = {
        Image = "rbxassetid://114110160149754",
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        BackgroundTransparency = v11:map(function(p1) -- Line: 232
            return 0.9 + 0.09999999999999998 * p1
        end),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        Size = UDim2.fromScale(1, 1),
        ImageTransparency = v11:map(function(p1) -- Line: 237
            return 0.5 + 0.5 * p1
        end),
        ImageColor3 = Color3.fromRGB(0, 0, 0),
    }
    v9 = {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(1, 0)}), Outer = react.createElement(Frame, {BackgroundTransparency = 1, ZIndex = 2, Size = UDim2.fromScale(1, 1)}, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(1, 0)}), Stroke = react.createElement("UIStroke", {Thickness = u2(6), Color = Color3.fromRGB(255, 255, 255), Transparency = v11})})}
    local v23 = {BackgroundTransparency = 1, ZIndex = 1}
    local v24 = UDim2.fromScale(1, 1)
    local v25 = u2(-12)
    v23.Size = v24 + UDim2.fromOffset(v25, u2(-12))
    v23.AnchorPoint = Vector2.new(0.5, 0.5)
    v9.Color = react.createElement(Frame, v23, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(1, 0)}), Stroke = react.createElement("UIStroke", {Thickness = u2(6), Transparency = v11:map(function(p1) -- Line: 275
        return 0.1 + 0.9 * p1
    end), Color = u127})})
    v21.Gradient = react.createElement("ImageLabel", v22, v9)
    v21.Ring = react.createElement("ImageLabel", {
        Image = "rbxassetid://127999577981138",
        BackgroundTransparency = 1,
        Size = v6:map(function(p1) -- Line: 285 -- upvalues: u2 (val)
            local v1 = u2(600 * p1)
            return UDim2.fromOffset(v1, u2(600 * p1))
        end),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        ImageColor3 = u127,
        ImageTransparency = v1,
        Visible = v10,
    })
    v18.Node = react.createElement(Frame, v19, v21)
    v15.Slider = react.createElement(Frame, v16, v18)
    return react.createElement(Frame, v13, v15)
end
local function GearTrainerMinigame(p1) -- Line: 302 -- upvalues: react (val), useAsyncEffect (val), Promise (val), GearTrainerKeyNode (val), Frame (val)
    local Enabled, u10, u15, u19, u20, u4, u5, u9, v1, v2, v3
    u4, u5 = react.useState(false)
    u9, u10 = react.useState(false)
    local v4 = {}
    v2, u15 = react.useState(v4)
    u19, u20 = react.useBinding(0)
    react.useEffect(function() -- Line: 309 -- upvalues: u5 (val), p1 (val), u10 (val), u15 (val), u20 (val)
        u5(p1.Enabled)
        if not p1.Enabled then
            u10(false)
            u15({})
            u20(0)
        end
    end, {p1.Enabled})
    useAsyncEffect(function() -- Line: 319 -- upvalues: u4 (val), Promise (upval), u10 (val)
        if not u4 then
            return
        end
        return Promise.delay(5):andThen(function() -- Line: 324 -- upvalues: u10 (upval)
            u10(true)
        end)
    end, {u4})
    react.useEffect(function() -- Line: 329 -- upvalues: u9 (val), u15 (val), u19 (val), u20 (val)
        if not u9 then
            return
        end
        local u1 = 1
        local u4 = coroutine.create(function() -- Line: 336 -- upvalues: u1 (ref), u15 (upval), u19 (upval), u20 (upval)
            local u15 = false
            local u16 = 0
            while task.wait(u1 * 1) do
                if u15 then
                    task.wait(u16)
                end
                u1 = u1 - 0.03
                u15(function(p1) -- Line: 347 -- upvalues: u19 (upval), u1 (upval), u15 (ref), u16 (ref), u20 (upval)
                    local v1
                    local v2 = u19:getValue() + 1
                    local v3 = math.random(1, 5) == 1
                    local v4 = math.random(30, 70) / 100
                    local v5 = math.random(30, 70) / 100
                    local v6 = math.random(10, 20) / 10
                    local v7 = v6 * u1
                    local v8 = {Position = Vector2.new(v4, v5), Count = v2}
                    if v3 then
                        v1 = math.random(0, 360)
                    else
                        v1 = 0
                    end
                    v8.Angle = v1
                    if v3 then
                        v1 = math.random(200, 400)
                    else
                        v1 = 0
                    end
                    v8.Length = v1
                    if v3 then
                        v1 = v7
                    else
                        v1 = 0
                    end
                    v8.Speed = v1
                    table.insert(p1, v8)
                    u15 = v3
                    u16 = v7
                    u20(v2)
                    return table.clone(p1)
                end)
            end
        end)
        coroutine.resume(u4)
        return function() -- Line: 379 -- upvalues: u4 (val)
            coroutine.close(u4)
        end
    end, {u9})
    v3 = {}
    for k, v in pairs(v2) do
        v1 = tostring(k)
        v3[v1] = react.createElement(GearTrainerKeyNode, {Enabled = u9 and u4, Node = v})
    end
    local v5 = {BackgroundTransparency = 1}
    Enabled = u9
    if Enabled then
        Enabled = p1.Enabled
    end
    v5.Visible = Enabled
    return react.createElement(Frame, v5, v3)
end
local function GearTrainerMinigameTimer(p1) -- Line: 399 -- upvalues: react (val), useMotion (val), useRem (val), useAsyncEffect (val), Promise (val), Frame (val)
    local u10, u14, u18, u4, u5, v1, v2, v3
    u4, u5 = react.useState(false)
    v1, u10 = react.useState(4)
    v2, u14 = useMotion(100)
    v3, u18 = useMotion(1)
    local v4 = useRem()
    react.useEffect(function() -- Line: 408 -- upvalues: u5 (val), p1 (val), u10 (val), u14 (val), u18 (val)
        u5(p1.Enabled)
        if not p1.Enabled then
            u10(4)
            u14:immediate(100)
            u18:immediate(1)
        end
    end, {p1.Enabled})
    useAsyncEffect(function() -- Line: 419 -- upvalues: u4 (val), u10 (val), u14 (val), u18 (val), Promise (upval)
        if not u4 then
            return
        end
        local function incrementTimer() -- Line: 424 -- upvalues: u10 (upval), u14 (upval), u18 (upval)
            u10(function(p1) -- Line: 425 -- upvalues: u14 (upval), u18 (upval)
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
return QuickStory({Enabled = false}, function(p1) -- Line: 467 -- upvalues: react (val), Frame (val), GearTrainerMinigameTimer (val), GearTrainerMinigame (val)
    return react.createElement(Frame, {}, {Timer = react.createElement(GearTrainerMinigameTimer, p1), Minigame = react.createElement(GearTrainerMinigame, p1)})
end)