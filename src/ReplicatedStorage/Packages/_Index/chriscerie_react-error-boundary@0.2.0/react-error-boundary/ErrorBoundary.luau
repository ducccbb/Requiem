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
--File: ReplicatedStorage.Packages._Index.chriscerie_react-error-boundary@0.2.0.react-error-boundary.ErrorBoundary
--                              Dumped in 0.000799 seconds
--                          Bytecode version 9  |  9 functions

local React = require(script.Parent.Parent.React)
local Collections = require(script.Parent.Parent.Collections)
local ErrorBoundaryContext = require(script.Parent.ErrorBoundaryContext)
require(script.Parent.types)
local u24 = table.freeze({didCatch = false})
local u28 = table.freeze({didCatch = false, error = React.None})
local function hasArrayChanged(p1, p2) -- Line: 30 -- upvalues: Collections (val)
    local v1 = p1
    if not v1 then
        v1 = {}
    end
    local v2 = v1
    v1 = p2
    if not v1 then
        v1 = {}
    end
    local u10 = v1
    if not v2 or not u10 then
        return false
    end
    v1 = if #v2 == #u10 then Collections.Array.some(v2, function(p1, p2) -- Line: 36 -- upvalues: Collections (upval), u10 (ref)
    return not Collections.Object.is(p1, u10[p2])
end) else true
    return v1
end
local v1 = React.Component:extend("ErrorBoundary")
function v1.init(p1) -- Line: 113 -- upvalues: u24 (val), u28 (val)
    p1.state = u24
    function p1.resetErrorBoundary(...) -- Line: 116 -- upvalues: p1 (val), u28 (upval)
        local v1 = {...}
        if p1.state.error then
            if p1.props.onReset then
                p1.props.onReset({reason = "imperative-api", args = v1})
            end
            p1:setState(u28)
        end
    end
end
function v1.getDerivedStateFromError(p1) -- Line: 133
    return {didCatch = true, error = p1}
end
function v1.componentDidCatch(p1, p2, p3) -- Line: 140
    if p1.props.onError then
        p1.props.onError(p2, p3)
    end
end
function v1.componentDidUpdate(p1, p2, p3) -- Line: 151 -- upvalues: hasArrayChanged (val), u28 (val)
    local resetKeys = p1.props.resetKeys
    if p1.state.didCatch and p3.error and hasArrayChanged(p2.resetKeys, resetKeys) then
        if p1.props.onReset then
            p1.props.onReset({reason = "keys", next = resetKeys, prev = p2.resetKeys})
        end
        p1:setState(u28)
    end
end
function v1.render(p1) -- Line: 173 -- upvalues: React (val), ErrorBoundaryContext (val)
    local fallbackRender = p1.props.fallbackRender
    local FallbackComponent = p1.props.FallbackComponent
    local fallback = p1.props.fallback
    local didCatch = p1.state.didCatch
    local error = p1.state.error
    local v1 = p1.props.children
    if didCatch then
        local v2 = table.freeze({error = error, resetErrorBoundary = p1.resetErrorBoundary})
        if not fallback then
            if typeof(fallbackRender) == "function" then
                v1 = fallbackRender(v2)
            elseif not FallbackComponent then
                error("react-error-boundary requires either a fallback, fallbackRender, or FallbackComponent prop")
            else
                v1 = React.createElement(FallbackComponent, v2)
            end
        elseif React.isValidElement(fallback) then
            v1 = fallback
        elseif typeof(fallbackRender) == "function" then
            v1 = fallbackRender(v2)
        elseif not FallbackComponent then
            error("react-error-boundary requires either a fallback, fallbackRender, or FallbackComponent prop")
        else
            v1 = React.createElement(FallbackComponent, v2)
        end
    end
    return React.createElement(ErrorBoundaryContext.Provider, {
        value = {didCatch = didCatch, error = error, resetErrorBoundary = p1.resetErrorBoundary},
    }, v1)
end
return v1