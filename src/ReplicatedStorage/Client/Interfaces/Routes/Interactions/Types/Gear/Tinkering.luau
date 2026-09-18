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
--  File: ReplicatedStorage.Client.Interfaces.Routes.Interactions.Types.Gear.Tinkering
--                              Dumped in 0.000275 seconds
--                          Bytecode version 9  |  2 functions

local v1
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Tinkers = require(Utilities:WaitForChild("Tinkers"))
local v3 = {}
if not Tinkers.TINKERING_ENABLED then
    v1 = "Gear Station"
else
    v1 = "Tinkering Station"
end
v3.header = v1
if not Tinkers.TINKERING_ENABLED then
    v1 = "Press \"%s\" to upgrade your gear."
else
    v1 = "Press \"%s\" to tinker your gear."
end
v3.body = v1
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Utilities_2 = Common_2:WaitForChild("Utilities")
local State = require(Utilities_2:WaitForChild("State"))
return {
    interacted = function(...) -- Line: 25 -- upvalues: State (val)
        State("tinkering")({visible = true})
    end,
    display = v3,
}