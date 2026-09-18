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
--File: ReplicatedStorage.Packages._Index.pepeeltoro41_ui-labs@2.4.2.ui-labs.Controls.AdvancedControls
--                              Dumped in 0.000348 seconds
--                          Bytecode version 9  |  6 functions

local CreateBaseControl = require(script.Parent.Utils).CreateBaseControl
local v1 = {}
function v1.Choose(p1, p2) -- Line: 7 -- upvalues: CreateBaseControl (val)
    if #p1 <= 0 then
        error("UI-Labs: Array given in a Choose control is empty")
    end
    if p2 and #p1 < p2 then
        error((("UI-Labs: Def index (%*) given for the array is outside of the array size (%*)"):format(p2, #p1)))
    end
    local v1 = CreateBaseControl("Choose", p1[p2 or 1])
    v1.List = p1
    v1.DefIndex = p2 or 1
    return v1
end
function v1.EnumList(p1, p2) -- Line: 22 -- upvalues: CreateBaseControl (val)
    if p1[p2] == nil then
        error((("UI-Labs: Key given for the EnumList list (%*) does not exist in the list"):format(p2)))
    end
    local v1 = CreateBaseControl("EnumList", p1[p2])
    v1.List = p1
    v1.DefIndex = p2
    return v1
end
function v1.RGBA(p1, p2) -- Line: 34 -- upvalues: CreateBaseControl (val)
    return CreateBaseControl("RGBA", {Color = p1, Transparency = p2 or 0})
end
function v1.Slider(p1, p2, p3, p4) -- Line: 41 -- upvalues: CreateBaseControl (val)
    if p3 <= p2 then
        error((("UI-Labs: Max slider value (%*) must be greater than the Min value (%*)"):format(p3, p2)))
    end
    local v1 = CreateBaseControl("Slider", p1)
    v1.Min = p2
    v1.Max = p3
    v1.Step = p4
    return v1
end
function v1.Object(p1, p2, p3) -- Line: 56 -- upvalues: CreateBaseControl (val)
    local v1 = CreateBaseControl("Object", p2)
    v1.ClassName = p1 or "Instance"
    v1.Predicator = p3
    return v1
end
return v1