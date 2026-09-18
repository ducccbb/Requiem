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
--File: ReplicatedStorage.Client.Interfaces.Components.Utilities.Space3D.RarityParticles
--                               Dumped in 0.00131 seconds
--                          Bytecode version 9  |  10 functions

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
local u35 = Vector2.new(0.5, 0.5)
local function smoothStep(p1) -- Line: 64
    local v1 = math.clamp(p1, 0, 1)
    return v1 * v1 * (3 - v1 * 2)
end
local function getBurstOpacity(p1) -- Line: 69 -- upvalues: smoothStep (val)
    local v1 = math.clamp(p1, 0, 1)
    if v1 < 0.16 then
        return smoothStep(v1 / 0.16) * 0.72
    end
    if 0.72 < v1 then
        return smoothStep((1 - v1) / 0.28) * 0.72
    end
    return 0.72
end
local function launchParticle(p1, p2) -- Line: 83 -- upvalues: u35 (val)
    local v1
    local v2 = p2:NextNumber(0, math.pi * 2)
    local v3 = p2:NextNumber(0.2, 0.38)
    p1.x = u35.X + p2:NextNumber(-0.015, 0.015)
    p1.y = u35.Y + p2:NextNumber(-0.015, 0.015)
    p1.vx = math.cos(v2) * v3
    p1.vy = math.sin(v2) * v3
    p1.lifetime = p2:NextNumber(7, 10.5)
    p1.age = 0
    p1.respawnDelay = 0
    p1.size = p2:NextNumber(10, 18)
    p1.rotation = p2:NextNumber(0, 360)
    local v4 = p2:NextNumber(120, 280)
    local v5 = p2:NextNumber()
    if 0.5 >= v5 then
        v1 = -1
    else
        v1 = 1
    end
    p1.spin = v4 * v1
end
local function getBrightParticleColor(p1) -- Line: 99
    local v1 = Color3.fromRGB(255, 236, 196)
    return p1:Lerp(v1, 0.15)
end
return react.memo(function(p1) -- Line: 103 -- upvalues: react (val), launchParticle (val), RunService (val), getBrightParticleColor (val), getBurstOpacity (val)
    local v1, v2
    local u4 = react.useRef({})
    local v3 = p1.image or "rbxassetid://133939382491195"
    local v4 = {p1.card, p1.color, p1.seed, v3}
    react.useEffect(function() -- Line: 107 -- upvalues: p1 (val), launchParticle (upval), RunService (upval), getBrightParticleColor (upval), u4 (val), getBurstOpacity (upval)
        local v1
        local u3 = Random.new(p1.seed)
        local u6 = table.create(12)
        local v2 = 12
        local v3 = 1
        for i = 1, v2, v3 do
            v1 = {}
            launchParticle(v1, u3)
            v1.age = -((i - 1) / math.max(11, 1)) * 0.18
            u6[i] = v1
        end
        local u32 = false
        local u40 = RunService.RenderStepped:Connect(function(a1) -- Line: 119 -- upvalues: u32 (ref), p1 (upval), getBrightParticleColor (upval), u6 (val), u4 (upval), launchParticle (upval), u3 (val), getBurstOpacity (upval)
            local v1, v2, v3, v4, v5
            if u32 then
                return
            end
            local card = p1.card
            local current = p1.overlayRef.current
            if not card or not card.Parent or not current then
                return
            end
            local AbsolutePosition = card.AbsolutePosition
            local AbsoluteSize = card.AbsoluteSize
            if AbsoluteSize.X <= 0 or AbsoluteSize.Y <= 0 then
                return
            end
            local AbsolutePosition_2 = current.AbsolutePosition
            local v6 = math.clamp(AbsoluteSize.Y / 300, 0.85, 1.1)
            local v7 = getBrightParticleColor(p1.color)
            local v8 = math.exp(a1 * -1.35)
            local v9 = u6
            local v10 = nil
            local v11 = nil
            local v12 = a1
            for i, j in v9, v10, v11 do
                v1 = u4.current[i]
                if 0 < j.respawnDelay then
                    j.respawnDelay = j.respawnDelay - v12
                    if v1 then
                        v1.Visible = false
                    end
                    if j.respawnDelay <= 0 then
                        launchParticle(j, u3)
                    end
                elseif j.age >= 0 then
                    j.age = j.age + v12
                    j.vx = j.vx * v8
                    j.vy = j.vy * v8
                    j.x = j.x + j.vx * v12
                    j.y = j.y + j.vy * v12
                    v2 = j.age / j.lifetime
                    j.rotation = (j.rotation + j.spin * (v2 * 0.75 + 0.45) * v12) % 360
                    if j.lifetime <= j.age then
                        j.respawnDelay = u3:NextNumber(4, 8)
                        if v1 then
                            v1.Visible = false
                        end
                    elseif v1 then
                        v3 = getBurstOpacity(v2)
                        v4 = 0.001 < v3
                        v1.Visible = v4
                        if v4 then
                            v5 = j.size * v6
                            v1.ImageColor3 = v7
                            v1.ImageTransparency = 1 - v3
                            v1.Rotation = j.rotation
                            v1.AnchorPoint = Vector2.new(0.5, 0.5)
                            v1.Position = UDim2.fromOffset(AbsolutePosition.X + j.x * AbsoluteSize.X - AbsolutePosition_2.X, AbsolutePosition.Y + j.y * AbsoluteSize.Y - AbsolutePosition_2.Y)
                            v1.Size = UDim2.fromOffset(v5, v5)
                        end
                    end
                else
                    j.age = j.age + v12
                    if v1 then
                        v1.Visible = false
                    end
                end
            end
        end)
        return function() -- Line: 208 -- upvalues: u32 (ref), u40 (val), u4 (upval)
            local v1
            u32 = true
            u40:Disconnect()
            local v2 = 12
            local v3 = 1
            for i = 1, v2, v3 do
                v1 = u4.current[i]
                if v1 then
                    v1.Visible = false
                end
            end
        end
    end, v4)
    v1 = {}
    local v5 = 12
    v4 = 1
    for i = 1, v5, v4 do
        v2 = ("Particle%*"):format(i)
        v1[v2] = react.createElement("ImageLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ZIndex = 3,
            ref = function(p1) -- Line: 224 -- upvalues: u4 (val), i (val)
                u4.current[i] = p1
                if p1 then
                    p1.Visible = false
                end
            end,
            Image = v3,
            ResampleMode = Enum.ResamplerMode.Pixelated,
            ScaleType = Enum.ScaleType.Fit,
        })
    end
    return react.createElement(react.Fragment, {}, v1)
end)