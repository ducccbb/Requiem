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
--    File: ReplicatedStorage.Packages._Index.roblox_testez@0.4.1.testez.TestResults
--                              Dumped in 0.000448 seconds
--                          Bytecode version 9  |  5 functions

local TestEnum = require(script.Parent.TestEnum)
local u5 = {}
u5[TestEnum.TestStatus.Success] = "+"
u5[TestEnum.TestStatus.Failure] = "-"
u5[TestEnum.TestStatus.Skipped] = "~"
local u15 = {}
u15.__index = u15
function u15.new(p1) -- Line: 25 -- upvalues: u15 (val)
    local v1 = {
        successCount = 0,
        failureCount = 0,
        skippedCount = 0,
        planNode = p1,
        children = {},
        errors = {},
    }
    setmetatable(v1, u15)
    return v1
end
function u15.createNode(p1) -- Line: 43
    return {planNode = p1, children = {}, errors = {}}
end
function u15:visitAllNodes(p2, p3) -- Line: 57
    for i, v in ipairs((p3 or self).children) do
        p2(v)
        self:visitAllNodes(p2, v)
    end
end
function u15:visualize(p2, p3) -- Line: 70 -- upvalues: TestEnum (val), u5 (val)
    local v1, v2, v3, v4, v5
    local v6 = p3 or 0
    local v7 = {}
    for i, v in ipairs((p2 or self).children) do
        if v.planNode.type ~= TestEnum.NodeType.It then
            v2 = (" "):rep(3 * v6)
            v5 = ("%s%s"):format(v2, v.planNode.phrase or "")
            if v.status then
                v5 = v5 .. (" (%s)"):format(v.status)
            end
            table.insert(v7, v5)
            v1 = #v.children
            if 0 < v1 then
                v1 = v8:visualize(v, v6 + 1)
                table.insert(v7, v1)
            end
        else
            v5 = u5[v.status] or "?"
            v3 = (" "):rep(3 * v6)
            v1 = ("%s[%s] %s"):format(v3, v5, v.planNode.phrase)
            if v.messages then
                v2 = #v.messages
                if 0 < v2 then
                    v4 = (" "):rep(3 * v6)
                    v1 = v1 .. "\n " .. v4 .. table.concat(v.messages, "\n " .. (" "):rep(3 * v6))
                end
            end
            table.insert(v7, v1)
        end
    end
    return table.concat(v7, "\n")
end
return u15