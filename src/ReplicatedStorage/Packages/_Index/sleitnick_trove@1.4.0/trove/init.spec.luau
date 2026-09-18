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
--     File: ReplicatedStorage.Packages._Index.sleitnick_trove@1.4.0.trove.init.spec
--                               Dumped in 0.00124 seconds
--                          Bytecode version 9  |  44 functions

return function() -- Line: 1
    local Parent = require(script.Parent)
    describe("Trove", function() -- Line: 4 -- upvalues: Parent (val)
        local u0 = nil
        beforeEach(function() -- Line: 7 -- upvalues: u0 (ref), Parent (upval)
            u0 = Parent.new()
        end)
        afterEach(function() -- Line: 11 -- upvalues: u0 (ref)
            if u0 then
                u0:Destroy()
                u0 = nil
            end
        end)
        it("should add and clean up roblox instance", function() -- Line: 18 -- upvalues: u0 (ref)
            local Part = Instance.new("Part")
            Part.Parent = workspace
            u0:Add(Part)
            u0:Destroy()
            expect(Part.Parent).to.equal(nil)
        end)
        it("should add and clean up roblox connection", function() -- Line: 26 -- upvalues: u0 (ref)
            local v1 = workspace.Changed:Connect(function() end)
            u0:Add(v1)
            u0:Destroy()
            expect(v1.Connected).to.equal(false)
        end)
        it("should add and clean up a table with a destroy method", function() -- Line: 33 -- upvalues: u0 (ref)
            local v1 = {
                Destroyed = false,
                Destroy = function(self) -- Line: 35
                    self.Destroyed = true
                end,
            }
            u0:Add(v1)
            u0:Destroy()
            expect(v1.Destroyed).to.equal(true)
        end)
        it("should add and clean up a table with a disconnect method", function() -- Line: 43 -- upvalues: u0 (ref)
            local v1 = {
                Connected = true,
                Disconnect = function(self) -- Line: 45
                    self.Connected = false
                end,
            }
            u0:Add(v1)
            u0:Destroy()
            expect(v1.Connected).to.equal(false)
        end)
        it("should add and clean up a function", function() -- Line: 53 -- upvalues: u0 (ref)
            local u0 = false
            u0:Add(function() -- Line: 55 -- upvalues: u0 (ref)
                u0 = true
            end)
            u0:Destroy()
            expect(u0).to.equal(true)
        end)
        it("should allow a custom cleanup method", function() -- Line: 62 -- upvalues: u0 (ref)
            local v1 = {
                Cleaned = false,
                Cleanup = function(p1) -- Line: 64
                    p1.Cleaned = true
                end,
            }
            u0:Add(v1, "Cleanup")
            u0:Destroy()
            expect(v1.Cleaned).to.equal(true)
        end)
        it("should return the object passed to add", function() -- Line: 72 -- upvalues: u0 (ref)
            local Part = Instance.new("Part")
            local v1 = u0:Add(Part)
            expect(Part).to.equal(v1)
            u0:Destroy()
        end)
        it("should fail to add object without proper cleanup method", function() -- Line: 79 -- upvalues: u0 (ref)
            local u0 = {}
            expect(function() -- Line: 81 -- upvalues: u0 (upval), u0 (val)
                u0:Add(u0)
            end).to.throw()
        end)
        it("should construct an object and add it", function() -- Line: 86 -- upvalues: u0 (ref)
            local v1
            local u0 = {}
            u0.__index = u0
            function u0.new(p1) -- Line: 89 -- upvalues: u0 (val)
                local v1 = setmetatable({}, u0)
                v1._msg = p1
                v1._destroyed = false
                return v1
            end
            function u0:Destroy() -- Line: 95
                self._destroyed = true
            end
            v1 = u0:Construct(u0, "abc")
            expect((typeof(v1))).to.equal("table")
            expect((getmetatable(v1))).to.equal(u0)
            expect(v1._msg).to.equal("abc")
            expect(v1._destroyed).to.equal(false)
            u0:Destroy()
            expect(v1._destroyed).to.equal(true)
        end)
        it("should connect to a signal", function() -- Line: 108 -- upvalues: u0 (ref)
            local v1 = u0:Connect(workspace.Changed, function() end)
            expect((typeof(v1))).to.equal("RBXScriptConnection")
            expect(v1.Connected).to.equal(true)
            u0:Destroy()
            expect(v1.Connected).to.equal(false)
        end)
        it("should remove an object", function() -- Line: 116 -- upvalues: u0 (ref)
            local v1 = u0:Connect(workspace.Changed, function() end)
            expect(u0:Remove(v1)).to.equal(true)
            expect(v1.Connected).to.equal(false)
        end)
        it("should not remove an object not in the trove", function() -- Line: 122 -- upvalues: u0 (ref)
            local v1 = workspace.Changed:Connect(function() end)
            expect(u0:Remove(v1)).to.equal(false)
            expect(v1.Connected).to.equal(true)
            v1:Disconnect()
        end)
        it("should attach to instance", function() -- Line: 129 -- upvalues: u0 (ref)
            local Part = Instance.new("Part")
            Part.Parent = workspace
            local v1 = u0:AttachToInstance(Part)
            expect(v1.Connected).to.equal(true)
            Part:Destroy()
            expect(v1.Connected).to.equal(false)
        end)
        it("should fail to attach to instance not in hierarchy", function() -- Line: 138 -- upvalues: u0 (ref)
            local Part = Instance.new("Part")
            expect(function() -- Line: 140 -- upvalues: u0 (upval), Part (val)
                u0:AttachToInstance(Part)
            end).to.throw()
        end)
        it("should extend itself", function() -- Line: 145 -- upvalues: u0 (ref), Parent (upval)
            local u4
            local v1 = u0:Extend()
            v1:Add(function() -- Line: 148 -- upvalues: u4 (ref)
                u4 = true
            end)
            expect(v1).to.be.a("table")
            expect((getmetatable(v1))).to.equal(Parent)
            u0:Clean()
            expect(false).to.equal(true)
        end)
        it("should clone an instance", function() -- Line: 157 -- upvalues: u0 (ref)
            local v1 = u0:Construct(Instance.new, "Part")
            v1.Name = "TroveCloneTest"
            local v2 = u0:Clone(v1)
            expect((typeof(v2))).to.equal("Instance")
            expect(v2).to.never.equal(v1)
            expect(v2.Name).to.equal("TroveCloneTest")
            expect(v1.Name).to.equal(v2.Name)
        end)
        it("should clean up a thread", function() -- Line: 168 -- upvalues: u0 (ref)
            local v1 = coroutine.create(function() end)
            u0:Add(v1)
            expect(coroutine.status(v1)).to.equal("suspended")
            u0:Clean()
            expect(coroutine.status(v1)).to.equal("dead")
        end)
        it("should not allow objects added during cleanup", function() -- Line: 176 -- upvalues: u0 (ref)
            expect(function() -- Line: 177 -- upvalues: u0 (upval)
                u0:Add(function() -- Line: 178 -- upvalues: u0 (upval)
                    u0:Add(function() end)
                end)
                u0:Clean()
            end).to.throw()
        end)
        it("should not allow objects to be removed during cleanup", function() -- Line: 185 -- upvalues: u0 (ref)
            expect(function() -- Line: 186 -- upvalues: u0 (upval)
                local function u0() end
                u0:Add(u0)
                u0:Add(function() -- Line: 189 -- upvalues: u0 (upval), u0 (val)
                    u0:Remove(u0)
                end)
                u0:Clean()
            end).to.throw()
        end)
    end)
end