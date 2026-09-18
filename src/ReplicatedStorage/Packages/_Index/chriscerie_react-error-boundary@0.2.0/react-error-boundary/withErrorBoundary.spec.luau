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
--File: ReplicatedStorage.Packages._Index.chriscerie_react-error-boundary@0.2.0.react-error-boundary.withErrorBoundary.spec
--                              Dumped in 0.000673 seconds
--                          Bytecode version 9  |  13 functions

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.React)
local ReactRoblox = require(ReplicatedStorage.Packages.ReactRoblox)
local withErrorBoundary = require(script.Parent.withErrorBoundary)
local createElement = React.createElement
local function v1(p1) -- Line: 10
    p1()
    task.wait()
end
return function() -- Line: 15 -- upvalues: ReactRoblox (val), createElement (val), withErrorBoundary (val), React (val)
    describe("ErrorBoundary", function() -- Line: 16 -- upvalues: ReactRoblox (upval), createElement (upval), withErrorBoundary (upval), React (upval)
        local u0 = nil
        local u1 = nil
        local u2 = true
        local u3 = nil
        beforeEach(function() -- Line: 22 -- upvalues: u0 (ref), u1 (ref), ReactRoblox (upval), u2 (ref), u3 (ref)
            u0 = Instance.new("Folder")
            u1 = ReactRoblox.createRoot(u0)
            u2 = false
            u3 = "💥💥💥"
        end)
        local function u7(p1) -- Line: 31 -- upvalues: u2 (ref), u3 (ref), createElement (upval)
            if u2 then
                error(u3)
            end
            local children = p1.children
            if not children then
                children = createElement("Frame", {key = "Content"})
            end
            return children
        end
        local function render() -- Line: 40 -- upvalues: withErrorBoundary (upval), u7 (val), createElement (upval), u1 (ref)
            local u7
            u7 = withErrorBoundary(u7, {fallback = createElement("Frame", {key = "Fallback"})})
            local function v1() -- Line: 47 -- upvalues: u1 (upval), createElement (upval), u7 (val)
                u1:render(createElement(u7))
            end
            u1:render(createElement(u7))
            task.wait()
        end
        it("should render children within the created HOC", function() -- Line: 52 -- upvalues: render (val), u0 (ref)
            render()
            expect(u0:FindFirstChild("Content")).to.be.ok()
        end)
        it("should catch errors with the created HOC", function() -- Line: 57 -- upvalues: u2 (ref), render (val), u0 (ref)
            u2 = true
            render()
            expect(u0:FindFirstChild("Fallback")).to.be.ok()
        end)
        it("should forward refs", function() -- Line: 63 -- upvalues: React (upval), createElement (upval), withErrorBoundary (upval), u1 (ref)
            local v1 = React.forwardRef(function(p1, p2) -- Line: 64 -- upvalues: createElement (upval)
                return createElement("Frame", {key = "Content", ref = p2})
            end)
            local u11 = withErrorBoundary(v1, {fallback = createElement("Frame", {key = "Fallback"})})
            local u14 = React.createRef()
            local function v2() -- Line: 79 -- upvalues: u1 (upval), createElement (upval), u11 (val), u14 (val)
                u1:render(createElement(u11, {ref = u14}))
            end
            u1:render(createElement(u11, {ref = u14}))
            task.wait()
            expect(u14.current).to.be.ok()
        end)
    end)
end