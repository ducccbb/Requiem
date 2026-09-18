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
--       File: ReplicatedStorage.Common.Effects.Types.Events.Events.MarleyWarning
--                              Dumped in 0.000379 seconds
--                          Bytecode version 9  |  9 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Sounds_2 = Common:WaitForChild("Sounds")
local Cutscene = require(Sounds_2:WaitForChild("Cutscene"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Utilities = Common_2:WaitForChild("Utilities")
local Sounds = require(Utilities:WaitForChild("Sounds"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Signals = require(Common_3:WaitForChild("Signals"))
return function(p1) -- Line: 15 -- upvalues: Sounds (val), Cutscene (val), Signals (val)
    Sounds.playGlobalSoundEffect(Cutscene.MarleyWarning, 0.1, 10, 150)
    Signals.Captions:Fire("Eldians, we have given you countless chances.")
    task.delay(3.9, function() -- Line: 20 -- upvalues: Signals (upval)
        Signals.Captions:Fire("This is the destruction you have wrought upon yourselves.")
    end)
    task.delay(7.3, function() -- Line: 24 -- upvalues: Signals (upval)
        Signals.Captions:Fire("Our people will always, and have always been receptive to speak and negotiate.")
    end)
    task.delay(13, function() -- Line: 28 -- upvalues: Signals (upval)
        Signals.Captions:Fire("Eldians, you do not understand what 'war' truly is...")
    end)
    task.delay(17.8, function() -- Line: 32 -- upvalues: Signals (upval)
        Signals.Captions:Fire("Do not take this as act of 'war'")
    end)
    task.delay(20.4, function() -- Line: 36 -- upvalues: Signals (upval)
        Signals.Captions:Fire("For this is merely an example of negligence from your rulers.")
    end)
    task.delay(25, function() -- Line: 40 -- upvalues: Signals (upval)
        Signals.Captions:Fire("Return the inheritors your rulers have usurped,")
    end)
    task.delay(27.2, function() -- Line: 44 -- upvalues: Signals (upval)
        Signals.Captions:Fire("and we will utilize our powers to reseal your walls.")
    end)
end