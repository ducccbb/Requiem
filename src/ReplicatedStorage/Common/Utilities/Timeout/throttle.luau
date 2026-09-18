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
--               File: ReplicatedStorage.Common.Utilities.Timeout.throttle
--                              Dumped in 0.000239 seconds
--                          Bytecode version 9  |  2 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local debounce = require(script.Parent:WaitForChild("debounce"))
return function(p1, p2, p3) -- Line: 40 -- upvalues: debounce (val)
    local v1, v2
    if p2 ~= nil then
        v1 = p2
    else
        v1 = 0
    end
    if p3 ~= nil then
        v2 = p3
    else
        v2 = {}
    end
    local v3 = v2
    local leading = v3.leading
    if leading == nil then
        leading = true
    end
    local trailing = v3.trailing
    if trailing == nil then
        trailing = true
    end
    return debounce(p1, v1, {leading = leading, trailing = trailing, maxWait = v1})
end