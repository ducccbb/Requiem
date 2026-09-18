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
--   File: ReplicatedStorage.Packages._Index.roblox_testez@0.4.1.testez.LifecycleHooks
--                              Dumped in 0.000459 seconds
--                          Bytecode version 9  |  9 functions

local TestEnum = require(script.Parent.TestEnum)
local u5 = {}
u5.__index = u5
function u5.new() -- Line: 6 -- upvalues: u5 (val)
    local v1 = {_stack = {}}
    return (setmetatable(v1, u5))
end
function u5.getBeforeEachHooks(p1) -- Line: 16 -- upvalues: TestEnum (val)
    local BeforeEach = TestEnum.NodeType.BeforeEach
    local v1 = {}
    for i, v in ipairs(p1._stack) do
        for i2, i3 in ipairs(v[BeforeEach]) do
            table.insert(v1, i3)
        end
    end
    return v1
end
function u5.getAfterEachHooks(p1) -- Line: 32 -- upvalues: TestEnum (val)
    local AfterEach = TestEnum.NodeType.AfterEach
    local v1 = {}
    for i, v in ipairs(p1._stack) do
        for i2, i3 in ipairs(v[AfterEach]) do
            table.insert(v1, 1, i3)
        end
    end
    return v1
end
function u5.popHooks(p1) -- Line: 48
    table.remove(p1._stack, #p1._stack)
end
function u5.pushHooksFrom(p1, p2) -- Line: 52 -- upvalues: TestEnum (val)
    local v1 = p2 ~= nil
    assert(v1)
    local _stack = p1._stack
    local v2 = {}
    v2[TestEnum.NodeType.BeforeAll] = p1:_getHooksOfType(p2.children, TestEnum.NodeType.BeforeAll)
    v2[TestEnum.NodeType.AfterAll] = p1:_getHooksOfType(p2.children, TestEnum.NodeType.AfterAll)
    v2[TestEnum.NodeType.BeforeEach] = p1:_getHooksOfType(p2.children, TestEnum.NodeType.BeforeEach)
    v2[TestEnum.NodeType.AfterEach] = p1:_getHooksOfType(p2.children, TestEnum.NodeType.AfterEach)
    table.insert(_stack, v2)
end
function u5.getBeforeAllHooks(p1) -- Line: 66 -- upvalues: TestEnum (val)
    return p1._stack[#p1._stack][TestEnum.NodeType.BeforeAll]
end
function u5.getAfterAllHooks(p1) -- Line: 73 -- upvalues: TestEnum (val)
    return p1._stack[#p1._stack][TestEnum.NodeType.AfterAll]
end
function u5._getHooksOfType(p1, p2, p3) -- Line: 77
    local v1 = {}
    for i, v in ipairs(p2) do
        if v.type == p3 then
            table.insert(v1, v.callback)
        end
    end
    return v1
end
return u5