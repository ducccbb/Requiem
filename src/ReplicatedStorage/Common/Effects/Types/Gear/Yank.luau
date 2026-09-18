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
--                File: ReplicatedStorage.Common.Effects.Types.Gear.Yank
--                              Dumped in 0.000449 seconds
--                          Bytecode version 9  |  3 functions

local u105
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Signals = require(Common:WaitForChild("Signals"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Animations = Common_2:WaitForChild("Animations")
local Gear = require(Animations:WaitForChild("Gear"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Observers = Common_3:WaitForChild("Observers")
local useAnimatorObserver = require(Observers:WaitForChild("useAnimatorObserver"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_4:WaitForChild("Client")
local Progression = Client:WaitForChild("Progression")
local ClientAttributesHandler = require(Progression:WaitForChild("ClientAttributesHandler"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_5:WaitForChild("Common")
local Statistics = Common_4:WaitForChild("Statistics")
_, u105 = require(Statistics:WaitForChild("useFieldOfView"))()
return function(p1) -- Line: 26 -- upvalues: Signals (val), ClientAttributesHandler (val), u105 (val), useAnimatorObserver (val), Gear (val)
    Signals.Monologue:Fire({"Someone is attempting to pull me back!", "What was that, someone's trying to yank me!"})
    if ClientAttributesHandler.getAttribute("HasSkilledPilot") ~= 1 then
        local u23 = u105("yank", 50, "set", 10, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut))
        task.delay(0.3, function() -- Line: 38 -- upvalues: u23 (val)
            u23(TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut))
        end)
    end
    useAnimatorObserver.play(Gear.Yanked, 0.1)
end