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
--File: ReplicatedStorage.Packages._Index.pysephwasntavailable_roact-constant-fork@1.5.0.roact-constant-fork.assertDeepEqual
--                              Dumped in 0.000375 seconds
--                          Bytecode version 9  |  3 functions

local deepEqual
function deepEqual(p1, p2) -- Line: 10 -- upvalues: deepEqual (val)
    local v1, v2, v3
    local v4 = typeof(p1)
    if v4 ~= typeof(p2) then
        local v5 = typeof(p1)
        v4 = ("{1} is of type %s, but {2} is of type %s"):format(v5, (typeof(p2)))
        return false, v4
    end
    if typeof(p1) ~= "table" then
        if p1 == p2 then
            return true, nil
        end
        return false, "{1} ~= {2}"
    end
    v4 = {}
    for k, v in pairs(p1) do
        v4[k] = true
        v2, v3 = deepEqual(v, p2[k])
        if not v2 and v3 then
            v1 = v3:gsub("{1}", ("{1}[%s]"):format((tostring(k))))
            v1 = v1:gsub("{2}", ("{2}[%s]"):format((tostring(k))))
            return false, v1
        end
    end
    for k2, i in pairs(p2) do
        if not (v4[k2]) then
            v2, v3 = deepEqual(i, p1[k2])
            if not v2 and v3 then
                v1 = v3:gsub("{1}", ("{1}[%s]"):format((tostring(k2))))
                v1 = v1:gsub("{2}", ("{2}[%s]"):format((tostring(k2))))
                return false, v1
            end
        end
    end
    return true, nil
end
return function(p1, p2) -- Line: 57 -- upvalues: deepEqual (val)
    local v1, v2
    v1, v2 = deepEqual(p1, p2)
    if not v1 and v2 then
        local v3 = v2:gsub("{1}", "first")
        v3 = v3:gsub("{2}", "second")
        local v4 = ("Values were not deep-equal.\n%s"):format(v3)
        error(v4, 2)
    end
end