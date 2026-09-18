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
--                         File: ReplicatedStorage.Common.Alive
--                               Dumped in 0.00268 seconds
--                          Bytecode version 9  |  42 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local CollectionService = game:GetService("CollectionService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local u34 = game:GetService("RunService"):IsServer()
local u35 = workspace
local Utilities = script.Parent:WaitForChild("Utilities")
local Signal = require(Utilities:WaitForChild("Signal"))
local u47 = {"Character", "Shifter"}
local u50 = {}
local u51 = {}
local u52 = {}
local u53 = {}
local u54 = true
local u56 = Signal.new()
local u58 = Signal.new()
local u60 = Signal.new()
local u61 = {}
local u62 = {}
local u63 = {}
local u64 = {}
local u65 = {}
local u66 = {}
local u67 = {}
local u68 = {}
local u69 = {}
local u70 = {}
local u71 = {}
local u72 = 1
local u73 = {}
local u76 = (function() -- Line: 120 -- upvalues: u34 (val), ReplicatedStorage (val)
    local Players
    if not u34 then
        return (ReplicatedStorage:WaitForChild("Players"))
    end
    Players = ReplicatedStorage:FindFirstChild("Players")
    if not Players then
        Players = Instance.new("Folder")
    end
    local v1 = Players
    v1.Name = "Players"
    v1.Parent = ReplicatedStorage
    return v1
end)()
local function rebuildPlayersArray() -- Line: 146 -- upvalues: u51 (val), u50 (val), u54 (ref)
    table.clear(u51)
    local v1 = u50
    local v2 = nil
    local v3 = nil
    for i in v1, v2, v3 do
        table.insert(u51, i)
    end
    u54 = false
end
local function addPlayerToCaches(p1, p2) -- Line: 160 -- upvalues: u50 (val), u52 (val), u53 (val), u54 (ref), u64 (val), u62 (val), u65 (val)
    if u50[p1] then
        return
    end
    u50[p1] = p2
    u52[p1.Name] = p1
    u53[p1.UserId] = p1
    u54 = true
    local v1 = u64[p1.Name]
    if v1 and u62[v1] then
        u65[p1] = v1
    end
end
local function removePlayerFromCaches(p1) -- Line: 181 -- upvalues: u50 (val), u52 (val), u53 (val), u65 (val), u54 (ref)
    if not (u50[p1]) then
        return
    end
    u50[p1] = nil
    if u52[p1.Name] == p1 then
        u52[p1.Name] = nil
    end
    if u53[p1.UserId] == p1 then
        u53[p1.UserId] = nil
    end
    u65[p1] = nil
    u54 = true
end
local function onPlayerAddedHook(p1, p2) -- Line: 220 -- upvalues: addPlayerToCaches (val), u56 (val)
    addPlayerToCaches(p1, p2)
    u56:Fire(p1)
end
local function onPlayerRemovedHook(p1) -- Line: 228 -- upvalues: removePlayerFromCaches (val), u58 (val)
    removePlayerFromCaches(p1)
    u58:Fire(p1)
end
local function onServerPlayerAddedHook(p1) -- Line: 236 -- upvalues: u76 (val), addPlayerToCaches (val), u56 (val)
    local ObjectValue = Instance.new("ObjectValue")
    ObjectValue.Name = p1.Name
    ObjectValue.Value = p1
    ObjectValue.Parent = u76
    addPlayerToCaches(p1, ObjectValue)
    u56:Fire(p1)
end
local function onServerPlayerRemovedHook(p1) -- Line: 250 -- upvalues: u76 (val), removePlayerFromCaches (val), u58 (val)
    local v1 = u76:FindFirstChild(p1.Name)
    if v1 then
        v1:Destroy()
    end
    removePlayerFromCaches(p1)
    u58:Fire(p1)
end
local function isInWorkspace(p1) -- Line: 311 -- upvalues: u35 (val)
    local Parent = p1
    while Parent do
        if Parent == u35 then
            return true
        end
        Parent = Parent.Parent
    end
    return false
end
local function insertIntoWorkspaceList(p1) -- Line: 328 -- upvalues: u63 (val)
    table.insert(u63, p1)
end
local function removeFromWorkspaceList(p1) -- Line: 337 -- upvalues: u63 (val)
    local v1 = 1
    local v2 = -1
    for i = #u63, v1, v2 do
        if u63[i] == p1 then
            u63[i] = u63[#u63]
            u63[#u63] = nil
            return
        end
    end
end
local function linkPlayerToModel(p1, p2) -- Line: 354 -- upvalues: u52 (val), u65 (val)
    local v1 = u52[p2]
    if v1 then
        u65[v1] = p1
    end
end
local function unlinkPlayerFromModel(p1, p2) -- Line: 367 -- upvalues: u52 (val), u65 (val)
    local v1 = u52[p2]
    if v1 and u65[v1] == p1 then
        u65[v1] = nil
    end
end
local function setInWorkspace(p1, p2) -- Line: 380 -- upvalues: u62 (val), u66 (val), u64 (val), linkPlayerToModel (val), insertIntoWorkspaceList (val), u60 (val), unlinkPlayerFromModel (val), removeFromWorkspaceList (val)
    local v1 = u62[p1] == true
    if v1 == p2 then
        return
    end
    if p2 then
        local Name = p1.Name
        u66[p1] = Name
        u62[p1] = true
        u64[Name] = p1
        linkPlayerToModel(p1, Name)
        insertIntoWorkspaceList(p1)
        u60:Fire(p1)
        return
    end
    u62[p1] = nil
    local v2 = u66[p1]
    if v2 then
        if u64[v2] == p1 then
            u64[v2] = nil
        end
        unlinkPlayerFromModel(p1, v2)
    end
    removeFromWorkspaceList(p1)
end
local function handleNameChanged(p1) -- Line: 412 -- upvalues: u66 (val), u62 (val), u64 (val), unlinkPlayerFromModel (val), linkPlayerToModel (val)
    local v1 = u66[p1]
    local Name = p1.Name
    if v1 == Name then
        return
    end
    if u62[p1] then
        if v1 and u64[v1] == p1 then
            u64[v1] = nil
        end
        u64[Name] = p1
        if v1 then
            unlinkPlayerFromModel(p1, v1)
        end
        linkPlayerToModel(p1, Name)
    end
    u66[p1] = Name
end
local function bindAliveId(p1, p2) -- Line: 441 -- upvalues: u70 (val), u69 (val)
    local v1 = u70[p1]
    if v1 == p2 then
        return
    end
    if v1 ~= nil and u69[v1] == p1 then
        u69[v1] = nil
    end
    if p2 == nil or 0 >= p2 then
        u70[p1] = nil
        return
    end
    u70[p1] = p2
    u69[p2] = p1
end
local function allocateAliveId() -- Line: 463 -- upvalues: u73 (val), u72 (ref)
    local v1 = table.remove(u73)
    if v1 then
        return v1
    end
    local v2 = u72
    if 65535 < v2 then
        warn("[Alive] AliveId u16 range exhausted; character will not receive an id")
        return 0
    end
    u72 = v2 + 1
    return v2
end
local function releaseAliveId(p1) -- Line: 486 -- upvalues: u73 (val)
    if p1 <= 0 or 65535 < p1 then
        return
    end
    table.insert(u73, p1)
end
local function assignServerAliveId(p1) -- Line: 499 -- upvalues: bindAliveId (val), allocateAliveId (val)
    local v1
    local Attribute = p1:GetAttribute("network_id")
    if typeof(Attribute) ~= "number" or 0 >= Attribute then
        v1 = allocateAliveId()
        if v1 == 0 then
            return
        end
        p1:SetAttribute("network_id", v1)
        bindAliveId(p1, v1)
        return
    end
    if Attribute <= 65535 then
        bindAliveId(p1, Attribute)
        return
    end
    v1 = allocateAliveId()
    if v1 == 0 then
        return
    end
    p1:SetAttribute("network_id", v1)
    bindAliveId(p1, v1)
end
local function watchClientAliveId(p1) -- Line: 520 -- upvalues: bindAliveId (val), u71 (val)
    local function sync() -- Line: 521 -- upvalues: p1 (val), bindAliveId (upval)
        local Attribute = p1:GetAttribute("network_id")
        if typeof(Attribute) ~= "number" or 0 >= Attribute then
            bindAliveId(p1, nil)
            return
        end
        if Attribute <= 65535 then
            bindAliveId(p1, Attribute)
            return
        end
        bindAliveId(p1, nil)
    end
    sync()
    local AttributeChangedSignal = p1:GetAttributeChangedSignal("network_id")
    u71[p1] = AttributeChangedSignal:Connect(sync)
end
local function onAliveTagApplied(p1) -- Line: 539 -- upvalues: u61 (val), u66 (val), u67 (val), setInWorkspace (val), u35 (val), u68 (val), handleNameChanged (val), u34 (val), assignServerAliveId (val), watchClientAliveId (val), isInWorkspace (val)
    if not (p1:IsA("Model")) then
        return
    end
    local v1 = u61[p1] or 0
    u61[p1] = v1 + 1
    if 0 < v1 then
        return
    end
    u66[p1] = p1.Name
    u67[p1] = p1.AncestryChanged:Connect(function(a1, p2) -- Line: 555 -- upvalues: setInWorkspace (upval), p1 (val), u35 (upval)
        if p2 == nil then
            setInWorkspace(p1, false)
            return
        end
        local v1 = if p2 ~= u35 then u35:IsAncestorOf(p2) else true
        setInWorkspace(p1, v1)
    end)
    local PropertyChangedSignal = p1:GetPropertyChangedSignal("Name")
    u68[p1] = PropertyChangedSignal:Connect(function() -- Line: 563 -- upvalues: handleNameChanged (upval), p1 (val)
        handleNameChanged(p1)
    end)
    if not u34 then
        watchClientAliveId(p1)
    else
        assignServerAliveId(p1)
    end
    if isInWorkspace(p1) then
        setInWorkspace(p1, true)
    end
end
local function onAliveTagRemoved(p1) -- Line: 583 -- upvalues: u61 (val), setInWorkspace (val), u67 (val), u68 (val), u71 (val), u70 (val), bindAliveId (val), u34 (val), releaseAliveId (val), u66 (val)
    if not (p1:IsA("Model")) then
        return
    end
    local v1 = u61[p1]
    if not v1 then
        return
    end
    v1 = v1 - 1
    if 0 < v1 then
        u61[p1] = v1
        return
    end
    u61[p1] = nil
    setInWorkspace(p1, false)
    local v2 = u67[p1]
    if v2 then
        v2:Disconnect()
        u67[p1] = nil
    end
    local v3 = u68[p1]
    if v3 then
        v3:Disconnect()
        u68[p1] = nil
    end
    local v4 = u71[p1]
    if v4 then
        v4:Disconnect()
        u71[p1] = nil
    end
    local v5 = u70[p1]
    bindAliveId(p1, nil)
    if u34 then
        if v5 and 0 < v5 then
            releaseAliveId(v5)
        end
        if p1.Parent ~= nil then
            p1:SetAttribute("network_id", nil)
        end
    end
    u66[p1] = nil
end
local u102 = 0
local function u105() -- Line: 677 -- upvalues: u102 (ref), u47 (val), CollectionService (val), u61 (val), onAliveTagApplied (val), onAliveTagRemoved (val), setInWorkspace (val), isInWorkspace (val)
    local v1, v2, v3
    local v4 = os.clock()
    local v5 = v4 - u102
    if v5 < 15 then
        return
    end
    u102 = v4
    v5 = {}
    local v6 = u47
    local v7 = nil
    local v8 = nil
    for i, j in v6, v7, v8 do
        for k, n in CollectionService:GetTagged(j) do
            if n:IsA("Model") then
                v5[n] = (v5[n] or 0) + 1
            end
        end
    end
    v6 = {}
    v7 = {}
    v8 = v5
    local v9 = nil
    local v10 = nil
    for m, i5 in v8, v9, v10 do
        v3 = u61[m] or 0
        if v3 < i5 then
            v1 = i5 - v3
            v2 = 1
            for i7 = 1, v1, v2 do
                table.insert(v6, m)
            end
        elseif i5 < v3 then
            v1 = v3 - i5
            v2 = 1
            for i6 = 1, v1, v2 do
                table.insert(v7, m)
            end
        end
    end
    v8 = u61
    v9 = nil
    v10 = nil
    for i8, i9 in v8, v9, v10 do
        if not (v5[i8]) then
            v3 = i9
            v1 = 1
            for i10 = 1, v3, v1 do
                table.insert(v7, i8)
            end
        end
    end
    v8 = v6
    v9 = nil
    v10 = nil
    for i11, i12 in v8, v9, v10 do
        onAliveTagApplied(i12)
    end
    v8 = v7
    v9 = nil
    v10 = nil
    for i13, i14 in v8, v9, v10 do
        onAliveTagRemoved(i14)
    end
    v8 = u61
    v9 = nil
    v10 = nil
    for i15 in v8, v9, v10 do
        setInWorkspace(i15, isInWorkspace(i15))
    end
end
local function u106() -- Line: 740 -- upvalues: u34 (val), u105 (ref)
    if not u34 then
        return
    end
    u105()
end
local function getAliveCharacter(p1) -- Line: 764 -- upvalues: u34 (val), u106 (ref), u65 (val), u62 (val), u64 (val)
    if u34 then
        u106()
    end
    local v1 = u65[p1]
    if not v1 then
        return u64[p1.Name]
    end
    if u62[v1] then
        return v1
    end
    return u64[p1.Name]
end
;(function() -- Line: 264 -- upvalues: u34 (val), Players (val), onServerPlayerAddedHook (val), onServerPlayerRemovedHook (val), u76 (val), onPlayerAddedHook (val), onPlayerRemovedHook (val)
    if u34 then
        for k, n in Players:GetPlayers() do
            onServerPlayerAddedHook(n)
        end
        Players.PlayerAdded:Connect(onServerPlayerAddedHook)
        Players.PlayerRemoving:Connect(onServerPlayerRemovedHook)
        return
    end
    for i, j in u76:GetChildren() do
        if j:IsA("ObjectValue") and j.Value then
            onPlayerAddedHook(j.Value, j)
        end
    end
    u76.ChildAdded:Connect(function(p1) -- Line: 279 -- upvalues: onPlayerAddedHook (upval)
        if p1:IsA("ObjectValue") and p1.Value then
            onPlayerAddedHook(p1.Value, p1)
        end
    end)
    u76.ChildRemoved:Connect(function(p1) -- Line: 285 -- upvalues: onPlayerRemovedHook (upval)
        if p1:IsA("ObjectValue") and p1.Value then
            onPlayerRemovedHook(p1.Value)
        end
    end)
end)()
;(function() -- Line: 644 -- upvalues: u47 (val), CollectionService (val), onAliveTagApplied (val), onAliveTagRemoved (val)
    local InstanceAddedSignal, InstanceRemovedSignal
    local v1 = u47
    local v2 = nil
    local v3 = nil
    for i, j in v1, v2, v3 do
        for k, n in CollectionService:GetTagged(j) do
            onAliveTagApplied(n)
        end
        InstanceAddedSignal = CollectionService:GetInstanceAddedSignal(j)
        InstanceAddedSignal:Connect(onAliveTagApplied)
        InstanceRemovedSignal = CollectionService:GetInstanceRemovedSignal(j)
        InstanceRemovedSignal:Connect(onAliveTagRemoved)
    end
end)()
return {
    playerInstances = u50,
    getAliveCharacter = getAliveCharacter,
    awaitCharacterAdded = function(p1) -- Line: 784 -- upvalues: getAliveCharacter (val), u60 (val)
        local v1
        local v2 = getAliveCharacter(p1)
        if v2 then
            return v2
        end
        local v3 = p1
        while true do
            v1 = u60:Wait()
            if v1 and v1.Name == v3.Name then
                break
            end
        end
        return v1
    end,
    getPlayerFromCharacter = function(p1) -- Line: 818 -- upvalues: u62 (val), u52 (val)
        if not (u62[p1]) then
            return nil
        end
        return u52[p1.Name]
    end,
    getAlivePlayerById = function(p1) -- Line: 831 -- upvalues: u53 (val)
        return u53[p1]
    end,
    PlayerAdded = u56,
    PlayerRemoving = u58,
    CharacterAdded = u60,
    LocalPlayer = Players.LocalPlayer,
    getPlayerByNames = function() -- Line: 213 -- upvalues: u52 (val)
        return u52
    end,
    getPlayers = function() -- Line: 201 -- upvalues: u54 (ref), rebuildPlayersArray (val), u51 (val)
        if u54 then
            rebuildPlayersArray()
        end
        return u51
    end,
    getAllAliveCharacters = function() -- Line: 803 -- upvalues: u34 (val), u106 (ref), u63 (val)
        if u34 then
            u106()
        end
        return u63
    end,
    findPlayer = function(p1) -- Line: 755 -- upvalues: u52 (val)
        return u52[p1]
    end,
    getAliveCharacterById = function(p1) -- Line: 840 -- upvalues: u69 (val)
        if typeof(p1) ~= "number" or p1 <= 0 or 65535 < p1 then
            return nil
        end
        return u69[p1]
    end,
    getAliveCharacterId = function(p1) -- Line: 852 -- upvalues: u70 (val)
        return u70[p1]
    end,
    Service = Players,
}