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
--File: ReplicatedStorage.Packages._Index.jakeywastaken_smartbone-2@0.3.1.smartbone-2.Components.Constraints.RopeConstraint.spec
--                              Dumped in 0.000389 seconds
--                          Bytecode version 9  |  7 functions

local RopeConstraint = require(script.Parent:WaitForChild("RopeConstraint"))
local function CreateBone(p1, p2, p3) -- Line: 3
    return {Position = p1, FreeLength = p2, ParentIndex = p3}
end
return function() -- Line: 11 -- upvalues: RopeConstraint (val)
    local u0 = {}
    local v1 = {}
    local v2 = {Position = Vector3.new(0, 0, 0), FreeLength = 3, ParentIndex = 0}
    local v3 = {Position = Vector3.new(0, 10, 0), FreeLength = 3, ParentIndex = 1}
    v1[1] = v2
    v1[2] = v3
    u0.Bones = v1
    describe("Rope Constraint", function() -- Line: 19 -- upvalues: u0 (val), RopeConstraint (upval)
        local u2 = u0.Bones[2]
        local u3 = 0
        local u4 = nil
        local function LimitCallback() -- Line: 25 -- upvalues: RopeConstraint (upval), u2 (val), u0 (upval), u4 (ref)
            local v1 = RopeConstraint(u2, u2.Position, u0)
            expect(v1.Magnitude).to.equal(u2.FreeLength)
            u2.FreeLength = math.random(1, 20)
            u4()
        end
        local function SameCallback() -- Line: 35 -- upvalues: RopeConstraint (upval), u2 (val), u0 (upval), u4 (ref)
            local v1 = RopeConstraint(u2, u2.Position, u0)
            expect(v1.Magnitude).to.equal(u2.Position.Magnitude)
            u2.FreeLength = math.random(1, 20)
            u4()
        end
        function u4() -- Line: 45 -- upvalues: u3 (ref), u2 (val), SameCallback (val), LimitCallback (val)
            local v1
            if 10 <= u3 then
                return
            end
            u3 = u3 + 1
            if u2.Position.Magnitude < u2.FreeLength then
                v1 = ("Should stay the same #%*"):format(u3)
                it(v1, SameCallback)
                return
            end
            v1 = ("Should limit to %* studs #%*"):format(u2.FreeLength, u3)
            it(v1, LimitCallback)
        end
        u4()
    end)
end