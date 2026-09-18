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
--    File: ReplicatedStorage.Assets.Objects.Building Tools.Vendor.Roact.ElementUtils
--                              Dumped in 0.000535 seconds
--                          Bytecode version 9  |  5 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local Type = require(v1.Parent.Type)
local Symbol = require(v1.Parent.Symbol)
local function noop() -- Line: 11
    return nil
end
local u21 = {UseParentKey = Symbol.named("UseParentKey")}
function u21.iterateElements(p1) -- Line: 47 -- upvalues: Type (val), u21 (val), noop (val)
    local u7
    local v1 = Type.of(p1)
    if v1 == Type.Element then
        u7 = false
        return function() -- Line: 54 -- upvalues: u7 (ref), u21 (upval), p1 (val)
            if u7 then
                return nil
            end
            u7 = true
            return u21.UseParentKey, p1
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
function u21.getElementByKey(p1, p2) -- Line: 86 -- upvalues: Type (val), u21 (val)
    if p1 == nil or typeof(p1) == "boolean" then
        return nil
    end
    local v1 = Type.of(p1)
    if v1 == Type.Element then
        if p2 == u21.UseParentKey then
            return p1
        end
        return nil
    end
    if typeof(p1) == "table" then
        return p1[p2]
    end
    error("Invalid elements")
end
return u21