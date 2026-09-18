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
--            File: ReplicatedStorage.Common.Utilities.AnimalSkinInteraction
--                              Dumped in 0.000565 seconds
--                          Bytecode version 9  |  7 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local CollectionService = game:GetService("CollectionService")
local u21 = Color3.fromRGB(189, 137, 102)
local function findSkinInteractionPart(p1) -- Line: 18
    if not p1 then
        return nil
    end
    for i, j in p1:GetDescendants() do
        if j:IsA("BasePart") and j:GetAttribute("Type") == "Skin" then
            return j
        end
    end
    return nil
end
local function disableSkinInteraction(p1) -- Line: 56 -- upvalues: findSkinInteractionPart (val), CollectionService (val)
    local v1 = findSkinInteractionPart(p1)
    if not v1 then
        return
    end
    v1:SetAttribute("Skinned", true)
    v1:SetAttribute("Dead", nil)
    v1:SetAttribute("Busy", nil)
    if CollectionService:HasTag(v1, "Interaction") then
        CollectionService:RemoveTag(v1, "Interaction")
    end
end
local function applySkinnedAppearance(p1) -- Line: 75 -- upvalues: u21 (val)
    if not p1 then
        return
    end
    for i, j in p1:GetDescendants() do
        if j:IsA("BasePart") and not (j:HasTag("Collider")) then
            j.Color = u21
        end
    end
end
local function getAnimalModelsFromInteraction(p1) -- Line: 91
    local v1 = nil
    local v2 = nil
    local Parent = p1
    local v3 = 10
    local v4 = 1
    for i = 1, v3, v4 do
        if not Parent then
            break
        end
        if Parent:IsA("Model") then
            if Parent:HasTag("Animal") then
                v1 = Parent
            end
            if tonumber(Parent.Name) then
                v2 = Parent
            end
        end
        Parent = Parent.Parent
    end
    return v1, v2
end
return {
    SKINNED_COLOR = u21,
    enableSkinInteraction = function(p1) -- Line: 36 -- upvalues: findSkinInteractionPart (val), CollectionService (val)
        local v1 = findSkinInteractionPart(p1)
        if not v1 then
            return
        end
        v1:SetAttribute("Dead", true)
        v1:SetAttribute("Skinned", nil)
        v1:SetAttribute("Moveable", true)
        if CollectionService:HasTag(v1, "Interaction") then
            CollectionService:RemoveTag(v1, "Interaction")
        end
        CollectionService:AddTag(v1, "Interaction")
    end,
    disableSkinInteraction = disableSkinInteraction,
    applySkinnedAppearance = applySkinnedAppearance,
    getAnimalModelsFromInteraction = getAnimalModelsFromInteraction,
    onBearSkinnedFromInteraction = function(p1) -- Line: 121 -- upvalues: getAnimalModelsFromInteraction (val), disableSkinInteraction (val), applySkinnedAppearance (val)
        local v1, v2
        v1, v2 = getAnimalModelsFromInteraction(p1)
        disableSkinInteraction(v1)
        disableSkinInteraction(v2)
        applySkinnedAppearance(v1)
    end,
}