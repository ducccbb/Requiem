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
-- File: ReplicatedStorage.Common.Effects.Types.Cutscenes.Keyframes.FemaleEscapeCutscene
--                               Dumped in 0.00165 seconds
--                          Bytecode version 9  |  16 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Customization = Common:WaitForChild("Customization")
local Mouths = require(Customization:WaitForChild("Mouths"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Utilities = Common_2:WaitForChild("Utilities")
local Particles = require(Utilities:WaitForChild("Particles"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Utilities_2 = Common_3:WaitForChild("Utilities")
local Table = require(Utilities_2:WaitForChild("Table"))
local u79 = 0
local function findSideChild(p1, p2, p3) -- Line: 35
    if not p3 then
        return p1:FindFirstChild(p2, true)
    end
    local v1 = ("%*%*"):format(p2, p3)
    local v2 = p1:FindFirstChild(v1, true)
    if v2 then
        return v2
    end
    return p1:FindFirstChild(p2, true)
end
local function parseSideFromKeyframe(p1) -- Line: 50
    if string.match(p1, "RightArm$") or string.match(p1, "_Right$") then
        return "Right"
    end
    if string.match(p1, "LeftArm$") or string.match(p1, "_Left$") then
        return "Left"
    end
    return nil
end
local function onHandleEmitKeyframe(p1, p2, p3) -- Line: 68 -- upvalues: findSideChild (val), Particles (val)
    local v1 = findSideChild(p1, p2, p3)
    if not v1 then
        return
    end
    Particles.deepEmitParticles(v1, true)
end
local function onRevealSyringe(p1) -- Line: 81
    local Syringe = p1:FindFirstChild("NPC2Animation"):FindFirstChild("Syringe")
    Syringe.A.Transparency = 0
    Syringe.B.Transparency = 0
    Syringe.C.Transparency = 0.5
    Syringe.SyrineTurnRed.Transparency = 0
end
local function onHideSyringe(p1) -- Line: 95
    local Syringe = p1:FindFirstChild("NPC2Animation"):FindFirstChild("Syringe")
    Syringe.A.Transparency = 1
    Syringe.B.Transparency = 1
    Syringe.C.Transparency = 1
    Syringe.SyrineTurnRed.Transparency = 1
end
local function onRevealNPC3Flintlock(p1) -- Line: 109
    for i, j in p1:FindFirstChild("NPC3Animation"):FindFirstChild("Flintlock").Folder:GetChildren() do
        if j:IsA("BasePart") then
            j.Transparency = 0
        end
    end
end
local function onRevealNPC2Flintlock(p1) -- Line: 124
    for i, j in p1:FindFirstChild("NPC2Animation"):FindFirstChild("Flintlock").Folder:GetChildren() do
        if j:IsA("BasePart") then
            j.Transparency = 0
        end
    end
end
local function onShifterTease(p1) -- Line: 139 -- upvalues: ReplicatedStorage (val), Particles (val)
    local NPC1Animation = p1:FindFirstChild("NPC1Animation")
    local v1 = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Particles"):WaitForChild("Titans"):WaitForChild("Tease"):WaitForChild("Tease"):Clone()
    v1.Parent = NPC1Animation:FindFirstChild("Torso")
    Particles.deepEnableParticles(v1)
end
local function onMouthOpen(p1) -- Line: 157 -- upvalues: u79 (ref), Table (val), Mouths (val)
    local Mouth = p1:FindFirstChild("NPC1Animation"):FindFirstChild("FacePanel"):FindFirstChild("Mouth")
    local u14 = u79 + 1
    u79 = u14
    task.spawn(function() -- Line: 165 -- upvalues: u14 (val), u79 (upval), Table (upval), Mouths (upval), Mouth (val)
        local v1, v2
        while task.wait(0.08) do
            if u14 ~= u79 or u14 ~= u79 then
                break
            end
            v1 = Table.keys(Mouths.Vocabulary)
            v2 = Mouths.Vocabulary[v1[math.random(1, #v1)]]
            Mouth.Texture = v2
        end
    end)
end
local function onMouthLaugh(p1) -- Line: 185 -- upvalues: u79 (ref), Mouths (val)
    local Mouth = p1:FindFirstChild("NPC1Animation"):FindFirstChild("FacePanel"):FindFirstChild("Mouth")
    local u14 = u79 + 1
    u79 = u14
    task.spawn(function() -- Line: 193 -- upvalues: u14 (val), u79 (upval), Mouth (val), Mouths (upval)
        local v1
        local v2 = true
        while task.wait(0.08) do
            if u14 ~= u79 then
                break
            end
            if not v2 then
                v1 = "e"
            else
                v1 = "a"
            end
            v2 = not v2
            Mouth.Texture = Mouths.Vocabulary[v1]
        end
    end)
end
local function onMouthClose(p1) -- Line: 209 -- upvalues: u79 (ref)
    local Mouth = p1:FindFirstChild("NPC1Animation"):FindFirstChild("FacePanel"):FindFirstChild("Mouth")
    Mouth.Texture = "rbxassetid://98514853614135"
    u79 = 0
end
local function onBeginHealing(p1, p2) -- Line: 223 -- upvalues: findSideChild (val), Particles (val), TweenService (val)
    local v1
    local NPC1Animation = p1:FindFirstChild("NPC1Animation", true)
    if not NPC1Animation then
        return
    end
    local v2 = findSideChild(NPC1Animation, "BrokenArm", p2)
    local v3 = findSideChild(NPC1Animation, "HealingArm", p2)
    local v4 = NPC1Animation:FindFirstChild((("%* Arm"):format(p2)))
    if not v2 or not v3 or not v4 then
        return
    end
    local v5 = findSideChild(v3, "rainbow_start", p2)
    local v6 = findSideChild(v3, "heal_ending", p2)
    if not v5 or not v6 then
        return
    end
    local Heal = v3:WaitForChild("Heal")
    local AnimationController = Heal:FindFirstChildWhichIsA("AnimationController")
    local Animator = AnimationController
    if Animator then
        Animator = AnimationController:WaitForChild("Animator")
    end
    if not Animator then
        return
    end
    local Heal_2 = v3:WaitForChild("Heal")
    local v7 = Animator:LoadAnimation((Heal_2:FindFirstChildWhichIsA("Animation")))
    Particles.deepEmitParticles(v5)
    task.wait(0.08)
    v7:Play()
    v4.Size = v4.Size - Vector3.new(0.2, 0.2, 0.2)
    for i, j in v3:WaitForChild("Heal"):GetDescendants() do
        if j:IsA("BasePart") and j.Name ~= "RootPart" then
            v1 = TweenInfo.new(0.25)
            TweenService:Create(j, v1, {Transparency = 0}):Play()
        end
    end
    task.wait(0.55)
    local v8 = TweenInfo.new(0.3)
    TweenService:Create(v4, v8, {Transparency = 0, Size = v4.Size}):Play()
    task.wait(0.3)
    Particles.deepEmitParticles(v6)
    for k, n in v3:WaitForChild("Heal"):GetDescendants() do
        if n:IsA("BasePart") and n.Name ~= "RootPart" then
            v1 = TweenInfo.new(0.15)
            TweenService:Create(n, v1, {Transparency = 1}):Play()
        end
    end
    for m, i5 in v2:GetChildren() do
        if i5:IsA("BasePart") then
            i5.Transparency = 1
        end
    end
end
return function(p1, p2) -- Line: 300 -- upvalues: parseSideFromKeyframe (val), onHandleEmitKeyframe (val), onBeginHealing (val), onRevealSyringe (val), onHideSyringe (val), onRevealNPC3Flintlock (val), onRevealNPC2Flintlock (val), onShifterTease (val), onMouthOpen (val), onMouthLaugh (val), onMouthClose (val)
    local v1 = string.split(p1, "_")
    local v2 = parseSideFromKeyframe(p1)
    if v1[1] == "Emit" then
        local v3 = table.move(v1, 2, #v1, 1, table.create(#v1 - 1))
        if v2 and v3[#v3] == v2 then
            table.remove(v3)
        end
        local v4 = table.concat(v3, "_")
        onHandleEmitKeyframe(p2, v4, v2)
    end
    if p1 == "SteamHealRightArm" then
        onBeginHealing(p2, "Right")
        return
    end
    if p1 == "SteamHealLeftArm" then
        onBeginHealing(p2, "Left")
        return
    end
    if p1 == "SyringeReveal" then
        onRevealSyringe(p2)
        return
    end
    if p1 == "SyringeHide" then
        onHideSyringe(p2)
        return
    end
    if p1 == "NPC3FlintLockReveal" then
        onRevealNPC3Flintlock(p2)
        return
    end
    if p1 == "NPC2FlintlockReveal" then
        onRevealNPC2Flintlock(p2)
        return
    end
    if p1 == "ShifterTease" then
        onShifterTease(p2)
        return
    end
    if p1 == "Shift" then
        onHandleEmitKeyframe(p2, "Shift")
        return
    end
    if p1 == "MouthOpen" or p1 == "MouthOpened" then
        onMouthOpen(p2)
        return
    end
    if p1 == "MouthLaugh" then
        onMouthLaugh(p2)
        return
    end
    if p1 == "MouthClose" or p1 == "MouthClosed" then
        onMouthClose(p2)
        return
    end
    if p1 == "MouthLaughing" then
        onMouthLaugh(p2)
        return
    end
    if v1[1] == "Emit" then
        onHandleEmitKeyframe(p2, v1[2])
    end
end