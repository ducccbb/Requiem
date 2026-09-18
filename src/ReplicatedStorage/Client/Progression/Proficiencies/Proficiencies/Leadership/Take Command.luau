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
--File: ReplicatedStorage.Client.Progression.Proficiencies.Proficiencies.Leadership.Take Command
--                              Dumped in 0.000436 seconds
--                          Bytecode version 9  |  2 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Alive = require(Common:WaitForChild("Alive"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Utilities = Common_2:WaitForChild("Utilities")
local Character = require(Utilities:WaitForChild("Character"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Animations = Common_3:WaitForChild("Animations")
local Enchantments = require(Animations:WaitForChild("Enchantments"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_4:WaitForChild("Common")
local Observers = Common_4:WaitForChild("Observers")
local useAnimatorObserver = require(Observers:WaitForChild("useAnimatorObserver"))
local v2 = {}
return {
    activated = function(p1) -- Line: 24 -- upvalues: Character (val), Players (val), Alive (val), useAnimatorObserver (val), Enchantments (val)
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
        useAnimatorObserver.play(Enchantments.CheerBoost, 0.1)
        p1(v5)
    end,
    settings = v2,
}