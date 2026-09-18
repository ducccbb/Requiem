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
--                    File: ReplicatedStorage.Common.Utilities.Ignite
--                              Dumped in 0.000318 seconds
--                          Bytecode version 9  |  4 functions

local Ignite_2
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Ignite = require(script.Parent.Parent:WaitForChild("Logger"))("Ignite")
function Ignite_2(p1) -- Line: 12 -- upvalues: Ignite (val), Ignite_2 (val)
    local v1, v2, v3
    for i, v in ipairs(p1:GetChildren()) do
        if v:IsA("ModuleScript") then
            local u21 = false
            task.delay(3, function() -- Line: 18 -- upvalues: u21 (ref), Ignite (upval), v (val)
                if not u21 then
                    Ignite.warn(string.format("Require has not resolved after 3s (still pending): %s", v:GetFullName()))
                end
            end)
            v2, v3 = pcall(function() -- Line: 26 -- upvalues: v (val)
                return require(v)
            end)
            v1 = os.clock() - os.clock()
            if not v2 then
                Ignite.warn("Failed to load: " .. v:GetFullName() .. v3)
            end
            if 3 < v1 then
                Ignite.warn(string.format("Slow require (%.2fs): %s", v1, v:GetFullName()))
            end
        end
        Ignite_2(v)
    end
end
return Ignite_2