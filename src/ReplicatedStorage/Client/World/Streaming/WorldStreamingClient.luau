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
--          File: ReplicatedStorage.Client.World.Streaming.WorldStreamingClient
--                               Dumped in 0.00201 seconds
--                          Bytecode version 9  |  24 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local CollectionService = game:GetService("CollectionService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_2:WaitForChild("Packages")
local v2 = require(Packages:WaitForChild("octo-tree"))
local User = script.Parent.Parent.Parent:WaitForChild("User")
local State = User:WaitForChild("State")
local ClientSettingsHandler = require(State:WaitForChild("ClientSettingsHandler"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_3:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Character = require(Utilities:WaitForChild("Character"))
local u86 = Vector2.new(125, 125)
local u88 = v2.new()
local u89 = true
local u90 = true
local u91 = false
local u92 = false
local u93 = {}
local u94 = {}
local u95 = {}
local u96 = {}
local u97 = nil
local u98 = false
local u99 = false
local u100 = false
local u101 = {renderDistance = 16, renderBatching = 5, renderBatchDelay = 0}
local Folder = Instance.new("Folder")
Folder.Name = "Prop Storage"
Folder.Parent = ReplicatedStorage
local Folder_2 = Instance.new("Folder")
Folder_2.Name = "Chunk Storage"
Folder_2.Parent = ReplicatedStorage
local u113 = Workspace:FindFirstChild("Low Detail Props")
local u117 = Workspace:FindFirstChild("Large Props")
local function getChunkWorldPosition(p1) -- Line: 80 -- upvalues: u86 (val)
    local v1 = p1.X * u86.X + u86.X / 2
    local v2 = p1.Y * u86.Y + u86.Y / 2
    return (Vector3.new(v1, 0, v2))
end
local function waitForGameLoaded() -- Line: 92 -- upvalues: ClientSettingsHandler (val)
    if not game.Loaded then
        while true do
            task.wait()
            if game.Loaded then
                break
            end
        end
    end
    if not (ClientSettingsHandler.isSettingsLoaded()) then
        while true do
            task.wait()
            if ClientSettingsHandler.isSettingsLoaded() then
                break
            end
        end
    end
end
local function getChunkName(p1) -- Line: 113
    return string.format("chunk_%d_%d", p1.X, p1.Y)
end
local function onPrepareChunkLoading() -- Line: 121 -- upvalues: u86 (val), u113 (val), u117 (val), getChunkName (val), u94 (val), u95 (val), u88 (val), getChunkWorldPosition (val), u96 (val), u98 (ref)
    local v1, v2, v3, v4, v5, v6
    local function getInstanceLocation(p1) -- Line: 124
        if p1:IsA("BasePart") then
            return p1.CFrame
        end
        if p1:IsA("Model") then
            return p1:GetPivot()
        end
        warn("Invalid instance type")
        return CFrame.new()
    end
    local function onCreateChunk(p1) -- Line: 137
        local Folder = Instance.new("Folder")
        Folder.Name = string.format("chunk_%d_%d", p1.X, p1.Y)
        return Folder
    end
    local function getChunkBelongingTo(p1) -- Line: 145 -- upvalues: getInstanceLocation (val), u86 (upval)
        local Position = getInstanceLocation(p1).Position
        local v1 = math.floor(Position.X / u86.X)
        local v2 = math.floor(Position.Z / u86.Y)
        return Vector2.new(v1, v2)
    end
    v5 = {u113, u117}
    v6 = nil
    local v7 = nil
    for i, j in v5, v6, v7 do
        for k, n in j:GetChildren() do
            v1 = getChunkBelongingTo(n)
            v2 = getChunkName(v1)
            if not (u94[v2]) then
                u94[v2] = onCreateChunk(v1)
                u94[v2].Parent = j
                u95[v2] = j
                v3 = {loaded = true, id = v1, folder = u94[v2]}
                v4 = getChunkWorldPosition(v1)
                u88:CreateNode(v4, v3)
                u96[v1] = v3
            end
            n.Parent = u94[v2]
        end
    end
    u98 = true
end
local function onLoadChunk(p1) -- Line: 190 -- upvalues: u95 (val), getChunkName (val), u96 (val)
    local id = p1.id
    p1.folder.Parent = u95[getChunkName(id)]
    p1.loaded = true
    u96[id] = p1
end
local function onEnableChunkLoading() -- Line: 205 -- upvalues: u97 (ref), u98 (ref), onPrepareChunkLoading (val), Folder (val), u96 (val), RunService (val), Character (val), u88 (val), u101 (val), u86 (val), onLoadChunk (val)
    if u97 then
        u97:Disconnect()
    end
    if not u98 then
        onPrepareChunkLoading()
    end
    local function onUnloadChunk(p1) -- Line: 217 -- upvalues: Folder (upval), u96 (upval)
        p1.folder.Parent = Folder
        p1.loaded = false
        u96[p1.id] = nil
    end
    u97 = RunService.RenderStepped:Connect(function(p1) -- Line: 228 -- upvalues: Character (upval), u88 (upval), u101 (upval), u86 (upval), onLoadChunk (upval), u96 (upval), onUnloadChunk (val)
        local Object
        local v1 = Character.getCharacter()
        if not v1 or not (v1:FindFirstChild("HumanoidRootPart")) then
            return
        end
        local v2 = u88:SearchRadius(v1.HumanoidRootPart.Position, u101.renderDistance * u86.X / 2)
        local v3 = {}
        local v4 = v2
        local v5 = nil
        local v6 = nil
        for i, j in v4, v5, v6 do
            Object = j.Object
            v3[Object.id] = true
            if not Object.loaded then
                onLoadChunk(Object)
            end
        end
        for k, v in pairs(u96) do
            if not (v3[k]) then
                onUnloadChunk(v)
            end
        end
    end)
end
local function onDisableChunkLoading() -- Line: 265 -- upvalues: u97 (ref), u96 (val), onLoadChunk (val), u99 (ref)
    if u97 then
        u97:Disconnect()
        u97 = nil
    end
    local v1 = u96
    local v2 = nil
    local v3 = nil
    for i, j in v1, v2, v3 do
        onLoadChunk(j)
    end
    u99 = false
end
local function onUpdateChunkLoading() -- Line: 283 -- upvalues: u100 (ref), onDisableChunkLoading (val), u99 (ref), onEnableChunkLoading (val)
    if not u100 then
        onDisableChunkLoading()
        return
    end
    if u100 and not u99 then
        u99 = true
        onEnableChunkLoading()
    end
end
local function _onUpdateChunkLoadingSettings() -- Line: 300 -- upvalues: waitForGameLoaded (val), ClientSettingsHandler (val), u100 (ref), u101 (val), onUpdateChunkLoading (val)
    waitForGameLoaded()
    local v1 = ClientSettingsHandler.getSettingFromName("Chunk Loading")
    if v1 ~= u100 then
        u100 = v1
    end
    local v2 = ClientSettingsHandler.getSettingFromName("Render Distance")
    if v2 ~= u101.renderDistance then
        u101.renderDistance = v2
    end
    local v3 = ClientSettingsHandler.getSettingFromName("Render Batching")
    if v3 ~= u101.renderBatching then
        u101.renderBatching = v3
    end
    local v4 = ClientSettingsHandler.getSettingFromName("Render Batch Delay")
    if v4 ~= u101.renderBatchDelay then
        u101.renderBatchDelay = v4
    end
    onUpdateChunkLoading()
end
local function onUpdateLowDetailProps() -- Line: 331 -- upvalues: u113 (val), u91 (ref), Folder (val)
    if u113 then
        local v1
        local v2 = u113
        if not u91 then
            v1 = workspace
        else
            v1 = Folder
            if not v1 then
                v1 = workspace
            end
        end
        v2.Parent = v1
    end
end
local function onUpdateTextures() -- Line: 341 -- upvalues: u93 (val), u89 (ref)
    local SmoothPlastic
    for i, j in workspace:GetDescendants() do
        if j:IsA("BasePart") then
            if not (u93[j]) then
                u93[j] = j.Material
            end
            if not u89 then
                SmoothPlastic = Enum.Material.SmoothPlastic
            else
                SmoothPlastic = u93[j]
            end
            j.Material = SmoothPlastic
        end
    end
end
local function onUpdateTextureSettings() -- Line: 360 -- upvalues: waitForGameLoaded (val), ClientSettingsHandler (val), u89 (ref), onUpdateTextures (val)
    waitForGameLoaded()
    local v1 = ClientSettingsHandler.getSettingFromName("Display Textures")
    if v1 ~= u89 then
        u89 = v1
        onUpdateTextures()
    end
end
local function onHandleSeatInteraction() -- Line: 371 -- upvalues: CollectionService (val), u92 (ref)
    local v1, v2, v3
    local Tagged = CollectionService:GetTagged("Seating")
    if u92 then
        v1 = Tagged
        v2 = nil
        v3 = nil
        for k, n in v1, v2, v3 do
            if not (n:HasTag("Interaction")) then
                if n:GetAttribute("Type") ~= "Seating" then
                    if n:IsA("Seat") then
                        n:AddTag("Interaction")
                        n:SetAttribute("Type", "Seating")
                        n.Disabled = true
                    end
                elseif n:IsA("Seat") then
                end
            end
        end
        return
    end
    v1 = Tagged
    v2 = nil
    v3 = nil
    for i, j in v1, v2, v3 do
        if j:HasTag("Interaction") then
            if j:GetAttribute("Type") == "Seating" then
                if j:IsA("Seat") then
                    j:RemoveTag("Interaction")
                    j:SetAttribute("Type", nil)
                    j.Disabled = false
                end
            elseif j:IsA("Seat") then
            end
        end
    end
end
local function onUpdateWindowLighting() -- Line: 404 -- upvalues: u90 (ref)
    for i, j in workspace:GetDescendants() do
        if j:IsA("PointLight") and j:HasTag("Window Light") then
            j.Enabled = not u90
        end
    end
end
local function onUpdateWindowLightingSettings() -- Line: 420 -- upvalues: waitForGameLoaded (val), ClientSettingsHandler (val), u90 (ref), onUpdateWindowLighting (val)
    waitForGameLoaded()
    local v1 = ClientSettingsHandler.getSettingFromName("Light Sources")
    if v1 ~= u90 then
        u90 = v1
        onUpdateWindowLighting()
    end
end
local function onUpdateSeatingInteraction() -- Line: 431 -- upvalues: waitForGameLoaded (val), ClientSettingsHandler (val), u92 (ref), onHandleSeatInteraction (val)
    waitForGameLoaded()
    local v1 = ClientSettingsHandler.getSettingFromName("Enable Seating Interaction")
    if v1 ~= u92 then
        u92 = v1
        onHandleSeatInteraction()
    end
end
local function _onUpdateLowDetailPropsSettings() -- Line: 446 -- upvalues: waitForGameLoaded (val), ClientSettingsHandler (val), u91 (ref), onUpdateLowDetailProps (val)
    waitForGameLoaded()
    local v1 = ClientSettingsHandler.getSettingFromName("Hide Low Detail Props")
    if v1 ~= u91 then
        u91 = v1
        onUpdateLowDetailProps()
    end
end
onUpdateTextureSettings()
onUpdateWindowLightingSettings()
onUpdateSeatingInteraction()
ClientSettingsHandler.onSettingChanged:Connect(function() -- Line: 461 -- upvalues: onUpdateTextureSettings (val), onUpdateWindowLightingSettings (val), onUpdateSeatingInteraction (val)
    onUpdateTextureSettings()
    onUpdateWindowLightingSettings()
    onUpdateSeatingInteraction()
end)
return {}