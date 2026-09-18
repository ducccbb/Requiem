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
-- File: ReplicatedStorage.Client.Interfaces.Routes.Interactions.Types.Economy.Farmland
--                               Dumped in 0.00321 seconds
--                          Bytecode version 9  |  27 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Inventory = require(Namespaces:WaitForChild("Inventory"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Network_2 = Common_2:WaitForChild("Network")
local Namespaces_2 = Network_2:WaitForChild("Namespaces")
local Interaction = require(Namespaces_2:WaitForChild("Interaction"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Observers = Common_3:WaitForChild("Observers")
local useAnimatorObserver = require(Observers:WaitForChild("useAnimatorObserver"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_4:WaitForChild("Common")
local Animations = Common_4:WaitForChild("Animations")
local Default = require(Animations:WaitForChild("Default"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_5:WaitForChild("Common")
local Animations_2 = Common_5:WaitForChild("Animations")
local Tools = Animations_2:WaitForChild("Tools")
local u128 = require(Tools:WaitForChild("Seed Bag"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_6:WaitForChild("Client")
local User = Client:WaitForChild("User")
local Equipment = User:WaitForChild("Equipment")
local Tools_2 = Equipment:WaitForChild("Tools")
local ClientInventoryHandler = require(Tools_2:WaitForChild("ClientInventoryHandler"))
local function farmlandModelFromPart(p1) -- Line: 24
    return p1:FindFirstAncestorOfClass("Model")
end
local function equippedToolName() -- Line: 28 -- upvalues: Inventory (val), Players (val), ClientInventoryHandler (val)
    local value
    local v1 = Inventory.Tool.get(Players.LocalPlayer)
    if not v1 then
        value = v1
    else
        value = v1.value
        if not value then
            value = v1
        end
    end
    if not value or value.hash == 0 then
        return nil
    end
    local v2 = ClientInventoryHandler.getItemNameFromHash(value.hash)
    if not v2 or v2 == "" then
        return nil
    end
    return v2
end
local function hasSeedBagEquipped() -- Line: 43 -- upvalues: equippedToolName (val)
    local v1 = equippedToolName()
    local v2 = if v1 ~= nil then string.match(v1, " Seed$") ~= nil else false
    return v2
end
local function isHarvestReadyOnPlot(p1) -- Line: 48 -- upvalues: farmlandModelFromPart (val)
    local v1 = farmlandModelFromPart(p1)
    local v2 = if v1 ~= nil then v1:GetAttribute("HarvestReady") == true else false
    return v2
end
local function isPlotTilled(p1) -- Line: 53 -- upvalues: farmlandModelFromPart (val)
    local v1 = farmlandModelFromPart(p1)
    local v2 = if v1 ~= nil then v1:GetAttribute("Tilled") == true else false
    return v2
end
local function isPlotEmptyForPlanting(p1) -- Line: 58 -- upvalues: farmlandModelFromPart (val)
    local v1 = farmlandModelFromPart(p1)
    if not v1 or v1:GetAttribute("Tilled") ~= true then
        return false
    end
    local Attribute = v1:GetAttribute("CropType")
    if Attribute == nil or Attribute == "" then
        return true
    end
    local v2 = string.lower(Attribute)
    local v3 = if v2 ~= "blank" then v2 == "fallow" else true
    return v3
end
local v2 = {
    header = function(p1) -- Line: 74 -- upvalues: isHarvestReadyOnPlot (val)
        if isHarvestReadyOnPlot(p1) then
            return "Harvest"
        end
        return "Farmland"
    end,
    body = function(p1) -- Line: 81 -- upvalues: isHarvestReadyOnPlot (val)
        if isHarvestReadyOnPlot(p1) then
            return "Press \"%s\" to harvest."
        end
        return "Press \"%s\" to plant."
    end,
    visible = function(p1) -- Line: 88 -- upvalues: isPlotTilled (val), isHarvestReadyOnPlot (val), hasSeedBagEquipped (val), isPlotEmptyForPlanting (val)
        if not (isPlotTilled(p1)) then
            return false
        end
        if isHarvestReadyOnPlot(p1) then
            return true
        end
        local v1 = hasSeedBagEquipped()
        if v1 then
            v1 = isPlotEmptyForPlanting(p1)
        end
        return v1
    end,
}
local function resolveSeedBagVisualHost(p1) -- Line: 100 -- upvalues: equippedToolName (val)
    local v1 = equippedToolName()
    if not v1 then
        return nil
    end
    local v2 = p1:FindFirstChild(v1)
    if not v2 then
        local v3
        local v4 = v1:gsub(" ", "")
        if v4 == v1 then
            v3 = p1:FindFirstChild("attachment_" .. v1)
            if v3 then
                return v3
            end
            local v5 = {}
            for i, j in p1:GetChildren() do
                if j:IsA("Model") and string.match(j.Name, " Seed$") then
                    table.insert(v5, j)
                end
            end
            if #v5 == 1 then
                return v5[1]
            end
            return nil
        else
            v3 = p1:FindFirstChild(v4)
            if v3 and v3:IsA("Model") then
                return v3
            end
        end
    elseif v2:IsA("Model") then
        return v2
    end
end
local function findSeedSpreadEmitterInRoot(p1) -- Line: 139
    local Folder = p1:FindFirstChild("Folder")
    if not Folder then
        Folder = p1:FindFirstChild("Folder", true)
    end
    if not Folder then
        return nil
    end
    local Seed = Folder:FindFirstChild("Seed")
    if not Seed then
        Seed = Folder:FindFirstChild("Seed", true)
    end
    if not Seed then
        return nil
    end
    local Seeds = Seed:FindFirstChild("Seeds")
    if not Seeds then
        return nil
    end
    if Seeds:IsA("ParticleEmitter") then
        return Seeds
    end
    local Seeds_2 = Seeds:FindFirstChild("Seeds")
    if not Seeds_2 then
        return nil
    end
    if Seeds_2:IsA("ParticleEmitter") then
        return Seeds_2
    end
    return nil
end
local function resolveSpreadWorldCFrame(p1, p2) -- Line: 167
    if not p2 then
        return p1.CFrame * CFrame.new(0, 0.5, 0)
    end
    local Folder = p2:FindFirstChild("Folder")
    if not Folder then
        Folder = p2:FindFirstChild("Folder", true)
    end
    local Seed = Folder
    if Seed then
        Seed = Folder:FindFirstChild("Seed")
        if not Seed then
            Seed = Folder:FindFirstChild("Seed", true)
        end
    end
    if not Seed then
        return p1.CFrame * CFrame.new(0, 0.5, 0)
    end
    if Seed:IsA("BasePart") then
        return Seed.CFrame
    end
    return p1.CFrame * CFrame.new(0, 0.5, 0)
end
local function spawnTransientSeedBagVfxClone(p1, p2) -- Line: 179 -- upvalues: Workspace (val), findSeedSpreadEmitterInRoot (val)
    local u4 = p1:Clone()
    u4.Name = "SeedSpreadVFX"
    for i, j in u4:GetDescendants() do
        if j:IsA("BasePart") then
            j.Anchored = true
            j.CanCollide = false
            j.CanQuery = false
            j.CanTouch = false
            j.Transparency = 1
            j.Massless = false
        end
    end
    u4.Parent = Workspace
    u4:PivotTo(p2)
    local v1 = findSeedSpreadEmitterInRoot(u4)
    if not v1 then
        u4:Destroy()
        return
    end
    v1:Emit((v1:GetAttribute("EmitCount")))
    local v2 = math.max(4, v1.Lifetime.Max + 2)
    task.delay(v2, function() -- Line: 207 -- upvalues: u4 (val)
        if u4.Parent then
            u4:Destroy()
        end
    end)
end
local function playSeedSpreadVfx(p1, p2, p3) -- Line: 214 -- upvalues: ClientInventoryHandler (val), resolveSeedBagVisualHost (val), resolveSpreadWorldCFrame (val), spawnTransientSeedBagVfxClone (val)
    if not p1 or p1 == "" then
        return
    end
    local v1 = ClientInventoryHandler.getItemModelFromName(p1)
    if not v1 then
        return
    end
    local v2 = resolveSeedBagVisualHost(p2)
    local v3 = resolveSpreadWorldCFrame(p3, v2)
    spawnTransientSeedBagVfxClone(v1, v3)
end
local u171 = false
local u172 = false
local function runDeferredHarvestInteraction(p1) -- Line: 232 -- upvalues: u172 (ref), Players (val), Interaction (val), useAnimatorObserver (val), Default (val)
    if u172 then
        return
    end
    u172 = true
    local Character = Players.LocalPlayer.Character
    if not Character or not (Character:FindFirstChildWhichIsA("Humanoid")) then
        u172 = false
        Interaction.Event.unreliablePost(p1)
        return
    end
    local u10 = nil
    if not (pcall(function() -- Line: 246 -- upvalues: u10 (ref), useAnimatorObserver (upval), Character (val), Default (upval)
    u10 = useAnimatorObserver.playAnimationOnRig(Character, Default.Harvest, 0.1, Enum.AnimationPriority.Action)
    return
end)) or not u10 then
        u172 = false
        Interaction.Event.unreliablePost(p1)
        return
    end
    local u14 = false
    local function commit() -- Line: 257 -- upvalues: u14 (ref), Interaction (upval), p1 (val)
        if u14 then
            return
        end
        u14 = true
        Interaction.Event.unreliablePost(p1)
    end
    useAnimatorObserver.onKeyframeReachedSwitch(u10, {
        Harvested = function() -- Line: 266 -- upvalues: commit (val)
            commit()
        end,
    })
    u10.Stopped:Once(function() -- Line: 271 -- upvalues: commit (val), u172 (upval)
        commit()
        u172 = false
    end)
end
local function runDeferredPlantInteraction(p1) -- Line: 277 -- upvalues: u171 (ref), Players (val), Interaction (val), useAnimatorObserver (val), u128 (val), equippedToolName (val), playSeedSpreadVfx (val)
    if u171 then
        return
    end
    u171 = true
    local Character = Players.LocalPlayer.Character
    if not Character or not (Character:FindFirstChildWhichIsA("Humanoid")) then
        u171 = false
        Interaction.Event.unreliablePost(p1)
        return
    end
    local u10 = nil
    if not (pcall(function() -- Line: 291 -- upvalues: u10 (ref), useAnimatorObserver (upval), Character (val), u128 (upval)
    u10 = useAnimatorObserver.playAnimationOnRig(Character, u128.Spread, 0.1, Enum.AnimationPriority.Action)
    return
end)) or not u10 then
        u171 = false
        Interaction.Event.unreliablePost(p1)
        return
    end
    local u15 = equippedToolName()
    local u16 = false
    local function commit(a1) -- Line: 304 -- upvalues: u16 (ref), playSeedSpreadVfx (upval), u15 (val), Character (val), p1 (val), Interaction (upval)
        if u16 then
            return
        end
        u16 = true
        if a1 then
            playSeedSpreadVfx(u15, Character, p1)
        end
        Interaction.Event.unreliablePost(p1)
    end
    useAnimatorObserver.onKeyframeReachedSwitch(u10, {
        SeedSpreadVFXStart = function() -- Line: 316 -- upvalues: commit (val)
            commit(true)
        end,
    })
    u10.Stopped:Once(function() -- Line: 321 -- upvalues: commit (val), u171 (upval)
        commit(false)
        u171 = false
    end)
end
return {
    interacted = function(p1, p2) -- Line: 327 -- upvalues: isPlotTilled (val), isHarvestReadyOnPlot (val), isPlotEmptyForPlanting (val), hasSeedBagEquipped (val), runDeferredPlantInteraction (val), runDeferredHarvestInteraction (val), Interaction (val)
        local v1 = isPlotTilled(p1)
        if v1 then
            v1 = not isHarvestReadyOnPlot(p1)
            if v1 then
                v1 = isPlotEmptyForPlanting(p1)
                if v1 then
                    v1 = hasSeedBagEquipped()
                end
            end
        end
        local v2 = isPlotTilled(p1)
        if v2 then
            v2 = isHarvestReadyOnPlot(p1)
        end
        if v1 then
            runDeferredPlantInteraction(p1)
            return
        end
        if v2 then
            runDeferredHarvestInteraction(p1)
            return
        end
        Interaction.Event.unreliablePost(p1)
    end,
    display = v2,
}