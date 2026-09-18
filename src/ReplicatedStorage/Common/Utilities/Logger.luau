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
--                    File: ReplicatedStorage.Common.Utilities.Logger
--                              Dumped in 0.000260 seconds
--                          Bytecode version 9  |  8 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local RunService = game:GetService("RunService")
local u21 = not (not (RunService:IsStudio()))
local u22 = warn
local u23 = error
local function log(...) -- Line: 37 -- upvalues: u21 (ref)
    if not u21 then
        return
    end
    print("[Requiem]", ...)
end
local function warn(...) -- Line: 47 -- upvalues: u22 (val)
    u22("[Requiem]", ...)
end
local function error(...) -- Line: 51 -- upvalues: u23 (val)
    u23("[Requiem]", ...)
end
return function(p1) -- Line: 55 -- upvalues: log (val), warn (val), error (val)
    local v1
    if p1 ~= nil then
        v1 = p1
    else
        v1 = true
    end
    if v1 == false then
        return function(...) end, function(...) end, function(...) end
    end
    return log, warn, error
end