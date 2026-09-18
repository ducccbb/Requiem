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
--           File: ReplicatedStorage.Common.Effects.Types.Gear.Disable Ejector
--                              Dumped in 0.000236 seconds
--                          Bytecode version 9  |  2 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Alive = require(Common:WaitForChild("Alive"))
local Universal = script.Parent.Parent:WaitForChild("Universal")
local DisableAttachment = require(Universal:WaitForChild("DisableAttachment"))
return function(p1) -- Line: 11 -- upvalues: Alive (val), DisableAttachment (val)
    local v1 = Alive.getAliveCharacterById(p1)
    if not v1 then
        return
    end
    local EjectorParticle = v1
    if EjectorParticle then
        EjectorParticle = v1:FindFirstChild("EjectorParticle", true)
    end
    if not EjectorParticle then
        return
    end
    DisableAttachment(EjectorParticle)
end