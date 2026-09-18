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
--File: ReplicatedStorage.Packages._Index.chriscerie_react-error-boundary@0.2.0.react-error-boundary.withErrorBoundary
--                              Dumped in 0.000199 seconds
--                          Bytecode version 9  |  3 functions

local React = require(script.Parent.Parent.React)
local Sift = require(script.Parent.Parent.Sift)
local ErrorBoundary = require(script.Parent.ErrorBoundary)
require(script.Parent.types)
return function(p1, p2) -- Line: 18 -- upvalues: React (val), ErrorBoundary (val), Sift (val)
    return (React.forwardRef(function(a1, a2) -- Line: 19 -- upvalues: React (upval), ErrorBoundary (upval), p2 (val), p1 (val), Sift (upval)
    local v1, v2
    v2 = {}
    v1 = {}
    v1.ref = a2
    v2.component = React.createElement(p1, Sift.Dictionary.merge(a1, v1))
    return React.createElement(ErrorBoundary, p2, v2)
end))
end