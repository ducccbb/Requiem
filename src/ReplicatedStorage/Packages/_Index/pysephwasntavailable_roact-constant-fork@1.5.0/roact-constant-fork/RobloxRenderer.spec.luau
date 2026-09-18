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
--File: ReplicatedStorage.Packages._Index.pysephwasntavailable_roact-constant-fork@1.5.0.roact-constant-fork.RobloxRenderer.spec
--                               Dumped in 0.00553 seconds
--                         Bytecode version 9  |  106 functions

return function() -- Line: 1
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local assertDeepEqual = require(script.Parent.assertDeepEqual)
    local Binding = require(script.Parent.Binding)
    local Children = require(script.Parent.PropMarkers.Children)
    local Component = require(script.Parent.Component)
    local createElement = require(script.Parent.createElement)
    local createFragment = require(script.Parent.createFragment)
    local createReconciler = require(script.Parent.createReconciler)
    local createRef = require(script.Parent.createRef)
    local createSpy = require(script.Parent.createSpy)
    local GlobalConfig = require(script.Parent.GlobalConfig)
    local Portal = require(script.Parent.Portal)
    local Ref = require(script.Parent.PropMarkers.Ref)
    local Event = require(script.Parent.PropMarkers.Event)
    local RobloxRenderer = require(script.Parent.RobloxRenderer)
    local u80 = createReconciler(RobloxRenderer)
    describe("mountHostNode", function() -- Line: 22 -- upvalues: createElement (val), u80 (val), RobloxRenderer (val), Binding (val), createRef (val), Ref (val), createSpy (val), GlobalConfig (val)
        it("should create instances with correct props", function() -- Line: 23 -- upvalues: createElement (upval), u80 (upval), RobloxRenderer (upval)
            local Folder = Instance.new("Folder")
            local v1 = createElement("StringValue", {Value = "Hello!"})
            local v2 = u80.createVirtualNode(v1, Folder, "Some Key")
            RobloxRenderer.mountHostNode(u80, v2)
            expect(#Folder:GetChildren()).to.equal(1)
            local v3 = Folder:GetChildren()[1]
            expect(v3.ClassName).to.equal("StringValue")
            expect(v3.Value).to.equal("Hello!")
            expect(v3.Name).to.equal("Some Key")
        end)
        it("should create children with correct names and props", function() -- Line: 45 -- upvalues: createElement (upval), u80 (upval), RobloxRenderer (upval)
            local Folder = Instance.new("Folder")
            local v1 = createElement("StringValue", {Value = "Hey there!"}, {ChildA = createElement("IntValue", {Value = 173}), ChildB = createElement("Folder")})
            local v2 = u80.createVirtualNode(v1, Folder, "Some Key")
            RobloxRenderer.mountHostNode(u80, v2)
            expect(#Folder:GetChildren()).to.equal(1)
            local v3 = Folder:GetChildren()[1]
            expect(v3.ClassName).to.equal("StringValue")
            expect(v3.Value).to.equal("Hey there!")
            expect(v3.Name).to.equal("Some Key")
            expect(#v3:GetChildren()).to.equal(2)
            local ChildA = v3.ChildA
            local ChildB = v3.ChildB
            expect(ChildA).to.be.ok()
            expect(ChildB).to.be.ok()
            expect(ChildA.ClassName).to.equal("IntValue")
            expect(ChildA.Value).to.equal(173)
            expect(ChildB.ClassName).to.equal("Folder")
        end)
        it("should attach Bindings to Roblox properties", function() -- Line: 87 -- upvalues: Binding (upval), createElement (upval), u80 (upval), RobloxRenderer (upval)
            local v1, v2
            local Folder = Instance.new("Folder")
            v1, v2 = Binding.create(10)
            local v3 = createElement("IntValue", {Value = v1})
            local v4 = u80.createVirtualNode(v3, Folder, "Some Key")
            RobloxRenderer.mountHostNode(u80, v4)
            expect(#Folder:GetChildren()).to.equal(1)
            local v5 = Folder:GetChildren()[1]
            expect(v5.ClassName).to.equal("IntValue")
            expect(v5.Value).to.equal(10)
            v2(20)
            expect(v5.Value).to.equal(20)
            RobloxRenderer.unmountHostNode(u80, v4)
        end)
        it("should connect Binding refs", function() -- Line: 114 -- upvalues: createRef (upval), createElement (upval), Ref (upval), u80 (upval), RobloxRenderer (upval)
            local Folder = Instance.new("Folder")
            local v1 = createRef()
            local v2 = {}
            v2[Ref] = v1
            local v3 = createElement("Frame", v2)
            local v4 = u80.createVirtualNode(v3, Folder, "Some Key")
            RobloxRenderer.mountHostNode(u80, v4)
            expect(#Folder:GetChildren()).to.equal(1)
            v2 = Folder:GetChildren()[1]
            expect(v1.current).to.be.ok()
            expect(v1.current).to.equal(v2)
            RobloxRenderer.unmountHostNode(u80, v4)
        end)
        it("should call function refs", function() -- Line: 137 -- upvalues: createSpy (upval), createElement (upval), Ref (upval), u80 (upval), RobloxRenderer (upval)
            local Folder = Instance.new("Folder")
            local v1 = createSpy()
            local v2 = {}
            v2[Ref] = v1.value
            local v3 = createElement("Frame", v2)
            local v4 = u80.createVirtualNode(v3, Folder, "Some Key")
            RobloxRenderer.mountHostNode(u80, v4)
            expect(#Folder:GetChildren()).to.equal(1)
            v2 = Folder:GetChildren()[1]
            expect(v1.callCount).to.equal(1)
            v1:assertCalledWith(v2)
            RobloxRenderer.unmountHostNode(u80, v4)
        end)
        it("should throw if setting invalid instance properties", function() -- Line: 160 -- upvalues: GlobalConfig (upval), createElement (upval), u80 (upval), RobloxRenderer (upval)
            GlobalConfig.scoped({elementTracing = true}, function() -- Line: 165 -- upvalues: createElement (upval), u80 (upval), RobloxRenderer (upval)
                local v1, v2
                local Folder = Instance.new("Folder")
                local v3 = createElement("Frame", {Frob = 6})
                local v4 = u80.createVirtualNode(v3, Folder, "Some Key")
                v1, v2 = pcall(RobloxRenderer.mountHostNode, u80, v4)
                assert(not v1, "Expected call to fail")
                expect(v2:find("Frob")).to.be.ok()
                expect(v2:find("Frame")).to.be.ok()
                expect(v2:find("RobloxRenderer%.spec")).to.be.ok()
            end)
        end)
    end)
    describe("updateHostNode", function() -- Line: 185 -- upvalues: createElement (val), u80 (val), RobloxRenderer (val), Binding (val), createRef (val), Ref (val), createSpy (val), GlobalConfig (val)
        it("should update node props and children", function() -- Line: 186 -- upvalues: createElement (upval), u80 (upval), RobloxRenderer (upval)
            local Folder = Instance.new("Folder")
            local v1 = createElement("StringValue", {Value = "foo"}, {ChildA = createElement("IntValue", {Value = 1}), ChildB = createElement("BoolValue", {Value = true}), ChildC = createElement("StringValue", {Value = "test"}), ChildD = createElement("StringValue", {Value = "test"})})
            local v2 = u80.createVirtualNode(v1, Folder, "updateHostNodeTest")
            RobloxRenderer.mountHostNode(u80, v2)
            local v3 = createElement("StringValue", {Value = "bar"}, {ChildA = createElement("StringValue", {Value = "test"}), ChildB = createElement("BoolValue", {Value = false}), ChildC = createElement("StringValue", {}), ChildE = createElement("Folder", {})})
            RobloxRenderer.updateHostNode(u80, v2, v3)
            local updateHostNodeTest = Folder.updateHostNodeTest
            expect(updateHostNodeTest.ClassName).to.equal("StringValue")
            expect(updateHostNodeTest.Value).to.equal("bar")
            expect(#updateHostNodeTest:GetChildren()).to.equal(4)
            local ChildA = updateHostNodeTest.ChildA
            expect(ChildA.ClassName).to.equal("StringValue")
            expect(ChildA.Value).to.equal("test")
            local ChildB = updateHostNodeTest.ChildB
            expect(ChildB.ClassName).to.equal("BoolValue")
            expect(ChildB.Value).to.equal(false)
            local ChildC = updateHostNodeTest.ChildC
            expect(ChildC.ClassName).to.equal("StringValue")
            expect(ChildC.Value).to.equal(Instance.new("StringValue").Value)
            expect(updateHostNodeTest.ChildE.ClassName).to.equal("Folder")
        end)
        it("should update Bindings", function() -- Line: 260 -- upvalues: Binding (upval), createElement (upval), u80 (upval), RobloxRenderer (upval)
            local v1, v2, v3, v4
            local Folder = Instance.new("Folder")
            v1, v2 = Binding.create(10)
            local v5 = createElement("IntValue", {Value = v1})
            local v6 = u80.createVirtualNode(v5, Folder, "Some Key")
            RobloxRenderer.mountHostNode(u80, v6)
            local v7 = Folder:GetChildren()[1]
            expect(v7.Value).to.equal(10)
            v3, v4 = Binding.create(99)
            local v8 = createElement("IntValue", {Value = v3})
            RobloxRenderer.updateHostNode(u80, v6, v8)
            expect(v7.Value).to.equal(99)
            v2(123)
            expect(v7.Value).to.equal(99)
            v4(123)
            expect(v7.Value).to.equal(123)
            RobloxRenderer.unmountHostNode(u80, v6)
        end)
        it("should update Binding refs", function() -- Line: 297 -- upvalues: createRef (upval), createElement (upval), Ref (upval), u80 (upval), RobloxRenderer (upval)
            local Folder = Instance.new("Folder")
            local v1 = createRef()
            local v2 = createRef()
            local v3 = {}
            v3[Ref] = v1
            local v4 = createElement("Frame", v3)
            local v5 = u80.createVirtualNode(v4, Folder, "Some Key")
            RobloxRenderer.mountHostNode(u80, v5)
            expect(#Folder:GetChildren()).to.equal(1)
            v3 = Folder:GetChildren()[1]
            expect(v1.current).to.equal(v3)
            expect(v2.current).never.to.be.ok()
            local v6 = {}
            v6[Ref] = v2
            local v7 = createElement("Frame", v6)
            RobloxRenderer.updateHostNode(u80, v5, v7)
            expect(v1.current).never.to.be.ok()
            expect(v2.current).to.equal(v3)
            RobloxRenderer.unmountHostNode(u80, v5)
        end)
        it("should call old function refs with nil and new function refs with a valid rbx", function() -- Line: 331 -- upvalues: createSpy (upval), createElement (upval), Ref (upval), u80 (upval), RobloxRenderer (upval)
            local Folder = Instance.new("Folder")
            local v1 = createSpy()
            local v2 = createSpy()
            local v3 = {}
            v3[Ref] = v1.value
            local v4 = createElement("Frame", v3)
            local v5 = u80.createVirtualNode(v4, Folder, "Some Key")
            RobloxRenderer.mountHostNode(u80, v5)
            expect(#Folder:GetChildren()).to.equal(1)
            v3 = Folder:GetChildren()[1]
            expect(v1.callCount).to.equal(1)
            v1:assertCalledWith(v3)
            expect(v2.callCount).to.equal(0)
            local v6 = {}
            v6[Ref] = v2.value
            local v7 = createElement("Frame", v6)
            RobloxRenderer.updateHostNode(u80, v5, v7)
            expect(v1.callCount).to.equal(2)
            v1:assertCalledWith(nil)
            expect(v2.callCount).to.equal(1)
            v2:assertCalledWith(v3)
            RobloxRenderer.unmountHostNode(u80, v5)
        end)
        it("should not call function refs again if they didn't change", function() -- Line: 368 -- upvalues: createSpy (upval), createElement (upval), Ref (upval), u80 (upval), RobloxRenderer (upval)
            local Folder = Instance.new("Folder")
            local v1 = createSpy()
            local v2 = {Size = UDim2.new(1, 0, 1, 0)}
            v2[Ref] = v1.value
            local v3 = createElement("Frame", v2)
            local v4 = u80.createVirtualNode(v3, Folder, "Some Key")
            RobloxRenderer.mountHostNode(u80, v4)
            expect(#Folder:GetChildren()).to.equal(1)
            v2 = Folder:GetChildren()[1]
            expect(v1.callCount).to.equal(1)
            v1:assertCalledWith(v2)
            local v5 = {Size = UDim2.new(0.5, 0, 0.5, 0)}
            v5[Ref] = v1.value
            local v6 = createElement("Frame", v5)
            RobloxRenderer.updateHostNode(u80, v4, v6)
            expect(v1.callCount).to.equal(1)
        end)
        it("should throw if setting invalid instance properties", function() -- Line: 401 -- upvalues: GlobalConfig (upval), createElement (upval), u80 (upval), RobloxRenderer (upval)
            GlobalConfig.scoped({elementTracing = true}, function() -- Line: 406 -- upvalues: createElement (upval), u80 (upval), RobloxRenderer (upval)
                local v1, v2
                local Folder = Instance.new("Folder")
                local Frame = createElement("Frame")
                local v3 = createElement("Frame", {Frob = 6})
                local v4 = u80.createVirtualNode(Frame, Folder, "Some Key")
                RobloxRenderer.mountHostNode(u80, v4)
                v1, v2 = pcall(RobloxRenderer.updateHostNode, u80, v4, v3)
                assert(not v1, "Expected call to fail")
                expect(v2:find("Frob")).to.be.ok()
                expect(v2:find("Frame")).to.be.ok()
                expect(v2:find("RobloxRenderer%.spec")).to.be.ok()
            end)
        end)
        it("should delete instances when reconciling to nil children", function() -- Line: 427 -- upvalues: createElement (upval), u80 (upval), RobloxRenderer (upval)
            local Folder = Instance.new("Folder")
            local v1 = createElement("Frame", {Size = UDim2.new(1, 0, 1, 0)}, {child = createElement("Frame")})
            local v2 = u80.createVirtualNode(v1, Folder, "Some Key")
            RobloxRenderer.mountHostNode(u80, v2)
            expect(#Folder:GetChildren()).to.equal(1)
            local v3 = Folder:GetChildren()[1]
            expect(#v3:GetChildren()).to.equal(1)
            local v4 = createElement("Frame", {Size = UDim2.new(0.5, 0, 0.5, 0)})
            RobloxRenderer.updateHostNode(u80, v2, v4)
            expect(#v3:GetChildren()).to.equal(0)
        end)
    end)
    describe("unmountHostNode", function() -- Line: 455 -- upvalues: createElement (val), u80 (val), RobloxRenderer (val), Binding (val), createRef (val), Ref (val), createSpy (val)
        it("should delete instances from the inside-out", function() -- Line: 456 -- upvalues: createElement (upval), u80 (upval), RobloxRenderer (upval)
            local Folder = Instance.new("Folder")
            local v1 = createElement("Folder", nil, {Child = createElement("Folder", nil, {Grandchild = createElement("Folder")})})
            local v2 = u80.mountVirtualNode(v1, Folder, "Root")
            expect(#Folder:GetChildren()).to.equal(1)
            local v3 = Folder:GetChildren()[1]
            expect(#v3:GetChildren()).to.equal(1)
            local v4 = v3:GetChildren()[1]
            expect(#v4:GetChildren()).to.equal(1)
            local v5 = v4:GetChildren()[1]
            RobloxRenderer.unmountHostNode(u80, v2)
            expect(v5.Parent).to.equal(nil)
            expect(v4.Parent).to.equal(nil)
            expect(v3.Parent).to.equal(nil)
        end)
        it("should unsubscribe from any Bindings", function() -- Line: 484 -- upvalues: Binding (upval), createElement (upval), u80 (upval), RobloxRenderer (upval)
            local v1, v2
            local Folder = Instance.new("Folder")
            v1, v2 = Binding.create(10)
            local v3 = createElement("IntValue", {Value = v1})
            local v4 = u80.createVirtualNode(v3, Folder, "Some Key")
            RobloxRenderer.mountHostNode(u80, v4)
            local v5 = Folder:GetChildren()[1]
            expect(v5.Value).to.equal(10)
            RobloxRenderer.unmountHostNode(u80, v4)
            v2(56)
            expect(v5.Value).to.equal(10)
        end)
        it("should clear Binding refs", function() -- Line: 507 -- upvalues: createRef (upval), createElement (upval), Ref (upval), u80 (upval), RobloxRenderer (upval)
            local Folder = Instance.new("Folder")
            local v1 = createRef()
            local v2 = {}
            v2[Ref] = v1
            local v3 = createElement("Frame", v2)
            local v4 = u80.createVirtualNode(v3, Folder, "Some Key")
            RobloxRenderer.mountHostNode(u80, v4)
            expect(v1.current).to.be.ok()
            RobloxRenderer.unmountHostNode(u80, v4)
            expect(v1.current).never.to.be.ok()
        end)
        it("should call function refs with nil", function() -- Line: 527 -- upvalues: createSpy (upval), createElement (upval), Ref (upval), u80 (upval), RobloxRenderer (upval)
            local Folder = Instance.new("Folder")
            local v1 = createSpy()
            local v2 = {}
            v2[Ref] = v1.value
            local v3 = createElement("Frame", v2)
            local v4 = u80.createVirtualNode(v3, Folder, "Some Key")
            RobloxRenderer.mountHostNode(u80, v4)
            expect(v1.callCount).to.equal(1)
            RobloxRenderer.unmountHostNode(u80, v4)
            expect(v1.callCount).to.equal(2)
            v1:assertCalledWith(nil)
        end)
    end)
    describe("Portals", function() -- Line: 549 -- upvalues: createElement (val), Portal (val), u80 (val)
        it("should create and destroy instances as children of `target`", function() -- Line: 550 -- upvalues: createElement (upval), Portal (upval), u80 (upval)
            local Folder = Instance.new("Folder")
            local v1 = createElement(Portal, {target = Folder}, {folderOne = createElement("Folder"), folderTwo = createElement("Folder"), intValueOne = createElement(function(p1) -- Line: 553 -- upvalues: createElement (upval)
                return createElement("IntValue", {Value = p1.value})
            end, {value = 42})})
            local v2 = u80.mountVirtualNode(v1, nil, "Some Key")
            expect(#Folder:GetChildren()).to.equal(3)
            expect(Folder:FindFirstChild("folderOne")).to.be.ok()
            expect(Folder:FindFirstChild("folderTwo")).to.be.ok()
            expect(Folder:FindFirstChild("intValueOne")).to.be.ok()
            expect(Folder:FindFirstChild("intValueOne").Value).to.equal(42)
            u80.unmountVirtualNode(v2)
            expect(#Folder:GetChildren()).to.equal(0)
        end)
        it("should pass prop updates through to children", function() -- Line: 584 -- upvalues: createElement (upval), Portal (upval), u80 (upval)
            local Folder = Instance.new("Folder")
            local v1 = createElement(Portal, {target = Folder}, {ChildValue = createElement("IntValue", {Value = 1})})
            local v2 = createElement(Portal, {target = Folder}, {ChildValue = createElement("IntValue", {Value = 2})})
            local v3 = u80.mountVirtualNode(v1, nil, "A Host Key")
            expect(#Folder:GetChildren()).to.equal(1)
            local ChildValue = Folder.ChildValue
            expect(ChildValue.Value).to.equal(1)
            v3 = u80.updateVirtualNode(v3, v2)
            expect(#Folder:GetChildren()).to.equal(1)
            local ChildValue_2 = Folder.ChildValue
            expect(ChildValue).to.equal(ChildValue_2)
            expect(ChildValue_2.Value).to.equal(2)
            u80.unmountVirtualNode(v3)
            expect(#Folder:GetChildren()).to.equal(0)
        end)
        it("should throw if `target` is nil", function() -- Line: 625 -- upvalues: createElement (upval), Portal (upval), u80 (upval)
            local u2 = createElement(Portal)
            expect(function() -- Line: 631 -- upvalues: u80 (upval), u2 (val)
                u80.mountVirtualNode(u2, nil, "Keys for Everyone")
            end).to.throw()
        end)
        it("should throw if `target` is not a Roblox instance", function() -- Line: 636 -- upvalues: createElement (upval), Portal (upval), u80 (upval)
            local u4 = createElement(Portal, {target = {}})
            expect(function() -- Line: 643 -- upvalues: u80 (upval), u4 (val)
                u80.mountVirtualNode(u4, nil, "Unleash the keys!")
            end).to.throw()
        end)
        it("should recreate instances if `target` changes in an update", function() -- Line: 648 -- upvalues: createElement (upval), Portal (upval), u80 (upval)
            local Folder = Instance.new("Folder")
            local Folder_2 = Instance.new("Folder")
            local v1 = createElement(Portal, {target = Folder}, {ChildValue = createElement("IntValue", {Value = 1})})
            local v2 = createElement(Portal, {target = Folder_2}, {ChildValue = createElement("IntValue", {Value = 2})})
            local v3 = u80.mountVirtualNode(v1, nil, "Some Key")
            expect(#Folder:GetChildren()).to.equal(1)
            expect(#Folder_2:GetChildren()).to.equal(0)
            expect(Folder.ChildValue.Value).to.equal(1)
            v3 = u80.updateVirtualNode(v3, v2)
            expect(#Folder:GetChildren()).to.equal(0)
            expect(#Folder_2:GetChildren()).to.equal(1)
            expect(Folder_2.ChildValue.Value).to.equal(2)
            u80.unmountVirtualNode(v3)
            expect(#Folder:GetChildren()).to.equal(0)
            expect(#Folder_2:GetChildren()).to.equal(0)
        end)
    end)
    describe("Fragments", function() -- Line: 693 -- upvalues: createFragment (val), createElement (val), u80 (val)
        it("should parent the fragment's elements into the fragment's parent", function() -- Line: 694 -- upvalues: createFragment (upval), createElement (upval), u80 (upval)
            local Folder = Instance.new("Folder")
            local v1 = createFragment({key = createElement("IntValue", {Value = 1}), key2 = createElement("IntValue", {Value = 2})})
            local v2 = u80.mountVirtualNode(v1, Folder, "test")
            expect(Folder:FindFirstChild("key")).to.be.ok()
            expect(Folder.key.ClassName).to.equal("IntValue")
            expect(Folder.key.Value).to.equal(1)
            expect(Folder:FindFirstChild("key2")).to.be.ok()
            expect(Folder.key2.ClassName).to.equal("IntValue")
            expect(Folder.key2.Value).to.equal(2)
            u80.unmountVirtualNode(v2)
            expect(#Folder:GetChildren()).to.equal(0)
        end)
        it("should allow sibling fragment to have common keys", function() -- Line: 721 -- upvalues: createElement (upval), createFragment (upval), u80 (upval)
            local Folder = Instance.new("Folder")
            local v1 = createElement(function(p1) -- Line: 725 -- upvalues: createElement (upval), createFragment (upval)
                return createElement("IntValue", {}, {fragmentA = createFragment({key = createElement("StringValue", {Value = "A"}), key2 = createElement("StringValue", {Value = "B"})}), fragmentB = createFragment({key = createElement("StringValue", {Value = "C"}), key2 = createElement("StringValue", {Value = "D"})})})
            end)
            local v2 = u80.mountVirtualNode(v1, Folder, "Test")
            local Children = Folder.Test:GetChildren()
            expect(#Children).to.equal(4)
            local v3 = {}
            for k, v in pairs(Children) do
                expect(v.ClassName).to.equal("StringValue")
                v3[v.Value] = 1 + (v3[v.Value] or 0)
            end
            expect(v3.A).to.equal(1)
            expect(v3.B).to.equal(1)
            expect(v3.C).to.equal(1)
            expect(v3.D).to.equal(1)
            u80.unmountVirtualNode(v2)
            expect(#Folder:GetChildren()).to.equal(0)
        end)
        it("should render nested fragments", function() -- Line: 769 -- upvalues: createFragment (upval), createElement (upval), u80 (upval)
            local Folder = Instance.new("Folder")
            local v1 = createFragment({key = createFragment({TheValue = createElement("IntValue", {Value = 1}), TheOtherValue = createElement("IntValue", {Value = 2})})})
            local v2 = u80.mountVirtualNode(v1, Folder, "Test")
            expect(Folder:FindFirstChild("TheValue")).to.be.ok()
            expect(Folder.TheValue.ClassName).to.equal("IntValue")
            expect(Folder.TheValue.Value).to.equal(1)
            expect(Folder:FindFirstChild("TheOtherValue")).to.be.ok()
            expect(Folder.TheOtherValue.ClassName).to.equal("IntValue")
            expect(Folder.TheOtherValue.Value).to.equal(2)
            u80.unmountVirtualNode(v2)
            expect(#Folder:GetChildren()).to.equal(0)
        end)
        it("should not add any instances if the fragment is empty", function() -- Line: 798 -- upvalues: u80 (upval), createFragment (upval)
            local Folder = Instance.new("Folder")
            local v1 = createFragment({})
            local v2 = u80.mountVirtualNode(v1, Folder, "test")
            expect(#Folder:GetChildren()).to.equal(0)
            u80.unmountVirtualNode(v2)
            expect(#Folder:GetChildren()).to.equal(0)
        end)
    end)
    describe("Context", function() -- Line: 811 -- upvalues: Component (val), createElement (val), u80 (val), assertDeepEqual (val), Children (val), Portal (val)
        it("should pass context values through Roblox host nodes", function() -- Line: 812 -- upvalues: Component (upval), createElement (upval), u80 (upval), assertDeepEqual (upval)
            local v1 = Component:extend("Consumer")
            local u5 = nil
            function v1.init(p1) -- Line: 816 -- upvalues: u5 (ref)
                u5 = {hello = p1:__getContext("hello")}
            end
            function v1.render(p1) end
            local v2 = createElement("Folder", nil, {Consumer = createElement(v1)})
            local v3 = {hello = "world"}
            local v4 = u80.mountVirtualNode(v2, nil, "Context Test", v3)
            expect(u5).never.to.equal(v3)
            assertDeepEqual(u5, v3)
            u80.unmountVirtualNode(v4)
        end)
        it("should pass context values through portal nodes", function() -- Line: 840 -- upvalues: Component (upval), createElement (upval), Children (upval), Portal (upval), u80 (upval), assertDeepEqual (upval)
            local u15
            local Folder = Instance.new("Folder")
            local v1 = Component:extend("Provider")
            function v1.init(p1) -- Line: 845
                p1:__addContext("foo", "bar")
            end
            function v1.render(p1) -- Line: 849 -- upvalues: createElement (upval), Children (upval)
                return createElement("Folder", nil, p1.props[Children])
            end
            local v2 = Component:extend("Consumer")
            function v2.init(p1) -- Line: 856 -- upvalues: u15 (ref)
                u15 = {foo = p1:__getContext("foo")}
            end
            function v2.render(p1) -- Line: 862
                return nil
            end
            local v3 = createElement(v1, nil, {Portal = createElement(Portal, {target = Folder}, {Consumer = createElement(v2)})})
            u80.mountVirtualNode(v3, nil, "Some Key")
            assertDeepEqual(nil, {foo = "bar"})
        end)
    end)
    describe("Legacy context", function() -- Line: 883 -- upvalues: Component (val), createElement (val), u80 (val), assertDeepEqual (val), Children (val), Portal (val)
        it("should pass context values through Roblox host nodes", function() -- Line: 884 -- upvalues: Component (upval), createElement (upval), u80 (upval), assertDeepEqual (upval)
            local v1 = Component:extend("Consumer")
            local u5 = nil
            function v1.init(p1) -- Line: 888 -- upvalues: u5 (ref)
                u5 = p1._context
            end
            function v1.render(p1) end
            local v2 = createElement("Folder", nil, {Consumer = createElement(v1)})
            local v3 = {hello = "world"}
            local v4 = u80.mountVirtualNode(v2, nil, "Context Test", nil, v3)
            expect(u5).never.to.equal(v3)
            assertDeepEqual(u5, v3)
            u80.unmountVirtualNode(v4)
        end)
        it("should pass context values through portal nodes", function() -- Line: 910 -- upvalues: Component (upval), createElement (upval), Children (upval), Portal (upval), u80 (upval), assertDeepEqual (upval)
            local u15
            local Folder = Instance.new("Folder")
            local v1 = Component:extend("Provider")
            function v1.init(p1) -- Line: 915
                p1._context.foo = "bar"
            end
            function v1.render(p1) -- Line: 919 -- upvalues: createElement (upval), Children (upval)
                return createElement("Folder", nil, p1.props[Children])
            end
            local v2 = Component:extend("Consumer")
            function v2.init(p1) -- Line: 926 -- upvalues: u15 (ref)
                u15 = p1._context
            end
            function v2.render(p1) -- Line: 930
                return nil
            end
            local v3 = createElement(v1, nil, {Portal = createElement(Portal, {target = Folder}, {Consumer = createElement(v2)})})
            u80.mountVirtualNode(v3, nil, "Some Key")
            assertDeepEqual(nil, {foo = "bar"})
        end)
    end)
    describe("Integration Tests", function() -- Line: 951 -- upvalues: ReplicatedStorage (val), Component (val), createElement (val), Event (val), u80 (val)
        local u0 = nil
        beforeEach(function() -- Line: 953 -- upvalues: u0 (ref), ReplicatedStorage (upval)
            u0 = Instance.new("Folder")
            u0.Parent = ReplicatedStorage
        end)
        afterEach(function() -- Line: 958 -- upvalues: u0 (ref)
            u0:Destroy()
            u0 = nil
        end)
        it("should not allow re-entrancy in updateChildren", function() -- Line: 963 -- upvalues: Component (upval), createElement (upval), Event (upval), u0 (ref), u80 (upval)
            local u6
            local u4 = Component:extend("ChildComponent")
            function u4.init(p1) -- Line: 966
                p1:setState({firstTime = true})
            end
            function u4.render(p1) -- Line: 974 -- upvalues: createElement (upval)
                if p1.state.firstTime then
                    return createElement("Frame")
                end
                return createElement("TextLabel")
            end
            function u4.didMount(p1) -- Line: 982 -- upvalues: u6 (ref)
                u6 = coroutine.create(function() -- Line: 983 -- upvalues: p1 (val)
                    p1:setState({firstTime = false})
                end)
            end
            local v1 = Component:extend("ParentComponent")
            function v1.init(p1) -- Line: 992
                p1:setState({count = 1})
                function p1.childAdded() -- Line: 997 -- upvalues: p1 (val)
                    p1:setState({count = p1.state.count + 1})
                end
            end
            function v1.render(p1) -- Line: 1004 -- upvalues: createElement (upval), Event (upval), u4 (val)
                local v1 = {}
                v1[Event.ChildAdded] = p1.childAdded
                return createElement("Frame", v1, {ChildComponent = createElement(u4, {count = p1.state.count})})
            end
            local ScreenGui = Instance.new("ScreenGui")
            ScreenGui.Parent = u0
            local v2 = createElement(v1)
            local v3 = u80.mountVirtualNode(v2, ScreenGui, "Some Key")
            coroutine.resume(nil)
            expect(#ScreenGui:GetChildren()).to.equal(1)
            local v4 = ScreenGui:GetChildren()[1]
            expect(#v4:GetChildren()).to.equal(1)
            u80.unmountVirtualNode(v3)
        end)
        it("should not allow re-entrancy in updateChildren even with callbacks", function() -- Line: 1033 -- upvalues: Component (upval), createElement (upval), u0 (ref), u80 (upval)
            local u13
            local u4 = Component:extend("LowestComponent")
            function u4.render(p1) -- Line: 1036 -- upvalues: createElement (upval)
                return createElement("Frame")
            end
            function u4.didMount(p1) -- Line: 1040
                p1.props.onDidMountCallback()
            end
            local u11 = Component:extend("ChildComponent")
            function u11.init(p1) -- Line: 1046
                p1:setState({firstTime = true})
            end
            function u11.render(p1) -- Line: 1054 -- upvalues: createElement (upval), u4 (val)
                if p1.state.firstTime then
                    return createElement("Frame")
                end
                return createElement(u4, {onDidMountCallback = p1.props.onDidMountCallback})
            end
            function u11.didMount(p1) -- Line: 1064 -- upvalues: u13 (ref)
                u13 = coroutine.create(function() -- Line: 1065 -- upvalues: p1 (val)
                    p1:setState({firstTime = false})
                end)
            end
            local v1 = Component:extend("ParentComponent")
            local u21 = 0
            function v1.init(p1) -- Line: 1076 -- upvalues: u21 (ref)
                p1:setState({count = 1})
                function p1.onDidMountCallback() -- Line: 1081 -- upvalues: u21 (upval), p1 (val)
                    u21 = u21 + 1
                    if p1.state.count < 5 then
                        p1:setState({count = p1.state.count + 1})
                    end
                end
            end
            function v1.render(p1) -- Line: 1091 -- upvalues: createElement (upval), u11 (val)
                return createElement("Frame", {}, {ChildComponent = createElement(u11, {count = p1.state.count, onDidMountCallback = p1.onDidMountCallback})})
            end
            local ScreenGui = Instance.new("ScreenGui")
            ScreenGui.Parent = u0
            local v2 = createElement(v1)
            local v3 = u80.mountVirtualNode(v2, ScreenGui, "Some Key")
            coroutine.resume(nil)
            expect(#ScreenGui:GetChildren()).to.equal(1)
            local v4 = ScreenGui:GetChildren()[1]
            expect(#v4:GetChildren()).to.equal(1)
            local v5 = u21 <= 2
            expect(v5).to.equal(true)
            u80.unmountVirtualNode(v3)
        end)
        it("should never call unmount twice in the case of update children re-rentrancy", function() -- Line: 1123 -- upvalues: Component (upval), createElement (upval), u0 (ref), u80 (upval)
            local u26
            local u0 = {}
            local function addUnmount(p1) -- Line: 1126 -- upvalues: u0 (val)
                u0[p1] = u0[p1] + 1
            end
            local function addInit(p1) -- Line: 1130 -- upvalues: u0 (val)
                u0[p1] = 0
            end
            local u7 = Component:extend("LowestComponent")
            function u7.init(p1) -- Line: 1135 -- upvalues: u0 (val)
                local v1 = tostring(p1)
                u0[v1] = 0
            end
            function u7.render(p1) -- Line: 1139 -- upvalues: createElement (upval)
                return createElement("Frame")
            end
            function u7.didMount(p1) -- Line: 1143
                p1.props.onDidMountCallback()
            end
            function u7.willUnmount(p1) -- Line: 1147 -- upvalues: u0 (val)
                local v1 = tostring(p1)
                u0[v1] = u0[v1] + 1
            end
            local u16 = Component:extend("FirstComponent")
            function u16.init(p1) -- Line: 1152 -- upvalues: u0 (val)
                local v1 = tostring(p1)
                u0[v1] = 0
            end
            function u16.render(p1) -- Line: 1156 -- upvalues: createElement (upval)
                return createElement("TextLabel")
            end
            function u16.willUnmount(p1) -- Line: 1160 -- upvalues: u0 (val)
                local v1 = tostring(p1)
                u0[v1] = u0[v1] + 1
            end
            local u24 = Component:extend("ChildComponent")
            function u24.init(p1) -- Line: 1166 -- upvalues: u0 (val)
                local v1 = tostring(p1)
                u0[v1] = 0
                p1:setState({firstTime = true})
            end
            function u24.render(p1) -- Line: 1176 -- upvalues: createElement (upval), u16 (val), u7 (val)
                if p1.state.firstTime then
                    return createElement(u16)
                end
                return createElement(u7, {onDidMountCallback = p1.props.onDidMountCallback})
            end
            function u24.didMount(p1) -- Line: 1186 -- upvalues: u26 (ref)
                u26 = coroutine.create(function() -- Line: 1187 -- upvalues: p1 (val)
                    p1:setState({firstTime = false})
                end)
            end
            function u24.willUnmount(p1) -- Line: 1194 -- upvalues: u0 (val)
                local v1 = tostring(p1)
                u0[v1] = u0[v1] + 1
            end
            local v1 = Component:extend("ParentComponent")
            local u35 = 0
            function v1.init(p1) -- Line: 1202 -- upvalues: u35 (ref)
                p1:setState({count = 1})
                function p1.onDidMountCallback() -- Line: 1207 -- upvalues: u35 (upval), p1 (val)
                    u35 = u35 + 1
                    if p1.state.count < 5 then
                        p1:setState({count = p1.state.count + 1})
                    end
                end
            end
            function v1.render(p1) -- Line: 1217 -- upvalues: createElement (upval), u24 (val)
                return createElement("Frame", {}, {ChildComponent = createElement(u24, {count = p1.state.count, onDidMountCallback = p1.onDidMountCallback})})
            end
            local ScreenGui = Instance.new("ScreenGui")
            ScreenGui.Parent = u0
            local v2 = createElement(v1)
            local v3 = u80.mountVirtualNode(v2, ScreenGui, "Some Key")
            coroutine.resume(nil)
            expect(#ScreenGui:GetChildren()).to.equal(1)
            local v4 = ScreenGui:GetChildren()[1]
            expect(#v4:GetChildren()).to.equal(1)
            local v5 = u35 <= 2
            expect(v5).to.equal(true)
            u80.unmountVirtualNode(v3)
            for k, v in pairs(u0) do
                expect(v).to.equal(1)
            end
        end)
        it("should never unmount a node unnecesarily in the case of re-rentry", function() -- Line: 1253 -- upvalues: Component (upval), createElement (upval), u0 (ref), u80 (upval)
            local u13
            local u4 = Component:extend("LowestComponent")
            function u4.render(p1) -- Line: 1255 -- upvalues: createElement (upval)
                return createElement("Frame")
            end
            function u4.didUpdate(p1, p2, p3) -- Line: 1259
                if p2.firstTime and not p1.props.firstTime then
                    p1.props.onChangedCallback()
                end
            end
            local u11 = Component:extend("ChildComponent")
            function u11.init(p1) -- Line: 1267
                p1:setState({firstTime = true})
            end
            function u11.render(p1) -- Line: 1275 -- upvalues: createElement (upval), u4 (val)
                return createElement(u4, {firstTime = p1.state.firstTime, onChangedCallback = p1.props.onChangedCallback})
            end
            function u11.didMount(p1) -- Line: 1282 -- upvalues: u13 (ref)
                u13 = coroutine.create(function() -- Line: 1283 -- upvalues: p1 (val)
                    p1:setState({firstTime = false})
                end)
            end
            local v1 = Component:extend("ParentComponent")
            local u21 = 0
            function v1.init(p1) -- Line: 1294 -- upvalues: u21 (ref)
                p1:setState({count = 1})
                function p1.onChangedCallback() -- Line: 1299 -- upvalues: u21 (upval), p1 (val)
                    u21 = u21 + 1
                    if p1.state.count < 5 then
                        p1:setState({count = p1.state.count + 1})
                    end
                end
            end
            function v1.render(p1) -- Line: 1309 -- upvalues: createElement (upval), u11 (val)
                return createElement("Frame", {}, {ChildComponent = createElement(u11, {count = p1.state.count, onChangedCallback = p1.onChangedCallback})})
            end
            local ScreenGui = Instance.new("ScreenGui")
            ScreenGui.Parent = u0
            local v2 = createElement(v1)
            local v3 = u80.mountVirtualNode(v2, ScreenGui, "Some Key")
            coroutine.resume(nil)
            expect(#ScreenGui:GetChildren()).to.equal(1)
            local v4 = ScreenGui:GetChildren()[1]
            expect(#v4:GetChildren()).to.equal(1)
            expect(u21).to.equal(1)
            u80.unmountVirtualNode(v3)
        end)
    end)
end