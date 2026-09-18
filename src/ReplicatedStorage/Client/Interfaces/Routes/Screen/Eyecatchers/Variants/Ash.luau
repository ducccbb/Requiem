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
--   File: ReplicatedStorage.Client.Interfaces.Routes.Screen.Eyecatchers.Variants.Ash
--                               Dumped in 0.00209 seconds
--                          Bytecode version 9  |  11 functions

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
local u126 = Color3.fromRGB(255, 255, 255)
local u127 = {}
local v2 = Color3.fromRGB(168, 152, 138)
local v3 = Color3.fromRGB(142, 128, 118)
local v4 = Color3.fromRGB(186, 164, 148)
u127[1] = v2
u127[2] = v3
u127[3] = v4
u127[4] = Color3.fromRGB(118, 102, 92)
local u148 = {}
v3 = Color3.fromRGB(228, 96, 48)
v4 = Color3.fromRGB(210, 72, 42)
local v5 = Color3.fromRGB(196, 58, 38)
local v6 = Color3.fromRGB(240, 128, 54)
local v7 = Color3.fromRGB(178, 48, 32)
u148[1] = v3
u148[2] = v4
u148[3] = v5
u148[4] = v6
u148[5] = v7
u148[6] = Color3.fromRGB(255, 148, 72)
local function createParticle(p1) -- Line: 69 -- upvalues: u148 (val), u127 (val)
    local v1
    local v2 = Random.new(p1)
    local v3 = v2:NextNumber()
    if v3 >= 0.32 then
        v1 = u127[v2:NextInteger(1, #u127)]
    else
        v1 = u148[v2:NextInteger(1, #u148)]
    end
    v3 = v2:NextNumber(3, 10)
    return {
        life = 0,
        x = v2:NextNumber(0.04, 0.96),
        y = v2:NextNumber(-0.18, 0.42),
        vx = v2:NextNumber(-0.016, 0.016),
        vy = v2:NextNumber(0.025, 0.065),
        rotation = v2:NextNumber(0, 360),
        spin = v2:NextNumber(-50, 50),
        width = v3,
        height = v3 * v2:NextNumber(0.7, 1.3),
        color = v1,
        opacity = v2:NextNumber(0.5, 0.9),
        maxLife = v2:NextNumber(3.5, 6.5),
        spawnDelay = v2:NextNumber(0, 1.2),
        wobblePhase = v2:NextNumber(0, math.pi * 2),
        wobbleSpeed = v2:NextNumber(1.4, 3.6),
    }
end
local function getLifeFade(p1, p2) -- Line: 97
    local v1 = p1 / p2
    if v1 < 0.12 then
        return v1 / 0.12
    end
    if 0.72 < v1 then
        return (math.max(0, (1 - v1) / 0.28))
    end
    return 1
end
local function buildParticles(p1) -- Line: 111 -- upvalues: react (val)
    local v1
    local v2 = {}
    local v3 = 48
    local v4 = 1
    for i = 1, v3, v4 do
        v1 = ("Particle%*"):format(i)
        v2[v1] = react.createElement("Frame", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ZIndex = 2,
            ref = function(a1) -- Line: 116 -- upvalues: p1 (val), i (val)
                p1.current[i] = a1
                if a1 then
                    a1.Visible = false
                end
            end,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromOffset(24, 24),
        }, {Glow = react.createElement("ImageLabel", {
            Name = "Glow",
            Image = "rbxassetid://17812826389",
            ImageTransparency = 1,
            BackgroundTransparency = 1,
            ZIndex = 1,
            ImageColor3 = Color3.fromRGB(228, 148, 96),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(2.6, 2.6),
        }), Core = react.createElement("Frame", {
            Name = "Core",
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ZIndex = 2,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(210, 142, 98),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromOffset(8, 8),
        }, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(1, 0)})})})
    end
    return v2
end
return function(p1) -- Line: 162 -- upvalues: useMotion (val), react (val), useFieldOfView (val), createParticle (val), Sounds (val), Universal (val), Lighting (val), TweenService (val), RunService (val), getLifeFade (val), buildParticles (val), u126 (val)
    local u12, u19, u26, u4, u8, v1, v2, v3, v4, v5
    v1, u4 = useMotion(1)
    v2, u8 = useMotion(1)
    v3, u12 = useMotion(1)
    v4, u19 = useMotion(UDim2.fromScale(0.5, 0.38))
    v5, u26 = useMotion(UDim2.fromScale(0.5, 0.62))
    local v6 = {}
    local u30 = react.useRef(v6)
    react.useEffect(function() -- Line: 171 -- upvalues: p1 (val), useFieldOfView (upval), createParticle (upval), Sounds (upval), Universal (upval), Lighting (upval), TweenService (upval), u4 (val), u8 (val), u12 (val), u19 (val), u26 (val), RunService (upval), u30 (val), getLifeFade (upval)
        local v1
        if not p1.Visible then
            return
        end
        _, v1 = useFieldOfView()
        local u5 = false
        local u6 = 0
        local u7 = false
        local u8 = 0
        local u11 = table.create(48)
        local v2 = 48
        local v3 = 1
        for i = 1, v2, v3 do
            u11[i] = createParticle(i * 104729)
        end
        Sounds.playGlobalSoundEffect(Universal.EyecatcherAsh, 0.1, 5, 8)
        local BlurEffect = Instance.new("BlurEffect")
        BlurEffect.Size = 0
        BlurEffect.Parent = Lighting
        local ColorCorrectionEffect = Instance.new("ColorCorrectionEffect")
        ColorCorrectionEffect.Saturation = 0
        ColorCorrectionEffect.Brightness = 0
        ColorCorrectionEffect.Contrast = 0
        ColorCorrectionEffect.Parent = Lighting
        local v4 = TweenInfo.new(1)
        TweenService:Create(BlurEffect, v4, {Size = 24}):Play()
        v4 = TweenInfo.new(1)
        TweenService:Create(ColorCorrectionEffect, v4, {Saturation = -1, Brightness = -0.2}):Play()
        local u82 = v1("Basic", 50, "set", 58, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut))
        u4:tween(0.25, {time = 1})
        local v5 = {time = 1}
        u8:tween(0.48, v5)
        local u98 = task.delay(0.75, function() -- Line: 211 -- upvalues: u12 (upval), u19 (upval), u26 (upval)
            u12:tween(0, {time = 0.5})
            u19:spring(UDim2.fromScale(0.5, 0.4))
            u26:spring(UDim2.fromScale(0.5, 0.6))
        end)
        local u108 = task.delay(5.75, function() -- Line: 217 -- upvalues: u7 (ref), u8 (ref), u6 (ref), TweenService (upval), BlurEffect (val), ColorCorrectionEffect (val), u4 (upval), u8 (upval), u19 (upval), u26 (upval), u12 (upval), u82 (val)
            u7 = true
            u8 = u6
            local v1 = TweenInfo.new(2.5)
            TweenService:Create(BlurEffect, v1, {Size = 0}):Play()
            v1 = TweenInfo.new(2.5)
            TweenService:Create(ColorCorrectionEffect, v1, {Saturation = 0, Brightness = 0}):Play()
            u4:tween(2.5, {time = 1})
            u8:tween(1, {time = 0.8})
            u19:spring(UDim2.fromScale(0.5, 0.38))
            u26:spring(UDim2.fromScale(0.5, 0.62))
            u12:tween(1, {time = 0.45})
            u82(TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut))
        end)
        local u117 = RunService.RenderStepped:Connect(function(p1) -- Line: 236 -- upvalues: u5 (ref), u6 (ref), u7 (ref), u8 (ref), u11 (val), u30 (upval), getLifeFade (upval)
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
                v5 = u30.current[i]
                if v5 then
                    Glow = v5:FindFirstChild("Glow")
                    Core = v5:FindFirstChild("Core")
                    if u6 >= j.spawnDelay then
                        j.life = j.life + v9
                        if j.maxLife > j.life then
                            v4 = u6 * j.wobbleSpeed
                            v2 = math.sin(v4 + j.wobblePhase) * 0.016
                            j.x = j.x + (j.vx + v2) * v9
                            j.y = j.y + j.vy * v9
                            j.rotation = j.rotation + j.spin * v9
                            v3 = j.opacity * (getLifeFade(j.life, j.maxLife) * v1)
                            v4 = 0.02 < v3
                            v5.Visible = v4
                            v5.Position = UDim2.fromScale(j.x, j.y)
                            v5.Rotation = j.rotation
                            v5.Size = UDim2.fromOffset(j.width * 3.2, j.height * 3.2)
                            if Core then
                                Core.Size = UDim2.fromOffset(j.width, j.height)
                                Core.BackgroundColor3 = j.color
                                Core.BackgroundTransparency = 1 - v3
                            end
                            if Glow then
                                Glow.ImageColor3 = j.color
                                Glow.ImageTransparency = 1 - v3 * 0.29
                            end
                        else
                            v5.Visible = false
                        end
                    else
                        v5.Visible = false
                    end
                end
            end
        end)
        return function() -- Line: 290 -- upvalues: u5 (ref), u117 (val), BlurEffect (val), ColorCorrectionEffect (val), u30 (upval), u4 (upval), u8 (upval), u12 (upval), u19 (upval), u26 (upval), u98 (val), u108 (val)
            local v1
            u5 = true
            u117:Disconnect()
            BlurEffect:Destroy()
            ColorCorrectionEffect:Destroy()
            local v2 = 48
            local v3 = 1
            for i = 1, v2, v3 do
                v1 = u30.current[i]
                if v1 then
                    v1.Visible = false
                end
            end
            u4:immediate(1)
            u8:immediate(1)
            u12:immediate(1)
            u19:immediate(UDim2.fromScale(0.5, 0.38))
            u26:immediate(UDim2.fromScale(0.5, 0.62))
            pcall(task.cancel, u98)
            pcall(task.cancel, u108)
        end
    end, {p1.Visible, p1.Header, p1.Body})
    return react.createElement("Frame", {
        BackgroundTransparency = 1,
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Visible = p1.Visible,
    }, {Vignette = react.createElement("ImageLabel", {
        Image = "rbxassetid://135589412519765",
        BackgroundTransparency = 1,
        ZIndex = 0,
        ImageColor3 = Color3.fromRGB(0, 0, 0),
        ImageTransparency = v1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1.3, 1.2),
    }), Darken = react.createElement("Frame", {
        BorderSizePixel = 0,
        ZIndex = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BackgroundTransparency = v2,
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1.3, 1.2),
    }), Particles = react.createElement("Frame", {BackgroundTransparency = 1, ZIndex = 3, Size = UDim2.fromScale(1, 1)}, buildParticles(u30)), Container = react.createElement("Frame", {
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
        TextTransparency = v3,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = v4,
        Size = UDim2.fromOffset(687, 56),
    }), Body = react.createElement("TextLabel", {
        TextScaled = true,
        TextSize = 14,
        TextWrapped = true,
        BackgroundTransparency = 1,
        FontFace = Font.new("rbxasset://fonts/families/AccanthisADFStd.json"),
        Text = p1.Body,
        TextColor3 = u126,
        TextTransparency = v3,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = v5,
        Size = UDim2.fromOffset(687, 28),
    })})})
end