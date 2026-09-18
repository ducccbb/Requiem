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
--File: ReplicatedStorage.Packages._Index.pysephwasntavailable_roact-constant-fork@1.5.0.roact-constant-fork.PureComponent
--                              Dumped in 0.000170 seconds
--                          Bytecode version 9  |  2 functions

local Component = require(script.Parent.Component)
local v1 = Component:extend("PureComponent")
v1.extend = Component.extend
function v1.shouldUpdate(p1, p2, p3) -- Line: 15
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
return v1