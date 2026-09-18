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
--File: ReplicatedStorage.Packages._Index.jakeywastaken_smartbone-2@0.3.1.smartbone-2.Components.Constraints.DistanceContraint.spec
--                              Dumped in 0.000300 seconds
--                          Bytecode version 9  |  5 functions

local DistanceConstraint = require(script.Parent:WaitForChild("DistanceConstraint"))
local function CreateBone(p1, p2, p3) -- Line: 3
    return {Position = p1, FreeLength = p2, ParentIndex = p3}
end
return function() -- Line: 11 -- upvalues: DistanceConstraint (val)
    local u0 = {}
    local v1 = {}
    local v2 = {Position = Vector3.new(0, 0, 0), FreeLength = 3, ParentIndex = 0}
    local v3 = {Position = Vector3.new(0, 1, 0), FreeLength = 3, ParentIndex = 1}
    v1[1] = v2
    v1[2] = v3
    u0.Bones = v1
    describe("Distance Constraint", function() -- Line: 19 -- upvalues: u0 (val), DistanceConstraint (upval)
        local v1
        local u2 = u0.Bones[2]
        local v2 = 10
        local v3 = 1
        for i = 1, v2, v3 do
            v1 = ("Should limit to %* studs #%*"):format(u2.FreeLength, i)
            it(v1, function() -- Line: 22 -- upvalues: DistanceConstraint (upval), u2 (val), u0 (upval)
                local v1 = DistanceConstraint(u2, u2.Position, u0)
                expect(v1.Magnitude).to.equal(u2.FreeLength)
                u2.Position = v1
            end)
            u2.FreeLength = math.random(1, 20)
        end
    end)
end