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
--File: ReplicatedStorage.Packages._Index.jsdotlua_luau-polyfill@1.2.6.luau-polyfill.extends
--                              Dumped in 0.000240 seconds
--                          Bytecode version 9  |  6 functions

return function(p1, p2, p3) -- Line: 16
    local u3 = {}
    u3.__index = u3
    function u3.__tostring(a1) -- Line: 19 -- upvalues: p1 (val)
        return getmetatable(p1).__tostring(a1)
    end
    local v1 = {}
    function u3.new(...) -- Line: 25 -- upvalues: p3 (val), u3 (val)
        local v1 = {}
        p3(v1, ...)
        return (setmetatable(v1, u3))
    end
    if typeof((getmetatable(p1))) == "table" and getmetatable(p1).__call then
        function v1.__call(p1, ...) -- Line: 32 -- upvalues: u3 (val)
            return u3.new(...)
        end
    end
    v1.__index = p1
    function v1.__tostring(a1) -- Line: 38 -- upvalues: u3 (val), p2 (val), p1 (val)
        if a1 == u3 then
            return (tostring(p2))
        end
        return getmetatable(p1).__tostring(a1)
    end
    setmetatable(u3, v1)
    return u3
end