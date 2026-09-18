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
--File: ReplicatedStorage.Packages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactFiberErrorLogger
--                              Dumped in 0.000510 seconds
--                          Bytecode version 9  |  4 functions

local v1 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local inspect = v1.util.inspect
local setTimeout = v1.setTimeout
local shared = require(script.Parent.Parent:WaitForChild("shared"))
local console = shared.console
local errorToString = shared.errorToString
require(script.Parent:WaitForChild("ReactInternalTypes"))
require(script.Parent:WaitForChild("ReactCapturedValue"))
local showErrorDialog = require(script.Parent:WaitForChild("ReactFiberErrorDialog")).showErrorDialog
local ClassComponent = require(script.Parent:WaitForChild("ReactWorkTags")).ClassComponent
local getComponentName = require(script.Parent.Parent:WaitForChild("shared")).getComponentName
return {
    logCapturedError = function(p1, p2) -- Line: 32 -- upvalues: showErrorDialog (val), ClassComponent (val), console (val), getComponentName (val), inspect (val), setTimeout (val), errorToString (val)
        local u5, v1
        v1, u5 = pcall(function() -- Line: 33 -- upvalues: showErrorDialog (upval), p1 (val), p2 (val), ClassComponent (upval), console (upval), getComponentName (upval), inspect (upval)
            if showErrorDialog(p1, p2) == false then
                return nil
            end
            local value = p2.value
            if not _G.__DEV__ then
                console.error(inspect(value))
                return nil
            else
                local source = p2.source
                if value == nil then
                    local v1, v2, v3
                    if source == nil then
                        v1 = nil
                    else
                        v1 = getComponentName(source.type)
                    end
                    if not v1 then
                        v2 = "The above error occurred in one of your React components:"
                    else
                        v2 = "The above error occurred in the <" .. tostring(v1) .. "> component:"
                    end
                    local v4 = getComponentName(p1.type)
                    if not v4 then
                        v3 = "Consider adding an error boundary to your tree to customize error handling behavior.\nVisit https://reactjs.org/link/error-boundaries to learn more about error boundaries."
                    else
                        v3 = "React will try to recreate this component tree from scratch " .. "using the error boundary you provided, " .. v4 .. "."
                    end
                    console.error(v2 .. "\n" .. (p2.stack or "") .. "\n\n" .. v3)
                    return nil
                elseif value._suppressLogging then
                    if p1.tag == ClassComponent then
                        return
                    end
                    console.error(value)
                end
            end
        end)
        if not v1 then
            warn("failed to error with error: " .. inspect(u5))
            setTimeout(function() -- Line: 124 -- upvalues: errorToString (upval), u5 (val)
                error(errorToString(u5))
            end)
        end
    end,
}