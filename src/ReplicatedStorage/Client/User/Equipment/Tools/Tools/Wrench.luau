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
--           File: ReplicatedStorage.Client.User.Equipment.Tools.Tools.Wrench
--                               Dumped in 0.00174 seconds
--                          Bytecode version 9  |  13 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local CollectionService = game:GetService("CollectionService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local trove = require(Packages:WaitForChild("trove"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Character = require(Utilities:WaitForChild("Character"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Network = Common_2:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Building = require(Namespaces:WaitForChild("Building"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Types = Common_3:WaitForChild("Types")
local Building_2 = Types:WaitForChild("Building")
local Categories = Building_2:WaitForChild("Categories")
local Schematics = require(Categories:WaitForChild("Schematics"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_5:WaitForChild("Common")
local Network_2 = Common_4:WaitForChild("Network")
local Namespaces_2 = Network_2:WaitForChild("Namespaces")
local Server = require(Namespaces_2:WaitForChild("Server"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_6:WaitForChild("Common")
local Types_2 = Common_5:WaitForChild("Types")
local Branches = require(Types_2:WaitForChild("Branches"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_7:WaitForChild("Common")
local Signals = require(Common_6:WaitForChild("Signals"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_8:WaitForChild("Client")
local Interfaces = Client:WaitForChild("Interfaces")
local Components = Interfaces:WaitForChild("Components")
local Screen = Components:WaitForChild("Screen")
local Radial = require(Screen:WaitForChild("Radial"))
local Editor = script.Parent.Parent.Parent.Parent:WaitForChild("Editor")
local Universal = Editor:WaitForChild("Universal")
local UserPlacementHandler = require(Universal:WaitForChild("UserPlacementHandler"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Common_7 = ReplicatedStorage_9:WaitForChild("Common")
local Types_3 = Common_7:WaitForChild("Types")
local u238 = {
    {Name = "Exterior", Image = "rbxassetid://11963354446"},
    {Name = "Buildings", Image = "rbxassetid://12966426423"},
    {Name = "Item Givers", Image = "rbxassetid://11432831662"},
}
local v2 = {
    description = "A wrench, used for building schematics.",
    attributes = {"Military Grade"},
    category = require(Types_3:WaitForChild("Item")).CATEGORIES.Tool,
}
local u246 = nil
local u248 = trove.new()
local u249 = false
local u250 = false
local u251 = {}
u251["Trap Cart"] = 0.33
local function isCloseToSupplyCart(p1) -- Line: 65 -- upvalues: CollectionService (val), Character (val), Players (val)
    local Magnitude, Position
    local Tagged = CollectionService:GetTagged("Supply Cart")
    if #Tagged == 0 then
        return false, nil
    end
    local v1 = Character.getCharacter(Players.LocalPlayer)
    if not v1 then
        return false, nil
    end
    local HumanoidRootPart = v1:FindFirstChild("HumanoidRootPart")
    if not HumanoidRootPart then
        return false, nil
    end
    local v2 = nil
    local huge = math.huge
    if not p1 then
        Position = HumanoidRootPart.Position
    else
        Position = p1:GetPivot().Position
    end
    local v3 = Tagged
    local v4 = nil
    local v5 = nil
    for i, j in v3, v4, v5 do
        if j:IsDescendantOf(workspace) then
            Magnitude = (Position - j:GetPivot().Position).Magnitude
            if Magnitude < 50 and Magnitude < huge then
                huge = Magnitude
                v2 = j
            end
        end
    end
    if v2 then
        return true, v2
    end
    return false, nil
end
local function renderSegmentModels(p1) -- Line: 108 -- upvalues: Schematics (val), u251 (val), isCloseToSupplyCart (val), UserPlacementHandler (val), Radial (val)
    local v1 = {}
    local v2 = Schematics
    local v3 = nil
    local v4 = nil
    for i, j in v2, v3, v4 do
        if j.model:find(p1) then
            v1[j.name] = {
                path = j.model,
                id = j.id,
                maxBuild = j.maxBuild,
                currentBuild = j.currentBuild,
                built = j.built,
                name = j.name,
            }
        end
    end
    v2 = {}
    v3 = v1
    v4 = nil
    local v5 = nil
    for k, n in v3, v4, v5 do
        if not (u251[n.name]) then
            table.insert(v2, {Image = "rbxassetid://11963354446", Name = n.name, Model = UserPlacementHandler.getModelFromAssets("Builder/Schematics/" .. n.path), Data = n})
        elseif not (isCloseToSupplyCart()) then
        end
    end
    v4 = {enabled = true, options = v2, key = p1}
    return (Radial.updateRadialMenu(v4))
end
local function openWrenchRadial() -- Line: 152 -- upvalues: u248 (val), Radial (val), u238 (val), u249 (ref), renderSegmentModels (val), UserPlacementHandler (val), u250 (ref), u251 (val), isCloseToSupplyCart (val), Signals (val), Building (val)
    u248:Clean()
    local v1 = {enabled = true, key = "WrenchBuildings", options = u238}
    local v2 = Radial.updateRadialMenu(v1)
    u249 = true
    u248:Add(v2:Connect(function(p1) -- Line: 163 -- upvalues: Radial (upval), renderSegmentModels (upval), u248 (upval), u249 (upval), UserPlacementHandler (upval), u250 (upval), u251 (upval), isCloseToSupplyCart (upval), Signals (upval), Building (upval)
        local v1 = {enabled = false, key = "WrenchBuildings"}
        Radial.updateRadialMenu(v1)
        local v2 = renderSegmentModels(p1.Name)
        u248:Add(v2:Connect(function(p1) -- Line: 166 -- upvalues: Radial (upval), u249 (upval), UserPlacementHandler (upval), u250 (upval), u248 (upval), u251 (upval), isCloseToSupplyCart (upval), Signals (upval), Building (upval)
            local v1 = {enabled = false}
            Radial.updateRadialMenu(v1)
            task.defer(function() -- Line: 170 -- upvalues: u249 (upval)
                u249 = false
            end)
            local Data = p1.Data
            if not Data then
                return
            end
            v1 = UserPlacementHandler.getModelFromAssets("Builder/Schematics/" .. Data.path)
            if not v1 then
                return
            end
            u250 = true
            local v2 = UserPlacementHandler.onBeginModelPlacement(v1, function(p1, p2) -- Line: 191
                return p1
            end)
            u248:Add(v2:Connect(function(p1) -- Line: 196 -- upvalues: u251 (upval), Data (val), isCloseToSupplyCart (upval), Signals (upval), Building (upval), UserPlacementHandler (upval), u250 (upval)
                local v1, v2
                local v3 = 0
                local v4 = nil
                if not (u251[Data.name]) then
                    Building.Place.post({location = p1:GetPivot(), asset = "Schematics/" .. Data.path}, v4, v3)
                    UserPlacementHandler.onSuccessfulPlacement()
                    UserPlacementHandler.onEndModelPlacement()
                    p1:Destroy()
                    task.defer(function() -- Line: 243 -- upvalues: u250 (upval)
                        u250 = false
                    end)
                    return
                end
                v1, v2 = isCloseToSupplyCart(p1)
                if not v1 then
                    Signals.Toast:Fire({message = "You are not close enough to any supply carts.", type = "error"})
                    return
                end
                if not v2 then
                    return
                end
                local Attribute = v2:GetAttribute("MaxAmount")
                local Attribute_2 = v2:GetAttribute("Amount")
                if Attribute_2 / Attribute < u251[Data.name] then
                    Signals.Toast:Fire({type = "error", message = "You do not have enough supplies to place this item. You need " .. u251[Data.name] .. " supplies."})
                    return
                end
                Building.Place.post({location = p1:GetPivot(), asset = "Schematics/" .. Data.path}, v2, Attribute_2 - Attribute * u251[Data.name])
                UserPlacementHandler.onSuccessfulPlacement()
                UserPlacementHandler.onEndModelPlacement()
                p1:Destroy()
                task.defer(function() -- Line: 243 -- upvalues: u250 (upval)
                    u250 = false
                end)
            end))
        end))
    end))
end
return {
    equipped = function(p1) -- Line: 251 -- upvalues: u246 (ref), UserInputService (val), u250 (ref), u249 (ref), Players (val), Branches (val), RunService (val), Signals (val), Server (val), openWrenchRadial (val)
        u246 = UserInputService.InputBegan:Connect(function(p1, p2) -- Line: 252 -- upvalues: u250 (upval), u249 (upval), Players (upval), Branches (upval), RunService (upval), Signals (upval), Server (upval), openWrenchRadial (upval)
            if p2 or p1.UserInputType ~= Enum.UserInputType.MouseButton1 or u250 or u249 then
                return
            end
            local Attribute = Players.LocalPlayer:GetAttribute("Branch")
            local Attribute_2 = Players.LocalPlayer:GetAttribute("Rank")
            local v1 = Attribute
            if v1 then
                v1 = Branches.BranchRanks[Attribute]
            end
            local SECTION_COMMANDER = v1
            if SECTION_COMMANDER then
                SECTION_COMMANDER = v1.SECTION_COMMANDER
            end
            if not SECTION_COMMANDER or typeof(Attribute_2) ~= "number" or Attribute_2 >= SECTION_COMMANDER then
                if Server.Store.client().event ~= 1 then
                    Signals.Toast:Fire({message = "Event must be enabled to use this tool.", type = "error"})
                    return
                end
                openWrenchRadial()
                return
            end
            if not (RunService:IsStudio()) then
                Signals.Toast:Fire({message = "You are not authorized to use the wrench.", type = "error"})
                return
            end
            if Server.Store.client().event ~= 1 then
                Signals.Toast:Fire({message = "Event must be enabled to use this tool.", type = "error"})
                return
            end
            openWrenchRadial()
        end)
    end,
    unequipped = function() -- Line: 301 -- upvalues: u246 (ref), UserPlacementHandler (val), u248 (val), Radial (val), u249 (ref), u250 (ref)
        if u246 then
            u246:Disconnect()
            u246 = nil
        end
        UserPlacementHandler.onEndModelPlacement()
        u248:Clean()
        Radial.updateRadialMenu({enabled = false})
        u249 = false
        u250 = false
    end,
    data = v2,
}