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
--       File: ReplicatedStorage.Common.Effects.Types.Events.Events.TitaniaReveal
--                              Dumped in 0.000355 seconds
--                          Bytecode version 9  |  2 functions

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
    Sounds.playGlobalSoundEffect(Cutscene.TitaniaReveal, 0.1, 10, 150)
    Signals.Captions:Fire("Trailblazers of Eldia.")
    task.wait(2.8)
    Signals.Captions:Fire("Lay down your arms.")
    task.wait(2.2)
    Signals.Captions:Fire("For we are not your adversaries here...")
    task.wait(3)
    Signals.Captions:Fire("We are merely emissaries of Titania")
    task.wait(3.6)
    Signals.Captions:Fire("A nation that lies far to the west of your island.")
    task.wait(3.4)
    Signals.Captions:Fire("I am Captain Olivier Atticus of the Second Aerial Fleet.")
    task.wait(5)
    Signals.Captions:Fire("For I was dispatched here.")
    task.wait(2.1)
    Signals.Captions:Fire("Wholly to speak and warn you")
    task.wait(3.2)
    Signals.Captions:Fire("Of the lurking threats that are encroaching upon your triad of walls.")
    task.wait(5.2)
    Signals.Captions:Fire("Eldians, our contingent is stationed upon the mountainous hill before you.")
    task.wait(6.2)
    Signals.Captions:Fire("I ask that you refrain from any act of hostility -- ")
    task.wait(4.4)
    Signals.Captions:Fire("It is fruitless, and would serve neither of our interests.")
    task.wait(4.1)
    Signals.Captions:Fire("We have not come here to seek battle or shed needless blood, Eldians.")
    task.wait(5.3)
    Signals.Captions:Fire("Your people are in impending danger.")
    task.wait(3.2)
    Signals.Captions:Fire("If you do not broaden your horizon now, it will be your walls that are laid to a crisp.")
end