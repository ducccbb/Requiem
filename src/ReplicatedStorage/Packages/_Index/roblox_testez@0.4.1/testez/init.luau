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
--          File: ReplicatedStorage.Packages._Index.roblox_testez@0.4.1.testez
--                              Dumped in 0.000212 seconds
--                          Bytecode version 9  |  2 functions

local Expectation = require(script.Expectation)
local TestBootstrap = require(script.TestBootstrap)
local TestEnum = require(script.TestEnum)
local TestPlan = require(script.TestPlan)
local TestPlanner = require(script.TestPlanner)
local TestResults = require(script.TestResults)
local TestRunner = require(script.TestRunner)
local TestSession = require(script.TestSession)
local TextReporter = require(script.Reporters.TextReporter)
local TextReporterQuiet = require(script.Reporters.TextReporterQuiet)
local TeamCityReporter = require(script.Reporters.TeamCityReporter)
return {
    run = function(p1, p2) -- Line: 13 -- upvalues: TestBootstrap (val), TestPlanner (val), TestRunner (val)
        local v1 = TestBootstrap:getModules(p1)
        local v2 = TestPlanner.createPlan(v1)
        local v3 = TestRunner.runPlan(v2)
        p2(v3)
    end,
    Expectation = Expectation,
    TestBootstrap = TestBootstrap,
    TestEnum = TestEnum,
    TestPlan = TestPlan,
    TestPlanner = TestPlanner,
    TestResults = TestResults,
    TestRunner = TestRunner,
    TestSession = TestSession,
    Reporters = {TextReporter = TextReporter, TextReporterQuiet = TextReporterQuiet, TeamCityReporter = TeamCityReporter},
}