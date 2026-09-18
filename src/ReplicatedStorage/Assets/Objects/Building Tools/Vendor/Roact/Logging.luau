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
--      File: ReplicatedStorage.Assets.Objects.Building Tools.Vendor.Roact.Logging
--                              Dumped in 0.000639 seconds
--                          Bytecode version 9  |  8 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local u12 = true
local u13 = {}
local u14 = {}
local function indent(p1, p2) -- Line: 31
    local v1 = ("\t"):rep(p2)
    return v1 .. p1:gsub("\n", "\n" .. v1)
end
local function indentLines(p1, p2) -- Line: 41 -- upvalues: indent (val)
    local v1 = {}
    for i, v in ipairs(p1) do
        table.insert(v1, indent(v, p2))
    end
    return table.concat(v1, "\n")
end
local u17 = {
    __tostring = function(p1) -- Line: 57 -- upvalues: indentLines (val)
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
local function createLogInfo() -- Line: 91 -- upvalues: u17 (val)
    local v1 = {errors = {}, warnings = {}, infos = {}}
    setmetatable(v1, u17)
    return v1
end
local u20 = {
    capture = function(p1) -- Line: 112 -- upvalues: createLogInfo (val), u12 (ref), u13 (val)
        local v1, v2
        local v3 = createLogInfo()
        u12 = false
        u13[v3] = true
        v1, v2 = pcall(p1)
        u13[v3] = nil
        u12 = u12
        assert(v1, v2)
        return v3
    end,
    warn = function(p1, ...) -- Line: 132 -- upvalues: u13 (val), indent (val), u12 (ref)
        local v1 = p1:format(...)
        for k in pairs(u13) do
            table.insert(k.warnings, v1)
        end
        local v2 = debug.traceback("", 2)
        v2 = v2:sub(2)
        local v3 = ("%s\n%s"):format(v1, indent(v2, 1))
        if u12 then
            warn(v3)
        end
    end,
}
function u20.warnOnce(p1, ...) -- Line: 155 -- upvalues: u14 (val), u20 (val)
    local v1 = debug.traceback()
    if u14[v1] then
        return
    end
    u14[v1] = true
    u20.warn(p1, ...)
end
return u20