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
--  File: ReplicatedStorage.Client.Interfaces.Routes.Interactions.Types.Items.Handcuff
--                               Dumped in 0.00122 seconds
--                          Bytecode version 9  |  6 functions

local u152
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Player = require(Namespaces:WaitForChild("Player"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Utilities = Common_2:WaitForChild("Utilities")
local Character = require(Utilities:WaitForChild("Character"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Signals = require(Common_3:WaitForChild("Signals"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_4:WaitForChild("Common")
local Animations = Common_4:WaitForChild("Animations")
local Default = require(Animations:WaitForChild("Default"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_5:WaitForChild("Common")
local Observers = Common_5:WaitForChild("Observers")
local useAnimatorObserver = require(Observers:WaitForChild("useAnimatorObserver"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_6:WaitForChild("Client")
local Progression = Client:WaitForChild("Progression")
local ClientAttributesHandler = require(Progression:WaitForChild("ClientAttributesHandler"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_7:WaitForChild("Common")
local Statistics = Common_6:WaitForChild("Statistics")
_, u152 = require(Statistics:WaitForChild("useWalkSpeed"))()
local u153 = {}
return {
    interacted = function(p1, p2) -- Line: 61 -- upvalues: Character (val), u153 (val), Player (val), ClientAttributesHandler (val), useAnimatorObserver (val), Default (val), u152 (val), Signals (val), RunService (val)
        local u4 = Character.getCharacter()
        if p2.Name ~= "Handcuff" or not u4 then
            Player.Handcuff.unreliablePost(p1, p2)
            return
        end
        if u153[p1] then
            return
        end
        local Parent = p1.Parent
        local v1 = Parent
        if v1 then
            v1 = Parent:GetAttribute("Ragdolled") == true
        end
        if v1 then
            Player.Handcuff.unreliablePost(p1, p2)
            return
        end
        local HandcuffSpeedMultiplier = ClientAttributesHandler.getAttribute("HandcuffSpeedMultiplier")
        local u29 = 0
        local u30 = HandcuffSpeedMultiplier * 1.667
        local u35 = useAnimatorObserver.play(Default.Handcuff)
        u35:AdjustSpeed(1 - HandcuffSpeedMultiplier + 1)
        Player.HandcuffStart.unreliablePost(p1, u35.Speed)
        local u52 = u152("handcuffing", 7, "set", 10)
        local function onSuccessfulHandcuff() -- Line: 95 -- upvalues: u52 (val), Player (upval), p1 (val), p2 (val), u35 (val), u153 (upval)
            u52()
            Player.Handcuff.unreliablePost(p1, p2)
            u35:Stop(0.2)
            u153[p1] = false
        end
        local function onFailedHandcuff() -- Line: 106 -- upvalues: u52 (val), Signals (upval), u35 (val), u153 (upval), p1 (val)
            u52()
            Signals.Toast:Fire({message = "The user escaped the handcuffing range.", type = "error"})
            u35:Stop(0.2)
            u153[p1] = false
        end
        local u55 = nil
    end,
    display = {
        header = "Handcuff",
        body = "Press \"%s\" to handcuff user.",
        options = function(p1) -- Line: 39
            local v1, v2
            local Attribute = p1:GetAttribute("Handcuffed")
            local Attribute_2 = p1:GetAttribute("Bagged")
            local v3 = {}
            local v4 = {Image = "rbxassetid://12966845909", Default = true}
            if not Attribute then
                v1 = "Handcuff"
            else
                v1 = "Release"
            end
            v4.Name = v1
            local v5 = {Image = "rbxassetid://12966845909", Default = true}
            if not Attribute_2 then
                v2 = "Bag"
            else
                v2 = "Unbag"
            end
            v5.Name = v2
            v3[1] = v4
            v3[2] = {Image = "rbxassetid://11293977875", Name = "Search", Default = false}
            v3[3] = {Image = "rbxassetid://11293977875", Name = "Carry", Default = false}
            v3[4] = v5
            return v3
        end,
    },
}