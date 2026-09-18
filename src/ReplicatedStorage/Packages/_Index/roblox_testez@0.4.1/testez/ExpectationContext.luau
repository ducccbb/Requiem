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
-- File: ReplicatedStorage.Packages._Index.roblox_testez@0.4.1.testez.ExpectationContext
--                              Dumped in 0.000324 seconds
--                          Bytecode version 9  |  5 functions

local Expectation = require(script.Parent.Expectation)
local checkMatcherNameCollisions = Expectation.checkMatcherNameCollisions
local function copy(p1) -- Line: 4
    local v1 = {}
    for k, v in pairs(p1) do
        v1[k] = v
    end
    return v1
end
local u7 = {}
u7.__index = u7
function u7.new(p1) -- Line: 17 -- upvalues: u7 (val)
    local v1
    local v2 = {}
    if not p1 then
        v1 = {}
    else
        local v3 = {}
        for k, v in pairs(p1._extensions) do
            v3[k] = v
        end
        v1 = v3
        if not v1 then
            v1 = {}
        end
    end
    v2._extensions = v1
    return (setmetatable(v2, u7))
end
function u7.startExpectationChain(p1, ...) -- Line: 25 -- upvalues: Expectation (val)
    return Expectation.new(...):extend(p1._extensions)
end
function u7:extend(p2) -- Line: 29 -- upvalues: checkMatcherNameCollisions (val)
    local v1
    local v2 = self
    for k, v in pairs(p2) do
        v1 = v2._extensions[k] == nil
        assert(v1, string.format("Cannot reassign %q in expect.extend", k))
        v1 = checkMatcherNameCollisions(k)
        assert(v1, string.format("Cannot overwrite matcher %q; it already exists", k))
        v2._extensions[k] = v
    end
end
return u7