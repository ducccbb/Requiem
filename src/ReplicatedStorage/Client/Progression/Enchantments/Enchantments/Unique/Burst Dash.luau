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
--File: ReplicatedStorage.Client.Progression.Enchantments.Enchantments.Unique.Burst Dash
--                               Dumped in 0.00111 seconds
--                          Bytecode version 9  |  6 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Animations = Common:WaitForChild("Animations")
local Enchantments = require(Animations:WaitForChild("Enchantments"))
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
local Config = require(Common_4:WaitForChild("Config"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_5:WaitForChild("Common")
local Effects_2 = Common_5:WaitForChild("Effects")
local Effects = require(Effects_2:WaitForChild("Effects"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_6:WaitForChild("Common")
local Signals = require(Common_6:WaitForChild("Signals"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_7 = ReplicatedStorage_7:WaitForChild("Common")
local Utilities_2 = Common_7:WaitForChild("Utilities")
local Sounds = require(Utilities_2:WaitForChild("Sounds"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Common_8 = ReplicatedStorage_8:WaitForChild("Common")
local Sounds_2 = Common_8:WaitForChild("Sounds")
local Enchantments_2 = require(Sounds_2:WaitForChild("Enchantments"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_9:WaitForChild("Client")
local User = Client:WaitForChild("User")
local Equipment = User:WaitForChild("Equipment")
local Gear = Equipment:WaitForChild("Gear")
local ClientGearHandler = require(Gear:WaitForChild("ClientGearHandler"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_10:WaitForChild("Client")
local User_2 = Client_2:WaitForChild("User")
local State = User_2:WaitForChild("State")
local ClientStateHandler = require(State:WaitForChild("ClientStateHandler"))
local States = ClientStateHandler.States
local ReplicatedStorage_11 = game:GetService("ReplicatedStorage")
local Common_9 = ReplicatedStorage_11:WaitForChild("Common")
local Statistics = Common_9:WaitForChild("Statistics")
local useFieldOfView = require(Statistics:WaitForChild("useFieldOfView"))
local u233 = Config.define({
    GAS_COST = 150,
    BURST_FORCE = 280,
    ANIMATION_BLEND_TIME = 0.2,
    FOV_ADD = 25,
    FOV_DECAY = 4,
    FOV_IN_TWEEN_SECONDS = 0.3,
    FOV_RESTORE_DELAY_SECONDS = 0.3,
    FOV_OUT_TWEEN_SECONDS = 0.6,
})
local function getBurstDirection() -- Line: 62 -- upvalues: Workspace (val)
    local CurrentCamera = Workspace.CurrentCamera
    if not CurrentCamera then
        return nil
    end
    return CurrentCamera.CFrame.LookVector
end
local function performBurstDash() -- Line: 74 -- upvalues: Character (val), ClientGearHandler (val), ClientStateHandler (val), States (val), u233 (val), Signals (val), getBurstDirection (val), useAnimatorObserver (val), Enchantments (val), useFieldOfView (val), Sounds (val), Enchantments_2 (val), Effects (val)
    local v1
    local v2 = Character.getCharacter()
    if not v2 then
        return false
    end
    local HumanoidRootPart = v2:FindFirstChild("HumanoidRootPart")
    if not HumanoidRootPart then
        return false
    end
    local v3 = ClientGearHandler.getGearState()
    if not v3 or not v3.enabled or ClientStateHandler.isStateBusy(States.SWIMMING) then
        return false
    end
    if not (v3.useGas(u233.GAS_COST)) then
        Signals.Toast:Fire({message = "You do not have enough gas.", type = "error"})
        return false
    end
    local v4 = getBurstDirection()
    if not v4 then
        return false
    end
    if v3.animation then
        v3.animation:Stop(u233.ANIMATION_BLEND_TIME)
    end
    v3.animation = useAnimatorObserver.play(Enchantments.BurstDash, u233.ANIMATION_BLEND_TIME)
    v3.signals.setMaxVelocityGain:Fire()
    HumanoidRootPart.AssemblyLinearVelocity = v4.Unit * u233.BURST_FORCE
    v3.signals.beginSimulatedMomentum:Fire()
    _, v1 = useFieldOfView()
    local u79 = v1("Burst Dash", u233.FOV_ADD, "add", u233.FOV_DECAY, TweenInfo.new(u233.FOV_IN_TWEEN_SECONDS, Enum.EasingStyle.Back))
    task.delay(u233.FOV_RESTORE_DELAY_SECONDS, function() -- Line: 124 -- upvalues: u79 (val), u233 (upval)
        u79(TweenInfo.new(u233.FOV_OUT_TWEEN_SECONDS))
    end)
    Sounds.playRangedSoundEffect(Enchantments_2.BurstDash, HumanoidRootPart, 200, 0.5, math.random(95, 105) / 100)
    Signals.PlayerDashBoosted:Fire()
    Effects.sendReplicatedEffect("Dash")
    return true
end
useAnimatorObserver.preload({Enchantments.BurstDash})
return {
    activated = function() -- Line: 182 -- upvalues: performBurstDash (val)
        performBurstDash()
    end,
    verify = function() -- Line: 138 -- upvalues: Character (val), ClientGearHandler (val), Signals (val), u233 (val), ClientStateHandler (val), States (val)
        if not (Character.getCharacter()) then
            return false
        end
        local v1 = ClientGearHandler.getGearState()
        if not v1 or not v1.enabled then
            Signals.Toast:Fire({message = "You must have your gear equipped to use this enchantment.", type = "error"})
            return false
        end
        if v1.gas < u233.GAS_COST then
            Signals.Toast:Fire({message = "You do not have enough gas.", type = "error"})
            return false
        end
        if not (ClientStateHandler.isStateBusy(States.HANDLES)) then
            Signals.Toast:Fire({message = "You need to have your handles out to use this enchantment.", type = "error"})
            return false
        end
        if not (ClientStateHandler.isStateBusy(States.SWIMMING)) then
            return true
        end
        Signals.Toast:Fire({message = "You cannot use this enchantment while swimming.", type = "error"})
        return false
    end,
    settings = {
        description = "Burst in the direction you are looking at max gear velocity, at the cost of expending a sizeable amount of gas.",
        passive = false,
        upgradable = false,
        gear = true,
        handles = true,
        prerequisites = {wall = "Maria", enchantments = {}},
    },
}