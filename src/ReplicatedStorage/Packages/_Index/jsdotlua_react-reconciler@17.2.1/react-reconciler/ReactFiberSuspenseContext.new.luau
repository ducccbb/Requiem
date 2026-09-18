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
--File: ReplicatedStorage.Packages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactFiberSuspenseContext.new
--                              Dumped in 0.000508 seconds
--                          Bytecode version 9  |  7 functions

require(script.Parent:WaitForChild("ReactInternalTypes"))
local v1 = require(script.Parent:WaitForChild("ReactFiberStack.new"))
local push = v1.push
local pop = v1.pop
local v2 = {InvisibleParentSuspenseContext = 1, ForceSuspenseFallback = 2}
local u24 = v1.createCursor(0)
v2.suspenseStackCursor = u24
function v2.hasSuspenseContext(p1, p2) -- Line: 59
    local v1 = bit32.band(p1, p2) ~= 0
    return v1
end
function v2.setDefaultShallowSuspenseContext(p1) -- Line: 66
    return (bit32.band(p1, 1))
end
function v2.setShallowSuspenseContext(p1, p2) -- Line: 72
    local v1 = bit32.band(p1, 1)
    return (bit32.bor(v1, p2))
end
function v2.addSubtreeSuspenseContext(p1, p2) -- Line: 82
    return (bit32.bor(p1, p2))
end
function v2.pushSuspenseContext(p1, p2) -- Line: 89 -- upvalues: push (val), u24 (val)
    push(u24, p2, p1)
end
function v2.popSuspenseContext(p1) -- Line: 93 -- upvalues: pop (val), u24 (val)
    pop(u24, p1)
end
return v2