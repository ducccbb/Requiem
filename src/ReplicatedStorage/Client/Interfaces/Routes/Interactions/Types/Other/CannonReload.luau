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
--File: ReplicatedStorage.Client.Interfaces.Routes.Interactions.Types.Other.CannonReload
--                               Dumped in 0.00119 seconds
--                          Bytecode version 9  |  5 functions

local u196, u199
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Interaction = require(Namespaces:WaitForChild("Interaction"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Network_2 = Common_2:WaitForChild("Network")
local Namespaces_2 = Network_2:WaitForChild("Namespaces")
local Inventory = require(Namespaces_2:WaitForChild("Inventory"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Network_3 = Common_3:WaitForChild("Network")
local Namespaces_3 = Network_3:WaitForChild("Namespaces")
local Cannons = require(Namespaces_3:WaitForChild("Cannons"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_4:WaitForChild("Common")
local Observers = Common_4:WaitForChild("Observers")
local useAnimatorObserver = require(Observers:WaitForChild("useAnimatorObserver"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_5:WaitForChild("Client")
local User = Client:WaitForChild("User")
local Equipment = User:WaitForChild("Equipment")
local Tools = Equipment:WaitForChild("Tools")
local ClientInventoryHandler = require(Tools:WaitForChild("ClientInventoryHandler"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_6:WaitForChild("Client")
local User_2 = Client_2:WaitForChild("User")
local State = User_2:WaitForChild("State")
local ClientStateHandler = require(State:WaitForChild("ClientStateHandler"))
local States = ClientStateHandler.States
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_7:WaitForChild("Common")
local Statistics = Common_5:WaitForChild("Statistics")
local useJumpPower = require(Statistics:WaitForChild("useJumpPower"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_8:WaitForChild("Common")
local Statistics_2 = Common_6:WaitForChild("Statistics")
_, u196 = require(Statistics_2:WaitForChild("useWalkSpeed"))()
_, u199 = useJumpPower()
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Common_7 = ReplicatedStorage_9:WaitForChild("Common")
local Animations = Common_7:WaitForChild("Animations")
local Tools_2 = Animations:WaitForChild("Tools")
local Cannonball = require(Tools_2:WaitForChild("Cannonball"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Common_8 = ReplicatedStorage_10:WaitForChild("Common")
local Signals = require(Common_8:WaitForChild("Signals"))
local function hasCannonballEquipped() -- Line: 33 -- upvalues: Inventory (val), Players (val), ClientInventoryHandler (val)
    local value
    local v1 = Inventory.Tool.get(Players.LocalPlayer)
    if not v1 then
        value = v1
    else
        value = v1.value
        if not value then
            value = v1
        end
    end
    if not value or value.hash == 0 then
        return false
    end
    local v2 = ClientInventoryHandler.getItemNameFromHash(value.hash) == "Cannonball"
    return v2
end
return {
    interacted = function(...) -- Line: 56 -- upvalues: ClientStateHandler (val), States (val), Cannons (val), Signals (val), hasCannonballEquipped (val), useAnimatorObserver (val), Cannonball (val), u196 (val), u199 (val), Interaction (val)
        local finishReload, u50, u56, u62, v1
        if ClientStateHandler.isStateBusy(States.CARRYING) or ClientStateHandler.isStateBusy(States.BEING_CARRIED) or ClientStateHandler.isStateBusy(States.CANNON_RELOADING) then
            return
        end
        local v2 = ...
        if not v2 or not (v2:IsA("BasePart")) then
            return
        end
        local Parent = v2.Parent
        if not Parent or not (Parent:IsA("Model")) then
            return
        end
        local Attribute = Parent:GetAttribute("CannonId")
        if not Attribute then
            return
        end
        local v3 = Cannons.CannonStates.client()[Attribute]
        if not v3 then
            if not (hasCannonballEquipped()) then
                return
            end
            v1 = useAnimatorObserver.play(Cannonball.Reload, 0.1)
            u50 = ...
            u56 = u196("cannon_reload", 4, "set", 500)
            u62 = u199("cannon_reload", 0, "set", 500)
            ClientStateHandler.updateState(States.CANNON_RELOADING, true)
            function finishReload() -- Line: 106 -- upvalues: ClientStateHandler (upval), States (upval), Interaction (upval), u50 (val), u56 (val), u62 (val)
                ClientStateHandler.updateState(States.CANNON_RELOADING, false)
                Interaction.Event.unreliablePost(u50)
                u56()
                u62()
            end
            if v1 then
                v1.Stopped:Once(finishReload)
                return
            end
            finishReload()
            return
        end
        if 1 <= v3.ammo then
            Signals.Toast:Fire({message = "Cannon is already loaded!", type = "error"})
            return
        end
        if not (hasCannonballEquipped()) then
            return
        end
        v1 = useAnimatorObserver.play(Cannonball.Reload, 0.1)
        u50 = ...
        u56 = u196("cannon_reload", 4, "set", 500)
        u62 = u199("cannon_reload", 0, "set", 500)
        ClientStateHandler.updateState(States.CANNON_RELOADING, true)
        function finishReload() -- Line: 106 -- upvalues: ClientStateHandler (upval), States (upval), Interaction (upval), u50 (val), u56 (val), u62 (val)
            ClientStateHandler.updateState(States.CANNON_RELOADING, false)
            Interaction.Event.unreliablePost(u50)
            u56()
            u62()
        end
        if v1 then
            v1.Stopped:Once(finishReload)
            return
        end
        finishReload()
    end,
    display = {
        header = "Reload Cannon",
        body = "Press \"%s\" to reload the cannon.",
        visible = function(p1) -- Line: 49 -- upvalues: hasCannonballEquipped (val)
            return hasCannonballEquipped()
        end,
    },
}