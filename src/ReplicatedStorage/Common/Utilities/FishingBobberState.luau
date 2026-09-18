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
--              File: ReplicatedStorage.Common.Utilities.FishingBobberState
--                              Dumped in 0.000276 seconds
--                          Bytecode version 9  |  5 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local u12 = {}
return {
    setBobberState = function(p1, p2, p3, p4) -- Line: 26 -- upvalues: u12 (val)
        u12[p1] = {settled = p2, inWater = p3, position = p4}
    end,
    clearBobber = function(p1) -- Line: 37 -- upvalues: u12 (val)
        u12[p1] = nil
    end,
    isBobberInWater = function(p1) -- Line: 45 -- upvalues: u12 (val)
        if not p1 then
            return false
        end
        local v1 = u12[p1]
        local settled = false
        if v1 ~= nil then
            settled = v1.settled
            if settled then
                settled = v1.inWater
            end
        end
        return settled
    end,
    getBobberPosition = function(p1) -- Line: 58 -- upvalues: u12 (val)
        if not p1 then
            return nil
        end
        local v1 = u12[p1]
        local position = v1
        if position then
            position = v1.position
        end
        return position
    end,
}