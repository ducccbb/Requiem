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
--    File: ReplicatedStorage.Assets.Objects.Building Tools.Vendor.Roact.createSignal
--                              Dumped in 0.000346 seconds
--                          Bytecode version 9  |  7 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local function addToMap(p1, p2, p3) -- Line: 22
    local v1 = {}
    for k, v in pairs(p1) do
        v1[k] = v
    end
    v1[p2] = p3
    return v1
end
local function removeFromMap(p1, p2) -- Line: 34
    local v1 = {}
    for k, v in pairs(p1) do
        if k ~= p2 then
            v1[k] = v
        end
    end
    return v1
end
return function() -- Line: 46 -- upvalues: addToMap (val), removeFromMap (val)
    local u0 = {}
    local v1 = {}
    function v1.subscribe(p1, p2) -- Line: 49 -- upvalues: u0 (ref), addToMap (upval), removeFromMap (upval)
        local v1 = typeof(p2) == "function"
        assert(v1, "Can only subscribe to signals with a function.")
        local u11 = {callback = p2}
        u0 = addToMap(u0, p2, u11)
        return function() -- Line: 58 -- upvalues: u11 (val), u0 (upval), removeFromMap (upval), p2 (val)
            assert(not u11.disconnected, "Listeners can only be disconnected once.")
            u11.disconnected = true
            u0 = removeFromMap(u0, p2)
        end
    end
    function v1.fire(p1, ...) -- Line: 68 -- upvalues: u0 (ref)
        for k, v in pairs(u0) do
            if not v.disconnected then
                k(...)
            end
        end
    end
    return v1
end