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
--File: ReplicatedStorage.Client.Progression.Enchantments.Enchantments.Unique.Calculator
--                              Dumped in 0.000362 seconds
--                          Bytecode version 9  |  3 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Signals = require(Common:WaitForChild("Signals"))
local function debug(p1) end
return {
    requested = function(p1) -- Line: 32 -- upvalues: debug (val), Signals (val)
        local HttpService = game:GetService("HttpService")
        debug((("requested data=%*"):format((HttpService:JSONEncode(p1)))))
        if typeof(p1) ~= "table" then
            debug("requested ignored: data was not a table")
            return
        end
        if p1.reset then
            debug("firing Signals.Calculator reset")
            Signals.Calculator:Fire({reset = true})
            return
        end
        if typeof(p1.total) ~= "number" or 0 >= p1.total then
            debug("requested ignored: no reset flag and no positive total")
            return
        end
        debug((("firing Signals.Calculator total=%*"):format(p1.total)))
        Signals.Calculator:Fire({total = p1.total})
    end,
    settings = {description = "Every point of damage you deal is tallied on your screen. The counter resets five seconds after your last hit.", passive = true, upgradable = false},
}