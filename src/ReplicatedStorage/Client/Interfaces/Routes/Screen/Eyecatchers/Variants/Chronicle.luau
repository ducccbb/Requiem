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
--File: ReplicatedStorage.Client.Interfaces.Routes.Screen.Eyecatchers.Variants.Chronicle
--                               Dumped in 0.00600 seconds
--                          Bytecode version 9  |  35 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Statistics = Common:WaitForChild("Statistics")
local useFieldOfView = require(Statistics:WaitForChild("useFieldOfView"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_3:WaitForChild("Client")
local Interfaces = Client:WaitForChild("Interfaces")
local Hooks = Interfaces:WaitForChild("Hooks")
local useMotion = require(Hooks:WaitForChild("useMotion"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_4:WaitForChild("Common")
local Utilities = Common_2:WaitForChild("Utilities")
local Sounds = require(Utilities:WaitForChild("Sounds"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_5:WaitForChild("Common")
local Sounds_2 = Common_3:WaitForChild("Sounds")
local Universal = require(Sounds_2:WaitForChild("Universal"))
local u126 = Color3.fromRGB(10, 6, 4)
local u131 = Color3.fromRGB(46, 28, 15)
local u136 = Color3.fromRGB(194, 156, 102)
local u140 = Vector2.new(3, 4)
local u145 = Color3.fromRGB(118, 90, 56)
local u150 = Color3.fromRGB(172, 132, 86)
local u155 = Color3.fromRGB(148, 98, 58)
local u160 = Color3.new(0, 0, 0)
local u164 = UDim2.fromScale(2, 2)
local u168 = UDim2.fromScale(1.5, 1.5)
local u169 = {}
local v2 = Color3.fromRGB(118, 72, 42)
local v3 = Color3.fromRGB(96, 58, 34)
local v4 = Color3.fromRGB(142, 88, 52)
local v5 = Color3.fromRGB(78, 46, 28)
u169[1] = v2
u169[2] = v3
u169[3] = v4
u169[4] = v5
u169[5] = Color3.fromRGB(164, 102, 60)
local function createFloatingParticle(p1) -- Line: 105 -- upvalues: u169 (val)
    local v1 = Random.new(p1)
    local v2 = v1:NextNumber(2, 6)
    return {
        life = 0,
        x = v1:NextNumber(0.03, 0.97),
        y = v1:NextNumber(1.02, 1.18),
        vx = v1:NextNumber(-0.012, 0.012),
        vy = v1:NextNumber(-0.055, -0.022),
        rotation = v1:NextNumber(0, 360),
        spin = v1:NextNumber(-35, 35),
        width = v2,
        height = v2 * v1:NextNumber(0.75, 1.35),
        color = u169[v1:NextInteger(1, #u169)],
        opacity = v1:NextNumber(0.16, 0.38),
        maxLife = v1:NextNumber(4, 7.5),
        spawnDelay = v1:NextNumber(0, 1.4),
        wobblePhase = v1:NextNumber(0, math.pi * 2),
        wobbleSpeed = v1:NextNumber(1.1, 2.8),
    }
end
local function inwardVelocity(p1, p2, p3, p4) -- Line: 129
    local v1
    local v2 = 0.5 - p1
    local v3 = 0.5 - p2
    local v4 = math.sqrt(v2 * v2 + v3 * v3)
    if v4 < 0.001 then
        v1 = p3:NextNumber(-0.0015, 0.0015)
        return v1, p3:NextNumber(-0.0015, 0.0015)
    end
    v1 = p4 * p3:NextNumber(0.7, 1)
    local v5 = v2 / v4 * v1 + p3:NextNumber(-0.0004, 0.0004)
    return v5, v3 / v4 * v1 + p3:NextNumber(-0.0004, 0.0004)
end
local function spawnDirtAtEdge(p1) -- Line: 143 -- upvalues: inwardVelocity (val)
    local v1, v2
    local v3 = p1:NextInteger(1, 8)
    if v3 == 1 then
        v1 = p1:NextNumber(0.1, 0.28)
        v2 = p1:NextNumber(0.14, 0.86)
    elseif v3 == 2 then
        v1 = p1:NextNumber(0.72, 0.9)
        v2 = p1:NextNumber(0.14, 0.86)
    elseif v3 == 3 then
        v1 = p1:NextNumber(0.14, 0.86)
        v2 = p1:NextNumber(0.1, 0.28)
    elseif v3 == 4 then
        v1 = p1:NextNumber(0.14, 0.86)
        v2 = p1:NextNumber(0.72, 0.9)
    elseif v3 == 5 then
        v1 = p1:NextNumber(0.08, 0.3)
        v2 = p1:NextNumber(0.08, 0.3)
    elseif v3 == 6 then
        v1 = p1:NextNumber(0.7, 0.92)
        v2 = p1:NextNumber(0.08, 0.3)
    elseif v3 ~= 7 then
        v1 = p1:NextNumber(0.7, 0.92)
        v2 = p1:NextNumber(0.7, 0.92)
    else
        v1 = p1:NextNumber(0.08, 0.3)
        v2 = p1:NextNumber(0.7, 0.92)
    end
    return v1, v2, inwardVelocity(v1, v2, p1, p1:NextNumber(0.0014, 0.0032))
end
local function createDirtParticle(p1, p2) -- Line: 177 -- upvalues: spawnDirtAtEdge (val)
    local v1, v2, v3, v4
    local v5 = Random.new(p1)
    v1, v2, v3, v4 = spawnDirtAtEdge(v5)
    return {
        life = 0,
        x = v1,
        y = v2,
        vx = v3,
        vy = v4,
        rotation = v5:NextNumber(0, 360),
        spin = v5:NextNumber(-3, 3),
        size = v5:NextNumber(920, 1850),
        opacity = v5:NextNumber(0.12, 0.24),
        maxLife = v5:NextNumber(8, 12),
        spawnDelay = (p2 - 1) * 0.035 + v5:NextNumber(0, 0.08),
        driftPhase = v5:NextNumber(0, math.pi * 2),
        driftSpeed = v5:NextNumber(0.1, 0.24),
        swayPhase = v5:NextNumber(0, math.pi * 2),
        swaySpeed = v5:NextNumber(0.12, 0.28),
    }
end
local function getLifeFade(p1, p2) -- Line: 200
    local v1 = p1 / p2
    if v1 < 0.1 then
        return v1 / 0.1
    end
    if 0.78 < v1 then
        return (math.max(0, (1 - v1) / 0.22))
    end
    return 1
end
local function getDirtLifeFade(p1, p2) -- Line: 214
    local v1 = p1 / p2
    if v1 < 0.025 then
        return v1 / 0.025
    end
    if 0.88 < v1 then
        return (math.max(0, (1 - v1) / 0.12))
    end
    return 1
end
local function mapOverlayFade(p1, p2) -- Line: 228
    return p2 + p1 * (1 - p2)
end
local u206 = Font.new("rbxasset://fonts/families/AccanthisADFStd.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
local createElement = react.createElement
local v6 = {Rotation = 90}
local v7 = {}
local v8 = ColorSequenceKeypoint.new(0, Color3.fromRGB(210, 174, 118))
local v9 = ColorSequenceKeypoint.new(0.5, Color3.fromRGB(176, 136, 84))
v7[1] = v8
v7[2] = v9
v7[3] = ColorSequenceKeypoint.new(1, Color3.fromRGB(202, 160, 104))
v6.Color = ColorSequence.new(v7)
local u237 = createElement("UIGradient", v6)
local function createTextLayer(p1) -- Line: 244 -- upvalues: u237 (val), react (val), u206 (val)
    local v1
    if p1.UseGradient == false then
        v1 = nil
    else
        v1 = {Gradient = u237}
    end
    return react.createElement("TextLabel", {
        TextSize = 42,
        TextWrapped = true,
        LineHeight = 1.12,
        BackgroundTransparency = 1,
        FontFace = u206,
        Text = p1.Text,
        TextColor3 = p1.TextColor3,
        TextTransparency = p1.TextTransparency,
        TextXAlignment = Enum.TextXAlignment.Right,
        TextYAlignment = Enum.TextYAlignment.Center,
        MaxVisibleGraphemes = p1.MaxVisibleGraphemes,
        AutomaticSize = Enum.AutomaticSize.Y,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = p1.Position,
        Size = UDim2.fromOffset(680, 0),
        ZIndex = p1.ZIndex,
    }, v1)
end
local function buildFloatingParticles(p1) -- Line: 275 -- upvalues: react (val), u169 (val)
    local v1
    local v2 = {}
    local v3 = 40
    local v4 = 1
    for i = 1, v3, v4 do
        v1 = ("Floater%*"):format(i)
        v2[v1] = react.createElement("Frame", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ZIndex = 1,
            ref = function(a1) -- Line: 280 -- upvalues: p1 (val), i (val)
                p1.current[i] = a1
                if a1 then
                    a1.Visible = false
                end
            end,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromOffset(16, 16),
        }, {Core = react.createElement("Frame", {
            Name = "Core",
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = u169[1],
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromOffset(8, 8),
        }, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(1, 0)})})})
    end
    return v2
end
local function buildDirtParticles(p1) -- Line: 313 -- upvalues: react (val)
    local v1
    local v2 = {}
    local v3 = 11
    local v4 = 1
    for i = 1, v3, v4 do
        v1 = ("Dirt%*"):format(i)
        v2[v1] = react.createElement("ImageLabel", {
            Image = "rbxassetid://73209679872967",
            ImageTransparency = 1,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ZIndex = 1,
            ref = function(a1) -- Line: 318 -- upvalues: p1 (val), i (val)
                p1.current[i] = a1
                if a1 then
                    a1.Visible = false
                end
            end,
            ImageColor3 = Color3.fromRGB(18, 10, 6),
            ScaleType = Enum.ScaleType.Stretch,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromOffset(1100, 1100),
        })
    end
    return v2
end
return function(p1) -- Line: 341 -- upvalues: useMotion (val), react (val), Sounds (val), Universal (val), useFieldOfView (val), Lighting (val), createFloatingParticle (val), createDirtParticle (val), TweenService (val), u150 (val), u155 (val), RunService (val), getLifeFade (val), spawnDirtAtEdge (val), getDirtLifeFade (val), u126 (val), u164 (val), u131 (val), mapOverlayFade (val), u168 (val), buildFloatingParticles (val), createTextLayer (val), u145 (val), u140 (val), u136 (val), buildDirtParticles (val), u160 (val)
    local Header, u12, u16, u20, u24, u29, u34, u4, u8, v1, v2, v3, v4, v5, v6, v7, v8
    v1, u4 = useMotion(0)
    v5, u8 = useMotion(1)
    v6, u12 = useMotion(1)
    v7, u16 = useMotion(0)
    v8, u20 = useMotion(0)
    v2, u24 = useMotion(1)
    v3, u29 = react.useBinding(0)
    v4, u34 = react.useBinding(Vector2.zero)
    local u38 = react.useRef({})
    local u42 = react.useRef({})
    if p1.Header == "" then
        Header = p1.Body
    else
        Header = p1.Header
        if not Header then
            Header = p1.Body
        end
    end
    local u51 = utf8.len(Header)
    if not u51 then
        u51 = #Header
    end
    local v9 = react.joinBindings({v5, v3}):map(function(p1) -- Line: 358
        local v1 = p1[1] + p1[2]
        return (math.clamp(v1, 0, 1))
    end)
    local v10 = react.joinBindings({v5, v3}):map(function(p1) -- Line: 362
        local v1 = p1[1] + 0.62 + p1[2] * 0.25
        return (math.clamp(v1, 0, 1))
    end)
    local v11 = v4:map(function(p1) -- Line: 366
        return UDim2.new(0.5, p1.X, 0.5, p1.Y)
    end)
    local v12 = v8:map(function(p1) -- Line: 370
        return 1 - p1
    end)
    react.useEffect(function() -- Line: 374 -- upvalues: p1 (val), u4 (val), u8 (val), u12 (val), u16 (val), u20 (val), u24 (val), u29 (val), u34 (val), u38 (val), u42 (val), Sounds (upval), Universal (upval), useFieldOfView (upval), Lighting (upval), u51 (val), createFloatingParticle (upval), createDirtParticle (upval), TweenService (upval), u150 (upval), u155 (upval), RunService (upval), getLifeFade (upval), spawnDirtAtEdge (upval), getDirtLifeFade (upval)
        local u94, v1, v2, v3
        if not p1.Visible then
            u4:immediate(1)
            u8:immediate(1)
            u12:immediate(1)
            u16:immediate(0)
            u20:immediate(0)
            u24:immediate(1)
            u29(0)
            u34(Vector2.zero)
            v1 = 40
            v2 = 1
            for k = 1, v1, v2 do
                v3 = u38.current[k]
                if v3 then
                    v3.Visible = false
                end
            end
            v1 = 11
            v2 = 1
            for n = 1, v1, v2 do
                v3 = u42.current[n]
                if v3 then
                    v3.Visible = false
                end
            end
            return
        end
        Sounds.playGlobalSoundEffect(Universal.Wind, 0.08, 0.5, 4, nil, 5)
        Sounds.playGlobalSoundEffect(Universal.EyecatcherBasic, 0.06, 2.5, 3, nil, 4)
        _, u94 = useFieldOfView()
        local BlurEffect = Instance.new("BlurEffect")
        BlurEffect.Size = 0
        BlurEffect.Parent = Lighting
        local ColorCorrectionEffect = Instance.new("ColorCorrectionEffect")
        ColorCorrectionEffect.Saturation = 0
        ColorCorrectionEffect.Brightness = 0
        ColorCorrectionEffect.Contrast = 0
        ColorCorrectionEffect.TintColor = Color3.fromRGB(255, 255, 255)
        ColorCorrectionEffect.Parent = Lighting
        local function u112() end
        u4:immediate(0)
        u12:immediate(1)
        u16:immediate(0)
        u8:immediate(1)
        u20:immediate(0)
        u24:immediate(1)
        local u143 = false
        local u144 = false
        local u145 = false
        local u147 = u51 * 0.032
        local u150 = table.create(40)
        local v4 = 40
        local v5 = 1
        for i = 1, v4, v5 do
            u150[i] = createFloatingParticle(i * 104729)
        end
        local u167 = table.create(11)
        v5 = 11
        local v6 = 1
        for j = 1, v5, v6 do
            u167[j] = createDirtParticle(j * 224737, j)
        end
        u24:tween(0, {time = 0.3, style = Enum.EasingStyle.Quad, direction = Enum.EasingDirection.In})
        local u214 = task.delay(0.3, function() -- Line: 449 -- upvalues: u143 (ref), TweenService (upval), BlurEffect (val), ColorCorrectionEffect (val), u150 (upval), u112 (ref), u94 (val), u20 (upval), u24 (upval)
            if u143 then
                return
            end
            local v1 = TweenInfo.new(0.8, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
            TweenService:Create(BlurEffect, v1, {Size = 18}):Play()
            v1 = TweenInfo.new(0.8, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
            TweenService:Create(ColorCorrectionEffect, v1, {Saturation = -0.82, Brightness = -0.14, Contrast = 0.06, TintColor = u150}):Play()
            u112 = u94("Chronicle", 50, "set", 57, TweenInfo.new(0.8, Enum.EasingStyle.Sine, Enum.EasingDirection.Out))
            u20:tween(1, {time = 0.45})
            task.delay(0.45, function() -- Line: 484 -- upvalues: u143 (upval), u24 (upval)
                if u143 then
                    return
                end
                u24:tween(1, {time = 0.45, style = Enum.EasingStyle.Quad, direction = Enum.EasingDirection.Out})
            end)
        end)
        local u222 = task.delay(1.1, function() -- Line: 497 -- upvalues: u8 (upval), u16 (upval), u51 (upval), u147 (val)
            u8:tween(0, {time = 0.3})
            u16:tween(u51, {time = u147, style = Enum.EasingStyle.Linear})
        end)
        local u226 = task.delay(2, function() -- Line: 505 -- upvalues: u12 (upval)
            u12:tween(0.92, {time = 4.5})
        end)
        local u227 = 0
        local u228 = 0
        local zero = Vector2.zero
        local u230 = 0
        local u231 = 0.3
        local u243 = task.delay(6.5, function() -- Line: 515 -- upvalues: u143 (ref), u144 (ref), u24 (upval), u145 (ref), u20 (upval), u8 (upval), u16 (upval), TweenService (upval), BlurEffect (val), ColorCorrectionEffect (val), u155 (upval), u94 (val), u112 (ref)
            if u143 then
                return
            end
            u144 = true
            local v1 = {time = 0.3, style = Enum.EasingStyle.Quad, direction = Enum.EasingDirection.In}
            u24:tween(0, v1)
            task.delay(0.3, function() -- Line: 527 -- upvalues: u143 (upval), u145 (upval), u20 (upval), u8 (upval), u16 (upval), TweenService (upval), BlurEffect (upval), ColorCorrectionEffect (upval), u155 (upval), u94 (upval), u24 (upval), u112 (upval)
                if u143 then
                    return
                end
                u145 = true
                u20:immediate(0)
                u8:immediate(1)
                u16:immediate(0)
                local v1 = TweenInfo.new(0.4, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
                TweenService:Create(BlurEffect, v1, {Size = 30}):Play()
                v1 = TweenInfo.new(0.4, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
                TweenService:Create(ColorCorrectionEffect, v1, {Saturation = -0.95, Brightness = -0.22, Contrast = 0.1, TintColor = u155}):Play()
                u94("Chronicle", 57, "set", 64, TweenInfo.new(0.4, Enum.EasingStyle.Sine, Enum.EasingDirection.Out))
                v1 = {time = 0.45, style = Enum.EasingStyle.Quad, direction = Enum.EasingDirection.Out}
                u24:tween(1, v1)
                task.delay(0.1125, function() -- Line: 562 -- upvalues: u143 (upval), TweenService (upval), BlurEffect (upval), ColorCorrectionEffect (upval), u112 (upval)
                    if u143 then
                        return
                    end
                    local v1 = TweenInfo.new(2.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
                    TweenService:Create(BlurEffect, v1, {Size = 0}):Play()
                    v1 = TweenInfo.new(2.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
                    TweenService:Create(ColorCorrectionEffect, v1, {Saturation = 0, Brightness = 0, Contrast = 0, TintColor = Color3.fromRGB(255, 255, 255)}):Play()
                    u112(TweenInfo.new(2.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut))
                end)
            end)
        end)
        local u253 = RunService.RenderStepped:Connect(function(p1) -- Line: 593 -- upvalues: u143 (ref), u227 (ref), u231 (ref), zero (ref), u230 (ref), u144 (ref), u228 (ref), u34 (upval), u29 (upval), u150 (val), u38 (upval), u145 (ref), getLifeFade (upval), u167 (val), u42 (upval), spawnDirtAtEdge (upval), getDirtLifeFade (upval)
            local Core, v1, v2, v3, v4, v5, v6, v7, v8, v9
            if u143 then
                return
            end
            u227 = u227 + p1
            if u231 <= u227 then
                local v10
                if 0.5 >= math.random() then
                    v5 = -1
                else
                    v5 = 1
                end
                if 0.5 >= math.random() then
                    v10 = -1
                else
                    v10 = 1
                end
                zero = Vector2.new(v5 * math.random(1, 3), v10 * math.random(0, 1))
                u230 = math.random() * 0.05 + 0.04
                u231 = u227 + math.random() * 0.18 + 0.14
            end
            if 0 >= u230 then
                zero = zero * math.max(0, 1 - p1 * 16)
                if zero.Magnitude < 0.2 then
                    zero = Vector2.zero
                end
            else
                u230 = u230 - p1
            end
            if not u144 then
                if math.random() < p1 * 0.85 then
                    u228 = math.random() * 0.1
                end
                u228 = math.max(0, u228 - p1 * 9)
                u34(zero)
                u29(u228)
            end
            local v11 = u150
            local v12 = nil
            v5 = nil
            local v13 = p1
            for i, j in v11, v12, v5 do
                v6 = u38.current[i]
                if v6 then
                    Core = v6:FindFirstChild("Core")
                    if u227 >= j.spawnDelay then
                        j.life = j.life + v13
                        if u145 then
                            if not u145 then
                                j.life = 0
                                j.maxLife = Random.new(i + math.floor(u227 * 100)):NextNumber(4, 7.5)
                                j.spawnDelay = u227 + Random.new(i * 3 + math.floor(u227 * 50)):NextNumber(0, 0.35)
                                j.x = Random.new(i * 11 + math.floor(u227 * 20)):NextNumber(0.03, 0.97)
                                j.y = Random.new(i * 13 + math.floor(u227 * 20)):NextNumber(1.02, 1.18)
                                v6.Visible = false
                            else
                                v6.Visible = false
                            end
                        elseif j.maxLife > j.life and j.y >= -0.12 then
                            v2 = u227 * j.wobbleSpeed
                            v8 = math.sin(v2 + j.wobblePhase) * 0.014
                            j.x = j.x + (j.vx + v8) * v13
                            j.y = j.y + j.vy * v13
                            j.rotation = j.rotation + j.spin * v13
                            v9 = getLifeFade(j.life, j.maxLife)
                            v1 = j.opacity * v9
                            v2 = 0.02 < v1
                            v6.Visible = v2
                            v6.Position = UDim2.fromScale(j.x, j.y)
                            v6.Rotation = j.rotation
                            if Core then
                                Core.Size = UDim2.fromOffset(j.width, j.height)
                                Core.BackgroundColor3 = j.color
                                Core.BackgroundTransparency = 1 - v1
                            end
                        end
                    else
                        v6.Visible = false
                    end
                end
            end
            v11 = u167
            v12 = nil
            v5 = nil
            for k, n in v11, v12, v5 do
                v6 = u42.current[k]
                if v6 then
                    if u227 >= n.spawnDelay then
                        n.life = n.life + v13
                        if u145 then
                            v6.Visible = false
                        elseif n.maxLife > n.life then
                            v7 = math.sin(u227 * n.driftSpeed + n.driftPhase) * 0.0022
                            v8 = math.cos(u227 * n.driftSpeed * 0.82 + n.driftPhase) * 0.0018
                            v9 = math.sin(u227 * n.swaySpeed + n.swayPhase) * 0.0012
                            v1 = math.cos(u227 * n.swaySpeed * 1.15 + n.swayPhase) * 0.001
                            n.x = n.x + (n.vx + v7 + v9) * v13
                            n.y = n.y + (n.vy + v8 + v1) * v13
                            n.rotation = n.rotation + n.spin * v13
                            v4 = n.opacity * getDirtLifeFade(n.life, n.maxLife)
                            v3 = math.clamp(v4, 0, 0.32)
                            v4 = 0.02 < v3
                            v6.Visible = v4
                            v6.Position = UDim2.fromScale(n.x, n.y)
                            v6.Rotation = n.rotation
                            v6.Size = UDim2.fromOffset(n.size, n.size)
                            v6.ImageTransparency = 1 - v3
                        else
                            v7 = Random.new(k + math.floor(u227 * 100))
                            v8, v9, v1, v2 = spawnDirtAtEdge(v7)
                            n.life = 0
                            n.maxLife = v7:NextNumber(8, 12)
                            n.spawnDelay = u227 + v7:NextNumber(0, 0.08)
                            n.x = v8
                            n.y = v9
                            n.vx = v1
                            n.vy = v2
                            n.rotation = v7:NextNumber(0, 360)
                            n.size = v7:NextNumber(920, 1850)
                            n.opacity = v7:NextNumber(0.12, 0.24)
                            v6.Visible = false
                        end
                    else
                        v6.Visible = false
                    end
                end
            end
        end)
        return function() -- Line: 729 -- upvalues: u143 (ref), BlurEffect (val), ColorCorrectionEffect (val), u112 (ref), u4 (upval), u8 (upval), u12 (upval), u16 (upval), u20 (upval), u24 (upval), u29 (upval), u34 (upval), u38 (upval), u42 (upval), u253 (val), u214 (val), u222 (val), u226 (val), u243 (val)
            local v1
            u143 = true
            BlurEffect:Destroy()
            ColorCorrectionEffect:Destroy()
            u112()
            u4:immediate(1)
            u8:immediate(1)
            u12:immediate(1)
            u16:immediate(0)
            u20:immediate(0)
            u24:immediate(1)
            u29(0)
            u34(Vector2.zero)
            local v2 = 40
            local v3 = 1
            for i = 1, v2, v3 do
                v1 = u38.current[i]
                if v1 then
                    v1.Visible = false
                end
            end
            v2 = 11
            v3 = 1
            for j = 1, v2, v3 do
                v1 = u42.current[j]
                if v1 then
                    v1.Visible = false
                end
            end
            u253:Disconnect()
            pcall(task.cancel, u214)
            pcall(task.cancel, u222)
            pcall(task.cancel, u226)
            pcall(task.cancel, u243)
        end
    end, {p1.Visible, p1.Header, p1.Body, u51})
    local v13 = {
        BackgroundTransparency = 1,
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Visible = p1.Visible,
    }
    local v14 = {}
    local v15 = {BackgroundTransparency = 1, BorderSizePixel = 0, GroupTransparency = v12, Size = UDim2.fromScale(1, 1)}
    local v16 = {Background = react.createElement("Frame", {
        BorderSizePixel = 0,
        ZIndex = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = u126,
        BackgroundTransparency = v1,
        Position = UDim2.fromScale(0.5, 0.5),
        Size = u164,
    })}
    local v17 = {
        BorderSizePixel = 0,
        ZIndex = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = u131,
        BackgroundTransparency = v1:map(function(p1) -- Line: 793 -- upvalues: mapOverlayFade (upval)
            return mapOverlayFade(p1, 0.28)
        end),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = u164,
    }
    local v18 = {}
    local v19 = {Rotation = 0}
    local v20 = {}
    local v21 = NumberSequenceKeypoint.new(0, 1)
    local v22 = NumberSequenceKeypoint.new(0.34, 0.45)
    local v23 = NumberSequenceKeypoint.new(0.5, 0.18)
    local v24 = NumberSequenceKeypoint.new(0.66, 0.45)
    v20[1] = v21
    v20[2] = v22
    v20[3] = v23
    v20[4] = v24
    v20[5] = NumberSequenceKeypoint.new(1, 1)
    v19.Transparency = NumberSequence.new(v20)
    v18.Horizontal = react.createElement("UIGradient", v19)
    v16.CenterGlow = react.createElement("Frame", v17, v18)
    v17 = {
        BorderSizePixel = 0,
        ZIndex = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = u131,
        BackgroundTransparency = v1:map(function(p1) -- Line: 816 -- upvalues: mapOverlayFade (upval)
            return mapOverlayFade(p1, 0.42)
        end),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = u164,
    }
    v18 = {}
    v19 = {Rotation = 90}
    v20 = {}
    v21 = NumberSequenceKeypoint.new(0, 0.82)
    v22 = NumberSequenceKeypoint.new(0.5, 0.08)
    v20[1] = v21
    v20[2] = v22
    v20[3] = NumberSequenceKeypoint.new(1, 0.82)
    v19.Transparency = NumberSequence.new(v20)
    v18.Vertical = react.createElement("UIGradient", v19)
    v16.VerticalGlow = react.createElement("Frame", v17, v18)
    v16.Parchment = react.createElement("ImageLabel", {
        Image = "rbxassetid://135024828537951",
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 2,
        ImageColor3 = Color3.fromRGB(42, 24, 14),
        ImageTransparency = v1:map(function(p1) -- Line: 837 -- upvalues: mapOverlayFade (upval)
            return mapOverlayFade(p1, 0.86)
        end),
        ScaleType = Enum.ScaleType.Stretch,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = u164,
    })
    v17 = {
        Image = "rbxassetid://6891912132",
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 3,
        ImageColor3 = Color3.fromRGB(28, 16, 10),
        ImageTransparency = v1:map(function(p1) -- Line: 852 -- upvalues: mapOverlayFade (upval)
            return mapOverlayFade(p1, 0.9)
        end),
        ScaleType = Enum.ScaleType.Stretch,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = u164,
    }
    v18 = {}
    v19 = {Rotation = 18}
    v20 = {}
    v21 = NumberSequenceKeypoint.new(0, 0.35)
    v22 = NumberSequenceKeypoint.new(0.5, 0)
    v20[1] = v21
    v20[2] = v22
    v20[3] = NumberSequenceKeypoint.new(1, 0.35)
    v19.Transparency = NumberSequence.new(v20)
    v18.SoftEdges = react.createElement("UIGradient", v19)
    v16.Smoke = react.createElement("ImageLabel", v17, v18)
    v16.Vignette = react.createElement("ImageLabel", {
        Image = "rbxassetid://135589412519765",
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 4,
        ImageColor3 = Color3.fromRGB(0, 0, 0),
        ImageTransparency = v1:map(function(p1) -- Line: 876 -- upvalues: mapOverlayFade (upval)
            return mapOverlayFade(p1, 0)
        end),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = u168,
    })
    v16.FloatingParticles = react.createElement("Frame", {BackgroundTransparency = 1, ClipsDescendants = false, ZIndex = 8, Size = UDim2.fromScale(1, 1)}, buildFloatingParticles(u38))
    v16.TextContainer = react.createElement("Frame", {
        BackgroundTransparency = 1,
        ZIndex = 10,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = v11,
        Size = UDim2.fromOffset(680, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
    }, {Scale = react.createElement("UIScale", {Scale = v6}), Ghost = createTextLayer({
        ZIndex = 1,
        UseGradient = false,
        Text = Header,
        TextColor3 = u145,
        Position = UDim2.new(0.5, u140.X, 0.5, u140.Y),
        TextTransparency = v10,
        MaxVisibleGraphemes = v7,
    }), Text = createTextLayer({
        ZIndex = 2,
        Text = Header,
        TextColor3 = u136,
        Position = UDim2.fromScale(0.5, 0.5),
        TextTransparency = v9,
        MaxVisibleGraphemes = v7,
    })})
    v16.DirtParticles = react.createElement("Frame", {BackgroundTransparency = 1, ClipsDescendants = false, ZIndex = 11, Size = UDim2.fromScale(1, 1)}, buildDirtParticles(u42))
    v16.TextVignette = react.createElement("ImageLabel", {
        Image = "rbxassetid://135589412519765",
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 12,
        ImageColor3 = Color3.fromRGB(0, 0, 0),
        ImageTransparency = v1:map(function(p1) -- Line: 936 -- upvalues: mapOverlayFade (upval)
            return mapOverlayFade(p1, 0.46)
        end),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = u168,
    })
    v14.Content = react.createElement("CanvasGroup", v15, v16)
    v14.BlackOverlay = react.createElement("Frame", {
        BorderSizePixel = 0,
        ZIndex = 25,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = u160,
        BackgroundTransparency = v2,
        Position = UDim2.fromScale(0.5, 0.5),
        Size = u164,
    })
    return react.createElement("Frame", v13, v14)
end