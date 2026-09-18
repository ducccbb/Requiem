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
--           File: ReplicatedStorage.Client.Interfaces.Routes.Screen.Pamphlet
--                              Dumped in 0.000750 seconds
--                          Bytecode version 9  |  5 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local Components = v1.Parent.Parent.Parent:WaitForChild("Components")
local Screen = Components:WaitForChild("Screen")
local DynamicPage = require(Screen:WaitForChild("DynamicPage"))
local Hooks = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useInterfaceState = require(Hooks:WaitForChild("useInterfaceState"))
return function() -- Line: 27 -- upvalues: react (val), useInterfaceState (val), Players (val), RunService (val), DynamicPage (val)
    local pamphlet, pamphlet_2, u4, v1
    v1, u4 = react.useState(false)
    pamphlet, pamphlet_2 = useInterfaceState("pamphlet")
    local v2 = pamphlet_2
    if not v2 then
        v2 = {visible = false}
    end
    local u12 = v2
    react.useEffect(function() -- Line: 32 -- upvalues: u12 (ref), u4 (val), Players (upval), RunService (upval), pamphlet (val)
        if not u12.object or not u12.visible then
            u4(false)
            return
        end
        u4(true)
        local Character = Players.LocalPlayer.Character
        local HumanoidRootPart = Character
        if HumanoidRootPart then
            HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
        end
        if not HumanoidRootPart then
            return
        end
        local Position = HumanoidRootPart.Position
        local u22 = RunService.Heartbeat:Connect(function() -- Line: 48 -- upvalues: Players (upval), Position (val), pamphlet (upval)
            local Character = Players.LocalPlayer.Character
            local HumanoidRootPart = Character
            if HumanoidRootPart then
                HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
            end
            if not HumanoidRootPart then
                return
            end
            if 3 < (HumanoidRootPart.Position - Position).Magnitude then
                pamphlet({visible = false})
            end
        end)
        return function() -- Line: 63 -- upvalues: u22 (val)
            u22:Disconnect()
        end
    end, {u12.object, u12.visible, pamphlet})
    return react.createElement(DynamicPage, {Enabled = v1}, {Content = react.createElement("Frame", {BackgroundTransparency = 1, Size = UDim2.fromScale(0.8, 0.8), AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5)}, {Image = react.createElement("ImageLabel", {
        Image = "rbxassetid://72961114322083",
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.499, 0.5),
        Size = UDim2.fromScale(0.494, 1.2),
    }, {UIAspectRatioConstraint = react.createElement("UIAspectRatioConstraint", {AspectRatio = 0.667})})})})
end