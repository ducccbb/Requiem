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
--  File: ReplicatedStorage.Common.Effects.Types.Cutscenes.Keyframes.AwakeningStygian1
--                              Dumped in 0.000386 seconds
--                          Bytecode version 9  |  4 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Particles = require(Utilities:WaitForChild("Particles"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Signals = require(Common_2:WaitForChild("Signals"))
local Enchantments = script.Parent.Parent.Parent:WaitForChild("Enchantments")
local v2 = Enchantments:WaitForChild("Garrisons Resolve")
local u62 = require(v2:WaitForChild("Garrisons Resolve"))
local function onActivateCommanderAwaken(p1) -- Line: 23 -- upvalues: u62 (val), Signals (val)
    u62(p1.RQ_Stygian_Animation, true)
    Signals.Bars:Fire(0.35, -2)
end
local function onHandleEmitKeyframe(p1, p2) -- Line: 35 -- upvalues: Particles (val)
    local v1 = p1:FindFirstChild(p2, true)
    if not v1 then
        return
    end
    Particles.deepEmitParticles(v1, true)
end
return function(p1, p2) -- Line: 48 -- upvalues: onActivateCommanderAwaken (val), onHandleEmitKeyframe (val)
    local v1 = string.split(p1, "_")
    if p1 == "Emit_CommanderAwaken" then
        onActivateCommanderAwaken(p2)
        return
    end
    if v1[1] == "Emit" then
        onHandleEmitKeyframe(p2, v1[2])
    end
end