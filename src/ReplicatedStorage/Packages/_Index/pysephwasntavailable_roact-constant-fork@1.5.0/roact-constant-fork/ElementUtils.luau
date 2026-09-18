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
--File: ReplicatedStorage.Packages._Index.pysephwasntavailable_roact-constant-fork@1.5.0.roact-constant-fork.ElementUtils
--                              Dumped in 0.000314 seconds
--                          Bytecode version 9  |  5 functions

local Type = require(script.Parent.Type)
local Symbol = require(script.Parent.Symbol)
local function noop() -- Line: 5
    return nil
end
local u11 = {UseParentKey = Symbol.named("UseParentKey")}
function u11.iterateElements(p1) -- Line: 43 -- upvalues: Type (val), u11 (val), noop (val)
    local u7
    local v1 = Type.of(p1)
    if v1 == Type.Element then
        u7 = false
        return function(a1, p2) -- Line: 50 -- upvalues: u7 (ref), u11 (upval), p1 (val)
            if u7 then
                return nil
            end
            u7 = true
            return u11.UseParentKey, p1
        end
    end
    local u20 = p1
    u7 = typeof(u20)
    if u20 == nil or u7 == "boolean" then
        return noop
    end
    if u7 == "table" then
        return pairs(u20)
    end
    error("Invalid elements")
end
function u11.getElementByKey(p1, p2) -- Line: 82 -- upvalues: Type (val), u11 (val)
    if p1 == nil or typeof(p1) == "boolean" then
        return nil
    end
    local v1 = Type.of(p1)
    if v1 == Type.Element then
        if p2 == u11.UseParentKey then
            return p1
        end
        return nil
    end
    if typeof(p1) == "table" then
        return p1[p2]
    end
    error("Invalid elements")
end
return u11