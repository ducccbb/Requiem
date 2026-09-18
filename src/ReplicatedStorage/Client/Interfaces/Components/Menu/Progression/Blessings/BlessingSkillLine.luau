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
--File: ReplicatedStorage.Client.Interfaces.Components.Menu.Progression.Blessings.BlessingSkillLine
--                               Dumped in 0.00112 seconds
--                          Bytecode version 9  |  6 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local BlessingSkillSplitLine = require(script.Parent:WaitForChild("BlessingSkillSplitLine"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_2:WaitForChild("Client")
local Interfaces = Client:WaitForChild("Interfaces")
local Hooks = Interfaces:WaitForChild("Hooks")
local useDebounceState = require(Hooks:WaitForChild("useDebounceState"))
return function(p1) -- Line: 38 -- upvalues: useDebounceState (val), react (val), BlessingSkillSplitLine (val)
    local u12, u13, u6, u7, v1, v2
    local u1 = {}
    local v3 = {wait = 0.5}
    u6, u7 = useDebounceState(Vector2.new(), v3)
    local v4 = {wait = 0.5}
    u12, u13 = useDebounceState(Vector2.new(), v4)
    local u17 = react.useRef(nil)
    react.useEffect(function() -- Line: 51 -- upvalues: u17 (val), u7 (val), u13 (val)
        local current
        if not u17.current then
            return
        end
        current = u17.current
        u7(current.AbsoluteSize)
        u13(current.AbsolutePosition)
    end, {u17})
    local v5 = {
        p1.Enabled,
        u6,
        u12,
        p1.Origin,
        p1.Destination,
        p1.Straight,
        p1.Speed,
        p1.DistanceFromCenter,
    }
    v2 = react.useMemo(function() -- Line: 63 -- upvalues: p1 (val), u6 (val), u12 (val), u1 (val), react (upval), BlessingSkillSplitLine (upval)
        local v1, v2, v3, v4, v5, v6, v7, v8, v9, v10
        local v11 = {}
        local v12 = Vector2.new(p1.Origin.X.Scale * u6.X, p1.Origin.Y.Scale * u6.Y)
        local v13 = Vector2.new(p1.Destination.X.Scale * u6.X, p1.Destination.Y.Scale * u6.Y)
        if not p1.Straight then
            v9 = math.ceil((v13 - v12).Magnitude / 30)
        else
            v9 = 1
        end
        local v14 = v12.X < v13.X
        local v15 = v12.Y < v13.Y
        local v16 = v13.X == v12.X
        local v17 = v13.Y == v12.Y
        if v16 then
            v10 = 0
        elseif not v14 then
            v10 = -1
        else
            v10 = 1
        end
        if v17 then
            v1 = 0
        elseif not v15 then
            v1 = -1
        else
            v1 = 1
        end
        local v18 = math.abs(v13.X - v12.X)
        if math.abs(v13.Y - v12.Y) >= v18 then
            v2 = "Y"
        else
            v2 = "X"
        end
        if v2 ~= "X" then
            v3 = 0
        else
            v3 = 100
        end
        if v2 ~= "Y" then
            v4 = 0
        else
            v4 = 100
        end
        local v19 = Vector2.new(v3, v4)
        local v20 = (v12 + v13) / 2 + v19 * Vector2.new(v10, v1)
        local v21 = v9
        v19 = 1
        for i = 0, v21, v19 do
            if u6.Magnitude ~= 0 and u12.Magnitude ~= 0 then
                v4 = i / v9
                u1[i] = Vector2.new((1 - v4) * (1 - v4) * v12.X + 2 * (1 - v4) * v4 * v20.X + v4 * v4 * v13.X, (1 - v4) * (1 - v4) * v12.Y + 2 * (1 - v4) * v4 * v20.Y + v4 * v4 * v13.Y)
            end
        end
        for k, v in pairs(u1) do
            if u1[k - 1] then
                v5 = u1[k - 1]
                v6 = v
                v7 = math.atan2(v6.Y - v5.Y, v6.X - v5.X)
                v8 = tostring(k)
                v11[v8] = react.createElement(BlessingSkillSplitLine, {
                    Midpoint = (v5 + v6) / 2,
                    Distance = (v6 - v5).Magnitude * 1.02,
                    Rotation = v7,
                    Thickness = p1.Thickness,
                    Origin = v5,
                    Index = k,
                    Speed = p1.Speed,
                    DistanceFromCenter = p1.DistanceFromCenter,
                    Enabled = p1.Enabled,
                })
            end
        end
        return v11
    end, v5)
    v1 = {AnchorPoint = Vector2.new(0, 0), Position = UDim2.fromScale(0, 0), Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1}
    v1[react.Change.AbsoluteSize] = function(p1) -- Line: 162 -- upvalues: u7 (val)
        u7(p1.AbsoluteSize)
    end
    v1[react.Change.AbsolutePosition] = function(p1) -- Line: 166 -- upvalues: u13 (val)
        u13(p1.AbsolutePosition)
    end
    v1.ref = u17
    v1.ZIndex = -1
    return react.createElement("Frame", v1, v2)
end