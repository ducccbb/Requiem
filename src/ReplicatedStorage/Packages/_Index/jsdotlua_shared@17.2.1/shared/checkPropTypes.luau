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
-- File: ReplicatedStorage.Packages._Index.jsdotlua_shared@17.2.1.shared.checkPropTypes
--                              Dumped in 0.000902 seconds
--                          Bytecode version 9  |  4 functions

local Error = require(script.Parent.Parent:WaitForChild("luau-polyfill")).Error
local console = require(script.Parent:WaitForChild("console"))
local u18 = {}
local describeUnknownElementTypeFrameInDEV = require(script.Parent:WaitForChild("ReactComponentStackFrame")).describeUnknownElementTypeFrameInDEV
local ReactSharedInternals = require(script.Parent:WaitForChild("ReactSharedInternals"))
local describeError = require(script.Parent:WaitForChild("ErrorHandling.roblox")).describeError
local ReactDebugCurrentFrame = ReactSharedInternals.ReactDebugCurrentFrame
local function setCurrentlyValidatingElement(p1) -- Line: 32 -- upvalues: describeUnknownElementTypeFrameInDEV (val), ReactDebugCurrentFrame (val)
    local type
    if not _G.__DEV__ then
        return
    end
    if not p1 then
        ReactDebugCurrentFrame.setExtraStackFrame(nil)
        return
    end
    local _owner = p1._owner
    if _owner == nil then
        type = nil
    else
        type = _owner.type
    end
    local v1 = describeUnknownElementTypeFrameInDEV(p1.type, p1._source, type)
    ReactDebugCurrentFrame.setExtraStackFrame(v1)
end
return function(p1, p2, p3, p4, p5, p6) -- Line: 49 -- upvalues: console (val), Error (val), describeError (val), describeUnknownElementTypeFrameInDEV (val), ReactDebugCurrentFrame (val), u18 (val)
    if _G.__DEV__ then
        local v1, v2, v3
        if p1 and p2 then
            console.warn("You've defined both propTypes and validateProps on " .. (p5 or "a component"))
        end
        if p2 then
            if typeof(p2) == "function" then
                v1, v2 = p2(p3)
                if not v1 then
                    v3 = string.format("validateProps failed on a %s type in %s: %s", p4, p5 or "<UNKNOWN Component>", (tostring(v2 or "<Validator function did not supply a message>")))
                    error(v3)
                end
            else
                local v4 = typeof(p2)
                console.error(("validateProps must be a function, but it is a %s.\nCheck the definition of the component %q."):format(v4, p5 or ""))
            end
        end
        if p1 then
            local _owner, _owner_2, type, type_2, u187, u207, u215, u222, v5, v6, v7, v8
            v2 = typeof(p1) == "table"
            assert(v2, "propTypes needs to be a table")
            v1 = p1
            v2 = nil
            v3 = nil
            u207, u222, u187, u215 = p1, p5, p4, p3
            for i, j in v1, v2, v3 do
                _, v5 = xpcall(function() -- Line: 113 -- upvalues: u207 (val), i (val), Error (upval), u222 (val), u187 (val), u215 (val)
                    if typeof(u207[i]) ~= "function" then
                        local v1 = Error.new((u222 or "React class") .. ": " .. u187 .. " type `" .. i .. "` is invalid; " .. "it must be a function, usually from the `prop-types` package, but received `" .. typeof(u207[i]) .. "`.This often happens because of typos such as `PropTypes.function` instead of `PropTypes.func`.")
                        v1.name = "Invariant Violation"
                        error(v1)
                    end
                    return u207[i](u215, i, u222, u187, nil, "SECRET_DO_NOT_PASS_THIS_OR_YOU_WILL_BE_FIRED")
                end, describeError)
                v6 = typeof(v5) == "table"
                if v5 ~= nil and not v6 then
                    if _G.__DEV__ then
                        if not v8 then
                            ReactDebugCurrentFrame.setExtraStackFrame(nil)
                        else
                            _owner = v8._owner
                            if _owner == nil then
                                type = nil
                            else
                                type = _owner.type
                            end
                            v7 = describeUnknownElementTypeFrameInDEV(v8.type, v8._source, type)
                            ReactDebugCurrentFrame.setExtraStackFrame(v7)
                        end
                    end
                    console.error(string.format("%s: type specification of %s `%s` is invalid; the type checker function must return `nil` or an `Error` but returned a %s. You may have forgotten to pass an argument to the type checker creator (arrayOf, instanceOf, objectOf, oneOf, oneOfType, and shape all require an argument).", u222 or "React class", u187, i, (typeof(v5))))
                    if _G.__DEV__ then
                        ReactDebugCurrentFrame.setExtraStackFrame(nil)
                    end
                end
                if v6 and u18[v5.message] == nil then
                    v7 = tostring(v5.message)
                    u18[v7] = true
                    if _G.__DEV__ then
                        if not v8 then
                            ReactDebugCurrentFrame.setExtraStackFrame(nil)
                        else
                            _owner_2 = v8._owner
                            if _owner_2 == nil then
                                type_2 = nil
                            else
                                type_2 = _owner_2.type
                            end
                            v7 = describeUnknownElementTypeFrameInDEV(v8.type, v8._source, type_2)
                            ReactDebugCurrentFrame.setExtraStackFrame(v7)
                        end
                    end
                    console.warn(string.format("Failed %s type: %s", u187, (tostring(v5.message))))
                    if _G.__DEV__ then
                        ReactDebugCurrentFrame.setExtraStackFrame(nil)
                    end
                end
            end
        end
    elseif not _G.__DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ then
    end
end