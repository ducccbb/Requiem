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
--File: ReplicatedStorage.Packages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactFiberComponentStack
--                              Dumped in 0.000642 seconds
--                          Bytecode version 9  |  4 functions

require(script.Parent.Parent:WaitForChild("luau-polyfill"))
require(script.Parent:WaitForChild("ReactInternalTypes"))
local ReactWorkTags = require(script.Parent:WaitForChild("ReactWorkTags"))
local HostComponent = ReactWorkTags.HostComponent
local LazyComponent = ReactWorkTags.LazyComponent
local SuspenseComponent = ReactWorkTags.SuspenseComponent
local SuspenseListComponent = ReactWorkTags.SuspenseListComponent
local FunctionComponent = ReactWorkTags.FunctionComponent
local IndeterminateComponent = ReactWorkTags.IndeterminateComponent
local ForwardRef = ReactWorkTags.ForwardRef
local SimpleMemoComponent = ReactWorkTags.SimpleMemoComponent
local ClassComponent = ReactWorkTags.ClassComponent
local ReactComponentStackFrame = require(script.Parent.Parent:WaitForChild("shared")).ReactComponentStackFrame
local describeBuiltInComponentFrame = ReactComponentStackFrame.describeBuiltInComponentFrame
local describeFunctionComponentFrame = ReactComponentStackFrame.describeFunctionComponentFrame
local describeClassComponentFrame = ReactComponentStackFrame.describeClassComponentFrame
local function describeFiber(p1) -- Line: 37 -- upvalues: HostComponent (val), describeBuiltInComponentFrame (val), LazyComponent (val), SuspenseComponent (val), SuspenseListComponent (val), FunctionComponent (val), IndeterminateComponent (val), SimpleMemoComponent (val), describeFunctionComponentFrame (val), ForwardRef (val), ClassComponent (val), describeClassComponentFrame (val)
    local _debugSource
    local type = nil
    if _G.__DEV__ then
        local _debugOwner = p1._debugOwner
        if _debugOwner then
            type = _debugOwner.type
        end
    end
    _debugSource = if _G.__DEV__ then p1._debugSource else nil
    if p1.tag == HostComponent then
        return describeBuiltInComponentFrame(p1.type, _debugSource, type)
    end
    if p1.tag == LazyComponent then
        return describeBuiltInComponentFrame("Lazy", _debugSource, type)
    end
    if p1.tag == SuspenseComponent then
        return describeBuiltInComponentFrame("Suspense", _debugSource, type)
    end
    if p1.tag == SuspenseListComponent then
        return describeBuiltInComponentFrame("SuspenseList", _debugSource, type)
    end
    if p1.tag == FunctionComponent or p1.tag == IndeterminateComponent or p1.tag == SimpleMemoComponent then
        return describeFunctionComponentFrame(p1.type, _debugSource, type)
    end
    if p1.tag == ForwardRef then
        return describeFunctionComponentFrame(p1.type.render, _debugSource, type)
    end
    if p1.tag == ClassComponent then
        return describeClassComponentFrame(p1.type, _debugSource, type)
    end
    return ""
end
return {
    getStackByFiberInDevAndProd = function(p1) -- Line: 75 -- upvalues: describeFiber (val)
        local v1, v2
        v1, v2 = pcall(function() -- Line: 76 -- upvalues: p1 (val), describeFiber (upval)
            local v1 = ""
            local return_ = p1
            while true do
                v1 = v1 .. describeFiber(return_)
                return_ = return_.return_
                if return_ == nil then
                    break
                end
            end
            return v1
        end)
        if v1 then
            return v2
        end
        if typeof(v2) ~= "table" or not v2.message then
            return "\nError generating stack: " .. tostring(v2)
        end
        if v2.stack then
            return "\nError generating stack: " .. v2.message .. "\n" .. tostring(v2.stack)
        end
        return "\nError generating stack: " .. tostring(v2)
    end,
}