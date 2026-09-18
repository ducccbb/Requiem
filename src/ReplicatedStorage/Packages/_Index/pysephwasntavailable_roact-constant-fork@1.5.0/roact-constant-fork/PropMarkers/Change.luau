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
--File: ReplicatedStorage.Packages._Index.pysephwasntavailable_roact-constant-fork@1.5.0.roact-constant-fork.PropMarkers.Change
--                              Dumped in 0.000168 seconds
--                          Bytecode version 9  |  3 functions

local Type = require(script.Parent.Parent.Type)
local u6 = {}
local u7 = {
    __tostring = function(p1) -- Line: 19
        return ("RoactHostChangeEvent(%s)"):format(p1.name)
    end,
}
setmetatable(u6, {
    __index = function(p1, p2) -- Line: 25 -- upvalues: Type (val), u7 (val), u6 (val)
        local v1 = {}
        v1[Type] = Type.HostChangeEvent
        v1.name = p2
        setmetatable(v1, u7)
        u6[p2] = v1
        return v1
    end,
})
return u6