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
--           File: ReplicatedStorage.Client.User.Miscellaneous.ClientLogRunner
--                               Dumped in 0.00170 seconds
--                          Bytecode version 9  |  7 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local TestService = game:GetService("TestService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Debugger = require(Common:WaitForChild("Debugger"))
local State = v1.Parent.Parent:WaitForChild("State")
local ClientSettingsHandler = require(State:WaitForChild("ClientSettingsHandler"))
local State_2 = v1.Parent.Parent:WaitForChild("State")
local ClientStateHandler = require(State_2:WaitForChild("ClientStateHandler"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Utilities = Common_2:WaitForChild("Utilities")
local Statistics = require(Utilities:WaitForChild("Statistics"))
ClientSettingsHandler.onKeybindPressed("Dump Logs"):Connect(function() -- Line: 27 -- upvalues: Debugger (val)
    Debugger.dump.allToConsole()
    Debugger.dump.clear()
end)
local function onDumpStatistics() -- Line: 32 -- upvalues: Statistics (val), TestService (val)
    local priority, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13
    TestService:Message("Dumping statistics...")
    local v14 = string.rep(" ", (math.floor(14)))
    local v15 = (((("\n" .. "╔" .. string.rep("═", 48) .. "╗\n") .. "║" .. v14 .. "STATISTICS DUMP" .. string.rep(" ", (math.ceil(14))) .. "\n") .. "╚" .. string.rep("═", 48) .. "╝\n\n") .. "┌─ 📊 STATISTICS ────────────────────────────────────────┐\n") .. "│\n"
    local v16 = 0
    for k, v in pairs((Statistics.__getStatisticsMap())) do
        v16 = v16 + 1
        v12 = v.binding ~= nil
        v13 = false
        if v12 then
            v1 = pcall(function() -- Line: 68 -- upvalues: v (val)
                v.binding(v.value, nil, nil)
            end)
            v13 = not v1
        end
        if not v12 then
            v1 = "❌ NONE"
        elseif not v13 then
            v1 = "✅ CUSTOM"
        else
            v1 = "⚠️ DEFAULT (ERROR)"
        end
        v15 = (((((v15 .. ("│ 🔹 %*\n"):format((k:upper()))) .. "│\n") .. ("│    Current Value: %*\n"):format((tostring(v.value)))) .. ("│    Default Value: %*\n"):format((tostring(v.default)))) .. ("│    Binding: %*\n"):format(v1)) .. "│\n"
        v2 = 0
        for k2 in pairs(v.modifiers) do
            v2 = v2 + 1
        end
        if 0 >= v2 then
            v15 = v15 .. "│    Modifiers: None\n"
        else
            v15 = v15 .. "│    Modifiers:\n"
            v3 = {}
            for k3, i in pairs(v.modifiers) do
                table.insert(v3, {identifier = k3, mode = i.mode, priority = i.priority, value = i.value})
            end
            table.sort(v3, function(p1, p2) -- Line: 98
                local v1 = p2.priority < p1.priority
                return v1
            end)
            priority = -1
            for i2, j in ipairs(v3) do
                if j.mode == "set" and priority < j.priority then
                    priority = j.priority
                end
            end
            for i3, k4 in ipairs(v3) do
                v4 = k4.identifier == "default"
                v5 = false
                if k4.mode ~= "set" then
                    if priority >= k4.priority then
                        v6 = " (Inactive - Below Set Priority)"
                    else
                        v5 = true
                        v6 = " (ACTIVE - Above Set Priority)"
                    end
                elseif k4.priority ~= priority then
                    v6 = " (Inactive - Lower Priority)"
                else
                    v5 = true
                    v6 = " (ACTIVE - Highest Set)"
                end
                if not v4 then
                    v7 = "  "
                else
                    v7 = "🔷"
                end
                if not v5 then
                    v8 = "⚪"
                else
                    v8 = "✅"
                end
                if k4.mode == "set" then
                    v9 = "🎯"
                elseif k4.mode == "add" then
                    v9 = "➕"
                elseif k4.mode ~= "subtract" then
                    v9 = "✖️"
                else
                    v9 = "➖"
                end
                v10 = k4.mode:upper()
                v11 = tostring(k4.value)
                v15 = (v15 .. ("│      %* %* %* [%*]\n"):format(v7, v8, v9, k4.identifier)) .. ("│         Mode: %* | Priority: %* | Value: %*%*\n"):format(v10, k4.priority, v11, v6)
            end
        end
        v15 = (v15 .. "│\n") .. "├─────────────────────────────────────────────────────────┤\n"
    end
    if 0 < v16 then
        v15 = v15:sub(1, -179)
    end
    local v17 = string.rep(" ", (math.floor(17)))
    v15 = ((((((((v15 .. "└─────────────────────────────────────────────────────────┘\n\n") .. "┌─ 📈 SUMMARY ───────────────────────────────────────────┐\n") .. "│\n") .. ("│ Total Statistics: %*\n"):format(v16)) .. "│\n") .. "└─────────────────────────────────────────────────────────┘\n\n") .. "╔" .. string.rep("═", 48) .. "╗\n") .. "║" .. v17 .. "END OF DUMP" .. string.rep(" ", (math.ceil(17))) .. "\n") .. "╚" .. string.rep("═", 48) .. "╝\n"
    print(v15)
end
ClientSettingsHandler.onKeybindPressed("Dump Client State"):Connect(function() -- Line: 179 -- upvalues: ClientStateHandler (val), TestService (val), onDumpStatistics (val)
    local v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12
    v1, v2 = ClientStateHandler.__getStateMap()
    TestService:Message("Dumping client state...")
    local v13 = string.rep(" ", (math.floor(15)))
    local v14 = (((("\n" .. "╔" .. string.rep("═", 48) .. "╗\n") .. "║" .. v13 .. "CLIENT STATE DUMP" .. string.rep(" ", (math.ceil(15))) .. "\n") .. "╚" .. string.rep("═", 48) .. "╝\n\n") .. "┌─ 📊 INDIVIDUAL STATES ─────────────────────────────────┐\n") .. "│\n"
    local v15 = 0
    local v16 = v1
    v13 = nil
    local v17 = nil
    for i, j in v16, v13, v17 do
        v15 = v15 + 1
        if not j then
            v12 = "❌ INACTIVE"
        else
            v12 = "✅ ACTIVE"
        end
        if not j then
            v3 = "🔴"
        else
            v3 = "🟢"
        end
        if 30 >= #i then
            v4 = string.rep(" ", (math.max(0, 30 - #i)))
            v14 = v14 .. ("│ %* %*%* │ %*\n"):format(v3, i, v4, v12)
        else
            v4 = i:sub(1, 30) .. "..."
            v14 = v14 .. ("│ %* %* │ %*\n"):format(v3, v4, v12)
        end
    end
    v14 = (((v14 .. "│\n") .. "└─────────────────────────────────────────────────────────┘\n\n") .. "┌─ 🗂️  STATE CATEGORIES ───────────────────────────────────┐\n") .. "│\n"
    local function wrapText(p1, p2, p3) -- Line: 224
        local v1, v2, v3
        local v4 = {}
        local v5 = p3 or ""
        local v6 = {}
        for i in p1:gmatch("[^,]+") do
            v3 = i:match("^%s*(.-)%s*$")
            if v3 ~= "" then
                table.insert(v6, v3)
            end
        end
        for i2, v in ipairs(v6) do
            if i2 ~= 1 then
                v1 = ", "
            else
                v1 = ""
            end
            v2 = v5 .. v1 .. v
            if v7 >= #v2 then
                v5 = v2
            else
                table.insert(v4, v5)
                v5 = v8 .. v
            end
        end
        if v5 ~= "" then
            table.insert(v4, v5)
        end
        return v4
    end
    for k, v in pairs(v2) do
        v3 = false
        v4 = {}
        v5 = {}
        v6 = v
        v7 = nil
        v8 = nil
        for k2, n in v6, v7, v8 do
            v10, v11 = ClientStateHandler.isStateBusy(n)
            if not v10 then
                table.insert(v5, v11)
            else
                table.insert(v4, v11)
                v3 = true
            end
        end
        if not v3 then
            v6 = "❄️"
        else
            v6 = "🔥"
        end
        if not v3 then
            v7 = "IDLE"
        else
            v7 = "BUSY"
        end
        v14 = (v14 .. ("│ %* %*\n"):format(v6, (k:upper()))) .. ("│    Status: %*\n"):format(v7)
        if 0 < #v4 then
            v8 = table.concat(v4, ", ")
            v9 = wrapText(v8, 45, "│    🟢 Active: ")
            for i2, m in ipairs(v9) do
                v14 = v14 .. m .. "\n"
            end
        end
        if 0 < #v5 then
            v8 = table.concat(v5, ", ")
            v9 = wrapText(v8, 45, "│    🔴 Inactive: ")
            for i3, i5 in ipairs(v9) do
                v14 = v14 .. i5 .. "\n"
            end
        end
        v14 = (v14 .. "│\n") .. "├─────────────────────────────────────────────────────────┤\n"
    end
    local v18 = string.rep(" ", (math.floor(17)))
    v14 = (((v14:sub(1, -179) .. "└─────────────────────────────────────────────────────────┘\n\n") .. "╔" .. string.rep("═", 48) .. "╗\n") .. "║" .. v18 .. "END OF DUMP" .. string.rep(" ", (math.ceil(17))) .. "\n") .. "╚" .. string.rep("═", 48) .. "╝\n"
    print(v14)
    onDumpStatistics()
end)
return {}