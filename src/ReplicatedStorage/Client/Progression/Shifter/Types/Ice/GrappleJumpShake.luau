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
--     File: ReplicatedStorage.Client.Progression.Shifter.Types.Ice.GrappleJumpShake
--                              Dumped in 0.000331 seconds
--                          Bytecode version 9  |  3 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Animations = Common:WaitForChild("Animations")
local Titans = require(Animations:WaitForChild("Titans"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Types = Common_2:WaitForChild("Types")
require(Types:WaitForChild("Shifter"))
local Universal = script.Parent.Parent.Parent:WaitForChild("Universal")
local ClientShifterTitanAction = require(Universal:WaitForChild("ClientShifterTitanAction"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_3:WaitForChild("Client")
local Entities = Client:WaitForChild("Entities")
local Titans_2 = Entities:WaitForChild("Titans")
local Types_2 = Titans_2:WaitForChild("Types")
local Default = Types_2:WaitForChild("Default")
local Actions = Default:WaitForChild("Actions")
local Default_2 = Actions:WaitForChild("Default")
local GrappleJumpShake = require(Default_2:WaitForChild("GrappleJumpShake"))
local u102 = {actionName = "GrappleJumpShake", detectionThreshold = 0.35, requiresSide = true, animationId = Titans.Jumps}
return {
    onAbilityRequested = function(p1, p2, ...) -- Line: 29 -- upvalues: ClientShifterTitanAction (val), u102 (val)
        return ClientShifterTitanAction.runOwner(p1, u102, p2, ...)
    end,
    onAbilityReplicated = function(p1, p2, p3, ...) -- Line: 25 -- upvalues: ClientShifterTitanAction (val), GrappleJumpShake (val), u102 (val)
        return ClientShifterTitanAction.runReplicated(p1, GrappleJumpShake, u102, p2, p3, ...)
    end,
}