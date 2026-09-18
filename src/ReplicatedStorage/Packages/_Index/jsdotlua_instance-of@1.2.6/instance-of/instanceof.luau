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
--File: ReplicatedStorage.Packages._Index.jsdotlua_instance-of@1.2.6.instance-of.instanceof
--                              Dumped in 0.000295 seconds
--                          Bytecode version 9  |  3 functions

local __DEV__ = _G.__DEV__
return function(p1, p2) -- Line: 6 -- upvalues: __DEV__ (val)
    local v1, v2
    if __DEV__ then
        v2 = typeof(p2) == "table"
        assert(v2, "Received a non-table as the second argument for instanceof")
    end
    if typeof(p1) ~= "table" then
        return false
    end
    v1, v2 = pcall(function() -- Line: 15 -- upvalues: p2 (val), p1 (ref)
        local v1 = if p2.new ~= nil then p1.new == p2.new else false
        return v1
    end)
    if not v1 then
        local __index, u54
        local v3 = {}
        v3[p1] = true
        __index, u54 = p1, p2
        while __index do
            if typeof(__index) ~= "table" then
                break
            end
            __index = getmetatable(__index)
            if typeof(__index) == "table" then
                __index = __index.__index
                if __index == u54 then
                    return true
                end
            end
            if typeof(__index) == "table" then
                if v3[__index] then
                    return false
                end
                v3[__index] = true
            end
        end
        return false
    elseif v2 then
        return true
    end
end