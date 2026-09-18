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
--File: ReplicatedStorage.Packages._Index.pepeeltoro41_ui-labs@2.4.2.ui-labs.Controls.ControlUtils
--                              Dumped in 0.000140 seconds
--                          Bytecode version 9  |  3 functions

local ControlConversion = require(script.Parent.ControlConversion)
return {
    ControlGroup = function(p1) -- Line: 4
        return {EntryType = "ControlGroup", Controls = p1}
    end,
    Ordered = function(p1, p2) -- Line: 12 -- upvalues: ControlConversion (val)
        local v1 = ControlConversion.ConvertControl(p1)
        v1.Order = p2
        return v1
    end,
}