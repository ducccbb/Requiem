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
--   File: ReplicatedStorage.Packages._Index.pepeeltoro41_ui-labs@2.4.2.ui-labs.Utils
--                              Dumped in 0.000344 seconds
--                          Bytecode version 9  |  4 functions

local u0 = {}
require(script.Parent.Types)
function u0.ListenControl(p1, p2) -- Line: 4
    local __new = p1.__new
    if p1.__old ~= __new then
        p2(__new)
    end
end
function u0.CreateControlStates(p1, p2, p3) -- Line: 13 -- upvalues: u0 (val)
    local v1
    local v2 = {}
    for k, v in pairs(p1) do
        v1 = p2[k]
        if v.EntryType ~= "ControlGroup" then
            v2[k] = p3(v1)
        else
            v2[k] = u0.CreateControlStates(v.Controls, v1, p3)
        end
    end
    return v2
end
function u0.UpdateControlStates(p1, p2, p3, p4) -- Line: 33 -- upvalues: u0 (val)
    local v1
    for k, v in pairs(p2) do
        v1 = p3[k]
        if v.EntryType ~= "ControlGroup" then
            p4(p1[k], v1)
        else
            u0.UpdateControlStates(p1[k], v.Controls, v1, p4)
        end
    end
end
return u0