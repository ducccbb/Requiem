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
--       File: ReplicatedStorage.Assets.Objects.Building Tools.Vendor.Roact.strict
--                              Dumped in 0.000215 seconds
--                          Bytecode version 9  |  4 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
return function(p1, p2) -- Line: 8
    local v1 = p2
    if not v1 then
        v1 = tostring(p1)
    end
    local u7 = v1
    local v2 = {}
    function v2.__index(p1, p2) -- Line: 12 -- upvalues: u7 (ref)
        local v1 = tostring(p2)
        local v2 = typeof(p2)
        local v3 = ("%q (%s) is not a valid member of %s"):format(v1, v2, u7)
        error(v3, 2)
    end
    function v2.__newindex(p1, p2, p3) -- Line: 22 -- upvalues: u7 (ref)
        local v1 = tostring(p2)
        local v2 = typeof(p2)
        local v3 = ("%q (%s) is not a valid member of %s"):format(v1, v2, u7)
        error(v3, 2)
    end
    return (setmetatable(p1, v2))
end