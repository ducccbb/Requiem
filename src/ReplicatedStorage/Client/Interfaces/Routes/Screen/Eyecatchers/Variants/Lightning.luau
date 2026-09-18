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
--File: ReplicatedStorage.Client.Interfaces.Routes.Screen.Eyecatchers.Variants.Lightning
--                               Dumped in 0.00259 seconds
--                          Bytecode version 9  |  16 functions

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
local u126 = Color3.fromRGB(236, 242, 255)
local u127 = {}
local v2 = Color3.fromRGB(228, 236, 248)
local v3 = Color3.fromRGB(244, 248, 255)
u127[1] = v2
u127[2] = v3
u127[3] = Color3.fromRGB(210, 220, 235)
local u143 = {}
v3 = Color3.fromRGB(148, 188, 255)
local v4 = Color3.fromRGB(118, 168, 240)
local v5 = Color3.fromRGB(176, 210, 255)
u143[1] = v3
u143[2] = v4
u143[3] = v5
u143[4] = Color3.fromRGB(96, 148, 228)
local function resetParticle(p1, p2, p3, p4) -- Line: 63 -- upvalues: u127 (val), u143 (val)
    local v1, v2, v3
    local v4 = Random.new(p2)
    local v5 = v4:NextNumber()
    if v5 >= 0.45 then
        v1 = u143[v4:NextInteger(1, #u143)]
    else
        v1 = u127[v4:NextInteger(1, #u127)]
    end
    v5 = v4:NextNumber(2, 8)
    if p3 ~= nil then
        v2 = p3
    else
        v3 = v4:NextNumber()
        v2 = v3 < 0.55
    end
    p1.x = v4:NextNumber(0.03, 0.97)
    if not v2 then
        v3 = v4:NextNumber(0.1, 0.95)
    else
        v3 = v4:NextNumber(1.02, 1.16)
    end
    p1.y = v3
    p1.vx = v4:NextNumber(-0.018, 0.018)
    p1.vy = v4:NextNumber(-0.14, -0.065)
    p1.width = v5
    p1.height = v5 * v4:NextNumber(0.8, 1.6)
    p1.color = v1
    p1.opacity = v4:NextNumber(0.2, 0.48)
    p1.life = 0
    p1.maxLife = v4:NextNumber(3.5, 6.5)
    if p4 then
        v3 = 0
    elseif not v2 then
        v3 = v4:NextNumber(0.35, 0.7)
    else
        v3 = v4:NextNumber(0.35, 2.2)
    end
    p1.spawnDelay = v3
    p1.wobblePhase = v4:NextNumber(0, math.pi * 2)
    p1.wobbleSpeed = v4:NextNumber(1.2, 2.8)
end
local function createParticle(p1) -- Line: 91 -- upvalues: resetParticle (val)
    local v1 = {}
    resetParticle(v1, p1, nil)
    return v1
end
local function getLifeFade(p1, p2) -- Line: 97
    local v1 = p1 / p2
    if v1 < 0.15 then
        return v1 / 0.15
    end
    if 0.75 < v1 then
        return (math.max(0, (1 - v1) / 0.25))
    end
    return 1
end
local function buildParticles(p1) -- Line: 111 -- upvalues: react (val)
    local v1
    local v2 = {}
    local v3 = 56
    local v4 = 1
    for i = 1, v3, v4 do
        v1 = ("Particle%*"):format(i)
        v2[v1] = react.createElement("Frame", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ZIndex = 3,
            ref = function(a1) -- Line: 116 -- upvalues: p1 (val), i (val)
                p1.current[i] = a1
                if a1 then
                    a1.Visible = false
                end
            end,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 1.1),
            Size = UDim2.fromOffset(16, 16),
        }, {Glow = react.createElement("ImageLabel", {
            Name = "Glow",
            Image = "rbxassetid://17812826389",
            ImageTransparency = 1,
            BackgroundTransparency = 1,
            ZIndex = 1,
            ImageColor3 = Color3.fromRGB(180, 210, 255),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(2.4, 2.4),
        }), Core = react.createElement("Frame", {
            Name = "Core",
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ZIndex = 2,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(200, 220, 255),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromOffset(6, 6),
        }, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(1, 0)})})})
    end
    return v2
end
return function(p1) -- Line: 162 -- upvalues: useMotion (val), react (val), useFieldOfView (val), createParticle (val), Lighting (val), Sounds (val), Universal (val), TweenService (val), RunService (val), resetParticle (val), getLifeFade (val), buildParticles (val), u126 (val)
    local u12, u19, u23, u30, u37, u4, u8, v1, v2, v3, v4, v5, v6, v7
    v1, u4 = useMotion(1)
    v4, u8 = useMotion(1)
    v5, u12 = useMotion(1)
    v6, u19 = useMotion(UDim2.fromScale(0.5, 0.5))
    v7, u23 = useMotion(1)
    v2, u30 = useMotion(UDim2.fromScale(0.5, 0.34))
    v3, u37 = useMotion(UDim2.fromScale(0.5, 0.66))
    local u41 = react.useRef({})
    react.useEffect(function() -- Line: 174 -- upvalues: p1 (val), useFieldOfView (upval), createParticle (upval), Lighting (upval), u4 (val), Sounds (upval), Universal (upval), TweenService (upval), u19 (val), u8 (val), u12 (val), u23 (val), u30 (val), u37 (val), RunService (upval), u41 (val), resetParticle (upval), getLifeFade (upval)
        local v1
        if not p1.Visible then
            return
        end
        _, v1 = useFieldOfView()
        local u5 = false
        local u6 = 0
        local u7 = false
        local u8 = 0
        local u11 = table.create(56)
        local v2 = 56
        local v3 = 1
        for i = 1, v2, v3 do
            u11[i] = createParticle(i * 91753)
        end
        local BlurEffect = Instance.new("BlurEffect")
        BlurEffect.Size = 0
        BlurEffect.Parent = Lighting
        local ColorCorrectionEffect = Instance.new("ColorCorrectionEffect")
        ColorCorrectionEffect.Saturation = 0
        ColorCorrectionEffect.Brightness = 0
        ColorCorrectionEffect.Contrast = 0
        ColorCorrectionEffect.TintColor = Color3.fromRGB(255, 255, 255)
        ColorCorrectionEffect.Parent = Lighting
        local u55 = v1("Basic", 50, "set", 68, TweenInfo.new(0.08, Enum.EasingStyle.Quad, Enum.EasingDirection.Out))
        u4:immediate(0)
        Sounds.playGlobalSoundEffect(Universal.Lightning, 0.05, 4, 2.5, nil, 3)
        local v4 = TweenInfo.new(0.06)
        TweenService:Create(ColorCorrectionEffect, v4, {Brightness = 2.5, Contrast = 0.15}):Play()
        local u86 = task.delay(0.1, function() -- Line: 212 -- upvalues: u4 (upval)
            u4:tween(0.82, {time = 0.12})
        end)
        local u90 = task.delay(0.18, function() -- Line: 216 -- upvalues: Universal (upval), Sounds (upval), u19 (upval)
            local v1 = Universal.Thunder[math.random(1, #Universal.Thunder)]
            Sounds.playGlobalSoundEffect(v1, 0.1, 3.2, 4, nil, 5)
            local v2 = UDim2.fromScale(0.506, 0.494)
            u19:spring(v2, {tension = 420, friction = 14})
            task.delay(0.12, function() -- Line: 221 -- upvalues: u19 (upval)
                local v1 = UDim2.fromScale(0.5, 0.5)
                u19:spring(v1, {tension = 260, friction = 22})
            end)
        end)
        local u94 = task.delay(0.26, function() -- Line: 226 -- upvalues: u4 (upval), u8 (upval), u12 (upval), TweenService (upval), BlurEffect (val), ColorCorrectionEffect (val), u55 (val)
            u4:tween(1, {time = 0.22})
            u8:tween(0.52, {time = 0.35})
            u12:tween(0.2, {time = 0.8})
            local v1 = TweenInfo.new(0.8)
            TweenService:Create(BlurEffect, v1, {Size = 28}):Play()
            v1 = TweenInfo.new(0.4)
            TweenService:Create(ColorCorrectionEffect, v1, {Saturation = -0.75, Brightness = -0.28, Contrast = 0.08, TintColor = Color3.fromRGB(148, 168, 210)}):Play()
            u55(TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out))
        end)
        local u98 = task.delay(0.42, function() -- Line: 242 -- upvalues: u23 (upval), u30 (upval), u37 (upval)
            u23:tween(0, {time = 0.18})
            local v1 = UDim2.fromScale(0.5, 0.4)
            u30:spring(v1, {tension = 320, friction = 22})
            v1 = UDim2.fromScale(0.5, 0.6)
            u37:spring(v1, {tension = 320, friction = 22})
        end)
        local u108 = task.delay(5.5, function() -- Line: 248 -- upvalues: u7 (ref), u8 (ref), u6 (ref), TweenService (upval), BlurEffect (val), ColorCorrectionEffect (val), u8 (upval), u12 (upval), u30 (upval), u37 (upval), u23 (upval), u55 (val)
            u7 = true
            u8 = u6
            local v1 = TweenInfo.new(2.5)
            TweenService:Create(BlurEffect, v1, {Size = 0}):Play()
            v1 = TweenInfo.new(2)
            TweenService:Create(ColorCorrectionEffect, v1, {Saturation = 0, Brightness = 0, Contrast = 0, TintColor = Color3.fromRGB(255, 255, 255)}):Play()
            u8:tween(1, {time = 0.7})
            u12:tween(2.5, {time = 0.8})
            u30:spring(UDim2.fromScale(0.5, 0.34))
            u37:spring(UDim2.fromScale(0.5, 0.66))
            u23:tween(1, {time = 0.35})
            u55(TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut))
        end)
        local u117 = RunService.RenderStepped:Connect(function(p1) -- Line: 269 -- upvalues: u5 (ref), u6 (ref), u7 (ref), u8 (ref), u11 (val), u41 (upval), resetParticle (upval), getLifeFade (upval)
            local Core, Glow, v1, v2, v3, v4, v5
            if u5 then
                return
            end
            u6 = u6 + p1
            if not u7 then
                v1 = 1
            else
                v1 = math.max(0, 1 - (u6 - u8) * 1.8)
            end
            local v6 = u11
            local v7 = nil
            local v8 = nil
            local v9 = p1
            for i, j in v6, v7, v8 do
                v5 = u41.current[i]
                if v5 then
                    Glow = v5:FindFirstChild("Glow")
                    Core = v5:FindFirstChild("Core")
                    if u6 >= j.spawnDelay then
                        j.life = j.life + v9
                        if j.maxLife <= j.life then
                            if not u7 then
                                v3 = i * 91753 + math.floor(u6 * 1000)
                                resetParticle(j, v3, true, true)
                            else
                                v5.Visible = false
                            end
                        elseif j.y >= -0.1 then
                            v4 = u6 * j.wobbleSpeed
                            v2 = math.sin(v4 + j.wobblePhase) * 0.014
                            j.x = j.x + (j.vx + v2) * v9
                            j.y = j.y + j.vy * v9
                            v3 = j.opacity * (getLifeFade(j.life, j.maxLife) * v1)
                            v4 = 0.02 < v3
                            v5.Visible = v4
                            v5.Position = UDim2.fromScale(j.x, j.y)
                            v5.Size = UDim2.fromOffset(j.width * 2.8, j.height * 2.8)
                            if Core then
                                Core.Size = UDim2.fromOffset(j.width, j.height)
                                Core.BackgroundColor3 = j.color
                                Core.BackgroundTransparency = 1 - v3
                            end
                            if Glow then
                                Glow.ImageColor3 = j.color
                                Glow.ImageTransparency = 1 - v3 * 0.18
                            end
                        end
                    else
                        v5.Visible = false
                    end
                end
            end
        end)
        return function() -- Line: 327 -- upvalues: u5 (ref), u117 (val), BlurEffect (val), ColorCorrectionEffect (val), u41 (upval), u4 (upval), u8 (upval), u12 (upval), u19 (upval), u23 (upval), u30 (upval), u37 (upval), u86 (val), u90 (val), u94 (val), u98 (val), u108 (val)
            local v1
            u5 = true
            u117:Disconnect()
            BlurEffect:Destroy()
            ColorCorrectionEffect:Destroy()
            local v2 = 56
            local v3 = 1
            for i = 1, v2, v3 do
                v1 = u41.current[i]
                if v1 then
                    v1.Visible = false
                end
            end
            u4:immediate(1)
            u8:immediate(1)
            u12:immediate(1)
            u19:immediate(UDim2.fromScale(0.5, 0.5))
            u23:immediate(1)
            u30:immediate(UDim2.fromScale(0.5, 0.34))
            u37:immediate(UDim2.fromScale(0.5, 0.66))
            pcall(task.cancel, u86)
            pcall(task.cancel, u90)
            pcall(task.cancel, u94)
            pcall(task.cancel, u98)
            pcall(task.cancel, u108)
        end
    end, {p1.Visible, p1.Header, p1.Body})
    return react.createElement("Frame", {
        BackgroundTransparency = 1,
        Position = v6,
        Size = UDim2.fromScale(1, 1),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Visible = p1.Visible,
    }, {
        Flash = react.createElement("Frame", {
            BorderSizePixel = 0,
            ZIndex = 4,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(245, 248, 255),
            BackgroundTransparency = v1,
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(1.35, 1.25),
        }),
        Darken = react.createElement("Frame", {
            BorderSizePixel = 0,
            ZIndex = 1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(4, 8, 18),
            BackgroundTransparency = v4,
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(1.3, 1.2),
        }),
        Vignette = react.createElement("ImageLabel", {
            Image = "rbxassetid://135589412519765",
            BackgroundTransparency = 1,
            ZIndex = 2,
            ImageColor3 = Color3.fromRGB(0, 0, 0),
            ImageTransparency = v5,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(1.3, 1.2),
        }),
        Particles = react.createElement("Frame", {BackgroundTransparency = 1, ZIndex = 3, Size = UDim2.fromScale(1, 1)}, buildParticles(u41)),
        Container = react.createElement("Frame", {
            BackgroundTransparency = 1,
            ZIndex = 10,
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(1, 0.25),
            AnchorPoint = Vector2.new(0.5, 0.5),
        }, {Header = react.createElement("TextLabel", {
            TextScaled = true,
            TextSize = 14,
            TextWrapped = true,
            BackgroundTransparency = 1,
            FontFace = Font.new("rbxasset://fonts/families/Fondamento.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
            Text = string.upper(p1.Header),
            TextColor3 = u126,
            TextTransparency = v7,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = v2,
            Size = UDim2.fromOffset(687, 56),
        }, {}), Body = react.createElement("TextLabel", {
            TextScaled = true,
            TextSize = 14,
            TextWrapped = true,
            BackgroundTransparency = 1,
            FontFace = Font.new("rbxasset://fonts/families/AccanthisADFStd.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
            Text = p1.Body,
            TextColor3 = u126,
            TextTransparency = v7,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = v3,
            Size = UDim2.fromOffset(687, 32),
        }, {Stroke = react.createElement("UIStroke", {Thickness = 1.25, Color = Color3.fromRGB(12, 24, 48), Transparency = v7})})}),
    })
end