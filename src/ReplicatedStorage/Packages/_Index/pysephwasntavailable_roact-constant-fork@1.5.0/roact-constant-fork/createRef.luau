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
--File: ReplicatedStorage.Packages._Index.pysephwasntavailable_roact-constant-fork@1.5.0.roact-constant-fork.createRef
--                              Dumped in 0.000245 seconds
--                          Bytecode version 9  |  5 functions

local Binding = require(script.Parent.Binding)
return function() -- Line: 7 -- upvalues: Binding (val)
    local u3 = Binding.create(nil)
    local v1 = {}
    setmetatable(v1, {
        __index = function(p1, p2) -- Line: 16 -- upvalues: u3 (val)
            if p2 == "current" then
                return u3:getValue()
            end
            return u3[p2]
        end,
        __newindex = function(p1, p2, p3) -- Line: 23 -- upvalues: u3 (val)
            if p2 == "current" then
                error("Cannot assign to the 'current' property of refs", 2)
            end
            u3[p2] = p3
        end,
        __tostring = function(p1) -- Line: 30 -- upvalues: u3 (val)
            return ("RoactRef(%s)"):format((tostring(u3:getValue())))
        end,
    })
    return v1
end