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
--                File: ReplicatedStorage.Common.Utilities.Customization
--                               Dumped in 0.00659 seconds
--                          Bytecode version 9  |  57 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local InsertService = game:GetService("InsertService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Customization = v1.Parent.Parent:WaitForChild("Customization")
local Brandings = require(Customization:WaitForChild("Brandings"))
local Customization_2 = v1.Parent.Parent:WaitForChild("Customization")
local Eyebrows = require(Customization_2:WaitForChild("Eyebrows"))
local Customization_3 = v1.Parent.Parent:WaitForChild("Customization")
local Eyes = require(Customization_3:WaitForChild("Eyes"))
local Customization_4 = v1.Parent.Parent:WaitForChild("Customization")
local Mouths = require(Customization_4:WaitForChild("Mouths"))
local Customization_5 = v1.Parent.Parent:WaitForChild("Customization")
local Pants = require(Customization_5:WaitForChild("Pants"))
local Customization_6 = v1.Parent.Parent:WaitForChild("Customization")
local ShifterMarkings = require(Customization_6:WaitForChild("ShifterMarkings"))
local Customization_7 = v1.Parent.Parent:WaitForChild("Customization")
local Shirts = require(Customization_7:WaitForChild("Shirts"))
local Character = require(v1.Parent:WaitForChild("Character"))
local Customization_8 = v1.Parent.Parent:WaitForChild("Customization")
local Extra = require(Customization_8:WaitForChild("Extra"))
local Accessories = require(v1.Parent:WaitForChild("Accessories"))
local Types = v1.Parent.Parent:WaitForChild("Types")
local Branches = require(Types:WaitForChild("Branches")).Branches
local v3 = {
    red = {"neon", "bright"},
    blue = {"neon", "bright", "normal"},
    yellow = {"neon"},
    orange = {"neon"},
    beige = {"neon", "bright"},
    green = {"neon", "bright", "normal"},
    silver = {"neon", "bright"},
    lavender = {"neon", "bright"},
    white = {"neon", "bright", "normal"},
    black = {"neon"},
    pink = {"neon", "bright", "normal"},
    purple = {"neon", "bright", "normal"},
    cyan = {"neon", "bright", "normal"},
    olive = {"neon"},
    coral = {"neon"},
    salmon = {"neon"},
    maroon = {"neon"},
    teal = {"neon", "bright", "normal"},
    lime = {"neon", "bright", "normal"},
    turquoise = {"neon", "bright", "normal"},
    violet = {"neon", "bright", "normal"},
    orchid = {"neon", "bright", "normal"},
    plum = {"neon", "bright", "normal"},
    magenta = {"neon", "bright", "normal"},
    indigo = {"neon", "normal", "bright"},
}
local u233 = {}
local u234 = {AccessoryWeld = true, HeadWeld = true}
local u237 = {Head = true, Torso = true}
u237["Left Arm"] = true
u237["Right Arm"] = true
u237["Left Leg"] = true
u237["Right Leg"] = true
u237.HumanoidRootPart = true
local u245 = {"Scars", "Burns", "Freckles", "Moles"}
local u251 = Shirts.Civilian["White Shirt"]
local u253 = Pants.Civilian["White Slacks"]
local function isCustomizationAccessoryModel(p1) -- Line: 150
    local v1
    if not p1 then
        return false
    end
    if p1:IsA("Model") or p1:IsA("Folder") then
        v1 = p1:GetAttribute("CustomizationAccessory") == true
        return v1
    end
    if not (p1:IsA("Accessory")) then
        return false
    end
    v1 = p1:GetAttribute("CustomizationAccessory") == true
    return v1
end
local function isCustomizationAttachment(p1) -- Line: 162
    local v1
    if not p1 then
        return false
    end
    if p1:IsA("Model") then
        v1 = p1:GetAttribute("Equipment") == true
        return v1
    end
    if not (p1:IsA("Folder")) then
        return false
    end
    v1 = p1:GetAttribute("Equipment") == true
    return v1
end
local function findCharacterAttachment(p1, p2) -- Line: 174 -- upvalues: isCustomizationAccessoryModel (val)
    local v1
    local v2 = p2
    for k, v in pairs(p1:GetDescendants()) do
        if v:IsA("Attachment") and v.Name == v2 then
            v1 = v:FindFirstAncestorWhichIsA("Accessory")
            if not v1 then
                v1 = v:FindFirstAncestorWhichIsA("Model")
            end
            if v1 and isCustomizationAccessoryModel(v1) then
                continue
            end
            return v
        end
    end
    return nil
end
local function getOrLoadAccessoryModel(p1) -- Line: 200 -- upvalues: u233 (val), InsertService (val)
    local Accessory, v1, v2
    local v3 = u233[p1]
    if v3 then
        return v3, (v3:FindFirstChildOfClass("Accessory"))
    end
    v1, v2 = pcall(InsertService.LoadAsset, InsertService, p1)
    if not v1 or not v2 then
        return nil, nil
    end
    Accessory = v2:FindFirstChildOfClass("Accessory")
    if not Accessory then
        v2:Destroy()
        return nil, nil
    end
    u233[p1] = v2
    return v2, Accessory
end
local function _hashString(p1) -- Line: 221
    local v1
    local v2 = 2166136261
    local v3 = #p1
    local v4 = 1
    for i = 1, v3, v4 do
        v1 = string.byte(p1, i)
        v2 = bit32.bxor(v2, v1) * 16777619 % 4294967296
    end
    return v2
end
local function mixHashWithString(p1, p2) -- Line: 232
    local v1
    local v2 = #p2
    local v3 = 1
    local v4 = p1
    for i = 1, v2, v3 do
        v1 = string.byte(p2, i)
        v4 = bit32.bxor(v4, v1) * 16777619 % 4294967296
    end
    return v4
end
local function mixHashWithNumber(p1, p2) -- Line: 241 -- upvalues: mixHashWithString (val)
    return mixHashWithString(p1, (tostring(p2)))
end
local function getAccessoriesOfTypes(p1, p2) -- Line: 328 -- upvalues: Players (val)
    local v1, v2
    v1, v2 = pcall(function() -- Line: 329 -- upvalues: Players (upval), p1 (val)
        return Players:GetHumanoidDescriptionFromUserId(p1.UserId)
    end)
    if not v1 then
        local Name = p1.Name
        local UserId = p1.UserId
        warn((("Failed to get HumanoidDescription for %* (%*): %*"):format(Name, UserId, v2)))
        return {}
    end
    local Accessories = v2:GetAccessories(true)
    local v3 = {}
    local v4 = Accessories
    local v5 = nil
    local v6 = nil
    for i, j in v4, v5, v6 do
        if j.AccessoryType ~= nil and table.find(p2, j.AccessoryType) then
            table.insert(v3, {AccessoryType = j.AccessoryType, AssetId = j.AssetId})
        end
    end
    return v3
end
local function addHairTexture(p1, p2, p3) -- Line: 384
    for k, v in pairs(p1) do
        for k2, i in pairs(v:GetDescendants()) do
            if i:IsA("MeshPart") then
                i.Color = v1
                i.TextureID = v2
            elseif i:IsA("SpecialMesh") then
                i.VertexColor = Vector3.new(v1.R, v1.G, v1.B)
                i.TextureId = v2
            end
        end
    end
end
local function updateAccessoryColors(p1, p2) -- Line: 398
    local SpecialMesh
    local v1 = {}
    local v2 = p2
    for k, v in pairs(p1) do
        v1[v] = {}
        for k2, i in pairs(v:GetDescendants()) do
            if i:IsA("BasePart") then
                SpecialMesh = i:FindFirstChildWhichIsA("SpecialMesh")
                if SpecialMesh and not (v1[v].special) and SpecialMesh.TextureId ~= "" then
                    v1[v].special = SpecialMesh.TextureId
                    SpecialMesh.TextureId = ""
                    SpecialMesh.VertexColor = Vector3.new(v2.R, v2.G, v2.B)
                end
                if i:IsA("MeshPart") and not (v1[v].mesh) and i.TextureID ~= "" then
                    v1[v].mesh = i.TextureID
                    i.TextureID = ""
                    i.Color = v2
                end
                i.Color = v2
            end
        end
    end
    return v1
end
local function clearWeldsFromAccessoryHandle(p1) -- Line: 450
    for i, j in p1:GetChildren() do
        if j:IsA("Weld") then
            j:Destroy()
        elseif not (j:IsA("WeldConstraint")) then
        end
    end
end
local function clearOrphanedAccessoryWeldsFromCharacter(p1) -- Line: 458 -- upvalues: u237 (val), u234 (val)
    for i, j in p1:GetChildren() do
        if j:IsA("BasePart") and u237[j.Name] then
            for k, n in j:GetChildren() do
                if n:IsA("Weld") and u234[n.Name] then
                    n:Destroy()
                end
            end
        end
    end
end
local function disableAccessoryContainerPhysics(p1) -- Line: 472
    for k, v in pairs(p1:GetDescendants()) do
        if v:IsA("BasePart") then
            v.CanQuery = false
            v.CanCollide = false
            v.CanTouch = false
        end
    end
end
local function weldAccessoryHandleToCharacter(p1, p2, p3, p4) -- Line: 482 -- upvalues: findCharacterAttachment (val)
    local Weld = Instance.new("Weld")
    Weld.Name = "AccessoryWeld"
    Weld.Part0 = p2
    if p3 then
        local v1 = findCharacterAttachment(p1, p3.Name)
        if v1 then
            Weld.C0 = p3.CFrame
            Weld.C1 = v1.CFrame
            local Parent = v1.Parent
            if Parent and Parent:IsA("BasePart") then
                Weld.Part1 = Parent
            end
        end
    end
    if Weld.Part1 then
        Weld.Parent = p2
        p2.CFrame = Weld.Part1.CFrame * Weld.C1 * Weld.C0:inverse()
        return Weld
    end
    local Head = p1:FindFirstChild("Head")
    if not Head then
        if not p4 then
            Weld:Destroy()
            return nil
        end
        Weld:Destroy()
        return nil
    end
    Weld.C0 = CFrame.new()
    if not p4 then
        Weld.C1 = CFrame.new(0, Head.Size.Y / 2, 0)
    else
        local v2 = CFrame.new(0, Head.Size.Y / 2, 0)
        Weld.C1 = v2 * p4:Inverse()
    end
    Weld.Part1 = Head
    Weld.Parent = p2
    p2.CFrame = Weld.Part1.CFrame * Weld.C1 * Weld.C0:inverse()
    return Weld
end
local function weldAccessoryHandleToRigFromSource(p1, p2, p3, p4, p5, p6) -- Line: 533 -- upvalues: weldAccessoryHandleToCharacter (val)
    local v1 = weldAccessoryHandleToCharacter(p1, p4, p5, nil)
    if v1 then
        return v1
    end
    if not p6 then
        local Head = p2:FindFirstChild("Head")
        local Head_2 = p1:FindFirstChild("Head")
        local Handle = p3:FindFirstChild("Handle")
        if not Handle then
            Handle = p3:FindFirstChildWhichIsA("BasePart")
        end
        if not Head or not Head_2 or not Handle then
            return nil
        end
        local v2 = Head.CFrame:ToObjectSpace(Handle.CFrame)
        local v3 = Head_2.Size.Y / math.max(Head.Size.Y, 0.001)
        local v4 = CFrame.new(v2.Position * v3)
        local v5 = v4 * (v2 - v2.Position)
        local Weld_2 = Instance.new("Weld")
        Weld_2.Name = "AccessoryWeld"
        Weld_2.Part0 = p4
        Weld_2.Part1 = Head_2
        Weld_2.C0 = CFrame.new()
        Weld_2.C1 = v5
        Weld_2.Parent = p4
        p4.CFrame = Head_2.CFrame * v5
        return Weld_2
    elseif p6.Part1 then
        local v6 = p1:FindFirstChild(p6.Part1.Name)
        if v6 and v6:IsA("BasePart") then
            local Weld = Instance.new("Weld")
            Weld.Name = "AccessoryWeld"
            Weld.Part0 = p4
            Weld.Part1 = v6
            Weld.C0 = p6.C0
            Weld.C1 = p6.C1
            Weld.Parent = p4
            p4.CFrame = v6.CFrame * Weld.C1 * Weld.C0:inverse()
            return Weld
        end
    end
end
local function restoreAccessoryContainerVisibility(p1) -- Line: 589
    for i, j in p1:GetDescendants() do
        if j:IsA("BasePart") then
            j.Transparency = 0
        elseif j:IsA("Decal") then
            j.Transparency = 0
        end
    end
end
local function addCustomizationAccessoryContainerToCharacter(p1, p2, p3) -- Line: 599 -- upvalues: clearWeldsFromAccessoryHandle (val), weldAccessoryHandleToCharacter (val), disableAccessoryContainerPhysics (val)
    local AttachmentPoint
    local Folder = Instance.new("Folder")
    Folder.Name = p2.Name
    Folder:SetAttribute("CustomizationAccessory", true)
    if p3 then
        Folder:SetAttribute("CustomizationAccessoryAssetId", p3)
    end
    Folder.Parent = p1
    local Handle = p2:FindFirstChild("Handle")
    if not Handle then
        Handle = p2:FindFirstChildWhichIsA("BasePart")
    end
    if not Handle then
        Folder:Destroy()
        p2:Destroy()
        return nil
    end
    clearWeldsFromAccessoryHandle(Handle)
    local Attachment = Handle:FindFirstChildWhichIsA("Attachment", true)
    AttachmentPoint = if not Attachment then p2.AttachmentPoint else nil
    for k, v in pairs(p2:GetChildren()) do
        v.Parent = Folder
    end
    if not (weldAccessoryHandleToCharacter(p1, Handle, Attachment, AttachmentPoint)) then
        Folder:Destroy()
        p2:Destroy()
        return nil
    end
    disableAccessoryContainerPhysics(Folder)
    p2:Destroy()
    return Folder
end
local function addCustomizationAccessoryInstanceToCharacter(p1, p2, p3) -- Line: 652 -- upvalues: Accessories (val), disableAccessoryContainerPhysics (val)
    p2:SetAttribute("CustomizationAccessory", true)
    if p3 then
        p2:SetAttribute("CustomizationAccessoryAssetId", p3)
    end
    local Humanoid = p1:FindFirstChildOfClass("Humanoid")
    if not Humanoid then
        Accessories.addAccoutrement(p1, p2)
    else
        Humanoid:AddAccessory(p2)
    end
    disableAccessoryContainerPhysics(p2)
    return p2
end
local function addCustomizationAccessoryToCharacter(p1, p2, p3) -- Line: 673 -- upvalues: addCustomizationAccessoryInstanceToCharacter (val)
    return addCustomizationAccessoryInstanceToCharacter(p1, p2, p3)
end
local function addAccessoryToViewportCharacter(p1, p2) -- Line: 685 -- upvalues: addCustomizationAccessoryToCharacter (val)
    return addCustomizationAccessoryToCharacter(p1, p2, 0)
end
local function addAccessoriesToCharacter(p1, p2, p3, p4) -- Line: 693 -- upvalues: getOrLoadAccessoryModel (val), addCustomizationAccessoryToCharacter (val)
    local v1, v2, v3, v4, v5
    local v6 = {}
    v5, v1 = p3, p1
    for k, v in pairs(p2) do
        _, v2 = getOrLoadAccessoryModel(v.AssetId)
        if v2 then
            v3 = v2:Clone()
            if not v5 then
                v4 = addCustomizationAccessoryToCharacter(v1, v3, v.AssetId)
                if v4 then
                    table.insert(v6, v4)
                end
            else
                v4 = false
                for k2, i in pairs(v5) do
                    if v3.Name:find(i) then
                        v4 = true
                        break
                    end
                end
                if not v4 then
                    v3:Destroy()
                end
            end
        end
    end
    return v6
end
local function clearOptionalFaceExtras(p1) -- Line: 773 -- upvalues: u245 (val)
    local v1
    local v2 = u245
    local v3 = nil
    local v4 = nil
    for i, j in v2, v3, v4 do
        v1 = p1:FindFirstChild(j)
        if v1 then
            v1:Destroy()
        end
    end
end
local function extraTextureAt(p1, p2) -- Line: 783
    local v1 = tonumber(p2) or 1
    v1 = p1[math.clamp(v1, 1, #p1)]
    if not v1 then
        v1 = p1[1]
    end
    return v1
end
local function getExtraTexture(p1, p2) -- Line: 788 -- upvalues: extraTextureAt (val)
    local v1 = tonumber(p2) or 1
    if v1 <= 1 then
        return nil
    end
    local v2 = extraTextureAt(p1, v1)
    if not v2 or v2 == "rbxassetid://000000000000000" then
        return nil
    end
    return v2
end
local function setFaceExtraDecal(p1, p2, p3, p4) -- Line: 802 -- upvalues: getExtraTexture (val)
    local Decal
    local v1 = p1:FindFirstChild(p2)
    local v2 = getExtraTexture(p3, p4)
    if not v2 then
        if v1 then
            v1:Destroy()
        end
        return
    end
    if not v1 then
        Decal = Instance.new("Decal")
    elseif not (v1:IsA("Decal")) then
        Decal = Instance.new("Decal")
    else
        Decal = v1
    end
    Decal.Name = p2
    Decal.Texture = v2
    Decal.Parent = p1
end
local function getFacePanel(p1) -- Line: 853
    return (p1:FindFirstChild("FacePanel"))
end
local u306 = CFrame.new(0, -1.05, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
local function getOrCreateHandBone(p1, p2, p3) -- Line: 983 -- upvalues: u306 (val)
    local v1 = p3 .. "Hand"
    local v2 = p1:FindFirstChild(v1)
    if not v2 then
        local v3
        local v4 = p1:WaitForChild(p3 .. " Arm")
        local Part = Instance.new("Part")
        Part.CanTouch = false
        Part.CanQuery = false
        Part.CanCollide = false
        Part.Massless = true
        Part.Transparency = 1
        Part.Size = Vector3.new(0.2, 0.2, 0.2)
        Part.Name = v1
        Part.Parent = p1
        local v5 = p2:FindFirstChild(v1)
        local v6 = p2:FindFirstChild(p3 .. " Arm")
        if v5 and v6 then
            v6.CFrame:ToObjectSpace(v5.CFrame)
        end
        if not v5 then
            v3 = u306
        elseif not v6 then
            v3 = u306
        else
            v3 = v6.CFrame:ToObjectSpace(v5.CFrame)
        end
        Part.CFrame = v4.CFrame * v3
        local Motor6D = Instance.new("Motor6D")
        Motor6D.C0 = v3
        Motor6D.Part0 = v4
        Motor6D.Part1 = Part
        Motor6D.Name = p3 .. "Handle"
        Motor6D.Parent = v4
        return Part
    elseif v2:IsA("BasePart") then
        return v2
    end
end
local function getGearHandleWeldBone(p1, p2) -- Line: 1020
    local Part0
    if not (p2:IsA("Model")) then
        return nil
    end
    local PrimaryPart = p2.PrimaryPart
    if not PrimaryPart then
        return nil
    end
    for i, j in p1:GetDescendants() do
        if j:IsA("WeldConstraint") and j.Part1 == PrimaryPart then
            Part0 = j.Part0
            if Part0 and Part0:IsDescendantOf(p1) then
                return Part0
            end
        end
    end
    return nil
end
local function isGearHandleUnholstered(p1, p2) -- Line: 1042 -- upvalues: getGearHandleWeldBone (val)
    local v1
    if not (string.find(p2.Name, "Left")) then
        v1 = "Right"
    else
        v1 = "Left"
    end
    local v2 = getGearHandleWeldBone(p1, p2)
    if not v2 then
        return false
    end
    local v3 = v2.Name == v1 .. "Hand"
    return v3
end
local function getHairColorFromCharacter(p1) -- Line: 1052 -- upvalues: isCustomizationAccessoryModel (val)
    for i, j in p1:GetChildren() do
        if isCustomizationAccessoryModel(j) and j:GetAttribute("Equipment") ~= true then
            for k, n in j:GetDescendants() do
                if n:IsA("BasePart") then
                    return n.Color
                end
            end
        end
    end
    return nil
end
local function rigHasVisibleHair(p1) -- Line: 1068 -- upvalues: isCustomizationAccessoryModel (val)
    for i, j in p1:GetChildren() do
        if isCustomizationAccessoryModel(j) and j:GetAttribute("Equipment") ~= true then
            for k, n in j:GetDescendants() do
                if n:IsA("BasePart") and n.Transparency < 1 then
                    return true
                end
            end
        end
    end
    return false
end
local function addPlayerHairToRig(p1, p2, p3) -- Line: 1084 -- upvalues: getAccessoriesOfTypes (val), addAccessoriesToCharacter (val), updateAccessoryColors (val), addHairTexture (val), restoreAccessoryContainerVisibility (val)
    local v1 = {Enum.AccessoryType.Hair}
    local v2 = getAccessoriesOfTypes(p2, v1)
    if #v2 == 0 then
        return
    end
    local v3 = addAccessoriesToCharacter(p1, v2)
    if #v3 == 0 then
        return
    end
    v1 = p3
    if not v1 then
        v1 = Color3.fromRGB(60, 45, 35)
    end
    updateAccessoryColors(v3, v1)
    addHairTexture(v3, v1, "rbxassetid://119283505697797")
    local v4 = v3
    local v5 = nil
    local v6 = nil
    for i, j in v4, v5, v6 do
        restoreAccessoryContainerVisibility(j)
    end
end
local function copyFaceDecalIfPresent(p1, p2, p3, p4) -- Line: 1104
    local v1
    local v2 = p2:FindFirstChild(p3)
    local v3 = p1:FindFirstChild(p3)
    if not v2 or not (v2:IsA("Decal")) then
        if v3 then
            v3:Destroy()
        end
        return
    end
    if not v3 then
        v1 = Instance.new("Decal")
        v1.Name = p3
        v1.Parent = p1
    elseif not (v3:IsA("Decal")) then
        v1 = Instance.new("Decal")
        v1.Name = p3
        v1.Parent = p1
    else
        v1 = v3
    end
    v1.Texture = v2.Texture
    if p4 then
        v1.Color3 = v2.Color3
    end
end
local function decorateRigCopyingRig(p1, p2) -- Line: 1135 -- upvalues: copyFaceDecalIfPresent (val), addCustomizationAccessoryToCharacter (val), isCustomizationAccessoryModel (val), isCustomizationAttachment (val), getOrLoadAccessoryModel (val), isGearHandleUnholstered (val), restoreAccessoryContainerVisibility (val), clearWeldsFromAccessoryHandle (val), getOrCreateHandBone (val), Character (val), disableAccessoryContainerPhysics (val), weldAccessoryHandleToRigFromSource (val)
    local AccessoryWeld, Attachment, Attribute, Attribute_2, Handle, Handle_2, Motor6D, Torso, v1, v2, v3, v4, v5, v6, v7
    local FacePanel = p1:FindFirstChild("FacePanel")
    if not FacePanel then
        FacePanel = p1:FindFirstChild("Decals")
    end
    local FacePanel_2 = p2:FindFirstChild("FacePanel")
    if not FacePanel_2 then
        FacePanel_2 = p2:FindFirstChild("Decals")
    end
    if FacePanel and FacePanel_2 then
        copyFaceDecalIfPresent(FacePanel, FacePanel_2, "Iris", true)
        copyFaceDecalIfPresent(FacePanel, FacePanel_2, "Eyes", true)
        copyFaceDecalIfPresent(FacePanel, FacePanel_2, "Eyebrows")
        copyFaceDecalIfPresent(FacePanel, FacePanel_2, "Mouth")
        copyFaceDecalIfPresent(FacePanel, FacePanel_2, "Scars")
        copyFaceDecalIfPresent(FacePanel, FacePanel_2, "Burns")
        copyFaceDecalIfPresent(FacePanel, FacePanel_2, "Freckles")
        copyFaceDecalIfPresent(FacePanel, FacePanel_2, "Moles")
    end
    local Head = p2:FindFirstChild("Head")
    if Head then
        for i, j in p1:GetChildren() do
            if j:IsA("BasePart") then
                j.Color = Head.Color
            end
        end
    end
    v1, v2 = p1, p2
    for k, v in pairs(p2:GetChildren()) do
        if v:IsA("Accessory") then
            v3 = v:Clone()
            Attribute = v:GetAttribute("CustomizationAccessoryAssetId")
            if typeof(Attribute) ~= "number" then
                v7 = nil
            else
                v7 = Attribute
            end
            addCustomizationAccessoryToCharacter(v1, v3, v7)
        elseif v:IsA("Model") then
            if isCustomizationAccessoryModel(v) then
                if isCustomizationAccessoryModel(v) then
                    Attribute_2 = v:GetAttribute("CustomizationAccessoryAssetId")
                    if typeof(Attribute_2) == "number" and 0 < Attribute_2 then
                        _, v4 = getOrLoadAccessoryModel(Attribute_2)
                        if v4 then
                            v5 = v4:Clone()
                            addCustomizationAccessoryToCharacter(v1, v5, Attribute_2)
                        end
                    end
                elseif v:GetAttribute("Equipment") ~= true then
                    v3 = v:Clone()
                    Handle = v:FindFirstChild("Handle")
                    if not Handle then
                        Handle = v:FindFirstChildWhichIsA("BasePart")
                    end
                    AccessoryWeld = Handle
                    if AccessoryWeld then
                        AccessoryWeld = Handle:FindFirstChild("AccessoryWeld")
                    end
                    if v:GetAttribute("Equipment") ~= true then
                        restoreAccessoryContainerVisibility(v3)
                    end
                    Handle_2 = v3:FindFirstChild("Handle")
                    if not Handle_2 then
                        Handle_2 = v3:FindFirstChildWhichIsA("BasePart")
                    end
                    if Handle_2 then
                        clearWeldsFromAccessoryHandle(Handle_2)
                    end
                    if v:GetAttribute("Equipment") ~= true then
                        if v:GetAttribute("Equipment") == true and string.find(v.Name, "Handle") then
                            assert(v3.PrimaryPart, "Model must have a PrimaryPart to connect to a BasePart")
                            if not (string.find(v.Name, "Left")) then
                                v6 = "Right"
                            else
                                v6 = "Left"
                            end
                            v7 = getOrCreateHandBone(v1, v2, v6)
                            Character.connectModelToBone(v3, {bone = v7, connected = {}})
                            disableAccessoryContainerPhysics(v3)
                        end
                    elseif v.Name == "GearBoxes" then
                        assert(v3.PrimaryPart, "Model must have a PrimaryPart to connect to a BasePart")
                        Torso = v1:WaitForChild("Torso")
                        v3:PivotTo(Torso.CFrame)
                        Motor6D = Instance.new("Motor6D")
                        Motor6D.C0 = CFrame.new()
                        Motor6D.Part0 = Torso
                        Motor6D.Part1 = v3.PrimaryPart
                        Motor6D.Parent = Torso
                    end
                    v3.Parent = v1
                    if v:GetAttribute("Equipment") ~= true and Handle_2 then
                        Attachment = Handle_2:FindFirstChildWhichIsA("Attachment", true)
                        if weldAccessoryHandleToRigFromSource(v1, v2, v, Handle_2, Attachment, AccessoryWeld) then
                            disableAccessoryContainerPhysics(v3)
                        end
                    end
                elseif string.find(v.Name, "Handle") and not (isGearHandleUnholstered(v2, v)) then
                end
            elseif not (isCustomizationAttachment(v)) then
            end
        elseif not (v:IsA("Folder")) then
        end
    end
    local Shirt = v1:FindFirstChildWhichIsA("Shirt")
    local Pants = v1:FindFirstChildWhichIsA("Pants")
    local Shirt_2 = v2:FindFirstChildWhichIsA("Shirt")
    local Pants_2 = v2:FindFirstChildWhichIsA("Pants")
    if Shirt and Shirt_2 then
        Shirt.ShirtTemplate = Shirt_2.ShirtTemplate
    end
    if Pants and Pants_2 then
        Pants.PantsTemplate = Pants_2.PantsTemplate
    end
end
local function getShirtFromName(p1) -- Line: 1321 -- upvalues: Shirts (val)
    for k, v in pairs(Shirts) do
        for k2, i in pairs(v) do
            if k2 == v1 then
                return k, k2
            end
        end
    end
    return nil
end
local function getPantsFromName(p1) -- Line: 1359 -- upvalues: Pants (val)
    local v1, v2
    v1, v2 = string.match(p1, "^([^/]+)/(.+)$")
    if not v1 then
        for k, v in pairs(Pants) do
            for k2, i in pairs(v) do
                if k2 == v3 then
                    return k, k2
                end
            end
        end
        return nil
    elseif v2 then
        local v4 = Pants[v1]
        if v4 and v4[v2] then
            return v1, v2
        end
    end
end
return {
    USE_ACCESSORY_INSTANCES = true,
    getAccessoriesOfTypes = getAccessoriesOfTypes,
    getCurrentWearingHairs = function(p1) -- Line: 360 -- upvalues: getAccessoriesOfTypes (val)
        local v1 = {Enum.AccessoryType.Hair}
        return (getAccessoriesOfTypes(p1, v1))
    end,
    addAccessoriesToCharacter = addAccessoriesToCharacter,
    removeAccessoryColors = function(p1) -- Line: 427
        local SpecialMesh
        local v1 = {}
        for k, v in pairs(p1) do
            for k2, i in pairs(v:GetDescendants()) do
                if i:IsA("BasePart") then
                    SpecialMesh = i:FindFirstChildWhichIsA("SpecialMesh")
                    if SpecialMesh then
                        SpecialMesh.TextureId = ""
                        table.insert(v1, i)
                    end
                    if i:IsA("MeshPart") then
                        i.TextureID = ""
                    end
                end
            end
        end
        return v1
    end,
    updateAccessoryColors = updateAccessoryColors,
    restoreAccessoryTextures = function(p1) -- Line: 365
        local SpecialMesh
        for k, v in pairs(p1) do
            for k2, i in pairs(k:GetDescendants()) do
                if i:IsA("BasePart") then
                    SpecialMesh = i:FindFirstChildWhichIsA("SpecialMesh")
                    if SpecialMesh and v.special then
                        SpecialMesh.TextureId = v.special
                    end
                    if i:IsA("MeshPart") and v.mesh then
                        i.TextureID = v.mesh
                    end
                end
            end
        end
    end,
    loadAdditionalAccessories = function(p1, p2) -- Line: 735 -- upvalues: getOrLoadAccessoryModel (val), addCustomizationAccessoryToCharacter (val)
        local v1, v2, v3
        local v4 = {}
        local v5 = p2
        local v6 = nil
        local v7 = nil
        for i, j in v5, v6, v7 do
            _, v3 = getOrLoadAccessoryModel(j)
            if v3 then
                v1 = v3:Clone()
                v2 = addCustomizationAccessoryToCharacter(p1, v1, j)
                if v2 then
                    table.insert(v4, v2)
                end
            end
        end
        return v4
    end,
    addHairTexture = addHairTexture,
    setFacialBrandings = function(p1, p2) -- Line: 889 -- upvalues: getFacePanel (val), Brandings (val)
        local Decal, v1
        local v2 = getFacePanel(p1)
        for i, j in v2:GetChildren() do
            if j:HasTag("Branding") then
                j:Destroy()
            end
        end
        local v3 = p2
        local v4 = nil
        local v5 = nil
        for k, n in v3, v4, v5 do
            v1 = Brandings[n]
            if v1 then
                Decal = Instance.new("Decal")
                Decal.ColorMap = v1
                Decal.Parent = v2
                Decal.Name = n
                Decal:AddTag("Branding")
            end
        end
    end,
    getFacialBrandings = function(p1) -- Line: 922 -- upvalues: getFacePanel (val)
        local v1 = getFacePanel(p1)
        if not v1 then
            return {}
        end
        local v2 = {}
        for i, j in v1:GetChildren() do
            if j:HasTag("Branding") then
                table.insert(v2, j.Name)
            end
        end
        return v2
    end,
    updateShifterMarking = function(p1, p2, p3) -- Line: 945 -- upvalues: ShifterMarkings (val)
        local ShifterMarking = p1:FindFirstChild("ShifterMarking")
        if ShifterMarking then
            ShifterMarking:Destroy()
        end
        local v1 = ShifterMarkings.getMarkingTransparency(p3)
        if v1 == nil then
            return
        end
        local v2 = ShifterMarkings.getMarkingTexture(p2)
        if not v2 then
            return
        end
        local Decal = Instance.new("Decal")
        Decal.Name = "ShifterMarking"
        Decal.ColorMap = v2
        Decal.Transparency = v1
        Decal.ZIndex = -1
        Decal:AddTag("ShifterMarking")
        Decal.Parent = p1
    end,
    getRandomHairColor = function() -- Line: 1451
        local v1 = {}
        local v2 = Color3.fromRGB(60, 49, 30)
        local v3 = Color3.fromRGB(82, 82, 82)
        local v4 = Color3.fromRGB(18, 18, 18)
        v1[1] = v2
        v1[2] = v3
        v1[3] = v4
        v1[4] = Color3.fromRGB(206, 191, 133)
        return v1[math.random(1, #v1)]
    end,
    createFacePanel = function(p1, p2) -- Line: 819 -- upvalues: ReplicatedStorage (val), clearOptionalFaceExtras (val)
        local FacePanel = p1:FindFirstChild("FacePanel")
        if FacePanel then
            FacePanel:Destroy()
        end
        local v1 = Vector3.new(1.285, 1.217, 1.355)
        local v2 = CFrame.new(-0.000999450684, 0.02, 0.0729999542, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        local v3 = (0.5 - (p2 or 0.5)) / 6
        local Decal = p1:WaitForChild("Head"):FindFirstChildWhichIsA("Decal")
        if Decal then
            Decal:Destroy()
        end
        v3 = ReplicatedStorage.Assets.Meshes.Decals:Clone()
        v3.Size = v1
        v3.CFrame = p1.Head.CFrame * (v2 * CFrame.new(0, v3, 0))
        local WeldConstraint = Instance.new("WeldConstraint")
        WeldConstraint.Part0 = p1.Head
        WeldConstraint.Part1 = v3
        WeldConstraint.Parent = v3
        v3.Parent = p1
        v3.Name = "FacePanel"
        clearOptionalFaceExtras(v3)
        return v3
    end,
    updateFacePanel = function(p1, p2) -- Line: 857 -- upvalues: Eyes (val), Eyebrows (val), Mouths (val), setFaceExtraDecal (val), Extra (val)
        local v1 = tonumber(p2.Eyes.Type) or 1
        local v2 = math.clamp(v1, 1, #Eyes)
        v1 = Eyes[v2]
        local v3 = tonumber(p2.Eyes.Frame) or 1
        local v4 = math.clamp(v3, 1, #v1.Frames)
        local v5 = tonumber(p2.Eyebrow) or 1
        v3 = math.clamp(v5, 1, #Eyebrows)
        v5 = Eyebrows[v3]
        local v6 = tonumber(p2.Mouth) or 1
        local v7 = math.clamp(v6, 1, #Mouths.Mouths)
        v6 = Mouths.Mouths[v7]
        p1.Iris.Texture = v1.Iris
        p1.Eyes.Texture = v1.Frames[v4]
        p1.Iris.Color3 = Color3.fromRGB(p2.Eyes.Color.R, p2.Eyes.Color.G, p2.Eyes.Color.B)
        p1.Eyebrows.Texture = v5
        if v6 then
            p1.Mouth.Texture = v6
        end
        setFaceExtraDecal(p1, "Scars", Extra.Scars, p2.Scars)
        setFaceExtraDecal(p1, "Burns", Extra.Burns, p2.Burns)
        setFaceExtraDecal(p1, "Freckles", Extra.Freckles, p2.Freckles)
        setFaceExtraDecal(p1, "Moles", Extra.Moles, p2.Moles)
    end,
    setFaceExtraDecal = setFaceExtraDecal,
    setCustomEyes = function(p1, p2) -- Line: 975
        p1.Iris.Transparency = 1
        p1.Eyes.Transparency = 0
        p1.Eyes.Texture = p2
    end,
    getFacePanel = getFacePanel,
    updateSkinComplexion = function(p1, p2) -- Line: 1291
        local v1, v2, v3
        local v4 = Color3.fromRGB(206, 156, 127)
        v2, v3 = Color3.toHSV(v4)
        local v5 = math.clamp(p2, 0.25, 0.975)
        local v6 = Color3.fromHSV(v2, v3, v5)
        local v7 = {
            "Left Arm",
            "Right Arm",
            "Left Leg",
            "Right Leg",
            "Torso",
            "Head",
        }
        local v8 = nil
        local v9 = nil
        for i, j in v7, v8, v9 do
            v1 = p1:FindFirstChild(j)
            if v1 and v1:IsA("BasePart") then
                v1.Color = v6
            end
        end
    end,
    updateOutfit = function(p1, p2) -- Line: 1417 -- upvalues: Shirts (val), u251 (val), Pants (val), u253 (val)
        local v1, v2
        local Shirt = p1:FindFirstChildWhichIsA("Shirt")
        if not Shirt then
            Shirt = Instance.new("Shirt")
        end
        Shirt.Name = "Shirt"
        Shirt.Parent = p1
        local Pants_2 = p1:FindFirstChildWhichIsA("Pants")
        if not Pants_2 then
            Pants_2 = Instance.new("Pants")
        end
        Pants_2.Name = "Pants"
        Pants_2.Parent = p1
        if not p2.Shirt.Custom then
            v1 = Shirts[p2.Shirt.Category]
            v2 = v1
            if v2 then
                v2 = v1[p2.Shirt.Name]
            end
            if not v2 then
                Shirt.ShirtTemplate = u251
            else
                Shirt.ShirtTemplate = v2
            end
        else
            Shirt.ShirtTemplate = p2.Shirt.Custom
        end
        if p2.Pants.Custom then
            Pants_2.PantsTemplate = p2.Pants.Custom
            return
        end
        v1 = Pants[p2.Pants.Category]
        v2 = v1
        if v2 then
            v2 = v1[p2.Pants.Name]
        end
        if v2 then
            Pants_2.PantsTemplate = v2
            return
        end
        Pants_2.PantsTemplate = u253
    end,
    getShirtFromName = getShirtFromName,
    getShirtFromNameForBranch = function(p1, p2) -- Line: 1335 -- upvalues: Branches (val), Shirts (val), getShirtFromName (val)
        local v1 = nil
        if p2 == Branches.SCOUTING_LEGION then
            v1 = "Scouting Legion"
        elseif p2 == Branches.MILITARY_POLICE then
            v1 = "Military Police"
        elseif p2 == Branches.STATIONARY_GUARD then
            v1 = "Stationary Guard"
        elseif p2 == Branches.TRAINEE_CORPS then
            v1 = "Trainee Corps"
        elseif p2 == Branches.CIVILIAN then
            v1 = "Civilian"
        end
        if not v1 then
            return getShirtFromName(p1)
        end
        local v2 = Shirts[v1]
        if not v2 then
            return getShirtFromName(p1)
        end
        if v2[p1] then
            return v1, p1
        end
        return getShirtFromName(p1)
    end,
    getPantsFromName = getPantsFromName,
    getPantsFromNameForBranch = function(p1, p2) -- Line: 1382 -- upvalues: Pants (val), Branches (val), getPantsFromName (val)
        local v1, v2, v3
        v1, v2 = string.match(p1, "^([^/]+)/(.+)$")
        if not v1 then
            v3 = nil
            if p2 == Branches.SCOUTING_LEGION then
                v3 = "White Military Pants"
            elseif p2 == Branches.MILITARY_POLICE then
                v3 = "White Military Pants"
            elseif p2 == Branches.STATIONARY_GUARD then
                v3 = "White Military Pants"
            elseif p2 == Branches.TRAINEE_CORPS then
                v3 = "Training Instructors"
            elseif p2 == Branches.CIVILIAN then
                v3 = "Civilian"
            elseif p2 == Branches.GOVERNMENT then
                v3 = "Formal Uniform"
            end
            if not v3 then
                return getPantsFromName(p1)
            end
            local v4 = Pants[v3]
            if not v4 then
                return getPantsFromName(p1)
            end
            if v4[p1] then
                return v3, p1
            end
            return getPantsFromName(p1)
        elseif v2 then
            v3 = Pants[v1]
            if v3 and v3[v2] then
                return v1, v2
            end
        end
    end,
    clearCharacterAccessories = function(p1) -- Line: 753 -- upvalues: isCustomizationAccessoryModel (val), clearOrphanedAccessoryWeldsFromCharacter (val)
        for k, v in pairs(p1:GetDescendants()) do
            if isCustomizationAccessoryModel(v) then
                v:Destroy()
            end
        end
        clearOrphanedAccessoryWeldsFromCharacter(p1)
    end,
    addAccessoryToViewportFrameRig = function(p1, p2) -- Line: 689 -- upvalues: addAccessoryToViewportCharacter (val)
        addAccessoryToViewportCharacter(p1, p2)
    end,
    createCharacterIdentifier = function(p1) -- Line: 246 -- upvalues: isCustomizationAccessoryModel (val), mixHashWithString (val), mixHashWithNumber (val)
        local BasePart, v1, v2, v3, v4, v5, v6, v7, v8
        local v9 = 0
        local v10 = 2166136261
        for k, v in pairs(p1:GetDescendants()) do
            if isCustomizationAccessoryModel(v) then
                v10 = mixHashWithString(v10, v.Name)
                BasePart = v:FindFirstChildWhichIsA("BasePart")
                if BasePart then
                    v1 = math.floor(BasePart.Color.R * 255 + 0.5)
                    v8 = math.clamp(v1, 0, 255)
                    v2 = math.floor(BasePart.Color.G * 255 + 0.5)
                    v1 = math.clamp(v2, 0, 255)
                    v3 = math.floor(BasePart.Color.B * 255 + 0.5)
                    v2 = math.clamp(v3, 0, 255)
                    v9 = v9 + (v8 * 65536 + v1 * 256 + v2)
                    v10 = mixHashWithNumber(v10, v8)
                    v10 = mixHashWithNumber(v10, v1)
                    v10 = mixHashWithNumber(v10, v2)
                end
            end
        end
        local FacePanel = p1:FindFirstChild("FacePanel")
        if FacePanel then
            local Eyebrows = FacePanel:FindFirstChild("Eyebrows")
            if Eyebrows then
                v7 = string.gsub(Eyebrows.Texture, "rbxassetid://", "")
                v4 = tonumber((string.sub(v7, 1, 8))) or 0
                v9 = v9 + v4
                v10 = mixHashWithNumber(v10, v4)
            end
            local Eyes = FacePanel:FindFirstChild("Eyes")
            if Eyes then
                v8 = string.gsub(Eyes.Texture, "rbxassetid://", "")
                v5 = tonumber((string.sub(v8, 1, 8))) or 0
                v9 = v9 + v5
                v10 = mixHashWithNumber(v10, v5)
            end
            local Mouth = FacePanel:FindFirstChild("Mouth")
            if Mouth then
                v1 = string.gsub(Mouth.Texture, "rbxassetid://", "")
                v6 = tonumber((string.sub(v1, 1, 8))) or 0
                v9 = v9 + v6
                v10 = mixHashWithNumber(v10, v6)
            end
            local Iris = FacePanel:FindFirstChild("Iris")
            if Iris then
                v2 = string.gsub(Iris.Texture, "rbxassetid://", "")
                v7 = tonumber((string.sub(v2, 1, 8))) or 0
                v10 = mixHashWithNumber(v10, v7)
                v1 = math.floor(Iris.Color3.R * 255 + 0.5)
                v8 = math.clamp(v1, 0, 255)
                v2 = math.floor(Iris.Color3.G * 255 + 0.5)
                v1 = math.clamp(v2, 0, 255)
                v3 = math.floor(Iris.Color3.B * 255 + 0.5)
                v2 = math.clamp(v3, 0, 255)
                v9 = v9 + v7 + (v8 * 65536 + v1 * 256 + v2)
                v10 = mixHashWithNumber(v10, v8)
                v10 = mixHashWithNumber(v10, v1)
                v10 = mixHashWithNumber(v10, v2)
            end
        end
        local Shirt = p1:FindFirstChild("Shirt")
        if Shirt then
            v7 = string.gsub(Shirt.ShirtTemplate, "rbxassetid://", "")
            v4 = tonumber((string.sub(v7, 1, 5))) or 0
            v9 = v9 + v4
            v10 = mixHashWithNumber(v10, v4)
        end
        local Pants = p1:FindFirstChild("Pants")
        if Pants then
            v8 = string.gsub(Pants.PantsTemplate, "rbxassetid://", "")
            v5 = tonumber((string.sub(v8, 1, 5))) or 0
            v9 = v9 + v5
            v10 = mixHashWithNumber(v10, v5)
        end
        v5 = tostring((math.floor(v9)))
        v6 = string.format("%08x", v10)
        return v5 .. v6
    end,
    decorateRigCopyingRig = decorateRigCopyingRig,
    decorateRigFromPlayer = function(p1, p2) -- Line: 1277 -- upvalues: decorateRigCopyingRig (val), rigHasVisibleHair (val), getHairColorFromCharacter (val), addPlayerHairToRig (val)
        local v1
        local Character = p2.Character
        if Character then
            decorateRigCopyingRig(p1, Character)
        end
        if rigHasVisibleHair(p1) then
            return
        end
        if not Character then
            v1 = nil
        else
            v1 = getHairColorFromCharacter(Character)
        end
        addPlayerHairToRig(p1, p2, v1)
    end,
    BANNED_COLORS = v3,
}