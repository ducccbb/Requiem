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
--    File: ReplicatedStorage.Packages._Index.roblox_testez@0.4.1.testez.TestSession
--                               Dumped in 0.00111 seconds
--                          Bytecode version 9  |  17 functions

local TestEnum = require(script.Parent.TestEnum)
local TestResults = require(script.Parent.TestResults)
local Context = require(script.Parent.Context)
local ExpectationContext = require(script.Parent.ExpectationContext)
local u20 = {}
u20.__index = u20
function u20.new(p1) -- Line: 24 -- upvalues: TestResults (val), u20 (val)
    local v1 = {
        hasFocusNodes = false,
        results = TestResults.new(p1),
        nodeStack = {},
        contextStack = {},
        expectationContextStack = {},
    }
    setmetatable(v1, u20)
    return v1
end
function u20:calculateTotals() -- Line: 42 -- upvalues: TestEnum (val)
    local results = self.results
    results.successCount = 0
    results.failureCount = 0
    results.skippedCount = 0
    results:visitAllNodes(function(p1) -- Line: 49 -- upvalues: TestEnum (upval), results (val)
        local status = p1.status
        if p1.planNode.type ~= TestEnum.NodeType.It then
            return
        end
        if status == TestEnum.TestStatus.Success then
            results.successCount = results.successCount + 1
            return
        end
        if status == TestEnum.TestStatus.Failure then
            results.failureCount = results.failureCount + 1
            return
        end
        if status == TestEnum.TestStatus.Skipped then
            results.skippedCount = results.skippedCount + 1
        end
    end)
end
function u20:gatherErrors() -- Line: 69
    local results = self.results
    results.errors = {}
    results:visitAllNodes(function(p1) -- Line: 74 -- upvalues: results (val)
        local v1 = #p1.errors
        if 0 < v1 then
            for i, v in ipairs(p1.errors) do
                table.insert(results.errors, v)
            end
        end
    end)
end
function u20.finalize(p1) -- Line: 86
    if #p1.nodeStack ~= 0 then
        error("Cannot finalize TestResults with nodes still on the stack!", 2)
    end
    p1:calculateTotals()
    p1:gatherErrors()
    return p1.results
end
function u20:pushNode(p2) -- Line: 100 -- upvalues: TestResults (val), Context (val), ExpectationContext (val)
    local v1 = TestResults.createNode(p2)
    local results = self.nodeStack[#self.nodeStack]
    if not results then
        results = self.results
    end
    table.insert(results.children, v1)
    table.insert(self.nodeStack, v1)
    local v2 = self.contextStack[#self.contextStack]
    table.insert(self.contextStack, (Context.new(v2)))
    local v3 = self.expectationContextStack[#self.expectationContextStack]
    table.insert(self.expectationContextStack, (ExpectationContext.new(v3)))
end
function u20:popNode() -- Line: 118
    local v1 = #self.nodeStack
    local v2 = 0 < v1
    assert(v2, "Tried to pop from an empty node stack!")
    table.remove(self.nodeStack, #self.nodeStack)
    table.remove(self.contextStack, #self.contextStack)
    table.remove(self.expectationContextStack, #self.expectationContextStack)
end
function u20.getContext(p1) -- Line: 128
    local v1 = #p1.contextStack
    local v2 = 0 < v1
    assert(v2, "Tried to get context from an empty stack!")
    return p1.contextStack[#p1.contextStack]
end
function u20.getExpectationContext(p1) -- Line: 134
    local v1 = #p1.expectationContextStack
    local v2 = 0 < v1
    assert(v2, "Tried to get expectationContext from an empty stack!")
    return p1.expectationContextStack[#p1.expectationContextStack]
end
function u20.shouldSkip(p1) -- Line: 142 -- upvalues: TestEnum (val)
    local v1, v2, v3
    if not p1.hasFocusNodes then
        v1 = 1
        v2 = -1
        for i = #p1.nodeStack, v1, v2 do
            if p1.nodeStack[i].planNode.modifier == TestEnum.NodeModifier.Skip then
                return true
            end
        end
        return false
    end
    v1 = 1
    v2 = -1
    for j = #p1.nodeStack, v1, v2 do
        v3 = p1.nodeStack[j]
        if v3.planNode.modifier == TestEnum.NodeModifier.Skip then
            return true
        end
        if v3.planNode.modifier == TestEnum.NodeModifier.Focus then
            return false
        end
    end
    return true
end
function u20.setSuccess(p1) -- Line: 176 -- upvalues: TestEnum (val)
    local v1 = #p1.nodeStack
    local v2 = 0 < v1
    assert(v2, "Attempting to set success status on empty stack")
    local v3 = p1.nodeStack[#p1.nodeStack]
    v3.status = TestEnum.TestStatus.Success
end
function u20.setSkipped(p1) -- Line: 184 -- upvalues: TestEnum (val)
    local v1 = #p1.nodeStack
    local v2 = 0 < v1
    assert(v2, "Attempting to set skipped status on empty stack")
    local v3 = p1.nodeStack[#p1.nodeStack]
    v3.status = TestEnum.TestStatus.Skipped
end
function u20:setError(p2) -- Line: 193 -- upvalues: TestEnum (val)
    local v1 = #self.nodeStack
    local v2 = 0 < v1
    assert(v2, "Attempting to set error status on empty stack")
    local v3 = self.nodeStack[#self.nodeStack]
    v3.status = TestEnum.TestStatus.Failure
    table.insert(v3.errors, p2)
end
function u20.addDummyError(p1, p2, p3) -- Line: 205 -- upvalues: TestEnum (val)
    p1:pushNode({type = TestEnum.NodeType.It, phrase = p2})
    p1:setError(p3)
    p1:popNode()
    local v1 = p1.nodeStack[#p1.nodeStack]
    v1.status = TestEnum.TestStatus.Failure
end
function u20.setStatusFromChildren(p1) -- Line: 217 -- upvalues: TestEnum (val)
    local v1 = #p1.nodeStack
    local v2 = 0 < v1
    assert(v2, "Attempting to set status from children on empty stack")
    local v3 = p1.nodeStack[#p1.nodeStack]
    local Success = TestEnum.TestStatus.Success
    v1 = true
    for i, v in ipairs(v3.children) do
        if v.status ~= TestEnum.TestStatus.Skipped then
            v1 = false
            if v.status == TestEnum.TestStatus.Failure then
                Success = TestEnum.TestStatus.Failure
            end
        end
    end
    if v1 then
        Success = TestEnum.TestStatus.Skipped
    end
    v3.status = Success
end
return u20