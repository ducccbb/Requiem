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
--File: ReplicatedStorage.Client.Entities.Titans.Types.Default.Actions.Default.DefaultTitanWakeup
--                              Dumped in 0.000429 seconds
--                          Bytecode version 9  |  3 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
require(Packages:WaitForChild("trove"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Types = Common:WaitForChild("Types")
require(Types:WaitForChild("Titan"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_3:WaitForChild("Client")
local User = Client:WaitForChild("User")
local Equipment = User:WaitForChild("Equipment")
local Gear = Equipment:WaitForChild("Gear")
local ClientGearHandler = require(Gear:WaitForChild("ClientGearHandler"))
local Utilities = script.Parent.Parent.Parent.Parent.Parent:WaitForChild("Utilities")
local CooldownTitanClient = require(Utilities:WaitForChild("CooldownTitanClient"))
return {
    attempt = function(p1) -- Line: 46 -- upvalues: CooldownTitanClient (val), ClientGearHandler (val)
        local v1
        local v2 = {"DefaultTitanWakeupAttempt"}
        if CooldownTitanClient.isOnCooldown(p1, v2) or p1.awake then
            return false
        end
        local v3 = ClientGearHandler.getGearState()
        if not v3 then
            return false
        end
        local v4 = false
        for k, v in pairs(v3.grapples) do
            if v.hit and v.hit:IsDescendantOf(p1.model.client) and v.active and v.grappled then
                v1 = tick() - v.grappled
                if 0.4 < v1 then
                    v4 = true
                    break
                end
            end
        end
        CooldownTitanClient.addClientCooldown(p1, {"DefaultTitanWakeupAttempt"}, 0.5)
        return v4
    end,
    execute = function(p1, p2, p3, p4, p5, ...) -- Line: 28
        p1.awake = true
        return true
    end,
}