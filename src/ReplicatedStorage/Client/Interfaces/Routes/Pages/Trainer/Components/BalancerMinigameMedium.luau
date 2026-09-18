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
--File: ReplicatedStorage.Client.Interfaces.Routes.Pages.Trainer.Components.BalancerMinigameMedium
--                               Dumped in 0.00372 seconds
--                          Bytecode version 9  |  31 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Promise = require(Common:WaitForChild("Promise"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_2:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Utilities = Common_2:WaitForChild("Utilities")
local Table = require(Utilities:WaitForChild("Table"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Utilities_2 = Common_3:WaitForChild("Utilities")
local Sounds = require(Utilities_2:WaitForChild("Sounds"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_5:WaitForChild("Common")
local Sounds_2 = Common_4:WaitForChild("Sounds")
local Training = require(Sounds_2:WaitForChild("Training"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_6:WaitForChild("Client")
local Interfaces = Client:WaitForChild("Interfaces")
local Components = Interfaces:WaitForChild("Components")
local Primitives = Components:WaitForChild("Primitives")
local Frame = require(Primitives:WaitForChild("Frame"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_7:WaitForChild("Common")
local GEAR_TRAINER = require(Common_5:WaitForChild("Debugger")).useDebugger("GEAR_TRAINER")
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
local u222 = Color3.fromRGB(246, 150, 255)
local u227 = Color3.fromRGB(108, 255, 238)
local u228 = {}
local function GearTrainerKeyNode(p1) -- Line: 61 -- upvalues: useRem (val), useMotion (val), react (val), useAsyncEffect (val), Sounds (val), Training (val), Promise (val), Frame (val), u222 (val), u227 (val)
    local u16, u20, u29, u33, v1, v2, v3, v4, v5
    local u2 = useRem()
    if p1.Node.Side ~= 1 then
        v3 = 1
    else
        v3 = 0
    end
    local v6 = UDim2.fromScale(v3, 0.5)
    v3, u16 = useMotion(v6.X.Scale)
    v4, u20 = useMotion(0)
    local none = react.useRef("none")
    v5, u29 = react.useState("")
    v1, u33 = useMotion(1)
    react.useEffect(function() -- Line: 72 -- upvalues: u16 (val), p1 (val)
        local v1
        if p1.Node.Side ~= 1 then
            v1 = -0.05
        else
            v1 = 0.05
        end
        u16:linear(0.5 + v1, {speed = 1 / p1.Node.Speed})
    end, {})
    useAsyncEffect(function() -- Line: 78 -- upvalues: p1 (val), Sounds (upval), Training (upval), Promise (upval), u20 (val), none (val), u29 (val), u33 (val)
        if not p1.Enabled then
            return
        end
        Sounds.playGlobalSoundEffect(Training.Spawn, 0.1, 0.3, 1, NumberRange.new(0.9, 1.1))
        local v1 = {}
        local v2 = Promise.delay(p1.Node.Speed / 2):andThen(function() -- Line: 86 -- upvalues: u20 (upval)
            u20:spring(1, {frequency = 0.1})
        end)
        v1[1] = v2
        v1[2] = Promise.delay(p1.Node.Speed / 2 + 0.2):andThen(function() -- Line: 92 -- upvalues: p1 (upval), none (upval), u29 (upval), u33 (upval)
            p1.Data.dead = true
            if none.current == "none" then
                none.current = "MISS"
                u29("MISS")
                u33:immediate(0)
                u33:spring(1, {frequency = 1})
                p1.Node.Scored(-1)
            end
        end)
        return Promise.all(v1)
    end, {})
    local createElement = react.createElement
    local v7 = {ZIndex = 1, AnchorPoint = Vector2.new(0.5, 0.5), Position = v3:map(function(a1) -- Line: 112 -- upvalues: p1 (val), none (val), u29 (val), Sounds (upval), Training (upval), u33 (val)
        p1.Data.current = a1
        if p1.Data.result ~= none.current and none.current == "none" then
            u29(p1.Data.result)
            none.current = p1.Data.result
            if p1.Data.result ~= "PERFECT" then
                Sounds.playGlobalSoundEffect(Training.Hit, 0.5, 1, 2, NumberRange.new(0.8, 1))
            else
                Sounds.playGlobalSoundEffect(Training.Hit, 0.5, 1, 2, NumberRange.new(1.1, 1.3))
            end
            u33:immediate(0)
            u33:spring(1, {frequency = 1})
        end
        return UDim2.fromScale(a1, 0.5)
    end)}
    local v8 = u2(40)
    v7.Size = UDim2.fromOffset(v8, u2(40))
    v7.BackgroundTransparency = v4
    if p1.Node.Side ~= 1 then
        v2 = u227
    else
        v2 = u222
        if not v2 then
            v2 = u227
        end
    end
    v7.BackgroundColor3 = v2
    return createElement(Frame, v7, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(1, 0)}), Hit = react.createElement("TextLabel", {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 1),
        Text = v5,
        Font = Enum.Font.SourceSansBold,
        TextSize = u2(46),
        TextColor3 = u222,
        TextTransparency = v1,
        Position = v1:map(function(p1) -- Line: 152 -- upvalues: u2 (val)
            local v1 = UDim2.fromScale(1, -0.2)
            local v2 = u2(0)
            return v1 + UDim2.fromOffset(v2, u2(-p1 * 50))
        end),
        AnchorPoint = Vector2.new(0, 1),
    })})
end
local function GearTrainerMinigame(p1) -- Line: 160 -- upvalues: useRem (val), react (val), useMotion (val), GEAR_TRAINER (val), useAsyncEffect (val), Promise (val), u228 (ref), Table (val), GearTrainerKeyNode (val), UserInputService (val), Frame (val), u222 (val)
    local Enabled, u11, u12, u17, u21, u22, u25, u26, u30, u31, u35, u36, u6, u7, v1, v2
    local v3 = useRem()
    u6, u7 = react.useState(false)
    u11, u12 = react.useState(false)
    v2, u17 = react.useState({})
    u21, u22 = react.useBinding(0)
    u25, u26 = useMotion(0)
    u30, u31 = react.useBinding(0)
    u35, u36 = react.useBinding(0)
    react.useEffect(function() -- Line: 174 -- upvalues: u7 (val), p1 (val), u12 (val), u17 (val), u22 (val), u36 (val), u31 (val), GEAR_TRAINER (upval)
        u7(p1.Enabled)
        if p1.Enabled then
            GEAR_TRAINER("Gear trainer drum minigame enabled")
            return
        end
        u12(false)
        u7(false)
        u17({})
        u22(0)
        u36(0)
        u31(0)
        GEAR_TRAINER("Gear trainer drum minigame disabled")
    end, {p1.Enabled})
    useAsyncEffect(function() -- Line: 190 -- upvalues: u6 (val), Promise (upval), GEAR_TRAINER (upval), u12 (val)
        if not u6 then
            return
        end
        return Promise.delay(5):andThen(function() -- Line: 196 -- upvalues: GEAR_TRAINER (upval), u12 (upval)
            GEAR_TRAINER("Gear trainer drum minigame started")
            u12(true)
        end)
    end, {u6})
    react.useEffect(function() -- Line: 202 -- upvalues: u11 (val), u21 (val), u17 (val), u228 (upval), Table (upval), u31 (val), u30 (val), u25 (val), u26 (val), p1 (val), u35 (val), u22 (val), GEAR_TRAINER (upval)
        if not u11 then
            return
        end
        local u1 = 1
        local u4 = coroutine.create(function() -- Line: 210 -- upvalues: u1 (ref), u21 (upval), u11 (upval), u17 (upval), u228 (upval), Table (upval), u31 (upval), u30 (upval), u25 (upval), u26 (upval), p1 (upval), u35 (upval), u22 (upval)
            local onSpawnNode, v1, v2, v3, v4, v5
            while task.wait(u1) do
                local u7 = u21:getValue() + 1
                if not u11 then
                    return
                end
                v1 = math.random(1, 10) == 1
                v2 = math.random(2, 3)
                function onSpawnNode() -- Line: 221 -- upvalues: u17 (upval), u228 (upval), Table (upval), u1 (upval), u31 (upval), u30 (upval), u25 (upval), u26 (upval), p1 (upval), u35 (upval), u22 (upval), u7 (val)
                    u17(function(a1) -- Line: 222 -- upvalues: u228 (upval), Table (upval), u1 (upval), u31 (upval), u30 (upval), u25 (upval), u26 (upval), p1 (upval), u35 (upval), u22 (upval), u7 (upval)
                        local v1
                        for k, v in pairs(a1) do
                            v1 = tick() - v.Spawned
                            if 1.5 < v1 then
                                a1[k] = nil
                                u228[v.Id] = nil
                            end
                        end
                        u228 = Table.mapKV(a1, function(p1) -- Line: 230 -- upvalues: u228 (upval)
                            return p1.Id, u228[p1.Id]
                        end)
                        local v2 = math.random(1, 10000)
                        u1 = math.clamp(u1 - 0.0045, 0.6, 1)
                        local v3 = math.random(1, 2)
                        table.insert(a1, {
                            Side = v3,
                            Speed = u1,
                            Scored = function(a1) -- Line: 244 -- upvalues: u31 (upval), u30 (upval), u25 (upval), u26 (upval), p1 (upval), u35 (upval)
                                u31(u30:getValue() + 1)
                                local v1 = u25:getValue()
                                local v2 = v1 - u30:getValue() / 2 * 700
                                local v3 = math.max(v2, 0)
                                u26:spring(v3)
                                if v3 <= 0 then
                                    v2 = u30:getValue()
                                    if 2 < v2 then
                                        p1.Result(u35:getValue())
                                    end
                                end
                            end,
                            Id = v2,
                            Spawned = tick(),
                        })
                        u228[v2] = {current = 0, dead = false, result = "none", side = v3}
                        u22(u7)
                        return table.clone(Table.compact(a1))
                    end)
                end
                if not v1 then
                    onSpawnNode()
                else
                    v5 = 1
                    if not v1 then
                        v3 = 1
                    else
                        v3 = v2
                    end
                    v4 = 1
                    for i = v5, v3, v4 do
                        task.wait(u1 * (0.75 * (math.random() + 0.5)))
                        if not u11 then
                            return
                        end
                        onSpawnNode()
                    end
                end
            end
        end)
        coroutine.resume(u4)
        return function() -- Line: 289 -- upvalues: GEAR_TRAINER (upval), u4 (val)
            GEAR_TRAINER("Closing trainer drum minigame thread.")
            coroutine.close(u4)
        end
    end, {u11})
    local v4 = {}
    for k, v in pairs(v2) do
        v1 = tostring(k)
        v4[v1] = react.createElement(GearTrainerKeyNode, {Enabled = u11 and u6, Node = v, Data = u228[v.Id]})
    end
    react.useEffect(function() -- Line: 305 -- upvalues: p1 (val), u11 (val), u228 (upval), GEAR_TRAINER (upval), UserInputService (upval), u25 (val), u30 (val), u31 (val), u26 (val), u35 (val), u36 (val)
        if not p1.Enabled or not u11 then
            return
        end
        u228 = {}
        GEAR_TRAINER("Gear trainer drum minigame input initialized")
        local u12 = UserInputService.InputBegan:Connect(function(a1) -- Line: 314 -- upvalues: u228 (upval), u25 (upval), u30 (upval), u31 (upval), u26 (upval), p1 (upval), u35 (upval), u36 (upval)
            if a1.KeyCode == Enum.KeyCode.E then
                local v1, v2, v3, v4
                local v5 = a1.KeyCode == Enum.KeyCode.Q
                if not v5 then
                    v2 = 2
                else
                    v2 = 1
                end
                local v6 = false
                for k, v in pairs(u228) do
                    if v.side == v2 and not v.dead then
                        v4 = math.abs(v.current - 0.5)
                        if 0.15 >= v4 then
                            v.dead = true
                            if v4 >= 0.05 then
                                v1 = "GOOD"
                            else
                                v1 = "PERFECT"
                            end
                            v.result = v1
                            v6 = true
                        end
                    end
                end
                if v6 then
                    v3 = u25:getValue() + 700
                    if u35:getValue() < v3 then
                        u36(v3)
                    end
                    u26:spring(v3)
                    return
                end
                local v7 = u25:getValue()
                local v8 = v7 - u30:getValue() / 2 * 700
                v3 = math.max(v8, 0)
                u31(u30:getValue() + 1)
                u26:spring(v3)
                if v3 > 0 then
                    return
                end
                v8 = u30:getValue()
                if 2 >= v8 then
                    return
                end
                p1.Result(u35:getValue())
                return
            elseif a1.KeyCode ~= Enum.KeyCode.Q then
                return
            end
        end)
        return function() -- Line: 362 -- upvalues: u12 (val)
            u12:Disconnect()
        end
    end, {p1.Enabled, u11})
    local v5 = {BackgroundTransparency = 1}
    Enabled = u11
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
        Text = u25:map(function(p1) -- Line: 374
            return (tostring((math.floor((math.max(p1, 0))))))
        end),
        Font = Enum.Font.SourceSansBold,
        TextColor3 = u222,
        AnchorPoint = Vector2.new(0, 1),
    }
    local v8 = UDim2.fromScale(0.5, 0.5)
    local v9 = v3(-350)
    v7.Position = v8 + UDim2.fromOffset(v9, -10)
    v7.TextXAlignment = Enum.TextXAlignment.Left
    v6.Score = react.createElement("TextLabel", v7)
    v7 = {
        BackgroundTransparency = 1,
        TextSize = 20,
        TextTransparency = 0.5,
        Size = UDim2.fromScale(1, 0.1),
        Text = u30:map(function(p1) -- Line: 389
            return "Strike " .. tostring((math.max(p1, 0)))
        end),
        Font = Enum.Font.SourceSansBold,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        AnchorPoint = Vector2.new(0, 1),
    }
    v8 = UDim2.fromScale(0.5, 0.5)
    v9 = v3(-350)
    v7.Position = v8 + UDim2.fromOffset(v9, -50)
    v7.TextXAlignment = Enum.TextXAlignment.Left
    v6.Strikes = react.createElement("TextLabel", v7)
    v7 = {BackgroundTransparency = 0.5, AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5)}
    v8 = v3(700)
    v7.Size = UDim2.fromOffset(v8, v3(60))
    v7.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    local v10 = {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(1, 0)}), Stroke = react.createElement("UIStroke", {Thickness = 5, Color = u222})}
    v9 = {BackgroundTransparency = 0, AnchorPoint = Vector2.new(0.5, 0), Position = UDim2.fromScale(0.5, 1)}
    local v11 = v3(7)
    v9.Size = UDim2.fromOffset(v11, v3(15))
    v9.BackgroundColor3 = u222
    v10.Bottomline = react.createElement(Frame, v9, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(1, 0)})})
    v9 = {BackgroundTransparency = 0, AnchorPoint = Vector2.new(0.5, 1), Position = UDim2.fromScale(0.5, 0)}
    v11 = v3(7)
    v9.Size = UDim2.fromOffset(v11, v3(15))
    v9.BackgroundColor3 = u222
    v10.Topline = react.createElement(Frame, v9, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(1, 0)})})
    v6.Bar = react.createElement(Frame, v7, v10, v4)
    return react.createElement(Frame, v5, v6)
end
local function GearTrainerMinigameTimer(p1) -- Line: 444 -- upvalues: react (val), useMotion (val), useRem (val), useAsyncEffect (val), Promise (val), Frame (val)
    local u10, u14, u18, u4, u5, v1, v2, v3
    u4, u5 = react.useState(false)
    v1, u10 = react.useState(4)
    v2, u14 = useMotion(100)
    v3, u18 = useMotion(1)
    local v4 = useRem()
    react.useEffect(function() -- Line: 453 -- upvalues: u5 (val), p1 (val), u10 (val), u14 (val), u18 (val)
        u5(p1.Enabled)
        if not p1.Enabled then
            u10(4)
            u14:immediate(100)
            u18:immediate(1)
        end
    end, {p1.Enabled})
    useAsyncEffect(function() -- Line: 464 -- upvalues: u4 (val), u10 (val), u14 (val), u18 (val), Promise (upval)
        if not u4 then
            return
        end
        local function incrementTimer() -- Line: 469 -- upvalues: u10 (upval), u14 (upval), u18 (upval)
            u10(function(p1) -- Line: 470 -- upvalues: u14 (upval), u18 (upval)
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
return function(p1) -- Line: 514 -- upvalues: react (val), Frame (val), GearTrainerMinigameTimer (val), GearTrainerMinigame (val)
    return react.createElement(Frame, {}, {Timer = react.createElement(GearTrainerMinigameTimer, p1), Minigame = react.createElement(GearTrainerMinigame, {
        Enabled = p1.Enabled,
        Result = function(a1) -- Line: 519 -- upvalues: p1 (val)
            p1.Completed(a1)
        end,
    })})
end