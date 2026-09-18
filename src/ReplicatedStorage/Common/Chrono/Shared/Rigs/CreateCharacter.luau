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
--           File: ReplicatedStorage.Common.Chrono.Shared.Rigs.CreateCharacter
--                              Dumped in 0.000173 seconds
--                          Bytecode version 9  |  2 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Players = game:GetService("Players")
return function(p1, p2) -- Line: 10 -- upvalues: Players (val)
    local v1
    local v2 = {}
    if p2 >= -1 then
        v1 = p2
    else
        v1 = 1242803262
    end
    local HumanoidDescriptionFromUserId = Players:GetHumanoidDescriptionFromUserId(v1)
    local v3 = Players:CreateHumanoidModelFromDescription(HumanoidDescriptionFromUserId, Enum.HumanoidRigType.R15)
    v3.Parent = workspace
    v2.Model = v3
    return v2
end