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
--                        File: ReplicatedStorage.Common.Debugger
--                              Dumped in 0.000442 seconds
--                          Bytecode version 9  |  6 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local u12 = {}
local u13 = {}
local v2 = {}
function v2.useDebugger(p1) -- Line: 47 -- upvalues: u13 (val), u12 (ref)
    local u4 = debug.info(2, "s")
    local u5 = p1 or "GLOBAL"
    if u13[u5] then
        return u13[u5]
    end
    u13[u5] = function(...) -- Line: 57 -- upvalues: u5 (val), u12 (upval), u4 (val)
        local v1
        local v2 = {...}
        local v3 = " "
        for i, v in ipairs(v2) do
            if i ~= #v2 then
                v1 = " "
            else
                v1 = ""
            end
            v3 = v3 .. tostring(v) .. v1
        end
        local v4 = u12[u5]
        if not v4 then
            v4 = {}
        end
        u12[u5] = v4
        v4 = u12[u5][u4]
        if not v4 then
            v4 = {}
        end
        u12[u5][u4] = v4
        table.insert(u12[u5][u4], "[Requiem] [" .. u5 .. "] [" .. os.date("%H:%M:%S") .. "]" .. v3)
    end
    return u13[u5]
end
v2.dump = {
    toConsole = function(p1) -- Line: 32 -- upvalues: u12 (ref)
        for k, v in pairs(u12[p1 or "GLOBAL"]) do
            for i, i2 in ipairs(v) do
                print(i2)
            end
        end
    end,
    allToConsole = function() -- Line: 18 -- upvalues: u12 (ref)
        for k, v in pairs(u12) do
            for k2, i in pairs(v) do
                for i2, j in ipairs(i) do
                    print(j)
                end
            end
        end
    end,
    clear = function() -- Line: 88 -- upvalues: u12 (ref)
        u12 = {}
    end,
}
return v2