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
--     File: ReplicatedStorage.Packages._Index.roblox_testez@0.4.1.testez.TestRunner
--                              Dumped in 0.000880 seconds
--                          Bytecode version 9  |  12 functions

local TestEnum = require(script.Parent.TestEnum)
local TestSession = require(script.Parent.TestSession)
local LifecycleHooks = require(script.Parent.LifecycleHooks)
local u15 = {}
local v1 = {}
u15.environment = v1
local function wrapExpectContextWithPublicApi(p1) -- Line: 19
    local v1 = {
        extend = function(...) -- Line: 21 -- upvalues: p1 (val)
            p1:extend(...)
        end,
    }
    local v2 = {
        __call = function(a1, ...) -- Line: 25 -- upvalues: p1 (val)
            return p1:startExpectationChain(...)
        end,
    }
    return (setmetatable(v1, v2))
end
function u15.runPlan(p1) -- Line: 35 -- upvalues: TestSession (val), LifecycleHooks (val), TestEnum (val), u15 (val)
    local v1 = TestSession.new(p1)
    local v2 = LifecycleHooks.new()
    local v3 = 0 < #p1:findNodes(function(p1) -- Line: 39 -- upvalues: TestEnum (upval)
    local v1
    if p1.modifier == TestEnum.NodeModifier.Focus then
        v1 = true
    else
        v1 = false
    end
    return v1
end)
    v1.hasFocusNodes = v3
    u15.runPlanNode(v1, p1, v2)
    return v1:finalize()
end
function u15.runPlanNode(p1, p2, p3) -- Line: 54 -- upvalues: u15 (val), wrapExpectContextWithPublicApi (val), TestEnum (val)
    local u102, u95, v1, v2
    local function runCallback(a1, p2) -- Line: 55 -- upvalues: u15 (upval), wrapExpectContextWithPublicApi (upval), p1 (val)
        local v1, v2
        local u44 = true
        local u45 = nil
        _G.__TESTEZ_RUNNING_TEST__ = true
        local u6 = p2 or ""
        local v3 = getfenv(a1)
        for k, v in pairs(u15.environment) do
            v3[k] = v
        end
        function v3.fail(p1) -- Line: 71 -- upvalues: u44 (ref), u45 (ref), u6 (ref)
            local v1
            if p1 ~= nil then
                v1 = p1
            else
                v1 = "fail() was called."
            end
            u44 = false
            local v2 = tostring(v1)
            u45 = u6 .. debug.traceback(v2, 2)
        end
        v3.expect = wrapExpectContextWithPublicApi(p1:getExpectationContext())
        local u37 = p1:getContext()
        v1, v2 = xpcall(function() -- Line: 85 -- upvalues: a1 (val), u37 (val)
            a1(u37)
        end, function(p1) -- Line: 88 -- upvalues: u6 (ref)
            local v1 = tostring(p1)
            return u6 .. debug.traceback(v1, 2)
        end)
        if not v1 then
            u44 = false
            u45 = v2
        end
        _G.__TESTEZ_RUNNING_TEST__ = nil
        return u44, u45
    end
    local function runNode(p1) -- Line: 105 -- upvalues: p3 (val), runCallback (val)
        local v1, v2, v3, v4, v5, v6
        for i, v in ipairs(p3:getBeforeEachHooks()) do
            v3, v4 = runCallback(v, "beforeEach hook: ")
            if not v3 then
                return false, v4
            end
        end
        v1, v2 = runCallback(p1.callback)
        for i2, i3 in ipairs(p3:getAfterEachHooks()) do
            v5, v6 = runCallback(i3, "afterEach hook: ")
            if not v5 then
                if not v1 then
                    return false, v2 .. "\nWhile cleaning up the failed test another error was found:\n" .. v6
                end
                return false, v6
            end
        end
        if not v1 then
            return false, v2
        end
        return true, nil
    end
    p3:pushHooksFrom(p2)
    local v3 = false
    for i, v in ipairs(p3:getBeforeAllHooks()) do
        v1, v2 = runCallback(v, "beforeAll hook: ")
        if not v1 then
            p1:addDummyError("beforeAll", v2)
            v3 = true
        end
    end
    if v3 then
        u102 = p3
    else
        u95, u102 = p1, p3
        for i2, i3 in ipairs(p2.children) do
            if i3.type == TestEnum.NodeType.It then
                u95:pushNode(i3)
                if not (u95:shouldSkip()) then
                    v1, v2 = runNode(i3)
                    if not v1 then
                        u95:setError(v2)
                    else
                        u95:setSuccess()
                    end
                else
                    u95:setSkipped()
                end
                u95:popNode()
            elseif i3.type == TestEnum.NodeType.Describe then
                u95:pushNode(i3)
                u15.runPlanNode(u95, i3, u102)
                if not i3.loadError then
                    u95:setStatusFromChildren()
                else
                    u95:setError("Error during planning: " .. i3.loadError)
                end
                u95:popNode()
            end
        end
    end
    for i4, j in ipairs(u102:getAfterAllHooks()) do
        v1, v2 = runCallback(j, "afterAll hook: ")
        if not v1 then
            u95:addDummyError("afterAll", v2)
        end
    end
    u102:popHooks()
end
return u15