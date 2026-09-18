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
--      File: ReplicatedStorage.Client.Interfaces.Components.Universal.ItemViewport
--                               Dumped in 0.00165 seconds
--                          Bytecode version 9  |  12 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local RunService = game:GetService("RunService")
local Providers = v1.Parent.Parent.Parent:WaitForChild("Providers")
local SettingProvider = require(Providers:WaitForChild("SettingProvider"))
local Utilities = v1.Parent.Parent:WaitForChild("Utilities")
local FillProps = require(Utilities:WaitForChild("FillProps"))
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
return function(p1) -- Line: 37 -- upvalues: react (val), SettingProvider (val), RunService (val), FillProps (val)
    local u13, u14, u18, u19, u23, u24, u8, u9, v1, v2, v3, v4
    local u4 = react.useRef(nil)
    u8, u9 = react.useState(false)
    u13, u14 = react.useState(nil)
    u18, u19 = react.useState(nil)
    u23, u24 = react.useState(false)
    local u29 = react.useContext(SettingProvider.SettingContext)
    if p1.Background == nil then
        v1 = false
    else
        v1 = true
        if p1.Background == true then end
    end
    react.useEffect(function() -- Line: 49 -- upvalues: u29 (val), u24 (val)
        local settings
        if not u29 then
            settings = {}
        else
            settings = u29.settings
            if not settings then
                settings = {}
            end
        end
        local v1 = settings
        if v1 then
            v1 = settings.Interface.Performance[2].Value == 1
        end
        u24(v1)
    end, {u29})
    react.useEffect(function() -- Line: 55 -- upvalues: u4 (val), p1 (val), u13 (val), u23 (val), u19 (val), RunService (upval), u18 (val), u8 (val)
        local calculateCameraAngle, current
        if not u4.current or not p1.Model or not u13 or not u23 then
            return
        end
        function calculateCameraAngle(a1, p2, p3, p4) -- Line: 71 -- upvalues: calculateCameraAngle (val), u19 (upval), RunService (upval), p1 (upval)
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
            AttributeChangedSignal:Once(function() -- Line: 79 -- upvalues: calculateCameraAngle (upval), a1 (val), p2 (val), p3 (ref), p4 (val)
                calculateCameraAngle(a1, p2, p3, p4)
            end)
            local AttributeChangedSignal_2 = p2:GetAttributeChangedSignal("Scale")
            AttributeChangedSignal_2:Once(function() -- Line: 84 -- upvalues: calculateCameraAngle (upval), a1 (val), p2 (val), p3 (ref), p4 (val)
                calculateCameraAngle(a1, p2, p3, p4)
            end)
            local AttributeChangedSignal_3 = p2:GetAttributeChangedSignal("Offset")
            AttributeChangedSignal_3:Once(function() -- Line: 89 -- upvalues: calculateCameraAngle (upval), a1 (val), p2 (val), p3 (ref), p4 (val)
                calculateCameraAngle(a1, p2, p3, p4)
            end)
            local v2 = BoundingBox * v1 * CFrame.new(0, 0, 0)
            local v3 = math.rad(Attribute_2.X)
            local v4 = math.rad(Attribute_2.Y)
            local u89 = v2 * CFrame.Angles(v3, v4, (math.rad(Attribute_2.Z)))
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
            local u153 = v6 / 5 / v3 + v2
            local v7 = math.rad(p3)
            local v8 = u89 * CFrame.Angles(0, v7, 0)
            local v9 = v8 * CFrame.new(0, 0, u153 + u24)
            a1.CFrame = v9 * CFrame.new(Attribute)
            if p4 then
                u19(RunService.RenderStepped:Connect(function(a1_2) -- Line: 121 -- upvalues: p3 (ref), p1 (upval), a1 (val), u89 (ref), u153 (val), u24 (val), Attribute (val)
                    p3 = p3 + 0.2 * a1_2 * 60 * (p1.Speed or 1)
                    local v1 = math.rad(p3)
                    local v2 = u89 * CFrame.Angles(0, v1, 0)
                    local v3 = v2 * CFrame.new(0, 0, u153 + u24)
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
        calculateCameraAngle(Camera, u13, 180, false)
        if u18 then
            u18:Disconnect()
        end
        if u8 and p1.Spins ~= false then
            calculateCameraAngle(Camera, u13, 180, true)
        end
    end, {u4.current, u13, u8, u23})
    react.useEffect(function() -- Line: 165 -- upvalues: p1 (val), u14 (val), u23 (val), u13 (val), u4 (val)
        if not p1.Model then
            u14(nil)
            return
        end
        if not u23 then
            if u13 then
                u13:Destroy()
            end
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
    end, {p1.Model, u23})
    local createElement = react.createElement
    local Native = p1.Native
    if not Native then
        Native = {}
    end
    v3 = {BackgroundTransparency = 1, AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5), Size = UDim2.fromScale(1, 1)}
    local v5 = FillProps(Native, v3)
    v2 = {}
    local v6 = {
        Ambient = Color3.fromRGB(121, 121, 121),
        LightColor = Color3.fromRGB(201, 201, 201),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BackgroundTransparency = 1,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
        LightDirection = Vector3.new(0.5, -2, 1),
        ref = u4,
        ZIndex = 2,
        Visible = u23,
    }
    v6[react.Event.MouseEnter] = function() -- Line: 226 -- upvalues: u9 (val)
        u9(true)
    end
    v6[react.Event.MouseLeave] = function() -- Line: 230 -- upvalues: u9 (val)
        u9(false)
    end
    v2.Viewport = react.createElement("ViewportFrame", v6)
    if not v1 then
        v3 = nil
    else
        v6 = {ZIndex = 1}
        local BackgroundColor3 = p1.BackgroundColor3
        if not BackgroundColor3 then
            BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        end
        v6.BackgroundColor3 = BackgroundColor3
        if not p1.BackgroundColor3 then
            v4 = 1
        else
            v4 = 0
        end
        v6.BackgroundTransparency = v4
        v6.Size = UDim2.fromScale(1, 1)
        v6.AnchorPoint = Vector2.new(0.5, 0.5)
        v6.Position = UDim2.fromScale(0.5, 0.5)
        v6.Visible = u23
        v3 = react.createElement("Frame", v6, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 5)})})
        if not v3 then
            v3 = nil
        end
    end
    v2.Background = v3
    return createElement("Frame", v5, v2, p1.children)
end