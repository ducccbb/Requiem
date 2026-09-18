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
--           File: ReplicatedStorage.Client.Interfaces.Routes.Screen.Indicator
--                               Dumped in 0.00128 seconds
--                          Bytecode version 9  |  15 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Signals = require(Common:WaitForChild("Signals"))
local function Indicator(p1) -- Line: 37 -- upvalues: react (val), RunService (val)
    local u10, u15, u20, u5, v1, v2, v3, v4
    v1, u5 = react.useBinding(0)
    v2, u10 = react.useBinding(0)
    v3, u15 = react.useBinding(550)
    v4, u20 = react.useBinding(1)
    local u25 = 600 - (p1.indicator.index or 0) * 80
    react.useEffect(function() -- Line: 48 -- upvalues: RunService (upval), p1 (val), u15 (val), u25 (val), u20 (val), u10 (val), u5 (val)
        local u5
        u5 = RunService.RenderStepped:Connect(function() -- Line: 49 -- upvalues: p1 (upval), u15 (upval), u25 (upval), u20 (upval), u10 (upval), u5 (upval)
            local v1
            local CurrentCamera = workspace.CurrentCamera
            if not CurrentCamera then
                return
            end
            local v2 = tick() - p1.indicator.created
            local v3 = p1.indicator.lifetime - v2
            if v2 < 0.3 then
                v1 = math.clamp(v2 / 0.3, 0, 1)
                u15(u25 - 50 + v1 * 50)
                u20(1 - v1)
            elseif 0.5 >= v3 then
                v1 = math.clamp(1 - v3 / 0.5, 0, 1)
                u15(u25)
                u20(v1)
            else
                u15(u25)
                u20(0)
            end
            local Position = p1.indicator.location.Position
            local v4 = ((Position - CurrentCamera.CFrame.Position).Unit:Dot(CurrentCamera.CFrame.LookVector) - 0.7) / 0.30000000000000004
            local v5 = math.clamp(v4, 0, 1)
            u10(v5)
            v4 = CurrentCamera:WorldToViewportPoint(Position)
            local v6 = Vector2.new(CurrentCamera.ViewportSize.X / 2, CurrentCamera.ViewportSize.Y / 2)
            local v7 = Vector2.new(v4.X, v4.Y) - v6
            if v4.Z < 0 then
                v7 = -v7
            end
            local v8 = math.deg((math.atan2(v7.Y, v7.X))) - 90
            u5(v8)
        end)
        return function() -- Line: 115 -- upvalues: u5 (val)
            u5:Disconnect()
        end
    end, {p1.indicator.location})
    local v5 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = v3:map(function(p1) -- Line: 127
            return UDim2.fromOffset(p1, p1)
        end),
        Rotation = v1,
    }
    local v6 = {Ratio = react.createElement("UIAspectRatioConstraint"), Corner = react.createElement("UICorner", {CornerRadius = UDim.new(1, 0)})}
    local v7 = {Thickness = 2, Color = Color3.fromRGB(255, 255, 255), Transparency = react.joinBindings({v2, v4}):map(function(p1) -- Line: 141
        local v1 = p1[1] * 0.75 + 0.25
        return (math.max(v1, p1[2]))
    end)}
    local v8 = {}
    local v9 = {Rotation = -90}
    local v10 = {}
    local v11 = NumberSequenceKeypoint.new(0, 0)
    local v12 = NumberSequenceKeypoint.new(0.0512, 0)
    local v13 = NumberSequenceKeypoint.new(0.0513, 1)
    v10[1] = v11
    v10[2] = v12
    v10[3] = v13
    v10[4] = NumberSequenceKeypoint.new(1, 1)
    v9.Transparency = NumberSequence.new(v10)
    v8.Gradient = react.createElement("UIGradient", v9)
    v6.Stroke = react.createElement("UIStroke", v7, v8)
    v6.Label = react.createElement("ImageLabel", {
        Image = "rbxassetid://133245988601363",
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ImageTransparency = react.joinBindings({v2, v4}):map(function(p1) -- Line: 161
            local v1 = p1[1] * 0.75 + 0.25
            return (math.max(v1, p1[2]))
        end),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 1.03),
        Size = UDim2.fromOffset(20, 20),
    })
    return react.createElement("Frame", v5, v6)
end
return function() -- Line: 179 -- upvalues: react (val), Signals (val), Indicator (val)
    local u4, v1, v2
    local v3 = {}
    v1, u4 = react.useState(v3)
    react.useEffect(function() -- Line: 182 -- upvalues: Signals (upval), u4 (val)
        local u5 = Signals.Indicator:Connect(function(p1) -- Line: 183 -- upvalues: u4 (upval)
            local u4 = math.random(0, 100000000)
            p1.created = tick()
            u4(function(a1) -- Line: 187 -- upvalues: p1 (val), u4 (val)
                p1.id = u4
                table.insert(a1, p1)
                return table.clone(a1)
            end)
            task.delay(p1.lifetime, function() -- Line: 195 -- upvalues: u4 (upval), p1 (val)
                u4(function(a1) -- Line: 196 -- upvalues: p1 (upval)
                    local v1 = table.find(a1, p1)
                    table.remove(a1, v1)
                    return table.clone(a1)
                end)
            end)
        end)
        return function() -- Line: 205 -- upvalues: u5 (val)
            u5:Disconnect()
        end
    end, {})
    local v4 = {}
    local v5 = v1
    local v6 = nil
    local v7 = nil
    for i, j in v5, v6, v7 do
        j.index = i - 1
        v2 = tostring(j.id)
        v4[v2] = react.createElement(Indicator, {indicator = j})
    end
    return react.createElement("Frame", {BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1), AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5)}, v4)
end