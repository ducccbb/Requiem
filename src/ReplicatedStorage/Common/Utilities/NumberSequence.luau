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
--                File: ReplicatedStorage.Common.Utilities.NumberSequence
--                              Dumped in 0.000749 seconds
--                          Bytecode version 9  |  7 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local TweenService = game:GetService("TweenService")
local v2 = {}
function v2.tweenNumberSequence(p1, p2, p3) -- Line: 20 -- upvalues: TweenService (val)
    local NumberValue = Instance.new("NumberValue")
    NumberValue.Value = 0
    local v1 = {Value = 1}
    local u13 = TweenService:Create(NumberValue, p3, v1)
    local function lerp(p1, p2, p3) -- Line: 33
        return p1 + (p2 - p1) * p3
    end
    local function getKeypointAtTime(p1, p2) -- Line: 38 -- upvalues: lerp (val)
        local v1, v2, v3, v4, v5
        local Keypoints = p1.Keypoints
        if #Keypoints == 0 then
            return nil
        end
        if p2 <= Keypoints[1].Time then
            return Keypoints[1]
        end
        if Keypoints[#Keypoints].Time <= p2 then
            return Keypoints[#Keypoints]
        end
        local v6 = #Keypoints - 1
        local v7 = 1
        local v8 = p2
        for i = 1, v6, v7 do
            v2 = Keypoints[i]
            v3 = Keypoints[i + 1]
            if v2.Time <= v8 and v8 <= v3.Time then
                v4 = (v8 - v2.Time) / (v3.Time - v2.Time)
                v5 = lerp(v2.Value, v3.Value, v4)
                v1 = lerp(v2.Envelope, v3.Envelope, v4)
                return NumberSequenceKeypoint.new(v8, v5, v1)
            end
        end
        return Keypoints[#Keypoints]
    end
    local function interpolateSequences(p1, p2, p3) -- Line: 73 -- upvalues: getKeypointAtTime (val), lerp (val)
        local v1, v2, v3, v4, v5, v6, v7
        local v8 = {}
        local v9 = {}
        local Keypoints = p1.Keypoints
        local v10 = nil
        local v11 = nil
        for i, j in Keypoints, v10, v11 do
            if not (v9[j.Time]) then
                table.insert(v8, j.Time)
                v9[j.Time] = true
            end
        end
        local Keypoints_2 = p2.Keypoints
        v10 = nil
        v11 = nil
        for k, n in Keypoints_2, v10, v11 do
            if not (v9[n.Time]) then
                table.insert(v8, n.Time)
                v9[n.Time] = true
            end
        end
        table.sort(v8)
        local v12 = {}
        v10 = v8
        v11 = nil
        local v13 = nil
        v1, v2, v7 = p1, p2, p3
        for m, i5 in v10, v11, v13 do
            v3 = getKeypointAtTime(v1, i5)
            v4 = getKeypointAtTime(v2, i5)
            if not v3 then
                if v3 then
                    table.insert(v12, v3)
                elseif v4 then
                    table.insert(v12, v4)
                end
            elseif v4 then
                v5 = lerp(v3.Value, v4.Value, v7)
                v6 = lerp(v3.Envelope, v4.Envelope, v7)
                table.insert(v12, NumberSequenceKeypoint.new(i5, v5, v6))
            end
        end
        return NumberSequence.new(v12)
    end
    u13:Play()
    return {
        get = function() -- Line: 116 -- upvalues: NumberValue (val), interpolateSequences (val), p1 (val), p2 (val)
            return interpolateSequences(p1, p2, NumberValue.Value)
        end,
        destroy = function() -- Line: 122 -- upvalues: u13 (val), NumberValue (val)
            if u13 then
                u13:Cancel()
                u13:Destroy()
            end
            if NumberValue then
                NumberValue:Destroy()
            end
        end,
    }
end
return v2