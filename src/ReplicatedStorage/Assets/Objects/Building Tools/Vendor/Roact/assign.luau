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
--       File: ReplicatedStorage.Assets.Objects.Building Tools.Vendor.Roact.assign
--                              Dumped in 0.000201 seconds
--                          Bytecode version 9  |  2 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local None = require(script.Parent.None)
return function(p1, ...) -- Line: 16 -- upvalues: None (val)
    local v1
    local v2 = select("#", ...)
    local v3 = 1
    local v4 = p1
    for i = 1, v2, v3 do
        v1 = select(i, ...)
        if v1 ~= nil then
            for k, v in pairs(v1) do
                if v ~= None then
                    v4[k] = v
                else
                    v4[k] = nil
                end
            end
        end
    end
    return v4
end