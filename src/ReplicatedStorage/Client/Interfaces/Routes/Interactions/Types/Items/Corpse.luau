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
--   File: ReplicatedStorage.Client.Interfaces.Routes.Interactions.Types.Items.Corpse
--                              Dumped in 0.000642 seconds
--                          Bytecode version 9  |  6 functions

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
local Interaction = require(Namespaces:WaitForChild("Interaction"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Network_2 = Common_2:WaitForChild("Network")
local Namespaces_2 = Network_2:WaitForChild("Namespaces")
local Server = require(Namespaces_2:WaitForChild("Server"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Signals = require(Common_3:WaitForChild("Signals"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_4:WaitForChild("Client")
local User = Client:WaitForChild("User")
local Equipment = User:WaitForChild("Equipment")
local Gear = Equipment:WaitForChild("Gear")
local ClientGearHandler = require(Gear:WaitForChild("ClientGearHandler"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_5:WaitForChild("Common")
local Animations = Common_4:WaitForChild("Animations")
local Default = require(Animations:WaitForChild("Default"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_6:WaitForChild("Common")
local Observers = Common_5:WaitForChild("Observers")
local useAnimatorObserver = require(Observers:WaitForChild("useAnimatorObserver"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_7:WaitForChild("Common")
local Utilities = Common_6:WaitForChild("Utilities")
local Character = require(Utilities:WaitForChild("Character"))
local function onRefillRequest(p1) -- Line: 49 -- upvalues: ClientGearHandler (val), Signals (val), Character (val), useAnimatorObserver (val), Default (val), Interaction (val), RunService (val)
    local v1 = ClientGearHandler.getGearState()
    if not v1 or not v1.enabled then
        Signals.Toast:Fire({message = "You cannot refill your gas or blades unless you have gear equipped.", type = "error"})
        return
    end
    local u7 = Character.getCharacter()
    if not u7 then
        return
    end
    local u12 = useAnimatorObserver.play(Default.CorpseRefill)
    local function onSuccessRefillRequest() -- Line: 74 -- upvalues: u12 (val), Interaction (upval), p1 (val)
        if u12 then
            u12:Stop(0.2)
        end
        Interaction.Event.unreliablePost(p1, {Name = "Refill"})
    end
    local function onCancelRefillRequest() -- Line: 85 -- upvalues: u12 (val)
        if u12 then
            u12:Stop(0.2)
        end
    end
    local Position = u7.HumanoidRootPart.Position
    local u17 = 0
    local u18 = nil
end
return {
    interacted = function(p1, p2) -- Line: 117 -- upvalues: Server (val), Signals (val), onRefillRequest (val), Interaction (val)
        if Server.Store.client().event == 0 then
            return Signals.Toast:Fire({message = "You cannot interact with corpses unless an event is active.", type = "error"})
        end
        if p2.Name == "Refill" then
            onRefillRequest(p1)
            return
        end
        Interaction.Event.unreliablePost(p1, p2)
    end,
    display = {
        header = "Corpse",
        body = "Press \"%s\" to search the corpse.",
        options = {
            {Image = "rbxassetid://12966845909", Name = "Search", Default = true},
            {Image = "rbxassetid://12966845909", Name = "Carry", Default = false},
            {Image = "rbxassetid://12966845909", Name = "Refill", Default = false},
        },
    },
}