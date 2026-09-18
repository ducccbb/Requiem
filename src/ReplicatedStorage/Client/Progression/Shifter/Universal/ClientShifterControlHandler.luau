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
--File: ReplicatedStorage.Client.Progression.Shifter.Universal.ClientShifterControlHandler
--                               Dumped in 0.00209 seconds
--                          Bytecode version 9  |  22 functions

local u202
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Lighting = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Player = require(Namespaces:WaitForChild("Player"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Signals = require(Common_2:WaitForChild("Signals"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Types = Common_3:WaitForChild("Types")
local Shifter = require(Types:WaitForChild("Shifter"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_4:WaitForChild("Common")
local Utilities = Common_4:WaitForChild("Utilities")
local State = require(Utilities:WaitForChild("State"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_5:WaitForChild("Client")
local User = Client:WaitForChild("User")
local State_2 = User:WaitForChild("State")
local ClientStateHandler = require(State_2:WaitForChild("ClientStateHandler"))
local States = ClientStateHandler.States
local ClientShifterHealthHandler = require(script.Parent:WaitForChild("ClientShifterHealthHandler"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_6:WaitForChild("Common")
local Utilities_2 = Common_5:WaitForChild("Utilities")
local Shoulder = Utilities_2:WaitForChild("Shoulder")
local Camera = require(Shoulder:WaitForChild("Camera"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_7:WaitForChild("Common")
local Effects_2 = Common_6:WaitForChild("Effects")
local Effects = require(Effects_2:WaitForChild("Effects"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Common_7 = ReplicatedStorage_8:WaitForChild("Common")
local Statistics = Common_7:WaitForChild("Statistics")
_, u202 = require(Statistics:WaitForChild("useWalkSpeed"))()
local u203 = nil
local u204 = nil
local u205 = {}
local u206 = {}
local u207 = nil
local u208 = nil
local u209 = nil
local function isSecondaryActive(p1, p2) -- Line: 66
    local v1 = p1.abilities[p2]
    if not v1 or not v1.Secondary then
        return false
    end
    local Requires = v1.Secondary.Requires
    if not Requires then
        Requires = {}
    end
    if #Requires == 0 then
        return false
    end
    for i, v in ipairs(Requires) do
        if not (p1.state[v]) then
            return false
        end
    end
    return true
end
local function getDisplayNameForAbility(p1, p2) -- Line: 92 -- upvalues: isSecondaryActive (val)
    local v1 = p1.abilities[p2]
    if not v1 then
        return p2
    end
    local Secondary = v1.Secondary
    if not Secondary or not Secondary.Name then
        return p2
    end
    if isSecondaryActive(p1, p2) then
        return Secondary.Name
    end
    return p2
end
local function onUpdateControlCooldowns(p1) -- Line: 111 -- upvalues: State (val)
    State("cooldowns")(p1.cooldowns)
end
local function isPartBusy(p1, p2) -- Line: 176
    if p2 == "Body" then
        return p1.bodyBusy
    end
    if p2 == "Left Arm" then
        return p1.leftArmBusy
    end
    if p2 == "Right Arm" then
        return p1.rightArmBusy
    end
    return true
end
local function onUpdateDisabledControls(p1) -- Line: 195 -- upvalues: State (val), ClientShifterHealthHandler (val), isPartBusy (val)
    local Requires, v1
    local disabledControls = State("disabledControls")
    local v2 = {}
    local state = p1.state
    local v3 = ClientShifterHealthHandler.getCurrentStamina(p1)
    for k, v in pairs(p1.abilities) do
        if k ~= "Swing" then
            if state.hitstunned then
                v2[k] = true
            elseif v3 >= v.Stamina or 0 then
                Requires = v.Requires
                if not Requires then
                    Requires = {}
                end
                if #Requires ~= 0 then
                    v1 = false
                    for i, i2 in ipairs(Requires) do
                        if isPartBusy(state, i2) then
                            v1 = true
                            break
                        end
                    end
                    v2[k] = v1
                else
                    v2[k] = false
                end
            else
                v2[k] = true
            end
        end
    end
    if not state.canEat then
        v2.Drop = true
        v2.Eat = true
    end
    disabledControls(v2)
end
local function onUpdateKeybinds(p1) -- Line: 252 -- upvalues: State (val), getDisplayNameForAbility (val)
    local v1
    local keybinds = State("keybinds")
    local v2 = {}
    for k, v in pairs(p1.abilities) do
        if k ~= "Swing" then
            v1 = getDisplayNameForAbility(p1, k)
            v2[v1] = v.Keybind
        end
    end
    keybinds({visible = true, binds = v2})
end
local function inputMatchesKeybind(p1, p2) -- Line: 275
    local v1
    if p2.EnumType == Enum.KeyCode then
        v1 = p1.KeyCode == p2
        return v1
    end
    if p2.EnumType ~= Enum.UserInputType then
        return false
    end
    v1 = p1.UserInputType == p2
    return v1
end
local function disconnectAbilityInput() -- Line: 288 -- upvalues: u208 (ref)
    if u208 then
        u208:Disconnect()
        u208 = nil
    end
end
local function bindAbilityInput() -- Line: 299 -- upvalues: disconnectAbilityInput (val), u207 (ref), u208 (ref), UserInputService (val), State (val), inputMatchesKeybind (val), isPartBusy (val), ClientShifterHealthHandler (val), onUpdateControlCooldowns (val), Player (val), Shifter (val), getDisplayNameForAbility (val), Signals (val)
    disconnectAbilityInput()
    if not u207 then
        return
    end
    u208 = UserInputService.InputBegan:Connect(function(p1, p2) -- Line: 307 -- upvalues: u207 (upval), State (upval), inputMatchesKeybind (upval), isPartBusy (upval), ClientShifterHealthHandler (upval), onUpdateControlCooldowns (upval), Player (upval), Shifter (upval), getDisplayNameForAbility (upval), Signals (upval)
        local cooldowns_2, disabledControls_2
        local v1 = u207
        if not v1 then
            return
        end
        _, cooldowns_2 = State("cooldowns")
        _, disabledControls_2 = State("disabledControls")
        if p2 then
            return
        else
            if v1.state.stunned then
                return
            end
            if p1.UserInputType == Enum.UserInputType.Keyboard then
                local Requires, v2, v3, v4
                for k, v in pairs(v1.abilities) do
                    if inputMatchesKeybind(p1, v.Keybind) then
                        v2 = k == "Swing"
                        v3 = v.Stamina or 0
                        if not v2 and cooldowns_2[k] then
                            return
                        end
                        if not v2 and disabledControls_2[k] then
                            return
                        end
                        if v2 then
                            if v1.state.hitstunned then
                                return
                            end
                            Requires = v.Requires
                            if not Requires then
                                Requires = {}
                            end
                            for i, i2 in ipairs(Requires) do
                                if isPartBusy(v1.state, i2) then
                                    return
                                end
                            end
                        end
                        if not (ClientShifterHealthHandler.canAffordStamina(v1, v3)) then
                            return
                        end
                        if not v2 then
                            v1.cooldowns[k] = true
                            onUpdateControlCooldowns(v1)
                        end
                        Player.Shifter.post(Shifter.Effects.Ability, k)
                        if not v2 then
                            v4 = getDisplayNameForAbility(v1, k)
                            Signals.Buff:Fire({id = v4, length = v.Cooldown})
                        end
                        return
                    end
                end
                return
            elseif p1.UserInputType ~= Enum.UserInputType.MouseButton1 then
                return
            end
        end
    end)
end
local function registerControlCleanup(p1) -- Line: 379 -- upvalues: u209 (ref), disconnectAbilityInput (val), u207 (ref), Camera (val), State (val), ClientStateHandler (val), States (val)
    if u209 == p1 then
        return
    end
    u209 = p1
    p1:Add(function() -- Line: 386 -- upvalues: disconnectAbilityInput (upval), u207 (upval), u209 (upval), Camera (upval), State (upval), ClientStateHandler (upval), States (upval)
        disconnectAbilityInput()
        u207 = nil
        u209 = nil
        Camera.disable()
        task.defer(function() -- Line: 393 -- upvalues: Camera (upval)
            Camera.disable()
        end)
        local keybinds = State("keybinds")
        local hotbar = State("hotbar")
        keybinds({visible = false, binds = {}})
        hotbar({visible = true})
        ClientStateHandler.updateState(States.TRANSFORMED, false)
    end)
end
return {
    onLoadControlHandler = function(p1) -- Line: 483 -- upvalues: State (val), u207 (ref), Camera (val), onUpdateKeybinds (val), ClientStateHandler (val), States (val), bindAbilityInput (val), registerControlCleanup (val)
        local hotbar = State("hotbar")
        u207 = p1
        Camera.setCameraMode(p1.variant)
        Camera.enable()
        onUpdateKeybinds(p1)
        hotbar({visible = false})
        ClientStateHandler.updateState(States.TRANSFORMED, true)
        bindAbilityInput()
        registerControlCleanup(p1.trove)
    end,
    onReloadControlHandler = function(p1) -- Line: 508 -- upvalues: u207 (ref), onUpdateKeybinds (val), onUpdateDisabledControls (val), onUpdateControlCooldowns (val), bindAbilityInput (val)
        u207 = p1
        onUpdateKeybinds(p1)
        onUpdateDisabledControls(p1)
        onUpdateControlCooldowns(p1)
        bindAbilityInput()
    end,
    onSyncActiveShifter = function(p1) -- Line: 521 -- upvalues: u207 (ref)
        u207 = p1
    end,
    onUpdateControlCooldowns = onUpdateControlCooldowns,
    onUpdateDisabledControls = onUpdateDisabledControls,
    onUpdateKeybinds = onUpdateKeybinds,
    onHandleShifterStunned = function(p1, p2) -- Line: 122 -- upvalues: u205 (val), u206 (val), u202 (val)
        local u2 = p2 or "stunned"
        local v1 = u205[u2]
        if v1 then
            task.cancel(v1)
        end
        local v2 = u206[u2]
        if v2 then
            v2()
        end
        local u19 = u202(u2, 0, "set", 20)
        u206[u2] = u19
        u205[u2] = task.delay(p1, function() -- Line: 137 -- upvalues: u19 (val), u206 (upval), u2 (val), u205 (upval)
            u19()
            u206[u2] = nil
            u205[u2] = nil
        end)
    end,
    onHandleShifterHitstun = function(p1) -- Line: 149 -- upvalues: Workspace (val), u203 (ref), u204 (ref), u202 (val)
        if u203 then
            task.cancel(u203)
            u204()
        end
        if u204 then
            u204()
        end
        u204 = u202("hitstunned", 15, "set", 35)
        u203 = task.delay(p1 - Workspace:GetServerTimeNow(), function() -- Line: 165 -- upvalues: u204 (upval)
            u204()
        end)
    end,
    onHandleShifterBerserk = function(p1) -- Line: 418 -- upvalues: Lighting (val), Effects (val), TweenService (val)
        if p1 then
            local ColorCorrectionEffect = Instance.new("ColorCorrectionEffect")
            ColorCorrectionEffect.Brightness = 20
            ColorCorrectionEffect.Contrast = -200
            ColorCorrectionEffect.Saturation = -100
            ColorCorrectionEffect.TintColor = Color3.fromRGB(255, 0, 0)
            ColorCorrectionEffect.Enabled = false
            ColorCorrectionEffect.Parent = Lighting
            task.wait(0.06)
            ColorCorrectionEffect.Enabled = true
            task.wait(0.06)
            ColorCorrectionEffect.Enabled = false
            task.wait(0.4)
            ColorCorrectionEffect.Enabled = true
            task.wait(0.06)
            ColorCorrectionEffect.Enabled = false
            Effects.Screen.__createClientScreenEffect({name = "Base Flow", color = Color3.fromRGB(159, 21, 21)})
            task.wait(0.5)
            ColorCorrectionEffect.Enabled = true
            task.wait(0.3)
            ColorCorrectionEffect.Enabled = false
            task.wait(0.3)
            ColorCorrectionEffect.Enabled = true
            task.wait(2)
            ColorCorrectionEffect.Brightness = -1
            ColorCorrectionEffect.Contrast = -1
            ColorCorrectionEffect.Saturation = -1
            ColorCorrectionEffect.TintColor = Color3.fromRGB(255, 78, 78)
            local v1 = TweenInfo.new(0.5)
            TweenService:Create(ColorCorrectionEffect, v1, {Brightness = 0, Contrast = 0, Saturation = 0, TintColor = Color3.fromRGB(255, 255, 255)}):Play()
        end
    end,
}