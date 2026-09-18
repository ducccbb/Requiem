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
--  File: ReplicatedStorage.Client.Interfaces.Routes.Interactions.Types.Gear.Bladepack
--                               Dumped in 0.00102 seconds
--                          Bytecode version 9  |  5 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Animations = Common:WaitForChild("Animations")
local Gear = require(Animations:WaitForChild("Gear"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Observers = Common_2:WaitForChild("Observers")
local useAnimatorObserver = require(Observers:WaitForChild("useAnimatorObserver"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_3:WaitForChild("Client")
local Progression = Client:WaitForChild("Progression")
local ClientAttributesHandler = require(Progression:WaitForChild("ClientAttributesHandler"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_4:WaitForChild("Client")
local User = Client_2:WaitForChild("User")
local Equipment = User:WaitForChild("Equipment")
local Gear_2 = Equipment:WaitForChild("Gear")
local ClientGearHandler = require(Gear_2:WaitForChild("ClientGearHandler"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_5:WaitForChild("Client")
local User_2 = Client_3:WaitForChild("User")
local State = User_2:WaitForChild("State")
local ClientStateHandler = require(State:WaitForChild("ClientStateHandler"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_6:WaitForChild("Common")
local Network = Common_3:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Interaction = require(Namespaces:WaitForChild("Interaction"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_7:WaitForChild("Common")
local Utilities = Common_4:WaitForChild("Utilities")
local Character = require(Utilities:WaitForChild("Character"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_8:WaitForChild("Common")
local Signals = require(Common_5:WaitForChild("Signals"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_9:WaitForChild("Common")
local Statistics = Common_6:WaitForChild("Statistics")
local useJumpPower = require(Statistics:WaitForChild("useJumpPower"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Common_7 = ReplicatedStorage_10:WaitForChild("Common")
local Statistics_2 = Common_7:WaitForChild("Statistics")
local useWalkSpeed = require(Statistics_2:WaitForChild("useWalkSpeed"))
return {
    interacted = function(...) -- Line: 32 -- upvalues: ClientGearHandler (val), Signals (val), ClientStateHandler (val), useWalkSpeed (val), useJumpPower (val), useAnimatorObserver (val), Gear (val), ClientAttributesHandler (val), Interaction (val), RunService (val), Character (val)
        local onCancelRefill, u43, u56, u62, u70, u71, v1, v2
        local v3 = ClientGearHandler.getGearState()
        local u5 = ({...})[1]
        local Attribute = u5
        if Attribute then
            Attribute = u5:GetAttribute("Amount")
        end
        if not Attribute or not u5 then
            if v3 then
                if ClientStateHandler.isCategoryBusy(ClientStateHandler.Categories.NO_GEAR_HANDLE_USAGE) then
                    return
                end
                _, v1 = useWalkSpeed()
                _, v2 = useJumpPower()
                u43 = useAnimatorObserver.play(Gear.BladeRefill, 0.1)
                if not u43 then
                    return
                end
                u43:AdjustSpeed((ClientAttributesHandler.getAttribute("ResupplyMultiplier")))
                u56 = v1("refill", 0, "set", 500)
                u62 = v2("refill", 0, "set", 500)
                ClientStateHandler.updateState(ClientStateHandler.States.REFILLING, true)
                u70 = nil
                u71 = nil
                function onCancelRefill() -- Line: 67 -- upvalues: ClientStateHandler (upval), u56 (val), u62 (val), u70 (ref), u71 (ref)
                    ClientStateHandler.updateState(ClientStateHandler.States.REFILLING, false)
                    u56()
                    u62()
                    if u70 then
                        u70:Disconnect()
                    end
                    if u71 then
                        u71:Disconnect()
                    end
                end
                return
            end
            return
        end
        local Attribute_2 = u5:GetAttribute("Amount")
        if Attribute_2 <= 0 then
            return Signals.Toast:Fire({message = "This bladepack is empty.", type = "error"})
        end
        if not v3 or ClientStateHandler.isCategoryBusy(ClientStateHandler.Categories.NO_GEAR_HANDLE_USAGE) then
            return
        end
        _, v1 = useWalkSpeed()
        _, v2 = useJumpPower()
        u43 = useAnimatorObserver.play(Gear.BladeRefill, 0.1)
        if not u43 then
            return
        end
        u43:AdjustSpeed((ClientAttributesHandler.getAttribute("ResupplyMultiplier")))
        u56 = v1("refill", 0, "set", 500)
        u62 = v2("refill", 0, "set", 500)
        ClientStateHandler.updateState(ClientStateHandler.States.REFILLING, true)
        u70 = nil
        u71 = nil
        function onCancelRefill() -- Line: 67 -- upvalues: ClientStateHandler (upval), u56 (val), u62 (val), u70 (ref), u71 (ref)
            ClientStateHandler.updateState(ClientStateHandler.States.REFILLING, false)
            u56()
            u62()
            if u70 then
                u70:Disconnect()
            end
            if u71 then
                u71:Disconnect()
            end
        end
    end,
    display = {header = "Bladepack", body = "Press \"%s\" to take blades from the bladepack."},
}