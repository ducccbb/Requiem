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
--File: ReplicatedStorage.Packages._Index.pyseph_packetprofiler@2.3.0.packetprofiler.Modules.CircularBuffer
--                              Dumped in 0.000708 seconds
--                          Bytecode version 9  |  7 functions

local v1
local function rotate_indice(p1, p2) -- Line: 3
    return (p1 - 1) % p2 + 1
end
local u1 = {
    filled = function(self) -- Line: 9
        local v1 = #self.history
        local v2 = v1 == self.max_length
        return v2
    end,
    push = function(p1, p2) -- Line: 13
        local v1
        if not (p1:filled()) then
            p1.history[#p1.history + 1] = p2
            return
        end
        p1.history[p1.oldest] = p2
        if p1.oldest ~= p1.max_length then
            v1 = p1.oldest + 1
        else
            v1 = 1
        end
        p1.oldest = v1
    end,
}
v1 = {}
u1.metatable = v1
function u1.metatable.__index(p1, p2) -- Line: 27
    local v1 = #p1.history
    if p2 == 0 or v1 < math.abs(p2) then
        return nil
    end
    if 1 <= p2 then
        return p1.history[(p1.oldest - p2 - 1) % v1 + 1]
    end
    if p2 <= -1 then
        return p1.history[(p2 + 1 + p1.oldest - 1) % v1 + 1]
    end
end
function u1.metatable.__len(p1) -- Line: 41
    return #p1.history
end
function u1.new(p1) -- Line: 45 -- upvalues: u1 (val)
    if type(p1) ~= "number" then
        error("Buffer length must be a positive integer")
    elseif p1 <= 1 then
        error("Buffer length must be a positive integer")
    end
    local v1 = {
        oldest = 1,
        history = {},
        max_length = p1,
        push = u1.push,
        filled = u1.filled,
    }
    setmetatable(v1, u1.metatable)
    return v1
end
return u1