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
--           File: ReplicatedStorage.Client.Interfaces.Routes.Screen.Awakening
--                               Dumped in 0.00127 seconds
--                          Bytecode version 9  |  7 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Awakening = require(Namespaces:WaitForChild("Awakening"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_2:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local RunService = game:GetService("RunService")
local Hooks = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useMotion = require(Hooks:WaitForChild("useMotion"))
local Hooks_2 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useStore = require(Hooks_2:WaitForChild("useStore"))
local u85 = Color3.fromRGB(188, 24, 24)
local u90 = Color3.fromRGB(255, 255, 255)
local v3 = {}
local v4 = ColorSequenceKeypoint.new(0, u85)
local v5 = ColorSequenceKeypoint.new(0.5, u90)
v3[1] = v4
v3[2] = v5
v3[3] = ColorSequenceKeypoint.new(1, u85)
local u105 = ColorSequence.new(v3)
return function() -- Line: 36 -- upvalues: useStore (val), Awakening (val), useMotion (val), react (val), RunService (val), u85 (val), u90 (val), u105 (val)
    local u14
    local v1 = useStore(Awakening.Awakening, function(p1) -- Line: 37
        return p1
    end)
    local u10 = math.clamp(v1.value / 100, 0, 1)
    _, u14 = useMotion(0)
    local u18 = react.useRef(nil)
    local u22 = react.useRef(nil)
    local u28 = if v1.has ~= 0 then 0 < v1.value else false
    react.useEffect(function() -- Line: 49 -- upvalues: u28 (val), u14 (val), u18 (val), u10 (val)
        if u28 then
            u14:spring(u10, {tension = 150, friction = 20, frequency = 1.5})
            return
        end
        u14:immediate(0)
        local current = u18.current
        if current then
            current.Size = UDim2.fromScale(1, 0)
        end
    end, {u28, u10})
    react.useEffect(function() -- Line: 64 -- upvalues: u28 (val), RunService (upval), u14 (val), u18 (val), u22 (val)
        if not u28 then
            return
        end
        local u2 = tick()
        local u8 = RunService.Heartbeat:Connect(function() -- Line: 70 -- upvalues: u14 (upval), u18 (upval), u22 (upval), u2 (val)
            local v1, v2
            local v3 = u14:get()
            local current = u18.current
            if current then
                current.Size = UDim2.fromScale(1, v3)
            end
            local current_2 = u22.current
            if not current_2 or not current then
                return
            end
            local v4 = -(current.AbsoluteSize.Y + 50)
            local v5 = 50 - v4
            if 0 >= v5 then
                v1 = 0
            else
                v1 = v5 / 60
            end
            if 0 >= v1 then
                v2 = 0
            else
                v2 = (tick() - u2) % v1 / v1
            end
            current_2.Position = UDim2.new(0.5, 0, 1, (math.floor(50 + (v4 - 50) * v2)))
        end)
        return function() -- Line: 93 -- upvalues: u8 (val)
            u8:Disconnect()
        end
    end, {u28})
    local v2 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0, 1),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.00524, 0.879),
        Size = UDim2.fromScale(0.154, 0.616),
        Visible = u28,
    }
    local v3 = {}
    local v4 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ClipsDescendants = true,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0, 0.0478),
        Size = UDim2.fromScale(1, 0.883),
    }
    local v5 = {}
    local v6 = {BorderSizePixel = 0, BackgroundColor3 = Color3.fromRGB(0, 0, 0), BorderColor3 = Color3.fromRGB(0, 0, 0), Size = UDim2.fromScale(0.197, 1)}
    local v7 = {}
    local v8 = {}
    local v9 = {}
    local v10 = NumberSequenceKeypoint.new(0, 0.107)
    v9[1] = v10
    v9[2] = NumberSequenceKeypoint.new(1, 1)
    v8.Transparency = NumberSequence.new(v9)
    v7.UIGradient = react.createElement("UIGradient", v8)
    v5.Content = react.createElement("Frame", v6, v7)
    v5.Extend = react.createElement("Frame", {
        BorderSizePixel = 0,
        ZIndex = 2,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Size = UDim2.new(0, 3, 1, 0),
    })
    v5.Awakening = react.createElement("Frame", {
        BackgroundTransparency = 0.7,
        BorderSizePixel = 0,
        ZIndex = 3,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.0985, 0.5),
        Size = UDim2.fromScale(0.0406, 0.954),
    }, {Container = react.createElement("Frame", {
        BackgroundTransparency = 0.35,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
    }, {Value = react.createElement("Frame", {
        BorderSizePixel = 0,
        ClipsDescendants = true,
        ref = u18,
        AnchorPoint = Vector2.new(0.5, 1),
        BackgroundColor3 = u85,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 1),
        Size = UDim2.fromScale(1, 0),
    }, {PulseBand = react.createElement("Frame", {
        BorderSizePixel = 0,
        ZIndex = 2,
        BackgroundTransparency = 0.75,
        ref = u22,
        AnchorPoint = Vector2.new(0.5, 1),
        BackgroundColor3 = u90,
        Position = UDim2.new(0.5, 0, 1, 0),
        Size = UDim2.new(1, 0, 0, 50),
    }, {Gradient = react.createElement("UIGradient", {Rotation = 90, Color = u105})})})}), UIPadding = react.createElement("UIPadding", {PaddingBottom = UDim.new(0, 2), PaddingLeft = UDim.new(0, 2), PaddingRight = UDim.new(0, 2), PaddingTop = UDim.new(0, 2)}), UIStroke = react.createElement("UIStroke", {Transparency = 0.48, Color = Color3.fromRGB(255, 255, 255)})})
    v3.Buff = react.createElement("Frame", v4, v5)
    v3.UIAspectRatioConstraint = react.createElement("UIAspectRatioConstraint", {AspectRatio = 0.413})
    v3.UISizeConstraint = react.createElement("UISizeConstraint", {MinSize = Vector2.new(294, 0)})
    return react.createElement("Frame", v2, v3)
end