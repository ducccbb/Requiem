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
--File: ReplicatedStorage.Packages._Index.pysephwasntavailable_roact-constant-fork@1.5.0.roact-constant-fork.forwardRef.spec
--                               Dumped in 0.00229 seconds
--                          Bytecode version 9  |  42 functions

return function() -- Line: 4
    local assign = require(script.Parent.assign)
    local createElement = require(script.Parent.createElement)
    local createRef = require(script.Parent.createRef)
    local forwardRef = require(script.Parent.forwardRef)
    local createReconciler = require(script.Parent.createReconciler)
    local Component = require(script.Parent.Component)
    local GlobalConfig = require(script.Parent.GlobalConfig)
    local Ref = require(script.Parent.PropMarkers.Ref)
    local RobloxRenderer = require(script.Parent.RobloxRenderer)
    local u48 = createReconciler(RobloxRenderer)
    it("should update refs when switching between children", function() -- Line: 18 -- upvalues: createElement (val), Ref (val), forwardRef (val), assign (val), createRef (val), u48 (val)
        local v1, v2
        local function FunctionComponent(p1) -- Line: 19 -- upvalues: createElement (upval), Ref (upval)
            local forwardedRef = p1.forwardedRef
            local v1 = nil
            local v2 = nil
            if not p1.setRefOnDiv then
                v2 = forwardedRef
            else
                v1 = forwardedRef
            end
            local v3 = {}
            local v4 = {}
            v4[Ref] = v1
            v3.First = createElement("Frame", v4, {Child = createElement("TextLabel", {Text = "First"})})
            v4 = {}
            v4[Ref] = v2
            v3.Second = createElement("ScrollingFrame", v4, {Child = createElement("TextLabel", {Text = "Second"})})
            return createElement("Frame", nil, v3)
        end
        local v3 = forwardRef(function(p1, p2) -- Line: 48 -- upvalues: createElement (upval), FunctionComponent (val), assign (upval)
            return createElement(FunctionComponent, assign({}, p1, {forwardedRef = p2}))
        end)
        local v4 = createRef()
        local v5 = {}
        v5[Ref] = v4
        v5.setRefOnDiv = true
        v1 = createElement(v3, v5)
        v2 = u48.mountVirtualTree(v1, nil, "switch refs")
        expect(v4.current.ClassName).to.equal("Frame")
        u48.unmountVirtualTree(v2)
        local v6 = {}
        v6[Ref] = v4
        v6.setRefOnDiv = false
        v1 = createElement(v3, v6)
        v2 = u48.mountVirtualTree(v1, nil, "switch refs")
        expect(v4.current.ClassName).to.equal("ScrollingFrame")
        u48.unmountVirtualTree(v2)
    end)
    it("should support rendering nil", function() -- Line: 71 -- upvalues: forwardRef (val), createRef (val), createElement (val), Ref (val), u48 (val)
        local v1 = forwardRef(function(p1, p2) -- Line: 72
            return nil
        end)
        local v2 = createRef()
        local v3 = {}
        v3[Ref] = v2
        local v4 = createElement(v1, v3)
        local v5 = u48.mountVirtualTree(v4, nil, "nil ref")
        expect(v2.current).to.equal(nil)
        u48.unmountVirtualTree(v5)
    end)
    it("should support rendering nil for multiple children", function() -- Line: 84 -- upvalues: forwardRef (val), createRef (val), createElement (val), Ref (val), u48 (val)
        local v1 = forwardRef(function(p1, p2) -- Line: 85
            return nil
        end)
        local v2 = createRef()
        local v3 = {NoRef1 = createElement("Frame")}
        local v4 = {}
        v4[Ref] = v2
        v3.WithRef = createElement(v1, v4)
        v3.NoRef2 = createElement("Frame")
        local v5 = createElement("Frame", nil, v3)
        local v6 = u48.mountVirtualTree(v5, nil, "multiple children nil ref")
        expect(v2.current).to.equal(nil)
        u48.unmountVirtualTree(v6)
    end)
    itSKIP("should support defaultProps", function() -- Line: 103 -- upvalues: createElement (val), Ref (val), forwardRef (val), assign (val), createRef (val), u48 (val)
        local function FunctionComponent(p1) -- Line: 104 -- upvalues: createElement (upval), Ref (upval)
            local v1 = {}
            v1[Ref] = p1.forwardedRef
            return createElement("Frame", v1, {OptionalChild = p1.optional, RequiredChild = p1.required})
        end
        local v1 = forwardRef(function(p1, p2) -- Line: 116 -- upvalues: createElement (upval), FunctionComponent (val), assign (upval)
            return createElement(FunctionComponent, assign({}, p1, {forwardedRef = p2}))
        end)
        v1.defaultProps = {optional = createElement("TextLabel")}
        local v2 = createRef()
        local v3 = {}
        v3[Ref] = v2
        v3.optional = createElement("Frame")
        v3.required = createElement("ScrollingFrame")
        local v4 = createElement(v1, v3)
        local v5 = u48.mountVirtualTree(v4, nil, "with optional")
        expect(v2.current:FindFirstChild("OptionalChild").ClassName).to.equal("Frame")
        expect(v2.current:FindFirstChild("RequiredChild").ClassName).to.equal("ScrollingFrame")
        u48.unmountVirtualTree(v5)
        local v6 = {}
        v6[Ref] = v2
        v6.required = createElement("ScrollingFrame")
        v4 = createElement(v1, v6)
        v5 = u48.mountVirtualTree(v4, nil, "with default")
        expect(v2.current:FindFirstChild("OptionalChild").ClassName).to.equal("TextLabel")
        expect(v2.current:FindFirstChild("RequiredChild").ClassName).to.equal("ScrollingFrame")
        u48.unmountVirtualTree(v5)
    end)
    it("should error if not provided a callback when type checking is enabled", function() -- Line: 153 -- upvalues: GlobalConfig (val), forwardRef (val)
        GlobalConfig.scoped({typeChecks = true}, function() -- Line: 156 -- upvalues: forwardRef (upval)
            expect(function() -- Line: 157 -- upvalues: forwardRef (upval)
                forwardRef(nil)
            end).to.throw()
        end)
        GlobalConfig.scoped({typeChecks = true}, function() -- Line: 164 -- upvalues: forwardRef (upval)
            expect(function() -- Line: 165 -- upvalues: forwardRef (upval)
                forwardRef("foo")
            end).to.throw()
        end)
    end)
    it("should work without a ref to be forwarded", function() -- Line: 171 -- upvalues: createElement (val), assign (val), Ref (val), forwardRef (val), u48 (val)
        local function Child() -- Line: 172
            return nil
        end
        local function Wrapper(p1) -- Line: 176 -- upvalues: createElement (upval), Child (val), assign (upval), Ref (upval)
            local v1 = {}
            v1[Ref] = p1.forwardedRef
            return createElement(Child, assign({}, p1, v1))
        end
        local v1 = forwardRef(function(p1, p2) -- Line: 180 -- upvalues: createElement (upval), Wrapper (val), assign (upval)
            return createElement(Wrapper, assign({}, p1, {forwardedRef = p2}))
        end)
        local v2 = createElement(v1, {value = 123})
        local v3 = u48.mountVirtualTree(v2, nil, "nil ref")
        u48.unmountVirtualTree(v3)
    end)
    it("should forward a ref for a single child", function() -- Line: 189 -- upvalues: createElement (val), Ref (val), assign (val), forwardRef (val), createRef (val), u48 (val)
        local u0, v1, v2
        local function Child(p1) -- Line: 191 -- upvalues: u0 (ref), createElement (upval), Ref (upval)
            u0 = p1.value
            local v1 = {}
            v1[Ref] = p1[Ref]
            return createElement("Frame", v1)
        end
        local function Wrapper(p1) -- Line: 198 -- upvalues: createElement (upval), Child (val), assign (upval), Ref (upval)
            local v1 = {}
            v1[Ref] = p1.forwardedRef
            return createElement(Child, assign({}, p1, v1))
        end
        v1 = forwardRef(function(p1, p2) -- Line: 202 -- upvalues: createElement (upval), Wrapper (val), assign (upval)
            return createElement(Wrapper, assign({}, p1, {forwardedRef = p2}))
        end)
        local v3 = createRef()
        local v4 = {}
        v4[Ref] = v3
        v4.value = 123
        local v5 = createElement(v1, v4)
        v2 = u48.mountVirtualTree(v5, nil, "single child ref")
        expect(nil).to.equal(123)
        expect(v3.current.ClassName).to.equal("Frame")
        u48.unmountVirtualTree(v2)
    end)
    it("should forward a ref for multiple children", function() -- Line: 215 -- upvalues: createElement (val), Ref (val), assign (val), forwardRef (val), createRef (val), u48 (val)
        local v1
        local function Child(p1) -- Line: 216 -- upvalues: createElement (upval), Ref (upval)
            local v1 = {}
            v1[Ref] = p1[Ref]
            return createElement("Frame", v1)
        end
        local function Wrapper(p1) -- Line: 222 -- upvalues: createElement (upval), Child (val), assign (upval), Ref (upval)
            local v1 = {}
            v1[Ref] = p1.forwardedRef
            return createElement(Child, assign({}, p1, v1))
        end
        local v2 = forwardRef(function(p1, p2) -- Line: 226 -- upvalues: createElement (upval), Wrapper (val), assign (upval)
            return createElement(Wrapper, assign({}, p1, {forwardedRef = p2}))
        end)
        v1 = createRef()
        local v3 = {NoRef1 = createElement("Frame")}
        local v4 = {}
        v4[Ref] = v1
        v3.WithRef = createElement(v2, v4)
        v3.NoRef2 = createElement("Frame")
        local v5 = createElement("Frame", nil, v3)
        local v6 = u48.mountVirtualTree(v5, nil, "multi child ref")
        expect(v1.current.ClassName).to.equal("Frame")
        u48.unmountVirtualTree(v6)
    end)
    it("should maintain child instance and ref through updates", function() -- Line: 242 -- upvalues: createElement (val), Ref (val), assign (val), forwardRef (val), u48 (val)
        local u7, v1, v2
        local u0 = nil
        local function Child(p1) -- Line: 244 -- upvalues: u0 (ref), createElement (upval), Ref (upval)
            u0 = p1.value
            local v1 = {}
            v1[Ref] = p1[Ref]
            return createElement("Frame", v1)
        end
        local function Wrapper(p1) -- Line: 251 -- upvalues: createElement (upval), Child (val), assign (upval), Ref (upval)
            local v1 = {}
            v1[Ref] = p1.forwardedRef
            return createElement(Child, assign({}, p1, v1))
        end
        v1 = forwardRef(function(p1, p2) -- Line: 255 -- upvalues: createElement (upval), Wrapper (val), assign (upval)
            return createElement(Wrapper, assign({}, p1, {forwardedRef = p2}))
        end)
        local u6 = 0
        function v2(p1) -- Line: 262 -- upvalues: u6 (ref), u7 (ref)
            u6 = u6 + 1
            u7 = p1
        end
        local v3 = {}
        v3[Ref] = v2
        v3.value = 123
        local v4 = createElement(v1, v3)
        local v5 = u48.mountVirtualTree(v4, nil, "maintains instance")
        expect(u0).to.equal(123)
        expect((nil).ClassName).to.equal("Frame")
        expect(u6).to.equal(1)
        local v6 = {}
        v6[Ref] = v2
        v6.value = 456
        v4 = createElement(v1, v6)
        v5 = u48.updateVirtualTree(v5, v4)
        expect(u0).to.equal(456)
        expect(u6).to.equal(1)
        u48.unmountVirtualTree(v5)
    end)
    it("should not re-run the render callback on a deep setState", function() -- Line: 282 -- upvalues: Component (val), createElement (val), Ref (val), forwardRef (val), assign (val), u48 (val)
        local u0
        local u1 = {}
        local u6 = Component:extend("Inner")
        function u6.render(p1) -- Line: 287 -- upvalues: u1 (ref), u0 (ref), createElement (upval), Ref (upval)
            table.insert(u1, "Inner")
            u0 = p1
            local v1 = {}
            v1[Ref] = p1.props.forwardedRef
            return createElement("Frame", v1)
        end
        local function Middle(p1) -- Line: 293 -- upvalues: u1 (ref), createElement (upval), u6 (val)
            table.insert(u1, "Middle")
            return createElement(u6, p1)
        end
        local u11 = forwardRef(function(p1, p2) -- Line: 298 -- upvalues: u1 (ref), createElement (upval), Middle (val), assign (upval)
            table.insert(u1, "Forward")
            return createElement(Middle, assign({}, p1, {forwardedRef = p2}))
        end)
        local v1 = createElement(function() -- Line: 303 -- upvalues: u1 (ref), createElement (upval), u11 (val)
            table.insert(u1, "App")
            return createElement(u11)
        end)
        local v2 = u48.mountVirtualTree(v1, nil, "deep setState")
        expect(#u1).to.equal(4)
        expect(u1[1]).to.equal("App")
        expect(u1[2]).to.equal("Forward")
        expect(u1[3]).to.equal("Middle")
        expect(u1[4]).to.equal("Inner")
        u1 = {}
        ;(nil):setState({})
        expect(#u1).to.equal(1)
        expect(u1[1]).to.equal("Inner")
        u48.unmountVirtualTree(v2)
    end)
    it("should not include the ref in the forwarded props", function() -- Line: 322 -- upvalues: createElement (val), Ref (val), forwardRef (val), assign (val), createRef (val), u48 (val)
        local v1
        local u0 = nil
        local function CaptureProps(p1) -- Line: 324 -- upvalues: u0 (ref), createElement (upval), Ref (upval)
            u0 = p1
            local v1 = {}
            v1[Ref] = p1.forwardedRef
            return createElement("Frame", v1)
        end
        local v2 = forwardRef(function(p1, p2) -- Line: 329 -- upvalues: createElement (upval), CaptureProps (val), assign (upval)
            return createElement(CaptureProps, assign({}, p1, {forwardedRef = p2}))
        end)
        v1 = createRef()
        local v3 = {}
        v3[Ref] = v1
        local v4 = createElement(v2, v3)
        local v5 = u48.mountVirtualTree(v4, nil, "no ref in props")
        expect(u0).to.be.ok()
        expect(u0.forwardedRef).to.equal(v1)
        expect(u0[Ref]).to.equal(nil)
        u48.unmountVirtualTree(v5)
    end)
end