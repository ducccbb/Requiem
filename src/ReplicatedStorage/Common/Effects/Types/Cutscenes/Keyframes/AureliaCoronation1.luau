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
--  File: ReplicatedStorage.Common.Effects.Types.Cutscenes.Keyframes.AureliaCoronation1
--                              Dumped in 0.000390 seconds
--                          Bytecode version 9  |  4 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Lighting = game:GetService("Lighting")
local u17 = nil
local function onActivateFlashback(p1) -- Line: 20 -- upvalues: u17 (ref), Lighting (val)
    if not u17 then
        u17 = Instance.new("ColorCorrectionEffect")
    end
    u17.Saturation = -1
    u17.Parent = Lighting
end
local function onDeactivateFlashback() -- Line: 32 -- upvalues: u17 (ref)
    if u17 then
        u17.Saturation = 0
    end
end
return function(p1, p2) -- Line: 40 -- upvalues: onActivateFlashback (val), onDeactivateFlashback (val)
    if p1 == "FlashbackStart" then
        onActivateFlashback(p2)
        return
    end
    if p1 == "FlashbackEnd" then
        onDeactivateFlashback()
        return
    end
    if p1 == "CrownPast" then
        p2.Requiem_CreateCharacter_King.Crown.Transparency = 1
        p2.Requiem_CreateCharacter_YoungPrincess.Crown.Transparency = 0
        return
    end
    if p1 == "CrownPresent" then
        p2.Requiem_CreateCharacter_Septet.Crown.Transparency = 1
        p2.Requiem_CreateCharacter_Princess.Crown.Transparency = 0
    end
end