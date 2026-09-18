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
--             File: ReplicatedStorage.Client.World.Weather.WorldWindClient
--                               Dumped in 0.00136 seconds
--                          Bytecode version 9  |  16 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Character = require(Utilities:WaitForChild("Character"))
local User = script.Parent.Parent.Parent:WaitForChild("User")
local State = User:WaitForChild("State")
local ClientSettingsHandler = require(State:WaitForChild("ClientSettingsHandler"))
local u53 = {}
local u54 = {}
local u55 = false
local u56 = nil
local u57 = nil
local u58 = nil
local u59 = true
local function randomRange(p1, p2) -- Line: 67
    return p1 + (p2 - p1) * math.random()
end
local function getPooledPart() -- Line: 75 -- upvalues: u54 (val)
    local v1 = table.remove(u54)
    if v1 then
        v1.Parent = workspace
        return v1
    end
    local Part = Instance.new("Part")
    Part.Name = "WindParticle"
    Part.Anchored = true
    Part.CanCollide = false
    Part.CanQuery = false
    Part.CanTouch = false
    Part.Massless = true
    Part.Material = Enum.Material.Neon
    Part.Color = Color3.fromRGB(230, 240, 255)
    Part.Transparency = 0.95
    Part.Parent = workspace
    return Part
end
local function returnPartToPool(p1) -- Line: 102 -- upvalues: u54 (val)
    p1.Parent = nil
    table.insert(u54, p1)
end
local function clearParticle(p1) -- Line: 112 -- upvalues: u53 (val), returnPartToPool (val)
    local v1 = u53[p1]
    if not v1 then
        return
    end
    returnPartToPool(v1.part)
    table.remove(u53, p1)
end
local function clearAllParticles() -- Line: 126 -- upvalues: u53 (val), clearParticle (val)
    local v1 = 1
    local v2 = -1
    for i = #u53, v1, v2 do
        clearParticle(i)
    end
end
local function updateWindParticlesEnabledState() -- Line: 136 -- upvalues: ClientSettingsHandler (val), u59 (ref)
    local v1 = ClientSettingsHandler.getSettingFromName("Show Wind Particles")
    if typeof(v1) == "boolean" then
        u59 = v1
        return
    end
    u59 = true
end
local function getHumanoidRootPart() -- Line: 152 -- upvalues: Character (val)
    local v1 = Character.getCharacter()
    if not v1 then
        return nil
    end
    return (v1:FindFirstChild("HumanoidRootPart"))
end
local function getLayeredSpawnWorldPosition(p1) -- Line: 166 -- upvalues: randomRange (val)
    local v1 = math.random(1, 3)
    local v2 = randomRange(0, math.pi * 2)
    local v3 = 17 + (v1 - 1) * 2.5 + randomRange(-0.6, 0.6)
    local v4 = p1.CFrame.Position + p1.CFrame.LookVector * 15
    local v5 = p1.CFrame.RightVector * math.cos(v2) * v3
    return v4 + (v5 + p1.CFrame.UpVector * math.sin(v2) * v3 * 1.5)
end
local function getMovementDirection(p1, p2, p3) -- Line: 188 -- upvalues: u58 (ref)
    local Unit
    local AssemblyLinearVelocity = p1.AssemblyLinearVelocity
    if 0.05 >= AssemblyLinearVelocity.Magnitude then
        Unit = p2.CFrame.LookVector
    else
        Unit = AssemblyLinearVelocity.Unit
        if not Unit then
            Unit = p2.CFrame.LookVector
        end
    end
    if not u58 then
        u58 = Unit
        return Unit
    end
    local v1 = math.clamp(p3 * 12, 0, 1)
    local v2 = u58:Lerp(Unit, v1)
    if v2.Magnitude <= 0.05 then
        u58 = Unit
        return Unit
    end
    u58 = v2.Unit
    return u58
end
local function onStepParticle(p1, p2, p3) -- Line: 218
    p1.elapsed = p1.elapsed + p2
    if p1.lifetime <= p1.elapsed then
        return false
    end
    p1.localPosition = p1.localPosition + p3.CFrame:VectorToObjectSpace(p1.backwardDirection * p1.speed * p2)
    local v1 = p3.CFrame:PointToWorldSpace(p1.localPosition)
    local backwardDirection = p1.backwardDirection
    if backwardDirection.Magnitude < 0.05 then
        backwardDirection = p3.CFrame.LookVector
    end
    p1.part.CFrame = CFrame.lookAt(v1, v1 + backwardDirection)
    return true
end
local function onSpawnParticle(p1, p2) -- Line: 245 -- upvalues: getPooledPart (val), randomRange (val), getLayeredSpawnWorldPosition (val), u53 (val)
    local v1 = getPooledPart()
    v1.Size = Vector3.new(0.15, 0.15, randomRange(1.5, 3))
    local v2 = -p2
    local v3 = getLayeredSpawnWorldPosition(p1)
    local v4 = p1.CFrame:PointToObjectSpace(v3)
    local LookVector = v2
    if LookVector.Magnitude < 0.05 then
        LookVector = p1.CFrame.LookVector
    end
    v1.CFrame = CFrame.lookAt(v3, v3 + LookVector)
    table.insert(u53, {
        elapsed = 0,
        part = v1,
        localPosition = v4,
        backwardDirection = v2,
        lifetime = randomRange(0.1, 0.2),
        speed = randomRange(55, 70),
    })
end
local function onRenderStepped(p1) -- Line: 279 -- upvalues: u59 (ref), u53 (val), clearAllParticles (val), getHumanoidRootPart (val), getMovementDirection (val), u55 (ref), onSpawnParticle (val), onStepParticle (val), clearParticle (val)
    local v1
    if not u59 then
        local v2 = #u53
        if 0 < v2 then
            clearAllParticles()
        end
        return
    end
    local CurrentCamera = workspace.CurrentCamera
    if not CurrentCamera then
        return
    end
    local v3 = getHumanoidRootPart()
    local v4 = v3
    if v4 then
        v4 = getMovementDirection(v3, CurrentCamera, p1)
    end
    local v5 = if v3 ~= nil then 80 < v3.AssemblyLinearVelocity.Magnitude else false
    u55 = v5
    if u55 and v4 then
        v5 = #u53
        if v5 < 10 then
            while true do
                v5 = #u53
                if v5 >= 10 then
                    break
                end
                onSpawnParticle(CurrentCamera, v4)
            end
        end
    end
    v5 = 1
    local v6 = -1
    local v7 = p1
    for i = #u53, v5, v6 do
        v1 = u53[i]
        if not (onStepParticle(v1, v7, CurrentCamera)) then
            clearParticle(i)
        end
    end
end
local function begin() -- Line: 315 -- upvalues: u56 (ref), u57 (ref), updateWindParticlesEnabledState (val), ClientSettingsHandler (val), u59 (ref), clearAllParticles (val), RunService (val), onRenderStepped (val)
    if not u56 then
        updateWindParticlesEnabledState()
        if not u57 then
            u57 = ClientSettingsHandler.onSettingChanged:Connect(function(p1) -- Line: 323 -- upvalues: updateWindParticlesEnabledState (upval), u59 (upval), clearAllParticles (upval)
                if p1 ~= "Show Wind Particles" then
                    return
                end
                updateWindParticlesEnabledState()
                if not u59 then
                    clearAllParticles()
                end
            end)
        end
        u56 = RunService.RenderStepped:Connect(onRenderStepped)
        return
    end
    if u57 then
        return
    end
    updateWindParticlesEnabledState()
    if not u57 then
        u57 = ClientSettingsHandler.onSettingChanged:Connect(function(p1) -- Line: 323 -- upvalues: updateWindParticlesEnabledState (upval), u59 (upval), clearAllParticles (upval)
            if p1 ~= "Show Wind Particles" then
                return
            end
            updateWindParticlesEnabledState()
            if not u59 then
                clearAllParticles()
            end
        end)
    end
    u56 = RunService.RenderStepped:Connect(onRenderStepped)
end
begin()
return {
    begin = begin,
    stop = function() -- Line: 338 -- upvalues: u56 (ref), u57 (ref), clearAllParticles (val), u58 (ref)
        if u56 then
            u56:Disconnect()
            u56 = nil
        end
        if u57 then
            u57:Disconnect()
            u57 = nil
        end
        clearAllParticles()
        u58 = nil
    end,
}