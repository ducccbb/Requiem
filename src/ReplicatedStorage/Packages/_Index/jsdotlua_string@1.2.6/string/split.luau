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
--      File: ReplicatedStorage.Packages._Index.jsdotlua_string@1.2.6.string.split
--                              Dumped in 0.000556 seconds
--                          Bytecode version 9  |  2 functions

local findOr = require(script.Parent:WaitForChild("findOr"))
local slice = require(script.Parent:WaitForChild("slice"))
require(script.Parent.Parent:WaitForChild("es7-types"))
local MAX_SAFE_INTEGER = require(script.Parent.Parent:WaitForChild("number")).MAX_SAFE_INTEGER
return function(p1, p2, p3) -- Line: 11 -- upvalues: MAX_SAFE_INTEGER (val), findOr (val), slice (val)
    local v1, v2, v3
    if p2 == nil then
        return {p1}
    end
    if p3 == 0 then
        return {}
    end
    if p3 == nil then
        v1 = MAX_SAFE_INTEGER
    elseif p3 >= 0 then
        v1 = p3
    end
    if typeof(p2) ~= "string" then
        local v4, v5, v6
        v2 = p2
        v3 = 1
        local v7 = {}
        local v8 = nil
        v5, v6 = utf8.len(p1)
        local v9 = v5 ~= nil
        assert(v9, ("string `%s` has an invalid byte at position %s"):format(p1, (tostring(v6))))
        local v10 = p1
        while true do
            v4 = findOr(v10, v2, v3)
            if v4 == nil then
                table.insert(v7, slice(v10, v3, nil))
            else
                table.insert(v7, slice(v10, v3, v4.index))
                v9 = utf8.len(v4.match)
                v3 = v4.index + v9
            end
            if v4 ~= nil then
                v8 = v4
            end
            if v4 == nil or v5 < v3 or v1 <= #v7 then
                break
            end
        end
        if v8 ~= nil then
            v4, v9 = utf8.len(v8.match)
            local v11 = v4 ~= nil
            assert(v11, ("string `%s` has an invalid byte at position %s"):format(v8.match, (tostring(v9))))
            local v12 = v8.index + v4
            if v12 == v5 + 1 then
                table.insert(v7, "")
            end
        end
        return v7
    else
        if p2 == "" then
            v3 = {}
            for i in p1:gmatch(".") do
                table.insert(v3, i)
            end
            return v3
        end
        v2 = {p2}
    end
end