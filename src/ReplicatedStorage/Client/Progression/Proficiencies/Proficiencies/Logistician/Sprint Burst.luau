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
--File: ReplicatedStorage.Client.Progression.Proficiencies.Proficiencies.Logistician.Sprint Burst
--                              Dumped in 0.000528 seconds
--                          Bytecode version 9  |  5 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage:WaitForChild("Client")
local User = Client:WaitForChild("User")
local State = User:WaitForChild("State")
local ClientSettingsHandler = require(State:WaitForChild("ClientSettingsHandler"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Statistics = require(Utilities:WaitForChild("Statistics"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_3:WaitForChild("Client")
local User_2 = Client_2:WaitForChild("User")
local Equipment = User_2:WaitForChild("Equipment")
local Gear = Equipment:WaitForChild("Gear")
local ClientGearHandler = require(Gear:WaitForChild("ClientGearHandler"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_4:WaitForChild("Client")
local User_3 = Client_3:WaitForChild("User")
local State_2 = User_3:WaitForChild("State")
local ClientStateHandler = require(State_2:WaitForChild("ClientStateHandler"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_5:WaitForChild("Common")
local Statistics_2 = Common_2:WaitForChild("Statistics")
local useWalkSpeed = require(Statistics_2:WaitForChild("useWalkSpeed"))
return {
    activated = function() -- Line: 34 -- upvalues: useWalkSpeed (val), ClientGearHandler (val), RunService (val), Statistics (val), ClientSettingsHandler (val), ClientStateHandler (val)
        local v1
        _, v1 = useWalkSpeed()
        local u3 = nil
        local u6 = ClientGearHandler.getGearState()
        if not u6 or not u6.enabled or not u6.handles then
            return
        end
        u6.signals.boosting:Fire(true)
        local u23 = v1("sprint_burst", 45, "add", 10, TweenInfo.new(0.7))
        local function onCancelSprintBurst() -- Line: 51 -- upvalues: u3 (ref), u23 (val), u6 (val)
            if u3 then
                u3:Disconnect()
                u3 = nil
            end
            u23(TweenInfo.new(0.1))
            u6.signals.boosting:Fire(false)
        end
    end,
    verify = function() -- Line: 86 -- upvalues: ClientGearHandler (val), ClientStateHandler (val), ClientSettingsHandler (val), Statistics (val)
        local v1 = ClientGearHandler.getGearState()
        if not v1 or not v1.enabled or not v1.handles or v1.gas <= 0 or ClientStateHandler.isCategoryBusy(ClientStateHandler.Categories.NO_CROUCHING) then
            return
        end
        local Sprint = ClientSettingsHandler.isKeyPressed("Sprint")
        if Sprint then
            Sprint = Statistics.Contains("walkspeed", "sprint")
        end
        return Sprint
    end,
    settings = {},
}