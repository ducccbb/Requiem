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
--     File: ReplicatedStorage.Client.Interfaces.Routes.Screen.Flashbacks.Flashback
--                               Dumped in 0.00211 seconds
--                          Bytecode version 9  |  22 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Signals = require(Common:WaitForChild("Signals"))
local Hooks = script.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useMotion = require(Hooks:WaitForChild("useMotion"))
local u61 = {"rbxassetid://268592485", "rbxassetid://268592462", "rbxassetid://268592427", "rbxassetid://268590007"}
local u66 = {}
local v2 = Color3.fromRGB(163, 172, 211)
local v3 = Color3.fromRGB(144, 152, 168)
local v4 = Color3.fromRGB(178, 197, 205)
local v5 = Color3.fromRGB(128, 126, 148)
u66[1] = v2
u66[2] = v3
u66[3] = v4
u66[4] = v5
u66[5] = Color3.fromRGB(152, 165, 176)
local function resetParticle(p1, p2) -- Line: 75 -- upvalues: u66 (val)
    local v1 = Random.new(p2)
    local v2 = v1:NextNumber(2, 7)
    p1.x = v1:NextNumber(0.04, 0.96)
    p1.y = v1:NextNumber(-0.12, 0.55)
    p1.vx = v1:NextNumber(-0.008, 0.008)
    p1.vy = v1:NextNumber(0.012, 0.032)
    p1.rotation = v1:NextNumber(0, 360)
    p1.spin = v1:NextNumber(-24, 24)
    p1.width = v2
    p1.height = v2 * v1:NextNumber(0.7, 1.3)
    p1.color = u66[v1:NextInteger(1, #u66)]
    p1.opacity = v1:NextNumber(0.25, 0.55)
    p1.life = 0
    p1.maxLife = v1:NextNumber(5, 9)
    p1.spawnDelay = v1:NextNumber(0, 1.5)
    p1.wobblePhase = v1:NextNumber(0, math.pi * 2)
    p1.wobbleSpeed = v1:NextNumber(0.8, 2.2)
end
local function createParticle(p1) -- Line: 100 -- upvalues: resetParticle (val)
    local v1 = {}
    resetParticle(v1, p1)
    return v1
end
local function getLifeFade(p1, p2) -- Line: 111
    local v1 = p1 / p2
    if v1 < 0.15 then
        return v1 / 0.15
    end
    if 0.75 < v1 then
        return (math.max(0, (1 - v1) / 0.25))
    end
    return 1
end
local function buildParticles(p1) -- Line: 129 -- upvalues: react (val)
    local v1
    local v2 = {}
    local v3 = 36
    local v4 = 1
    for i = 1, v3, v4 do
        v1 = ("Particle%*"):format(i)
        v2[v1] = react.createElement("Frame", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ZIndex = 2,
            ref = function(a1) -- Line: 134 -- upvalues: p1 (val), i (val)
                p1.current[i] = a1
                if a1 then
                    a1.Visible = false
                end
            end,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromOffset(20, 20),
        }, {Glow = react.createElement("ImageLabel", {
            Image = "rbxassetid://17812826389",
            ImageTransparency = 1,
            BackgroundTransparency = 1,
            ZIndex = 1,
            ImageColor3 = Color3.fromRGB(196, 186, 168),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(2.4, 2.4),
        }), Core = react.createElement("Frame", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ZIndex = 2,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(188, 178, 162),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromOffset(6, 6),
        }, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(1, 0)})})})
    end
    return v2
end
local function createStaticLayers(p1, p2) -- Line: 178 -- upvalues: u61 (val), react (val)
    local v1
    local v2 = {}
    local v3 = u61
    local v4 = nil
    local v5 = nil
    for i, j in v3, v4, v5 do
        v1 = ("Static%*"):format(i)
        v2[v1] = react.createElement("ImageLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ZIndex = 1,
            ref = function(p1) -- Line: 183 -- upvalues: p2 (val), i (val)
                p2.current[i] = p1
                if p1 then
                    local v1 = i == 1
                    p1.Visible = v1
                end
            end,
            Image = j,
            ImageColor3 = Color3.fromRGB(255, 255, 255),
            ImageTransparency = p1:map(function(p1) -- Line: 192
                return (1 - p1) * 0.09999999999999998 + 0.9
            end),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(1, 1),
        })
    end
    return v2
end
return function() -- Line: 210 -- upvalues: react (val), useMotion (val), u61 (val), createParticle (val), RunService (val), resetParticle (val), getLifeFade (val), Signals (val), buildParticles (val), createStaticLayers (val)
    local u12, u3, u4, v1
    u3, u4 = react.useState(false)
    local u8 = react.useRef(false)
    v1, u12 = useMotion(0)
    local v2 = {}
    local u16 = react.useRef(v2)
    local v3 = {}
    local u20 = react.useRef(v3)
    local u24 = react.useRef(nil)
    local u28 = react.useRef(nil)
    local function hideVisuals() -- Line: 219 -- upvalues: u16 (val), u61 (upval), u20 (val)
        local v1
        local v2 = 36
        local v3 = 1
        for i = 1, v2, v3 do
            v1 = u16.current[i]
            if v1 then
                v1.Visible = false
            end
        end
        v2 = #u61
        v3 = 1
        for j = 1, v2, v3 do
            v1 = u20.current[j]
            if v1 then
                v1.Visible = false
            end
        end
    end
    local function stopRenderLoop() -- Line: 235 -- upvalues: u28 (val), hideVisuals (val)
        local current = u28.current
        if current then
            current:Disconnect()
            u28.current = nil
        end
        hideVisuals()
    end
    local function startRenderLoop() -- Line: 245 -- upvalues: u28 (val), u24 (val), createParticle (upval), RunService (upval), u12 (val), u8 (val), stopRenderLoop (val), u61 (upval), u20 (val), u16 (val), resetParticle (upval), getLifeFade (upval)
        local current, u24, v1, v2
        if u28.current then
            return
        end
        if not u24.current then
            v1 = table.create(36)
            v2 = 36
            local v3 = 1
            for i = 1, v2, v3 do
                v1[i] = createParticle(i * 104729)
            end
            u24.current = v1
        end
        local u23 = 0
        u24 = 0
        local u25 = 1
        local u26 = 0
        current = u24.current
        u28.current = RunService.RenderStepped:Connect(function(p1) -- Line: 264 -- upvalues: u12 (upval), u8 (upval), stopRenderLoop (upval), u23 (ref), u24 (ref), u26 (ref), u25 (ref), u61 (upval), u20 (upval), current (val), u16 (upval), resetParticle (upval), getLifeFade (upval)
            local Core, Glow, v1, v2, v3, v4, v5, v6, v7, v8
            local v9 = u12:get()
            local current_2 = u8.current
            if not current_2 then
                current_2 = if 0.02 >= v9 then not u12:isComplete() else true
            end
            if not current_2 then
                stopRenderLoop()
                return
            end
            u23 = u23 + p1
            u24 = u24 + 1
            if 0.02 >= v9 then
                if v9 > 0.02 then
                    v1 = p1
                else
                    v5 = #u61
                    v6 = 1
                    for i = 1, v5, v6 do
                        v7 = u20.current[i]
                        if v7 then
                            v7.Visible = false
                        end
                    end
                end
            elseif 3 <= u24 then
                local v10
                u24 = 0
                if 0 >= u26 then
                    u25 = u25 % #u61 + 1
                    if math.random() < 0 then
                        u26 = math.random(0, 0)
                    end
                else
                    u26 = u26 - 1
                end
                v5 = #u61
                v6 = 1
                v1 = p1
                for j = 1, v5, v6 do
                    v7 = u20.current[j]
                    if v7 then
                        v10 = j == u25
                        v7.Visible = v10
                    end
                end
            end
            v5 = current
            v6 = nil
            local v11 = nil
            for k, n in v5, v6, v11 do
                v8 = u16.current[k]
                if v8 then
                    Glow = v8:FindFirstChild("Glow")
                    Core = v8:FindFirstChild("Core")
                    if v9 <= 0.02 then
                        v8.Visible = false
                    elseif u23 >= n.spawnDelay then
                        n.life = n.life + v1
                        if n.maxLife > n.life then
                            v4 = u23 * n.wobbleSpeed
                            v2 = math.sin(v4 + n.wobblePhase) * 0.008
                            n.x = n.x + (n.vx + v2) * v1
                            n.y = n.y + n.vy * v1
                            n.rotation = n.rotation + n.spin * v1
                            v3 = n.opacity * (getLifeFade(n.life, n.maxLife) * v9)
                            v4 = 0.02 < v3
                            v8.Visible = v4
                            v8.Position = UDim2.fromScale(n.x, n.y)
                            v8.Rotation = n.rotation
                            v8.Size = UDim2.fromOffset(n.width * 2.8, n.height * 2.8)
                            if Core then
                                Core.Size = UDim2.fromOffset(n.width, n.height)
                                Core.BackgroundColor3 = n.color
                                Core.BackgroundTransparency = 1 - v3
                            end
                            if Glow then
                                Glow.ImageColor3 = n.color
                                Glow.ImageTransparency = 1 - v3 * 0.1
                            end
                        else
                            v4 = math.floor(u23 * 1000)
                            resetParticle(n, v4 + k * 97)
                            n.spawnDelay = u23 + Random.new(k):NextNumber(0, 0.4)
                            v8.Visible = false
                        end
                    else
                        v8.Visible = false
                    end
                end
            end
        end)
    end
    react.useEffect(function() -- Line: 358 -- upvalues: Signals (upval), u4 (val)
        local u5 = Signals.Flashback:Connect(function(p1) -- Line: 359 -- upvalues: u4 (upval)
            u4(p1)
        end)
        return function() -- Line: 363 -- upvalues: u5 (val)
            u5:Disconnect()
        end
    end, {})
    react.useEffect(function() -- Line: 368 -- upvalues: u8 (val), u3 (val), u12 (val), startRenderLoop (val)
        u8.current = u3
        if u3 then
            u12:tween(1, {time = 0.6})
            startRenderLoop()
            return
        end
        u12:tween(0, {time = 0.6})
        local v1 = u12:get()
        if 0.02 < v1 then
            startRenderLoop()
        elseif not (u12:isComplete()) then
            startRenderLoop()
        end
    end, {u3})
    react.useEffect(function() -- Line: 383 -- upvalues: stopRenderLoop (val)
        return function() -- Line: 384 -- upvalues: stopRenderLoop (upval)
            stopRenderLoop()
        end
    end, {})
    local v4 = {Vignette = react.createElement("ImageLabel", {
        Image = "rbxassetid://135589412519765",
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 0,
        ImageColor3 = Color3.fromRGB(18, 16, 14),
        ImageTransparency = v1:map(function(p1) -- Line: 393
            return 1 - p1 * 0.95
        end),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1.3, 1.2),
    }), Particles = react.createElement("Frame", {BackgroundTransparency = 1, ZIndex = 2, Size = UDim2.fromScale(1, 1)}, buildParticles(u16))}
    for i, j in createStaticLayers(v1, u20) do
        v4[i] = j
    end
    return react.createElement("Frame", {
        BackgroundTransparency = 1,
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Visible = v1:map(function(p1) -- Line: 420
            local v1 = 0.01 < p1
            return v1
        end),
    }, v4)
end