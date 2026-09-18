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
--               File: ReplicatedStorage.Common.Utilities.Timeout.debounce
--                              Dumped in 0.000754 seconds
--                          Bytecode version 9  |  13 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local setTimeout = require(script.Parent:WaitForChild("setTimeout"))
return function(p1, p2, p3) -- Line: 41 -- upvalues: setTimeout (val)
    local u3, v1
    if p2 ~= nil then
        u3 = p2
    else
        u3 = 0
    end
    if p3 ~= nil then
        v1 = p3
    else
        v1 = {}
    end
    local v2 = v1
    local leading = v2.leading
    if leading == nil then
        leading = false
    end
    local trailing = v2.trailing
    if trailing == nil then
        trailing = true
    end
    local maxWait = v2.maxWait
    local u16 = maxWait ~= nil
    local u17 = 0
    local u18 = 0
    local u19 = nil
    local u20 = nil
    local u21 = nil
    local function u22(a1) -- Line: 64 -- upvalues: u19 (ref), u18 (ref), u20 (ref), p1 (val)
        u19 = nil
        u18 = a1
        u20 = p1(unpack(u19))
        return u20
    end
    local u28 = nil
    local function u29(p1) -- Line: 72 -- upvalues: u18 (ref), u21 (ref), setTimeout (upval), u28 (ref), u3 (ref), leading (ref), u22 (val), u20 (ref)
        u18 = p1
        u21 = setTimeout(u28, u3)
        if leading then
            return (u22(p1))
        end
        return u20
    end
    local function u38(p1) -- Line: 80 -- upvalues: u17 (ref), u18 (ref), u3 (ref), u16 (val), maxWait (val)
        local v1 = p1 - u18
        local v2 = u3 - (p1 - u17)
        if u16 then
            return (math.min(v2, maxWait - v1))
        end
        return v2
    end
    local function u41(p1) -- Line: 86 -- upvalues: u17 (ref), u18 (ref), u3 (ref), u16 (val), maxWait (val)
        local v1 = p1 - u17
        local v2 = p1 - u18
        local v3 = true
        if u17 ~= nil then
            v3 = true
            if u3 > v1 then
                v3 = true
                if v1 >= 0 then
                    v3 = u16
                    if v3 then
                        v3 = maxWait <= v2
                    end
                end
            end
        end
        return v3
    end
    local u42 = nil
    function u28() -- Line: 96 -- upvalues: u41 (val), u42 (ref), u21 (ref), setTimeout (upval), u28 (ref), u38 (val)
        local v1 = os.clock()
        if u41(v1) then
            return u42(v1)
        end
        u21 = setTimeout(u28, u38(v1))
    end
    function u42(p1) -- Line: 105 -- upvalues: u21 (ref), trailing (ref), u19 (ref), u22 (val), u20 (ref)
        u21 = nil
        if not trailing then
            u19 = nil
            return u20
        end
        if u19 then
            return u22(p1)
        end
        u19 = nil
        return u20
    end
    local function u50(...) -- Line: 131 -- upvalues: u41 (val), u19 (ref), u17 (ref), u21 (ref), u29 (val), u16 (val), setTimeout (upval), u28 (ref), u3 (ref), u22 (val), u20 (ref)
        local v1 = {...}
        local v2 = os.clock()
        u19 = v1
        u17 = v2
        if not (u41(v2)) then
            if u21 == nil then
                u21 = setTimeout(u28, u3)
            end
            return u20
        end
        if u21 == nil then
            return u29(u17)
        end
        if u16 then
            u21 = setTimeout(u28, u3)
            return u22(u17)
        end
        if u21 == nil then
            u21 = setTimeout(u28, u3)
        end
        return u20
    end
    local v3 = {
        cancel = function() -- Line: 115 -- upvalues: u21 (ref), u18 (ref), u19 (ref), u17 (ref)
            local v1 = u21
            if v1 ~= nil then
                v1()
            end
            u21 = nil
            u18 = 0
            u19 = nil
            u17 = 0
        end,
        flush = function() -- Line: 125 -- upvalues: u21 (ref), u20 (ref), u42 (ref)
            if u21 == nil then
                return u20
            end
            return (u42(os.clock()))
        end,
        pending = function() -- Line: 128 -- upvalues: u21 (ref)
            local v1 = u21 ~= nil
            return v1
        end,
    }
    local v4 = {
        __call = function(p1, ...) -- Line: 157 -- upvalues: u50 (val)
            return u50(unpack({...}))
        end,
    }
    return (setmetatable(v3, v4))
end