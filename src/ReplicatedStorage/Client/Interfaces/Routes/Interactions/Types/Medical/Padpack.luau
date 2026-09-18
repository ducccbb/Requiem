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
--  File: ReplicatedStorage.Client.Interfaces.Routes.Interactions.Types.Medical.Padpack
--                              Dumped in 0.000935 seconds
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
local Animations = Common:WaitForChild("Animations")
local Default = require(Animations:WaitForChild("Default"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Observers = Common_2:WaitForChild("Observers")
local useAnimatorObserver = require(Observers:WaitForChild("useAnimatorObserver"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_3:WaitForChild("Client")
local User = Client:WaitForChild("User")
local State = User:WaitForChild("State")
local ClientStateHandler = require(State:WaitForChild("ClientStateHandler"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Network = Common_3:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Interaction = require(Namespaces:WaitForChild("Interaction"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_5:WaitForChild("Common")
local Signals = require(Common_4:WaitForChild("Signals"))
local u121 = false
return {
    interacted = function(...) -- Line: 30 -- upvalues: u121 (ref), Signals (val), ClientStateHandler (val), Players (val), Interaction (val), useAnimatorObserver (val), Default (val), Workspace (val)
        local Character, commit, u36, u40, v1
        if u121 then
            return
        end
        local u1 = {...}
        local u3 = u1[1]
        local Attribute = u3
        if Attribute then
            Attribute = u3:GetAttribute("Amount")
        end
        if not Attribute or not u3 then
            if ClientStateHandler.isCategoryBusy(ClientStateHandler.Categories.NO_GEAR_HANDLE_USAGE) then
                return
            end
            Character = Players.LocalPlayer.Character
            if Character then
                if not (Character:FindFirstChildWhichIsA("Humanoid")) then
                    Interaction.Event.unreliablePost(...)
                    return
                end
                u121 = true
                u36 = nil
                v1 = pcall(function() -- Line: 62 -- upvalues: u36 (ref), useAnimatorObserver (upval), Character (val), Default (upval)
                    u36 = useAnimatorObserver.playAnimationOnRig(Character, Default.PickUp, 0.1, Enum.AnimationPriority.Action)
                end)
                u40 = false
                function commit() -- Line: 67 -- upvalues: u40 (ref), u121 (upval), u3 (val), Workspace (upval), Interaction (upval), u1 (val)
                    if u40 then
                        return
                    end
                    u40 = true
                    u121 = false
                    if not u3.Parent or not (u3:IsDescendantOf(Workspace)) or u3:GetAttribute("Busy") then
                        return
                    end
                    Interaction.Event.unreliablePost(table.unpack(u1))
                end
                if not v1 or not u36 then
                    commit()
                    return
                end
                u36.Stopped:Once(commit)
                return
            end
            Interaction.Event.unreliablePost(...)
            return
        end
        local Attribute_2 = u3:GetAttribute("Amount")
        if Attribute_2 <= 0 then
            return Signals.Toast:Fire({message = "This padpack is empty.", type = "error"})
        end
        if ClientStateHandler.isCategoryBusy(ClientStateHandler.Categories.NO_GEAR_HANDLE_USAGE) then
            return
        end
        Character = Players.LocalPlayer.Character
        if not Character or not (Character:FindFirstChildWhichIsA("Humanoid")) then
            Interaction.Event.unreliablePost(...)
            return
        end
        u121 = true
        u36 = nil
        v1 = pcall(function() -- Line: 62 -- upvalues: u36 (ref), useAnimatorObserver (upval), Character (val), Default (upval)
            u36 = useAnimatorObserver.playAnimationOnRig(Character, Default.PickUp, 0.1, Enum.AnimationPriority.Action)
        end)
        u40 = false
        function commit() -- Line: 67 -- upvalues: u40 (ref), u121 (upval), u3 (val), Workspace (upval), Interaction (upval), u1 (val)
            if u40 then
                return
            end
            u40 = true
            u121 = false
            if not u3.Parent or not (u3:IsDescendantOf(Workspace)) or u3:GetAttribute("Busy") then
                return
            end
            Interaction.Event.unreliablePost(table.unpack(u1))
        end
        if not v1 or not u36 then
            commit()
            return
        end
        u36.Stopped:Once(commit)
    end,
    display = {header = "Padpack", body = "Press \"%s\" to take a bandage from the padpack."},
}