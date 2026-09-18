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
--                 File: ReplicatedStorage.Common.Types.TitanCoreActions
--                              Dumped in 0.000413 seconds
--                          Bytecode version 9  |  3 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local u12 = {
    DefaultTitanBlinded = true,
    DefaultTitanArmCut = true,
    DefaultTitanLegCut = true,
    DefaultTitanDead = true,
    DefaultTitanWakeup = true,
    DefaultTitanStunned = true,
}
local u13 = {NapeGrabAttack = true, NapeGrabSwats = true}
return {
    CORE_TITAN_ANIMATIONS = {
        "DefaultTitanBlinded",
        "DefaultTitanArmCut",
        "DefaultTitanLegCut",
        "DefaultTitanDead",
        "DefaultTitanStunned",
    },
    isCoreTitanAction = function(p1) -- Line: 34 -- upvalues: u12 (val)
        local v1 = u12[p1] == true
        return v1
    end,
    isNapeGrabInterruptAction = function(p1) -- Line: 38 -- upvalues: u13 (val)
        local v1 = u13[p1] == true
        return v1
    end,
}