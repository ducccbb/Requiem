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
-- File: ReplicatedStorage.Assets.Objects.Building Tools.Libraries.Cryo.Dictionary.join
--                              Dumped in 0.000204 seconds
--                          Bytecode version 9  |  2 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local None = require(script.Parent.Parent.None)
return function(...) -- Line: 19 -- upvalues: None (val)
    local v1
    local v2 = {}
    local v3 = select("#", ...)
    local v4 = 1
    for i = 1, v3, v4 do
        v1 = select(i, ...)
        for k, v in pairs(v1) do
            if v ~= None then
                v2[k] = v
            else
                v2[k] = nil
            end
        end
    end
    return v2
end