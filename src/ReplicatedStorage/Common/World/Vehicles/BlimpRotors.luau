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
--               File: ReplicatedStorage.Common.World.Vehicles.BlimpRotors
--                               Dumped in 0.00130 seconds
--                          Bytecode version 9  |  12 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ENGINE_STARTUP_SECONDS = require(script.Parent:WaitForChild("BlimpEngineAudio")).ENGINE_STARTUP_SECONDS
local function findRotorMotor(p1) -- Line: 39
    local Root = p1:FindFirstChild("Root")
    local Mesh = p1:FindFirstChild("Mesh")
    if not Root then
        return nil
    elseif not (Root:IsA("BasePart")) then
        return nil
    elseif not Mesh then
        return nil
    else
        if not (Mesh:IsA("BasePart")) then
            return nil
        end
        local Mesh_2 = Root:FindFirstChild("Mesh")
        if not Mesh_2 then
            for i, j in Root:GetChildren() do
                if j:IsA("Motor6D") then
                    return j
                end
            end
            for k, n in p1:GetDescendants() do
                if n:IsA("Motor6D") and n.Part0 == Root and n.Part1 == Mesh then
                    return n
                end
            end
            return nil
        elseif Mesh_2:IsA("Motor6D") then
            return Mesh_2
        end
    end
end
local function collectRotorMotors(p1) -- Line: 71 -- upvalues: findRotorMotor (val)
    local Attribute, v1, v2
    local v3 = {}
    local Rotors = p1:FindFirstChild("Rotors")
    if not Rotors then
        return v3
    end
    for i, j in Rotors:GetChildren() do
        if j:IsA("Model") then
            v2 = findRotorMotor(j)
            if v2 then
                Attribute = j:GetAttribute("SpinSign")
                v1 = if typeof(Attribute) == "number" then Attribute else 1
                table.insert(v3, {motor = v2, sign = v1, baseC0 = v2.C0})
            end
        end
    end
    return v3
end
local function collectRotorParticles(p1) -- Line: 109
    local Particles
    local v1 = {}
    local Rotors = p1:FindFirstChild("Rotors")
    if not Rotors then
        return v1
    end
    for i, j in Rotors:GetChildren() do
        if j:IsA("Model") then
            Particles = j:FindFirstChild("Particles")
            if Particles then
                for k, n in Particles:GetDescendants() do
                    if n:IsA("ParticleEmitter") then
                        table.insert(v1, n)
                    end
                end
            end
        end
    end
    return v1
end
local function computeSyncedZAngle(p1, p2, p3) -- Line: 200 -- upvalues: ENGINE_STARTUP_SECONDS (val)
    local v1 = p3 - p1
    if v1 <= 0 then
        return 0
    end
    if v1 < ENGINE_STARTUP_SECONDS then
        return p2 * math.rad(v1 * 360 * v1 / (2 * ENGINE_STARTUP_SECONDS))
    end
    local v2 = p2 * math.rad(360 * ENGINE_STARTUP_SECONDS * 0.5)
    return v2 + p2 * math.rad(360 * (v1 - ENGINE_STARTUP_SECONDS))
end
local function setRotorMotorZOrientation(p1, p2) -- Line: 221
    p1.motor.C0 = p1.baseC0 * CFrame.Angles(0, 0, p2)
end
local function setRotorParticlesEnabled(p1, p2) -- Line: 231
    if p1.particlesEnabled == p2 then
        return
    end
    p1.particlesEnabled = p2
    local particles = p1.particles
    local v1 = nil
    local v2 = nil
    for i, j in particles, v1, v2 do
        if j.Parent then
            j.Enabled = p2
        end
    end
end
local function isEngineAtFullSpeed(p1, p2) -- Line: 251 -- upvalues: ENGINE_STARTUP_SECONDS (val)
    if p1:GetAttribute("EngineEnabled") ~= true then
        return false
    end
    local Attribute = p1:GetAttribute("EngineStartupAt")
    if typeof(Attribute) ~= "number" then
        return false
    end
    local v1 = ENGINE_STARTUP_SECONDS <= p2 - Attribute
    return v1
end
local function resetMotors(p1) -- Line: 269 -- upvalues: setRotorMotorZOrientation (val), setRotorParticlesEnabled (val)
    local motors = p1.motors
    local v1 = nil
    local v2 = nil
    for i, j in motors, v1, v2 do
        if j.motor.Parent then
            setRotorMotorZOrientation(j, 0)
        end
    end
    setRotorParticlesEnabled(p1, false)
end
return {
    ROTOR_MAX_DEGREES_PER_SECOND = 360,
    ROTOR_SPINDOWN_SECONDS = 2,
    ENGINE_STARTUP_AT_ATTRIBUTE = "EngineStartupAt",
    ENGINE_SPINDOWN_AT_ATTRIBUTE = "EngineSpindownAt",
    ENGINE_STARTUP_SECONDS = ENGINE_STARTUP_SECONDS,
    createSpinState = function(p1) -- Line: 141 -- upvalues: collectRotorMotors (val), collectRotorParticles (val)
        local v1 = collectRotorMotors(p1)
        if #v1 == 0 then
            return nil
        end
        local v2 = collectRotorParticles(p1)
        local v3 = v2
        local v4 = nil
        local v5 = nil
        for i, j in v3, v4, v5 do
            j.Enabled = false
        end
        return {particlesEnabled = false, blimp = p1, motors = v1, particles = v2}
    end,
    refreshSpinState = function(p1) -- Line: 166 -- upvalues: collectRotorMotors (val), collectRotorParticles (val)
        local v1 = {}
        local motors = p1.motors
        local v2 = nil
        local v3 = nil
        for i, j in motors, v2, v3 do
            v1[j.motor] = true
        end
        for k, n in collectRotorMotors(p1.blimp) do
            if not (v1[n.motor]) then
                table.insert(p1.motors, n)
            end
        end
        local v4 = {}
        local particles = p1.particles
        v3 = nil
        local v5 = nil
        for m, i5 in particles, v3, v5 do
            v4[i5] = true
        end
        for i6, i7 in collectRotorParticles(p1.blimp) do
            if not (v4[i7]) then
                i7.Enabled = p1.particlesEnabled
                table.insert(p1.particles, i7)
            end
        end
    end,
    applySpin = function(p1, p2) -- Line: 285 -- upvalues: setRotorParticlesEnabled (val), isEngineAtFullSpeed (val), computeSyncedZAngle (val), setRotorMotorZOrientation (val), resetMotors (val)
        local v1, v2, v3
        local blimp = p1.blimp
        setRotorParticlesEnabled(p1, isEngineAtFullSpeed(blimp, p2))
        if blimp:GetAttribute("EngineEnabled") == true then
            local Attribute = blimp:GetAttribute("EngineStartupAt")
            if typeof(Attribute) ~= "number" then
                return
            end
            local motors = p1.motors
            v2 = nil
            local v4 = nil
            for k, n in motors, v2, v4 do
                if n.motor.Parent then
                    v3 = computeSyncedZAngle(Attribute, n.sign, p2)
                    setRotorMotorZOrientation(n, v3)
                end
            end
            return
        end
        setRotorParticlesEnabled(p1, false)
        local Attribute_2 = blimp:GetAttribute("EngineStartupAt")
        local Attribute_3 = blimp:GetAttribute("EngineSpindownAt")
        if typeof(Attribute_2) ~= "number" or typeof(Attribute_3) ~= "number" then
            resetMotors(p1)
            return
        end
        v2 = p2 - Attribute_3
        if 2 <= v2 then
            resetMotors(p1)
            return
        end
        local motors_2 = p1.motors
        local v5 = nil
        v3 = nil
        for i, j in motors_2, v5, v3 do
            if j.motor.Parent then
                v1 = computeSyncedZAngle(Attribute_2, j.sign, Attribute_3) * (1 - v2 / 2)
                setRotorMotorZOrientation(j, v1)
            end
        end
    end,
    resetMotors = resetMotors,
}