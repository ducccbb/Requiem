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
--  File: ReplicatedStorage.Client.Interfaces.Routes.Screen.Effects.BlinkScreenOverlay
--                               Dumped in 0.00108 seconds
--                          Bytecode version 9  |  9 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local Hooks = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useInterfaceState = require(Hooks:WaitForChild("useInterfaceState"))
local Hooks_2 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useMotion = require(Hooks_2:WaitForChild("useMotion"))
return function(p1) -- Line: 23 -- upvalues: useMotion (val), useInterfaceState (val), react (val), RunService (val)
    local blink_2, u3, u4
    u3, u4 = useMotion(0)
    _, blink_2 = useInterfaceState("blink")
    local v1 = blink_2
    if not v1 then
        v1 = {enabled = false, speed = 0, overshoot = 0, frequency = NumberRange.new(0, 0)}
    end
    local u16 = v1
    local u18 = u16.overshoot or 0
    react.useEffect(function() -- Line: 49 -- upvalues: u16 (ref), u4 (val), RunService (upval), u3 (val)
        local speed
        local u54 = nil
        local u1 = nil
        if u16.enabled then
            if not u16.frequency then
                speed = u16.speed
                if speed then
                    u4:tween(1, {time = u16.speed, style = Enum.EasingStyle.Quad, direction = Enum.EasingDirection.InOut})
                end
            elseif not u16.speed then
                speed = u16.speed
                if speed then
                    u4:tween(1, {time = u16.speed, style = Enum.EasingStyle.Quad, direction = Enum.EasingDirection.InOut})
                end
            else
                u4:spring(1)
                speed = 0
                local u47 = math.random(u16.frequency.Min * 100, u16.frequency.Max * 100) / 100
                u54 = RunService.RenderStepped:Connect(function(p1) -- Line: 71 -- upvalues: speed (ref), u47 (ref), u4 (upval), u3 (upval), u16 (upval), u1 (ref)
                    speed = speed + p1
                    if u47 <= speed then
                        local v1 = u3:getValue() + 0.5
                        u4:spring(v1, {frequency = u16.speed})
                        u1 = task.delay(0.2, function() -- Line: 79 -- upvalues: u4 (upval)
                            u4:spring(1, {frequency = 0.5})
                        end)
                        u47 = math.random(u16.frequency.Min * 100, u16.frequency.Max * 100) / 100
                        speed = 0
                    end
                end)
            end
        elseif not u16.tween then
            u4:spring(0, {frequency = 3})
        else
            u4:tween(0, {time = u16.tween.Time, style = u16.tween.EasingStyle, direction = u16.tween.EasingDirection})
        end
        function speed() -- Line: 98 -- upvalues: u54 (ref), u1 (ref)
            if u54 then
                u54:Disconnect()
            end
            if u1 then
                task.cancel(u1)
                u1 = nil
            end
        end
        return speed
    end, {u16})
    return react.createElement("Frame", {
        BorderSizePixel = 0,
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
        Visible = u3:map(function(p1) -- Line: 118
            local v1 = p1 == 0
            return not v1
        end),
    }, {TopEyelid = react.createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Size = UDim2.fromScale(1.1, 0.7),
        Position = u3:map(function(p1) -- Line: 129 -- upvalues: u18 (val)
            local v1 = UDim2.fromScale(0.5, -1.3)
            local v2 = UDim2.fromScale(0.5, u18)
            return v1:Lerp(v2, p1)
        end),
    }, {Image = react.createElement("ImageLabel", {
        Image = "rbxassetid://93844932452963",
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Size = UDim2.fromScale(1, 1),
    }), Frame = react.createElement("Frame", {
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 1),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.0203),
        Size = UDim2.fromScale(1, 1),
    })}), BottomEyelid = react.createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 1),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = u3:map(function(p1) -- Line: 158 -- upvalues: u18 (val)
            local v1 = UDim2.fromScale(0.5, 2)
            local v2 = UDim2.fromScale(0.5, 0.973 - u18)
            return v1:Lerp(v2, p1)
        end),
        Size = UDim2.fromScale(1.1, 0.7),
    }, {Image = react.createElement("ImageLabel", {
        Image = "rbxassetid://93844932452963",
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Rotation = 180,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0, -0.483),
        Size = UDim2.fromScale(1, 1.8),
    }), Frame = react.createElement("Frame", {
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 1.29),
        Size = UDim2.fromScale(1, 1),
    })})})
end