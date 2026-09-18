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
--    File: ReplicatedStorage.Common.Effects.Types.Cutscenes.Keyframes.AwakeningRey1
--                              Dumped in 0.000225 seconds
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
local Enchantments = script.Parent.Parent.Parent:WaitForChild("Enchantments")
local v2 = Enchantments:WaitForChild("Wings of Freedom")
local u43 = require(v2:WaitForChild("Wings of Freedom"))
local function onActivateWOF(p1) -- Line: 19 -- upvalues: u43 (val), Signals (val)
    u43(p1.ReyAnimation, true)
    Signals.Bars:Fire(0.35, -2)
end
return function(p1, p2) -- Line: 28 -- upvalues: onActivateWOF (val)
    if p1 == "CommanderAwaken" then
        onActivateWOF(p2)
    end
end