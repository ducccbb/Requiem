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
--File: ReplicatedStorage.Packages._Index.jsdotlua_shared@17.2.1.shared.PropMarkers.Event
--                              Dumped in 0.000179 seconds
--                          Bytecode version 9  |  3 functions

local u8 = require(script.Parent.Parent:WaitForChild("Type.roblox"))
local u9 = {}
local u10 = {
    __tostring = function(p1) -- Line: 35
        return string.format("RoactHostEvent(%s)", p1.name)
    end,
}
setmetatable(u9, {
    __index = function(p1, p2) -- Line: 41 -- upvalues: u8 (val), u10 (val), u9 (val)
        local v1 = {}
        v1[u8] = u8.HostEvent
        v1.name = p2
        setmetatable(v1, u10)
        u9[p2] = v1
        return v1
    end,
})
return u9