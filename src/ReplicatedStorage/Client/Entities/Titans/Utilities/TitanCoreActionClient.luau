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
--    File: ReplicatedStorage.Client.Entities.Titans.Utilities.TitanCoreActionClient
--                              Dumped in 0.000417 seconds
--                          Bytecode version 9  |  4 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Types = Common:WaitForChild("Types")
require(Types:WaitForChild("Titan"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Types_2 = Common_2:WaitForChild("Types")
local TitanCoreActions = require(Types_2:WaitForChild("TitanCoreActions"))
local AnimationTitanClient = require(v1.Parent:WaitForChild("AnimationTitanClient"))
local CooldownTitanClient = require(v1.Parent:WaitForChild("CooldownTitanClient"))
local function isCoreActionInProgress(p1) -- Line: 20 -- upvalues: CooldownTitanClient (val), TitanCoreActions (val), AnimationTitanClient (val)
    debug.profilebegin("TitanCoreActionClient.isCoreActionInProgress")
    local v1 = {"blinded", "dying", "coreReaction"}
    if CooldownTitanClient.isOnCooldown(p1, v1) then
        debug.profileend()
        return true
    end
    local CORE_TITAN_ANIMATIONS = TitanCoreActions.CORE_TITAN_ANIMATIONS
    local v2 = nil
    v1 = nil
    for i, j in CORE_TITAN_ANIMATIONS, v2, v1 do
        if AnimationTitanClient.getAnimationFromName(p1, j) then
            debug.profileend()
            return true
        end
    end
    debug.profileend()
    return false
end
return {
    isCoreActionInProgress = isCoreActionInProgress,
    shouldRejectAction = function(p1, p2) -- Line: 40 -- upvalues: TitanCoreActions (val), isCoreActionInProgress (val)
        debug.profilebegin("TitanCoreActionClient.shouldRejectAction")
        local v1 = TitanCoreActions.isNapeGrabInterruptAction(p2)
        if v1 then
            v1 = isCoreActionInProgress(p1)
        end
        debug.profileend()
        return v1
    end,
    markCoreReactionStarted = function(p1) -- Line: 49 -- upvalues: CooldownTitanClient (val)
        debug.profilebegin("TitanCoreActionClient.markCoreReactionStarted")
        CooldownTitanClient.addClientCooldown(p1, "coreReaction", 20)
        debug.profileend()
    end,
    isCoreTitanAction = TitanCoreActions.isCoreTitanAction,
    isNapeGrabInterruptAction = TitanCoreActions.isNapeGrabInterruptAction,
}