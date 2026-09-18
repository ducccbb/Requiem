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
-- File: ReplicatedStorage.Client.Progression.Enchantments.Enchantments.Rare.Dare Devil
--                              Dumped in 0.000450 seconds
--                          Bytecode version 9  |  4 functions

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
local Common_4 = ReplicatedStorage_4:WaitForChild("Common")
local Signals = require(Common_4:WaitForChild("Signals"))
useAnimatorObserver.preload(Enchantments.Daredevil)
return {
    activated = function() end,
    requested = function() -- Line: 31 -- upvalues: Enchantments (val), useAnimatorObserver (val)
        local v1 = math.random(1, #Enchantments.Daredevil)
        useAnimatorObserver.play(Enchantments.Daredevil[v1], 0.1)
    end,
    verify = function() -- Line: 36 -- upvalues: Character (val), Signals (val)
        local v1 = Character.getCharacter()
        local PrimaryPart = v1
        if PrimaryPart then
            PrimaryPart = v1.PrimaryPart
        end
        if not PrimaryPart then
            return
        end
        local v2 = RaycastParams.new()
        v2.FilterType = Enum.RaycastFilterType.Exclude
        v2.FilterDescendantsInstances = {v1}
        local v3 = PrimaryPart.Position + PrimaryPart.CFrame.LookVector * 5
        local v4 = Vector3.new(0, -40, 0)
        if workspace:Raycast(v3, v4, v2) then
            Signals.Toast:Fire({message = "You must be on a edge to use this enchantment.", type = "error"})
            return false
        end
        if Character.isGrounded(v1) then
            return true
        end
        Signals.Toast:Fire({message = "You must be on the ground to use this enchantment.", type = "error"})
        return false
    end,
    settings = {
        description = "Launch yourself into the air for a velocity gain boost.",
        passive = false,
        upgradable = true,
        prerequisites = {wall = "Maria", enchantments = {}},
    },
}