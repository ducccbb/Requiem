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
--     File: ReplicatedStorage.Assets.Objects.Building Tools.Vendor.Roact.createRef
--                              Dumped in 0.000225 seconds
--                          Bytecode version 9  |  5 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Binding = require(script.Parent.Binding)
return function() -- Line: 14 -- upvalues: Binding (val)
    local u3 = Binding.create(nil)
    local v1 = {}
    setmetatable(v1, {
        __index = function(p1, p2) -- Line: 23 -- upvalues: u3 (val)
            if p2 == "current" then
                return u3:getValue()
            end
            return u3[p2]
        end,
        __newindex = function(p1, p2, p3) -- Line: 30 -- upvalues: u3 (val)
            if p2 == "current" then
                error("Cannot assign to the 'current' property of refs", 2)
            end
            u3[p2] = p3
        end,
        __tostring = function(p1) -- Line: 37 -- upvalues: u3 (val)
            return ("RoactRef(%s)"):format((tostring(u3:getValue())))
        end,
    })
    return v1
end