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
--                File: ReplicatedStorage.Common.Utilities.DamageFalloff
--                              Dumped in 0.000242 seconds
--                          Bytecode version 9  |  3 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local v2 = {
    computeMultiplier = function(p1, p2, p3, p4) -- Line: 20
        if p2 <= 0 or p4 <= p3 or p1 <= p3 then
            return 1
        end
        if p4 <= p1 then
            return 1 - p2
        end
        return 1 - p2 * ((p1 - p3) / (p4 - p3))
    end,
}
function v2.scaleDamageTable(p1, p2) -- Line: 42
    local v1
    local v2 = {head = p1.head * p2, body = p1.body * p2}
    if not p1.leg then
        v1 = nil
    else
        v1 = p1.leg * p2
    end
    v2.leg = v1
    if not p1.arm then
        v1 = nil
    else
        v1 = p1.arm * p2
        if not v1 then
            v1 = nil
        end
    end
    v2.arm = v1
    return v2
end
return v2