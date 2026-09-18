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
--     File: ReplicatedStorage.Packages._Index.jsdotlua_react@17.2.1.react.ReactLazy
--                              Dumped in 0.000552 seconds
--                          Bytecode version 9  |  11 functions

local console = require(script.Parent.Parent:WaitForChild("shared")).console
local inspect = require(script.Parent.Parent:WaitForChild("luau-polyfill")).util.inspect
require(script.Parent.Parent:WaitForChild("shared"))
local REACT_LAZY_TYPE = require(script.Parent.Parent:WaitForChild("shared")).ReactSymbols.REACT_LAZY_TYPE
function lazyInitializer(p1) -- Line: 71 -- upvalues: console (val), inspect (val)
    if p1._status == -1 then
        local v1 = p1._result()
        p1._status = 0
        p1._result = v1
        v1:andThen(function(a1) -- Line: 79 -- upvalues: p1 (val), console (upval), inspect (upval)
            if p1._status == 0 then
                local default = a1.default
                if _G.__DEV__ and default == nil then
                    console.error("lazy: Expected the result of a dynamic import() call. Instead received: `%s`\n\nYour code should look like: \n  local MyComponent = lazy(function() return reqquire(script.Parent.MyComponent) end)", inspect(a1))
                end
                local v1 = p1
                v1._status = 1
                v1._result = default
            end
        end, function(a1) -- Line: 100 -- upvalues: p1 (val)
            if p1._status == 0 then
                local v1 = p1
                v1._status = 2
                v1._result = a1
            end
        end)
    end
    if p1._status == 1 then
        return p1._result
    end
    error(p1._result)
end
return {
    lazy = function(p1) -- Line: 118 -- upvalues: REACT_LAZY_TYPE (val), console (val)
        local v1 = {}
        v1["$$typeof"] = REACT_LAZY_TYPE
        v1._payload = {_status = -1, _result = p1}
        v1._init = lazyInitializer
        if _G.__DEV__ then
            local u7 = nil
            local u8 = nil
            setmetatable(v1, {
                __index = function(p1, p2) -- Line: 140 -- upvalues: u7 (ref), u8 (ref)
                    if p2 == "defaultProps" then
                        return u7
                    end
                    if p2 == "propTypes" then
                        return u8
                    end
                end,
                __newindex = function(p1, p2, p3) -- Line: 149 -- upvalues: console (upval), u7 (ref), u8 (ref)
                    if p2 == "defaultProps" then
                        console.error("React.lazy(...): It is not supported to assign `defaultProps` to a lazy component import. Either specify them where the component is defined, or create a wrapping component around it.")
                        u7 = p3
                        setmetatable(p1, {
                            __index = function() end,
                            __newindex = function() end,
                        })
                    end
                    if p2 == "propTypes" then
                        console.error("React.lazy(...): It is not supported to assign `propTypes` to a lazy component import. Either specify them where the component is defined, or create a wrapping component around it.")
                        u8 = p3
                        setmetatable(p1, {
                            __index = function() end,
                            __newindex = function() end,
                        })
                    end
                end,
            })
        end
        return v1
    end,
}