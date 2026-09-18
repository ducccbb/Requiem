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
--        File: ReplicatedStorage.Client.User.Character.CharacterPredictionRunner
--                               Dumped in 0.00337 seconds
--                          Bytecode version 9  |  21 functions

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
local u36 = {}
local v2 = {}
u36.history = v2
local u38 = {frameTime = 0}
local v3 = {}
u38.predictions = v3
local u40 = nil
local u41 = 0
local u42 = nil
local function clearCacheIfNeeded(p1) -- Line: 80 -- upvalues: u42 (ref), u38 (val)
    local v1 = u42 or p1
    if v1 ~= u38.frameTime then
        u38.frameTime = v1
        u38.recentSamples = nil
        u38.curveAnalysis = nil
        u38.predictions = {}
    end
end
local function getRecentSamples(p1) -- Line: 95 -- upvalues: clearCacheIfNeeded (val), u38 (val), u36 (val)
    local v1, v2
    clearCacheIfNeeded(p1)
    if u38.recentSamples then
        return u38.recentSamples
    end
    local v3 = {}
    local v4 = 1
    local v5 = -1
    for i = #u36.history, v4, v5 do
        v1 = u36.history[i]
        v2 = p1 - v1.timestamp
        if v2 > 0.5 then
            break
        end
        table.insert(v3, 1, v1)
    end
    u38.recentSamples = v3
    return v3
end
local function calculateAverageVelocity(p1, p2) -- Line: 127
    local v1
    if #p1 == 0 then
        return Vector3.zero
    end
    local zero = Vector3.zero
    local v2 = 0
    for i, v in ipairs(p1) do
        v1 = math.exp(-(p2 - v.timestamp) * 0.07999999999999996)
        zero = zero + v.velocity * v1
        v2 = v2 + v1
    end
    if 0 < v2 then
        return zero / v2
    end
    return Vector3.zero
end
local function calculateAngularVelocity(p1) -- Line: 150
    local v1, v2, velocity, velocity_2
    if #p1 < 2 then
        return 0
    end
    local v3 = 0
    local v4 = 0
    local v5 = #p1
    local v6 = 1
    local v7 = p1
    for i = 2, v5, v6 do
        v2 = v7[i].timestamp - v7[i - 1].timestamp
        if v2 >= 0.008333333333333333 then
            velocity = v7[i - 1].velocity
            velocity_2 = v7[i].velocity
            if 1 < velocity.Magnitude and 1 < velocity_2.Magnitude then
                v1 = velocity.Unit:Dot(velocity_2.Unit)
                v3 = v3 + math.min(math.acos((math.clamp(v1, -1, 1))) / v2, 5.5) * v2
                v4 = v4 + v2
            end
        end
    end
    if 0 < v4 then
        return v3 / v4
    end
    return 0
end
local function calculateCurveDirection(p1) -- Line: 189
    local Unit, v1, velocity, velocity_2, velocity_3
    if #p1 < 3 then
        return Vector3.zero
    end
    local zero = Vector3.zero
    local v2 = 0
    local v3 = #p1 - 1
    local v4 = 1
    local v5 = p1
    for i = 2, v3, v4 do
        velocity = v5[i - 1].velocity
        velocity_2 = v5[i].velocity
        velocity_3 = v5[i + 1].velocity
        if 1 < velocity.Magnitude and 1 < velocity_2.Magnitude and 1 < velocity_3.Magnitude then
            v1 = velocity_3 - velocity
            Unit = velocity_2.Unit
            zero = zero + (v1 - Unit * v1:Dot(Unit))
            v2 = v2 + 1
        end
    end
    if 0 < v2 then
        return zero / v2
    end
    return Vector3.zero
end
local function analyzeCurvePattern(p1, p2) -- Line: 231 -- upvalues: clearCacheIfNeeded (val), u38 (val), calculateAverageVelocity (val), calculateAngularVelocity (val), calculateCurveDirection (val)
    clearCacheIfNeeded(p2)
    if u38.curveAnalysis then
        return u38.curveAnalysis
    end
    local v1 = calculateAverageVelocity(p1, p2)
    local v2 = calculateAngularVelocity(p1)
    local v3 = calculateCurveDirection(p1)
    local v4 = {avgVelocity = v1, angularVel = v2, curveDir = v3}
    u38.curveAnalysis = v4
    return v4
end
local function predictPlayerPositionCurved(p1) -- Line: 336 -- upvalues: u36 (val), clearCacheIfNeeded (val), u38 (val), getRecentSamples (val), analyzeCurvePattern (val)
    local Magnitude, angularVel, avgVelocity, avgVelocity_2, v1, v2, v3, v4, velocity_2
    local v5 = math.clamp(p1, 0, 2)
    if #u36.history == 0 then
        return nil
    end
    local v6 = tick()
    clearCacheIfNeeded(v6)
    local v7 = ("curved_%*"):format(v5)
    if u38.predictions[v7] then
        return u38.predictions[v7]
    end
    local v8 = u36.history[#u36.history]
    local v9 = getRecentSamples(v6)
    if #v9 < 3 then
        v4 = v8.position + v8.velocity * v5
        u38.predictions[v7] = v4
        return v4
    end
    v4 = analyzeCurvePattern(v9, v6)
    if v4.angularVel < 0.1 then
        velocity_2 = v8.velocity
        avgVelocity_2 = v4.avgVelocity
        if v4.avgVelocity.Magnitude * 0.5 >= (velocity_2 - avgVelocity_2).Magnitude then
            v1 = 0.05
        else
            v1 = 0.3
        end
        v2 = velocity_2:Lerp(avgVelocity_2, (math.min(v1 * 165 * v5, 1)))
        v3 = v8.position + v2 * v5
        u38.predictions[v7] = v3
        return v3
    else
        local v10, v11
        if v4.avgVelocity.Magnitude < 1 then
            velocity_2 = v8.velocity
            avgVelocity_2 = v4.avgVelocity
            if v4.avgVelocity.Magnitude * 0.5 >= (velocity_2 - avgVelocity_2).Magnitude then
                v1 = 0.05
            else
                v1 = 0.3
            end
            v2 = velocity_2:Lerp(avgVelocity_2, (math.min(v1 * 165 * v5, 1)))
            v3 = v8.position + v2 * v5
            u38.predictions[v7] = v3
            return v3
        end
        local velocity = v8.velocity
        Magnitude = velocity.Magnitude
        local Magnitude_2 = v4.avgVelocity.Magnitude
        local Unit = v4.avgVelocity.Unit
        local v12 = Unit:Cross((Vector3.new(0, 1, 0)))
        if v12.Magnitude >= 0.01 then
            local Unit_3, v13, v14, v15, v16, v17, v18, v19, v20
            local Unit_2 = v12.Unit
            if 0.1 < v4.curveDir.Magnitude then
                v2 = v4.curveDir:Dot(Unit_2)
                if v2 < 0 then
                    Unit_2 = -Unit_2
                end
            end
            v2 = if 0.3 < v4.angularVel then if v4.angularVel < 1.5 then if 20 < Magnitude_2 then Magnitude_2 < 150 else false else false else false
            if not v2 then
                angularVel = v4.angularVel
            else
                angularVel = v4.angularVel * 0.6
            end
            v3 = math.min(angularVel, 5.5)
            v10 = v3 * v5
            local v21 = math.cos(v10)
            v11 = math.sin(v10)
            if 0.1 >= velocity.Magnitude then
                Unit_3 = Unit
            else
                Unit_3 = velocity.Unit
            end
            local v22 = Unit_3:Dot(Unit)
            local v23 = Unit_3:Dot(Unit_2)
            local v24 = (Unit * (v22 * v21 - v23 * v11) + Unit_2 * (v22 * v11 + v23 * v21)).Unit * Magnitude_2
            local v25 = math.max(Magnitude, Magnitude_2)
            if not v2 then
                v13 = 0.05
            else
                v13 = 0.03
            end
            if v25 * 0.3 >= (velocity - v24).Magnitude then
                v14 = v13
            else
                v14 = 0.3
            end
            if not v2 and 2 < v4.angularVel then
                v14 = math.min(v14 * 1.5, 0.6)
            end
            local position = v8.position
            local v26 = velocity
            local v27 = v5
            local v28 = v14 * 165
            while 0 < v27 do
                v15 = math.min(0.016, v27)
                v26 = v26:Lerp(v24, (math.min(v28 * v15, 1)))
                position = position + v26 * v15
                if 0.016 < v27 then
                    v16 = (v5 - v27) / v5
                    if not v2 then
                        v17 = v16
                    else
                        v17 = v16 * v16
                    end
                    v18 = v3 * v17 * v5
                    v19 = math.cos(v18)
                    v20 = math.sin(v18)
                    v24 = (Unit * (v22 * v19 - v23 * v20) + Unit_2 * (v22 * v20 + v23 * v19)).Unit * Magnitude_2
                end
                v27 = v27 - v15
            end
            v15 = position
            u38.predictions[v7] = v15
            return v15
        else
            v12 = Unit:Cross((Vector3.new(1, 0, 0)))
            if v12.Magnitude < 0.01 then
                avgVelocity = v4.avgVelocity
                if Magnitude_2 * 0.5 >= (velocity - avgVelocity).Magnitude then
                    v10 = 0.05
                else
                    v10 = 0.3
                end
                v11 = velocity:Lerp(avgVelocity, (math.min(v10 * 165 * v5, 1)))
                local v29 = v8.position + v11 * v5
                u38.predictions[v7] = v29
                return v29
            end
        end
    end
end
RunService.RenderStepped:Connect(function() -- Line: 672 -- upvalues: Character (val), u41 (ref), u40 (ref), u36 (val)
    local v1
    _, v1 = Character.getCharacterAsync():await()
    if not v1 then
        return
    end
    local HumanoidRootPart = v1:FindFirstChild("HumanoidRootPart")
    if not HumanoidRootPart then
        return
    end
    local v2 = tick()
    local Position = HumanoidRootPart.Position
    local v3 = v2 - u41
    if not u40 or v3 < 0.001 then
        u40 = Position
        u41 = v2
        return
    end
    local v4 = (Position - u40) / v3
    local Humanoid = v1:FindFirstChildOfClass("Humanoid")
    if v4.Magnitude < 0.5 then
        if not Humanoid then
            v4 = HumanoidRootPart.CFrame.LookVector * 2
        elseif not Humanoid.PlatformStand then
            v4 = HumanoidRootPart.CFrame.LookVector * 2
        end
    end
    table.insert(u36.history, {position = Position, velocity = v4, timestamp = v2})
    local v5 = #u36.history
    if 60 < v5 then
        table.remove(u36.history, 1)
    end
    u40 = Position
    u41 = v2
end)
return {
    predictPlayerPositionWithin = function(p1) -- Line: 261 -- upvalues: u36 (val), clearCacheIfNeeded (val), u38 (val)
        local v1 = math.clamp(p1, 0, 2)
        if #u36.history == 0 then
            return nil
        end
        clearCacheIfNeeded((tick()))
        local v2 = ("instant_%*"):format(v1)
        if u38.predictions[v2] then
            return u38.predictions[v2]
        end
        local v3 = u36.history[#u36.history]
        local v4 = v3.position + v3.velocity * v1
        u38.predictions[v2] = v4
        return v4
    end,
    predictPlayerPositionSmoothed = function(p1) -- Line: 296 -- upvalues: u36 (val), clearCacheIfNeeded (val), u38 (val), getRecentSamples (val), calculateAverageVelocity (val)
        local v1
        local v2 = math.clamp(p1, 0, 2)
        if #u36.history == 0 then
            return nil
        end
        local v3 = tick()
        clearCacheIfNeeded(v3)
        local v4 = ("smoothed_%*"):format(v2)
        if u38.predictions[v4] then
            return u38.predictions[v4]
        end
        local v5 = u36.history[#u36.history]
        local v6 = getRecentSamples(v3)
        if #v6 >= 2 then
            local v7 = calculateAverageVelocity(v6, v3)
            v1 = v5.position + v7 * v2
        else
            v1 = v5.position + v5.velocity * v2
        end
        u38.predictions[v4] = v1
        return v1
    end,
    predictPlayerPositionCurved = predictPlayerPositionCurved,
    predictPlayerPositionAdaptive = function(p1) -- Line: 528 -- upvalues: u36 (val), clearCacheIfNeeded (val), u38 (val), getRecentSamples (val), analyzeCurvePattern (val), predictPlayerPositionCurved (val)
        local v1
        local v2 = math.clamp(p1, 0, 2)
        if #u36.history == 0 then
            return nil
        end
        local v3 = tick()
        clearCacheIfNeeded(v3)
        local v4 = ("adaptive_%*"):format(v2)
        if u38.predictions[v4] then
            return u38.predictions[v4]
        end
        local v5 = u36.history[#u36.history]
        local v6 = getRecentSamples(v3)
        if #v6 >= 3 then
            local v7 = analyzeCurvePattern(v6, v3)
            local Magnitude = v7.avgVelocity.Magnitude
            local v8 = (v5.velocity - v7.avgVelocity).Magnitude / math.max(Magnitude, 1)
            local v9 = 1 - math.clamp(v8, 0, 1)
            if 0.5 >= v7.angularVel then
                if v9 < 0.4 then
                    v1 = v5.position + v5.velocity * v2
                elseif Magnitude * 1.5 >= v5.velocity.Magnitude then
                    v1 = v5.position + v7.avgVelocity * v2
                else
                    v1 = v5.position + v5.velocity * v2
                end
            elseif 0.6 < v9 and 5 < Magnitude then
                local v10 = predictPlayerPositionCurved(v2)
                if not v10 then
                    v1 = v5.position + v5.velocity * v2
                else
                    v1 = (v5.position + v5.velocity * v2):Lerp(v10, v9 * 0.7)
                end
            end
        else
            v1 = v5.position + v5.velocity * v2
        end
        u38.predictions[v4] = v1
        return v1
    end,
    getCurrentVelocity = function() -- Line: 740 -- upvalues: u36 (val)
        if #u36.history == 0 then
            return nil
        end
        return u36.history[#u36.history].velocity
    end,
    getAverageVelocityOverTime = function(p1) -- Line: 595 -- upvalues: u36 (val), calculateAverageVelocity (val)
        local v1
        if #u36.history == 0 then
            return nil
        end
        local v2 = tick()
        local v3 = {}
        local v4 = 1
        local v5 = -1
        for i = #u36.history, v4, v5 do
            v1 = u36.history[i]
            if v2 - v1.timestamp > math.max(0, p1) then
                break
            end
            table.insert(v3, 1, v1)
        end
        if #v3 == 0 then
            return nil
        end
        return calculateAverageVelocity(v3, v2)
    end,
    getHighestVelocityOverTime = function(p1) -- Line: 629 -- upvalues: u36 (val)
        local Magnitude, v1
        if #u36.history == 0 then
            return nil
        end
        local v2 = tick()
        local v3 = {}
        local v4 = 1
        local v5 = -1
        for i = #u36.history, v4, v5 do
            v1 = u36.history[i]
            if v2 - v1.timestamp > math.max(0, p1 or 2) then
                break
            end
            table.insert(v3, 1, v1)
        end
        if #v3 == 0 then
            return nil
        end
        local velocity = nil
        v5 = 0
        for i2, v in ipairs(v3) do
            Magnitude = v.velocity.Magnitude
            if v5 < Magnitude then
                v5 = Magnitude
                velocity = v.velocity
            end
        end
        return velocity
    end,
    getMovementHistory = function() -- Line: 751 -- upvalues: u36 (val)
        return u36.history
    end,
    clearHistory = function() -- Line: 755 -- upvalues: u36 (val), u40 (ref), u41 (ref), u42 (ref), u38 (val)
        u36.history = {}
        u40 = nil
        u41 = 0
        u42 = nil
        u38.frameTime = 0
        u38.recentSamples = nil
        u38.curveAnalysis = nil
        u38.predictions = {}
    end,
    beginPredictionSampleBatch = function() -- Line: 768 -- upvalues: u42 (ref)
        u42 = tick()
    end,
    endPredictionSampleBatch = function() -- Line: 772 -- upvalues: u42 (ref)
        u42 = nil
    end,
    getCurveAnalysis = function() -- Line: 777 -- upvalues: u36 (val), getRecentSamples (val), analyzeCurvePattern (val)
        if #u36.history == 0 then
            return nil
        end
        local v1 = tick()
        local v2 = getRecentSamples(v1)
        if #v2 < 3 then
            return nil
        end
        return analyzeCurvePattern(v2, v1)
    end,
    getCacheStats = function() -- Line: 793 -- upvalues: u38 (val)
        local v1 = 0
        for k in pairs(u38.predictions) do
            v1 = v1 + 1
        end
        local v2 = {frameTime = u38.frameTime}
        local v3 = u38.recentSamples ~= nil
        v2.hasCachedSamples = v3
        v3 = u38.curveAnalysis ~= nil
        v2.hasCachedAnalysis = v3
        v2.cachedPredictionCount = v1
        v2.cachedPredictionKeys = table.clone(u38.predictions)
        return v2
    end,
}