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
--   File: ReplicatedStorage.Client.Interfaces.Components.Universal.AnimationViewport
--                               Dumped in 0.00127 seconds
--                          Bytecode version 9  |  9 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_2:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local Assets = ReplicatedStorage:WaitForChild("Assets")
local Animation = Assets:WaitForChild("Objects"):WaitForChild("Animation")
local Hooks = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useBindingListener = require(Hooks:WaitForChild("useBindingListener"))
local Utilities = v1.Parent.Parent:WaitForChild("Utilities")
local FillProps = require(Utilities:WaitForChild("FillProps"))
return react.memo(function(p1) -- Line: 34 -- upvalues: react (val), useBindingListener (val), Animation (val), TweenService (val), RunService (val), FillProps (val)
    local u20, u21
    local u4 = react.useRef(nil)
    local u8 = react.useRef(false)
    local u12 = react.useRef(nil)
    local u16 = react.useRef(nil)
    u20, u21 = react.useState(false)
    useBindingListener(p1.Rendered, function(p1) -- Line: 51 -- upvalues: u20 (val), u21 (val)
        if p1 == u20 then
            return
        end
        u21(p1)
    end)
    react.useEffect(function() -- Line: 60 -- upvalues: u8 (val), p1 (val)
        u8.current = p1.Selected
    end, {p1.Selected})
    react.useEffect(function() -- Line: 64 -- upvalues: u4 (val), u20 (val), Animation (upval), p1 (val), u16 (val), TweenService (upval), RunService (upval), u8 (val)
        if not u4.current or not u20 then
            return
        end
        local u3 = 0
        local v1 = Animation:Clone()
        local Camera = Instance.new("Camera")
        local WorldModel = Instance.new("WorldModel")
        local u16 = v1:Clone()
        u16.Parent = WorldModel
        WorldModel.Parent = u4.current
        u4.current.CurrentCamera = Camera
        local HumanoidRootPart = u16:FindFirstChild("HumanoidRootPart")
        local Torso = u16:FindFirstChild("Torso")
        local Offset = p1.Offset
        if not Offset then
            Offset = CFrame.new(0, 0.5, -4)
        end
        Camera.CFrame = CFrame.new((HumanoidRootPart.CFrame * Offset).Position, Torso.CFrame.Position)
        local Humanoid = u16:WaitForChild("Humanoid")
        local Animator = Humanoid:WaitForChild("Animator")
        u16.current = Animator
        local v2 = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
        TweenService:Create(Camera, v2, {FieldOfView = 50}):Play()
        local u79 = RunService.RenderStepped:Connect(function(a1) -- Line: 97 -- upvalues: u8 (upval), u3 (ref), Camera (val), HumanoidRootPart (val), p1 (upval), Torso (val)
            if not u8.current then
                u3 = 0
            else
                u3 = u3 + a1 * 30
            end
            local v1 = math.rad(u3)
            local Offset = p1.Offset
            if not Offset then
                Offset = CFrame.new(0, 0.5, -4)
            end
            Camera.CFrame = CFrame.new((HumanoidRootPart.CFrame * CFrame.Angles(0, v1, 0) * Offset).Position, Torso.CFrame.Position)
        end)
        return function() -- Line: 110 -- upvalues: WorldModel (val), Camera (val), u16 (val), u79 (val)
            WorldModel:Destroy()
            Camera:Destroy()
            u16:Destroy()
            u79:Disconnect()
        end
    end, {u4, u20})
    react.useEffect(function() -- Line: 118 -- upvalues: u4 (val), u20 (val), u16 (val), p1 (val), u12 (val)
        if not u4.current or not u20 or not u16.current then
            return
        end
        local Animation = Instance.new("Animation")
        Animation.AnimationId = p1.Animation
        local u15 = u16.current:LoadAnimation(Animation)
        u15.Looped = true
        u12.current = u15
        u15:Play()
        return function() -- Line: 133 -- upvalues: u12 (upval), u15 (val), Animation (val)
            if u12.current then
                u12.current:Stop()
            end
            u12.current = nil
            u15:Destroy()
            Animation:Destroy()
        end
    end, {
        u4,
        u16,
        p1.Animation,
        u20,
        u16.current,
    })
    local Native = p1.Native
    if not Native then
        Native = {}
    end
    local v1 = FillProps(Native, {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 1),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.4),
        ImageColor3 = Color3.fromRGB(112, 119, 143),
        Ambient = Color3.fromRGB(255, 255, 255),
        LightDirection = Vector3.new(8, 4, 0),
        LightColor = Color3.fromRGB(255, 255, 255),
        ref = u4,
    })
    local v2 = {}
    local v3 = {Rotation = 90}
    local v4 = {}
    local v5 = NumberSequenceKeypoint.new(0, 0)
    local v6 = NumberSequenceKeypoint.new(0.8, 0)
    v4[1] = v5
    v4[2] = v6
    v4[3] = NumberSequenceKeypoint.new(1, 1)
    v3.Transparency = NumberSequence.new(v4)
    v2.Gradient = react.createElement("UIGradient", v3)
    return react.createElement("ViewportFrame", v1, v2)
end)