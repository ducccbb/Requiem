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
--File: ReplicatedStorage.Packages._Index.jsdotlua_collections@1.2.6.collections.Object.assign
--                              Dumped in 0.000317 seconds
--                          Bytecode version 9  |  2 functions

local None = require(script.Parent:WaitForChild("None"))
require(script.Parent.Parent.Parent:WaitForChild("es7-types"))
return function(p1, p2, p3, p4, ...) -- Line: 13 -- upvalues: None (val)
    local v1
    if p2 ~= nil and typeof(p2) == "table" then
        for k, v in pairs(p2) do
            if v ~= None then
                p1[k] = v
            else
                p1[k] = nil
            end
        end
    end
    if p3 ~= nil and typeof(p3) == "table" then
        for k2, i in pairs(p3) do
            if i ~= None then
                p1[k2] = i
            else
                p1[k2] = nil
            end
        end
    end
    if p4 ~= nil and typeof(p4) == "table" then
        for k3, j in pairs(p4) do
            if j ~= None then
                p1[k3] = j
            else
                p1[k3] = nil
            end
        end
    end
    local v2 = select("#", ...)
    local v3 = 1
    local v4 = p1
    for k4 = 1, v2, v3 do
        v1 = select(k4, ...)
        if v1 ~= nil and typeof(v1) == "table" then
            for k5, n in pairs(v1) do
                if n ~= None then
                    v4[k5] = n
                else
                    v4[k5] = nil
                end
            end
        end
    end
    return v4
end