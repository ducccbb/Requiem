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
--        File: ReplicatedStorage.Common.Effects.Types.Events.Events.FritzSpeech
--                              Dumped in 0.000498 seconds
--                          Bytecode version 9  |  16 functions

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
return function(p1, p2) -- Line: 19 -- upvalues: Sounds (val), Cutscene (val), Signals (val)
    Sounds.playGlobalSoundEffect(Cutscene.FritzSpeech, 0.1, 10, 150)
    Signals.Captions:Fire("RIGHTFUL CHILDREN OF YMIR,")
    task.delay(2.4, function() -- Line: 25 -- upvalues: Signals (upval)
        Signals.Captions:Fire("SUBJECTS OF THE DIVINE SOVEREIGN,")
    end)
    task.delay(4.9, function() -- Line: 29 -- upvalues: Signals (upval)
        Signals.Captions:Fire("AURELIA, WHO BEARS THE SACRED NAMESAKE OF HOUSE FRITZ")
    end)
    task.delay(8.9, function() -- Line: 33 -- upvalues: Signals (upval)
        Signals.Captions:Fire("HAS CALLED UPON THE EMINENT PEOPLE OF EHRMICH TO PAY HEED TO HER WORDS;")
    end)
    task.delay(15.7, function() -- Line: 37 -- upvalues: Signals (upval)
        Signals.Captions:Fire("WAR IS HERE.")
    end)
    task.delay(18.8, function() -- Line: 41 -- upvalues: Signals (upval)
        Signals.Captions:Fire("LIAISONS OF MARLEY HAVE JEOPARDIZED OUR EIGHT-CENTURY")
    end)
    task.delay(23, function() -- Line: 45 -- upvalues: Signals (upval)
        Signals.Captions:Fire("LONG PEACE WITH AN ULTIMATUM TO SUBJUGATE OUR PEOPLE.")
    end)
    task.delay(26.8, function() -- Line: 49 -- upvalues: Signals (upval)
        Signals.Captions:Fire("ELDIA SHALL NOT HEED THE REPREHENSIBLE CALLS OF THIS FOREIGN MENACE,")
    end)
    task.delay(31.8, function() -- Line: 53 -- upvalues: Signals (upval)
        Signals.Captions:Fire("FOR THEIR AGENTS HAVE LAUNCHED COUNTLESS ASSAULTS ON OUR COURAGEOUS LEGIONNAIRES BEYOND THE WALLS")
    end)
    task.delay(37.1, function() -- Line: 59 -- upvalues: Signals (upval)
        Signals.Captions:Fire("AND SEEK TO DESECRATE THE SANCTITY BESTOWED UPON OUR PEOPLE BY SHE,")
    end)
    task.delay(41.5, function() -- Line: 63 -- upvalues: Signals (upval)
        Signals.Captions:Fire("OUR HOLY YMIR.")
    end)
    task.delay(43.6, function() -- Line: 67 -- upvalues: Signals (upval)
        Signals.Captions:Fire("SPREAD THE NEWS; ELDIA HAS ENTERED A NEW AGE.")
    end)
    task.delay(48, function() -- Line: 71 -- upvalues: Signals (upval)
        Signals.Captions:Fire("ENLISTMENT OFFICES WILL BE SET UP THROUGHOUT THE CANTON.")
    end)
    task.delay(51.6, function() -- Line: 75 -- upvalues: Signals (upval)
        Signals.Captions:Fire("DO NOT IGNORE THE CALL,")
    end)
    task.delay(53.6, function() -- Line: 79 -- upvalues: Signals (upval)
        Signals.Captions:Fire("FIGHT FOR OUR SUPREMACY.")
    end)
end