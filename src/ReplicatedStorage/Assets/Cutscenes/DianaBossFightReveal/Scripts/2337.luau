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
--      File: ReplicatedStorage.Assets.Cutscenes.DianaBossFightReveal.Scripts.2337
--                              Dumped in 0.000224 seconds
--                          Bytecode version 9  |  3 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
return function(p1) -- Line: 8
    local v1, v2
    for k, v in pairs(p1.thrustslash:GetDescendants()) do
        if v:IsA("ParticleEmitter") then
            v1 = v:GetAttribute("EmitCount") or 0
            v2 = v:GetAttribute("EmitDuration") or 0
            v:Emit(v1)
            if 0 < v2 then
                v.Enabled = true
                task.delay(v2, function() -- Line: 24 -- upvalues: v (val)
                    v.Enabled = false
                end)
            end
        end
    end
end