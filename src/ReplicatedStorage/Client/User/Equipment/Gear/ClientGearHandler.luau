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
--         File: ReplicatedStorage.Client.User.Equipment.Gear.ClientGearHandler
--                               Dumped in 0.00308 seconds
--                          Bytecode version 9  |  33 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Network = require(Common:WaitForChild("Network"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Network_2 = Common_2:WaitForChild("Network")
local Namespaces = Network_2:WaitForChild("Namespaces")
local Gear = require(Namespaces:WaitForChild("Gear"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Network_3 = Common_3:WaitForChild("Network")
local Namespaces_2 = Network_3:WaitForChild("Namespaces")
local Vitality = require(Namespaces_2:WaitForChild("Vitality"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_4:WaitForChild("Common")
local Constants = require(Common_4:WaitForChild("Constants"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_5:WaitForChild("Common")
local Network_4 = Common_5:WaitForChild("Network")
local Namespaces_3 = Network_4:WaitForChild("Namespaces")
local Server = require(Namespaces_3:WaitForChild("Server"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_6:WaitForChild("Common")
local Animations = Common_6:WaitForChild("Animations")
local Gear_2 = require(Animations:WaitForChild("Gear"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_7:WaitForChild("Packages")
local trove = require(Packages:WaitForChild("trove"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Common_7 = ReplicatedStorage_8:WaitForChild("Common")
local Types = Common_7:WaitForChild("Types")
local Gear_3 = require(Types:WaitForChild("Gear"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Common_8 = ReplicatedStorage_9:WaitForChild("Common")
local Utilities = Common_8:WaitForChild("Utilities")
local Character = require(Utilities:WaitForChild("Character"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Common_9 = ReplicatedStorage_10:WaitForChild("Common")
local Utilities_2 = Common_9:WaitForChild("Utilities")
local Shake = require(Utilities_2:WaitForChild("Shake"))
local ReplicatedStorage_11 = game:GetService("ReplicatedStorage")
local Common_10 = ReplicatedStorage_11:WaitForChild("Common")
local Utilities_3 = Common_10:WaitForChild("Utilities")
local Signal = require(Utilities_3:WaitForChild("Signal"))
local ReplicatedStorage_12 = game:GetService("ReplicatedStorage")
local Common_11 = ReplicatedStorage_12:WaitForChild("Common")
local Utilities_4 = Common_11:WaitForChild("Utilities")
local Table = require(Utilities_4:WaitForChild("Table"))
local ReplicatedStorage_13 = game:GetService("ReplicatedStorage")
local Common_12 = ReplicatedStorage_13:WaitForChild("Common")
local Utilities_5 = Common_12:WaitForChild("Utilities")
local Gear_4 = require(Utilities_5:WaitForChild("Gear"))
local ReplicatedStorage_14 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_14:WaitForChild("Client")
local Progression = Client:WaitForChild("Progression")
local ClientAttributesHandler = require(Progression:WaitForChild("ClientAttributesHandler"))
local State = v1.Parent.Parent.Parent:WaitForChild("State")
local ClientStateHandler = require(State:WaitForChild("ClientStateHandler"))
local States = ClientStateHandler.States
local ReplicatedStorage_15 = game:GetService("ReplicatedStorage")
local Common_13 = ReplicatedStorage_15:WaitForChild("Common")
local Utilities_6 = Common_13:WaitForChild("Utilities")
local Sounds = require(Utilities_6:WaitForChild("Sounds"))
local ReplicatedStorage_16 = game:GetService("ReplicatedStorage")
local Common_14 = ReplicatedStorage_16:WaitForChild("Common")
local Sounds_2 = Common_14:WaitForChild("Sounds")
local Gear_5 = require(Sounds_2:WaitForChild("Gear"))
local ReplicatedStorage_17 = game:GetService("ReplicatedStorage")
local Common_15 = ReplicatedStorage_17:WaitForChild("Common")
local Utilities_7 = Common_15:WaitForChild("Utilities")
local Timeout = Utilities_7:WaitForChild("Timeout")
local debounce = require(Timeout:WaitForChild("debounce"))
local ReplicatedStorage_18 = game:GetService("ReplicatedStorage")
local Common_16 = ReplicatedStorage_18:WaitForChild("Common")
local Gear_6 = require(Common_16:WaitForChild("Logger"))("Gear")
local __USING_INFINITE_GAS__ = _G.__USING_INFINITE_GAS__
local u378 = 0
local u379 = {}
local u380 = {}
local u381 = nil
local u383 = Signal.new()
local u384 = {}
local u385 = 0
local u386 = 0
local Components = v1.Parent:WaitForChild("Components")
local u392 = {
    grappled_by = {Left = {}, Right = {}},
    grappled_to = {Left = {}, Right = {}},
}
local mapKV = Table.mapKV
local Children = Components:GetChildren()
local u404 = mapKV(Children, function(p1) -- Line: 96
    local v1 = {}
    for k, v in pairs(p1:GetChildren()) do
        if v:IsA("ModuleScript") then
            v1[v.Name] = require(v)
        end
    end
    local v2 = string.upper(p1.Name)
    return v2, v1
end)
local function unloadClientGear() -- Line: 118 -- upvalues: u384 (val), u381 (ref), u380 (val), ClientStateHandler (val), States (val)
    table.clear(u384)
    if u381 then
        for k, v in pairs(u380) do
            if v.destroyed then
                v.destroyed()
            end
        end
        u381.trove:Clean()
        u381.trove:Destroy()
        u381 = nil
    end
    ClientStateHandler.updateState(States.GRAPPLING, false)
    ClientStateHandler.updateState(States.WALL_SLIDING, false)
    ClientStateHandler.updateState(States.HANDLES, false)
    ClientStateHandler.updateState(States.GEAR_SWING, false)
    ClientStateHandler.updateState(States.REFILLING, false)
    ClientStateHandler.updateState(States.CHECKING_GAS, false)
    ClientStateHandler.updateState(States.SLIDING, false)
    ClientStateHandler.updateState(States.TURBINE, false)
    ClientStateHandler.updateState(States.CLASHING, false)
    ClientStateHandler.updateState(States.PARRYING, false)
    ClientStateHandler.updateState(States.STUNNED, false)
    ClientStateHandler.updateState(States.LOCKED, false)
end
local function loadClientGear(p1) -- Line: 154 -- upvalues: u381 (ref), unloadClientGear (val), trove (val), u385 (ref), u386 (ref), Players (val), Gear_3 (val), u379 (val), __USING_INFINITE_GAS__ (val), Gear_4 (val), Table (val), Gear_2 (val), u384 (val), ClientStateHandler (val), u392 (ref), u378 (ref), debounce (val), Gear (val), Shake (val), Character (val), Server (val), Constants (val), ClientAttributesHandler (val), Sounds (val), Gear_5 (val), u383 (val), Gear_6 (val), u404 (val), u380 (val)
    local huge, huge_2, name, v1
    if p1.equipped ~= 1 then
        return
    end
    if u381 then
        unloadClientGear()
    end
    local u7 = trove.new()
    u385 = u385 + 1
    local u10 = u385
    u386 = 0
    Players.LocalPlayer.CharacterAdded:Once(function() -- Line: 170 -- upvalues: u381 (upval), unloadClientGear (upval)
        if u381 then
            unloadClientGear()
        end
    end)
    local u19 = {signals = Gear_3.Signals, trove = u7, modifiers = u379, stance = p1.stance}
    local v2 = {
        left = {busy = false, active = false},
    }
    local v3 = {busy = false, active = false}
    v2.right = v3
    u19.grapples = v2
    u19.boosting = false
    u19.blades = false
    u19.blocking = false
    u19.wall_sliding = false
    u19.handles = false
    if not __USING_INFINITE_GAS__ then
        huge = Gear_3.Constants.MAX_GAS
    else
        huge = math.huge
    end
    u19.maxGas = huge
    if not __USING_INFINITE_GAS__ then
        huge_2 = p1.gas
        if not huge_2 then
            huge_2 = 0
        end
    else
        huge_2 = math.huge
    end
    u19.gas = huge_2
    u19.gasBoostingConsumption = 12
    u19.gasConsumption = 6
    u19.maxBlade = 8
    u19.blade = 8
    u19.health = p1.health or 100
    u19.bladeDurability = 100
    u19.maxBladeDurability = 100
    u19.tinkers = Gear_4.createTinkerModifierMap(p1.components)
    u19.levels = Table.map(p1.components, function(p1) -- Line: 216
        return p1.value
    end)
    u19.reeling = false
    u19.slacking = false
    u19.goal = Vector3.new()
    u19.enabled = true
    u19.no_physics = false
    u19.bladeExpansion = 0
    function u19.malfunction() end
    function u19.useGas(p1, p2) end
    function u19.getAnimations() -- Line: 231 -- upvalues: Gear_2 (upval)
        return Gear_2
    end
    function u19.busy() -- Line: 236 -- upvalues: u384 (upval)
        local v1 = #u384
        local v2 = 0 < v1
        return v2
    end
    function u19.addTimeout(p1) -- Line: 241 -- upvalues: u386 (upval), ClientStateHandler (upval), u384 (upval), u10 (val)
        u386 = u386 + 1
        local u3 = u386
        local v1 = {"ClientGearHandler"}
        table.insert(u384, {token = u3, trace = ClientStateHandler.__callerAttributionSkipping(v1), session = u10})
        task.delay(p1, function() -- Line: 252 -- upvalues: u384 (upval), u3 (val), u10 (upval)
            local v1
            local v2 = 1
            local v3 = -1
            for i = #u384, v2, v3 do
                v1 = u384[i]
                if v1.token == u3 and v1.session == u10 then
                    table.remove(u384, i)
                    return
                end
            end
        end)
    end
    function u19.getGrappleServerData() -- Line: 263 -- upvalues: u392 (upval)
        return u392
    end
    u19.__animations = Gear_2
    u378 = p1.gas
    u381 = u19
    local u92 = debounce(function() -- Line: 275 -- upvalues: u381 (upval), Gear (upval)
        if not u381 then
            return
        end
        Gear.Sync.post(u381.gas)
    end, 5, {trailing = true, maxWait = 20})
    function u19.malfunction() -- Line: 285 -- upvalues: Shake (upval), Character (upval)
        local v1 = Shake.new()
        v1.FadeInTime = 0.3
        v1.FadeOutTime = 0.3
        v1.Frequency = 0.1
        v1.Amplitude = 3
        v1.RotationInfluence = Vector3.new(0.1, 0.1, 0.1)
        v1:Start()
        local CurrentCamera = workspace.CurrentCamera
        if not (Character.getCharacter()) then
            return
        end
        v1:BindToRenderStep(Shake.NextRenderName(), Enum.RenderPriority.Last.Value, function(p1, p2) -- Line: 303 -- upvalues: CurrentCamera (val)
            local v1 = CurrentCamera
            local v2 = CFrame.new(p1)
            v1.CFrame = v1.CFrame * (v2 * CFrame.Angles(p2.X, p2.Y, p2.Z))
        end)
    end
    function u19.getAnimations() -- Line: 308 -- upvalues: u381 (upval), Gear_2 (upval)
        if not u381 then
            return Gear_2
        end
        return u381.__animations
    end
    function u19.useGas(p1, p2) -- Line: 318 -- upvalues: u381 (upval), Server (upval), Constants (upval), ClientAttributesHandler (upval), Character (upval), Sounds (upval), Gear_5 (upval), u378 (upval), u92 (val)
        if not u381 then
            return false
        end
        if Server.Store.client().event ~= 0 then
            local v1
            local v2 = ClientAttributesHandler.getDiminishedAttribute("GearConsumptionDrainMultiplier") or 1
            local LowGasDrainMultiplier = ClientAttributesHandler.getAttribute("LowGasDrainMultiplier")
            local LowGasDrainThreshold = ClientAttributesHandler.getAttribute("LowGasDrainThreshold")
            if u381.gas < u381.maxGas * LowGasDrainThreshold then
                v2 = v2 * (1 - LowGasDrainMultiplier)
            end
            local v3 = p1 * v2
            if u381.gas >= v3 then
                if u381.gas == 0 then
                    v1 = Character.getCharacter()
                    if not v1 then
                        return false
                    end
                    Sounds.playRangedSoundEffect(Gear_5.NoGas, v1.HumanoidRootPart, 300, 1)
                    return false
                end
                u381.gas = math.clamp(u381.gas - v3, 0, u381.maxGas)
                u378 = u381.gas
                u92()
                return true
            end
            if not p2 then
                v1 = Character.getCharacter()
                if not v1 then
                    return false
                end
                Sounds.playRangedSoundEffect(Gear_5.NoGas, v1.HumanoidRootPart, 300, 1)
                return false
            end
            if u381.gas ~= 0 then
                u381.gas = math.clamp(u381.gas - v3, 0, u381.maxGas)
                u378 = u381.gas
                u92()
                return true
            end
            v1 = Character.getCharacter()
            if not v1 then
                return false
            end
            Sounds.playRangedSoundEffect(Gear_5.NoGas, v1.HumanoidRootPart, 300, 1)
            return false
        elseif not Constants.IsSupporterPlace then
            return true
        end
    end
    u383:Fire(u19)
    local u103 = Character.getCharacter()
    if not u103 then
        Gear_6.warn("No character found while loading client gear")
        return
    end
    for k, v in pairs(p1.components) do
        v1 = u404[k]
        if v1 then
            name = v.name
            if v1[name] then
                v1[name].level = v.value
                u380[k] = v1[name]
            end
        end
    end
    for k2, i in pairs(u380) do
        if i.initialized then
            i.initialized(i.level or 1, u19)
        end
    end
    local u132 = false
    local function destroy() -- Line: 402 -- upvalues: u132 (ref), u380 (upval), u7 (val)
        if u132 then
            return
        end
        u132 = true
        for k, v in pairs(u380) do
            if v.destroyed then
                v.destroyed()
            end
        end
        u7:Destroy()
    end
    local trove_2 = u19.trove
    local AttributeChangedSignal = u103:GetAttributeChangedSignal("Grabbed")
    trove_2:Add(AttributeChangedSignal:Connect(function() -- Line: 421 -- upvalues: u103 (val), u19 (val)
        local Attribute = u103:GetAttribute("Grabbed")
        task.defer(function() -- Line: 424 -- upvalues: u19 (upval), Attribute (val)
            u19.enabled = not Attribute
            u19.signals.enabled:Fire(u19.enabled)
        end)
    end))
    u19.trove:Add(u103.Humanoid.Died:Connect(destroy))
    u19.trove:Add(u103.Destroying:Connect(destroy))
end
local function onUpdateStance(p1) -- Line: 442 -- upvalues: u381 (ref), Table (val), Gear_2 (val)
    if u381 then
        u381.stance = p1
        local v1 = Table.copy(Gear_2)
        if p1 ~= "Default" then
            v1 = Table.deepMerge(v1, Gear_2.Stances[p1])
        end
        u381.__animations = v1
        u381.signals.stance:Fire(p1)
    end
end
local function observeClientGearChanged(p1, p2) -- Line: 462 -- upvalues: loadClientGear (val), unloadClientGear (val), onUpdateStance (val), u381 (ref)
    if p2.equipped ~= 0 then
        if p2.equipped ~= 1 then
            if p2.stance ~= p1.stance then
                onUpdateStance(p1.stance)
            end
        elseif p1.equipped == 0 then
            unloadClientGear()
        end
    elseif p1.equipped == 1 then
        loadClientGear(p1)
    end
    if p1.blades == p2.blades or not u381 then
        return
    end
    if p1.blades == 1 then
        u381.blades = true
        return
    end
    u381.blades = false
end
Network.loaded:andThen(function() -- Line: 482 -- upvalues: Gear (val), Players (val), loadClientGear (val), u381 (ref), Gear_4 (val), Table (val), u378 (ref), observeClientGearChanged (val), Vitality (val), unloadClientGear (val), u392 (ref)
    local u5 = Gear.Gear.get(Players.LocalPlayer)
    local u6 = u5
    if u5 then
        loadClientGear(u5)
    end
    Gear.Gear.observe(Players.LocalPlayer, function() -- Line: 493 -- upvalues: u5 (ref), Gear (upval), Players (upval), u381 (upval), Gear_4 (upval), Table (upval), u378 (upval), observeClientGearChanged (upval), u6 (ref)
        u5 = Gear.Gear.get(Players.LocalPlayer)
        if u381 then
            u381.tinkers = Gear_4.createTinkerModifierMap(u5.components)
            u381.levels = Table.map(u5.components, function(p1) -- Line: 498
                return p1.value
            end)
            if u378 then
                u381.gas = u378
            end
            u381.health = u5.health
        end
        observeClientGearChanged(u5, u6)
        u6 = u5
    end)
    Vitality.Store.observe(Players.LocalPlayer, function() -- Line: 514 -- upvalues: Vitality (upval), Players (upval), u381 (upval), unloadClientGear (upval)
        if Vitality.Store.get(Players.LocalPlayer) == 0 and u381 then
            unloadClientGear()
        end
    end)
    Gear.Grapple.listen(function(p1) -- Line: 521 -- upvalues: u392 (upval)
        u392 = p1
    end)
    Gear.Ungrapple.listen(function() -- Line: 525 -- upvalues: u381 (upval)
        if u381 then
            u381.signals.ungrapple:Fire("Left")
            u381.signals.ungrapple:Fire("Right")
        end
    end)
end)
Gear.Refilled.listen(function(p1) -- Line: 535 -- upvalues: u378 (ref), u381 (ref)
    u378 = p1
    if u381 then
        u381.gas = p1
    end
end)
return {
    getGearState = function() -- Line: 548 -- upvalues: u381 (ref)
        return u381
    end,
    __getGearBusyDebug = function() -- Line: 553 -- upvalues: u381 (ref), u384 (val)
        if u381 == nil then
            return {equipped = false, busy = false, traces = {}}
        end
        local v1 = {}
        local v2 = u384
        local v3 = nil
        local v4 = nil
        for i, j in v2, v3, v4 do
            table.insert(v1, j.trace)
        end
        v2 = {equipped = true}
        v4 = #u384
        v3 = 0 < v4
        v2.busy = v3
        v2.traces = v1
        return v2
    end,
    onGearAdded = u383,
    setGearEnabled = function(p1) -- Line: 576 -- upvalues: u381 (ref)
        if not u381 then
            return
        end
        u381.enabled = p1
        u381.signals.enabled:Fire(p1)
    end,
}