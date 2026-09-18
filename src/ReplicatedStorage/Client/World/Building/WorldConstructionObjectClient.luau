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
--      File: ReplicatedStorage.Client.World.Building.WorldConstructionObjectClient
--                               Dumped in 0.00226 seconds
--                          Bytecode version 9  |  9 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local CollectionService = game:GetService("CollectionService")
local TweenService = game:GetService("TweenService")
local User = script.Parent.Parent.Parent:WaitForChild("User")
local Character = User:WaitForChild("Character")
local CharacterMovementRunner = require(Character:WaitForChild("CharacterMovementRunner"))
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local v2 = require(Packages:WaitForChild("octo-tree"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Types = Common:WaitForChild("Types")
local Prefabs = require(Types:WaitForChild("Prefabs"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Utilities = Common_2:WaitForChild("Utilities")
local Table = require(Utilities:WaitForChild("Table"))
local u93 = v2.new()
local u94 = {}
local u95 = {}
local u96 = {}
local u97 = {}
local function unloadConstructionSite(p1) -- Line: 51 -- upvalues: u95 (val), TweenService (val)
    local v1, v2, v3
    p1.loaded = false
    if not p1.model or p1.destroyed then
        return
    end
    for k, v in pairs(p1.model.Props:GetDescendants()) do
        if v:IsA("BasePart") and u95[v] then
            v2 = u95[v]
            v1 = TweenInfo.new(0.7)
            TweenService:Create(v, v1, {CFrame = v2.cframe, Transparency = v2.transparency}):Play()
        end
    end
    if not p1.hologram then
        return
    end
    for k2, i in pairs(p1.hologram:GetDescendants()) do
        if i:IsA("BasePart") and u95[i] then
            v3 = TweenInfo.new(0.7)
            TweenService:Create(i, v3, {Transparency = 1}):Play()
        end
    end
    if p1.highlight then
        local v4 = TweenInfo.new(0.7)
        TweenService:Create(p1.highlight, v4, {OutlineTransparency = 1, FillTransparency = 1}):Play()
    end
end
local function loadConstructionSite(p1) -- Line: 94 -- upvalues: u95 (val), u96 (val), TweenService (val)
    local v1, v2, v3, v4, v5
    if p1.destroyed then
        return
    end
    p1.loaded = true
    local v6 = p1
    for k, v in pairs(p1.model.Props:GetDescendants()) do
        if v:IsA("BasePart") then
            v4 = u95[v]
            if not v4 then
                v4 = {transparency = v.Transparency, cframe = v.CFrame}
            end
            u95[v] = v4
            v4 = u96[v]
            if not v4 then
                v5 = (v6.location + (v.Position - v6.location.Position).Unit * 12) * CFrame.new(0, 5, 0)
                v2 = math.rad(180)
                v4 = v5 * CFrame.Angles(0, v2, 0)
            end
            v2 = TweenInfo.new(0.7)
            TweenService:Create(v, v2, {Transparency = 1, CFrame = v4}):Play()
        end
    end
    if not v6.hologram then
        return
    end
    for k2, i in pairs(v6.hologram:GetDescendants()) do
        if i:IsA("BasePart") then
            v3 = u95[i]
            v1 = TweenInfo.new(0.7)
            TweenService:Create(i, v1, {Transparency = v3.transparency}):Play()
        end
    end
    if v6.highlight then
        local v7 = TweenInfo.new(0.7)
        TweenService:Create(v6.highlight, v7, {OutlineTransparency = 0.3, FillTransparency = 0.65}):Play()
    end
end
local function onNearbyConstructionSitesChanged(p1) -- Line: 148 -- upvalues: Table (val), u97 (ref), loadConstructionSite (val), unloadConstructionSite (val)
    local v1, v2
    v1, v2 = Table.diff(p1, u97)
    for i, v in ipairs(v1) do
        if not v.loaded then
            loadConstructionSite(v.Object)
        end
    end
    for i2, i3 in ipairs(v2) do
        if i3.loaded then
            unloadConstructionSite(i3.Object)
        end
    end
end
local function updateNearbyConstructionSites(p1) -- Line: 165 -- upvalues: u93 (val), onNearbyConstructionSitesChanged (val), u97 (ref), unloadConstructionSite (val)
    local v1 = u93:SearchRadius(p1, 30)
    if #v1 ~= 0 then
        onNearbyConstructionSitesChanged(v1)
        u97 = v1
        return
    end
    if #v1 == 0 then
        for k, v in pairs(u97) do
            unloadConstructionSite(v.Object)
        end
        u97 = {}
    end
end
local function onTrackCharacterMovement() -- Line: 180 -- upvalues: CharacterMovementRunner (val), updateNearbyConstructionSites (val)
    CharacterMovementRunner.useMovementObserver(function(p1) -- Line: 181 -- upvalues: updateNearbyConstructionSites (upval)
        updateNearbyConstructionSites(p1)
    end)
end
local function onConstructionSiteInitialized(p1) -- Line: 186 -- upvalues: onTrackCharacterMovement (val), Prefabs (val), u95 (val), u94 (val), u93 (val)
    onTrackCharacterMovement()
    local u3 = {loaded = false, destroyed = false, model = p1, location = p1:GetPivot()}
    local Attribute = u3.model:GetAttribute("Blueprint")
    if not Attribute then
        return
    end
    local v1 = Prefabs.Prefabs[Attribute]
    if not v1 then
        local BoundingBox_2
        local v2 = Prefabs.getPrefabModelByName(Attribute)
        if not v2 then
            return warn("Failed to load blueprint " .. Attribute)
        end
        local u29 = v2:Clone()
        _, BoundingBox_2 = u29:GetBoundingBox()
        u29:PivotTo(u3.location + Vector3.new(0, BoundingBox_2.Y / 2, 0))
        u29.Parent = workspace
        local Highlight = Instance.new("Highlight")
        Highlight.OutlineColor = Color3.fromRGB(19, 157, 255)
        Highlight.FillColor = Color3.fromRGB(65, 157, 255)
        Highlight.OutlineTransparency = 1
        Highlight.FillTransparency = 1
        Highlight.Adornee = u29
        Highlight.DepthMode = Enum.HighlightDepthMode.Occluded
        Highlight.Parent = u29
        for k, v in pairs(u29:GetDescendants()) do
            if v:IsA("BasePart") then
                v.CanCollide = false
                v.Anchored = true
                v.CanQuery = false
                v.CanTouch = false
                v.Material = Enum.Material.Glass
                v.Color = Color3.fromRGB(36, 160, 198)
                u95[v] = {transparency = 0.3, cframe = v.CFrame}
                v.Transparency = 1
            end
        end
        u3.highlight = Highlight
        u3.hologram = u29
        local u80 = nil
        local PropertyChangedSignal = p1:GetPropertyChangedSignal("Parent")
        PropertyChangedSignal:Once(function() -- Line: 254 -- upvalues: p1 (val), Highlight (val), u29 (ref), u3 (val), u94 (upval), u93 (upval), u80 (ref)
            if p1.Parent then
                return
            end
            Highlight:Destroy()
            u29:Destroy()
            p1:Destroy()
            u3.destroyed = true
            u94[p1:GetPivot().Position] = nil
            u93:RemoveNode(u80)
        end)
        u94[p1:GetPivot().Position] = u3
        return
    elseif v1.marker then
        return
    end
end
for k, v in pairs(CollectionService:GetTagged("Construction")) do
    onConstructionSiteInitialized(v)
end
local InstanceAddedSignal = CollectionService:GetInstanceAddedSignal("Construction")
InstanceAddedSignal:Connect(onConstructionSiteInitialized)
return {}