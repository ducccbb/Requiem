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
--     File: ReplicatedStorage.Client.Interfaces.Routes.Debug.Debugger.Pages.States
--                               Dumped in 0.00770 seconds
--                          Bytecode version 9  |  25 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local RunService = game:GetService("RunService")
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_2:WaitForChild("Client")
local User = Client:WaitForChild("User")
local Equipment = User:WaitForChild("Equipment")
local Gear = Equipment:WaitForChild("Gear")
local ClientGearHandler = require(Gear:WaitForChild("ClientGearHandler"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_3:WaitForChild("Client")
local User_2 = Client_2:WaitForChild("User")
local State = User_2:WaitForChild("State")
local ClientStateHandler = require(State:WaitForChild("ClientStateHandler"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_4:WaitForChild("Client")
local Interfaces = Client_3:WaitForChild("Interfaces")
local Components = Interfaces:WaitForChild("Components")
local Editor = Components:WaitForChild("Editor")
local Universal = Editor:WaitForChild("Universal")
local Checkbox = require(Universal:WaitForChild("Checkbox"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_5:WaitForChild("Client")
local Interfaces_2 = Client_4:WaitForChild("Interfaces")
local Components_2 = Interfaces_2:WaitForChild("Components")
local Editor_2 = Components_2:WaitForChild("Editor")
local Universal_2 = Editor_2:WaitForChild("Universal")
local Container = require(Universal_2:WaitForChild("Container"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Client_5 = ReplicatedStorage_6:WaitForChild("Client")
local Interfaces_3 = Client_5:WaitForChild("Interfaces")
local Components_3 = Interfaces_3:WaitForChild("Components")
local Editor_3 = Components_3:WaitForChild("Editor")
local Universal_3 = Editor_3:WaitForChild("Universal")
local Dropdown = require(Universal_3:WaitForChild("Dropdown"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Client_6 = ReplicatedStorage_7:WaitForChild("Client")
local Interfaces_4 = Client_6:WaitForChild("Interfaces")
local Components_4 = Interfaces_4:WaitForChild("Components")
local Primitives = Components_4:WaitForChild("Primitives")
local ScrollingFrame = require(Primitives:WaitForChild("ScrollingFrame"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Client_7 = ReplicatedStorage_8:WaitForChild("Client")
local Interfaces_5 = Client_7:WaitForChild("Interfaces")
local Components_5 = Interfaces_5:WaitForChild("Components")
local Editor_4 = Components_5:WaitForChild("Editor")
local Universal_4 = Editor_4:WaitForChild("Universal")
local Search = require(Universal_4:WaitForChild("Search"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Client_8 = ReplicatedStorage_9:WaitForChild("Client")
local Interfaces_6 = Client_8:WaitForChild("Interfaces")
local Components_6 = Interfaces_6:WaitForChild("Components")
local Editor_5 = Components_6:WaitForChild("Editor")
local Universal_5 = Editor_5:WaitForChild("Universal")
local Text = require(Universal_5:WaitForChild("Text"))
local Hooks = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useDebuggerPages = require(Hooks:WaitForChild("useDebuggerPages"))
local Hooks_2 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useDebuggerTheme = require(Hooks_2:WaitForChild("useDebuggerTheme"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Client_9 = ReplicatedStorage_10:WaitForChild("Client")
local Interfaces_7 = Client_9:WaitForChild("Interfaces")
local Hooks_3 = Interfaces_7:WaitForChild("Hooks")
local useOrder = require(Hooks_3:WaitForChild("useOrder"))
local ReplicatedStorage_11 = game:GetService("ReplicatedStorage")
local Client_10 = ReplicatedStorage_11:WaitForChild("Client")
local Interfaces_8 = Client_10:WaitForChild("Interfaces")
local Hooks_4 = Interfaces_8:WaitForChild("Hooks")
local useRem = require(Hooks_4:WaitForChild("useRem"))
local ReplicatedStorage_12 = game:GetService("ReplicatedStorage")
local Client_11 = ReplicatedStorage_12:WaitForChild("Client")
local Interfaces_9 = Client_11:WaitForChild("Interfaces")
local Hooks_5 = Interfaces_9:WaitForChild("Hooks")
local useTextScale = require(Hooks_5:WaitForChild("useTextScale"))
local u359 = {
    "All Sections",
    "Client Only",
    "Gear Only",
    "Server Only",
    "Categories Only",
}
local u365 = {"Alphabetical", "Active first"}
local function sortedStringKeys(p1) -- Line: 86
    local v1 = {}
    for k in pairs(p1) do
        if typeof(k) == "string" then
            table.insert(v1, k)
        end
    end
    table.sort(v1)
    return v1
end
local function takeSnapshot() -- Line: 101 -- upvalues: ClientStateHandler (val), ClientGearHandler (val)
    local v1, v2, v3, v4, v5
    v1, _, v4, v5 = ClientStateHandler.__getStateMap()
    local v6 = {}
    for k, v in pairs(ClientStateHandler.Server) do
        if typeof(k) == "string" and typeof(v) == "number" then
            v6[k] = select(1, ClientStateHandler.isServerStateBusy(v))
        end
    end
    local v7 = {}
    for k2, i in pairs(ClientStateHandler.Categories) do
        if typeof(k2) == "string" then
            v2, v3 = ClientStateHandler.isCategoryBusy(i)
            v7[k2] = {busy = v2, block = v3}
        end
    end
    local v8 = ClientGearHandler.__getGearBusyDebug()
    local v9 = {}
    local traces = v8.traces
    local v10 = nil
    local v11 = nil
    for j, k3 in traces, v10, v11 do
        table.insert(v9, k3)
    end
    local v12 = {client = v1, server = v6, category = v7}
    if v4 == nil then
        v10 = {}
    else
        v10 = table.clone(v4)
    end
    v12.clientSetters = v10
    if v5 == nil then
        v10 = {}
    else
        v10 = table.clone(v5)
    end
    v12.serverSetters = v10
    v12.gear = {equipped = v8.equipped, busy = v8.busy, traces = v9}
    return v12
end
local function snapshotsEqual(p1, p2) -- Line: 147
    local v1
    for k, v in pairs(p1.client) do
        if p2.client[k] ~= v then
            return false
        end
    end
    for k2 in pairs(p2.client) do
        if p1.client[k2] == nil then
            return false
        end
    end
    for k3, i in pairs(p1.server) do
        if p2.server[k3] ~= i then
            return false
        end
    end
    for k4 in pairs(p2.server) do
        if p1.server[k4] == nil then
            return false
        end
    end
    for k5, j in pairs(p1.category) do
        v1 = p2.category[k5]
        if v1 ~= nil and v1.busy == j.busy and v1.block == j.block then
            continue
        end
        return false
    end
    for k6 in pairs(p2.category) do
        if p1.category[k6] == nil then
            return false
        end
    end
    for k7, k8 in pairs(p1.clientSetters) do
        if p2.clientSetters[k7] ~= k8 then
            return false
        end
    end
    for k9 in pairs(p2.clientSetters) do
        if p1.clientSetters[k9] == nil then
            return false
        end
    end
    for k10, n in pairs(p1.serverSetters) do
        if p2.serverSetters[k10] ~= n then
            return false
        end
    end
    for k11 in pairs(p2.serverSetters) do
        if p1.serverSetters[k11] == nil then
            return false
        end
    end
    local gear = p1.gear
    local gear_2 = p2.gear
    if gear.equipped ~= gear_2.equipped or gear.busy ~= gear_2.busy then
        return false
    end
    local v2 = #gear.traces
    if v2 ~= #gear_2.traces then
        return false
    end
    v2 = #gear.traces
    local v3 = 1
    for m = 1, v2, v3 do
        v1 = gear.traces[m]
        if v1 ~= gear_2.traces[m] then
            return false
        end
    end
    return true
end
local function gearMatchesFilters(p1, p2, p3) -- Line: 221
    if not p3 then
        local v1
        if p2 == "" then
            return true
        end
        local v2 = string.lower("gear equipped busy timeout addtimeout")
        if string.find(v2, p2, 1, true) ~= nil then
            return true
        end
        local traces = p1.traces
        local v3 = nil
        local v4 = nil
        for i, j in traces, v3, v4 do
            v1 = string.lower(j)
            if string.find(v1, p2, 1, true) ~= nil then
                return true
            end
        end
        return false
    elseif not p1.busy then
        return false
    end
end
local function countActive(p1) -- Line: 240
    local v1 = 0
    for k, v in pairs(p1) do
        if v then
            v1 = v1 + 1
        end
    end
    return v1
end
local function sortFilteredNames(p1, p2, p3, p4) -- Line: 252
    local v1 = table.clone(p1)
    if p2 == "Active first" then
        table.sort(v1, function(p1, p2) -- Line: 260 -- upvalues: p4 (val), p3 (val)
            local v1, v2, v3
            if p4 == "client" then
                v1 = p3.client[p1] == true
                v2 = p3.client[p2] == true
            elseif p4 ~= "server" then
                v3 = p3.category[p1]
                local v4 = p3.category[p2]
                local v5 = if v3 ~= nil then v3.busy == true else false
                v1 = v5
                v5 = if v4 ~= nil then v4.busy == true else false
                v2 = v5
            else
                v1 = p3.server[p1] == true
                v2 = p3.server[p2] == true
            end
            if v1 ~= v2 then
                return v1
            end
            v3 = p1 < p2
            return v3
        end)
        return v1
    end
    table.sort(v1)
    return v1
end
local function StatusRow(p1) -- Line: 286 -- upvalues: useRem (val), useTextScale (val), useDebuggerTheme (val), react (val), Text (val)
    local Detail, a, statusActive, v1, v2, v3
    local v4 = useRem()
    local v5 = useTextScale()
    local v6 = useDebuggerTheme()
    local v7 = v4(12)
    local v8 = v4(10)
    local v9 = v4(8)
    local v10 = v4(178)
    local v11 = v4(8)
    local Source = p1.Source
    local v12 = if typeof(Source) == "string" then Source ~= "" else false
    local v13 = p1.Detail ~= nil
    if not v13 then
        v1 = 0
    else
        v1 = v10
    end
    local v14 = v8 + v7 + v9 + v1
    local v15 = v4(8)
    v1 = v4(280)
    Detail = p1.Detail
    if v13 then
        if Detail == nil then
            Detail = "—"
        elseif Detail ~= "" then
        end
    end
    if not p1.Active then
        statusActive = v6.accents.statusIdle
    else
        statusActive = v6.accents.statusActive
    end
    local v16 = {}
    if not v12 then
        v2 = {NameLabel = react.createElement(Text, {
            Bold = true,
            Text = p1.Title,
            Native = {
                TextTransparency = 0.1,
                AnchorPoint = Vector2.new(0, 0.5),
                Position = UDim2.new(0, 0, 0.5, 0),
                TextColor3 = v6.accents.attributeBlue,
                TextTruncate = Enum.TextTruncate.AtEnd,
                Size = UDim2.new(1, 0, 1, 0),
                AutomaticSize = Enum.AutomaticSize.None,
            },
        })}
    else
        v2 = {Row = react.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, v15),
        }), NameLabel = react.createElement(Text, {
            Bold = true,
            Text = p1.Title,
            Native = {
                LayoutOrder = 1,
                TextTransparency = 0.1,
                TextColor3 = v6.accents.attributeBlue,
                TextTruncate = Enum.TextTruncate.AtEnd,
                TextXAlignment = Enum.TextXAlignment.Left,
                AutomaticSize = Enum.AutomaticSize.X,
                Size = UDim2.fromOffset(0, v4(22)),
            },
        }, {NameCap = react.createElement("UISizeConstraint", {MaxSize = Vector2.new(v1, v4(26))})}), SourceSlot = react.createElement("Frame", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ClipsDescendants = true,
            LayoutOrder = 2,
            Size = UDim2.new(1, 0, 0, v4(22)),
        }, {SourceLabel = react.createElement(Text, {
            Bold = false,
            Text = Source,
            Native = {
                TextTransparency = 0.14,
                TextColor3 = v6.text.sourceMuted,
                TextTruncate = Enum.TextTruncate.AtEnd,
                TextSize = v5(13),
                TextXAlignment = Enum.TextXAlignment.Left,
                AnchorPoint = Vector2.new(0, 0.5),
                Position = UDim2.new(0, 0, 0.5, 0),
                Size = UDim2.new(1, 0, 1, 0),
                AutomaticSize = Enum.AutomaticSize.None,
            },
        })})}
    end
    v16.LeftCluster = react.createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ClipsDescendants = v12,
        Position = UDim2.new(0, v11, 0, 0),
        Size = UDim2.new(1, -(v11 + v14), 1, 0),
    }, v2)
    if v13 and Detail ~= nil then
        v16.DetailLabel = react.createElement(Text, {
            Text = Detail,
            Native = {
                TextTransparency = 0.18,
                AnchorPoint = Vector2.new(1, 0.5),
                Position = UDim2.new(1, -(v8 + v7 + v9), 0.5, 0),
                TextColor3 = v6.accents.categoryBlocking,
                TextXAlignment = Enum.TextXAlignment.Right,
                TextTruncate = Enum.TextTruncate.AtEnd,
                Size = UDim2.fromOffset(v10, v4(22)),
                AutomaticSize = Enum.AutomaticSize.None,
            },
        })
    end
    local v17 = {
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, -v8, 0.5, 0),
        Size = UDim2.fromOffset(v7, v7),
        BackgroundColor3 = statusActive,
    }
    if not p1.Active then
        v3 = 0.35
    else
        v3 = 0.02
    end
    v17.BackgroundTransparency = v3
    v16.StatusBubble = react.createElement("Frame", v17, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(1, 0)})})
    v16.RowCorner = react.createElement("UICorner", {CornerRadius = UDim.new(0, v4(3))})
    v17 = {BackgroundTransparency = 0.06, BorderSizePixel = 0}
    if p1.Index % 2 ~= 0 then
        a = v6.rows.b
    else
        a = v6.rows.a
    end
    v17.BackgroundColor3 = a
    v17.Size = UDim2.new(1, 0, 0, v4(28))
    v17.LayoutOrder = p1.Index
    return react.createElement("Frame", v17, v16)
end
local function SectionHeader(p1) -- Line: 441 -- upvalues: useRem (val), useDebuggerTheme (val), react (val), Text (val)
    local v1 = useRem()
    local v2 = useDebuggerTheme()
    local v3 = {BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, v1(28)), LayoutOrder = p1.Index}
    local v4 = {}
    local v5 = {BorderSizePixel = 0, BackgroundTransparency = 0.12, AnchorPoint = Vector2.new(0, 0.5), Position = UDim2.new(0, 0, 0.5, 0)}
    local v6 = v1(4)
    v5.Size = UDim2.fromOffset(v6, v1(16))
    v5.BackgroundColor3 = v2.accents.attributeBlue
    v4.Accent = react.createElement("Frame", v5, {AccentCorner = react.createElement("UICorner", {CornerRadius = UDim.new(0, v1(2))})})
    v5 = {Bold = true, Upscale = 1, FontSize = 14, Text = p1.Text}
    local v7 = {TextTransparency = 0.14, AnchorPoint = Vector2.new(0, 0.5)}
    local v8 = v1(10)
    v7.Position = UDim2.new(0, v8, 0.5, 0)
    v7.TextColor3 = v2.text.headerTitle
    v7.TextXAlignment = Enum.TextXAlignment.Left
    v8 = -v1(14)
    v7.Size = UDim2.new(1, v8, 1, 0)
    v5.Native = v7
    v4.Title = react.createElement(Text, v5)
    return react.createElement("Frame", v3, v4)
end
return react.memo(function() -- Line: 484 -- upvalues: useRem (val), useTextScale (val), useDebuggerTheme (val), useOrder (val), useDebuggerPages (val), react (val), takeSnapshot (val), RunService (val), snapshotsEqual (val), sortedStringKeys (val), sortFilteredNames (val), gearMatchesFilters (val), countActive (val), Text (val), SectionHeader (val), StatusRow (val), Container (val), Search (val), Dropdown (val), u359 (val), u365 (val), Checkbox (val), ScrollingFrame (val)
    local Alphabetical, Alphabetical_2, busy, u1342, u23, u29, u44, u882, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13
    local u944 = useRem()
    local v14 = useTextScale()
    local v15 = useDebuggerTheme()
    local v16 = useOrder()
    local u929 = useDebuggerPages().States == true
    local v17 = u944(540)
    local v18 = u944(36)
    u23, v13 = react.useState("")
    u1342, u29 = react.useState(false)
    v1, v2 = react.useState("All Sections")
    Alphabetical, Alphabetical_2 = react.useState("Alphabetical")
    u882, u44 = react.useState(nil)
    local u50 = react.useCallback(function(p1) -- Line: 500 -- upvalues: u44 (val)
        u44(p1)
    end, {u44})
    local u54 = react.useRef(true)
    local v19 = react.useCallback(function(p1) -- Line: 505 -- upvalues: u54 (val), u29 (val)
        if u54.current then
            u54.current = false
            return
        end
        u29(p1)
    end, {})
    react.useEffect(function() -- Line: 513 -- upvalues: u929 (val), u50 (val), takeSnapshot (upval), RunService (upval), snapshotsEqual (upval)
        if not u929 then
            u50(nil)
            return function() end
        end
        local u5 = 0
        local v1 = takeSnapshot()
        local u9 = v1
        u50(v1)
        local u18 = RunService.Heartbeat:Connect(function(p1) -- Line: 526 -- upvalues: u5 (ref), takeSnapshot (upval), u9 (ref), snapshotsEqual (upval), u50 (upval)
            u5 = u5 + p1
            if u5 < 0.1 then
                return
            end
            u5 = 0
            local v1 = takeSnapshot()
            if u9 == nil then
                u9 = v1
                u50(v1)
                return
            end
            if snapshotsEqual(u9, v1) then
                return
            end
            u9 = v1
            u50(v1)
        end)
        return function() -- Line: 542 -- upvalues: u18 (val), u9 (ref)
            u18:Disconnect()
            u9 = nil
        end
    end, {u929})
    local u74 = react.useMemo(function() -- Line: 548 -- upvalues: u882 (val), u23 (val), sortedStringKeys (upval), u1342 (val)
        local v1, v2
        if u882 == nil then
            return {}
        end
        local v3 = string.lower(u23)
        local v4 = sortedStringKeys(u882.client)
        local v5 = {}
        local v6 = v4
        local v7 = nil
        local v8 = nil
        for i, j in v6, v7, v8 do
            v2 = u882.client[j] == true
            if not u1342 then
                if v3 == "" then
                    table.insert(v5, j)
                else
                    v1 = string.lower(j)
                    if string.find(v1, v3, 1, true) == nil then end
                end
            elseif not v2 then
            end
        end
        return v5
    end, {u882, u23, u1342})
    local u82 = react.useMemo(function() -- Line: 570 -- upvalues: u882 (val), u23 (val), sortedStringKeys (upval), u1342 (val)
        local v1, v2
        if u882 == nil then
            return {}
        end
        local v3 = string.lower(u23)
        local v4 = sortedStringKeys(u882.server)
        local v5 = {}
        local v6 = v4
        local v7 = nil
        local v8 = nil
        for i, j in v6, v7, v8 do
            v2 = u882.server[j] == true
            if not u1342 then
                if v3 == "" then
                    table.insert(v5, j)
                else
                    v1 = string.lower(j)
                    if string.find(v1, v3, 1, true) == nil then end
                end
            elseif not v2 then
            end
        end
        return v5
    end, {u882, u23, u1342})
    local u90 = react.useMemo(function() -- Line: 592 -- upvalues: u882 (val), u23 (val), sortedStringKeys (upval), u1342 (val)
        local busy, v1, v2
        if u882 == nil then
            return {}
        end
        local v3 = u882
        local v4 = string.lower(u23)
        local v5 = sortedStringKeys(v3.category)
        local v6 = {}
        local v7 = v5
        local v8 = nil
        local v9 = nil
        for i, j in v7, v8, v9 do
            v2 = v3.category[j]
            busy = v2
            if busy then
                busy = v2.busy
            end
            if not u1342 then
                if v4 == "" then
                    table.insert(v6, j)
                else
                    v1 = string.lower(j)
                    if string.find(v1, v4, 1, true) == nil then end
                end
            elseif busy ~= true then
            end
        end
        return v6
    end, {u882, u23, u1342})
    local v20 = react.useMemo(function() -- Line: 616 -- upvalues: u882 (val), sortFilteredNames (upval), u74 (val), Alphabetical (val)
        if u882 == nil then
            return {}
        end
        return sortFilteredNames(u74, Alphabetical, u882, "client")
    end, {u74, Alphabetical, u882})
    local v21 = react.useMemo(function() -- Line: 623 -- upvalues: u882 (val), sortFilteredNames (upval), u82 (val), Alphabetical (val)
        if u882 == nil then
            return {}
        end
        return sortFilteredNames(u82, Alphabetical, u882, "server")
    end, {u82, Alphabetical, u882})
    local v22 = react.useMemo(function() -- Line: 630 -- upvalues: u882 (val), sortFilteredNames (upval), u90 (val), Alphabetical (val)
        if u882 == nil then
            return {}
        end
        return sortFilteredNames(u90, Alphabetical, u882, "category")
    end, {u90, Alphabetical, u882})
    local v23 = if v1 ~= "All Sections" then v1 == "Client Only" else true
    local v24 = if v1 ~= "All Sections" then v1 == "Gear Only" else true
    local v25 = if v1 ~= "All Sections" then v1 == "Server Only" else true
    local v26 = if v1 ~= "All Sections" then v1 == "Categories Only" else true
    local v27 = {u882, u23, u1342}
    local v28 = react.useMemo(function() -- Line: 642 -- upvalues: u882 (val), gearMatchesFilters (upval), u23 (val), u1342 (val)
        if u882 == nil then
            return false
        end
        local v1 = string.lower(u23)
        return gearMatchesFilters(u882.gear, v1, u1342)
    end, v27)
    if not u882 then
        v3 = 0
    else
        v3 = countActive(u882.client)
    end
    if not u882 then
        v27 = 0
    else
        v27 = countActive(u882.server)
    end
    if not u882 then
        v4 = 0
    else
        v4 = #sortedStringKeys(u882.client)
    end
    if not u882 then
        v5 = 0
    else
        v5 = #sortedStringKeys(u882.server)
    end
    if not u882 then
        v6 = 0
    else
        v6 = #u882.gear.traces
    end
    local u180 = {}
    local u690 = 0
    local function spacer() -- Line: 658 -- upvalues: u690 (ref), u180 (val), react (upval), u944 (val)
        u690 = u690 + 1
        local v1 = ("Row_%*"):format(u690)
        u180[v1] = react.createElement("Frame", {BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, u944(8)), LayoutOrder = u690})
    end
    if u882 ~= nil then
        local v29, v30
        v7 = false
        if v23 then
            v7 = true
            u690 = u690 + 1
            v29 = ("Row_%*"):format(u690)
            u180[v29] = react.createElement(SectionHeader, {Text = "Client States", Index = u690})
            if #v20 ~= 0 then
                v29 = v20
                v8 = nil
                v9 = nil
                for i, j in v29, v8, v9 do
                    u690 = u690 + 1
                    v11 = ("Row_%*"):format(u690)
                    v12 = {Title = j}
                    v30 = u882.client[j] == true
                    v12.Active = v30
                    v12.Source = u882.clientSetters[j]
                    v12.Index = u690
                    u180[v11] = react.createElement(StatusRow, v12)
                end
            else
                u690 = u690 + 1
                v29 = ("Row_%*"):format(u690)
                u180[v29] = react.createElement(Text, {
                    Text = "No matching client states.",
                    Native = {
                        TextTransparency = 0.5,
                        TextColor3 = v15.text.muted,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        Size = UDim2.new(1, 0, 0, u944(22)),
                        LayoutOrder = u690,
                    },
                })
            end
        end
        if v24 then
            if v7 then
                spacer()
            end
            v7 = true
            u690 = u690 + 1
            v29 = ("Row_%*"):format(u690)
            local v31 = {Text = "Gear", Index = u690}
            u180[v29] = react.createElement(SectionHeader, v31)
            if not v28 then
                u690 = u690 + 1
                v29 = ("Row_%*"):format(u690)
                u180[v29] = react.createElement(Text, {
                    Text = "No matching gear debug.",
                    Native = {
                        TextTransparency = 0.5,
                        TextColor3 = v15.text.muted,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        Size = UDim2.new(1, 0, 0, u944(22)),
                        LayoutOrder = u690,
                    },
                })
            elseif u882.gear.equipped then
                u690 = u690 + 1
                v29 = ("Row_%*"):format(u690)
                v31 = {Title = "Equipped", Active = true, Index = u690}
                u180[v29] = react.createElement(StatusRow, v31)
                v29 = #u882.gear.traces
                u690 = u690 + 1
                v8 = ("Row_%*"):format(u690)
                local v32 = {Title = "Busy (state.busy)", Active = u882.gear.busy}
                if 0 >= v29 then
                    v10 = nil
                else
                    v10 = string.format("%d active timeout(s)", v29)
                end
                v32.Detail = v10
                v32.Index = u690
                u180[v8] = react.createElement(StatusRow, v32)
                if v29 ~= 0 then
                    local v33
                    local traces = u882.gear.traces
                    v9 = nil
                    v31 = nil
                    for k, n in traces, v9, v31 do
                        u690 = u690 + 1
                        v11 = n
                        if v11 == nil then
                            v11 = "—"
                        elseif v11 ~= "" then
                        end
                        v33 = ("Row_%*"):format(u690)
                        u180[v33] = react.createElement(StatusRow, {Title = string.format("addTimeout #%d", k), Active = u882.gear.busy, Source = v11, Index = u690})
                    end
                else
                    u690 = u690 + 1
                    v8 = ("Row_%*"):format(u690)
                    u180[v8] = react.createElement(Text, {
                        Text = "No pending addTimeout windows.",
                        Native = {
                            TextTransparency = 0.52,
                            TextColor3 = v15.text.muted,
                            TextXAlignment = Enum.TextXAlignment.Left,
                            Size = UDim2.new(1, 0, 0, u944(22)),
                            LayoutOrder = u690,
                        },
                    })
                end
            else
                u690 = u690 + 1
                v29 = ("Row_%*"):format(u690)
                u180[v29] = react.createElement(Text, {
                    Text = "No gear equipped.",
                    Native = {
                        TextTransparency = 0.5,
                        TextColor3 = v15.text.muted,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        Size = UDim2.new(1, 0, 0, u944(22)),
                        LayoutOrder = u690,
                    },
                })
            end
        end
        if v25 then
            if v7 then
                spacer()
            end
            v7 = true
            u690 = u690 + 1
            v29 = ("Row_%*"):format(u690)
            u180[v29] = react.createElement(SectionHeader, {Text = "Server States", Index = u690})
            if #v21 ~= 0 then
                v29 = v21
                v8 = nil
                v9 = nil
                for m, i5 in v29, v8, v9 do
                    u690 = u690 + 1
                    v11 = ("Row_%*"):format(u690)
                    v12 = {Title = i5}
                    v30 = u882.server[i5] == true
                    v12.Active = v30
                    v12.Source = u882.serverSetters[i5]
                    v12.Index = u690
                    u180[v11] = react.createElement(StatusRow, v12)
                end
            else
                u690 = u690 + 1
                v29 = ("Row_%*"):format(u690)
                u180[v29] = react.createElement(Text, {
                    Text = "No matching server states.",
                    Native = {
                        TextTransparency = 0.5,
                        TextColor3 = v15.text.muted,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        Size = UDim2.new(1, 0, 0, u944(22)),
                        LayoutOrder = u690,
                    },
                })
            end
        end
        if v26 then
            if v7 then
                spacer()
            end
            u690 = u690 + 1
            v29 = ("Row_%*"):format(u690)
            u180[v29] = react.createElement(SectionHeader, {Text = "Categories", Index = u690})
            if #v22 ~= 0 then
                v29 = v22
                v8 = nil
                v9 = nil
                for i6, i7 in v29, v8, v9 do
                    v10 = u882.category[i7]
                    u690 = u690 + 1
                    v11 = ("Row_%*"):format(u690)
                    v12 = {Title = i7}
                    if not v10 then
                        busy = false
                    else
                        busy = v10.busy
                    end
                    v12.Active = busy
                    if not v10 then
                        v30 = nil
                    elseif not v10.busy then
                        v30 = nil
                    else
                        v30 = v10.block or "—"
                    end
                    v12.Detail = v30
                    v12.Index = u690
                    u180[v11] = react.createElement(StatusRow, v12)
                end
            else
                u690 = u690 + 1
                v29 = ("Row_%*"):format(u690)
                u180[v29] = react.createElement(Text, {
                    Text = "No matching categories.",
                    Native = {
                        TextTransparency = 0.5,
                        TextColor3 = v15.text.muted,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        Size = UDim2.new(1, 0, 0, u944(22)),
                        LayoutOrder = u690,
                    },
                })
            end
        end
    else
        u690 = u690 + 1
        v7 = ("Row_%*"):format(u690)
        u180[v7] = react.createElement(Text, {
            Text = "Loading snapshot...",
            Native = {
                TextTransparency = 0.45,
                TextColor3 = v15.text.muted,
                TextXAlignment = Enum.TextXAlignment.Left,
                Size = UDim2.new(1, 0, 0, u944(22)),
                LayoutOrder = u690,
            },
        })
    end
    v8 = {
        Draggable = true,
        Spacing = 10,
        Position = UDim2.fromScale(0.08, 0.18),
        Native = {Visible = u929},
    }
    v9 = {
        Layout = react.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            VerticalAlignment = Enum.VerticalAlignment.Top,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, u944(9)),
        }),
        SearchBar = react.createElement(Search, {
            PlaceholderText = "Filter States...",
            WidthPx = v17,
            HeightPx = v18,
            LayoutOrder = v16(),
            OnQueryChange = v13,
        }),
        ToolbarRow = react.createElement("Frame", {BackgroundTransparency = 1, ZIndex = 5, Size = UDim2.fromOffset(v17, u944(42)), LayoutOrder = v16()}, {H = react.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, u944(10)),
        }), SectionDropdown = react.createElement(Dropdown, {
            Header = "Section",
            Upscale = 1.08,
            Options = u359,
            Default = v1,
            Changed = v2,
            Divider = u944(78),
            Width = u944(182),
            Native = {LayoutOrder = 1, ZIndex = 15},
        }), SortDropdown = react.createElement(Dropdown, {
            Header = "Sort",
            Upscale = 1.08,
            Options = u365,
            Default = Alphabetical,
            Changed = Alphabetical_2,
            Divider = u944(54),
            Width = u944(168),
            Native = {LayoutOrder = 2, ZIndex = 15},
        })}),
        FilterRow = react.createElement("Frame", {BackgroundTransparency = 1, Size = UDim2.fromOffset(v17, u944(40)), LayoutOrder = v16()}, {Pad = react.createElement("UIPadding", {PaddingLeft = UDim.new(0, u944(2)), PaddingTop = UDim.new(0, u944(2))}), H = react.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, u944(22)),
        }), ActiveOnlyBox = react.createElement(Checkbox, {
            Label = "Active only",
            Upscale = 1,
            Default = u1342,
            Toggled = v19,
            Native = {LayoutOrder = 1},
        })}),
        SummaryLine = react.createElement(Text, {
            Text = string.format("Poll %.2fs  •  Client %d/%d  •  Gear timeouts %d  •  Server %d/%d  •  %s  •  %s", 0.1, v3, v4, v6, v27, v5, v1, Alphabetical),
            Native = {TextTransparency = 0.45, TextColor3 = v15.text.muted, LayoutOrder = v16()},
        }),
    }
    v10 = {
        BackgroundTransparency = 0.12,
        BorderSizePixel = 0,
        BackgroundColor3 = v15.chrome.panelSurface,
        Size = UDim2.fromOffset(v17, u944(300)),
        LayoutOrder = v16(),
    }
    v11 = {ChromeCorner = react.createElement("UICorner", {CornerRadius = UDim.new(0, u944(8))}), ChromeStroke = react.createElement("UIStroke", {Thickness = 1, Transparency = 0.55, Color = v15.chrome.panelStroke})}
    v12 = {BackgroundTransparency = 1, BorderSizePixel = 0, AnchorPoint = Vector2.new(0, 0)}
    local v34 = u944(8)
    v12.Position = UDim2.new(0, v34, 0, u944(8))
    v34 = -u944(16)
    v12.Size = UDim2.new(1, v34, 1, -u944(16))
    v12.ScrollBarThickness = v14(5)
    v12.ScrollBarImageColor3 = v15.chrome.scrollThumb
    v11.Scroll = react.createElement(ScrollingFrame, v12, {Content = react.createElement("Frame", {BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, 0), AutomaticSize = Enum.AutomaticSize.Y}, {Pad = react.createElement("UIPadding", {PaddingRight = UDim.new(0, v14(6)), PaddingBottom = UDim.new(0, u944(4))}), List = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, u944(2)),
    })}, u180)})
    v9.ScrollChrome = react.createElement("Frame", v10, v11)
    return react.createElement(Container, v8, v9)
end)