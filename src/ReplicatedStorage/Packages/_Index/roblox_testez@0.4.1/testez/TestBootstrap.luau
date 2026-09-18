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
--   File: ReplicatedStorage.Packages._Index.roblox_testez@0.4.1.testez.TestBootstrap
--                              Dumped in 0.000827 seconds
--                          Bytecode version 9  |  8 functions

local TestPlanner = require(script.Parent.TestPlanner)
local TestRunner = require(script.Parent.TestRunner)
local TextReporter = require(script.Parent.Reporters.TextReporter)
local v1 = {}
local function stripSpecSuffix(p1) -- Line: 11
    return (p1:gsub("%.spec$", ""))
end
local function isSpecScript(p1) -- Line: 14
    local v1 = p1:IsA("ModuleScript")
    if v1 then
        v1 = p1.Name:match("%.spec$")
    end
    return v1
end
local function getPath(p1, p2) -- Line: 18
    local v1 = p2
    if not v1 then
        v1 = game
    end
    local v2 = v1
    v1 = {}
    local Parent = p1
    if Parent.Name == "init.spec" then
        Parent = Parent.Parent
    end
    while Parent ~= nil do
        if Parent == v2 then
            break
        end
        table.insert(v1, (Parent.Name:gsub("%.spec$", "")))
        Parent = Parent.Parent
    end
    table.insert(v1, (v2.Name:gsub("%.spec$", "")))
    return v1
end
local function toStringPath(p1) -- Line: 38
    local v1 = ""
    local v2 = true
    for i, v in ipairs(p1) do
        if not v2 then
            v1 = v .. " " .. v1
        else
            v1 = v
            v2 = false
        end
    end
    return v1
end
function v1.getModulesImpl(p1, p2, p3, p4) -- Line: 52 -- upvalues: getPath (val)
    local v1 = p3
    if not v1 then
        v1 = {}
    end
    local v2 = p4 or p2
    local v3 = v2
    v1 = v3:IsA("ModuleScript")
    if v1 then
        v1 = v3.Name:match("%.spec$")
    end
    if v1 then
        v1 = require(v2)
        v3 = getPath(v2, p2)
        local v4 = ""
        local v5 = true
        for i, v in ipairs(v3) do
            if not v5 then
                v4 = v .. " " .. v4
            else
                v4 = v
                v5 = false
            end
        end
        table.insert(v1, {method = v1, path = v3, pathStringForSorting = v4:lower()})
    end
end
function v1:getModules(p2) -- Line: 72
    local v1 = {}
    self:getModulesImpl(p2, v1)
    for i, v in ipairs(p2:GetDescendants()) do
        self:getModulesImpl(p2, v1, v)
    end
    return v1
end
function v1.run(p1, p2, p3, p4) -- Line: 99 -- upvalues: TextReporter (val), TestPlanner (val), TestRunner (val)
    local v1, v2
    local v3 = p3
    if not v3 then
        v3 = TextReporter
    end
    local v4 = v3
    v3 = p4
    if not v3 then
        v3 = {}
    end
    local v5 = v3
    v3 = v5.showTimingInfo or false
    local testNamePattern = v5.testNamePattern
    local extraEnvironment = v5.extraEnvironment
    if not extraEnvironment then
        extraEnvironment = {}
    end
    if type(p2) ~= "table" then
        v2 = ("Bad argument #1 to TestBootstrap:run. Expected table, got %s"):format((typeof(p2)))
        error(v2, 2)
    end
    local v6 = tick()
    v2 = {}
    local v7 = p1
    for i, v in ipairs(p2) do
        v1 = v7:getModules(v)
        for i2, i3 in ipairs(v1) do
            table.insert(v2, i3)
        end
    end
    local v8 = tick()
    local v9 = TestPlanner.createPlan(v2, testNamePattern, extraEnvironment)
    local v10 = tick()
    local v11 = TestRunner.runPlan(v9)
    local v12 = tick()
    v4.report(v11)
    if v3 then
        local v13 = {}
        local v14 = ("Took %f seconds to locate test modules"):format(v8 - v6)
        local v15 = ("Took %f seconds to create test plan"):format(v10 - v8)
        local v16 = ("Took %f seconds to run tests"):format(v12 - v10)
        v13[1] = v14
        v13[2] = v15
        v13[3] = v16
        v13[4] = ("Took %f seconds to report tests"):format(tick() - v12)
        print(table.concat(v13, "\n"))
    end
    return v11
end
return v1