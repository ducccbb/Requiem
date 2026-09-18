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
--                 File: ReplicatedStorage.Common.Cooking.CookingSounds
--                              Dumped in 0.000385 seconds
--                          Bytecode version 9  |  3 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local ContentProvider = game:GetService("ContentProvider")
local CookingStation = require(v1.Parent:WaitForChild("CookingStation"))
local Utilities = v1.Parent.Parent:WaitForChild("Utilities")
local Sounds = require(Utilities:WaitForChild("Sounds"))
local Sounds_2 = v1.Parent.Parent:WaitForChild("Sounds")
local Cooking = require(Sounds_2:WaitForChild("Cooking"))
local u48 = false
local function preload() -- Line: 20 -- upvalues: u48 (ref), Cooking (val), ContentProvider (val)
    local Sound
    if u48 then
        return
    end
    local v1 = {}
    local v2 = {}
    local v3 = Cooking
    local v4 = nil
    local v5 = nil
    for i, j in v3, v4, v5 do
        if typeof(j) == "string" and not (v2[j]) then
            v2[j] = true
            Sound = Instance.new("Sound")
            Sound.SoundId = j
            table.insert(v1, Sound)
        end
    end
    if 0 < #v1 then
        ContentProvider:PreloadAsync(v1)
        v3 = v1
        v4 = nil
        v5 = nil
        for k, n in v3, v4, v5 do
            n:Destroy()
        end
    end
    u48 = true
end
return {
    SOUND_RANGE = 100,
    preload = preload,
    playSoundAtStation = function(p1, p2) -- Line: 49 -- upvalues: preload (val), Cooking (val), CookingStation (val), Sounds (val)
        preload()
        local v1 = Cooking[p2]
        if not v1 then
            return
        end
        local v2 = CookingStation.getObservePosition(p1, "CookingAnimation")
        if not v2 then
            return
        end
        Sounds.playRangedSoundEffect(v1, v2, 100, 1, 1)
    end,
}