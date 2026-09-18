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
--File: ReplicatedStorage.Assets.Objects.Building Tools.Vendor.Roact.createReconciler.spec
--                               Dumped in 0.00173 seconds
--                          Bytecode version 9  |  38 functions

local u0 = script
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
return function() -- Line: 8 -- upvalues: u0 (val)
    local assign = require(u0.Parent.assign)
    local createElement = require(u0.Parent.createElement)
    local createFragment = require(u0.Parent.createFragment)
    local createSpy = require(u0.Parent.createSpy)
    local NoopRenderer = require(u0.Parent.NoopRenderer)
    local Type = require(u0.Parent.Type)
    local ElementKind = require(u0.Parent.ElementKind)
    local createReconciler = require(u0.Parent.createReconciler)
    local u42 = createReconciler(NoopRenderer)
    describe("tree operations", function() -- Line: 21 -- upvalues: u42 (val), createElement (val)
        it("should mount and unmount", function() -- Line: 22 -- upvalues: u42 (upval), createElement (upval)
            local v1 = u42.mountVirtualTree(createElement("StringValue"))
            expect(v1).to.be.ok()
            u42.unmountVirtualTree(v1)
        end)
        it("should mount, update, and unmount", function() -- Line: 30 -- upvalues: u42 (upval), createElement (upval)
            local v1 = u42.mountVirtualTree(createElement("StringValue"))
            expect(v1).to.be.ok()
            u42.updateVirtualTree(v1, createElement("StringValue"))
            u42.unmountVirtualTree(v1)
        end)
    end)
    describe("booleans", function() -- Line: 41 -- upvalues: u42 (val), createElement (val)
        it("should mount booleans as nil", function() -- Line: 42 -- upvalues: u42 (upval)
            local v1 = u42.mountVirtualNode(false, nil, "test")
            expect(v1).to.equal(nil)
        end)
        it("should unmount nodes if they are updated to a boolean value", function() -- Line: 47 -- upvalues: u42 (upval), createElement (upval)
            local StringValue = createElement("StringValue")
            local v1 = u42.mountVirtualNode(StringValue, nil, "test")
            expect(v1).to.be.ok()
            v1 = u42.updateVirtualNode(v1, true)
            expect(v1).to.equal(nil)
        end)
    end)
    describe("invalid elements", function() -- Line: 58 -- upvalues: u42 (val), createElement (val)
        it("should throw errors when attempting to mount invalid elements", function() -- Line: 59 -- upvalues: u42 (upval), createElement (upval)
            local function u0() -- Line: 61
                return "Hello"
            end
            local function u1() -- Line: 64
                return 1
            end
            local function u2() -- Line: 67
                return function() end
            end
            local function u3() -- Line: 70
                return {}
            end
            expect(function() -- Line: 77 -- upvalues: u42 (upval), createElement (upval), u0 (val)
                local v1 = createElement(u0)
                u42.mountVirtualNode(v1, nil, "Some Key")
            end).to.throw()
            expect(function() -- Line: 81 -- upvalues: u42 (upval), createElement (upval), u1 (val)
                local v1 = createElement(u1)
                u42.mountVirtualNode(v1, nil, "Some Key")
            end).to.throw()
            expect(function() -- Line: 85 -- upvalues: u42 (upval), createElement (upval), u2 (val)
                local v1 = createElement(u2)
                u42.mountVirtualNode(v1, nil, "Some Key")
            end).to.throw()
            expect(function() -- Line: 89 -- upvalues: u42 (upval), createElement (upval), u3 (val)
                local v1 = createElement(u3)
                u42.mountVirtualNode(v1, nil, "Some Key")
            end).to.throw()
        end)
    end)
    describe("Host components", function() -- Line: 95 -- upvalues: createSpy (val), NoopRenderer (val), assign (val), createReconciler (val), createElement (val), Type (val)
        it("should invoke the renderer to mount host nodes", function() -- Line: 96 -- upvalues: createSpy (upval), NoopRenderer (upval), assign (upval), createReconciler (upval), createElement (upval), Type (upval)
            local v1 = createSpy(NoopRenderer.mountHostNode)
            local v2 = assign({}, NoopRenderer, {mountHostNode = v1.value})
            local v3 = createReconciler(v2)
            local StringValue = createElement("StringValue")
            local v4 = v3.mountVirtualNode(StringValue, nil, "Some Key")
            expect(Type.of(v4)).to.equal(Type.VirtualNode)
            expect(v1.callCount).to.equal(1)
            local v5 = v1:captureValues("reconciler", "node")
            expect(v5.reconciler).to.equal(v3)
            expect(v5.node).to.equal(v4)
        end)
        it("should invoke the renderer to update host nodes", function() -- Line: 120 -- upvalues: createSpy (upval), NoopRenderer (upval), assign (upval), createReconciler (upval), createElement (upval), Type (upval)
            local v1 = createSpy(NoopRenderer.updateHostNode)
            local v2 = assign({}, NoopRenderer, {mountHostNode = NoopRenderer.mountHostNode, updateHostNode = v1.value})
            local v3 = createReconciler(v2)
            local StringValue = createElement("StringValue")
            local v4 = v3.mountVirtualNode(StringValue, nil, "Key")
            expect(Type.of(v4)).to.equal(Type.VirtualNode)
            local StringValue_2 = createElement("StringValue")
            local v5 = v3.updateVirtualNode(v4, StringValue_2)
            expect(v5).to.equal(v4)
            expect(v1.callCount).to.equal(1)
            local v6 = v1:captureValues("reconciler", "node", "newElement")
            expect(v6.reconciler).to.equal(v3)
            expect(v6.node).to.equal(v4)
            expect(v6.newElement).to.equal(StringValue_2)
        end)
        it("should invoke the renderer to unmount host nodes", function() -- Line: 151 -- upvalues: createSpy (upval), NoopRenderer (upval), assign (upval), createReconciler (upval), createElement (upval), Type (upval)
            local v1 = createSpy(NoopRenderer.unmountHostNode)
            local v2 = assign({}, NoopRenderer, {mountHostNode = NoopRenderer.mountHostNode, unmountHostNode = v1.value})
            local v3 = createReconciler(v2)
            local StringValue = createElement("StringValue")
            local v4 = v3.mountVirtualNode(StringValue, nil, "Key")
            expect(Type.of(v4)).to.equal(Type.VirtualNode)
            v3.unmountVirtualNode(v4)
            expect(v1.callCount).to.equal(1)
            local v5 = v1:captureValues("reconciler", "node")
            expect(v5.reconciler).to.equal(v3)
            expect(v5.node).to.equal(v4)
        end)
    end)
    describe("Function components", function() -- Line: 179 -- upvalues: createSpy (val), createElement (val), u42 (val), Type (val), createFragment (val)
        it("should mount and unmount function components", function() -- Line: 180 -- upvalues: createSpy (upval), createElement (upval), u42 (upval), Type (upval)
            local v1 = createSpy(function(p1) -- Line: 181
                return nil
            end)
            local v2 = createElement(v1.value, {someValue = 5})
            local v3 = u42.mountVirtualNode(v2, nil, "A Key")
            expect(Type.of(v3)).to.equal(Type.VirtualNode)
            expect(v1.callCount).to.equal(1)
            local v4 = v1:captureValues("props")
            expect(v4.props).to.be.a("table")
            expect(v4.props.someValue).to.equal(5)
            u42.unmountVirtualNode(v3)
            expect(v1.callCount).to.equal(1)
        end)
        it("should mount single children of function components", function() -- Line: 206 -- upvalues: createSpy (upval), createElement (upval), u42 (upval), Type (upval)
            local u2 = createSpy(function(p1) -- Line: 207
                return nil
            end)
            local v1 = createSpy(function(p1) -- Line: 211 -- upvalues: createElement (upval), u2 (val)
                return createElement(u2.value, {value = p1.value + 1})
            end)
            local v2 = createElement(v1.value, {value = 13})
            local v3 = u42.mountVirtualNode(v2, nil, "A Key")
            expect(Type.of(v3)).to.equal(Type.VirtualNode)
            expect(v1.callCount).to.equal(1)
            expect(u2.callCount).to.equal(1)
            local v4 = v1:captureValues("props")
            local v5 = u2:captureValues("props")
            expect(v4.props).to.be.a("table")
            expect(v4.props.value).to.equal(13)
            expect(v5.props).to.be.a("table")
            expect(v5.props.value).to.equal(14)
            u42.unmountVirtualNode(v3)
            expect(v1.callCount).to.equal(1)
            expect(u2.callCount).to.equal(1)
        end)
        it("should mount fragments returned by function components", function() -- Line: 244 -- upvalues: createSpy (upval), createFragment (upval), createElement (upval), u42 (upval), Type (upval)
            local u2 = createSpy(function(p1) -- Line: 245
                return nil
            end)
            local u5 = createSpy(function(p1) -- Line: 249
                return nil
            end)
            local v1 = createSpy(function(p1) -- Line: 253 -- upvalues: createFragment (upval), createElement (upval), u2 (val), u5 (val)
                return createFragment({A = createElement(u2.value, {value = p1.value + 1}), B = createElement(u5.value, {value = p1.value + 5})})
            end)
            local v2 = createElement(v1.value, {value = 17})
            local v3 = u42.mountVirtualNode(v2, nil, "A Key")
            expect(Type.of(v3)).to.equal(Type.VirtualNode)
            expect(v1.callCount).to.equal(1)
            expect(u2.callCount).to.equal(1)
            expect(u5.callCount).to.equal(1)
            local v4 = v1:captureValues("props")
            local v5 = u2:captureValues("props")
            local v6 = u5:captureValues("props")
            expect(v4.props).to.be.a("table")
            expect(v4.props.value).to.equal(17)
            expect(v5.props).to.be.a("table")
            expect(v5.props.value).to.equal(18)
            expect(v6.props).to.be.a("table")
            expect(v6.props.value).to.equal(22)
            u42.unmountVirtualNode(v3)
            expect(v1.callCount).to.equal(1)
            expect(u2.callCount).to.equal(1)
            expect(u5.callCount).to.equal(1)
        end)
    end)
    describe("Fragments", function() -- Line: 298 -- upvalues: createFragment (val), u42 (val), ElementKind (val), createSpy (val), createElement (val)
        it("should mount fragments", function() -- Line: 299 -- upvalues: createFragment (upval), u42 (upval), ElementKind (upval)
            local v1 = createFragment({})
            local v2 = u42.mountVirtualNode(v1, nil, "test")
            expect(v2).to.be.ok()
            expect(ElementKind.of(v2.currentElement)).to.equal(ElementKind.Fragment)
        end)
        it("should mount an empty fragment", function() -- Line: 307 -- upvalues: createFragment (upval), u42 (upval)
            local v1 = createFragment({})
            local v2 = u42.mountVirtualNode(v1, nil, "test")
            expect(v2).to.be.ok()
            expect(next(v2.children)).to.never.be.ok()
        end)
        it("should mount all fragment's children", function() -- Line: 315 -- upvalues: createSpy (upval), createElement (upval), createFragment (upval), u42 (upval)
            local v1
            local v2 = createSpy(function(p1) -- Line: 316
                return nil
            end)
            local v3 = {}
            local v4 = 5
            local v5 = 1
            for i = 1, v4, v5 do
                v1 = "key" .. tostring(i)
                v3[v1] = createElement(v2.value, {})
            end
            v4 = createFragment(v3)
            v5 = u42.mountVirtualNode(v4, nil, "test")
            expect(v5).to.be.ok()
            expect(v2.callCount).to.equal(5)
        end)
    end)
end