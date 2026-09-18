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
-- File: ReplicatedStorage.Client.Interfaces.Routes.Interactions.Types.Gear.BladeRefill
--                              Dumped in 0.000550 seconds
--                          Bytecode version 9  |  2 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage:WaitForChild("Client")
local User = Client:WaitForChild("User")
local Equipment = User:WaitForChild("Equipment")
local Gear = Equipment:WaitForChild("Gear")
local ClientGearHandler = require(Gear:WaitForChild("ClientGearHandler"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_2:WaitForChild("Client")
local User_2 = Client_2:WaitForChild("User")
local State = User_2:WaitForChild("State")
local ClientStateHandler = require(State:WaitForChild("ClientStateHandler"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_3:WaitForChild("Common")
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Interaction = require(Namespaces:WaitForChild("Interaction"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_4:WaitForChild("Common")
local Signals = require(Common_2:WaitForChild("Signals"))
return {
    interacted = function(...) -- Line: 25 -- upvalues: ClientGearHandler (val), Signals (val), ClientStateHandler (val), Interaction (val)
        local v1 = ClientGearHandler.getGearState()
        local v2 = {...}
        local v3 = v2[1]
        local Attribute = v3
        if Attribute then
            Attribute = v3:GetAttribute("Amount")
        end
        if not Attribute or not v3 then
            if v1 then
                if ClientStateHandler.isCategoryBusy(ClientStateHandler.Categories.NO_GEAR_HANDLE_USAGE) then
                    return
                end
                Interaction.Event.unreliablePost(unpack(v2))
                return
            end
            return
        end
        local Attribute_2 = v3:GetAttribute("Amount")
        if Attribute_2 <= 0 then
            return Signals.Toast:Fire({message = "This blade box is empty.", type = "error"})
        end
        if not v1 or ClientStateHandler.isCategoryBusy(ClientStateHandler.Categories.NO_GEAR_HANDLE_USAGE) then
            return
        end
        Interaction.Event.unreliablePost(unpack(v2))
    end,
    display = {header = "Blade Refill", body = "Press \"%s\" to take blades from the blade box."},
}