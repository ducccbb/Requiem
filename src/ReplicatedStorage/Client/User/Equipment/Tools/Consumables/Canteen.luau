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
--        File: ReplicatedStorage.Client.User.Equipment.Tools.Consumables.Canteen
--                               Dumped in 0.00140 seconds
--                          Bytecode version 9  |  12 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local CollectionService = game:GetService("CollectionService")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Animations = Common:WaitForChild("Animations")
local Tools = Animations:WaitForChild("Tools")
local Canteen = require(Tools:WaitForChild("Canteen"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Observers = Common_2:WaitForChild("Observers")
local useAnimatorObserver = require(Observers:WaitForChild("useAnimatorObserver"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Utilities = Common_3:WaitForChild("Utilities")
local Character = require(Utilities:WaitForChild("Character"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_4:WaitForChild("Common")
local Utilities_2 = Common_4:WaitForChild("Utilities")
local Emotes = require(Utilities_2:WaitForChild("Emotes"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_5:WaitForChild("Common")
local Types = Common_5:WaitForChild("Types")
local Item = require(Types:WaitForChild("Item"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_6:WaitForChild("Common")
local Network = Common_6:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Inventory = require(Namespaces:WaitForChild("Inventory"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_7 = ReplicatedStorage_7:WaitForChild("Common")
local Network_2 = Common_7:WaitForChild("Network")
local Namespaces_2 = Network_2:WaitForChild("Namespaces")
local Vitality = require(Namespaces_2:WaitForChild("Vitality"))
local u173 = {Idle = Canteen.DrinkIdle, Drink = Canteen.Drink, Refill = Canteen.Refill}
local v2 = {description = "A leather canteen that stores water. Drink to quench thirst, or click a nearby water source to refill it.", category = Item.CATEGORIES.Consumables}
local function getWaterPart(p1) -- Line: 48 -- upvalues: CollectionService (val)
    local Parent = p1
    while Parent do
        if Parent:IsA("BasePart") and CollectionService:HasTag(Parent, "Water") then
            return Parent
        end
        Parent = Parent.Parent
    end
    return nil
end
local function raycastToWater() -- Line: 62 -- upvalues: UserInputService (val), Players (val), getWaterPart (val)
    local CurrentCamera = workspace.CurrentCamera
    if not CurrentCamera then
        return nil, nil
    end
    local MouseLocation = UserInputService:GetMouseLocation()
    local v1 = CurrentCamera:ViewportPointToRay(MouseLocation.X, MouseLocation.Y)
    local v2 = RaycastParams.new()
    v2.FilterType = Enum.RaycastFilterType.Exclude
    local Character = Players.LocalPlayer.Character
    if Character then
        v2.FilterDescendantsInstances = {Character}
    end
    local v3 = workspace:Raycast(v1.Origin, v1.Direction * 1000, v2)
    if not v3 then
        return nil, nil
    end
    local v4 = getWaterPart(v3.Instance)
    if not v4 then
        return nil, nil
    end
    return v4, v3.Position
end
local function isClickedPointInRange(p1) -- Line: 96 -- upvalues: Character (val), Players (val)
    if typeof(p1) ~= "Vector3" then
        return false
    end
    local v1 = (p1 - Character.getPosition(Players.LocalPlayer)).Magnitude <= 15
    return v1
end
local function getCanteenWater(p1, p2) -- Line: 105 -- upvalues: Inventory (val), Players (val)
    local MaxWater, Water, meta
    local v1 = Inventory.Store.get(Players.LocalPlayer)
    if not v1 then
        return 100, 100
    end
    local v2 = v1
    local v3 = nil
    local v4 = nil
    for i, j in v2, v3, v4 do
        if j.id == p1 and j.offset == p2 then
            meta = j.meta
            if typeof(meta) ~= "table" then
                return 100, 100
            end
            if typeof(meta.MaxWater) ~= "number" then
                MaxWater = 100
            else
                MaxWater = meta.MaxWater
            end
            if typeof(meta.Water) ~= "number" then
                Water = MaxWater
            else
                Water = meta.Water
            end
            return Water, MaxWater
        end
    end
    return 100, 100
end
local function isThirsty() -- Line: 128 -- upvalues: Vitality (val), Players (val)
    local v1
    local v2 = Vitality.Store.get(Players.LocalPlayer)
    if not v2 then
        return true
    end
    local v3 = v2.maxThirst or 100
    if v2.thirst or 0 < v3 then
        v1 = true
    else
        v1 = false
    end
    return v1
end
local function playUseAnimation(p1) -- Line: 140 -- upvalues: useAnimatorObserver (val)
    useAnimatorObserver.play(p1, 0.1)
end
local function playNodNo() -- Line: 144 -- upvalues: Emotes (val), useAnimatorObserver (val)
    local NodNo = Emotes.getAnimationId("NodNo")
    if not NodNo then
        return
    end
    useAnimatorObserver.play(NodNo, 0.1, Enum.AnimationPriority.Action3)
end
local u186 = nil
local u187 = nil
local u188 = 0
local u189 = 0
local u190 = 0
return {
    equipped = function(p1, p2) -- Line: 164 -- upvalues: u189 (ref), u190 (ref), Character (val), u186 (ref), useAnimatorObserver (val), u173 (val), u187 (ref), UserInputService (val), u188 (ref), raycastToWater (val), getCanteenWater (val), isClickedPointInRange (val), playNodNo (val), playUseAnimation (val), Canteen (val), isThirsty (val)
        local id, offset
        if not p2 then
            id = 0
        else
            id = p2.id
        end
        u189 = id
        if not p2 then
            offset = 0
        else
            offset = p2.offset
            if not offset then
                offset = 0
            end
        end
        u190 = offset
        Character.getCharacterAsync():andThen(function(p1) -- Line: 168 -- upvalues: u186 (upval), useAnimatorObserver (upval), u173 (upval)
            u186 = useAnimatorObserver.bind(p1.Humanoid.Animator, u173, 4)
        end)
        u187 = UserInputService.InputBegan:Connect(function(a1, p2) -- Line: 172 -- upvalues: u188 (upval), raycastToWater (upval), getCanteenWater (upval), u189 (upval), u190 (upval), isClickedPointInRange (upval), p1 (val), playNodNo (upval), playUseAnimation (upval), Canteen (upval), isThirsty (upval)
            local v1, v2, v3
            if p2 or a1.UserInputType ~= Enum.UserInputType.MouseButton1 then
                return
            end
            local v4 = tick()
            local v5 = v4 - u188
            if v5 < 2 then
                return
            end
            u188 = v4
            v5, v1 = raycastToWater()
            v2, v3 = getCanteenWater(u189, u190)
            if not v5 then
                p1(false)
                if v2 > 0 then
                    if not (isThirsty()) then
                        playNodNo()
                        return
                    end
                    playUseAnimation(Canteen.Drink)
                    return
                end
                playNodNo()
                return
            end
            if isClickedPointInRange(v1) then
                p1(true)
                if v3 <= v2 then
                    playNodNo()
                    return
                end
                playUseAnimation(Canteen.Refill)
                return
            end
            p1(false)
            if v2 <= 0 or not (isThirsty()) then
                playNodNo()
                return
            end
            playUseAnimation(Canteen.Drink)
        end)
    end,
    unequipped = function() -- Line: 210 -- upvalues: u189 (ref), u190 (ref), u186 (ref), u187 (ref)
        u189 = 0
        u190 = 0
        if u186 then
            u186()
            u186 = nil
        end
        if u187 then
            u187:Disconnect()
            u187 = nil
        end
    end,
    data = v2,
}