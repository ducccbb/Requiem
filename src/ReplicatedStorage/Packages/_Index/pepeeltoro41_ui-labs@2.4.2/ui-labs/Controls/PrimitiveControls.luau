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
--File: ReplicatedStorage.Packages._Index.pepeeltoro41_ui-labs@2.4.2.ui-labs.Controls.PrimitiveControls
--                              Dumped in 0.000229 seconds
--                          Bytecode version 9  |  4 functions

local CreateBaseControl = require(script.Parent.Utils).CreateBaseControl
local v1 = {}
function v1.String(p1, p2) -- Line: 7 -- upvalues: CreateBaseControl (val)
    local v1 = CreateBaseControl("String", p1)
    v1.Filters = p2
    return v1
end
function v1.Number(p1, p2, p3, p4, p5, p6) -- Line: 14 -- upvalues: CreateBaseControl (val)
    local v1
    local v2 = CreateBaseControl("Number", p1)
    v2.Min = p2
    v2.Max = p3
    v2.Step = p4
    if p5 ~= nil then
        v1 = p5
    else
        v1 = true
    end
    v2.Dragger = v1
    v1 = p6
    if not v1 then
        v1 = p1 * 10
    end
    v2.Sensibility = v1
    return v2
end
function v1.Boolean(p1) -- Line: 33 -- upvalues: CreateBaseControl (val)
    return CreateBaseControl("Boolean", p1)
end
v1.Primitive = {string = v1.String, number = v1.Number, boolean = v1.Boolean}
return v1