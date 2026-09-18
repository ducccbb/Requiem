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
--       File: ReplicatedStorage.Common.Utilities.RaycastHitboxV4.Solvers.Vector3
--                              Dumped in 0.000222 seconds
--                          Bytecode version 9  |  4 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
v1 = {}
local u14 = Vector3.new()
function v1.Solve(p1, p2) -- Line: 18 -- upvalues: u14 (val)
    local LastPosition
    local v1 = p2.Instances[1]
    local v2 = v1.Position + v1.CFrame:VectorToWorldSpace(p2.Instances[2])
    if not p2.LastPosition then
        p2.LastPosition = v2
    end
    LastPosition = p2.LastPosition
    if not LastPosition then
        LastPosition = u14
    end
    p2.WorldSpace = v2
    return p2.LastPosition, v2 - LastPosition
end
function v1.UpdateToNextPosition(p1, p2) -- Line: 37
    return p2.WorldSpace
end
function v1.Visualize(p1, p2) -- Line: 41
    return CFrame.lookAt(p2.WorldSpace, p2.LastPosition)
end
return v1