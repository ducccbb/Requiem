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
--File: ReplicatedStorage.Packages._Index.pepeeltoro41_ui-labs@2.4.2.ui-labs.Controls.DatatypeControls
--                              Dumped in 0.000148 seconds
--                          Bytecode version 9  |  2 functions

local CreateBaseControl = require(script.Parent.Utils).CreateBaseControl
local v1 = {}
function v1.Color3(p1) -- Line: 5 -- upvalues: CreateBaseControl (val)
    local v1 = math.clamp(p1.R, 0, 1)
    local v2 = math.clamp(p1.G, 0, 1)
    local v3 = Color3.new(v1, v2, (math.clamp(p1.B, 0, 1)))
    return CreateBaseControl("Color3", v3)
end
return v1