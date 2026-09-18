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
--   File: ReplicatedStorage.Common.Effects.Types.Cutscenes.Keyframes.AwakeningSasuke1
--                               Dumped in 0.00109 seconds
--                          Bytecode version 9  |  12 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local Lighting = game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Particles = require(Utilities:WaitForChild("Particles"))
local Screen = require(v1.Parent.Parent.Parent.Parent:WaitForChild("Screen"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Signals = require(Common_2:WaitForChild("Signals"))
local Titans = v1.Parent.Parent.Parent:WaitForChild("Titans")
local Lightning = require(Titans:WaitForChild("Lightning"))
local Shifter = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Particles"):WaitForChild("Titans"):WaitForChild("Shifter")
local u95 = nil
local function onActivateFlashback(p1) -- Line: 40 -- upvalues: u95 (ref), Lighting (val)
    if not u95 then
        u95 = Instance.new("ColorCorrectionEffect")
    end
    u95.Brightness = -0.15
    u95.Contrast = -0.1
    u95.Saturation = -1
    u95.Parent = Lighting
end
local function onDeactivateFlashback() -- Line: 54 -- upvalues: u95 (ref)
    if u95 then
        u95.Brightness = 0
        u95.Contrast = 0
        u95.Saturation = 0
    end
end
local function onShiftLightning(p1) -- Line: 66 -- upvalues: Screen (val), Lightning (val)
    local Torso = p1:WaitForChild("RQ_ShifterAwaken_Sasuke"):WaitForChild("Torso")
    Screen.__removeClientScreenEffect("Shifter")
    Lightning(Torso.Position)
end
local function onEmitShifterCrackle(p1) -- Line: 78 -- upvalues: Shifter (val), Screen (val)
    local v1
    local Lightning = Shifter:WaitForChild("Lightning")
    local Lightning_2 = Lightning:WaitForChild("Lightning")
    for i, j in p1:WaitForChild("RQ_ShifterAwaken_Sasuke"):GetChildren() do
        if j:IsA("BasePart") then
            v1 = Lightning_2:Clone()
            v1.Enabled = true
            v1.Parent = j
        end
    end
    Screen.__createClientScreenEffect({name = "Shifter", enabled = true})
end
local function onUnhideBook(p1) -- Line: 103
    for i, j in p1:WaitForChild("RQ_ShifterAwaken_Past"):WaitForChild("Open Book"):GetChildren() do
        if j:IsA("BasePart") then
            j.Transparency = 0
        end
    end
end
local function onHideFaceOne(p1) -- Line: 118 -- upvalues: Signals (val)
    local v1, v2
    local BillboardGui = p1:WaitForChild("First"):WaitForChild("BillboardGui")
    BillboardGui.Enabled = true
    Signals.Bars:Fire(0.35, -2)
    task.delay(0.5, function() -- Line: 126 -- upvalues: Signals (upval)
        Signals.Captions:Fire("\"You are my final artwork...\"")
    end)
    local v3 = 120
    local v4 = 1
    for i = 1, v3, v4 do
        task.wait(0.06)
        v1 = math.random(-7, 7) / 100
        v2 = math.random(-7, 7) / 1000
        BillboardGui.StudsOffset = Vector3.new(v1, v2, math.random(-7, 7) / 1000)
    end
end
local function onHideFaceTwo(p1) -- Line: 142 -- upvalues: Signals (val)
    local v1, v2
    local BillboardGui = p1:WaitForChild("First"):WaitForChild("BillboardGui")
    local BillboardGui_2 = p1:WaitForChild("Second"):WaitForChild("BillboardGui")
    BillboardGui.Enabled = false
    BillboardGui_2.Enabled = true
    task.delay(2, function() -- Line: 152 -- upvalues: Signals (upval)
        Signals.Captions:Fire("\"Find me in my next life...\"")
    end)
    local v3 = 140
    local v4 = 1
    for i = 1, v3, v4 do
        task.wait(0.06)
        v2 = math.random(-7, 7) / 100
        v1 = math.random(-7, 7) / 1000
        BillboardGui_2.StudsOffset = Vector3.new(v2, v1, math.random(-7, 7) / 1000)
    end
end
local function onHandleEmitKeyframe(p1, p2) -- Line: 169 -- upvalues: Particles (val)
    local v1 = p1:FindFirstChild(p2, true)
    if not v1 then
        return
    end
    Particles.deepEmitParticles(v1, true)
end
return function(p1, p2) -- Line: 182 -- upvalues: onActivateFlashback (val), onDeactivateFlashback (val), onUnhideBook (val), onHideFaceOne (val), onHideFaceTwo (val), onEmitShifterCrackle (val), onShiftLightning (val), Signals (val), onHandleEmitKeyframe (val)
    local v1 = string.split(p1, "_")
    if p1 == "FlashbackStart" then
        onActivateFlashback(p2)
        return
    end
    if p1 == "FlashbackEnd" then
        onDeactivateFlashback()
        return
    end
    if p1 == "UnhideBook" then
        onUnhideBook(p2)
        return
    end
    if p1 == "HideFace1" then
        onHideFaceOne(p2)
        return
    end
    if p1 == "HideFace2" then
        onHideFaceTwo(p2)
        return
    end
    if p1 == "Emit_ShifterCrackle" then
        onEmitShifterCrackle(p2)
        return
    end
    if p1 == "Emit_ShifterLightning" then
        onShiftLightning(p2)
        return
    end
    if p1 == "Ending" then
        Signals.Bars:Fire(1, -2)
        return
    end
    if v1[1] == "Emit" then
        onHandleEmitKeyframe(p2, v1[2])
    end
end