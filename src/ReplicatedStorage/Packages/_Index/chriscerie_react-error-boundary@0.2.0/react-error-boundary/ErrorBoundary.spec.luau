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
--File: ReplicatedStorage.Packages._Index.chriscerie_react-error-boundary@0.2.0.react-error-boundary.ErrorBoundary.spec
--                               Dumped in 0.00432 seconds
--                          Bytecode version 9  |  48 functions

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.React)
local ReactRoblox = require(ReplicatedStorage.Packages.ReactRoblox)
local Sift = require(ReplicatedStorage.Packages.Sift)
local ErrorBoundary = require(script.Parent.ErrorBoundary)
require(script.Parent.types)
local createElement = React.createElement
local function v1(p1) -- Line: 11
    p1()
    task.wait()
end
return function() -- Line: 16 -- upvalues: ReactRoblox (val), createElement (val), ErrorBoundary (val), React (val), Sift (val)
    describe("ErrorBoundary", function() -- Line: 17 -- upvalues: ReactRoblox (upval), createElement (upval), ErrorBoundary (upval), React (upval), Sift (upval)
        local u0 = nil
        local u1 = nil
        local u2 = true
        local u3 = nil
        local function u4(p1) -- Line: 25 -- upvalues: u2 (ref), u3 (ref)
            if u2 then
                error(u3)
            end
            return p1.children
        end
        beforeEach(function() -- Line: 32 -- upvalues: u0 (ref), u1 (ref), ReactRoblox (upval), u2 (ref), u3 (ref)
            u0 = Instance.new("Folder")
            u1 = ReactRoblox.createRoot(u0)
            u2 = false
            u3 = "💥💥💥"
        end)
        it("should render children", function() -- Line: 39 -- upvalues: u1 (ref), createElement (upval), ErrorBoundary (upval), u0 (ref)
            (function() -- Line: 40 -- upvalues: u1 (upval), createElement (upval), ErrorBoundary (upval)
                u1:render(createElement(ErrorBoundary, {}, {Content = createElement("TextLabel")}))
            end)()
            task.wait()
            expect(u0:FindFirstChild("Content")).to.be.ok()
        end)
        describe("callback props", function() -- Line: 49 -- upvalues: React (upval), u1 (ref), createElement (upval), ErrorBoundary (upval), Sift (upval), u4 (val), u2 (ref)
            local u0 = nil
            beforeEach(function() -- Line: 52 -- upvalues: u0 (ref), React (upval)
                u0 = React.createRef()
            end)
            local function render(p1) -- Line: 56 -- upvalues: u1 (upval), createElement (upval), ErrorBoundary (upval), Sift (upval), u0 (ref), u4 (upval)
                (function() -- Line: 57 -- upvalues: u1 (upval), createElement (upval), ErrorBoundary (upval), Sift (upval), p1 (val), u0 (upval), u4 (upval)
                    local v1 = Sift.Dictionary.merge(p1, {fallback = createElement("TextLabel", {Text = "Error"}), ref = u0})
                    u1:render(createElement(ErrorBoundary, v1, {MaybeThrows = createElement(u4, nil, {Content = createElement("Frame")})}))
                end)()
                task.wait()
            end
            it("should call \"onError\" prop if one is provided", function() -- Line: 75 -- upvalues: u2 (upval), u1 (upval), createElement (upval), ErrorBoundary (upval), Sift (upval), u0 (ref), u4 (upval)
                local u2 = true
                local u1 = 0
                local u3 = {
                    onError = function(p1) -- Line: 81 -- upvalues: u1 (ref), u2 (ref)
                        u1 = u1 + 1
                        u2 = p1
                    end,
                }
                ;(function() -- Line: 57 -- upvalues: u1 (upval), createElement (upval), ErrorBoundary (upval), Sift (upval), u3 (val), u0 (upval), u4 (upval)
                    local v1 = Sift.Dictionary.merge(u3, {fallback = createElement("TextLabel", {Text = "Error"}), ref = u0})
                    u1:render(createElement(ErrorBoundary, v1, {MaybeThrows = createElement(u4, nil, {Content = createElement("Frame")})}))
                end)()
                task.wait()
                expect(u1).to.equal(1)
                expect((nil).message).to.equal("💥💥💥")
            end)
            it("should call \"onReset\" when boundary reset via imperative API", function() -- Line: 91 -- upvalues: u2 (upval), u1 (upval), createElement (upval), ErrorBoundary (upval), Sift (upval), u0 (ref), u4 (upval)
                u2 = true
                local u1 = 0
                local u3 = {
                    onReset = function() -- Line: 95 -- upvalues: u1 (ref)
                        u1 = u1 + 1
                    end,
                }
                ;(function() -- Line: 57 -- upvalues: u1 (upval), createElement (upval), ErrorBoundary (upval), Sift (upval), u3 (val), u0 (upval), u4 (upval)
                    local v1 = Sift.Dictionary.merge(u3, {fallback = createElement("TextLabel", {Text = "Error"}), ref = u0})
                    u1:render(createElement(ErrorBoundary, v1, {MaybeThrows = createElement(u4, nil, {Content = createElement("Frame")})}))
                end)()
                task.wait()
                expect(u1).to.equal(0)
                u0.current.resetErrorBoundary("abc", 123)
                expect(u1).to.equal(1)
            end)
            it("should call \"onReset\" when boundary reset via \"resetKeys\"", function() -- Line: 108 -- upvalues: u2 (upval), u1 (upval), createElement (upval), ErrorBoundary (upval), Sift (upval), u0 (ref), u4 (upval)
                u2 = false
                local u1 = 0
                local function onReset() -- Line: 112 -- upvalues: u1 (ref)
                    u1 = u1 + 1
                end
                local u3 = {
                    onReset = onReset,
                    resetKeys = {1},
                }
                ;(function() -- Line: 57 -- upvalues: u1 (upval), createElement (upval), ErrorBoundary (upval), Sift (upval), u3 (val), u0 (upval), u4 (upval)
                    local v1 = Sift.Dictionary.merge(u3, {fallback = createElement("TextLabel", {Text = "Error"}), ref = u0})
                    u1:render(createElement(ErrorBoundary, v1, {MaybeThrows = createElement(u4, nil, {Content = createElement("Frame")})}))
                end)()
                task.wait()
                expect(u1).to.equal(0)
                local u18 = {
                    onReset = onReset,
                    resetKeys = {2},
                }
                ;(function() -- Line: 57 -- upvalues: u1 (upval), createElement (upval), ErrorBoundary (upval), Sift (upval), u18 (val), u0 (upval), u4 (upval)
                    local v1 = Sift.Dictionary.merge(u18, {fallback = createElement("TextLabel", {Text = "Error"}), ref = u0})
                    u1:render(createElement(ErrorBoundary, v1, {MaybeThrows = createElement(u4, nil, {Content = createElement("Frame")})}))
                end)()
                task.wait()
                expect(u1).to.equal(0)
                u2 = true
                local u34 = {
                    onReset = onReset,
                    resetKeys = {2},
                }
                ;(function() -- Line: 57 -- upvalues: u1 (upval), createElement (upval), ErrorBoundary (upval), Sift (upval), u34 (val), u0 (upval), u4 (upval)
                    local v1 = Sift.Dictionary.merge(u34, {fallback = createElement("TextLabel", {Text = "Error"}), ref = u0})
                    u1:render(createElement(ErrorBoundary, v1, {MaybeThrows = createElement(u4, nil, {Content = createElement("Frame")})}))
                end)()
                task.wait()
                expect(u1).to.equal(0)
                u2 = false
                local u50 = {
                    onReset = onReset,
                    resetKeys = {3},
                }
                ;(function() -- Line: 57 -- upvalues: u1 (upval), createElement (upval), ErrorBoundary (upval), Sift (upval), u50 (val), u0 (upval), u4 (upval)
                    local v1 = Sift.Dictionary.merge(u50, {fallback = createElement("TextLabel", {Text = "Error"}), ref = u0})
                    u1:render(createElement(ErrorBoundary, v1, {MaybeThrows = createElement(u4, nil, {Content = createElement("Frame")})}))
                end)()
                task.wait()
                expect(u1).to.equal(1)
            end)
        end)
        describe("\"fallback\" element", function() -- Line: 147 -- upvalues: u1 (ref), createElement (upval), ErrorBoundary (upval), Sift (upval), u4 (val), u2 (ref), u0 (ref)
            local function render(p1) -- Line: 148 -- upvalues: u1 (upval), createElement (upval), ErrorBoundary (upval), Sift (upval), u4 (upval)
                (function() -- Line: 149 -- upvalues: p1 (ref), u1 (upval), createElement (upval), ErrorBoundary (upval), Sift (upval), u4 (upval)
                    local v1 = p1
                    if not v1 then
                        v1 = {}
                    end
                    p1 = v1
                    local v2 = Sift.Dictionary.merge(p1, {fallback = createElement("TextLabel", {key = "Fallback"})})
                    u1:render(createElement(ErrorBoundary, v2, {MaybeThrows = createElement(u4, nil, {Content = createElement("Frame")})}))
                end)()
                task.wait()
            end
            it("should render fallback in the event of an error", function() -- Line: 167 -- upvalues: u2 (upval), u1 (upval), createElement (upval), ErrorBoundary (upval), Sift (upval), u4 (upval), u0 (upval)
                u2 = true
                local to = nil
                ;(function() -- Line: 149 -- upvalues: to (ref), u1 (upval), createElement (upval), ErrorBoundary (upval), Sift (upval), u4 (upval)
                    local v1 = to
                    if not v1 then
                        v1 = {}
                    end
                    to = v1
                    local v2 = Sift.Dictionary.merge(to, {fallback = createElement("TextLabel", {key = "Fallback"})})
                    u1:render(createElement(ErrorBoundary, v2, {MaybeThrows = createElement(u4, nil, {Content = createElement("Frame")})}))
                end)()
                task.wait()
                to = expect(u0:FindFirstChild("Fallback"))
                to = to.to
                to = to.be
                to = to.ok
                to()
            end)
            it("should re-render children if boundary is reset by reset keys", function() -- Line: 174 -- upvalues: u2 (upval), u1 (upval), createElement (upval), ErrorBoundary (upval), Sift (upval), u4 (upval), u0 (upval)
                u2 = true
                local to = {
                    resetKeys = {1},
                }
                ;(function() -- Line: 149 -- upvalues: to (ref), u1 (upval), createElement (upval), ErrorBoundary (upval), Sift (upval), u4 (upval)
                    local v1 = to
                    if not v1 then
                        v1 = {}
                    end
                    to = v1
                    local v2 = Sift.Dictionary.merge(to, {fallback = createElement("TextLabel", {key = "Fallback"})})
                    u1:render(createElement(ErrorBoundary, v2, {MaybeThrows = createElement(u4, nil, {Content = createElement("Frame")})}))
                end)()
                task.wait()
                to = expect(u0:FindFirstChild("Fallback"))
                to = to.to
                to = to.be
                to = to.ok
                to()
                u2 = false
                to = {
                    resetKeys = {2},
                }
                ;(function() -- Line: 149 -- upvalues: to (ref), u1 (upval), createElement (upval), ErrorBoundary (upval), Sift (upval), u4 (upval)
                    local v1 = to
                    if not v1 then
                        v1 = {}
                    end
                    to = v1
                    local v2 = Sift.Dictionary.merge(to, {fallback = createElement("TextLabel", {key = "Fallback"})})
                    u1:render(createElement(ErrorBoundary, v2, {MaybeThrows = createElement(u4, nil, {Content = createElement("Frame")})}))
                end)()
                task.wait()
                to = expect(u0:FindFirstChild("Content"))
                to = to.to
                to = to.be
                to = to.ok
                to()
            end)
        end)
        describe("\"FallbackComponent\"", function() -- Line: 189 -- upvalues: u1 (ref), createElement (upval), ErrorBoundary (upval), Sift (upval), u4 (val), u2 (ref), u0 (ref)
            local u0 = nil
            local u1 = nil
            local u2 = nil
            local function render(p1) -- Line: 194 -- upvalues: u1 (upval), createElement (upval), ErrorBoundary (upval), Sift (upval), u0 (ref), u4 (upval)
                (function() -- Line: 195 -- upvalues: p1 (ref), u1 (upval), createElement (upval), ErrorBoundary (upval), Sift (upval), u0 (upval), u4 (upval)
                    local v1 = p1
                    if not v1 then
                        v1 = {}
                    end
                    p1 = v1
                    local v2 = Sift.Dictionary.merge(p1, {FallbackComponent = u0})
                    u1:render(createElement(ErrorBoundary, v2, {MaybeThrows = createElement(u4, nil, {Content = createElement("Frame")})}))
                end)()
                task.wait()
            end
            beforeEach(function() -- Line: 213 -- upvalues: u1 (ref), u2 (ref), u0 (ref), createElement (upval)
                u1 = nil
                u2 = nil
                function u0(p1) -- Line: 217 -- upvalues: u1 (upval), u2 (upval), createElement (upval)
                    u1 = p1.error
                    u2 = p1.resetErrorBoundary
                    return createElement("Frame", {key = "Fallback"})
                end
            end)
            it("should render fallback in the event of an error", function() -- Line: 227 -- upvalues: u2 (upval), u1 (upval), createElement (upval), ErrorBoundary (upval), Sift (upval), u0 (ref), u4 (upval), u1 (ref), u0 (upval)
                u2 = true
                local to = nil
                ;(function() -- Line: 195 -- upvalues: to (ref), u1 (upval), createElement (upval), ErrorBoundary (upval), Sift (upval), u0 (upval), u4 (upval)
                    local v1 = to
                    if not v1 then
                        v1 = {}
                    end
                    to = v1
                    local v2 = Sift.Dictionary.merge(to, {FallbackComponent = u0})
                    u1:render(createElement(ErrorBoundary, v2, {MaybeThrows = createElement(u4, nil, {Content = createElement("Frame")})}))
                end)()
                task.wait()
                to = expect(u1.message)
                to = to.to
                to = to.equal
                to("💥💥💥")
                to = expect(u0:FindFirstChild("Fallback"))
                to = to.to
                to = to.be
                to = to.ok
                to()
            end)
            it("should re-render children if boundary is reset via prop", function() -- Line: 234 -- upvalues: u2 (upval), u1 (upval), createElement (upval), ErrorBoundary (upval), Sift (upval), u0 (ref), u4 (upval), u0 (upval), u2 (ref)
                u2 = true
                local to = nil
                ;(function() -- Line: 195 -- upvalues: to (ref), u1 (upval), createElement (upval), ErrorBoundary (upval), Sift (upval), u0 (upval), u4 (upval)
                    local v1 = to
                    if not v1 then
                        v1 = {}
                    end
                    to = v1
                    local v2 = Sift.Dictionary.merge(to, {FallbackComponent = u0})
                    u1:render(createElement(ErrorBoundary, v2, {MaybeThrows = createElement(u4, nil, {Content = createElement("Frame")})}))
                end)()
                task.wait()
                to = expect(u0:FindFirstChild("Fallback"))
                to = to.to
                to = to.be
                to = to.ok
                to()
                to = expect(u2)
                to = to.to
                to = to.be
                to = to.ok
                to()
                function to() -- Line: 241 -- upvalues: u2 (upval), u2 (upval)
                    u2 = false
                    if not u2 then
                        error("lastRenderedResetErrorBoundary is nil")
                    end
                    u2()
                end
                u2 = false
                if not u2 then
                    error("lastRenderedResetErrorBoundary is nil")
                end
                u2()
                task.wait()
                to = expect(u0:FindFirstChild("Content"))
                to = to.to
                to = to.be
                to = to.ok
                to()
            end)
            it("should re-render children if boundary is reset by reset keys", function() -- Line: 252 -- upvalues: u2 (upval), u1 (upval), createElement (upval), ErrorBoundary (upval), Sift (upval), u0 (ref), u4 (upval), u0 (upval)
                u2 = true
                local to = {
                    resetKeys = {1},
                }
                ;(function() -- Line: 195 -- upvalues: to (ref), u1 (upval), createElement (upval), ErrorBoundary (upval), Sift (upval), u0 (upval), u4 (upval)
                    local v1 = to
                    if not v1 then
                        v1 = {}
                    end
                    to = v1
                    local v2 = Sift.Dictionary.merge(to, {FallbackComponent = u0})
                    u1:render(createElement(ErrorBoundary, v2, {MaybeThrows = createElement(u4, nil, {Content = createElement("Frame")})}))
                end)()
                task.wait()
                to = expect(u0:FindFirstChild("Fallback"))
                to = to.to
                to = to.be
                to = to.ok
                to()
                u2 = false
                to = {
                    resetKeys = {2},
                }
                ;(function() -- Line: 195 -- upvalues: to (ref), u1 (upval), createElement (upval), ErrorBoundary (upval), Sift (upval), u0 (upval), u4 (upval)
                    local v1 = to
                    if not v1 then
                        v1 = {}
                    end
                    to = v1
                    local v2 = Sift.Dictionary.merge(to, {FallbackComponent = u0})
                    u1:render(createElement(ErrorBoundary, v2, {MaybeThrows = createElement(u4, nil, {Content = createElement("Frame")})}))
                end)()
                task.wait()
                to = expect(u0:FindFirstChild("Content"))
                to = to.to
                to = to.be
                to = to.ok
                to()
            end)
        end)
        describe("\"fallbackRender\" render prop", function() -- Line: 267 -- upvalues: u1 (ref), createElement (upval), ErrorBoundary (upval), Sift (upval), u4 (val), u2 (ref), u0 (ref)
            local u0 = nil
            local u1 = nil
            local u2 = nil
            local u3 = 0
            local function render(p1) -- Line: 273 -- upvalues: u1 (upval), createElement (upval), ErrorBoundary (upval), Sift (upval), u2 (ref), u4 (upval)
                (function() -- Line: 274 -- upvalues: p1 (ref), u1 (upval), createElement (upval), ErrorBoundary (upval), Sift (upval), u2 (upval), u4 (upval)
                    local v1 = p1
                    if not v1 then
                        v1 = {}
                    end
                    p1 = v1
                    local v2 = Sift.Dictionary.merge(p1, {fallbackRender = u2})
                    u1:render(createElement(ErrorBoundary, v2, {MaybeThrows = createElement(u4, nil, {Content = createElement("Frame")})}))
                end)()
                task.wait()
            end
            beforeEach(function() -- Line: 292 -- upvalues: u0 (ref), u1 (ref), u3 (ref), u2 (ref), createElement (upval)
                u0 = nil
                u1 = nil
                u3 = 0
                function u2(p1) -- Line: 297 -- upvalues: u0 (upval), u1 (upval), u3 (upval), createElement (upval)
                    u0 = p1.error
                    u1 = p1.resetErrorBoundary
                    u3 = u3 + 1
                    return createElement("Frame", {key = "Fallback"})
                end
            end)
            it("should render fallback in the event of an error", function() -- Line: 308 -- upvalues: u2 (upval), u1 (upval), createElement (upval), ErrorBoundary (upval), Sift (upval), u2 (ref), u4 (upval), u0 (ref), u3 (ref), u0 (upval)
                u2 = true
                local to = nil
                ;(function() -- Line: 274 -- upvalues: to (ref), u1 (upval), createElement (upval), ErrorBoundary (upval), Sift (upval), u2 (upval), u4 (upval)
                    local v1 = to
                    if not v1 then
                        v1 = {}
                    end
                    to = v1
                    local v2 = Sift.Dictionary.merge(to, {fallbackRender = u2})
                    u1:render(createElement(ErrorBoundary, v2, {MaybeThrows = createElement(u4, nil, {Content = createElement("Frame")})}))
                end)()
                task.wait()
                to = expect(u0.message)
                to = to.to
                to = to.equal
                to("💥💥💥")
                to = expect(u3)
                to = to.never
                to = to.to
                to = to.equal
                to(0)
                to = expect(u0:FindFirstChild("Fallback"))
                to = to.to
                to = to.be
                to = to.ok
                to()
            end)
            it("should re-render children if boundary is reset via prop", function() -- Line: 316 -- upvalues: u2 (upval), u1 (upval), createElement (upval), ErrorBoundary (upval), Sift (upval), u2 (ref), u4 (upval), u0 (ref), u3 (ref), u0 (upval), u1 (ref)
                u2 = true
                local to = nil
                ;(function() -- Line: 274 -- upvalues: to (ref), u1 (upval), createElement (upval), ErrorBoundary (upval), Sift (upval), u2 (upval), u4 (upval)
                    local v1 = to
                    if not v1 then
                        v1 = {}
                    end
                    to = v1
                    local v2 = Sift.Dictionary.merge(to, {fallbackRender = u2})
                    u1:render(createElement(ErrorBoundary, v2, {MaybeThrows = createElement(u4, nil, {Content = createElement("Frame")})}))
                end)()
                task.wait()
                to = expect(u0.message)
                to = to.to
                to = to.equal
                to("💥💥💥")
                to = expect(u3)
                to = to.never
                to = to.to
                to = to.equal
                to(0)
                to = expect(u0:FindFirstChild("Fallback"))
                to = to.to
                to = to.be
                to = to.ok
                to()
                function to() -- Line: 323 -- upvalues: u2 (upval), u1 (upval)
                    u2 = false
                    if not u1 then
                        error("lastRenderedResetErrorBoundary is nil")
                    end
                    u1()
                end
                u2 = false
                if not u1 then
                    error("lastRenderedResetErrorBoundary is nil")
                end
                u1()
                task.wait()
                to = expect(u0:FindFirstChild("Content"))
                to = to.to
                to = to.be
                to = to.ok
                to()
            end)
            it("should re-render children if boundary is reset reset keys", function() -- Line: 334 -- upvalues: u2 (upval), u1 (upval), createElement (upval), ErrorBoundary (upval), Sift (upval), u2 (ref), u4 (upval), u0 (ref), u3 (ref), u0 (upval)
                u2 = true
                local to = {
                    resetKeys = {1},
                }
                ;(function() -- Line: 274 -- upvalues: to (ref), u1 (upval), createElement (upval), ErrorBoundary (upval), Sift (upval), u2 (upval), u4 (upval)
                    local v1 = to
                    if not v1 then
                        v1 = {}
                    end
                    to = v1
                    local v2 = Sift.Dictionary.merge(to, {fallbackRender = u2})
                    u1:render(createElement(ErrorBoundary, v2, {MaybeThrows = createElement(u4, nil, {Content = createElement("Frame")})}))
                end)()
                task.wait()
                to = expect(u0.message)
                to = to.to
                to = to.equal
                to("💥💥💥")
                to = expect(u3)
                to = to.never
                to = to.to
                to = to.equal
                to(0)
                to = expect(u0:FindFirstChild("Fallback"))
                to = to.to
                to = to.be
                to = to.ok
                to()
                u2 = false
                to = {
                    resetKeys = {2},
                }
                ;(function() -- Line: 274 -- upvalues: to (ref), u1 (upval), createElement (upval), ErrorBoundary (upval), Sift (upval), u2 (upval), u4 (upval)
                    local v1 = to
                    if not v1 then
                        v1 = {}
                    end
                    to = v1
                    local v2 = Sift.Dictionary.merge(to, {fallbackRender = u2})
                    u1:render(createElement(ErrorBoundary, v2, {MaybeThrows = createElement(u4, nil, {Content = createElement("Frame")})}))
                end)()
                task.wait()
                to = expect(u0:FindFirstChild("Content"))
                to = to.to
                to = to.be
                to = to.ok
                to()
            end)
        end)
        describe("thrown value", function() -- Line: 347 -- upvalues: u1 (ref), createElement (upval), ErrorBoundary (upval), u4 (val), u2 (ref), u3 (ref), u0 (ref)
            local u0 = nil
            local u1 = nil
            local u2 = nil
            local u3 = 0
            local function render() -- Line: 353 -- upvalues: u1 (upval), createElement (upval), ErrorBoundary (upval), u1 (ref), u2 (ref), u4 (upval)
                (function() -- Line: 354 -- upvalues: u1 (upval), createElement (upval), ErrorBoundary (upval), u1 (upval), u2 (upval), u4 (upval)
                    u1:render(createElement(ErrorBoundary, {fallbackRender = u1, onError = u2}, {MaybeThrows = createElement(u4, nil, {Content = createElement("Frame")})}))
                end)()
                task.wait()
            end
            beforeEach(function() -- Line: 366 -- upvalues: u0 (ref), u3 (ref), u2 (ref), u1 (ref), createElement (upval)
                u0 = nil
                u3 = 0
                function u2() -- Line: 370 -- upvalues: u3 (upval)
                    u3 = u3 + 1
                end
                function u1(p1) -- Line: 374 -- upvalues: u0 (upval), createElement (upval)
                    u0 = p1.error
                    return createElement("Frame", {key = "Fallback"})
                end
            end)
            it("should support thrown strings", function() -- Line: 383 -- upvalues: u2 (upval), u3 (upval), u1 (upval), createElement (upval), ErrorBoundary (upval), u1 (ref), u2 (ref), u4 (upval), u0 (ref), u3 (ref), u0 (upval)
                u2 = true
                u3 = "String error"
                ;(function() -- Line: 354 -- upvalues: u1 (upval), createElement (upval), ErrorBoundary (upval), u1 (upval), u2 (upval), u4 (upval)
                    u1:render(createElement(ErrorBoundary, {fallbackRender = u1, onError = u2}, {MaybeThrows = createElement(u4, nil, {Content = createElement("Frame")})}))
                end)()
                task.wait()
                expect(u0.message).to.equal("String error")
                expect(u3).to.equal(1)
                expect(u0:FindFirstChild("Fallback")).to.be.ok()
            end)
        end)
    end)
end