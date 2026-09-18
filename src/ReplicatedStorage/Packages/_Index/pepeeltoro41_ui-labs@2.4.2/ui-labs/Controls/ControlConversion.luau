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
--File: ReplicatedStorage.Packages._Index.pepeeltoro41_ui-labs@2.4.2.ui-labs.Controls.ControlConversion
--                              Dumped in 0.000258 seconds
--                          Bytecode version 9  |  4 functions

local Primitive = require(script.Parent.PrimitiveControls).Primitive
local DatatypeControls = require(script.Parent.DatatypeControls)
local v1 = {}
local function ConvertPrimitive(p1, p2) -- Line: 6 -- upvalues: Primitive (val)
    local v1 = Primitive[p2]
    assert(v1, (("UI-Labs: Primitive (%*) can't be converted to a control"):format(p2)))
    return v1(p1)
end
local function ConvertDatatype(p1, p2) -- Line: 13 -- upvalues: DatatypeControls (val)
    local v1 = DatatypeControls[p2]
    assert(v1, (("UI-Labs: Datatype (%*) can't be converted to a control"):format(p2)))
    return v1(p1)
end
function v1.ConvertControl(p1) -- Line: 20 -- upvalues: Primitive (val), ConvertPrimitive (val), DatatypeControls (val), ConvertDatatype (val)
    local v1 = typeof(p1)
    if v1 == "table" then
        return p1
    end
    if Primitive[v1] then
        return ConvertPrimitive(p1, v1)
    end
    if DatatypeControls[v1] then
        return ConvertDatatype(p1, v1)
    end
    error((("UI-Labs: Control (%*) is not a valid control"):format(p1)))
end
return v1