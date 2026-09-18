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
--         File: ReplicatedStorage.Client.User.Character.CharacterCombatHandler
--                               Dumped in 0.00217 seconds
--                          Bytecode version 9  |  23 functions

local u256, u259
local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Alive = require(Common:WaitForChild("Alive"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Network = Common_2:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Combat = require(Namespaces:WaitForChild("Combat"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Observers = Common_3:WaitForChild("Observers")
local useAnimatorObserver = require(Observers:WaitForChild("useAnimatorObserver"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_4:WaitForChild("Common")
local Utilities = Common_4:WaitForChild("Utilities")
local Character = require(Utilities:WaitForChild("Character"))
local Equipment = v1.Parent.Parent:WaitForChild("Equipment")
local Tools = Equipment:WaitForChild("Tools")
local ClientInventoryHandler = require(Tools:WaitForChild("ClientInventoryHandler"))
local Progression = v1.Parent.Parent.Parent:WaitForChild("Progression")
local ClientAttributesHandler = require(Progression:WaitForChild("ClientAttributesHandler"))
local State = v1.Parent.Parent:WaitForChild("State")
local ClientStateHandler = require(State:WaitForChild("ClientStateHandler"))
local States = ClientStateHandler.States
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_5:WaitForChild("Common")
local Utilities_2 = Common_5:WaitForChild("Utilities")
local Signal = require(Utilities_2:WaitForChild("Signal"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_6:WaitForChild("Packages")
local trove = require(Packages:WaitForChild("trove"))
local __PVP_DEBUGGING__ = _G.__PVP_DEBUGGING__
local function getRootAliveModelFromInstance(p1) -- Line: 37
    local Parent = p1
    while Parent do
        if Parent:IsA("Model") then
            if not (Parent:HasTag("Alive")) and not (Parent:HasTag("Character")) then
                Parent = Parent.Parent
                continue
            end
            return Parent
        end
    end
    return nil
end
local function resolveAnimalFromPart(p1) -- Line: 51
    local Attribute, Attribute_2, Attribute_3, RootPart, v1
    local Parent = p1
    while Parent do
        if Parent == workspace then
            break
        end
        if Parent:IsA("Model") and Parent:HasTag("Animal") then
            Attribute = Parent:GetAttribute("id")
            if type(Attribute) == "number" then
                return Parent, Attribute
            end
        end
        if Parent:IsA("Model") and Parent.Parent and Parent.Parent.Name == "Animals" then
            for i, j in Parent:GetChildren() do
                if j:IsA("Model") and j:HasTag("Animal") then
                    Attribute_3 = j:GetAttribute("id")
                    if type(Attribute_3) == "number" then
                        return j, Attribute_3
                    end
                end
            end
            RootPart = Parent:FindFirstChild("RootPart")
            Attribute_2 = RootPart
            if Attribute_2 then
                Attribute_2 = RootPart:GetAttribute("id")
            end
            if type(Attribute_2) == "number" then
                return Parent, Attribute_2
            end
            v1 = tonumber(Parent.Name)
            if v1 then
                return Parent, v1
            end
        end
        Parent = Parent.Parent
    end
    return nil, nil
end
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_7:WaitForChild("Common")
local Combat_2 = require(Common_6:WaitForChild("Logger"))("Combat")
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Common_7 = ReplicatedStorage_8:WaitForChild("Common")
local Statistics = Common_7:WaitForChild("Statistics")
local useJumpPower = require(Statistics:WaitForChild("useJumpPower"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Common_8 = ReplicatedStorage_9:WaitForChild("Common")
local Statistics_2 = Common_8:WaitForChild("Statistics")
local useWalkSpeed = require(Statistics_2:WaitForChild("useWalkSpeed"))
local u239 = {core = trove.new(), block = trove.new(), stun = trove.new(), hitbox = trove.new()}
local u248 = nil
local u249 = nil
local u250 = false
local u251 = false
local u252 = false
local u253 = nil
_, u256 = useWalkSpeed()
_, u259 = useJumpPower()
local function onCreateClientHitbox() -- Line: 135 -- upvalues: u239 (val), Signal (val), Character (val), u248 (ref), __PVP_DEBUGGING__ (val), resolveAnimalFromPart (val), Combat (val), getRootAliveModelFromInstance (val), Alive (val), Players (val), RunService (val)
    local size, v1
    local hitbox = u239.hitbox
    local u4 = Signal.new()
    local v2 = Character.getCharacter()
    local u9 = OverlapParams.new()
    u9.FilterType = Enum.RaycastFilterType.Exclude
    if not v2 then
        v1 = {}
    else
        v1 = {v2}
    end
    u9.FilterDescendantsInstances = v1
    local u16 = {}
    local u17 = {}
    if not u248 then
        size = Vector3.new(6, 6, 9)
    elseif u248.hitbox then
        size = u248.hitbox.size
    end
    local u34 = nil
    if __PVP_DEBUGGING__ then
        u34 = Instance.new("BoxHandleAdornment")
        u34.Size = size
        u34.Color3 = Color3.fromRGB(255, 0, 0)
        u34.Transparency = 0.5
        u34.Adornee = workspace.Terrain
        u34.Parent = workspace.Terrain
    end
    if u34 then
        hitbox:Add(u34)
    end
    hitbox:Add(u4)
    hitbox:Add(RunService.RenderStepped:Connect(function() -- Line: 169 -- upvalues: Character (upval), hitbox (val), u248 (upval), size (val), u9 (val), u34 (ref), resolveAnimalFromPart (upval), u17 (val), Combat (upval), getRootAliveModelFromInstance (upval), Alive (upval), Players (upval), u16 (val), u4 (val)
        local Parent, offset, v1, v2, v3, v4
        local v5 = Character.getCharacter()
        if not v5 then
            return hitbox:Clean()
        end
        local CFrame = v5.HumanoidRootPart.CFrame
        if not u248 then
            offset = CFrame.new(0, 0, -size.Z / 2)
        elseif u248.hitbox then
            offset = u248.hitbox.offset
        end
        local PartBoundsInBox = workspace:GetPartBoundsInBox(CFrame * offset, size, u9)
        if u34 then
            u34.CFrame = CFrame * offset
        end
        local v6 = PartBoundsInBox
        local v7 = nil
        local v8 = nil
        for i, j in v6, v7, v8 do
            if not v5 then
                v4, v1 = resolveAnimalFromPart(j)
                if not v4 then
                    v2 = getRootAliveModelFromInstance(j)
                    if v2 and v2 ~= v5 then
                        v3 = Alive.getPlayerFromCharacter(v2)
                        if not v3 then
                            Parent = j.Parent
                            if Parent and Parent:IsA("Model") then
                                v3 = Alive.getPlayerFromCharacter(Parent)
                            end
                        end
                        if v3 and v3 ~= Players.LocalPlayer and not (table.find(u16, v3)) then
                            table.insert(u16, v3)
                            u4:Fire(v3)
                        end
                    end
                elseif v1 and not (table.find(u17, v1)) then
                    table.insert(u17, v1)
                    Combat.Hit.post(0, v1)
                end
            elseif j:IsDescendantOf(v5) then
            end
        end
    end))
    return u4, hitbox
end
local function onInitializeClientCombat() -- Line: 362 -- upvalues: u251 (ref), ClientInventoryHandler (val), Combat (val), u250 (ref), u239 (val), UserInputService (val)
    u239.core:Add(UserInputService.InputEnded:Connect(function(p1, p2) -- Line: 386 -- upvalues: Combat (upval)
        if p2 then
            return
        end
        if p1.KeyCode == Enum.KeyCode.F then
            Combat.Block.post(false)
            return
        end
        if p1.KeyCode == Enum.KeyCode.X then
            return Combat.Debug.post()
        end
    end))
    u239.core:Add(UserInputService.InputBegan:Connect(function(p1, p2) -- Line: 365 -- upvalues: u251 (upval), ClientInventoryHandler (upval), Combat (upval), u250 (upval)
        if p2 then
            return
        end
        if p1.UserInputType == Enum.UserInputType.MouseButton1 then
            if u251 then
                return
            end
            ClientInventoryHandler.addItemEquipCooldown(3)
            return Combat.Swing.post()
        end
        if p1.KeyCode == Enum.KeyCode.F and not u250 then
            Combat.Block.post(true)
        end
    end))
end
local function onUnloadClientCombat() -- Line: 411 -- upvalues: u239 (val), ClientStateHandler (val), States (val), u252 (ref), u253 (ref)
    for k, v in pairs(u239) do
        v:Clean()
    end
    ClientStateHandler.updateState(States.COMBATTING, false)
    u252 = false
    u253 = nil
end
Combat.Swing.listen(function(p1, p2) -- Line: 242 -- upvalues: u253 (ref), ClientAttributesHandler (val), u256 (val), u259 (val), u239 (val), onCreateClientHitbox (val), Combat (val)
    local u29, v1
    local v2 = p1 - workspace:GetServerTimeNow()
    if u253 == "Sabre" then
        v1 = ClientAttributesHandler.getAttribute("CanRunWhileSwingingSabre") == 1
    else
        v1 = false
        if u253 ~= "Combat Knife" then end
    end
    if not v1 then
        local v3 = ("swinging_%*"):format(p2)
        u29 = u256(v3, 9, "set", p2 + 5)
    else
        function u29() end
    end
    local v4 = ("swinging_%*"):format(p2)
    local u40 = u259(v4, 0, "set", p2 + 5)
    task.delay(v2 + 0.2, function() -- Line: 255 -- upvalues: u29 (val), u40 (val)
        u29(TweenInfo.new(0.2))
        u40()
    end)
    u239.hitbox:Clean()
    u239.hitbox:Add(task.delay(0.3, function() -- Line: 262 -- upvalues: onCreateClientHitbox (upval), Combat (upval), u239 (upval)
        local u2, v1
        v1, u2 = onCreateClientHitbox()
        v1:Connect(function(p1) -- Line: 265 -- upvalues: Combat (upval)
            Combat.Hit.post(p1.UserId)
        end)
        u239.hitbox:Add(task.delay(0.25, function() -- Line: 270 -- upvalues: u2 (val)
            u2:Destroy()
        end))
        u239.hitbox:Add(function() -- Line: 275 -- upvalues: u2 (val)
            u2:Destroy()
        end)
    end))
end)
Combat.Block.listen(function(p1) -- Line: 286 -- upvalues: u250 (ref), u239 (val), u256 (val), u259 (val)
    u250 = p1
    u239.block:Clean()
    if not p1 then
        return
    end
    local v1 = u256("blocking", 8, "set", 4)
    local v2 = u259("blocking", 0, "set", 4)
    u239.block:Add(v1)
    u239.block:Add(v2)
end)
Combat.Stun.listen(function(p1, p2) -- Line: 311 -- upvalues: u239 (val), u256 (val), u259 (val), u251 (ref)
    u239.stun:Clean()
    u239.hitbox:Clean()
    local v1 = p1 - workspace:GetServerTimeNow()
    local u22 = u256("stunned", 4, "set", 8)
    local u28 = u259("stunned", 0, "set", 8)
    u239.stun:Add(u22)
    u239.stun:Add(u28)
    u251 = true
    u239.stun:Add(task.delay(v1, function() -- Line: 330 -- upvalues: u251 (upval), u22 (val), u28 (val)
        if u251 then
            u22()
            u28()
            u251 = false
        end
    end))
    u239.stun:Add(function() -- Line: 341 -- upvalues: u251 (upval)
        u251 = false
    end)
end)
Combat.Free.listen(function() -- Line: 350 -- upvalues: u251 (ref), u239 (val)
    u251 = false
    u239.stun:Clean()
end)
Combat.Disable.listen(onUnloadClientCombat)
return {
    onLoadClientCombat = function(p1, p2) -- Line: 427 -- upvalues: u252 (ref), u253 (ref), onUnloadClientCombat (val), u248 (ref), u239 (val), u250 (ref), Character (val), Combat_2 (val), u249 (ref), useAnimatorObserver (val), onInitializeClientCombat (val), ClientStateHandler (val), States (val)
        if u252 and u253 then
            onUnloadClientCombat()
        end
        u248 = p1
        u239.core:Clean()
        u250 = false
        local v1 = Character.getCharacter()
        if not v1 then
            Combat_2.error("No character found").color("red")
            return
        end
        u249 = useAnimatorObserver.bind(v1.Humanoid.Animator, p1.animations, 2)
        u239.core:Add(u249)
        onInitializeClientCombat()
        ClientStateHandler.updateState(States.COMBATTING, true)
        u252 = true
        u253 = p2
    end,
    onUnloadClientCombat = onUnloadClientCombat,
    isCombatLoaded = function() -- Line: 467 -- upvalues: u252 (ref), u253 (ref)
        return u252, u253
    end,
}