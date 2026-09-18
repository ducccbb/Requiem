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
--File: ReplicatedStorage.Packages._Index.jakeywastaken_smartbone-2@0.3.1.smartbone-2.Components.Constraints.AxisConstraint.spec
--                              Dumped in 0.000640 seconds
--                          Bytecode version 9  |  18 functions

local AxisConstraint = require(script.Parent:WaitForChild("AxisConstraint"))
return function() -- Line: 3 -- upvalues: AxisConstraint (val)
    local u0 = {
        Radius = 0,
        XAxisLimits = NumberRange.new((-1 / 0), (1 / 0)),
        YAxisLimits = NumberRange.new((-1 / 0), (1 / 0)),
        ZAxisLimits = NumberRange.new((-1 / 0), (1 / 0)),
        AxisLocked = {false, false, false},
        ClipVelocity = function() end,
    }
    afterEach(function() -- Line: 13 -- upvalues: u0 (val)
        u0.AxisLocked = {false, false, false}
    end)
    describe("Axis Lock", function() -- Line: 17 -- upvalues: u0 (val), AxisConstraint (upval)
        it("Should lock X Axis", function() -- Line: 18 -- upvalues: u0 (upval), AxisConstraint (upval)
            u0.AxisLocked = {true, false, false}
            local v1 = AxisConstraint(u0, Vector3.new(-10, 0, 0), Vector3.new(0, 0, 0), CFrame.identity)
            expect(v1.X).to.equal(0)
        end)
        it("Should lock Y Axis", function() -- Line: 26 -- upvalues: u0 (upval), AxisConstraint (upval)
            u0.AxisLocked = {false, true, false}
            local v1 = AxisConstraint(u0, Vector3.new(0, -10, 0), Vector3.new(0, 0, 0), CFrame.identity)
            expect(v1.Y).to.equal(0)
        end)
        it("Should lock Z Axis", function() -- Line: 34 -- upvalues: u0 (upval), AxisConstraint (upval)
            u0.AxisLocked = {false, false, true}
            local v1 = AxisConstraint(u0, Vector3.new(0, 0, -10), Vector3.new(0, 0, 0), CFrame.identity)
            expect(v1.Z).to.equal(0)
        end)
    end)
    describe("Axis Limit", function() -- Line: 43 -- upvalues: u0 (val), AxisConstraint (upval)
        describe("Should limit X Axis", function() -- Line: 44 -- upvalues: u0 (upval), AxisConstraint (upval)
            it("Min Limit", function() -- Line: 45 -- upvalues: u0 (upval), AxisConstraint (upval)
                u0.XAxisLimits = NumberRange.new(-5, (1 / 0))
                local v1 = AxisConstraint(u0, Vector3.new(-10, 0, 0), Vector3.new(0, 0, 0), CFrame.identity)
                expect(v1.X).to.equal(-5)
            end)
            it("Max Limit", function() -- Line: 53 -- upvalues: u0 (upval), AxisConstraint (upval)
                u0.XAxisLimits = NumberRange.new((-1 / 0), 5)
                local v1 = AxisConstraint(u0, Vector3.new(10, 0, 0), Vector3.new(0, 0, 0), CFrame.identity)
                expect(v1.X).to.equal(5)
            end)
        end)
        describe("Should limit Y Axis", function() -- Line: 62 -- upvalues: u0 (upval), AxisConstraint (upval)
            it("Min Limit", function() -- Line: 63 -- upvalues: u0 (upval), AxisConstraint (upval)
                u0.YAxisLimits = NumberRange.new(-5, (1 / 0))
                local v1 = AxisConstraint(u0, Vector3.new(0, -10, 0), Vector3.new(0, 0, 0), CFrame.identity)
                expect(v1.Y).to.equal(-5)
            end)
            it("Max Limit", function() -- Line: 71 -- upvalues: u0 (upval), AxisConstraint (upval)
                u0.YAxisLimits = NumberRange.new((-1 / 0), 5)
                local v1 = AxisConstraint(u0, Vector3.new(0, 10, 0), Vector3.new(0, 0, 0), CFrame.identity)
                expect(v1.Y).to.equal(5)
            end)
        end)
        describe("Should limit Z Axis", function() -- Line: 80 -- upvalues: u0 (upval), AxisConstraint (upval)
            it("Min Limit", function() -- Line: 81 -- upvalues: u0 (upval), AxisConstraint (upval)
                u0.ZAxisLimits = NumberRange.new(-5, (1 / 0))
                local v1 = AxisConstraint(u0, Vector3.new(0, 0, -10), Vector3.new(0, 0, 0), CFrame.identity)
                expect(v1.Z).to.equal(-5)
            end)
            it("Max Limit", function() -- Line: 89 -- upvalues: u0 (upval), AxisConstraint (upval)
                u0.ZAxisLimits = NumberRange.new((-1 / 0), 5)
                local v1 = AxisConstraint(u0, Vector3.new(0, 0, 10), Vector3.new(0, 0, 0), CFrame.identity)
                expect(v1.Z).to.equal(5)
            end)
        end)
    end)
end