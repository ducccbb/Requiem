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
--     File: ReplicatedStorage.Client.Interfaces.Components.Universal.ModelViewport
--                               Dumped in 0.00180 seconds
--                          Bytecode version 9  |  9 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local RunService = game:GetService("RunService")
local Utilities = script.Parent.Parent:WaitForChild("Utilities")
local FillProps = require(Utilities:WaitForChild("FillProps"))
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
return function(p1) -- Line: 35 -- upvalues: react (val), RunService (val), FillProps (val)
    local u13, u14, u18, u19, u8, u9, v1
    local u4 = react.useRef(nil)
    u8, u9 = react.useState(false)
    u13, u14 = react.useState(nil)
    u18, u19 = react.useState(nil)
    local v2 = {u4.current, u13, u8, true}
    react.useEffect(function() -- Line: 43 -- upvalues: u4 (val), p1 (val), u13 (val), u19 (val), RunService (upval), u18 (val), u8 (val)
        local calculateCameraAngle, current
        if not u4.current or not p1.Model or not u13 then
            return
        end
        function calculateCameraAngle(a1, p2, p3, p4) -- Line: 59 -- upvalues: calculateCameraAngle (val), u19 (upval), RunService (upval), p1 (upval)
            local BoundingBox, BoundingBox_2
            BoundingBox, BoundingBox_2 = p2:GetBoundingBox()
            local v1 = (BoundingBox - BoundingBox.Position):Inverse()
            local Attribute_2 = p2:GetAttribute("Rotation")
            if not Attribute_2 then
                Attribute_2 = Vector3.new()
            end
            local u24 = p2:GetAttribute("Scale") or 1
            local Attribute = p2:GetAttribute("Offset")
            if not Attribute then
                Attribute = Vector3.new(0, 0, 0)
            end
            local AttributeChangedSignal = p2:GetAttributeChangedSignal("Rotation")
            AttributeChangedSignal:Once(function() -- Line: 67 -- upvalues: calculateCameraAngle (upval), a1 (val), p2 (val), p3 (ref), p4 (val)
                calculateCameraAngle(a1, p2, p3, p4)
            end)
            local v2 = BoundingBox * v1 * CFrame.new(0, 0, 0)
            local v3 = math.rad(Attribute_2.X)
            local v4 = math.rad(Attribute_2.Y)
            local u73 = v2 * CFrame.Angles(v3, v4, (math.rad(Attribute_2.Z)))
            local v5 = v1 * BoundingBox_2
            local v6 = math.abs(v5.X)
            v3 = math.abs(v5.Y)
            v5 = Vector3.new(v6, v3, (math.abs(v5.Z)))
            v6 = math.max(v5.X, v5.Y, v5.Z)
            v3 = math.tan((math.rad(22.5)))
            if v6 == v5.X then
                v2 = math.sqrt(v5.Y * v5.Y + v5.Z * v5.Z) / 2
            elseif v6 ~= v5.Y then
                v2 = math.sqrt(v5.X * v5.X + v5.Y * v5.Y) / 2
            else
                v2 = math.sqrt(v5.X * v5.X + v5.Z * v5.Z) / 2
            end
            local u137 = v6 / 4 / v3 + v2
            local v7 = math.rad(p3)
            local v8 = u73 * CFrame.Angles(0, v7, 0)
            local v9 = v8 * CFrame.new(0, 0, u137 + u24)
            a1.CFrame = v9 * CFrame.new(Attribute)
            if p4 then
                u19(RunService.RenderStepped:Connect(function(a1_2) -- Line: 99 -- upvalues: p3 (ref), p1 (upval), a1 (val), u73 (ref), u137 (val), u24 (val), Attribute (val)
                    p3 = p3 + 0.2 * a1_2 * 60 * (p1.Speed or 1)
                    local v1 = math.rad(p3)
                    local v2 = u73 * CFrame.Angles(0, v1, 0)
                    local v3 = v2 * CFrame.new(0, 0, u137 + u24)
                    a1.CFrame = v3 * CFrame.new(Attribute)
                end))
            end
        end
        current = u4.current
        if u4.current.CurrentCamera then
            u4.current.CurrentCamera:Destroy()
        end
        local Camera = Instance.new("Camera")
        Camera.Parent = u4.current
        current.CurrentCamera = Camera
        local WorldModel = current:FindFirstChildWhichIsA("WorldModel")
        if not u13.Parent then
            if not WorldModel then
                WorldModel = Instance.new("WorldModel")
                WorldModel.Parent = current
            end
            u13:PivotTo(CFrame.new(0, 0, 0))
            u13.Parent = WorldModel
        end
        calculateCameraAngle(Camera, u13, 225, false)
        if u18 then
            u18:Disconnect()
        end
        if u8 and p1.Spins ~= false then
            calculateCameraAngle(Camera, u13, 225, true)
        end
    end, v2)
    react.useEffect(function() -- Line: 143 -- upvalues: p1 (val), u14 (val), u4 (val), u13 (val)
        if not p1.Model then
            u14(nil)
            return
        end
        if not u4.current then
            return
        end
        if not u13 then
            if u13 then
                u13:Destroy()
            end
            local v1 = p1.Model:Clone()
            if p1.Render then
                p1.Render(v1)
            end
            u14(v1)
            return
        elseif u13.Name == p1.Model.Name then
            return
        end
    end, {p1.Model, true})
    local Native = p1.Native
    if not Native then
        Native = {}
    end
    v1 = {
        Ambient = Color3.fromRGB(153, 155, 163),
        LightColor = Color3.fromRGB(219, 221, 248),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BackgroundTransparency = 1,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
        LightDirection = Vector3.new(4, 1, 2),
        ref = u4,
        ZIndex = 2,
        Visible = true,
    }
    v1[react.Event.MouseEnter] = function() -- Line: 196 -- upvalues: u9 (val)
        u9(true)
    end
    v1[react.Event.MouseLeave] = function() -- Line: 200 -- upvalues: u9 (val)
        u9(false)
    end
    return react.createElement("ViewportFrame", FillProps(Native, v1))
end