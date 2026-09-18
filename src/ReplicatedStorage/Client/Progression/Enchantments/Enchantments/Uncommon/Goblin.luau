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
-- File: ReplicatedStorage.Client.Progression.Enchantments.Enchantments.Uncommon.Goblin
--                              Dumped in 0.000579 seconds
--                          Bytecode version 9  |  3 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Alive = require(Common:WaitForChild("Alive"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Utilities = Common_2:WaitForChild("Utilities")
local Character = require(Utilities:WaitForChild("Character"))
local Players = game:GetService("Players")
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Animations = Common_3:WaitForChild("Animations")
local Enchantments = require(Animations:WaitForChild("Enchantments"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_4:WaitForChild("Common")
local Observers = Common_4:WaitForChild("Observers")
local useAnimatorObserver = require(Observers:WaitForChild("useAnimatorObserver"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_5:WaitForChild("Common")
local Signals = require(Common_5:WaitForChild("Signals"))
local v2 = {description = "You can now pickpocket others.", passive = false, upgradable = false}
local v3 = {wall = "Rose"}
local v4 = {}
v3.enchantments = v4
v2.prerequisites = v3
return {
    settings = v2,
    activated = function(p1) -- Line: 31 -- upvalues: Character (val), Players (val), Alive (val), useAnimatorObserver (val), Enchantments (val)
        local v1 = Character.getCharacter()
        local HumanoidRootPart = v1
        if HumanoidRootPart then
            HumanoidRootPart = v1:FindFirstChild("HumanoidRootPart")
        end
        if not v1 or not HumanoidRootPart then
            return
        end
        local LocalPlayer = Players.LocalPlayer
        local v2 = RaycastParams.new()
        v2.FilterType = Enum.RaycastFilterType.Exclude
        v2.FilterDescendantsInstances = {v1}
        local Position = HumanoidRootPart.Position
        local v3 = workspace:Raycast(Position, (LocalPlayer:GetMouse().Hit.Position - Position).Unit * 100, v2)
        if not v3 then
            return
        end
        local v4 = v3.Instance:FindFirstAncestorWhichIsA("Model")
        if not v4 then
            return
        end
        local v5 = Alive.getPlayerFromCharacter(v4)
        if not v5 or v5 == LocalPlayer then
            return
        end
        local v6 = useAnimatorObserver.play(Enchantments.Pickpocket)
        if v6 then
            v6.Looped = false
            v6:AdjustSpeed(1.5)
        end
        p1(v5)
    end,
    requested = function(p1) -- Line: 84 -- upvalues: Signals (val)
        if type(p1.remainingCooldown) == "number" and 0 < p1.remainingCooldown then
            Signals.EnchantmentCooldownAdjusted:Fire({name = "Goblin", remaining = p1.remainingCooldown})
        end
    end,
}