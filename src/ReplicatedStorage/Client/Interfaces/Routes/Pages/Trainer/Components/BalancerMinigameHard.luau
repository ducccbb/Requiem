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
--File: ReplicatedStorage.Client.Interfaces.Routes.Pages.Trainer.Components.BalancerMinigameHard
--                               Dumped in 0.00453 seconds
--                          Bytecode version 9  |  39 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local GuiService = game:GetService("GuiService")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Constants = require(Common:WaitForChild("Constants"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Promise = require(Common_2:WaitForChild("Promise"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_3:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Utilities = Common_3:WaitForChild("Utilities")
local Sounds = require(Utilities:WaitForChild("Sounds"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_5:WaitForChild("Common")
local Sounds_2 = Common_4:WaitForChild("Sounds")
local Training = require(Sounds_2:WaitForChild("Training"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_6:WaitForChild("Common")
local GEAR_TRAINER = require(Common_5:WaitForChild("Debugger")).useDebugger("GEAR_TRAINER")
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_7:WaitForChild("Client")
local Interfaces = Client:WaitForChild("Interfaces")
local Components = Interfaces:WaitForChild("Components")
local Primitives = Components:WaitForChild("Primitives")
local Frame = require(Primitives:WaitForChild("Frame"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_8:WaitForChild("Client")
local Interfaces_2 = Client_2:WaitForChild("Interfaces")
local Hooks = Interfaces_2:WaitForChild("Hooks")
local useAsyncEffect = require(Hooks:WaitForChild("useAsyncEffect"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_9:WaitForChild("Client")
local Interfaces_3 = Client_3:WaitForChild("Interfaces")
local Hooks_2 = Interfaces_3:WaitForChild("Hooks")
local useMotion = require(Hooks_2:WaitForChild("useMotion"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_10:WaitForChild("Client")
local Interfaces_4 = Client_4:WaitForChild("Interfaces")
local Hooks_3 = Interfaces_4:WaitForChild("Hooks")
local useRem = require(Hooks_3:WaitForChild("useRem"))
local u223 = Color3.fromRGB(246, 150, 255)
local u228 = Color3.fromRGB(108, 255, 238)
local function GearTrainerKeyNode(p1) -- Line: 60 -- upvalues: useRem (val), useMotion (val), react (val), UserInputService (val), GuiService (val), Sounds (val), Training (val), useAsyncEffect (val), Promise (val), Frame (val), u223 (val), u228 (val)
    local u10, u15, u19, u20, u24, u28, u32, u36, u41, u45, u49, u5, u54, u58, u6, u63, u66, u67, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13
    local u2 = useRem()
    u5, u6 = useMotion(1)
    v11, u10 = useMotion(0)
    v13, u15 = react.useState(true)
    u19, u20 = react.useState(true)
    v1, u24 = useMotion(1)
    v2, u28 = useMotion(1)
    v3, u32 = useMotion(0)
    v4, u36 = useMotion(1)
    v5, u41 = react.useState(false)
    v6, u45 = useMotion(0)
    v7, u49 = useMotion(1)
    v8, u54 = react.useState(false)
    v9, u58 = useMotion(0)
    v10, u63 = react.useState("")
    u66, u67 = useMotion(1)
    local u71 = react.useRef(nil)
    local Length = p1.Node.Length
    local Speed = p1.Node.Speed
    local Angle = p1.Node.Angle
    react.useEffect(function() -- Line: 91 -- upvalues: p1 (val), u19 (val), u71 (val), UserInputService (upval), GuiService (upval), u5 (val), u2 (val), u63 (val), Sounds (upval), Training (upval), u54 (val), u58 (val), u67 (val)
        local Q
        if not p1.Enabled or not u19 or not u71.current then
            return
        end
        if p1.Node.Count % 2 ~= 0 then
            Q = Enum.KeyCode.E
        else
            Q = Enum.KeyCode.Q
            if not Q then
                Q = Enum.KeyCode.E
            end
        end
        local u11 = nil
        u11 = UserInputService.InputBegan:Connect(function(a1) -- Line: 99 -- upvalues: Q (val), GuiService (upval), UserInputService (upval), u71 (upval), u5 (upval), u2 (upval), u11 (ref), u63 (upval), p1 (upval), Sounds (upval), Training (upval), u54 (upval), u58 (upval), u67 (upval)
            if a1.KeyCode ~= Q then
                return
            end
            local GuiInset = GuiService:GetGuiInset()
            local MouseLocation = UserInputService:GetMouseLocation()
            local v1 = Vector2.new(MouseLocation.X, MouseLocation.Y)
            local v2 = v1 + Vector2.new(0, -GuiInset.Y)
            local v3 = u5:getValue()
            local v4 = v3 < 0.2
            local v5 = u5:getValue()
            v3 = v5 < 0.5
            if (v2 - u71.current.AbsolutePosition).Magnitude < u2(100) then
                local v6
                u11:Disconnect()
                if v4 then
                    v6 = "PERFECT"
                elseif not v3 then
                    v6 = "MISS"
                else
                    v6 = "GOOD"
                end
                u63(v6)
                if v4 then
                    v6 = 2
                elseif not v3 then
                    v6 = 0
                else
                    v6 = 1
                end
                p1.Node.Scored(v6)
                if not v4 then
                    Sounds.playGlobalSoundEffect(Training.Hit, 0.5, 1, 2, NumberRange.new(0.8, 1))
                else
                    Sounds.playGlobalSoundEffect(Training.Hit, 0.5, 1, 2, NumberRange.new(1.1, 1.3))
                end
                u54(true)
                u58:spring(1, {frequency = 1})
                u67:immediate(0)
                u67:spring(1, {frequency = 1})
            end
        end)
        return function() -- Line: 138 -- upvalues: u11 (ref)
            u11:Disconnect()
        end
    end, {p1.Enabled, u19, u71})
    useAsyncEffect(function() -- Line: 143 -- upvalues: p1 (val), u24 (val), u28 (val), u6 (val), Sounds (upval), Training (upval), Promise (upval), u15 (val), u10 (val), u41 (val), u49 (val), u45 (val), Speed (val), u20 (val), u66 (val), u63 (val), u67 (val), u36 (val), u32 (val)
        if not p1.Enabled then
            u24:immediate(1)
            return
        end
        u28:spring(0.7, {frequency = 1})
        u24:spring(0, {frequency = 2})
        u6:linear(0, {speed = 1})
        Sounds.playGlobalSoundEffect(Training.Spawn, 0.1, 0.3, 1, NumberRange.new(0.9, 1.1))
        local v1 = {}
        local v2 = Promise.delay(0.8):andThen(function() -- Line: 164 -- upvalues: u15 (upval), u10 (upval), u24 (upval), p1 (upval), u41 (upval), u49 (upval), u45 (upval), Speed (upval)
            u15(false)
            u10:spring(1, {frequency = 1})
            u24:spring(1, {frequency = 0.7})
            if 0 < p1.Node.Length then
                u41(true)
                u49:immediate(1)
                u49:spring(0, {frequency = 0.5})
                u45:linear(1, {speed = 1 / Speed})
            end
        end)
        local v3 = Promise.delay(1):andThen(function() -- Line: 189 -- upvalues: u20 (upval), u66 (upval), u63 (upval), p1 (upval), u67 (upval)
            u20(false)
            if u66:getValue() == 1 then
                u63("MISS")
                p1.Node.Scored(-2)
                u67:immediate(0)
                u67:spring(1, {frequency = 1})
            end
        end)
        local v4 = Promise.delay(Speed + 0.8):andThen(function() -- Line: 203 -- upvalues: p1 (upval), u36 (upval), u49 (upval)
            if 0 < p1.Node.Length then
                u36:linear(1, {speed = 3.3333333333333335})
                u49:spring(1, {frequency = 0.2})
            end
        end)
        v1[1] = v2
        v1[2] = v3
        v1[3] = v4
        v1[4] = Promise.delay(0.3):andThen(function() -- Line: 215 -- upvalues: p1 (upval), u32 (upval), u36 (upval)
            if 0 < p1.Node.Length then
                u32:linear(1, {speed = 1.1111111111111112})
                u36:linear(0, {speed = 2})
            end
        end)
        return Promise.all(v1)
    end, {p1.Enabled})
    local v14 = UDim2.fromScale(p1.Node.Position.X, p1.Node.Position.Y)
    local v15 = {BackgroundTransparency = 1, ZIndex = 1, AnchorPoint = Vector2.new(0.5, 0.5), Position = v14}
    local v16 = u2(92)
    v15.Size = UDim2.fromOffset(v16, u2(92))
    v15.Rotation = Angle
    v15.Reference = u71
    local v17 = {Hit = react.createElement("TextLabel", {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 1),
        Text = v10,
        Font = Enum.Font.SourceSansBold,
        TextSize = u2(46),
        TextColor3 = u223,
        TextTransparency = u66,
        Rotation = -Angle,
        Position = u66:map(function(p1) -- Line: 249 -- upvalues: u2 (val)
            local v1 = UDim2.fromScale(1, -0.1)
            local v2 = u2(0)
            return v1 + UDim2.fromOffset(v2, u2(-p1 * 50))
        end),
        AnchorPoint = Vector2.new(0, 1),
    }), Circle = react.createElement(Frame, {
        BackgroundTransparency = 1,
        Size = v9:map(function(p1) -- Line: 256 -- upvalues: u2 (val)
            local v1 = u2(p1 * 600)
            return UDim2.fromOffset(v1, u2(p1 * 600))
        end),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Visible = v8,
    }, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(1, 0)}), Stroke = react.createElement("UIStroke", {Thickness = u2(6), Color = u223, Transparency = v9:map(function(p1) -- Line: 271
        return 0.3 + 0.7 * p1
    end)})})}
    local v18 = {ZIndex = -1, BackgroundTransparency = v4:map(function(p1) -- Line: 278
        return 0.35 + 0.65 * p1
    end), Size = v3:map(function(p1) -- Line: 281 -- upvalues: u2 (val), Length (val)
        local v1 = u2(92)
        local v2 = v1 + u2(p1 * Length)
        return UDim2.fromOffset(v2, u2(92))
    end), AnchorPoint = Vector2.new(0, 0.5)}
    local v19 = u2(-46)
    v18.Position = v14 + UDim2.fromOffset(v19, 0)
    v18.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    local v20 = {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(1, 0)}), Outer = react.createElement(Frame, {BackgroundTransparency = 1, ZIndex = 2, Size = UDim2.fromScale(1, 1)}, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(1, 0)}), Stroke = react.createElement("UIStroke", {Thickness = u2(6), Color = u228, Transparency = v4})})}
    local v21 = {BackgroundTransparency = 1, ZIndex = 1}
    local v22 = u2(82)
    v21.Size = UDim2.fromOffset(v22, u2(82))
    v21.AnchorPoint = Vector2.new(0, 0.5)
    v21.Position = v6:map(function(p1) -- Line: 313 -- upvalues: u2 (val), Length (val)
        local v1 = UDim2.fromScale(0, 0.5)
        local v2 = u2(p1 * Length)
        return v1 + UDim2.fromOffset(v2, u2(0))
    end)
    v21.Visible = v5
    v20.Movement = react.createElement(Frame, v21, {Stroke = react.createElement("UIStroke", {Thickness = u2(6), Color = Color3.fromRGB(255, 255, 255), Transparency = v7}), Corner = react.createElement("UICorner", {CornerRadius = UDim.new(1, 0)})})
    v21 = {
        BackgroundTransparency = 1,
        ZIndex = 2,
        Size = v11:map(function(p1) -- Line: 331 -- upvalues: u2 (val)
            local v1 = u2(p1 * 20 + 92)
            return UDim2.fromOffset(v1, u2(p1 * 20 + 92))
        end),
        Position = UDim2.fromScale(0, 0.5),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        AnchorPoint = Vector2.new(0, 0.5),
        Rotation = -Angle,
    }
    local v23 = {}
    local v24 = {BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1)}
    if p1.Node.Count % 2 ~= 0 then
        v12 = "E"
    else
        v12 = "Q"
    end
    v24.Text = v12
    v24.Font = Enum.Font.SourceSansLight
    v24.TextSize = u2(46)
    v24.TextColor3 = Color3.fromRGB(255, 255, 255)
    v24.TextTransparency = v1
    v23.Label = react.createElement("TextLabel", v24)
    v24 = {
        Image = "rbxassetid://114110160149754",
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        BackgroundTransparency = v1:map(function(p1) -- Line: 356
            return 0.9 + 0.09999999999999998 * p1
        end),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        Size = UDim2.fromScale(1, 1),
        ImageTransparency = v1:map(function(p1) -- Line: 361
            return 0.5 + 0.5 * p1
        end),
        ImageColor3 = Color3.fromRGB(0, 0, 0),
    }
    v12 = {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(1, 0)}), Outer = react.createElement(Frame, {BackgroundTransparency = 1, ZIndex = 2, Size = UDim2.fromScale(1, 1)}, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(1, 0)}), Stroke = react.createElement("UIStroke", {Thickness = u2(6), Color = Color3.fromRGB(255, 255, 255), Transparency = v1})})}
    local v25 = {BackgroundTransparency = 1, ZIndex = 1}
    local v26 = UDim2.fromScale(1, 1)
    local v27 = u2(-12)
    v25.Size = v26 + UDim2.fromOffset(v27, u2(-12))
    v25.AnchorPoint = Vector2.new(0.5, 0.5)
    v12.Color = react.createElement(Frame, v25, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(1, 0)}), Stroke = react.createElement("UIStroke", {Thickness = u2(6), Transparency = v1:map(function(p1) -- Line: 399
        return 0.1 + 0.9 * p1
    end), Color = u223})})
    v23.Gradient = react.createElement("ImageLabel", v24, v12)
    v23.Ring = react.createElement("ImageLabel", {
        Image = "rbxassetid://127999577981138",
        BackgroundTransparency = 1,
        Size = u5:map(function(p1) -- Line: 409 -- upvalues: u2 (val)
            local v1 = u2(600 * p1)
            return UDim2.fromOffset(v1, u2(600 * p1))
        end),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        ImageColor3 = u223,
        ImageTransparency = v2,
        Visible = v13,
    })
    v20.Node = react.createElement(Frame, v21, v23)
    v17.Slider = react.createElement(Frame, v18, v20)
    return react.createElement(Frame, v15, v17)
end
local function GearTrainerMinigame(p1) -- Line: 426 -- upvalues: react (val), useMotion (val), GEAR_TRAINER (val), useAsyncEffect (val), Promise (val), Constants (val), GearTrainerKeyNode (val), Frame (val), u223 (val)
    local Enabled, u10, u15, u19, u20, u23, u24, u28, u29, u33, u34, u4, u5, u9, v1, v2
    u4, u5 = react.useState(false)
    u9, u10 = react.useState(false)
    local v3 = {}
    v2, u15 = react.useState(v3)
    u19, u20 = react.useBinding(0)
    u23, u24 = useMotion(0)
    u28, u29 = react.useBinding(0)
    u33, u34 = react.useBinding(0)
    react.useEffect(function() -- Line: 438 -- upvalues: u5 (val), p1 (val), GEAR_TRAINER (upval), u10 (val), u15 (val), u20 (val), u34 (val), u29 (val)
        u5(p1.Enabled)
        if not p1.Enabled then
            GEAR_TRAINER("Resetting Minigame State")
            u10(false)
            u15({})
            u20(0)
            u34(0)
            u29(0)
        end
    end, {p1.Enabled})
    useAsyncEffect(function() -- Line: 452 -- upvalues: u4 (val), Promise (upval), u10 (val)
        if not u4 then
            return
        end
        return Promise.delay(5):andThen(function() -- Line: 457 -- upvalues: u10 (upval)
            u10(true)
        end)
    end, {u4})
    react.useEffect(function() -- Line: 462 -- upvalues: u9 (val), GEAR_TRAINER (upval), u19 (val), u15 (val), u23 (val), u28 (val), u29 (val), u33 (val), u34 (val), u24 (val), Constants (upval), p1 (val), u20 (val)
        if not u9 then
            return
        end
        local u1 = 1
        GEAR_TRAINER("Beginning Gear Trainer Minigame Thread")
        local u7 = coroutine.create(function() -- Line: 471 -- upvalues: u1 (ref), u9 (upval), u19 (upval), u15 (upval), u23 (upval), u28 (upval), u29 (upval), u33 (upval), u34 (upval), u24 (upval), Constants (upval), p1 (upval), u20 (upval)
            local v1
            local u70 = false
            local u74 = 0
            local v2 = 0
            local v3 = nil
            while true do
                v1 = v3
                if not v1 then
                    v1 = u1
                end
                if not (task.wait(1 * v1)) then
                    return
                else
                    if not u9 then
                        return
                    end
                    if u70 then
                        task.wait(u74)
                    end
                    if not u9 then
                        return
                    end
                    local u27 = u19:getValue() + 1
                    u33 = math.random(1, 5) == 1
                    if math.random(1, 12) == 1 then
                        v2 = math.random(4, 7)
                    end
                    if 0 >= v2 then
                        u1 = math.clamp(u1 - 0.01, 0.45, 1)
                        v3 = nil
                    else
                        u33 = false
                        v2 = v2 - 1
                        v3 = 0.43
                    end
                    u15(function(a1) -- Line: 507 -- upvalues: u1 (upval), u27 (val), u33 (ref), u23 (upval), u28 (upval), u29 (upval), u33 (upval), u34 (upval), u24 (upval), Constants (upval), p1 (upval), u70 (ref), u74 (ref), u20 (upval)
                        local v1, v2
                        local v3 = math.random(10, 20) / 10
                        local v4 = v3 * u1
                        for k, v in pairs(a1) do
                            v2 = tick() - v.Spawned
                            if 7 < v2 then
                                a1[k] = nil
                            end
                        end
                        v3 = math.random(1, 1000000)
                        local v5 = {Position = Vector2.new(math.random(30, 70) / 100, math.random(30, 70) / 100), Count = u27}
                        if u33 then
                            v1 = math.random(0, 360)
                        else
                            v1 = 0
                        end
                        v5.Angle = v1
                        if u33 then
                            v1 = math.random(200, 400)
                        else
                            v1 = 0
                        end
                        v5.Length = v1
                        if u33 then
                            v1 = v4
                        else
                            v1 = 0
                        end
                        v5.Speed = v1
                        v5.Spawned = tick()
                        function v5.Scored(a1) -- Line: 532 -- upvalues: u23 (upval), u28 (upval), u29 (upval), u33 (upval), u34 (upval), u24 (upval), Constants (upval), p1 (upval)
                            local v1, v2
                            if a1 >= 0 then
                                v2 = u23:getValue()
                                v1 = v2 + a1 * 300
                            else
                                v2 = u23:getValue()
                                v1 = v2 + a1 * (u28:getValue() / 2) * 300
                                u29(u28:getValue() + 1)
                            end
                            if u33:getValue() < v1 then
                                u34(v1)
                            end
                            u24:spring(v1, {frequency = 0.3})
                            v2 = u28:getValue()
                            if 3 > v2 then
                                if v1 < 0 then
                                    u24:immediate(0)
                                    p1.Result(u33:getValue())
                                end
                            elseif game.PlaceId == Constants.Places.Exam then
                                u24:immediate(0)
                                p1.Result(u33:getValue())
                            elseif v1 < 0 then
                                u24:immediate(0)
                                p1.Result(u33:getValue())
                            end
                        end
                        a1[v3] = v5
                        u70 = u33
                        u74 = v4
                        u20(u27)
                        return table.clone(a1)
                    end)
                end
            end
        end)
        coroutine.resume(u7)
        return function() -- Line: 572 -- upvalues: GEAR_TRAINER (upval), u7 (val)
            GEAR_TRAINER("Closing Gear Trainer Minigame Thread")
            coroutine.close(u7)
        end
    end, {u9})
    local v4 = {}
    for k, v in pairs(v2) do
        v1 = tostring(k)
        v4[v1] = react.createElement(GearTrainerKeyNode, {Enabled = u9 and u4, Node = v})
    end
    local v5 = {BackgroundTransparency = 1}
    Enabled = u9
    if Enabled then
        Enabled = p1.Enabled
    end
    v5.Visible = Enabled
    local v6 = {}
    local v7 = {
        BackgroundTransparency = 1,
        TextSize = 36,
        TextTransparency = 0.2,
        Size = UDim2.fromScale(1, 0.1),
        Text = u23:map(function(p1) -- Line: 594
            return (tostring((math.floor((math.max(p1, 0))))))
        end),
        Font = Enum.Font.SourceSansBold,
        TextColor3 = u223,
        AnchorPoint = Vector2.new(1, 1),
    }
    local v8 = UDim2.fromScale(1, 1)
    v7.Position = v8 + UDim2.fromOffset(-50, -50)
    v7.TextXAlignment = Enum.TextXAlignment.Right
    v6.Score = react.createElement("TextLabel", v7)
    v7 = {
        BackgroundTransparency = 1,
        TextSize = 20,
        TextTransparency = 0.5,
        Size = UDim2.fromScale(1, 0.1),
        Text = u28:map(function(p1) -- Line: 609
            return "Strike " .. tostring((math.max(p1, 0)))
        end),
        Font = Enum.Font.SourceSansBold,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        AnchorPoint = Vector2.new(1, 1),
    }
    v8 = UDim2.fromScale(1, 1)
    v7.Position = v8 + UDim2.fromOffset(-50, -86)
    v7.TextXAlignment = Enum.TextXAlignment.Right
    v6.Strikes = react.createElement("TextLabel", v7)
    return react.createElement(Frame, v5, v6, v4)
end
local function GearTrainerMinigameTimer(p1) -- Line: 623 -- upvalues: react (val), useMotion (val), useRem (val), useAsyncEffect (val), GEAR_TRAINER (val), Promise (val), Frame (val)
    local u10, u14, u18, u4, u5, v1, v2, v3
    u4, u5 = react.useState(false)
    v1, u10 = react.useState(4)
    v2, u14 = useMotion(100)
    v3, u18 = useMotion(1)
    local v4 = useRem()
    react.useEffect(function() -- Line: 632 -- upvalues: u5 (val), p1 (val), u10 (val), u14 (val), u18 (val)
        u5(p1.Enabled)
        if not p1.Enabled then
            u10(4)
            u14:immediate(100)
            u18:immediate(1)
        end
    end, {p1.Enabled})
    useAsyncEffect(function() -- Line: 643 -- upvalues: u4 (val), GEAR_TRAINER (upval), u10 (val), u14 (val), u18 (val), Promise (upval)
        if not u4 then
            return
        end
        GEAR_TRAINER("Starting Timer")
        local function incrementTimer() -- Line: 650 -- upvalues: u10 (upval), u14 (upval), u18 (upval)
            u10(function(p1) -- Line: 651 -- upvalues: u14 (upval), u18 (upval)
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
return {
    BalancerMinigameHard = function(p1) -- Line: 695 -- upvalues: react (val), Frame (val), GearTrainerMinigameTimer (val), GearTrainerMinigame (val)
        return react.createElement(Frame, {}, {Timer = react.createElement(GearTrainerMinigameTimer, p1), Minigame = react.createElement(GearTrainerMinigame, {
            Enabled = p1.Enabled,
            Result = function(a1) -- Line: 700 -- upvalues: p1 (val)
                p1.Completed(a1)
            end,
        })})
    end,
    GearTrainerKeyNode = GearTrainerKeyNode,
}