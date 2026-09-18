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
--               File: ReplicatedStorage.Common.Chrono.Shared.NpcRegistry
--                               Dumped in 0.00244 seconds
--                          Bytecode version 9  |  19 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Alive = require(v1.Parent.Parent.Parent:WaitForChild("Alive"))
local u36 = {}
local v3 = {}
local u38 = {}
local u41 = RunService:IsClient()
local v4 = RunService:IsServer()
local u45 = nil
local u60 = nil
if not u41 then
    u60 = require(v1.Parent.Parent.Server.Replicate)
else
    u45 = require(v1.Parent.Parent.Client.Replicate)
end
local Config = require(v1.Parent.Config)
local InterpolationMath = require(v1.Parent.Parent.Shared.InterpolationMath)
local Signal = require(v1.Parent.Signal)
local VelocityAt = InterpolationMath.VelocityAt
local u78 = Signal.new()
local u80 = Signal.new()
local u84 = Instance.new("Camera", workspace)
u84.Name = "NpcRegistryCamera"
local u112 = nil
local u107 = nil
if v4 then
    u107 = Instance.new("RemoteEvent", v1)
    u107.Name = "OwnerChanged"
    u112 = Instance.new("Folder", ReplicatedStorage)
    u112.Name = "NPC_MODEL_CACHE"
elseif u41 then
    u107 = v1:WaitForChild("OwnerChanged")
    u112 = ReplicatedStorage:WaitForChild("NPC_MODEL_CACHE")
end
local NPC_MODELS = Config.NPC_MODELS
local u115 = {}
local function removeOwner(p1, p2) -- Line: 57 -- upvalues: u115 (val)
    if not (u115[p1]) then
        return
    end
    local v1 = u115[p1]
    v1[p2] = nil
    if not (next(u115[p1])) then
        u115[p1] = nil
    end
end
local function ClientRegister(p1, p2, p3) -- Line: 67 -- upvalues: u84 (val), u36 (val), u45 (ref), u78 (val), u112 (ref)
    if not p1 then
        warn("NPC model does not have an NPC_ID attribute:", p2:GetFullName())
        return
    end
    local v1 = p2:Clone()
    v1.Name = tostring(p1)
    v1.Parent = u84
    u36[p1] = v1
    v1:PivotTo(CFrame.new(0, 1000000, 0))
    u45.RegisterClientNPC(p1, v1, p3.type)
    u78:Fire(p1, v1, p3.initData)
    local v2 = tostring(p1)
    u112:SetAttribute(v2, true)
end
local function Check() -- Line: 88 -- upvalues: u112 (ref), HttpService (val), NPC_MODELS (val), ClientRegister (val)
    local v1, v2, v3
    for i, j in u112:GetAttributes() do
        if tonumber(i) and type(j) == "string" then
            v1 = HttpService:JSONDecode(j)
            v2 = u112:FindFirstChild((tostring(i)))
            if v1.modelType then
                v2 = NPC_MODELS[v1.modelType] or v2
            end
            if not v2 then
                warn((("Npc cache: Invalid NPC Model for ID: %* TYPE: %* MAKE SURE IT IS REGISTERED AS A MODEL IN CONFIG [Chrono/src/shared/config]"):format(i, v1.modelType)))
            elseif v2:IsA("Model") then
                v3 = tonumber(i)
                ClientRegister(v3, v2, v1)
            end
        end
    end
end
function v3.RegisterNpcModel(p1, p2) -- Line: 110 -- upvalues: NPC_MODELS (val)
    NPC_MODELS[p2] = p1
end
function v3.Register(p1, p2, p3, p4, p5) -- Line: 114 -- upvalues: u41 (val), NPC_MODELS (val), u84 (val), u60 (ref), u36 (val), u112 (ref), HttpService (val), u38 (val), u78 (val)
    if u41 then
        error("Register can only be called on the server.")
    end
    if not p1 then
        error("Npc cache requires a model to register.")
    end
    if p3 and not (NPC_MODELS[p3]) then
        warn("No NPC Model Found [" .. tostring(p3) .. "] MAKE SURE IT IS REGISTERED IN CONFIG [Chrono/src/shared/config] or using [Npc.RegisterNpcModel]")
    end
    local v1 = p2 or "DEFAULT"
    local v2 = p3 or "DEFAULT"
    local v3 = u84:FindFirstChild(v2)
    if not v3 then
        v3 = Instance.new("Folder", u84)
    end
    v3.Name = v2
    local v4 = u60.RegisterNPC(p1, v1)
    u36[v4] = p1
    p1.Parent = v3
    if p1 and p1.PrimaryPart then
        u60.PushNPCTransform(v4, p1.PrimaryPart.CFrame, os.clock())
    end
    pcall(function() -- Line: 142 -- upvalues: p1 (val)
        p1.PrimaryPart:SetNetworkOwner(nil)
    end)
    if not (NPC_MODELS[p3 or ""]) then
        if not p1.Archivable then
            local FullName = p1:GetFullName()
            warn("NPC model is not archivable:", FullName, "Archivable will now be set to true.")
        end
        p1.Archivable = true
        local v5 = p1:Clone()
        v5:PivotTo(CFrame.new(0, 1000000, 0))
        v5.Name = tostring(v4)
        v5.Parent = u112
    end
    local v6 = tostring(v4)
    u112:SetAttribute(v6, HttpService:JSONEncode({type = v1, modelType = p3, initData = p5}))
    if p4 then
        u38[v4] = p1
    end
    u78:Fire(v4, p1, p5)
    return v4
end
function v3.UnRegister(p1) -- Line: 170 -- upvalues: u41 (val), u36 (val), u38 (val), u60 (ref), removeOwner (val), u112 (ref), u80 (val)
    local Attribute
    if u41 then
        error("UnRegister can only be called on the server.")
    end
    if type(p1) ~= "number" then
        Attribute = p1:GetAttribute("NPC_ID")
    else
        Attribute = p1
    end
    if not Attribute then
        error("Npc cache requires a valid NPC_ID to unregister.")
    end
    u36[Attribute] = nil
    u38[Attribute] = nil
    removeOwner(u60.idMap[Attribute].networkOwner, Attribute)
    local v1 = u60.UnregisterNPC(Attribute)
    local v2 = u112:FindFirstChild((tostring(Attribute)))
    if v2 then
        v2:Destroy()
    end
    local v3 = tostring(Attribute)
    u112:SetAttribute(v3, nil)
    if not v1 then
        error("Npc cache: Unregister failed to find model for ID: " .. Attribute .. " Please Investigate.")
    end
    u80:Fire(Attribute, v1)
    return v1
end
function v3.GetModel(p1) -- Line: 200 -- upvalues: u36 (val)
    return u36[p1]
end
function v3.SetPosition(p1, p2) -- Line: 204 -- upvalues: u41 (val), u36 (val), u60 (ref), u107 (ref), u38 (val)
    local v1
    if u41 then
        v1 = u36[p1]
        if not v1 or not (v1:IsA("Model")) then
            return
        end
        v1:PivotTo(p2)
        return
    end
    v1 = u60.idMap[p1]
    if not v1 then
        return
    end
    if v1.networkOwner then
        u107:FireClient(v1.networkOwner, "m", p1, p2)
    end
    local v2 = u36[p1]
    if u38[p1] and v2 and v2:IsA("Model") then
        v2:PivotTo(p2)
    end
    u60.PushNPCTransform(p1, p2, os.clock())
end
function v3.SetNetworkOwner(p1, p2) -- Line: 226 -- upvalues: u41 (val), u60 (ref), removeOwner (val), u107 (ref), u115 (val)
    if u41 then
        error("SetNetworkOwner can only be called on the server.")
    end
    local v1 = u60.idMap[p1]
    if not v1 then
        warn("Npc cache: SetNetworkOwner failed to find data for ID: " .. p1 .. " Please Investigate.")
        return
    end
    local networkOwner = v1.networkOwner
    if networkOwner == p2 then
        return
    end
    if networkOwner then
        removeOwner(networkOwner, p1)
        u107:FireClient(networkOwner, "r", p1)
    end
    v1.networkOwner = p2
    u107:FireAllClients("c", p1, p2)
    local v2 = u60.idMap[p1]
    if v2 then
        v2.clientLastTick = v2.latestT or os.clock()
    end
    if p2 then
        local v3 = u115[p2]
        if not v3 then
            v3 = {}
        end
        u115[p2] = v3
        local v4 = u115[p2]
        v4[p1] = true
        u107:FireClient(p2, "a", p1)
    end
end
function v3.GetNetworkOwner(p1) -- Line: 258 -- upvalues: u41 (val), u60 (ref)
    if u41 then
        error("GetNetworkOwner can only be called on the server.")
    end
    local v1 = u60.idMap[p1]
    if not v1 then
        return
    end
    return v1.networkOwner
end
function v3.GetNpcsOwnedBy(p1) -- Line: 269 -- upvalues: u41 (val), u115 (val)
    if u41 then
        error("GetNpcsOwnedBy can only be called on the server.")
    end
    local v1 = {}
    if u115[p1] then
        local v2 = u115[p1]
        local v3 = nil
        local v4 = nil
        for i in v2, v3, v4 do
            table.insert(v1, i)
        end
    end
    return v1
end
function v3.GetClientOwned() -- Line: 282 -- upvalues: u41 (val), u115 (val)
    if not u41 then
        error("GetClientOwned can only be called on the client.")
    end
    local v1 = {}
    local v2 = u115
    local v3 = nil
    local v4 = nil
    for i in v2, v3, v4 do
        table.insert(v1, i)
    end
    return v1
end
if not u41 then
    RunService.PostSimulation:Connect(function(p1) -- Line: 377 -- upvalues: u38 (val), u60 (ref)
        local PrimaryPart, v1
        local v2 = os.clock()
        debug.profilebegin("Check Npc CFrames")
        local v3 = u38
        local v4 = nil
        local v5 = nil
        for i, j in v3, v4, v5 do
            v1 = u60.idMap[i]
            if v1 and not v1.networkOwner then
                PrimaryPart = j.PrimaryPart
                if PrimaryPart then
                    u60.PushNPCTransform(i, PrimaryPart.CFrame, v2)
                end
            end
        end
        debug.profileend()
    end)
    Alive.PlayerAdded:Connect(function(p1) -- Line: 394 -- upvalues: u107 (ref), u60 (ref), u115 (val)
        local latestCFrame, v1, v2
        u107.OnServerEvent:Wait()
        table.insert(u60._newPlayers, p1)
        if not (u115[p1]) then
            return
        end
        local v3 = {}
        local v4 = u115[p1]
        local v5 = nil
        local v6 = nil
        for i in v4, v5, v6 do
            v1 = u60.idMap[i]
            v2 = tostring(i)
            v3[v2] = true
            if v1 then
                latestCFrame = v1.latestCFrame
                if latestCFrame then
                    v3[tostring(i)] = latestCFrame
                end
            end
        end
        u107:FireClient(p1, "i", v3)
    end)
else
    task.delay(0.1, function() -- Line: 294 -- upvalues: u112 (ref), u45 (ref), u36 (val), u80 (val), HttpService (val), NPC_MODELS (val), ClientRegister (val), Check (val), u107 (ref), u115 (val), VelocityAt (val)
        u112.AttributeChanged:Connect(function(p1) -- Line: 295 -- upvalues: u112 (upval), u45 (upval), u36 (upval), u80 (upval), HttpService (upval), NPC_MODELS (upval), ClientRegister (upval)
            local v1
            local v2 = tonumber(p1)
            if not v2 then
                return
            end
            local Attribute = u112:GetAttribute(p1)
            if not Attribute then
                u45.UnregisterNPC(v2)
                v1 = u36[v2]
                u36[v2] = nil
                u80:Fire(v2, v1)
                v1:Destroy()
                return
            end
            if type(Attribute) ~= "string" then
                return
            end
            v1 = HttpService:JSONDecode(Attribute)
            local v3 = u112:FindFirstChild((tostring(v2)))
            if v1.modelType then
                v3 = NPC_MODELS[v1.modelType] or v3
            end
            if not v3 or not (v3:IsA("Model")) then
                warn((("Npc cache: Invalid NPC Model for ID: %* TYPE: %* MAKE SURE IT IS REGISTERED AS A MODEL IN CONFIG [Chrono/src/shared/config]"):format(v2, v1.modelType)))
                return
            end
            task.defer(ClientRegister, v2, v3, v1)
        end)
        Check()
        u107.OnClientEvent:Connect(function(p1, p2, p3) -- Line: 324 -- upvalues: u115 (upval), u45 (upval), VelocityAt (upval), u36 (upval)
            local v1, v2, v3
            if p1 == "a" then
                u115[p2] = u115[p2] or true
                return
            end
            if p1 == "r" then
                u115[p2] = nil
                return
            end
            if p1 == "i" then
                local Latest, v4, v5, v6
                v1 = p2
                v2 = nil
                v3 = nil
                for i, j in v1, v2, v3 do
                    v4 = tonumber(i)
                    u115[v4] = j
                    v5 = u45.idMap[v4]
                    if v5 and typeof(j) == "CFrame" then
                        v6 = os.clock()
                        Latest = v5.snapshot:GetLatest()
                        v5.snapshot:Push(v6, j, VelocityAt(Latest, v6, j))
                    end
                end
                return
            end
            if p1 == "c" then
                task.wait(0.1)
                v1 = u45.idMap[p2]
                if not v1 then
                    return
                end
                v1.networkOwner = p3
                local Latest_2 = v1.snapshot:GetLatest()
                v1.snapshot:Clear()
                if Latest_2 then
                    local Latest_3 = v1.snapshot:GetLatest()
                    v1.snapshot:Push(0, Latest_2.value, VelocityAt(Latest_3, 0, Latest_2.value))
                end
                u45.BufferTracker.Clear(p2)
                return
            end
            if p1 ~= "m" then
                return
            end
            v1 = u36[p2]
            if not v1 then
                v2 = os.clock()
                while true do
                    task.wait()
                    v1 = u36[p2]
                    if v1 then
                        break
                    end
                    v3 = os.clock() - v2
                    if 5 < v3 then
                        break
                    end
                end
            end
            if v1 and v1:IsA("Model") and typeof(p3) == "CFrame" then
                v1:PivotTo(p3)
            end
            v2 = u45.idMap[p2]
            if not v2 then
                u115[p2] = p3
                return
            end
            v3 = os.clock()
            local Latest_4 = v2.snapshot:GetLatest()
            v2.snapshot:Push(v3, p3, VelocityAt(Latest_4, v3, p3))
        end)
        u107:FireServer()
    end)
end
v3._AutomaticNpc = u38
v3._ClientOwners = u115
v3.NpcAdded = u78.Event
v3.NpcRemoved = u80.Event
return v3