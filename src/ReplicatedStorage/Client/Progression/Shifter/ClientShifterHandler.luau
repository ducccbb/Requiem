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
--        File: ReplicatedStorage.Client.Progression.Shifter.ClientShifterHandler
--                               Dumped in 0.00194 seconds
--                          Bytecode version 9  |  17 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Player = require(Namespaces:WaitForChild("Player"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Types = Common_2:WaitForChild("Types")
local Shifter = require(Types:WaitForChild("Shifter"))
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_3:WaitForChild("Packages")
local trove = require(Packages:WaitForChild("trove"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Animations = Common_3:WaitForChild("Animations")
local Default = require(Animations:WaitForChild("Default"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_5:WaitForChild("Common")
local Observers = Common_4:WaitForChild("Observers")
local useAnimatorObserver = require(Observers:WaitForChild("useAnimatorObserver"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_6:WaitForChild("Common")
local Animations_2 = Common_5:WaitForChild("Animations")
local Titans = require(Animations_2:WaitForChild("Titans"))
local Universal = v1.Parent:WaitForChild("Universal")
local ClientShifterAbilityHandler = require(Universal:WaitForChild("ClientShifterAbilityHandler"))
local Universal_2 = v1.Parent:WaitForChild("Universal")
local ClientShifterAnimationHandler = require(Universal_2:WaitForChild("ClientShifterAnimationHandler"))
local Universal_3 = v1.Parent:WaitForChild("Universal")
local ClientShifterControlHandler = require(Universal_3:WaitForChild("ClientShifterControlHandler"))
local Universal_4 = v1.Parent:WaitForChild("Universal")
local ClientShifterHealthHandler = require(Universal_4:WaitForChild("ClientShifterHealthHandler"))
local Universal_5 = v1.Parent:WaitForChild("Universal")
local ClientShifterMovementHandler = require(Universal_5:WaitForChild("ClientShifterMovementHandler"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_7:WaitForChild("Common")
local Utilities = Common_6:WaitForChild("Utilities")
local Shoulder = Utilities:WaitForChild("Shoulder")
local Camera = require(Shoulder:WaitForChild("Camera"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Common_7 = ReplicatedStorage_8:WaitForChild("Common")
local Statistics = Common_7:WaitForChild("Statistics")
local useWalkSpeed = require(Statistics:WaitForChild("useWalkSpeed"))
local u228 = nil
local u230 = trove.new()
local u231 = nil
local u232 = nil
local u233 = nil
local u234 = nil
local u235 = {}
local function onShifterTrapped(p1) -- Line: 47 -- upvalues: useAnimatorObserver (val), Titans (val)
    if not p1 or not p1.model then
        return
    end
    local u8 = useAnimatorObserver.playAnimationOnRig(p1.model, Titans.Trapped, 0.5)
    if not u8 then
        return
    end
    return function() -- Line: 58 -- upvalues: u8 (val)
        u8:Stop()
    end
end
local function onHandleShifterRequest(p1, p2, ...) -- Line: 68 -- upvalues: Shifter (val), ClientShifterAbilityHandler (val), u234 (ref), onShifterTrapped (val), ClientShifterControlHandler (val)
    local v1
    if p1 == Shifter.Effects.Ability then
        ClientShifterAbilityHandler.onHandleShifterAbilityRequest(p2, ...)
        return
    end
    if p1 ~= Shifter.Effects.Stun then
        if p1 == Shifter.Effects.Hitstun then
            ClientShifterControlHandler.onHandleShifterHitstun(p2, ...)
            return
        end
        if p1 == Shifter.Effects.Berserk then
            ClientShifterControlHandler.onHandleShifterBerserk(p2, ...)
        end
        return
    end
    local v2 = {p2, ...}
    local v3 = v2[1]
    local v4 = v2[2]
    if v4 then
        if u234 then
            task.cancel(u234)
            u234 = nil
        end
        local u27 = onShifterTrapped(v2[3])
        if u27 then
            u234 = task.delay(v3, function() -- Line: 85 -- upvalues: u27 (val), u234 (upval)
                u27()
                u234 = nil
            end)
        end
    end
    if not v4 then
        v1 = nil
    else
        v1 = "stunned_trap"
    end
    ClientShifterControlHandler.onHandleShifterStunned(v3, v1)
end
local function onDetransform(p1) -- Line: 105 -- upvalues: u233 (ref), Player (val)
    if u233 then
        task.cancel(u233)
        u233 = nil
    end
    u233 = task.delay(4, function() -- Line: 113 -- upvalues: Player (upval), u233 (upval)
        Player.Transform.post({action = "Detransform"})
        u233 = nil
    end)
end
local function onTransform(p1) -- Line: 130 -- upvalues: u232 (ref), u231 (ref), useAnimatorObserver (val), Default (val), u235 (val), Player (val)
    if p1.transformed then
        return
    end
    u232 = task.spawn(function() -- Line: 137 -- upvalues: u231 (upval), useAnimatorObserver (upval), Default (upval), u235 (upval), Player (upval), u232 (upval)
        u231 = useAnimatorObserver.play(Default.BiteHand, 0.5)
        if not u231 then
            return
        end
        u235.biteHandTrackStopped = u231.Stopped:Once(function(...) end)
        u235.keyframeConnection = u231.KeyframeReached:Connect(function(p1) -- Line: 148 -- upvalues: Player (upval)
            if p1 == "BiteHand" then
                Player.Transform.post({action = "Transform"})
            end
        end)
        u232 = nil
    end)
end
local function onDeadShifter(p1) -- Line: 227 -- upvalues: useWalkSpeed (val), Camera (val), u228 (ref)
    local v1
    if not p1.model then
        return
    end
    _, v1 = useWalkSpeed()
    v1("dead", 0, "set", 99)
    Camera.disable()
    p1.trove:Clean()
    p1.trove:Destroy()
    if u228 then
        u228.transformed = false
    end
end
local function onDestroyShifter(p1) -- Line: 253 -- upvalues: u228 (ref), Player (val)
    if not p1 then
        return
    end
    p1.trove:Clean()
    p1.trove:Destroy()
    u228 = nil
    Player.Transform.post({action = "Update"})
end
local function onRemoveShifter() -- Line: 275 -- upvalues: u228 (ref), u232 (ref), u233 (ref), u234 (ref), u235 (val)
    if u228 then
        u228.trove:Clean()
        u228.trove:Destroy()
        u228 = nil
    end
    u232 = nil
    u233 = nil
    if u234 then
        task.cancel(u234)
        u234 = nil
    end
    u235.biteHandTrackStopped = nil
    u235.keyframeConnection = nil
end
Player.Shifter.post(Shifter.Internal.Sync)
Player.Shifter.listen(function(p1, ...) -- Line: 297 -- upvalues: onRemoveShifter (val), onHandleShifterRequest (val), u228 (ref), u230 (ref), trove (val), onDestroyShifter (val), onDeadShifter (val), ClientShifterAnimationHandler (val), ClientShifterMovementHandler (val), ClientShifterControlHandler (val), ClientShifterHealthHandler (val)
    if p1 then
        if typeof(p1) == "string" then
            onHandleShifterRequest(p1, ...)
            return
        end
        if not u228 and p1 then
            u230 = trove.new()
        end
        if p1 then
            p1.trove = u230
        end
        if not u228 or not p1 then
            u228 = p1
            return
        end
        if p1.destroyed then
            onDestroyShifter(p1)
            return
        end
        if p1.dead then
            onDeadShifter(p1)
            return
        end
        local v1 = {...}
        local v2 = v1[1]
        if v2 and typeof(v2) == "table" and v1[3] then
            ClientShifterAnimationHandler.onLoadMovementAnimations(p1, v2)
            ClientShifterMovementHandler.onLoadMovementController(p1)
            ClientShifterControlHandler.onReloadControlHandler(p1)
        end
        if u228.transformed ~= p1.transformed and p1.model then
            ClientShifterAnimationHandler.onLoadMovementAnimations(p1)
            ClientShifterMovementHandler.onLoadMovementController(p1)
            ClientShifterControlHandler.onLoadControlHandler(p1)
            ClientShifterHealthHandler.onLoadHealthHandler(p1)
        end
        if p1.transformed then
            ClientShifterControlHandler.onSyncActiveShifter(p1)
        end
        ClientShifterControlHandler.onUpdateControlCooldowns(p1)
        ClientShifterControlHandler.onUpdateDisabledControls(p1)
        ClientShifterControlHandler.onUpdateKeybinds(p1)
        ClientShifterMovementHandler.onUpdateStates(p1.state)
        ClientShifterHealthHandler.onUpdateHealthBars(p1)
        ClientShifterHealthHandler.onUpdateShifterReference(p1)
        u228 = p1
        return
    elseif ... == "Remove" then
        onRemoveShifter()
        return
    end
end)
UserInputService.InputBegan:Connect(function(p1) -- Line: 165 -- upvalues: u228 (ref), onDetransform (val), onTransform (val)
    if p1.KeyCode ~= Enum.KeyCode.Z or not u228 then
        return
    end
    if u228.transformed then
        onDetransform(u228)
        return
    end
    onTransform(u228)
end)
UserInputService.InputEnded:Connect(function(p1) -- Line: 190 -- upvalues: u232 (ref), u231 (ref), u235 (val), u233 (ref)
    if p1.KeyCode ~= Enum.KeyCode.Z then
        return
    end
    if u232 then
        if u231 then
            u231:Stop()
            u231 = nil
        end
        if u235.biteHandTrackStopped then
            u235.biteHandTrackStopped:Disconnect()
        end
        if u235.keyframeConnection then
            u235.keyframeConnection:Disconnect()
        end
        u235.biteHandTrackStopped = nil
        u235.keyframeConnection = nil
        task.cancel(u232)
        u232 = nil
    end
    if u233 then
        task.cancel(u233)
        u233 = nil
    end
end)
return {}