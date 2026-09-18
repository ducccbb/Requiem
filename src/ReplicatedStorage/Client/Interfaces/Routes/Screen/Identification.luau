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
--        File: ReplicatedStorage.Client.Interfaces.Routes.Screen.Identification
--                               Dumped in 0.00155 seconds
--                          Bytecode version 9  |  11 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local Components = v1.Parent.Parent.Parent:WaitForChild("Components")
local Universal = Components:WaitForChild("Universal")
local Form = require(Universal:WaitForChild("Form"))
local Components_2 = v1.Parent.Parent.Parent:WaitForChild("Components")
local Universal_2 = Components_2:WaitForChild("Universal")
local HeaderBodyComponent = require(Universal_2:WaitForChild("HeaderBodyComponent"))
local Components_3 = v1.Parent.Parent.Parent:WaitForChild("Components")
local Universal_3 = Components_3:WaitForChild("Universal")
local RigViewport = require(Universal_3:WaitForChild("RigViewport"))
local Components_4 = v1.Parent.Parent.Parent:WaitForChild("Components")
local Utilities = Components_4:WaitForChild("Utilities")
local TransparencyGroup = require(Utilities:WaitForChild("TransparencyGroup"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Utilities_2 = Common:WaitForChild("Utilities")
local State = require(Utilities_2:WaitForChild("State"))
local function createIdentificationPage(p1) -- Line: 23 -- upvalues: State (val), react (val), Form (val), HeaderBodyComponent (val), RigViewport (val)
    local data, district, eyeColor, hairColor, height, identification, identification_2, name, u12, v1
    _, _, identification, identification_2 = State("identification")
    v1, u12 = react.useState(identification_2())
    local v2 = {}
    react.useEffect(function() -- Line: 28 -- upvalues: identification (val), u12 (val)
        local u2 = identification(u12)
        return function() -- Line: 30 -- upvalues: u2 (val)
            if u2 then
                u2()
            end
        end
    end, v2)
    if not v1 then
        data = nil
    else
        data = v1.data
    end
    if not data then
        name = "Unknown"
    else
        name = data.name
    end
    if not data then
        v2 = "Unknown"
    else
        v2 = tostring(data.age)
    end
    if not data then
        district = "Unknown"
    else
        district = data.district
    end
    if not data then
        eyeColor = "Unknown"
    else
        eyeColor = data.eyeColor
    end
    if not data then
        hairColor = "Unknown"
    else
        hairColor = data.hairColor
    end
    if not data then
        height = "Unknown"
    else
        height = data.height
        if not height then
            height = "Unknown"
        end
    end
    local v3 = {
        Image = "rbxassetid://17327751435",
        BackgroundTransparency = 0,
        ClipsDescendants = true,
        Size = UDim2.fromScale(0.3, 0.4),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        AutoButtonColor = false,
    }
    v3[react.Event.MouseButton1Click] = function() -- Line: 57 -- upvalues: p1 (val)
        if p1.closePopup then
            p1.closePopup()
        end
        if p1.Closed then
            p1.Closed()
        end
    end
    local v4 = {InformationHolder = react.createElement("Frame", {BackgroundTransparency = 1, Size = UDim2.fromScale(0.65, 1), Position = UDim2.fromScale(0.65, 0.2), AnchorPoint = Vector2.new(0.5, 0.05)}, {
        LeftIdentification = react.createElement(Form.Divider, {
            Side = "Left",
            Alignment = Enum.VerticalAlignment.Top,
            Native = {LayoutOrder = 1, BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1)},
        }, {Header = react.createElement(HeaderBodyComponent, {
            Header = "Name",
            Wrap = true,
            Body = name,
            Colors = {Header = Color3.fromRGB(12, 10, 10), Body = Color3.fromRGB(12, 10, 10)},
        })}),
        LeftAge = react.createElement(Form.Divider, {
            Side = "Left",
            Alignment = Enum.VerticalAlignment.Top,
            Native = {LayoutOrder = 2, BackgroundTransparency = 1, Size = UDim2.fromScale(1, 0.7)},
        }, {Header = react.createElement(HeaderBodyComponent, {
            Header = "Age",
            Wrap = true,
            Body = v2,
            Colors = {Header = Color3.fromRGB(12, 10, 10), Body = Color3.fromRGB(12, 10, 10)},
        })}),
        LeftGender = react.createElement(Form.Divider, {
            Side = "Left",
            Alignment = Enum.VerticalAlignment.Top,
            Native = {LayoutOrder = 3, BackgroundTransparency = 1, Size = UDim2.fromScale(1, 0.4)},
        }, {Header = react.createElement(HeaderBodyComponent, {
            Header = "Gender",
            Body = "Unknown",
            Wrap = true,
            Colors = {Header = Color3.fromRGB(12, 10, 10), Body = Color3.fromRGB(12, 10, 10)},
        })}),
        LeftDistrict = react.createElement(Form.Divider, {
            Side = "Left",
            Alignment = Enum.VerticalAlignment.Top,
            Native = {LayoutOrder = 4, BackgroundTransparency = 1, Size = UDim2.fromScale(1, 0.1)},
        }, {Header = react.createElement(HeaderBodyComponent, {
            Header = "Home District",
            Wrap = true,
            Body = district,
            Colors = {Header = Color3.fromRGB(12, 10, 10), Body = Color3.fromRGB(12, 10, 10)},
        })}),
        RightEyeColor = react.createElement(Form.Divider, {
            Side = "Right",
            Alignment = Enum.VerticalAlignment.Top,
            Native = {LayoutOrder = 5, BackgroundTransparency = 1, Size = UDim2.fromScale(0, 1)},
        }, {Header = react.createElement(HeaderBodyComponent, {
            Header = "Eye Color",
            Wrap = true,
            Body = eyeColor,
            Colors = {Header = Color3.fromRGB(12, 10, 10), Body = Color3.fromRGB(12, 10, 10)},
        })}),
        RightHairColor = react.createElement(Form.Divider, {
            Side = "Right",
            Alignment = Enum.VerticalAlignment.Top,
            Native = {LayoutOrder = 6, BackgroundTransparency = 1, Size = UDim2.fromScale(0, 0.7)},
        }, {Header = react.createElement(HeaderBodyComponent, {
            Header = "Hair Color",
            Wrap = true,
            Body = hairColor,
            Colors = {Header = Color3.fromRGB(12, 10, 10), Body = Color3.fromRGB(12, 10, 10)},
        })}),
        RightDateOfBirth = react.createElement(Form.Divider, {
            Side = "Right",
            Alignment = Enum.VerticalAlignment.Top,
            Native = {LayoutOrder = 7, BackgroundTransparency = 1, Size = UDim2.fromScale(0, 0.4)},
        }, {Header = react.createElement(HeaderBodyComponent, {
            Header = "Date of Birth",
            Body = "Unknown",
            Wrap = true,
            Colors = {Header = Color3.fromRGB(12, 10, 10), Body = Color3.fromRGB(12, 10, 10)},
        })}),
        RightHeight = react.createElement(Form.Divider, {
            Side = "Right",
            Alignment = Enum.VerticalAlignment.Top,
            Native = {LayoutOrder = 8, BackgroundTransparency = 1, Size = UDim2.fromScale(0, 0.1)},
        }, {Header = react.createElement(HeaderBodyComponent, {
            Header = "Height",
            Wrap = true,
            Body = height,
            Colors = {Header = Color3.fromRGB(12, 10, 10), Body = Color3.fromRGB(12, 10, 10)},
        })}),
    })}
    local v5 = {BackgroundTransparency = 1, Size = UDim2.fromScale(0.3, 0.5), Position = UDim2.fromScale(0.01, 0.18)}
    local v6 = {FrameOutline = react.createElement("UIStroke", {Transparency = 0.6, Thickness = 2, Color = Color3.fromRGB(12, 10, 10)})}
    local v7 = {
        Side = "Right",
        Alignment = Enum.VerticalAlignment.Top,
        Native = {BackgroundTransparency = 0, Size = UDim2.fromScale(1, 1)},
    }
    local v8 = {}
    local v9 = {
        Native = {BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1)},
    }
    local model = data
    if model then
        model = data.model
    end
    v9.Model = model
    v8.PlayerViewPort = react.createElement(RigViewport, v9)
    v6.RightIdentification = react.createElement(Form.Divider, v7, v8)
    v4.RightInformation = react.createElement("Frame", v5, v6)
    return react.createElement(react.Fragment, {}, react.createElement("ImageButton", v3, v4))
end
return function() -- Line: 272 -- upvalues: State (val), react (val), TransparencyGroup (val), createIdentificationPage (val)
    local identification, identification_2, identification_3, u10, v1
    identification, _, identification_2, identification_3 = State("identification")
    v1, u10 = react.useState(function() -- Line: 275 -- upvalues: identification_3 (val)
        local v1
        local v2 = identification_3()
        if not v2 then
            v1 = false
        else
            v1 = not (v2.visible ~= true)
        end
        return v1
    end)
    react.useEffect(function() -- Line: 280 -- upvalues: identification_2 (val), u10 (val)
        local u2 = identification_2(function(p1) -- Line: 281 -- upvalues: u10 (upval)
            local v1
            if not p1 then
                v1 = false
            else
                v1 = not (p1.visible ~= true)
            end
            u10(v1)
        end)
        return function() -- Line: 285 -- upvalues: u2 (val)
            if u2 then
                u2()
            end
        end
    end, {})
    return react.createElement(TransparencyGroup, {Enabled = v1, Tween = TweenInfo.new(0.2)}, {Backdrop = react.createElement("Frame", {BackgroundTransparency = 0.35, BorderSizePixel = 0, BackgroundColor3 = Color3.fromRGB(0, 0, 0), Size = UDim2.fromScale(1, 1)}, {Modal = react.createElement("Frame", {BackgroundTransparency = 1, AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5), Size = UDim2.fromScale(0.7, 0.6)}, {Identification = react.createElement(createIdentificationPage, {
        Closed = function() -- Line: 309 -- upvalues: identification (val)
            identification(nil)
        end,
    })})})})
end