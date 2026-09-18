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
--    File: ReplicatedStorage.Assets.Objects.Building Tools.Libraries.SupportLibrary
--                               Dumped in 0.00278 seconds
--                          Bytecode version 9  |  55 functions

local v1
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
v2 = {}
SupportLibrary = v2
function SupportLibrary.FindTableOccurrences(p1, p2) -- Line: 10
    local v1 = {}
    for k, v in pairs(p1) do
        if v == p2 then
            table.insert(v1, k)
        end
    end
    return v1
end
function SupportLibrary.FindTableOccurrence(p1, p2) -- Line: 25
    for k, v in pairs(p1) do
        if v == p2 then
            return k
        end
    end
    return nil
end
function SupportLibrary.IsInTable(p1, p2) -- Line: 40
    for k, v in pairs(p1) do
        if v == p2 then
            return true
        end
    end
    return false
end
function SupportLibrary.DoTablesMatch(p1, p2) -- Line: 54
    for k in pairs(p1) do
        if p1[k] ~= p2[k] then
            return false
        end
    end
    for k2 in pairs(p2) do
        if p2[k2] ~= p1[k2] then
            return false
        end
    end
    return true
end
function SupportLibrary.Round(p1, p2) -- Line: 75
    if type(p1) ~= "number" then
        return
    end
    local v1 = 10 ^ (p2 or 0)
    return math.floor(p1 * v1 + 0.5) / v1
end
function SupportLibrary.CloneTable(p1) -- Line: 91
    local v1 = {}
    for k, v in pairs(p1) do
        v1[k] = v
    end
    return v1
end
function SupportLibrary.Merge(p1, ...) -- Line: 105
    local v1 = {...}
    local v2 = p1
    for i, v in ipairs(v1) do
        for k, i2 in pairs(v) do
            v2[k] = i2
        end
    end
    return v2
end
local u29 = newproxy(true)
SupportLibrary.Blank = u29
v1 = getmetatable(u29)
function v1.__tostring() -- Line: 124
    return "Symbol(Blank)"
end
function SupportLibrary.MergeWithBlanks(p1, ...) -- Line: 128 -- upvalues: u29 (val)
    local v1 = {...}
    local v2 = p1
    for i, v in ipairs(v1) do
        for k, i2 in pairs(v) do
            if i2 ~= u29 then
                v2[k] = i2
            else
                v2[k] = nil
            end
        end
    end
    return v2
end
function SupportLibrary.GetAllDescendants(p1) -- Line: 148
    local v1 = {}
    for k, v in pairs(p1:GetChildren()) do
        table.insert(v1, v)
        for k2, i in pairs(SupportLibrary.GetAllDescendants(v)) do
            table.insert(v1, i)
        end
    end
    return v1
end
function SupportLibrary.GetDescendantsWhichAreA(p1, p2) -- Line: 168
    local v1 = {}
    for k, v in pairs(p1:GetDescendants()) do
        if v:IsA(p2) then
            v1[#v1 + 1] = v
        end
    end
    return v1
end
function SupportLibrary.FilterArray(p1, p2) -- Line: 185
    local v1 = {}
    for i, v in ipairs(p1) do
        if p2(v, i) then
            table.insert(v1, v)
        end
    end
    return v1
end
function SupportLibrary.FilterMap(p1, p2) -- Line: 200
    local v1 = {}
    for i, v in ipairs(p1) do
        if p2(v, i) then
            v1[i] = v
        end
    end
    return v1
end
function SupportLibrary.GetDescendantCount(p1) -- Line: 215
    local v1 = 0
    for k, v in pairs(p1:GetChildren()) do
        v1 = v1 + 1 + SupportLibrary.GetDescendantCount(v)
    end
    return v1
end
function SupportLibrary.CloneParts(p1) -- Line: 233
    local v1 = {}
    for k, v in pairs(p1) do
        v1[k] = v:Clone()
    end
    return v1
end
function SupportLibrary.SplitString(p1, p2) -- Line: 246
    local u2 = {}
    p1:gsub(("([^%s]+)"):format(p2), function(p1) -- Line: 253 -- upvalues: u2 (val)
        table.insert(u2, p1)
    end)
    return u2
end
function SupportLibrary.GetChildOfClass(p1, p2, p3) -- Line: 260
    if not p3 then
        for k2, i in pairs(p1:GetChildren()) do
            if i.ClassName == p2 then
                return i
            end
        end
        return nil
    end
    for k, v in pairs(p1:GetChildren()) do
        if v:IsA(p2) then
            return v
        end
    end
    return nil
end
function SupportLibrary.GetChildrenOfClass(p1, p2, p3) -- Line: 282
    local v1 = {}
    if not p3 then
        for k2, i in pairs(p1:GetChildren()) do
            if i.ClassName == p2 then
                table.insert(v1, i)
            end
        end
        return v1
    end
    for k, v in pairs(p1:GetChildren()) do
        if v:IsA(p2) then
            table.insert(v1, v)
        end
    end
    return v1
end
function SupportLibrary.HSVToRGB(p1, p2, p3) -- Line: 305
    if p2 == 0 then
        return p3
    end
    local v1 = math.floor(p1 / 60)
    local v2 = p1 / 60 - v1
    local v3 = p3 * (1 - p2)
    local v4 = p3 * (1 - p2 * v2)
    local v5 = p3 * (1 - p2 * (1 - v2))
    if v1 == 0 then
        return p3, v5, v3
    end
    if v1 == 1 then
        return v4, p3, v3
    end
    if v1 == 2 then
        return v3, p3, v5
    end
    if v1 == 3 then
        return v3, v4, p3
    end
    if v1 == 4 then
        return v5, v3, p3
    end
    if v1 == 5 then
        return p3, v3, v4
    end
end
function SupportLibrary.RGBToHSV(p1, p2, p3) -- Line: 337
    local v1
    local v2 = math.min(p1, p2, p3)
    local v3 = math.max(p1, p2, p3)
    local v4 = v3
    local v5 = v3 - v2
    if v3 == 0 then
        return -1, 0, v4
    end
    if p1 == v3 then
        v1 = (p2 - p3) / v5
    elseif p2 ~= v3 then
        v1 = 4 + (p1 - p2) / v5
    else
        v1 = 2 + (p3 - p1) / v5
    end
    v1 = v1 * 60
    if v1 < 0 then
        v1 = v1 + 360
    end
    return v1, v5 / v3, v4
end
function SupportLibrary.IdentifyCommonItem(p1) -- Line: 377
    local v1 = nil
    for k, v in pairs(p1) do
        if k == 1 then
            v1 = v
        elseif v ~= v1 then
            return nil
        end
    end
    return v1
end
function SupportLibrary.IdentifyCommonProperty(p1, p2) -- Line: 403
    local v1 = {}
    for k, v in pairs(p1) do
        table.insert(v1, v[p2])
    end
    return SupportLibrary.IdentifyCommonItem(v1)
end
function SupportLibrary.GetPartCorners(p1) -- Line: 418
    local insert = table.insert
    local toWorldSpace = CFrame.new().toWorldSpace
    local new = CFrame.new
    local CFrame = p1.CFrame
    local v1 = p1.Size.x / 2
    local v2 = p1.Size.y / 2
    local v3 = p1.Size.z / 2
    local v4 = {}
    insert(v4, toWorldSpace(CFrame, new(v1, v2, v3)))
    insert(v4, toWorldSpace(CFrame, new(-v1, v2, v3)))
    insert(v4, toWorldSpace(CFrame, new(v1, -v2, v3)))
    insert(v4, toWorldSpace(CFrame, new(v1, v2, -v3)))
    insert(v4, toWorldSpace(CFrame, new(-v1, v2, -v3)))
    insert(v4, toWorldSpace(CFrame, new(-v1, -v2, v3)))
    insert(v4, toWorldSpace(CFrame, new(v1, -v2, -v3)))
    insert(v4, toWorldSpace(CFrame, new(-v1, -v2, -v3)))
    return v4
end
function SupportLibrary.ImportServices() -- Line: 444
    local v1 = getfenv(2)
    v1.Workspace = Game:GetService("Workspace")
    v1.Players = Game:GetService("Players")
    v1.MarketplaceService = Game:GetService("MarketplaceService")
    v1.ContentProvider = Game:GetService("ContentProvider")
    v1.SoundService = Game:GetService("SoundService")
    v1.UserInputService = Game:GetService("UserInputService")
    v1.SelectionService = Game:GetService("Selection")
    v1.CoreGui = Game:GetService("CoreGui")
    v1.HttpService = Game:GetService("HttpService")
    v1.ChangeHistoryService = Game:GetService("ChangeHistoryService")
    v1.ReplicatedStorage = Game:GetService("ReplicatedStorage")
    v1.GroupService = Game:GetService("GroupService")
    v1.ServerScriptService = Game:GetService("ServerScriptService")
    v1.ServerStorage = Game:GetService("ServerStorage")
    v1.StarterGui = Game:GetService("StarterGui")
    v1.RunService = Game:GetService("RunService")
end
function SupportLibrary.GetListMembers(p1, p2) -- Line: 469
    local v1 = {}
    for i, v in ipairs(p1) do
        v1[i] = v[p2]
    end
    return v1
end
function SupportLibrary.GetMemberMap(p1, p2) -- Line: 484
    local v1 = {}
    for i, v in ipairs(p1) do
        v1[v] = v[p2]
    end
    return v1
end
function SupportLibrary.AddUserInputListener(p1, p2, p3, p4) -- Line: 499
    local u16 = {}
    if type(p2) == "string" then
        u16[p2] = true
    elseif type(p2) == "table" then
        u16 = SupportLibrary.FlipTable(p2)
    end
    local UserInputService = Game:GetService("UserInputService")
    return UserInputService["Input" .. p1]:Connect(function(p1, p2) -- Line: 511 -- upvalues: p3 (val), u16 (ref), p4 (val)
        if not p2 then
            if not (u16[p1.UserInputType.Name]) then
                return
            end
            if InputType == Enum.UserInputType.Keyboard then
                if Game:GetService("UserInputService"):GetFocusedTextBox() then
                    return
                end
                p4(p1)
                return
            end
            p4(p1)
            return
        end
        if not p3 or not (u16[p1.UserInputType.Name]) then
            return
        end
        if InputType ~= Enum.UserInputType.Keyboard then
            p4(p1)
            return
        end
        if Game:GetService("UserInputService"):GetFocusedTextBox() then
            return
        end
        p4(p1)
    end)
end
function SupportLibrary.AddGuiInputListener(p1, p2, p3, p4, p5) -- Line: 535
    local u17 = {}
    if type(p3) == "string" then
        u17[p3] = true
    elseif type(p3) == "table" then
        u17 = SupportLibrary.FlipTable(p3)
    end
    return p1["Input" .. p2]:Connect(function(p1, p2) -- Line: 547 -- upvalues: p4 (val), u17 (ref), p5 (val)
        if not p2 then
            if not (u17[p1.UserInputType.Name]) then
                return
            end
            p5(p1)
            return
        end
        if not p4 or not (u17[p1.UserInputType.Name]) then
            return
        end
        p5(p1)
    end)
end
function SupportLibrary.AreKeysPressed(...) -- Line: 566
    local v1 = 0
    local KeysPressed = Game:GetService("UserInputService"):GetKeysPressed()
    local v2 = SupportLibrary.GetListMembers(KeysPressed, "KeyCode")
    local v3 = {...}
    for k, v in pairs(v3) do
        if SupportLibrary.IsInTable(v2, v) then
            v1 = v1 + 1
        end
    end
    local v4 = {...}
    local v5 = v1 == #v4
    return v5
end
function SupportLibrary.ConcatTable(p1, ...) -- Line: 589
    local v1 = {...}
    local v2 = p1
    for i, v in ipairs(v1) do
        for i2, i3 in ipairs(v) do
            table.insert(v2, i3)
        end
    end
    return v2
end
function SupportLibrary.ClearTable(p1) -- Line: 605
    for k in pairs(p1) do
        p1[k] = nil
    end
    return p1
end
function SupportLibrary.Values(p1) -- Line: 617
    local v1 = {}
    for k, v in pairs(p1) do
        table.insert(v1, v)
    end
    return v1
end
function SupportLibrary.Keys(p1) -- Line: 631
    local v1 = {}
    for k in pairs(p1) do
        table.insert(v1, k)
    end
    return v1
end
function SupportLibrary.Call(p1, ...) -- Line: 645
    local u1 = {...}
    return function(...) -- Line: 648 -- upvalues: p1 (val), u1 (val)
        return p1(unpack(SupportLibrary.ConcatTable({}, u1, {...})))
    end
end
function SupportLibrary.Trim(p1) -- Line: 655
    return (p1:gsub("^%s*(.-)%s*$", "%1"))
end
function SupportLibrary.ChainCall(...) -- Line: 660
    local u0 = {...}
    return function(...) -- Line: 667 -- upvalues: u0 (val)
        local v1 = {...}
        for i, v in ipairs(u0) do
            v1 = {v(unpack(v1))}
        end
        return unpack(v1)
    end
end
function SupportLibrary.CountKeys(p1) -- Line: 684
    local v1 = 0
    for k in pairs(p1) do
        v1 = v1 + 1
    end
    return v1
end
function SupportLibrary.Slice(p1, p2, p3) -- Line: 699
    local v1 = {}
    local v2 = p3
    local v3 = 1
    for i = p2, v2, v3 do
        table.insert(v1, p1[i])
    end
    return v1
end
function SupportLibrary.FlipTable(p1) -- Line: 714
    local v1 = {}
    for k, v in pairs(p1) do
        v1[v] = k
    end
    return v1
end
function SupportLibrary.ScheduleRecurringTask(p1, p2) -- Line: 729
    local v1 = {
        Running = true,
        Stop = function(p1) -- Line: 739
            p1.Running = false
        end,
        TaskFunction = p1,
        Interval = p2,
    }
    local v2 = coroutine.wrap(function(p1) -- Line: 749
        while wait(p1.Interval) do
            if not p1.Running then
                break
            end
            p1.TaskFunction()
        end
    end)
    v2(v1)
    return v1
end
function SupportLibrary.Loop(p1, p2, ...) -- Line: 763
    local u2 = {...}
    local u4 = true
    coroutine.wrap(function() -- Line: 775 -- upvalues: p1 (val), u4 (ref), p2 (val), u2 (val)
        while wait(p1) do
            if not u4 then
                break
            end
            p2(unpack(u2))
        end
    end)()
    return function() -- Line: 770 -- upvalues: u4 (ref)
        u4 = nil
    end
end
function SupportLibrary.Clamp(p1, p2, p3) -- Line: 785
    local v1
    if not p2 then
        if not p3 then
            v1 = p1
        elseif p3 >= p1 then
            v1 = p1
        else
            v1 = p3
        end
        return v1
    end
    if p1 < p2 then
        return p2
    end
    if not p3 then
        v1 = p1
    elseif p3 >= p1 then
        v1 = p1
    else
        v1 = p3
    end
    return v1
end
function SupportLibrary.ReverseTable(p1) -- Line: 800
    local v1 = {}
    for i, v in ipairs(p1) do
        v1[#p1 - i + 1] = v
    end
    return v1
end
function SupportLibrary.CreateConsecutiveCallDeferrer(p1) -- Line: 815
    local u1 = nil
    return function() -- Line: 819 -- upvalues: u1 (ref), p1 (val)
        local v1 = tick()
        u1 = v1
        wait(p1)
        local v2 = u1 == v1
        return v2
    end
end
return SupportLibrary