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
--   File: ReplicatedStorage.Packages._Index.jsdotlua_shared@17.2.1.shared.Type.roblox
--                              Dumped in 0.000186 seconds
--                          Bytecode version 9  |  4 functions

local u7 = require(script.Parent:WaitForChild("Symbol.roblox"))
local u10 = newproxy(true)
local u11 = {}
local function addType(p1) -- Line: 32 -- upvalues: u11 (val), u7 (val)
    u11[p1] = u7.named("Roact" .. p1)
end
u11.HostChangeEvent = u7.named("RoactHostChangeEvent")
u11.HostEvent = u7.named("RoactHostEvent")
function u11.of(p1) -- Line: 39 -- upvalues: u10 (val)
    if typeof(p1) ~= "table" then
        return nil
    end
    return p1[u10]
end
getmetatable(u10).__index = u11
local v1 = getmetatable(u10)
function v1.__tostring() -- Line: 49
    return "RoactType"
end
return u10