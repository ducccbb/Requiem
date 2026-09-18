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
--File: ReplicatedStorage.Packages._Index.roblox_testez@0.4.1.testez.Reporters.TeamCityReporter
--                              Dumped in 0.000727 seconds
--                          Bytecode version 9  |  11 functions

local reportNode
local TestService = game:GetService("TestService")
local TestEnum = require(script.Parent.Parent.TestEnum)
local v1 = {}
local function teamCityEscape(p1) -- Line: 7
    local v1 = string.gsub(p1, "([]|'[])", "|%1")
    v1 = string.gsub(v1, "\r", "|r")
    return (string.gsub(v1, "\n", "|n"))
end
local function teamCityEnterSuite(p1) -- Line: 14
    local v1 = string.gsub(p1, "([]|'[])", "|%1")
    v1 = string.gsub(v1, "\r", "|r")
    return string.format("##teamcity[testSuiteStarted name='%s']", (string.gsub(v1, "\n", "|n")))
end
local function teamCityLeaveSuite(p1) -- Line: 18
    local v1 = string.gsub(p1, "([]|'[])", "|%1")
    v1 = string.gsub(v1, "\r", "|r")
    return string.format("##teamcity[testSuiteFinished name='%s']", (string.gsub(v1, "\n", "|n")))
end
local function teamCityEnterCase(p1) -- Line: 22
    local v1 = string.gsub(p1, "([]|'[])", "|%1")
    v1 = string.gsub(v1, "\r", "|r")
    return string.format("##teamcity[testStarted name='%s']", (string.gsub(v1, "\n", "|n")))
end
local function teamCityLeaveCase(p1) -- Line: 26
    local v1 = string.gsub(p1, "([]|'[])", "|%1")
    v1 = string.gsub(v1, "\r", "|r")
    return string.format("##teamcity[testFinished name='%s']", (string.gsub(v1, "\n", "|n")))
end
local function teamCityFailCase(p1, p2) -- Line: 30
    local v1 = string.gsub(p1, "([]|'[])", "|%1")
    v1 = string.gsub(v1, "\r", "|r")
    local v2 = string.gsub(v1, "\n", "|n")
    local v3 = string.gsub(p2, "([]|'[])", "|%1")
    v3 = string.gsub(v3, "\r", "|r")
    return string.format("##teamcity[testFailed name='%s' message='%s']", v2, (string.gsub(v3, "\n", "|n")))
end
function reportNode(p1, p2, p3) -- Line: 35 -- upvalues: TestEnum (val), teamCityEnterSuite (val), reportNode (val), teamCityLeaveSuite (val), teamCityEnterCase (val), teamCityFailCase (val), teamCityLeaveCase (val)
    local v1 = p2
    if not v1 then
        v1 = {}
    end
    local v2 = v1
    if p1.status == TestEnum.TestStatus.Skipped then
        return v2
    end
    if p1.planNode.type == TestEnum.NodeType.Describe then
        table.insert(v2, teamCityEnterSuite(p1.planNode.phrase))
        for i, v in ipairs(p1.children) do
            reportNode(v, v2, (p3 or 0) + 1)
        end
        table.insert(v2, teamCityLeaveSuite(p1.planNode.phrase))
        return
    end
    table.insert(v2, teamCityEnterCase(p1.planNode.phrase))
    if p1.status == TestEnum.TestStatus.Failure then
        table.insert(v2, teamCityFailCase(p1.planNode.phrase, table.concat(p1.errors, "\n")))
    end
    table.insert(v2, teamCityLeaveCase(p1.planNode.phrase))
end
local function reportRoot(p1) -- Line: 56 -- upvalues: reportNode (val)
    local v1 = {}
    for i, v in ipairs(p1.children) do
        reportNode(v, v1, 0)
    end
    return v1
end
local function report(p1) -- Line: 66 -- upvalues: reportRoot (val)
    local v1 = reportRoot(p1)
    return table.concat(v1, "\n")
end
function v1.report(p1) -- Line: 72 -- upvalues: reportRoot (val), TestService (val)
    local v1 = {}
    local v2 = reportRoot(p1)
    local v3 = table.concat(v2, "\n")
    v1[1] = "Test results:"
    v1[2] = v3
    v1[3] = ("%d passed, %d failed, %d skipped"):format(p1.successCount, p1.failureCount, p1.skippedCount)
    print(table.concat(v1, "\n"))
    if 0 < p1.failureCount then
        print(("%d test nodes reported failures."):format(p1.failureCount))
    end
    local v4 = #p1.errors
    if 0 < v4 then
        print("Errors reported by tests:")
        print("")
        for i, v in ipairs(p1.errors) do
            TestService:Error(v)
            print("")
        end
    end
end
return v1