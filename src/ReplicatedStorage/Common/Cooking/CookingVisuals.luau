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
--                 File: ReplicatedStorage.Common.Cooking.CookingVisuals
--                              Dumped in 0.000611 seconds
--                          Bytecode version 9  |  6 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local RunService = game:GetService("RunService")
local Observers = script.Parent.Parent:WaitForChild("Observers")
local useAnimatorObserver = require(Observers:WaitForChild("useAnimatorObserver"))
local u33 = Color3.fromRGB(234, 184, 146)
local function getStationAnimationModel(p1) -- Line: 14
    local Animator, v1
    local CookingArea = p1:FindFirstChild("CookingArea", true)
    if not CookingArea or not (CookingArea:IsA("Model")) then
        Animator = p1:FindFirstChildWhichIsA("Animator", true)
        if not Animator then
            return nil
        end
        v1 = Animator:FindFirstAncestorWhichIsA("Model")
        if v1 then
            if v1:IsDescendantOf(p1) then
                return v1
            end
            return nil
        end
        return nil
    end
    local AnimationController = CookingArea:FindFirstChildWhichIsA("AnimationController")
    if not AnimationController then
        Animator = p1:FindFirstChildWhichIsA("Animator", true)
        if not Animator then
            return nil
        end
        v1 = Animator:FindFirstAncestorWhichIsA("Model")
        if v1 then
            if v1:IsDescendantOf(p1) then
                return v1
            end
            return nil
        end
        return nil
    end
    if AnimationController:FindFirstChildWhichIsA("Animator") then
        return CookingArea
    end
    Animator = p1:FindFirstChildWhichIsA("Animator", true)
    if not Animator then
        return nil
    end
    v1 = Animator:FindFirstAncestorWhichIsA("Model")
    if not v1 then
        return nil
    end
    if v1:IsDescendantOf(p1) then
        return v1
    end
    return nil
end
local function resetPotMesh(p1) -- Line: 36 -- upvalues: u33 (val)
    local CookingArea = p1:FindFirstChild("CookingArea")
    if not CookingArea then
        return
    end
    local Rigs = CookingArea:FindFirstChild("Rigs")
    if not Rigs then
        return
    end
    local Pot = Rigs:FindFirstChild("Pot")
    if not Pot then
        return
    end
    local Vegetables = Pot:FindFirstChild("Vegetables")
    if Vegetables then
        for i, j in Vegetables:GetChildren() do
            if j:IsA("BasePart") then
                j.Transparency = 1
            end
        end
    end
    local SoupColor = Pot:FindFirstChild("SoupColor")
    if SoupColor then
        SoupColor.Color = u33
        SoupColor.Transparency = 1
    end
end
local function snapStationRigToRestPose(p1, p2) -- Line: 69 -- upvalues: getStationAnimationModel (val), useAnimatorObserver (val), RunService (val)
    local v1 = getStationAnimationModel(p1)
    if not v1 or typeof(p2) ~= "string" then
        return
    end
    useAnimatorObserver.onStopRigAnimations(v1, 0)
    local u17 = useAnimatorObserver.loadAnimationOnRig(v1, p2)
    u17.Looped = false
    u17:Play(0)
    u17.TimePosition = 0
    local u24 = 3
    local u25 = nil
end
return {
    resetPotMesh = resetPotMesh,
    snapStationRigToRestPose = snapStationRigToRestPose,
    resetCookingStationVisuals = function(p1, p2) -- Line: 98 -- upvalues: resetPotMesh (val), snapStationRigToRestPose (val)
        resetPotMesh(p1)
        snapStationRigToRestPose(p1, p2)
    end,
    getStationAnimationModel = getStationAnimationModel,
}