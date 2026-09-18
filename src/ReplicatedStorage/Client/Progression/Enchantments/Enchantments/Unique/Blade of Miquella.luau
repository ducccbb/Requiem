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
--File: ReplicatedStorage.Client.Progression.Enchantments.Enchantments.Unique.Blade of Miquella
--                              Dumped in 0.000650 seconds
--                          Bytecode version 9  |  5 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
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
local Client = ReplicatedStorage_4:WaitForChild("Client")
local User = Client:WaitForChild("User")
local Equipment = User:WaitForChild("Equipment")
local Gear = Equipment:WaitForChild("Gear")
local ClientGearHandler = require(Gear:WaitForChild("ClientGearHandler"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_5:WaitForChild("Common")
local Utilities_2 = Common_4:WaitForChild("Utilities")
local Sounds = require(Utilities_2:WaitForChild("Sounds"))
local v2 = {description = "A sacred dance of impossible speed and unwavering grace.", passive = false, upgradable = false, blades = true}
local u120 = {
    one = "Slash One",
    two = "Slash Two",
    three = "Slash Three",
    final = "Final Slash",
    flurry = "Flurry",
    big = "Bigger Slash",
}
local u121 = {spin = "Spin", twirl = "Twirl", star = "Star"}
local u122 = nil
local u123 = nil
return {
    activated = function(p1) -- Line: 51 -- upvalues: useAnimatorObserver (val), Enchantments (val), Character (val), u120 (val), ClientGearHandler (val), u121 (val), u122 (ref), u123 (ref)
        local Ground
        useAnimatorObserver.preload(Enchantments.BladeofMiquella)
        local v1 = Character.getCharacter()
        if not v1 or not (v1:FindFirstChild("HumanoidRootPart")) then
            return
        end
        if not (Character.isGrounded(v1)) then
            Ground = Enchantments.BladeofMiquella.Air
        else
            Ground = Enchantments.BladeofMiquella.Ground
            if not Ground then
                Ground = Enchantments.BladeofMiquella.Air
            end
        end
        local v2 = useAnimatorObserver.play(Ground, 0.1)
        if not v2 then
            return
        end
        u122 = v2.KeyframeReached:Connect(function(a1) -- Line: 72 -- upvalues: u120 (upval), ClientGearHandler (upval), p1 (val), u121 (upval)
            local v1
            local v2 = u120
            local v3 = nil
            local v4 = nil
            for i, j in v2, v3, v4 do
                if a1 == i then
                    v1 = ClientGearHandler.getGearState()
                    if not v1 then
                        return
                    end
                    v1.signals.simulateBladeSwing:Fire(0.65)
                    p1(j)
                    return
                end
            end
            v2 = u121
            v3 = nil
            v4 = nil
            for k, n in v2, v3, v4 do
                if a1 == k then
                    p1(n)
                    return
                end
            end
        end)
        u123 = v2.Stopped:Connect(function() -- Line: 99 -- upvalues: u122 (upval), u123 (upval)
            if u122 then
                u122:Disconnect()
                u122 = nil
            end
            if u123 then
                u123:Disconnect()
                u123 = nil
            end
        end)
    end,
    settings = v2,
    requested = function(p1) -- Line: 116 -- upvalues: Character (val), Sounds (val)
        local v1 = Character.getCharacter()
        if not v1 then
            return
        end
        local HumanoidRootPart = v1:FindFirstChild("HumanoidRootPart")
        if not HumanoidRootPart then
            return
        end
        Sounds.playFalloffSoundEffect(p1, HumanoidRootPart, 1000, 8)
    end,
}