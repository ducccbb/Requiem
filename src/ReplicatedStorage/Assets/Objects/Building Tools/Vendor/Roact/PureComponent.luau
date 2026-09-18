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
--   File: ReplicatedStorage.Assets.Objects.Building Tools.Vendor.Roact.PureComponent
--                              Dumped in 0.000204 seconds
--                          Bytecode version 9  |  2 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Component = require(script.Parent.Component)
local v2 = Component:extend("PureComponent")
v2.extend = Component.extend
function v2.shouldUpdate(p1, p2, p3) -- Line: 22
    if p3 ~= p1.state then
        return true
    end
    if p2 == p1.props then
        return false
    end
    for k, v in pairs(p2) do
        if p1.props[k] ~= v then
            return true
        end
    end
    for k2, i in pairs(p1.props) do
        if p2[k2] ~= i then
            return true
        end
    end
    return false
end
return v2