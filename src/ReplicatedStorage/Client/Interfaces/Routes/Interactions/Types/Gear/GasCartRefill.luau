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
--File: ReplicatedStorage.Client.Interfaces.Routes.Interactions.Types.Gear.GasCartRefill
--                              Dumped in 0.000551 seconds
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
local v2 = {header = "Gas Cart Refill", body = "Press \"%s\" to take gas from the gas cart."}
return {
    interacted = function(...) -- Line: 25 -- upvalues: ClientGearHandler (val), Signals (val), ClientStateHandler (val), Interaction (val)
        local v1
        local v2 = ClientGearHandler.getGearState()
        local v3 = {...}
        local v4 = v3[1]
        local Attribute = v4
        if Attribute then
            Attribute = v4:GetAttribute("Amount")
        end
        if not Attribute or not v4 then
            if v2 then
                if ClientStateHandler.isCategoryBusy(ClientStateHandler.Categories.NO_GEAR_HANDLE_USAGE) then
                    return
                end
                v1 = unpack(v3)
                Interaction.Event.unreliablePost(v1, v2.maxGas - v2.gas)
                return
            end
            return
        end
        local Attribute_2 = v4:GetAttribute("Amount")
        if Attribute_2 <= 0 then
            return Signals.Toast:Fire({message = "This gas cart is empty.", type = "error"})
        end
        if not v2 or ClientStateHandler.isCategoryBusy(ClientStateHandler.Categories.NO_GEAR_HANDLE_USAGE) then
            return
        end
        v1 = unpack(v3)
        Interaction.Event.unreliablePost(v1, v2.maxGas - v2.gas)
    end,
    display = v2,
}