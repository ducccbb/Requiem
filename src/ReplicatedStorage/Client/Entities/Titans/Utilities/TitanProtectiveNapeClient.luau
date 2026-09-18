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
--  File: ReplicatedStorage.Client.Entities.Titans.Utilities.TitanProtectiveNapeClient
--                              Dumped in 0.000327 seconds
--                          Bytecode version 9  |  3 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Types = Common:WaitForChild("Types")
require(Types:WaitForChild("Titan"))
local TitanCoreActionClient = require(script.Parent:WaitForChild("TitanCoreActionClient"))
local v2 = {ACTION_NAME = "NapeGrabAttack"}
function v2.tryProtectiveNapeGrabAttack(p1, p2, p3, p4, p5) -- Line: 30 -- upvalues: TitanCoreActionClient (val)
    local v1
    debug.profilebegin("TitanProtectiveNapeClient.tryProtectiveNapeGrabAttack")
    if not p3 or TitanCoreActionClient.isCoreActionInProgress(p1) then
        debug.profileend()
        return false
    end
    local v2 = p3
    local v3 = nil
    local v4 = nil
    for i, j in v2, v3, v4 do
        if j.name == "NapeGrabAttack" then
            v1 = {p4(p1, j.name, j.module, p2, nil)}
            if not (v1[1]) then
                debug.profileend()
                return false
            end
            p1.cleanup:Clean()
            p5(j.module, j.name, table.unpack(v1, 2))
            debug.profileend()
            return true
        end
    end
    debug.profileend()
    return false
end
function v2.isNapeGrabAttack(p1) -- Line: 69
    local v1 = p1 == "NapeGrabAttack"
    return v1
end
return v2