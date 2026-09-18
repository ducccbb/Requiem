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
--File: ReplicatedStorage.Client.Interfaces.Components.Menu.Progression.Blessings.BlessingSkillSplitLine
--                              Dumped in 0.000589 seconds
--                          Bytecode version 9  |  5 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Promise = require(Common:WaitForChild("Promise"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_2:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
return function(p1) -- Line: 35 -- upvalues: react (val), Promise (val), TweenService (val)
    local u4 = react.useRef(nil)
    react.useEffect(function() -- Line: 38 -- upvalues: u4 (val), p1 (val), Promise (upval), TweenService (upval)
        local current
        if not u4.current then
            return
        end
        current = u4.current
        local u11 = UDim2.fromOffset(p1.Midpoint.X, p1.Midpoint.Y)
        local u17 = UDim2.fromOffset(p1.Distance, p1.Thickness)
        current.Size = UDim2.fromOffset(0, p1.Thickness)
        current.Position = UDim2.fromOffset(p1.Origin.X, p1.Origin.Y)
        if not p1.Enabled then
            return
        end
        local u46 = Promise.delay(p1.DistanceFromCenter * (p1.Speed + 0.1) + 0.1):andThen(function() -- Line: 56 -- upvalues: TweenService (upval), current (val), p1 (upval), u17 (val), u11 (val)
            local v1 = TweenInfo.new(p1.Speed, Enum.EasingStyle.Linear)
            TweenService:Create(current, v1, {Size = u17, Position = u11}):Play()
        end)
        return function() -- Line: 63 -- upvalues: current (val), u17 (val), u11 (val), u46 (val)
            current.Size = u17
            current.Position = u11
            u46:cancel()
        end
    end, {u4, p1.Enabled})
    local v1 = {
        BorderSizePixel = 0,
        BackgroundTransparency = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromOffset(p1.Midpoint.X, p1.Midpoint.Y),
        Size = UDim2.fromOffset(p1.Distance, p1.Thickness),
        BackgroundColor3 = Color3.fromRGB(96, 96, 96),
        Rotation = math.deg(p1.Rotation),
        Name = p1.Index,
        ref = u4,
    }
    local v2 = {}
    local v3 = {Rotation = 90}
    local v4 = {}
    local v5 = NumberSequenceKeypoint.new(0, 1)
    local v6 = NumberSequenceKeypoint.new(0.25, 0)
    local v7 = NumberSequenceKeypoint.new(0.5, 0)
    local v8 = NumberSequenceKeypoint.new(0.75, 0)
    v4[1] = v5
    v4[2] = v6
    v4[3] = v7
    v4[4] = v8
    v4[5] = NumberSequenceKeypoint.new(1, 1)
    v3.Transparency = NumberSequence.new(v4)
    v2.Gradient = react.createElement("UIGradient", v3)
    return react.createElement("Frame", v1, v2)
end