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
--File: ReplicatedStorage.Packages._Index.chriscerie_react-error-boundary@0.2.0.react-error-boundary.useErrorBoundary
--                              Dumped in 0.000492 seconds
--                          Bytecode version 9  |  5 functions

local React = require(script.Parent.Parent.React)
local ErrorBoundaryContext = require(script.Parent.ErrorBoundaryContext)
local assertErrorBoundaryContext = require(script.Parent.assertErrorBoundaryContext)
return function() -- Line: 69 -- upvalues: assertErrorBoundaryContext (val), React (val), ErrorBoundaryContext (val)
    local u10, v1
    local u5 = assertErrorBoundaryContext(React.useContext(ErrorBoundaryContext))
    v1, u10 = React.useState({hasError = false})
    local v2 = React.useMemo(function() -- Line: 77 -- upvalues: u5 (val), u10 (val)
        return table.freeze({
            resetBoundary = function() -- Line: 79 -- upvalues: u5 (upval), u10 (upval)
                u5.resetErrorBoundary()
                u10({hasError = false})
            end,
            showBoundary = function(p1) -- Line: 83 -- upvalues: u10 (upval)
                u10({hasError = true, error = p1})
            end,
        })
    end, {u5, u5.resetErrorBoundary})
    if v1.hasError then
        error(v1.error)
    end
    return v2
end