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
--File: ReplicatedStorage.Common.Effects.Types.Cutscenes.Keyframes.UndergroundCityReveal
--                              Dumped in 0.000430 seconds
--                          Bytecode version 9  |  3 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Customization = require(Utilities:WaitForChild("Customization"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Utilities_2 = Common_2:WaitForChild("Utilities")
require(Utilities_2:WaitForChild("State"))("blink")
local u53 = {
    SwapNPC1_Fit2 = {NPC = "NPC1Animation", Outfit = "NPC1AnimationFit2"},
    SwapNPC1_Fit3 = {NPC = "NPC1Animation", Outfit = "NPC1AnimationFit3"},
    SwapNPC1_Fit4 = {NPC = "NPC1Animation", Outfit = "NPC1AnimationFit4"},
    SwapNPC2_Fit2 = {NPC = "NPC2Animation", Outfit = "NPC2AnimationFit2"},
    SwapNPC2_Fit4 = {NPC = "NPC2Animation", Outfit = "NPC2AnimationFit4"},
}
local function onHandleSwapNPC(p1, p2) -- Line: 40 -- upvalues: Customization (val)
    local v1 = p1:FindFirstChild(p2.NPC, true)
    if not v1 then
        return
    end
    local Outfits = p1:FindFirstChild("Outfits")
    local v2 = Outfits
    if v2 then
        v2 = Outfits:FindFirstChild(p2.Outfit)
    end
    if not v2 then
        warn("Outfit not found: " .. p2.Outfit)
        return
    end
    Customization.clearCharacterAccessories(v1)
    Customization.decorateRigCopyingRig(v1, v2)
end
return function(p1, p2) -- Line: 60 -- upvalues: u53 (val), onHandleSwapNPC (val)
    if string.sub(p1, 1, 7) ~= "SwapNPC" then
        return
    end
    local v1 = u53[p1]
    if not v1 then
        return
    end
    onHandleSwapNPC(p2, v1)
end