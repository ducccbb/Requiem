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
--                  File: ReplicatedStorage.Common.Utilities.Particles
--                              Dumped in 0.000888 seconds
--                          Bytecode version 9  |  12 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local RunService = game:GetService("RunService")
local u17 = {}
local function deepUpdateParticles(p1, p2) -- Line: 13
    local v1 = p2
    for k, v in pairs(p1:GetDescendants()) do
        if v:IsA("ParticleEmitter") then
            v.Enabled = v1
        elseif not (v:IsA("Trail")) and not (v:IsA("Beam")) then
        end
    end
end
local function emitParticle(p1, p2, p3) -- Line: 21 -- upvalues: RunService (val), u17 (val)
    if not (RunService:IsClient()) then
        if p2 and not (u17[p1]) then
            u17[p1] = p1.Lifetime
        end
        if p2 then
            p1.Lifetime = NumberRange.new(u17[p1].Min * p2, u17[p1].Max * p2)
        end
        local v1 = p3
        if not v1 then
            v1 = p1:GetAttribute("EmitCount") or 1
        end
        p1:Emit(v1)
        return
    else
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local Client = ReplicatedStorage:WaitForChild("Client")
        local User = Client:WaitForChild("User")
        local State = User:WaitForChild("State")
        local v2 = require(State:WaitForChild("ClientSettingsHandler")).getSettingFromName("Blood Enabled")
        local v3 = string.lower(p1.Name)
        if string.match(v3, "blood") and v2 == 0 then
            return
        end
    end
end
local function isEmitInstance(p1) -- Line: 93
    local v1 = p1:IsA("ParticleEmitter")
    if not v1 then
        v1 = p1:IsA("Sound")
    end
    return v1
end
local function getInstancesToEmit(p1) -- Line: 97 -- upvalues: isEmitInstance (val)
    local v1 = {}
    if isEmitInstance(p1) then
        v1[p1] = true
    end
    for i, j in p1:GetDescendants() do
        if isEmitInstance(j) then
            v1[j] = true
        end
    end
    return v1
end
return {
    deepEnableParticles = function(p1) -- Line: 78 -- upvalues: deepUpdateParticles (val)
        if p1:GetAttribute("Enabled") == true then
            return
        end
        p1:SetAttribute("Enabled", true)
        deepUpdateParticles(p1, true)
    end,
    deepDisableParticles = function(p1) -- Line: 87 -- upvalues: deepUpdateParticles (val)
        deepUpdateParticles(p1, false)
        p1:SetAttribute("Enabled", false)
    end,
    deepEmitParticles = function(p1, p2, p3, p4) -- Line: 52 -- upvalues: emitParticle (val)
        local u44, v1, v2, v3
        v1, u44, v3, v2 = p2, p1, p4, p3
        for k, v in pairs(p1:GetDescendants()) do
            if v:IsA("ParticleEmitter") then
                emitParticle(v, v3)
            elseif v:IsA("Sound") then
                if v2 then
                    v.Volume = v.Volume * v2
                end
                v:Play()
            end
        end
        if v1 then
            task.delay(10, function() -- Line: 72 -- upvalues: u44 (val)
                u44:Destroy()
            end)
        end
    end,
    deepEmitDelayedParticles = function(p1, p2) -- Line: 113 -- upvalues: getInstancesToEmit (val), emitParticle (val)
        local v1
        for i in getInstancesToEmit(p1) do
            if not (i:IsA("Sound")) then
                v1 = "EmitDelay"
            else
                v1 = "Delay"
            end
            local u37 = tonumber(i:GetAttribute("EmitCount"))
            if not u37 then
                u37 = tonumber(i.Name)
                if not u37 then
                    u37 = 0
                end
            end
            local u45 = tonumber(i:GetAttribute("EmitDuration")) or 0
            task.delay(tonumber(i:GetAttribute(v1)) or 0, function() -- Line: 121 -- upvalues: i (val), u37 (val), emitParticle (upval), u1 (val), u45 (val)
                if not (i:IsA("ParticleEmitter")) then
                    if i:IsA("Sound") then
                        i:Play()
                    end
                elseif 0 < u37 then
                    emitParticle(i, u1, u37)
                end
                if 0 < u45 and i:IsA("ParticleEmitter") then
                    task.defer(function() -- Line: 129 -- upvalues: i (upval), u45 (upval)
                        i.Enabled = true
                        task.wait(u45)
                        i.Enabled = false
                    end)
                end
            end)
        end
    end,
    emitParticle = emitParticle,
    getInstancesToEmit = getInstancesToEmit,
}