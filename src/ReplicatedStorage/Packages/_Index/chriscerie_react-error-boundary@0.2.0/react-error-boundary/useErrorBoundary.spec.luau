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
--File: ReplicatedStorage.Packages._Index.chriscerie_react-error-boundary@0.2.0.react-error-boundary.useErrorBoundary.spec
--                              Dumped in 0.000962 seconds
--                          Bytecode version 9  |  19 functions

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.React)
local ReactRoblox = require(ReplicatedStorage.Packages.ReactRoblox)
local ErrorBoundary = require(script.Parent.ErrorBoundary)
local useErrorBoundary = require(script.Parent.useErrorBoundary)
local createElement = React.createElement
local function v1(p1) -- Line: 10
    p1()
    task.wait()
end
return function() -- Line: 15 -- upvalues: useErrorBoundary (val), createElement (val), ReactRoblox (val), ErrorBoundary (val)
    describe("ErrorBoundary", function() -- Line: 16 -- upvalues: useErrorBoundary (upval), createElement (upval), ReactRoblox (upval), ErrorBoundary (upval)
        local u0 = nil
        local u1 = nil
        beforeEach(function() -- Line: 20 -- upvalues: u0 (ref), u1 (ref)
            u0 = Instance.new("Folder")
            u1 = nil
        end)
        local function render() -- Line: 25 -- upvalues: u1 (ref), useErrorBoundary (upval), createElement (upval), ReactRoblox (upval), u0 (ref), ErrorBoundary (upval)
            local function u0() -- Line: 26 -- upvalues: u1 (upval), useErrorBoundary (upval), createElement (upval)
                u1 = useErrorBoundary()
                return createElement("Frame", {key = "Child"})
            end
            local u4 = ReactRoblox.createRoot(u0)
            ;(function() -- Line: 35 -- upvalues: u4 (val), createElement (upval), ErrorBoundary (upval), u0 (val)
                u4:render(createElement(ErrorBoundary, {fallback = createElement("Frame", {key = "Fallback"})}, {Content = createElement(u0)}))
            end)()
            task.wait()
        end
        it("should activate an error boundary", function() -- Line: 46 -- upvalues: render (val), u0 (ref), u1 (ref)
            render()
            expect(u0:FindFirstChild("Child")).to.be.ok()
            local function v1() -- Line: 50 -- upvalues: u1 (upval)
                assert(u1)
                u1.showBoundary("Error")
            end
            assert(u1)
            u1.showBoundary("Error")
            task.wait()
            expect(u0:FindFirstChild("Fallback")).to.be.ok()
        end)
        it("should reset an active error boundary", function() -- Line: 57 -- upvalues: render (val), u1 (ref), u0 (ref)
            render()
            local function v1() -- Line: 60 -- upvalues: u1 (upval)
                assert(u1)
                u1.showBoundary("Error")
            end
            assert(u1)
            u1.showBoundary("Error")
            task.wait()
            expect(u0:FindFirstChild("Fallback")).to.be.ok()
            function v1() -- Line: 66 -- upvalues: u1 (upval)
                assert(u1)
                u1.resetBoundary()
            end
            assert(u1)
            u1.resetBoundary()
            task.wait()
            expect(u0:FindFirstChild("Child")).to.be.ok()
        end)
        it("should work within a fallback component", function() -- Line: 73 -- upvalues: useErrorBoundary (upval), createElement (upval), ReactRoblox (upval), u0 (ref), ErrorBoundary (upval)
            local u0 = nil
            local u1 = nil
            local function FallbackComponent() -- Line: 77 -- upvalues: u0 (ref), useErrorBoundary (upval), createElement (upval)
                u0 = useErrorBoundary().resetBoundary
                return createElement("Frame", {key = "Fallback"})
            end
            local function u3() -- Line: 84 -- upvalues: u1 (ref), useErrorBoundary (upval), createElement (upval)
                u1 = useErrorBoundary().showBoundary
                return createElement("Frame", {key = "Child"})
            end
            local u7 = ReactRoblox.createRoot(u0)
            ;(function() -- Line: 92 -- upvalues: u7 (val), createElement (upval), ErrorBoundary (upval), FallbackComponent (val), u3 (val)
                u7:render(createElement(ErrorBoundary, {FallbackComponent = FallbackComponent}, {Child = createElement(u3)}))
            end)()
            task.wait()
            expect(u0:FindFirstChild("Child")).to.be.ok()
            local function v1() -- Line: 101 -- upvalues: u1 (ref)
                assert(u1)
                u1("Error")
            end
            assert(u1)
            u1("Error")
            task.wait()
            expect(u0:FindFirstChild("Fallback")).to.be.ok()
            function v1() -- Line: 107 -- upvalues: u0 (ref)
                assert(u0)
                u0()
            end
            assert(u0)
            u0()
            task.wait()
            expect(u0:FindFirstChild("Child")).to.be.ok()
        end)
    end)
end