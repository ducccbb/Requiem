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
--File: ReplicatedStorage.Packages._Index.roblox_testez@0.4.1.testez.Reporters.TextReporterQuiet
--                              Dumped in 0.000474 seconds
--                          Bytecode version 9  |  5 functions

local reportNode
local TestService = game:GetService("TestService")
local TestEnum = require(script.Parent.Parent.TestEnum)
local u15 = (" "):rep(3)
local u16 = {}
u16[TestEnum.TestStatus.Success] = "+"
u16[TestEnum.TestStatus.Failure] = "-"
u16[TestEnum.TestStatus.Skipped] = "~"
local v1 = {}
function reportNode(p1, p2, p3) -- Line: 22 -- upvalues: TestEnum (val), u16 (val), u15 (val), reportNode (val)
    local v1 = p2
    if not v1 then
        v1 = {}
    end
    local v2 = v1
    local v3 = p3 or 0
    if p1.status == TestEnum.TestStatus.Skipped then
        return v2
    end
    v1 = nil
    if p1.status ~= TestEnum.TestStatus.Success then
        local v4 = u16[p1.status] or "?"
        local v5 = u15:rep(v3)
        v1 = ("%s[%s] %s"):format(v5, v4, p1.planNode.phrase)
    end
    table.insert(v2, v1)
    for i, v in ipairs(p1.children) do
        reportNode(v, v2, v3 + 1)
    end
    return v2
end
local function reportRoot(p1) -- Line: 51 -- upvalues: reportNode (val)
    local v1 = {}
    for i, v in ipairs(p1.children) do
        reportNode(v, v1, 0)
    end
    return v1
end
local function report(p1) -- Line: 61 -- upvalues: reportRoot (val)
    local v1 = reportRoot(p1)
    return table.concat(v1, "\n")
end
function v1.report(p1) -- Line: 67 -- upvalues: reportRoot (val), TestService (val)
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