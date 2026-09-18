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
--    File: ReplicatedStorage.Client.Interfaces.Routes.Interactions.Types.Items.Item
--                              Dumped in 0.000803 seconds
--                          Bytecode version 9  |  5 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Interaction = require(Namespaces:WaitForChild("Interaction"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Animations = Common_2:WaitForChild("Animations")
local Default = require(Animations:WaitForChild("Default"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Observers = Common_3:WaitForChild("Observers")
local useAnimatorObserver = require(Observers:WaitForChild("useAnimatorObserver"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_4:WaitForChild("Common")
local Utilities = Common_4:WaitForChild("Utilities")
local Sounds = require(Utilities:WaitForChild("Sounds"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_5:WaitForChild("Common")
local Sounds_2 = Common_5:WaitForChild("Sounds")
local Universal = require(Sounds_2:WaitForChild("Universal"))
local u121 = false
return {
    interacted = function(...) -- Line: 35 -- upvalues: u121 (ref), Players (val), Interaction (val), useAnimatorObserver (val), Default (val), Sounds (val), Universal (val), Workspace (val)
        if u121 then
            return
        end
        local u1 = {...}
        local Character = Players.LocalPlayer.Character
        if not Character or not (Character:FindFirstChildWhichIsA("Humanoid")) then
            Interaction.Event.unreliablePost(...)
            return
        end
        u121 = true
        local u11 = nil
        local v1 = pcall(function() -- Line: 50 -- upvalues: u11 (ref), useAnimatorObserver (upval), Character (val), Default (upval)
            u11 = useAnimatorObserver.playAnimationOnRig(Character, Default.PickUp, 0.1, Enum.AnimationPriority.Action)
        end)
        local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
        if HumanoidRootPart then
            Sounds.playRangedSoundEffect(Universal.ItemPickup, HumanoidRootPart, 30, 0.5, {min = 0.95, max = 1.05})
        end
        local u29 = u1[1]
        local u30 = false
        local function commit() -- Line: 62 -- upvalues: u30 (ref), u121 (upval), u29 (val), Workspace (upval), Interaction (upval), u1 (val)
            if u30 then
                return
            end
            u30 = true
            u121 = false
            if not u29.Parent or not (u29:IsDescendantOf(Workspace)) or u29:GetAttribute("Busy") then
                return
            end
            Interaction.Event.unreliablePost(table.unpack(u1))
        end
        if not v1 or not u11 then
            commit()
            return
        end
        u11.Stopped:Once(commit)
    end,
    display = {
        body = "Press \"%s\" to take item from ground.",
        header = function(p1) -- Line: 25
            return p1:GetAttribute("Item") or "Item"
        end,
    },
}