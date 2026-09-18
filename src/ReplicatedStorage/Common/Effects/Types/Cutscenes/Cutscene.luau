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
--            File: ReplicatedStorage.Common.Effects.Types.Cutscenes.Cutscene
--                              Dumped in 0.000669 seconds
--                          Bytecode version 9  |  3 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local Cutscenes = game:GetService("ReplicatedStorage"):WaitForChild("Assets"):WaitForChild("Cutscenes")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Moon = require(Utilities:WaitForChild("Moon"))
local u44 = {}
local Keyframes = v1.Parent:WaitForChild("Keyframes")
u44.GlyphShifterReveal = require(Keyframes:WaitForChild("GlyphShifterReveal"))
local Keyframes_2 = v1.Parent:WaitForChild("Keyframes")
u44.BreezyAwakening1 = require(Keyframes_2:WaitForChild("BreezyAwakening1"))
local Keyframes_3 = v1.Parent:WaitForChild("Keyframes")
u44.FemaleEscapeCutscene = require(Keyframes_3:WaitForChild("FemaleEscapeCutscene"))
local Keyframes_4 = v1.Parent:WaitForChild("Keyframes")
u44.UndergroundCityReveal = require(Keyframes_4:WaitForChild("UndergroundCityReveal"))
local Keyframes_5 = v1.Parent:WaitForChild("Keyframes")
u44.OneSecretReveal = require(Keyframes_5:WaitForChild("OneSecretReveal"))
local Keyframes_6 = v1.Parent:WaitForChild("Keyframes")
u44.TwoSecretReveal = require(Keyframes_6:WaitForChild("TwoSecretReveal"))
local Keyframes_7 = v1.Parent:WaitForChild("Keyframes")
u44.ThreeSecretReveal = require(Keyframes_7:WaitForChild("ThreeSecretReveal"))
return function(p1, p2, p3) -- Line: 32 -- upvalues: Cutscenes (val), u44 (val), Moon (val)
    local onLoaded
    local v1 = Cutscenes:FindFirstChild(p1)
    if not v1 then
        return
    end
    if typeof(u44[p1]) ~= "table" then
        onLoaded = nil
    else
        onLoaded = u44[p1].onLoaded
        if not onLoaded then
            onLoaded = nil
        end
    end
    Moon.onRunMoonCutscene(v1, 60, p2, function(a1, ...) -- Line: 41 -- upvalues: u44 (upval), p1 (val)
        if typeof(u44[p1]) ~= "function" then
            if typeof(u44[p1]) == "table" and u44[p1].onKeyframeReached then
                u44[p1].onKeyframeReached(a1, ...)
            end
            return
        end
        local v1 = u44[p1]
        if not v1 then
            return
        end
        v1(a1, ...)
    end, nil, nil, nil, onLoaded, p3)
end