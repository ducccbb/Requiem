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
--      File: ReplicatedStorage.Client.Interfaces.Components.Universal.RigViewport
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
return react.memo(function(p1) -- Line: 21 -- upvalues: react (val)
    local u4 = react.useRef(nil)
    local u8 = react.useRef(nil)
    local u12 = react.useRef(nil)
    local u16 = react.useRef(nil)
    react.useEffect(function() -- Line: 27 -- upvalues: u4 (val), u8 (val), u16 (val)
        if not u4.current then
            return
        end
        local Camera = Instance.new("Camera")
        local WorldModel = Instance.new("WorldModel")
        WorldModel.Parent = u4.current
        u4.current.CurrentCamera = Camera
        u8.current = Camera
        u16.current = WorldModel
        return function() -- Line: 41 -- upvalues: WorldModel (val), Camera (val)
            WorldModel:Destroy()
            Camera:Destroy()
        end
    end, {u4})
    react.useEffect(function() -- Line: 47 -- upvalues: p1 (val), u8 (val), u16 (val), u4 (val), u12 (val)
        if not p1.Model or not u8.current or not u16.current or not u4.current then
            return
        end
        local v1 = p1.Model:Clone()
        v1:PivotTo(CFrame.new(0, 0, 0))
        v1.Parent = u16.current
        u12.current = v1
        local HumanoidRootPart = v1:FindFirstChild("HumanoidRootPart")
        local Head = v1:FindFirstChild("Head")
        if HumanoidRootPart and Head then
            local v2 = HumanoidRootPart.CFrame * CFrame.new(0, 1.5, -1.8)
            u8.current.CFrame = CFrame.new(v2.Position, Head.Position)
        end
        return function() -- Line: 74 -- upvalues: u12 (upval)
            if u12.current then
                u12.current:Destroy()
            end
            u12.current = nil
        end
    end, {p1.Model, u8.current, u16.current, u4.current})
    return react.createElement("ViewportFrame", {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 1),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        ImageColor3 = Color3.fromRGB(234, 234, 234),
        Ambient = Color3.fromRGB(183, 184, 191),
        LightDirection = Vector3.new(-3, -10, 2),
        LightColor = Color3.fromRGB(255, 255, 255),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        ref = u4,
        ImageTransparency = p1.ImageTransparency,
    }, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 10)})})
end)