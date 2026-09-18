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
--File: ReplicatedStorage.Packages._Index.pysephwasntavailable_roact-constant-fork@1.5.0.roact-constant-fork.Logging
--                              Dumped in 0.000583 seconds
--                          Bytecode version 9  |  8 functions

local u0 = true
local u1 = {}
local u2 = {}
local function indent(p1, p2) -- Line: 24
    local v1 = ("\t"):rep(p2)
    return v1 .. p1:gsub("\n", "\n" .. v1)
end
local function indentLines(p1, p2) -- Line: 34
    local v1
    local v2 = {}
    for i, v in ipairs(p1) do
        v1 = ("\t"):rep(p2)
        table.insert(v2, v1 .. v:gsub("\n", "\n" .. v1))
    end
    return table.concat(v2, "\n")
end
local u5 = {
    __tostring = function(p1) -- Line: 50 -- upvalues: indentLines (val)
        local v1 = {"LogInfo {"}
        local v2 = #p1.errors
        local v3 = #p1.warnings
        local v4 = #p1.infos
        if v2 + v3 + v4 == 0 then
            table.insert(v1, "\t(no messages)")
        end
        if 0 < v2 then
            table.insert(v1, ("\tErrors (%d) {"):format(v2))
            table.insert(v1, indentLines(p1.errors, 2))
            table.insert(v1, "\t}")
        end
        if 0 < v3 then
            table.insert(v1, ("\tWarnings (%d) {"):format(v3))
            table.insert(v1, indentLines(p1.warnings, 2))
            table.insert(v1, "\t}")
        end
        if 0 < v4 then
            table.insert(v1, ("\tInfos (%d) {"):format(v4))
            table.insert(v1, indentLines(p1.infos, 2))
            table.insert(v1, "\t}")
        end
        table.insert(v1, "}")
        return table.concat(v1, "\n")
    end,
}
local function createLogInfo() -- Line: 84 -- upvalues: u5 (val)
    local v1 = {errors = {}, warnings = {}, infos = {}}
    setmetatable(v1, u5)
    return v1
end
local u8 = {
    capture = function(p1) -- Line: 105 -- upvalues: createLogInfo (val), u0 (ref), u1 (val)
        local v1, v2
        local v3 = createLogInfo()
        u0 = false
        u1[v3] = true
        v1, v2 = pcall(p1)
        u1[v3] = nil
        u0 = u0
        assert(v1, v2)
        return v3
    end,
    warn = function(p1, ...) -- Line: 125 -- upvalues: u1 (val), u0 (ref)
        local v1 = p1:format(...)
        for k in pairs(u1) do
            table.insert(k.warnings, v1)
        end
        local v2 = debug.traceback("", 2)
        v2 = v2:sub(2)
        local v3 = ("\t"):rep(1)
        local v4 = ("%s\n%s"):format(v1, v3 .. v2:gsub("\n", "\n" .. v3))
        if u0 then
            warn(v4)
        end
    end,
}
function u8.warnOnce(p1, ...) -- Line: 148 -- upvalues: u2 (val), u8 (val)
    local v1 = debug.traceback()
    if u2[v1] then
        return
    end
    u2[v1] = true
    u8.warn(p1, ...)
end
return u8