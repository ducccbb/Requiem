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
--    File: ReplicatedStorage.Client.Interfaces.Routes.Interactions.Types.Items.Giver
--                              Dumped in 0.000731 seconds
--                          Bytecode version 9  |  6 functions

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
local u83 = false
return {
    interacted = function(p1, p2) -- Line: 49 -- upvalues: Interaction (val), u83 (ref), Players (val), useAnimatorObserver (val), Default (val), Workspace (val)
        local Character, commit, u18, u22, v1
        if not p2 then
            if u83 then
                return
            end
            Character = Players.LocalPlayer.Character
            if Character then
                if not (Character:FindFirstChildWhichIsA("Humanoid")) then
                    Interaction.Event.unreliablePost(p1, p2)
                    return
                end
                u83 = true
                u18 = nil
                v1 = pcall(function() -- Line: 68 -- upvalues: u18 (ref), useAnimatorObserver (upval), Character (val), Default (upval)
                    u18 = useAnimatorObserver.playAnimationOnRig(Character, Default.PickUp, 0.1, Enum.AnimationPriority.Action)
                end)
                u22 = false
                function commit() -- Line: 73 -- upvalues: u22 (ref), u83 (upval), p1 (val), Workspace (upval), Interaction (upval), p2 (val)
                    if u22 then
                        return
                    end
                    u22 = true
                    u83 = false
                    if not p1.Parent or not (p1:IsDescendantOf(Workspace)) then
                        return
                    end
                    Interaction.Event.unreliablePost(p1, p2)
                end
                if not v1 or not u18 then
                    commit()
                    return
                end
                u18.Stopped:Once(commit)
                return
            end
            Interaction.Event.unreliablePost(p1, p2)
            return
        end
        if p2.Name ~= "Take Item" then
            Interaction.Event.unreliablePost(p1, p2)
            return
        end
        if u83 then
            return
        end
        Character = Players.LocalPlayer.Character
        if not Character or not (Character:FindFirstChildWhichIsA("Humanoid")) then
            Interaction.Event.unreliablePost(p1, p2)
            return
        end
        u83 = true
        u18 = nil
        v1 = pcall(function() -- Line: 68 -- upvalues: u18 (ref), useAnimatorObserver (upval), Character (val), Default (upval)
            u18 = useAnimatorObserver.playAnimationOnRig(Character, Default.PickUp, 0.1, Enum.AnimationPriority.Action)
        end)
        u22 = false
        function commit() -- Line: 73 -- upvalues: u22 (ref), u83 (upval), p1 (val), Workspace (upval), Interaction (upval), p2 (val)
            if u22 then
                return
            end
            u22 = true
            u83 = false
            if not p1.Parent or not (p1:IsDescendantOf(Workspace)) then
                return
            end
            Interaction.Event.unreliablePost(p1, p2)
        end
        if not v1 or not u18 then
            commit()
            return
        end
        u18.Stopped:Once(commit)
    end,
    display = {
        body = "Press \"%s\" to take item from box.",
        header = function(p1) -- Line: 23
            return p1:GetAttribute("Item") or "Item Box"
        end,
        options = function(p1) -- Line: 30
            local Attribute = p1:GetAttribute("Carryable")
            local v1 = {
                {Image = "rbxassetid://12966845909", Name = "Take Item", Default = true},
                {Image = "rbxassetid://11293977875", Name = "Inspect Box", Default = false},
            }
            if Attribute then
                table.insert(v1, {Image = "rbxassetid://14187686429", Name = "Carry", Default = false})
            end
            return v1
        end,
    },
}