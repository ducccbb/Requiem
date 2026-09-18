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
--     File: ReplicatedStorage.Client.Interfaces.Components.Screen.DynamicPageRings
--                               Dumped in 0.00111 seconds
--                          Bytecode version 9  |  6 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local function getViewportSize() -- Line: 45
    local CurrentCamera = workspace.CurrentCamera
    if CurrentCamera then
        return CurrentCamera.ViewportSize
    end
    return Vector2.new(1920, 1080)
end
return react.memo(function(p1) -- Line: 54 -- upvalues: react (val), RunService (val), getViewportSize (val), UserInputService (val)
    local u4 = react.useRef(nil)
    local u8 = react.useRef(nil)
    local u12 = react.useRef(nil)
    local u16 = react.useRef(nil)
    react.useEffect(function() -- Line: 60 -- upvalues: p1 (val), RunService (upval), getViewportSize (upval), UserInputService (upval), u4 (val), u8 (val), u12 (val), u16 (val)
        if not p1.Enabled then
            return
        end
        local u2 = false
        local u3 = 0
        local u4 = 0
        local u5 = 0
        local u6 = 0
        local u7 = 0
        local u8 = 0
        local u14 = RunService.RenderStepped:Connect(function(p1) -- Line: 73 -- upvalues: u2 (ref), u3 (ref), getViewportSize (upval), UserInputService (upval), u7 (ref), u8 (ref), u4 (upval), u4 (ref), u8 (upval), u5 (ref), u12 (upval), u6 (ref), u16 (upval)
            local v1
            if u2 then
                return
            end
            u3 = u3 + p1
            local v2 = getViewportSize()
            local MouseLocation = UserInputService:GetMouseLocation()
            local v3 = (MouseLocation.X / v2.X - 0.5) * 2
            local v4 = (MouseLocation.Y / v2.Y - 0.5) * 2
            local v5 = math.min(1, p1 * 6)
            u7 = u7 + (v3 - u7) * v5
            u8 = u8 + (v4 - u8) * v5
            local v6 = math.sin(u3 * 0.9)
            local current = u4.current
            if current then
                local v7 = v6 * 0.018 + 0.44
                current.ImageTransparency = 0.94 - v6 * 0.04
                current.Size = UDim2.fromScale(v7, v7 * 1.05)
                v1 = UDim2.fromScale(0.5, 0.5)
                current.Position = v1 + UDim2.fromOffset(u7 * 10, u8 * 10)
            end
            u4 = (u4 + p1 * 3) % 360
            local current_2 = u8.current
            if current_2 then
                current_2.Rotation = u4
                current_2.ImageTransparency = 0.95 - math.sin(u3 * 0.8) * 0.022
                v1 = UDim2.fromScale(0.5, 0.5)
                current_2.Position = v1 + UDim2.fromOffset(u7 * 22, u8 * 22)
            end
            u5 = (u5 + p1 * -4.5) % 360
            local current_3 = u12.current
            if current_3 then
                current_3.Rotation = u5
                current_3.ImageTransparency = 0.95 - math.sin(u3 * 0.8 + 1.2) * 0.022
                local v8 = UDim2.fromScale(0.5, 0.5)
                current_3.Position = v8 + UDim2.fromOffset(u7 * 18, u8 * 18)
            end
            u6 = (u6 + p1 * 2) % 360
            local current_4 = u16.current
            if current_4 then
                current_4.Rotation = u6
                current_4.ImageTransparency = 0.95 - math.sin(u3 * 0.8 + 2.4) * 0.022
                local v9 = UDim2.fromScale(0.5, 0.5)
                current_4.Position = v9 + UDim2.fromOffset(u7 * 14, u8 * 14)
            end
        end)
        return function() -- Line: 129 -- upvalues: u2 (ref), u14 (val)
            u2 = true
            u14:Disconnect()
        end
    end, {p1.Enabled, p1.Accent})
    return react.createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Size = UDim2.fromScale(1, 1),
        Visible = p1.Enabled,
        ZIndex = p1.ZIndex or 2,
    }, {Glow = react.createElement("ImageLabel", {
        Image = "rbxassetid://17812826389",
        ImageTransparency = 0.94,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 1,
        ref = u4,
        ImageColor3 = p1.Accent,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(0.44, 0.462),
    }, {Aspect = react.createElement("UIAspectRatioConstraint")}), Circle = react.createElement("ImageLabel", {
        Image = "rbxassetid://80886374823019",
        ImageTransparency = 0.95,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 2,
        ref = u8,
        ImageColor3 = p1.Accent,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(0.383, 0.604),
    }, {Aspect = react.createElement("UIAspectRatioConstraint")}), Circle2 = react.createElement("ImageLabel", {
        Image = "rbxassetid://115008927542411",
        ImageTransparency = 0.95,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 3,
        ref = u12,
        ImageColor3 = p1.Accent,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(0.401, 0.633),
    }, {Aspect = react.createElement("UIAspectRatioConstraint")}), Dotted = react.createElement("ImageLabel", {
        Image = "rbxassetid://127752913725408",
        ImageTransparency = 0.95,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 4,
        ref = u16,
        ImageColor3 = p1.Accent,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(0.421, 0.664),
    }, {Aspect = react.createElement("UIAspectRatioConstraint")})})
end)