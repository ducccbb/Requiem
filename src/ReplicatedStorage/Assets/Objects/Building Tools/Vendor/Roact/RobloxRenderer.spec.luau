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
--File: ReplicatedStorage.Assets.Objects.Building Tools.Vendor.Roact.RobloxRenderer.spec
--                               Dumped in 0.00396 seconds
--                          Bytecode version 9  |  57 functions

local u0 = script
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
return function() -- Line: 8 -- upvalues: u0 (val)
    local assertDeepEqual = require(u0.Parent.assertDeepEqual)
    local Binding = require(u0.Parent.Binding)
    local Children = require(u0.Parent.PropMarkers.Children)
    local Component = require(u0.Parent.Component)
    local createElement = require(u0.Parent.createElement)
    local createFragment = require(u0.Parent.createFragment)
    local createReconciler = require(u0.Parent.createReconciler)
    local createRef = require(u0.Parent.createRef)
    local createSpy = require(u0.Parent.createSpy)
    local GlobalConfig = require(u0.Parent.GlobalConfig)
    local Portal = require(u0.Parent.Portal)
    local Ref = require(u0.Parent.PropMarkers.Ref)
    local RobloxRenderer = require(u0.Parent.RobloxRenderer)
    local u69 = createReconciler(RobloxRenderer)
    describe("mountHostNode", function() -- Line: 26 -- upvalues: createElement (val), u69 (val), RobloxRenderer (val), Binding (val), createRef (val), Ref (val), createSpy (val), GlobalConfig (val)
        it("should create instances with correct props", function() -- Line: 27 -- upvalues: createElement (upval), u69 (upval), RobloxRenderer (upval)
            local Folder = Instance.new("Folder")
            local v1 = createElement("StringValue", {Value = "Hello!"})
            local v2 = u69.createVirtualNode(v1, Folder, "Some Key")
            RobloxRenderer.mountHostNode(u69, v2)
            expect(#Folder:GetChildren()).to.equal(1)
            local v3 = Folder:GetChildren()[1]
            expect(v3.ClassName).to.equal("StringValue")
            expect(v3.Value).to.equal("Hello!")
            expect(v3.Name).to.equal("Some Key")
        end)
        it("should create children with correct names and props", function() -- Line: 49 -- upvalues: createElement (upval), u69 (upval), RobloxRenderer (upval)
            local Folder = Instance.new("Folder")
            local v1 = createElement("StringValue", {Value = "Hey there!"}, {ChildA = createElement("IntValue", {Value = 173}), ChildB = createElement("Folder")})
            local v2 = u69.createVirtualNode(v1, Folder, "Some Key")
            RobloxRenderer.mountHostNode(u69, v2)
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
        it("should attach Bindings to Roblox properties", function() -- Line: 91 -- upvalues: Binding (upval), createElement (upval), u69 (upval), RobloxRenderer (upval)
            local v1, v2
            local Folder = Instance.new("Folder")
            v1, v2 = Binding.create(10)
            local v3 = createElement("IntValue", {Value = v1})
            local v4 = u69.createVirtualNode(v3, Folder, "Some Key")
            RobloxRenderer.mountHostNode(u69, v4)
            expect(#Folder:GetChildren()).to.equal(1)
            local v5 = Folder:GetChildren()[1]
            expect(v5.ClassName).to.equal("IntValue")
            expect(v5.Value).to.equal(10)
            v2(20)
            expect(v5.Value).to.equal(20)
            RobloxRenderer.unmountHostNode(u69, v4)
        end)
        it("should connect Binding refs", function() -- Line: 118 -- upvalues: createRef (upval), createElement (upval), Ref (upval), u69 (upval), RobloxRenderer (upval)
            local Folder = Instance.new("Folder")
            local v1 = createRef()
            local v2 = {}
            v2[Ref] = v1
            local v3 = createElement("Frame", v2)
            local v4 = u69.createVirtualNode(v3, Folder, "Some Key")
            RobloxRenderer.mountHostNode(u69, v4)
            expect(#Folder:GetChildren()).to.equal(1)
            v2 = Folder:GetChildren()[1]
            expect(v1.current).to.be.ok()
            expect(v1.current).to.equal(v2)
            RobloxRenderer.unmountHostNode(u69, v4)
        end)
        it("should call function refs", function() -- Line: 141 -- upvalues: createSpy (upval), createElement (upval), Ref (upval), u69 (upval), RobloxRenderer (upval)
            local Folder = Instance.new("Folder")
            local v1 = createSpy()
            local v2 = {}
            v2[Ref] = v1.value
            local v3 = createElement("Frame", v2)
            local v4 = u69.createVirtualNode(v3, Folder, "Some Key")
            RobloxRenderer.mountHostNode(u69, v4)
            expect(#Folder:GetChildren()).to.equal(1)
            v2 = Folder:GetChildren()[1]
            expect(v1.callCount).to.equal(1)
            v1:assertCalledWith(v2)
            RobloxRenderer.unmountHostNode(u69, v4)
        end)
        it("should throw if setting invalid instance properties", function() -- Line: 164 -- upvalues: GlobalConfig (upval), createElement (upval), u69 (upval), RobloxRenderer (upval)
            GlobalConfig.scoped({elementTracing = true}, function() -- Line: 169 -- upvalues: createElement (upval), u69 (upval), RobloxRenderer (upval)
                local v1, v2
                local Folder = Instance.new("Folder")
                local v3 = createElement("Frame", {Frob = 6})
                local v4 = u69.createVirtualNode(v3, Folder, "Some Key")
                v1, v2 = pcall(RobloxRenderer.mountHostNode, u69, v4)
                assert(not v1, "Expected call to fail")
                expect(v2:find("Frob")).to.be.ok()
                expect(v2:find("Frame")).to.be.ok()
                expect(v2:find("RobloxRenderer%.spec")).to.be.ok()
            end)
        end)
    end)
    describe("updateHostNode", function() -- Line: 189 -- upvalues: createElement (val), u69 (val), RobloxRenderer (val), Binding (val), createRef (val), Ref (val), createSpy (val), GlobalConfig (val)
        it("should update node props and children", function() -- Line: 190 -- upvalues: createElement (upval), u69 (upval), RobloxRenderer (upval)
            local Folder = Instance.new("Folder")
            local v1 = createElement("StringValue", {Value = "foo"}, {ChildA = createElement("IntValue", {Value = 1}), ChildB = createElement("BoolValue", {Value = true}), ChildC = createElement("StringValue", {Value = "test"}), ChildD = createElement("StringValue", {Value = "test"})})
            local v2 = u69.createVirtualNode(v1, Folder, "updateHostNodeTest")
            RobloxRenderer.mountHostNode(u69, v2)
            local v3 = createElement("StringValue", {Value = "bar"}, {ChildA = createElement("StringValue", {Value = "test"}), ChildB = createElement("BoolValue", {Value = false}), ChildC = createElement("StringValue", {}), ChildE = createElement("Folder", {})})
            RobloxRenderer.updateHostNode(u69, v2, v3)
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
        it("should update Bindings", function() -- Line: 264 -- upvalues: Binding (upval), createElement (upval), u69 (upval), RobloxRenderer (upval)
            local v1, v2, v3, v4
            local Folder = Instance.new("Folder")
            v1, v2 = Binding.create(10)
            local v5 = createElement("IntValue", {Value = v1})
            local v6 = u69.createVirtualNode(v5, Folder, "Some Key")
            RobloxRenderer.mountHostNode(u69, v6)
            local v7 = Folder:GetChildren()[1]
            expect(v7.Value).to.equal(10)
            v3, v4 = Binding.create(99)
            local v8 = createElement("IntValue", {Value = v3})
            RobloxRenderer.updateHostNode(u69, v6, v8)
            expect(v7.Value).to.equal(99)
            v2(123)
            expect(v7.Value).to.equal(99)
            v4(123)
            expect(v7.Value).to.equal(123)
            RobloxRenderer.unmountHostNode(u69, v6)
        end)
        it("should update Binding refs", function() -- Line: 301 -- upvalues: createRef (upval), createElement (upval), Ref (upval), u69 (upval), RobloxRenderer (upval)
            local Folder = Instance.new("Folder")
            local v1 = createRef()
            local v2 = createRef()
            local v3 = {}
            v3[Ref] = v1
            local v4 = createElement("Frame", v3)
            local v5 = u69.createVirtualNode(v4, Folder, "Some Key")
            RobloxRenderer.mountHostNode(u69, v5)
            expect(#Folder:GetChildren()).to.equal(1)
            v3 = Folder:GetChildren()[1]
            expect(v1.current).to.equal(v3)
            expect(v2.current).never.to.be.ok()
            local v6 = {}
            v6[Ref] = v2
            local v7 = createElement("Frame", v6)
            RobloxRenderer.updateHostNode(u69, v5, v7)
            expect(v1.current).never.to.be.ok()
            expect(v2.current).to.equal(v3)
            RobloxRenderer.unmountHostNode(u69, v5)
        end)
        it("should call old function refs with nil and new function refs with a valid rbx", function() -- Line: 335 -- upvalues: createSpy (upval), createElement (upval), Ref (upval), u69 (upval), RobloxRenderer (upval)
            local Folder = Instance.new("Folder")
            local v1 = createSpy()
            local v2 = createSpy()
            local v3 = {}
            v3[Ref] = v1.value
            local v4 = createElement("Frame", v3)
            local v5 = u69.createVirtualNode(v4, Folder, "Some Key")
            RobloxRenderer.mountHostNode(u69, v5)
            expect(#Folder:GetChildren()).to.equal(1)
            v3 = Folder:GetChildren()[1]
            expect(v1.callCount).to.equal(1)
            v1:assertCalledWith(v3)
            expect(v2.callCount).to.equal(0)
            local v6 = {}
            v6[Ref] = v2.value
            local v7 = createElement("Frame", v6)
            RobloxRenderer.updateHostNode(u69, v5, v7)
            expect(v1.callCount).to.equal(2)
            v1:assertCalledWith(nil)
            expect(v2.callCount).to.equal(1)
            v2:assertCalledWith(v3)
            RobloxRenderer.unmountHostNode(u69, v5)
        end)
        it("should not call function refs again if they didn't change", function() -- Line: 372 -- upvalues: createSpy (upval), createElement (upval), Ref (upval), u69 (upval), RobloxRenderer (upval)
            local Folder = Instance.new("Folder")
            local v1 = createSpy()
            local v2 = {Size = UDim2.new(1, 0, 1, 0)}
            v2[Ref] = v1.value
            local v3 = createElement("Frame", v2)
            local v4 = u69.createVirtualNode(v3, Folder, "Some Key")
            RobloxRenderer.mountHostNode(u69, v4)
            expect(#Folder:GetChildren()).to.equal(1)
            v2 = Folder:GetChildren()[1]
            expect(v1.callCount).to.equal(1)
            v1:assertCalledWith(v2)
            local v5 = {Size = UDim2.new(0.5, 0, 0.5, 0)}
            v5[Ref] = v1.value
            local v6 = createElement("Frame", v5)
            RobloxRenderer.updateHostNode(u69, v4, v6)
            expect(v1.callCount).to.equal(1)
        end)
        it("should throw if setting invalid instance properties", function() -- Line: 405 -- upvalues: GlobalConfig (upval), createElement (upval), u69 (upval), RobloxRenderer (upval)
            GlobalConfig.scoped({elementTracing = true}, function() -- Line: 410 -- upvalues: createElement (upval), u69 (upval), RobloxRenderer (upval)
                local v1, v2
                local Folder = Instance.new("Folder")
                local Frame = createElement("Frame")
                local v3 = createElement("Frame", {Frob = 6})
                local v4 = u69.createVirtualNode(Frame, Folder, "Some Key")
                RobloxRenderer.mountHostNode(u69, v4)
                v1, v2 = pcall(RobloxRenderer.updateHostNode, u69, v4, v3)
                assert(not v1, "Expected call to fail")
                expect(v2:find("Frob")).to.be.ok()
                expect(v2:find("Frame")).to.be.ok()
                expect(v2:find("RobloxRenderer%.spec")).to.be.ok()
            end)
        end)
        it("should delete instances when reconciling to nil children", function() -- Line: 431 -- upvalues: createElement (upval), u69 (upval), RobloxRenderer (upval)
            local Folder = Instance.new("Folder")
            local v1 = createElement("Frame", {Size = UDim2.new(1, 0, 1, 0)}, {child = createElement("Frame")})
            local v2 = u69.createVirtualNode(v1, Folder, "Some Key")
            RobloxRenderer.mountHostNode(u69, v2)
            expect(#Folder:GetChildren()).to.equal(1)
            local v3 = Folder:GetChildren()[1]
            expect(#v3:GetChildren()).to.equal(1)
            local v4 = createElement("Frame", {Size = UDim2.new(0.5, 0, 0.5, 0)})
            RobloxRenderer.updateHostNode(u69, v2, v4)
            expect(#v3:GetChildren()).to.equal(0)
        end)
    end)
    describe("unmountHostNode", function() -- Line: 459 -- upvalues: createElement (val), u69 (val), RobloxRenderer (val), Binding (val), createRef (val), Ref (val), createSpy (val)
        it("should delete instances from the inside-out", function() -- Line: 460 -- upvalues: createElement (upval), u69 (upval), RobloxRenderer (upval)
            local Folder = Instance.new("Folder")
            local v1 = createElement("Folder", nil, {Child = createElement("Folder", nil, {Grandchild = createElement("Folder")})})
            local v2 = u69.mountVirtualNode(v1, Folder, "Root")
            expect(#Folder:GetChildren()).to.equal(1)
            local v3 = Folder:GetChildren()[1]
            expect(#v3:GetChildren()).to.equal(1)
            local v4 = v3:GetChildren()[1]
            expect(#v4:GetChildren()).to.equal(1)
            local v5 = v4:GetChildren()[1]
            RobloxRenderer.unmountHostNode(u69, v2)
            expect(v5.Parent).to.equal(nil)
            expect(v4.Parent).to.equal(nil)
            expect(v3.Parent).to.equal(nil)
        end)
        it("should unsubscribe from any Bindings", function() -- Line: 488 -- upvalues: Binding (upval), createElement (upval), u69 (upval), RobloxRenderer (upval)
            local v1, v2
            local Folder = Instance.new("Folder")
            v1, v2 = Binding.create(10)
            local v3 = createElement("IntValue", {Value = v1})
            local v4 = u69.createVirtualNode(v3, Folder, "Some Key")
            RobloxRenderer.mountHostNode(u69, v4)
            local v5 = Folder:GetChildren()[1]
            expect(v5.Value).to.equal(10)
            RobloxRenderer.unmountHostNode(u69, v4)
            v2(56)
            expect(v5.Value).to.equal(10)
        end)
        it("should clear Binding refs", function() -- Line: 511 -- upvalues: createRef (upval), createElement (upval), Ref (upval), u69 (upval), RobloxRenderer (upval)
            local Folder = Instance.new("Folder")
            local v1 = createRef()
            local v2 = {}
            v2[Ref] = v1
            local v3 = createElement("Frame", v2)
            local v4 = u69.createVirtualNode(v3, Folder, "Some Key")
            RobloxRenderer.mountHostNode(u69, v4)
            expect(v1.current).to.be.ok()
            RobloxRenderer.unmountHostNode(u69, v4)
            expect(v1.current).never.to.be.ok()
        end)
        it("should call function refs with nil", function() -- Line: 531 -- upvalues: createSpy (upval), createElement (upval), Ref (upval), u69 (upval), RobloxRenderer (upval)
            local Folder = Instance.new("Folder")
            local v1 = createSpy()
            local v2 = {}
            v2[Ref] = v1.value
            local v3 = createElement("Frame", v2)
            local v4 = u69.createVirtualNode(v3, Folder, "Some Key")
            RobloxRenderer.mountHostNode(u69, v4)
            expect(v1.callCount).to.equal(1)
            RobloxRenderer.unmountHostNode(u69, v4)
            expect(v1.callCount).to.equal(2)
            v1:assertCalledWith(nil)
        end)
    end)
    describe("Portals", function() -- Line: 553 -- upvalues: createElement (val), Portal (val), u69 (val)
        it("should create and destroy instances as children of `target`", function() -- Line: 554 -- upvalues: createElement (upval), Portal (upval), u69 (upval)
            local Folder = Instance.new("Folder")
            local v1 = createElement(Portal, {target = Folder}, {folderOne = createElement("Folder"), folderTwo = createElement("Folder"), intValueOne = createElement(function(p1) -- Line: 557 -- upvalues: createElement (upval)
                return createElement("IntValue", {Value = p1.value})
            end, {value = 42})})
            local v2 = u69.mountVirtualNode(v1, nil, "Some Key")
            expect(#Folder:GetChildren()).to.equal(3)
            expect(Folder:FindFirstChild("folderOne")).to.be.ok()
            expect(Folder:FindFirstChild("folderTwo")).to.be.ok()
            expect(Folder:FindFirstChild("intValueOne")).to.be.ok()
            expect(Folder:FindFirstChild("intValueOne").Value).to.equal(42)
            u69.unmountVirtualNode(v2)
            expect(#Folder:GetChildren()).to.equal(0)
        end)
        it("should pass prop updates through to children", function() -- Line: 588 -- upvalues: createElement (upval), Portal (upval), u69 (upval)
            local Folder = Instance.new("Folder")
            local v1 = createElement(Portal, {target = Folder}, {ChildValue = createElement("IntValue", {Value = 1})})
            local v2 = createElement(Portal, {target = Folder}, {ChildValue = createElement("IntValue", {Value = 2})})
            local v3 = u69.mountVirtualNode(v1, nil, "A Host Key")
            expect(#Folder:GetChildren()).to.equal(1)
            local ChildValue = Folder.ChildValue
            expect(ChildValue.Value).to.equal(1)
            v3 = u69.updateVirtualNode(v3, v2)
            expect(#Folder:GetChildren()).to.equal(1)
            local ChildValue_2 = Folder.ChildValue
            expect(ChildValue).to.equal(ChildValue_2)
            expect(ChildValue_2.Value).to.equal(2)
            u69.unmountVirtualNode(v3)
            expect(#Folder:GetChildren()).to.equal(0)
        end)
        it("should throw if `target` is nil", function() -- Line: 629 -- upvalues: createElement (upval), Portal (upval), u69 (upval)
            local u2 = createElement(Portal)
            expect(function() -- Line: 635 -- upvalues: u69 (upval), u2 (val)
                u69.mountVirtualNode(u2, nil, "Keys for Everyone")
            end).to.throw()
        end)
        it("should throw if `target` is not a Roblox instance", function() -- Line: 640 -- upvalues: createElement (upval), Portal (upval), u69 (upval)
            local u4 = createElement(Portal, {target = {}})
            expect(function() -- Line: 647 -- upvalues: u69 (upval), u4 (val)
                u69.mountVirtualNode(u4, nil, "Unleash the keys!")
            end).to.throw()
        end)
        it("should recreate instances if `target` changes in an update", function() -- Line: 652 -- upvalues: createElement (upval), Portal (upval), u69 (upval)
            local Folder = Instance.new("Folder")
            local Folder_2 = Instance.new("Folder")
            local v1 = createElement(Portal, {target = Folder}, {ChildValue = createElement("IntValue", {Value = 1})})
            local v2 = createElement(Portal, {target = Folder_2}, {ChildValue = createElement("IntValue", {Value = 2})})
            local v3 = u69.mountVirtualNode(v1, nil, "Some Key")
            expect(#Folder:GetChildren()).to.equal(1)
            expect(#Folder_2:GetChildren()).to.equal(0)
            expect(Folder.ChildValue.Value).to.equal(1)
            v3 = u69.updateVirtualNode(v3, v2)
            expect(#Folder:GetChildren()).to.equal(0)
            expect(#Folder_2:GetChildren()).to.equal(1)
            expect(Folder_2.ChildValue.Value).to.equal(2)
            u69.unmountVirtualNode(v3)
            expect(#Folder:GetChildren()).to.equal(0)
            expect(#Folder_2:GetChildren()).to.equal(0)
        end)
    end)
    describe("Fragments", function() -- Line: 697 -- upvalues: createFragment (val), createElement (val), u69 (val)
        it("should parent the fragment's elements into the fragment's parent", function() -- Line: 698 -- upvalues: createFragment (upval), createElement (upval), u69 (upval)
            local Folder = Instance.new("Folder")
            local v1 = createFragment({key = createElement("IntValue", {Value = 1}), key2 = createElement("IntValue", {Value = 2})})
            local v2 = u69.mountVirtualNode(v1, Folder, "test")
            expect(Folder:FindFirstChild("key")).to.be.ok()
            expect(Folder.key.ClassName).to.equal("IntValue")
            expect(Folder.key.Value).to.equal(1)
            expect(Folder:FindFirstChild("key2")).to.be.ok()
            expect(Folder.key2.ClassName).to.equal("IntValue")
            expect(Folder.key2.Value).to.equal(2)
            u69.unmountVirtualNode(v2)
            expect(#Folder:GetChildren()).to.equal(0)
        end)
        it("should allow sibling fragment to have common keys", function() -- Line: 725 -- upvalues: createElement (upval), createFragment (upval), u69 (upval)
            local Folder = Instance.new("Folder")
            local v1 = createElement(function(p1) -- Line: 729 -- upvalues: createElement (upval), createFragment (upval)
                return createElement("IntValue", {}, {fragmentA = createFragment({key = createElement("StringValue", {Value = "A"}), key2 = createElement("StringValue", {Value = "B"})}), fragmentB = createFragment({key = createElement("StringValue", {Value = "C"}), key2 = createElement("StringValue", {Value = "D"})})})
            end)
            local v2 = u69.mountVirtualNode(v1, Folder, "Test")
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
            u69.unmountVirtualNode(v2)
            expect(#Folder:GetChildren()).to.equal(0)
        end)
        it("should render nested fragments", function() -- Line: 773 -- upvalues: createFragment (upval), createElement (upval), u69 (upval)
            local Folder = Instance.new("Folder")
            local v1 = createFragment({key = createFragment({TheValue = createElement("IntValue", {Value = 1}), TheOtherValue = createElement("IntValue", {Value = 2})})})
            local v2 = u69.mountVirtualNode(v1, Folder, "Test")
            expect(Folder:FindFirstChild("TheValue")).to.be.ok()
            expect(Folder.TheValue.ClassName).to.equal("IntValue")
            expect(Folder.TheValue.Value).to.equal(1)
            expect(Folder:FindFirstChild("TheOtherValue")).to.be.ok()
            expect(Folder.TheOtherValue.ClassName).to.equal("IntValue")
            expect(Folder.TheOtherValue.Value).to.equal(2)
            u69.unmountVirtualNode(v2)
            expect(#Folder:GetChildren()).to.equal(0)
        end)
        it("should not add any instances if the fragment is empty", function() -- Line: 802 -- upvalues: u69 (upval), createFragment (upval)
            local Folder = Instance.new("Folder")
            local v1 = createFragment({})
            local v2 = u69.mountVirtualNode(v1, Folder, "test")
            expect(#Folder:GetChildren()).to.equal(0)
            u69.unmountVirtualNode(v2)
            expect(#Folder:GetChildren()).to.equal(0)
        end)
    end)
    describe("Context", function() -- Line: 815 -- upvalues: Component (val), createElement (val), u69 (val), assertDeepEqual (val), Children (val), Portal (val)
        it("should pass context values through Roblox host nodes", function() -- Line: 816 -- upvalues: Component (upval), createElement (upval), u69 (upval), assertDeepEqual (upval)
            local v1 = Component:extend("Consumer")
            local u5 = nil
            function v1.init(p1) -- Line: 820 -- upvalues: u5 (ref)
                u5 = {hello = p1:__getContext("hello")}
            end
            function v1.render(p1) end
            local v2 = createElement("Folder", nil, {Consumer = createElement(v1)})
            local v3 = {hello = "world"}
            local v4 = u69.mountVirtualNode(v2, nil, "Context Test", v3)
            expect(u5).never.to.equal(v3)
            assertDeepEqual(u5, v3)
            u69.unmountVirtualNode(v4)
        end)
        it("should pass context values through portal nodes", function() -- Line: 845 -- upvalues: Component (upval), createElement (upval), Children (upval), Portal (upval), u69 (upval), assertDeepEqual (upval)
            local u15
            local Folder = Instance.new("Folder")
            local v1 = Component:extend("Provider")
            function v1.init(p1) -- Line: 850
                p1:__addContext("foo", "bar")
            end
            function v1.render(p1) -- Line: 854 -- upvalues: createElement (upval), Children (upval)
                return createElement("Folder", nil, p1.props[Children])
            end
            local v2 = Component:extend("Consumer")
            function v2.init(p1) -- Line: 861 -- upvalues: u15 (ref)
                u15 = {foo = p1:__getContext("foo")}
            end
            function v2.render(p1) -- Line: 867
                return nil
            end
            local v3 = createElement(v1, nil, {Portal = createElement(Portal, {target = Folder}, {Consumer = createElement(v2)})})
            u69.mountVirtualNode(v3, nil, "Some Key")
            assertDeepEqual(nil, {foo = "bar"})
        end)
    end)
    describe("Legacy context", function() -- Line: 888 -- upvalues: Component (val), createElement (val), u69 (val), assertDeepEqual (val), Children (val), Portal (val)
        it("should pass context values through Roblox host nodes", function() -- Line: 889 -- upvalues: Component (upval), createElement (upval), u69 (upval), assertDeepEqual (upval)
            local v1 = Component:extend("Consumer")
            local u5 = nil
            function v1.init(p1) -- Line: 893 -- upvalues: u5 (ref)
                u5 = p1._context
            end
            function v1.render(p1) end
            local v2 = createElement("Folder", nil, {Consumer = createElement(v1)})
            local v3 = {hello = "world"}
            local v4 = u69.mountVirtualNode(v2, nil, "Context Test", nil, v3)
            expect(u5).never.to.equal(v3)
            assertDeepEqual(u5, v3)
            u69.unmountVirtualNode(v4)
        end)
        it("should pass context values through portal nodes", function() -- Line: 916 -- upvalues: Component (upval), createElement (upval), Children (upval), Portal (upval), u69 (upval), assertDeepEqual (upval)
            local u15
            local Folder = Instance.new("Folder")
            local v1 = Component:extend("Provider")
            function v1.init(p1) -- Line: 921
                p1._context.foo = "bar"
            end
            function v1.render(p1) -- Line: 925 -- upvalues: createElement (upval), Children (upval)
                return createElement("Folder", nil, p1.props[Children])
            end
            local v2 = Component:extend("Consumer")
            function v2.init(p1) -- Line: 932 -- upvalues: u15 (ref)
                u15 = p1._context
            end
            function v2.render(p1) -- Line: 936
                return nil
            end
            local v3 = createElement(v1, nil, {Portal = createElement(Portal, {target = Folder}, {Consumer = createElement(v2)})})
            u69.mountVirtualNode(v3, nil, "Some Key")
            assertDeepEqual(nil, {foo = "bar"})
        end)
    end)
end