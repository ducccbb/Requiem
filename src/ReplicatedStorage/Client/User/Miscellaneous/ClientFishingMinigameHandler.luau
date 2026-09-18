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
--    File: ReplicatedStorage.Client.User.Miscellaneous.ClientFishingMinigameHandler
--                              Dumped in 0.000261 seconds
--                          Bytecode version 9  |  4 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Signal = require(Utilities:WaitForChild("Signal"))
local u31 = {active = false, onStart = Signal.new(), onAbort = Signal.new(), onResult = Signal.new()}
function u31.start() -- Line: 40 -- upvalues: u31 (val)
    if u31.active then
        return false
    end
    u31.active = true
    u31.onStart:Fire()
    return true
end
function u31.finish(p1) -- Line: 54 -- upvalues: u31 (val)
    if not u31.active then
        return
    end
    u31.active = false
    u31.onResult:Fire(p1)
end
function u31.abort() -- Line: 66 -- upvalues: u31 (val)
    if not u31.active then
        return
    end
    u31.active = false
    u31.onAbort:Fire()
end
return u31