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
--File: ReplicatedStorage.Packages._Index.jsdotlua_collections@1.2.6.collections.WeakMap
--                              Dumped in 0.000190 seconds
--                          Bytecode version 9  |  5 functions

require(script.Parent.Parent:WaitForChild("es7-types"))
local u9 = {}
u9.__index = u9
function u9.new() -- Line: 20 -- upvalues: u9 (val)
    local v1 = setmetatable({}, {__mode = "k"})
    local v2 = {_weakMap = v1}
    return (setmetatable(v2, u9))
end
function u9.get(p1, p2) -- Line: 25
    return p1._weakMap[p2]
end
function u9.set(p1, p2, p3) -- Line: 29
    p1._weakMap[p2] = p3
    return p1
end
function u9.has(p1, p2) -- Line: 34
    local v1 = p1._weakMap[p2] ~= nil
    return v1
end
return u9