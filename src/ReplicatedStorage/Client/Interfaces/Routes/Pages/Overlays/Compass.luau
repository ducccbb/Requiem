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
--        File: ReplicatedStorage.Client.Interfaces.Routes.Pages.Overlays.Compass
--                               Dumped in 0.00105 seconds
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
local Components = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Displays = Components:WaitForChild("Displays")
local Compass = require(Displays:WaitForChild("Compass"))
local Hooks = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useInterfaceState = require(Hooks:WaitForChild("useInterfaceState"))
local xAxis = Vector3.xAxis
local u65 = xAxis * -1
local zAxis = Vector3.zAxis
local u67 = zAxis * -1
return function() -- Line: 34 -- upvalues: react (val), useInterfaceState (val), RunService (val), xAxis (val), u65 (val), zAxis (val), u67 (val), Compass (val)
    local compass, u3, u4, v1
    u3, u4 = react.useState(0)
    local u8 = react.useRef(nil)
    _, compass = useInterfaceState("compass")
    local function rotationToFaceInDirection(p1, p2) -- Line: 40
        local v1 = CFrame.new(p1.CFrame.Position, p1.CFrame.Position + Vector3.new(p1.CFrame.LookVector.X, 0, p1.CFrame.LookVector.Z)):VectorToObjectSpace(p2)
        local v2 = Vector3.new(v1.X, 0, v1.Z)
        return (math.atan2(v2.X, -v2.Z))
    end
    react.useEffect(function() -- Line: 53 -- upvalues: compass (val), RunService (upval), rotationToFaceInDirection (val), xAxis (upval), u4 (val)
        if not compass then
            return
        end
        local u6 = RunService.RenderStepped:Connect(function() -- Line: 58 -- upvalues: rotationToFaceInDirection (upval), xAxis (upval), u4 (upval)
            local v1 = rotationToFaceInDirection(workspace.CurrentCamera, xAxis)
            u4((math.deg(v1)))
        end)
        return function() -- Line: 65 -- upvalues: u6 (val)
            u6:Disconnect()
        end
    end, {compass})
    react.useEffect(function() -- Line: 70 -- upvalues: u8 (val), u3 (val), rotationToFaceInDirection (val), u65 (upval), zAxis (upval), u67 (upval), Compass (upval)
        local Label, v1, v2, v3, v4
        if not u8.current then
            return
        end
        local CurrentCamera = workspace.CurrentCamera
        local v5 = u3 / 120 + 0.5
        local v6 = math.deg((rotationToFaceInDirection(CurrentCamera, u65))) / 120 + 0.5
        local v7 = math.deg((rotationToFaceInDirection(CurrentCamera, zAxis))) / 120 + 0.5
        local v8 = math.deg((rotationToFaceInDirection(CurrentCamera, u67))) / 120 + 0.5
        local function getFrame(p1, p2, p3) -- Line: 85 -- upvalues: u8 (upval), Compass (upval)
            if not (u8.current:FindFirstChild(p1)) then
                local v1
                if not p2 then
                    v1 = Compass.CreateCompassDirectionFrame(p1)
                elseif not p3 then
                    v1 = Compass.CreateCompassDirectionFrame(p1)
                else
                    v1 = Compass.CreateCompassNodeFrame(p1, p3)
                    if not v1 then
                        v1 = Compass.CreateCompassDirectionFrame(p1)
                    end
                end
                v1.Parent = u8.current
            end
            return (u8.current:FindFirstChild(p1))
        end
        local function getTickFrame(p1) -- Line: 96 -- upvalues: u8 (upval)
            if not (u8.current:FindFirstChild(p1)) then
                local Frame = Instance.new("Frame")
                Frame.Name = p1
                Frame.AnchorPoint = Vector2.new(0.5, 0.5)
                Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Frame.BackgroundTransparency = 0
                Frame.BorderSizePixel = 0
                Frame.Position = UDim2.fromScale(0.5, 0)
                Frame.Size = UDim2.new(0, 1, 0.4, 0)
                Frame.ZIndex = 0
                Frame.Parent = u8.current
                local TextLabel = Instance.new("TextLabel")
                TextLabel.Name = "Label"
                TextLabel.AnchorPoint = Vector2.new(0.5, 0)
                TextLabel.BackgroundTransparency = 1
                TextLabel.Position = UDim2.new(0.5, 0, 1.25, 0)
                TextLabel.Text = tostring((tonumber(p1) or 0) + 180)
                TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                TextLabel.TextScaled = true
                TextLabel.Size = UDim2.new(0, 50, 0.7, 0)
                TextLabel.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
                TextLabel.Parent = Frame
            end
            return (u8.current:FindFirstChild(p1))
        end
        local N = getFrame("N")
        N.Position = UDim2.new(v5, 0, 0.5, 0)
        N.GroupTransparency = math.abs(v5 - 0.5) * 2
        local S = getFrame("S")
        S.Position = UDim2.new(v6, 0, 0.5, 0)
        S.GroupTransparency = math.abs(v6 - 0.5) * 2
        local E = getFrame("E")
        E.Position = UDim2.new(v7, 0, 0.5, 0)
        E.GroupTransparency = math.abs(v7 - 0.5) * 2
        local W = getFrame("W")
        W.Position = UDim2.new(v8, 0, 0.5, 0)
        W.GroupTransparency = math.abs(v8 - 0.5) * 2
        local v9 = 180
        local v10 = 15
        for i = -180, v9, v10 do
            if math.abs(i) % 90 ~= 0 then
                v4 = math.rad(i)
                v1 = CFrame.new() * CFrame.Angles(0, v4, 0).LookVector
                v2 = math.deg((rotationToFaceInDirection(CurrentCamera, v1))) / 120 + 0.5
                v3 = tostring(i)
                v4 = getTickFrame(v3)
                v4.Position = UDim2.new(v2, 0, 0.4, 0)
                v4.BackgroundTransparency = math.abs(v2 - 0.5) * 2
                Label = v4:FindFirstChild("Label")
                Label.TextTransparency = math.abs(v2 - 0.5) * 2
            end
        end
    end, {u3})
    local v2 = {Ref = u8}
    if compass ~= nil then
        v1 = compass
    else
        v1 = false
    end
    v2.Visible = v1
    return react.createElement(Compass.CompassComponent, v2)
end