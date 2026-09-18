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
--        File: ReplicatedStorage.Client.Progression.Shifter.Types.Armored.Charge
--                              Dumped in 0.000239 seconds
--                          Bytecode version 9  |  4 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Types = Common:WaitForChild("Types")
require(Types:WaitForChild("Shifter"))
local Universal = script.Parent.Parent.Parent:WaitForChild("Universal")
local ClientShifterPhysicsHandler = require(Universal:WaitForChild("ClientShifterPhysicsHandler"))
return {
    onAbilityRequested = function(p1, p2) -- Line: 31 -- upvalues: ClientShifterPhysicsHandler (val)
        local ServerTimeNow = workspace:GetServerTimeNow()
        local u10 = ClientShifterPhysicsHandler.onRunForwardVelocity(p1, 250)
        if not u10 then
            return
        end
        task.delay(p2 - ServerTimeNow, function() -- Line: 38 -- upvalues: u10 (val)
            u10()
        end)
        return p2
    end,
    onAbilityReplicated = function(p1) end,
}