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
--  File: ReplicatedStorage.Packages._Index.jsdotlua_react@17.2.1.react.ReactCreateRef
--                              Dumped in 0.000263 seconds
--                          Bytecode version 9  |  5 functions

require(script.Parent.Parent:WaitForChild("shared"))
local u16 = require(script.Parent:WaitForChild("ReactBinding.roblox"))
local v1 = {}
function v1.createRef() -- Line: 24 -- upvalues: u16 (val)
    local u3 = u16.create(nil)
    local v1 = {}
    if _G.__DEV__ then
        u3._source = debug.traceback("Ref created at:", 1)
    end
    setmetatable(v1, {
        __index = function(p1, p2) -- Line: 42 -- upvalues: u3 (val)
            if p2 == "current" then
                return u3:getValue()
            end
            return u3[p2]
        end,
        __newindex = function(p1, p2, p3) -- Line: 49 -- upvalues: u16 (upval), u3 (val)
            if p2 == "current" then
                u16.update(u3, p3)
            end
            u3[p2] = p3
        end,
        __tostring = function(p1) -- Line: 60 -- upvalues: u3 (val)
            return string.format("Ref(%s)", (tostring(u3:getValue())))
        end,
    })
    return v1
end
return v1