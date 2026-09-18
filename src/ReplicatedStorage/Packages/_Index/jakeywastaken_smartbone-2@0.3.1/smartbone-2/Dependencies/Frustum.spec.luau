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
--File: ReplicatedStorage.Packages._Index.jakeywastaken_smartbone-2@0.3.1.smartbone-2.Dependencies.Frustum.spec
--                              Dumped in 0.000460 seconds
--                          Bytecode version 9  |  11 functions

local Frustum = require(script.Parent:WaitForChild("Frustum"))
return function() -- Line: 3 -- upvalues: Frustum (val)
    local u0 = {FieldOfView = 70, CFrame = CFrame.identity, ViewportSize = Vector2.new(1920, 1080)}
    local u6 = {}
    describe("Generates CFrames", function() -- Line: 12 -- upvalues: u6 (ref), Frustum (upval), u0 (val)
        u6 = table.pack(Frustum.GetCFrames(u0, 500))
        local v1 = os.clock()
        u6.n = nil
        print((("Solved view frustum in %*μs"):format((string.format("%.2f", (v1 - os.clock()) * 1000000)))))
    end)
    describe("Point In View", function() -- Line: 24 -- upvalues: Frustum (upval), u6 (ref)
        it("Close In View Point", function() -- Line: 29 -- upvalues: Frustum (upval), u6 (upval)
            expect(Frustum.InViewFrustum(Vector3.new(0, 0, -5), table.unpack(u6))).to.equal(true)
        end)
        it("Past FarPlane Point", function() -- Line: 33 -- upvalues: Frustum (upval), u6 (upval)
            expect(Frustum.InViewFrustum(Vector3.new(0, 0, -550), table.unpack(u6))).to.equal(false)
        end)
        it("Out Of View Point", function() -- Line: 37 -- upvalues: Frustum (upval), u6 (upval)
            expect(Frustum.InViewFrustum(Vector3.new(0, 0, 5), table.unpack(u6))).to.equal(false)
        end)
    end)
    describe("Object In View", function() -- Line: 42 -- upvalues: Frustum (upval), u6 (ref)
        local u0 = {Size = Vector3.new(1, 1, 3), CFrame = CFrame.new(0, 0, -5)}
        local u6 = {Size = Vector3.new(1, 1, 3), CFrame = CFrame.new(0, 0, -550)}
        local u12 = {Size = Vector3.new(1, 1, 3), CFrame = CFrame.new(0, 0, 5)}
        it("Close In View Object", function() -- Line: 58 -- upvalues: Frustum (upval), u0 (val), u6 (upval)
            expect(Frustum.ObjectInFrustum(u0, table.unpack(u6))).to.equal(true)
        end)
        it("Past FarPlane Object", function() -- Line: 62 -- upvalues: Frustum (upval), u6 (val), u6 (upval)
            expect(Frustum.ObjectInFrustum(u6, table.unpack(u6))).to.equal(false)
        end)
        it("Out Of View Object", function() -- Line: 66 -- upvalues: Frustum (upval), u12 (val), u6 (upval)
            expect(Frustum.ObjectInFrustum(u12, table.unpack(u6))).to.equal(false)
        end)
    end)
end