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
--      File: ReplicatedStorage.Packages._Index.roblox_testez@0.4.1.testez.TestPlan
--                               Dumped in 0.00147 seconds
--                          Bytecode version 9  |  31 functions

local TestEnum = require(script.Parent.TestEnum)
local Expectation = require(script.Parent.Expectation)
local function newEnvironment(p1, p2) -- Line: 11 -- upvalues: TestEnum (val), Expectation (val)
    local v1
    local v2 = {}
    if p2 then
        if type(p2) ~= "table" then
            v1 = ("Bad argument #2 to newEnvironment. Expected table, got %s"):format((typeof(p2)))
            error(v1, 2)
        end
        for k, v in pairs(p2) do
            v2[k] = v
        end
    end
    local function addChild(a1, p2, p3, p4) -- Line: 25 -- upvalues: p1 (val), TestEnum (upval)
        local v1 = p1:addChild(a1, p3, p4)
        v1.callback = p2
        if p3 == TestEnum.NodeType.Describe then
            v1:expand()
        end
        return v1
    end
    function v2.describeFOCUS(p1, p2) -- Line: 34 -- upvalues: addChild (val), TestEnum (upval)
        addChild(p1, p2, TestEnum.NodeType.Describe, TestEnum.NodeModifier.Focus)
    end
    function v2.describeSKIP(p1, p2) -- Line: 38 -- upvalues: addChild (val), TestEnum (upval)
        addChild(p1, p2, TestEnum.NodeType.Describe, TestEnum.NodeModifier.Skip)
    end
    function v2.describe(p1, p2, p3) -- Line: 42 -- upvalues: addChild (val), TestEnum (upval)
        addChild(p1, p2, TestEnum.NodeType.Describe, TestEnum.NodeModifier.None)
    end
    function v2.itFOCUS(p1, p2) -- Line: 46 -- upvalues: addChild (val), TestEnum (upval)
        addChild(p1, p2, TestEnum.NodeType.It, TestEnum.NodeModifier.Focus)
    end
    function v2.itSKIP(p1, p2) -- Line: 50 -- upvalues: addChild (val), TestEnum (upval)
        addChild(p1, p2, TestEnum.NodeType.It, TestEnum.NodeModifier.Skip)
    end
    function v2.itFIXME(p1, p2) -- Line: 54 -- upvalues: addChild (val), TestEnum (upval)
        local v1 = addChild(p1, p2, TestEnum.NodeType.It, TestEnum.NodeModifier.Skip)
        warn("FIXME: broken test", v1:getFullName())
    end
    function v2.it(p1, p2, p3) -- Line: 59 -- upvalues: addChild (val), TestEnum (upval)
        addChild(p1, p2, TestEnum.NodeType.It, TestEnum.NodeModifier.None)
    end
    local u43 = 0
    local v3 = {}
    v3[TestEnum.NodeType.BeforeAll] = "beforeAll"
    v3[TestEnum.NodeType.AfterAll] = "afterAll"
    v3[TestEnum.NodeType.BeforeEach] = "beforeEach"
    v3[TestEnum.NodeType.AfterEach] = "afterEach"
    for k2, i in pairs(v3) do
        v2[i] = function(p1) -- Line: 74 -- upvalues: addChild (val), i (val), u43 (ref), k2 (val), TestEnum (upval)
            local v1 = i .. "_" .. tostring(u43)
            addChild(v1, p1, k2, TestEnum.NodeModifier.None)
            u43 = u43 + 1
        end
    end
    function v2.FIXME(a1) -- Line: 80 -- upvalues: p1 (val), TestEnum (upval)
        local v1 = p1:getFullName()
        warn("FIXME: broken test", v1, a1 or "")
        p1.modifier = TestEnum.NodeModifier.Skip
    end
    function v2.FOCUS() -- Line: 86 -- upvalues: p1 (val), TestEnum (upval)
        p1.modifier = TestEnum.NodeModifier.Focus
    end
    function v2.SKIP() -- Line: 90 -- upvalues: p1 (val), TestEnum (upval)
        p1.modifier = TestEnum.NodeModifier.Skip
    end
    function v2.HACK_NO_XPCALL() -- Line: 98
        warn("HACK_NO_XPCALL is deprecated. It is now safe to yield in an xpcall, so this is no longer necessary. It can be safely deleted.")
    end
    v2.fit = v2.itFOCUS
    v2.xit = v2.itSKIP
    v2.fdescribe = v2.describeFOCUS
    v2.xdescribe = v2.describeSKIP
    v2.expect = setmetatable({
        extend = function(...) -- Line: 109
            error("Cannot call \"expect.extend\" from within a \"describe\" node.")
        end,
    }, {
        __call = function(p1, ...) -- Line: 113 -- upvalues: Expectation (upval)
            return Expectation.new(...)
        end,
    })
    return v2
end
local u11 = {}
u11.__index = u11
function u11.new(p1, p2, p3, p4) -- Line: 129 -- upvalues: TestEnum (val), newEnvironment (val), u11 (val)
    local None = p4
    if not None then
        None = TestEnum.NodeModifier.None
    end
    local v1 = {
        plan = p1,
        phrase = p2,
        type = p3,
        modifier = None,
        children = {},
    }
    v1.environment = newEnvironment(v1, p1.extraEnvironment)
    return (setmetatable(v1, u11))
end
local function getModifier(p1, p2, p3) -- Line: 146 -- upvalues: TestEnum (val)
    if not p2 then
        return p3
    end
    if p3 == nil then
        if p1:match(p2) then
            return TestEnum.NodeModifier.Focus
        end
        return TestEnum.NodeModifier.Skip
    end
    if p3 ~= TestEnum.NodeModifier.None then
        return p3
    end
    if p1:match(p2) then
        return TestEnum.NodeModifier.Focus
    end
    return TestEnum.NodeModifier.Skip
end
function u11:addChild(p2, p3, p4) -- Line: 157 -- upvalues: TestEnum (val), getModifier (val), u11 (val)
    if p3 == TestEnum.NodeType.It then
        for k, v in pairs(self.children) do
            if v.phrase == p2 then
                error("Duplicate it block found: " .. v:getFullName())
            end
        end
    end
    local v1 = self:getFullName() .. " " .. p2
    local v2 = getModifier(v1, self.plan.testNamePattern, p4)
    local v3 = u11.new(self.plan, p2, p3, v2)
    v3.parent = self
    table.insert(self.children, v3)
    return v3
end
function u11:getFullName() -- Line: 177
    if not self.parent then
        return self.phrase
    end
    local v1 = self.parent:getFullName()
    if v1 then
        return v1 .. " " .. self.phrase
    end
    return self.phrase
end
function u11:expand() -- Line: 191
    local v1, v2
    local v3 = getfenv(self.callback)
    local v4 = setmetatable({}, {__index = v3})
    for k, v in pairs(self.environment) do
        v4[k] = v
    end
    v4.script = v3.script
    setfenv(self.callback, v4)
    v1, v2 = xpcall(self.callback, function(p1) -- Line: 202
        local v1 = tostring(p1)
        return debug.traceback(v1, 2)
    end)
    if not v1 then
        self.loadError = v2
    end
end
local u17 = {}
u17.__index = u17
function u17.new(p1, p2) -- Line: 217 -- upvalues: u17 (val)
    local v1 = {children = {}, testNamePattern = p1, extraEnvironment = p2}
    return (setmetatable(v1, u17))
end
function u17:addChild(p2, p3, p4) -- Line: 230 -- upvalues: getModifier (val), u11 (val)
    local v1 = getModifier(p2, self.testNamePattern, p4)
    local v2 = u11.new(self, p2, p3, v1)
    table.insert(self.children, v2)
    return v2
end
function u17.addRoot(p1, p2, p3) -- Line: 241 -- upvalues: TestEnum (val)
    local v1, v2
    local v3 = p1
    local v4 = 1
    local v5 = -1
    for i = #p2, v4, v5 do
        v2 = nil
        for i2, v in ipairs(v3.children) do
            if v.phrase == v6[i] then
                v2 = v
                break
            end
        end
        if v2 == nil then
            v2 = v3:addChild(v6[i], TestEnum.NodeType.Describe)
        end
        v3 = v2
    end
    v3.callback = v1
    v3:expand()
end
function u17:visitAllNodes(p2, p3, p4) -- Line: 267
    local v1 = p4 or 0
    for i, v in ipairs((p3 or self).children) do
        p2(v, v1)
        self:visitAllNodes(p2, v, v1 + 1)
    end
end
function u17.visualize(p1) -- Line: 282
    local u1 = {}
    p1:visitAllNodes(function(p1, p2) -- Line: 284 -- upvalues: u1 (val)
        table.insert(u1, (" "):rep(3 * p2) .. p1.phrase)
    end)
    return table.concat(u1, "\n")
end
function u17.findNodes(p1, p2) -- Line: 294
    local u2 = {}
    p1:visitAllNodes(function(p1) -- Line: 296 -- upvalues: p2 (val), u2 (val)
        if p2(p1) then
            table.insert(u2, p1)
        end
    end)
    return u2
end
return u17