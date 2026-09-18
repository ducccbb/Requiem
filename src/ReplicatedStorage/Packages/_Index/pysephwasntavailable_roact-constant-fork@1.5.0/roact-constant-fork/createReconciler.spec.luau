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
--File: ReplicatedStorage.Packages._Index.pysephwasntavailable_roact-constant-fork@1.5.0.roact-constant-fork.createReconciler.spec
--                               Dumped in 0.00182 seconds
--                          Bytecode version 9  |  38 functions

return function() -- Line: 1
    local assign = require(script.Parent.assign)
    local createElement = require(script.Parent.createElement)
    local createFragment = require(script.Parent.createFragment)
    local createSpy = require(script.Parent.createSpy)
    local NoopRenderer = require(script.Parent.NoopRenderer)
    local Type = require(script.Parent.Type)
    local ElementKind = require(script.Parent.ElementKind)
    local createReconciler = require(script.Parent.createReconciler)
    local u42 = createReconciler(NoopRenderer)
    describe("tree operations", function() -- Line: 14 -- upvalues: u42 (val), createElement (val)
        it("should mount and unmount", function() -- Line: 15 -- upvalues: u42 (upval), createElement (upval)
            local v1 = u42.mountVirtualTree(createElement("StringValue"))
            expect(v1).to.be.ok()
            u42.unmountVirtualTree(v1)
        end)
        it("should mount, update, and unmount", function() -- Line: 23 -- upvalues: u42 (upval), createElement (upval)
            local v1 = u42.mountVirtualTree(createElement("StringValue"))
            expect(v1).to.be.ok()
            u42.updateVirtualTree(v1, createElement("StringValue"))
            u42.unmountVirtualTree(v1)
        end)
    end)
    describe("booleans", function() -- Line: 34 -- upvalues: u42 (val), createElement (val)
        it("should mount booleans as nil", function() -- Line: 35 -- upvalues: u42 (upval)
            local v1 = u42.mountVirtualNode(false, nil, "test")
            expect(v1).to.equal(nil)
        end)
        it("should unmount nodes if they are updated to a boolean value", function() -- Line: 40 -- upvalues: u42 (upval), createElement (upval)
            local StringValue = createElement("StringValue")
            local v1 = u42.mountVirtualNode(StringValue, nil, "test")
            expect(v1).to.be.ok()
            v1 = u42.updateVirtualNode(v1, true)
            expect(v1).to.equal(nil)
        end)
    end)
    describe("invalid elements", function() -- Line: 51 -- upvalues: u42 (val), createElement (val)
        it("should throw errors when attempting to mount invalid elements", function() -- Line: 52 -- upvalues: u42 (upval), createElement (upval)
            local function u0() -- Line: 54
                return "Hello"
            end
            local function u1() -- Line: 57
                return 1
            end
            local function u2() -- Line: 60
                return function() end
            end
            local function u3() -- Line: 63
                return {}
            end
            expect(function() -- Line: 70 -- upvalues: u42 (upval), createElement (upval), u0 (val)
                local v1 = createElement(u0)
                u42.mountVirtualNode(v1, nil, "Some Key")
            end).to.throw()
            expect(function() -- Line: 74 -- upvalues: u42 (upval), createElement (upval), u1 (val)
                local v1 = createElement(u1)
                u42.mountVirtualNode(v1, nil, "Some Key")
            end).to.throw()
            expect(function() -- Line: 78 -- upvalues: u42 (upval), createElement (upval), u2 (val)
                local v1 = createElement(u2)
                u42.mountVirtualNode(v1, nil, "Some Key")
            end).to.throw()
            expect(function() -- Line: 82 -- upvalues: u42 (upval), createElement (upval), u3 (val)
                local v1 = createElement(u3)
                u42.mountVirtualNode(v1, nil, "Some Key")
            end).to.throw()
        end)
    end)
    describe("Host components", function() -- Line: 88 -- upvalues: createSpy (val), NoopRenderer (val), assign (val), createReconciler (val), createElement (val), Type (val)
        it("should invoke the renderer to mount host nodes", function() -- Line: 89 -- upvalues: createSpy (upval), NoopRenderer (upval), assign (upval), createReconciler (upval), createElement (upval), Type (upval)
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
        it("should invoke the renderer to update host nodes", function() -- Line: 113 -- upvalues: createSpy (upval), NoopRenderer (upval), assign (upval), createReconciler (upval), createElement (upval), Type (upval)
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
        it("should invoke the renderer to unmount host nodes", function() -- Line: 144 -- upvalues: createSpy (upval), NoopRenderer (upval), assign (upval), createReconciler (upval), createElement (upval), Type (upval)
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
    describe("Function components", function() -- Line: 172 -- upvalues: createSpy (val), createElement (val), u42 (val), Type (val), createFragment (val)
        it("should mount and unmount function components", function() -- Line: 173 -- upvalues: createSpy (upval), createElement (upval), u42 (upval), Type (upval)
            local v1 = createSpy(function(p1) -- Line: 174
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
        it("should mount single children of function components", function() -- Line: 199 -- upvalues: createSpy (upval), createElement (upval), u42 (upval), Type (upval)
            local u2 = createSpy(function(p1) -- Line: 200
                return nil
            end)
            local v1 = createSpy(function(p1) -- Line: 204 -- upvalues: createElement (upval), u2 (val)
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
        it("should mount fragments returned by function components", function() -- Line: 237 -- upvalues: createSpy (upval), createFragment (upval), createElement (upval), u42 (upval), Type (upval)
            local u2 = createSpy(function(p1) -- Line: 238
                return nil
            end)
            local u5 = createSpy(function(p1) -- Line: 242
                return nil
            end)
            local v1 = createSpy(function(p1) -- Line: 246 -- upvalues: createFragment (upval), createElement (upval), u2 (val), u5 (val)
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
    describe("Fragments", function() -- Line: 291 -- upvalues: createFragment (val), u42 (val), ElementKind (val), createSpy (val), createElement (val)
        it("should mount fragments", function() -- Line: 292 -- upvalues: createFragment (upval), u42 (upval), ElementKind (upval)
            local v1 = createFragment({})
            local v2 = u42.mountVirtualNode(v1, nil, "test")
            expect(v2).to.be.ok()
            expect(ElementKind.of(v2.currentElement)).to.equal(ElementKind.Fragment)
        end)
        it("should mount an empty fragment", function() -- Line: 300 -- upvalues: createFragment (upval), u42 (upval)
            local v1 = createFragment({})
            local v2 = u42.mountVirtualNode(v1, nil, "test")
            expect(v2).to.be.ok()
            local v3 = next(v2.children)
            expect(v3).to.never.be.ok()
        end)
        it("should mount all fragment's children", function() -- Line: 310 -- upvalues: createSpy (upval), createElement (upval), createFragment (upval), u42 (upval)
            local v1
            local v2 = createSpy(function(p1) -- Line: 311
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