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
--         File: ReplicatedStorage.Client.User.Miscellaneous.ClientSquadHandler
--                               Dumped in 0.00204 seconds
--                          Bytecode version 9  |  24 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local CollectionService = game:GetService("CollectionService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Alive = require(Common:WaitForChild("Alive"))
local State = script.Parent.Parent:WaitForChild("State")
local ClientSettingsHandler = require(State:WaitForChild("ClientSettingsHandler"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Network = Common_2:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Squad = require(Namespaces:WaitForChild("Squad"))
local u91 = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local LocalPlayer = Players.LocalPlayer
local u93 = {}
local v2 = {}
local u95 = true
local function debugPrint(...) end
local function getCharacterPartNames(p1) -- Line: 57
    local v1 = {}
    for i, j in p1:GetChildren() do
        if j:IsA("BasePart") then
            table.insert(v1, j.Name)
        end
    end
    return table.concat(v1, ", ")
end
local function isSquadHudEnabled() -- Line: 67 -- upvalues: ClientSettingsHandler (val)
    local v1 = ClientSettingsHandler.getSettingFromName("Squad Position")
    if v1 == nil then
        return true
    end
    local v2 = v1 ~= 3
    return v2
end
local function clearIndicatorBillboard(p1) -- Line: 76
    if p1.fadeTween then
        p1.fadeTween:Cancel()
        p1.fadeTween = nil
    end
    if p1.billboard then
        p1.billboard:Destroy()
        p1.billboard = nil
        p1.imageLabel = nil
    end
    p1.visible = false
end
local function hideAllIndicators() -- Line: 91 -- upvalues: u93 (val), clearIndicatorBillboard (val)
    local v1 = u93
    local v2 = nil
    local v3 = nil
    for i, j in v1, v2, v3 do
        clearIndicatorBillboard(j)
    end
end
local function refreshSquadHudEnabled() -- Line: 97 -- upvalues: u95 (ref), isSquadHudEnabled (val), hideAllIndicators (val)
    u95 = isSquadHudEnabled()
    if not u95 then
        hideAllIndicators()
    end
end
local function disconnectAll(p1) -- Line: 106
    local connections = p1.connections
    local v1 = nil
    local v2 = nil
    for i, j in connections, v1, v2 do
        j:Disconnect()
    end
    table.clear(p1.connections)
end
local function destroyIndicator(p1) -- Line: 114 -- upvalues: u93 (val), debugPrint (val), disconnectAll (val)
    local v1 = u93[p1]
    if not v1 then
        return
    end
    debugPrint("destroyIndicator", p1)
    if v1.fadeTween then
        v1.fadeTween:Cancel()
        v1.fadeTween = nil
    end
    disconnectAll(v1)
    if v1.billboard then
        v1.billboard:Destroy()
    end
    v1.player = nil
    u93[p1] = nil
end
local function setIndicatorVisible(p1, p2) -- Line: 140 -- upvalues: debugPrint (val), TweenService (val), u91 (val)
    local v1
    if not p1.imageLabel then
        debugPrint("setIndicatorVisible skipped, no imageLabel", p1.userId)
        return
    end
    if p1.visible == p2 then
        return
    end
    debugPrint("setIndicatorVisible", p1.userId, p2)
    p1.visible = p2
    if p1.fadeTween then
        p1.fadeTween:Cancel()
        p1.fadeTween = nil
    end
    local v2 = {}
    if not p2 then
        v1 = 1
    else
        v1 = 0
    end
    v2.ImageTransparency = v1
    local v3 = TweenService:Create(p1.imageLabel, u91, v2)
    p1.fadeTween = v3
    v3:Play()
end
local function getTorso(p1) -- Line: 166
    return (p1:FindFirstChild("Torso"))
end
local function createBillboard(p1) -- Line: 170 -- upvalues: getTorso (val), debugPrint (val), getCharacterPartNames (val)
    local v1 = getTorso(p1)
    if not v1 then
        local FullName = p1:GetFullName()
        debugPrint("createBillboard failed, no torso on", FullName, "parts:", getCharacterPartNames(p1))
        return nil, nil
    end
    local FullName_2 = p1:GetFullName()
    debugPrint("createBillboard", FullName_2, "adornee:", v1:GetFullName())
    local BillboardGui = Instance.new("BillboardGui")
    BillboardGui.Name = "SquadProximityIndicator"
    BillboardGui.Size = UDim2.fromScale(0.5, 0.5)
    BillboardGui.AlwaysOnTop = true
    BillboardGui.LightInfluence = 0
    BillboardGui.StudsOffset = Vector3.new(0, 0, 0)
    BillboardGui.Adornee = v1
    BillboardGui.Parent = v1
    local ImageLabel = Instance.new("ImageLabel")
    ImageLabel.BackgroundTransparency = 1
    ImageLabel.BorderSizePixel = 0
    ImageLabel.Image = "rbxassetid://77107355380131"
    ImageLabel.ImageTransparency = 1
    ImageLabel.ScaleType = Enum.ScaleType.Fit
    ImageLabel.Size = UDim2.fromScale(1, 1)
    ImageLabel.Parent = BillboardGui
    local FullName_3 = BillboardGui:GetFullName()
    local Parent = BillboardGui.Parent
    if Parent then
        Parent = BillboardGui.Parent:GetFullName()
    end
    debugPrint("createBillboard success", FullName_3, "parent:", Parent, "enabled:", BillboardGui.Enabled)
    return BillboardGui, ImageLabel
end
local function attachBillboard(p1, p2) -- Line: 214 -- upvalues: debugPrint (val), createBillboard (val)
    if not p1.billboard then
        local v1, v2
        debugPrint("attachBillboard", p1.userId, p2:GetFullName())
        if p1.billboard then
            p1.billboard:Destroy()
            p1.billboard = nil
            p1.imageLabel = nil
            p1.visible = false
        end
        v1, v2 = createBillboard(p2)
        if not v1 or not v2 then
            debugPrint("attachBillboard failed, billboard not created", p1.userId)
            return
        end
        p1.billboard = v1
        p1.imageLabel = v2
        debugPrint("attachBillboard success", p1.userId, v1:GetFullName())
        return
    elseif p1.billboard.Adornee and p1.billboard.Adornee:IsDescendantOf(p2) then
        return
    end
end
local function hasLineOfSight(p1) -- Line: 243 -- upvalues: Workspace (val), LocalPlayer (val), getTorso (val), CollectionService (val)
    local CurrentCamera = Workspace.CurrentCamera
    local Character = LocalPlayer.Character
    if not CurrentCamera or not Character then
        return false
    end
    local v1 = getTorso(p1)
    if not v1 then
        return false
    end
    local Position = v1.Position
    local Tagged = CollectionService:GetTagged("IgnoreLineOfSight")
    local v2 = RaycastParams.new()
    v2.FilterType = Enum.RaycastFilterType.Exclude
    v2.RespectCanCollide = true
    v2.FilterDescendantsInstances = {Character, Tagged}
    local Position_2 = CurrentCamera.CFrame.Position
    local v3 = Position - Position_2
    if v3.Magnitude <= 0 then
        return true
    end
    local v4 = Workspace:Raycast(Position_2, v3, v2)
    if not v4 or v4.Instance:IsDescendantOf(p1) then
        return true
    end
    local v5 = (v4.Position - Position).Magnitude <= 1.5
    return v5
end
local function bindIndicatorPlayer(p1, p2) -- Line: 282 -- upvalues: debugPrint (val), disconnectAll (val), attachBillboard (val), setIndicatorVisible (val), Alive (val)
    if p1.player == p2 then
        return
    end
    debugPrint("bindIndicatorPlayer", p1.userId, p2.Name)
    disconnectAll(p1)
    p1.player = p2
    table.insert(p1.connections, p2.CharacterAdded:Connect(function(a1) -- Line: 294 -- upvalues: attachBillboard (upval), p1 (val), setIndicatorVisible (upval)
        attachBillboard(p1, a1)
        setIndicatorVisible(p1, false)
    end))
    table.insert(p1.connections, p2.CharacterRemoving:Connect(function() -- Line: 302 -- upvalues: p1 (val)
        if p1.billboard then
            p1.billboard:Destroy()
            p1.billboard = nil
            p1.imageLabel = nil
            p1.visible = false
        end
    end))
    local v1 = Alive.getAliveCharacter(p2)
    if not v1 then
        debugPrint("bindIndicatorPlayer no alive character yet", p2.Name)
        return
    end
    debugPrint("bindIndicatorPlayer alive character", p2.Name, v1:GetFullName())
    attachBillboard(p1, v1)
end
local function createIndicator(p1) -- Line: 321 -- upvalues: debugPrint (val), u93 (val), Players (val), bindIndicatorPlayer (val)
    debugPrint("createIndicator", p1)
    local v1 = {visible = false, userId = p1, connections = {}}
    u93[p1] = v1
    local PlayerByUserId = Players:GetPlayerByUserId(p1)
    if PlayerByUserId then
        bindIndicatorPlayer(v1, PlayerByUserId)
        return v1
    end
    debugPrint("createIndicator player not in game yet", p1)
    return v1
end
local function syncSquadMembers(p1) -- Line: 346 -- upvalues: debugPrint (val), LocalPlayer (val), u93 (val), createIndicator (val), destroyIndicator (val)
    debugPrint("syncSquadMembers", p1)
    local v1 = {}
    local v2 = p1
    local v3 = nil
    local v4 = nil
    for i, j in v2, v3, v4 do
        if j ~= LocalPlayer.UserId then
            v1[j] = true
            if not (u93[j]) then
                createIndicator(j)
            end
        end
    end
    v2 = u93
    v3 = nil
    v4 = nil
    for k in v2, v3, v4 do
        if not (v1[k]) then
            destroyIndicator(k)
        end
    end
end
local function updateIndicators() -- Line: 368 -- upvalues: u95 (ref), LocalPlayer (val), getTorso (val), u93 (val), setIndicatorVisible (val), Players (val), bindIndicatorPlayer (val), Alive (val), attachBillboard (val), hasLineOfSight (val)
    local Magnitude, PlayerByUserId, v1, v2, v3
    if not u95 then
        return
    end
    local Character = LocalPlayer.Character
    local v4 = Character
    if v4 then
        v4 = getTorso(Character)
    end
    local v5 = u93
    local v6 = nil
    local v7 = nil
    for i, j in v5, v6, v7 do
        if v4 then
            PlayerByUserId = Players:GetPlayerByUserId(j.userId)
            if PlayerByUserId and j.player ~= PlayerByUserId then
                bindIndicatorPlayer(j, PlayerByUserId)
            end
            v2 = PlayerByUserId
            if v2 then
                v2 = Alive.getAliveCharacter(PlayerByUserId)
            end
            if v2 then
                attachBillboard(j, v2)
                v3 = getTorso(v2)
                if v3 then
                    Magnitude = (v4.Position - v3.Position).Magnitude
                    v1 = if Magnitude <= 50 then 7 < Magnitude else false
                    setIndicatorVisible(j, v1 and hasLineOfSight(v2))
                else
                    setIndicatorVisible(j, false)
                end
            else
                setIndicatorVisible(j, false)
            end
        else
            setIndicatorVisible(j, false)
        end
    end
end
local function getSquadState(p1) -- Line: 432
    if not p1 then
        return nil
    end
    if typeof(p1) ~= "table" then
        if typeof(p1) == "table" then
            if p1.memberIds ~= nil then
                return p1
            end
            return nil
        end
        return nil
    end
    if p1.value ~= nil then
        return p1.value
    end
    if typeof(p1) ~= "table" then
        return nil
    end
    if p1.memberIds ~= nil then
        return p1
    end
    return nil
end
local function applySquadStore() -- Line: 448 -- upvalues: Squad (val), LocalPlayer (val), getSquadState (val), debugPrint (val), syncSquadMembers (val)
    local v1 = Squad.Store.get(LocalPlayer)
    local v2 = getSquadState(v1)
    if not v2 then
        debugPrint("applySquadStore no store yet", v1)
        syncSquadMembers({})
        return
    end
    debugPrint("applySquadStore", "leaderId=", v2.leaderId, "memberIds=", v2.memberIds, "maxMembers=", v2.maxMembers)
    local memberIds = v2.memberIds
    if not memberIds then
        memberIds = {}
    end
    syncSquadMembers(memberIds)
end
;(function() -- Line: 469 -- upvalues: debugPrint (val), LocalPlayer (val), refreshSquadHudEnabled (val), applySquadStore (val), Squad (val), ClientSettingsHandler (val), RunService (val), updateIndicators (val)
    debugPrint("loadSquadHandler started for", LocalPlayer.Name)
    refreshSquadHudEnabled()
    applySquadStore()
    Squad.Store.observe(LocalPlayer, applySquadStore)
    ClientSettingsHandler.onSettingChanged:Connect(function(p1) -- Line: 474 -- upvalues: refreshSquadHudEnabled (upval)
        if p1 == "Squad Position" then
            refreshSquadHudEnabled()
        end
    end)
    RunService.RenderStepped:Connect(updateIndicators)
end)()
return {}