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
-- File: ReplicatedStorage.Assets.Objects.Building Tools.Vendor.Roact.PropMarkers.Event
--                              Dumped in 0.000190 seconds
--                          Bytecode version 9  |  3 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Type = require(script.Parent.Parent.Type)
local u17 = {}
local u18 = {
    __tostring = function(p1) -- Line: 28
        return ("RoactHostEvent(%s)"):format(p1.name)
    end,
}
setmetatable(u17, {
    __index = function(p1, p2) -- Line: 34 -- upvalues: Type (val), u18 (val), u17 (val)
        local v1 = {}
        v1[Type] = Type.HostEvent
        v1.name = p2
        setmetatable(v1, u18)
        u17[p2] = v1
        return v1
    end,
})
return u17