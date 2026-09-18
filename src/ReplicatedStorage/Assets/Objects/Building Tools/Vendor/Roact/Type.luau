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
--        File: ReplicatedStorage.Assets.Objects.Building Tools.Vendor.Roact.Type
--                              Dumped in 0.000245 seconds
--                          Bytecode version 9  |  4 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local Symbol = require(v1.Parent.Symbol)
local strict = require(v1.Parent.strict)
local u22 = newproxy(true)
local u23 = {}
local function addType(p1) -- Line: 26 -- upvalues: u23 (val), Symbol (val)
    u23[p1] = Symbol.named("Roact" .. p1)
end
addType("Binding")
addType("Element")
addType("HostChangeEvent")
addType("HostEvent")
addType("StatefulComponentClass")
addType("StatefulComponentInstance")
addType("VirtualNode")
addType("VirtualTree")
function u23.of(p1) -- Line: 39 -- upvalues: u22 (val)
    if typeof(p1) ~= "table" then
        return nil
    end
    return p1[u22]
end
getmetatable(u22).__index = u23
local v3 = getmetatable(u22)
function v3.__tostring() -- Line: 49
    return "RoactType"
end
strict(u23, "Type")
return u22