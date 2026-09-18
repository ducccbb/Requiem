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
--   File: ReplicatedStorage.Client.Interfaces.Routes.Interactions.Types.Gear.Gearset
--                              Dumped in 0.000705 seconds
--                          Bytecode version 9  |  4 functions

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
    interacted = function(...) -- Line: 29 -- upvalues: u83 (ref), Players (val), Interaction (val), useAnimatorObserver (val), Default (val), Workspace (val)
        if u83 then
            return
        end
        local u1 = {...}
        local Character = Players.LocalPlayer.Character
        if not Character or not (Character:FindFirstChildWhichIsA("Humanoid")) then
            Interaction.Event.unreliablePost(...)
            return
        end
        u83 = true
        local u11 = nil
        local v1 = pcall(function() -- Line: 44 -- upvalues: u11 (ref), useAnimatorObserver (upval), Character (val), Default (upval)
            u11 = useAnimatorObserver.playAnimationOnRig(Character, Default.PickUp, 0.1, Enum.AnimationPriority.Action)
        end)
        local u15 = u1[1]
        local u16 = false
        local function commit() -- Line: 51 -- upvalues: u16 (ref), u83 (upval), u15 (val), Workspace (upval), Interaction (upval), u1 (val)
            if u16 then
                return
            end
            u16 = true
            u83 = false
            if not u15.Parent or not (u15:IsDescendantOf(Workspace)) or u15:GetAttribute("Busy") then
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
    display = {header = "Gear", body = "Press '%s' to take gear from ground."},
}