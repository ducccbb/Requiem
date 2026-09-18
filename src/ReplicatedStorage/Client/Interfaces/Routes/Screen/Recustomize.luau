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
--          File: ReplicatedStorage.Client.Interfaces.Routes.Screen.Recustomize
--                               Dumped in 0.00328 seconds
--                          Bytecode version 9  |  20 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Types = Common:WaitForChild("Types")
require(Types:WaitForChild("Data"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Network = Common_2:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Vitality = require(Namespaces:WaitForChild("Vitality"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Network_2 = Common_3:WaitForChild("Network")
local Namespaces_2 = Network_2:WaitForChild("Namespaces")
local Player = require(Namespaces_2:WaitForChild("Player"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_4:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local Components = v1.Parent.Parent.Parent:WaitForChild("Components")
local Utilities = Components:WaitForChild("Utilities")
local Color = require(Utilities:WaitForChild("Color"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_5:WaitForChild("Common")
local Utilities_2 = Common_4:WaitForChild("Utilities")
local Customization = require(Utilities_2:WaitForChild("Customization"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_6:WaitForChild("Common")
local Customization_2 = Common_5:WaitForChild("Customization")
local Extra = require(Customization_2:WaitForChild("Extra"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_7:WaitForChild("Common")
local Utilities_3 = Common_6:WaitForChild("Utilities")
local Table = require(Utilities_3:WaitForChild("Table"))
local Components_2 = v1.Parent.Parent.Parent:WaitForChild("Components")
local Inputs = Components_2:WaitForChild("Inputs")
local Button = require(Inputs:WaitForChild("Button"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Common_7 = ReplicatedStorage_8:WaitForChild("Common")
local Customization_3 = Common_7:WaitForChild("Customization")
local Eyebrows = require(Customization_3:WaitForChild("Eyebrows"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Common_8 = ReplicatedStorage_9:WaitForChild("Common")
local Customization_4 = Common_8:WaitForChild("Customization")
local Eyes = require(Customization_4:WaitForChild("Eyes"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Common_9 = ReplicatedStorage_10:WaitForChild("Common")
local Customization_5 = Common_9:WaitForChild("Customization")
local Mouths = require(Customization_5:WaitForChild("Mouths"))
local Hooks = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useStore = require(Hooks:WaitForChild("useStore"))
local Hooks_2 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useToast = require(Hooks_2:WaitForChild("useToast"))
local Components_3 = v1.Parent.Parent.Parent:WaitForChild("Components")
local Screen = Components_3:WaitForChild("Screen")
local DynamicPage = require(Screen:WaitForChild("DynamicPage"))
local Components_4 = v1.Parent.Parent.Parent:WaitForChild("Components")
local Primitives = Components_4:WaitForChild("Primitives")
local Frame = require(Primitives:WaitForChild("Frame"))
local Components_5 = v1.Parent.Parent.Parent:WaitForChild("Components")
local Primitives_2 = Components_5:WaitForChild("Primitives")
local ScrollingFrame = require(Primitives_2:WaitForChild("ScrollingFrame"))
local Components_6 = v1.Parent.Parent.Parent:WaitForChild("Components")
local Inputs_2 = Components_6:WaitForChild("Inputs")
local ColorPickerInput = require(Inputs_2:WaitForChild("ColorPickerInput"))
local Components_7 = v1.Parent.Parent.Parent:WaitForChild("Components")
local Inputs_3 = Components_7:WaitForChild("Inputs")
local EyePickerInput = require(Inputs_3:WaitForChild("EyePickerInput"))
local Components_8 = v1.Parent.Parent.Parent:WaitForChild("Components")
local Inputs_4 = Components_8:WaitForChild("Inputs")
local EyePickerVariantInput = require(Inputs_4:WaitForChild("EyePickerVariantInput"))
local Components_9 = v1.Parent.Parent.Parent:WaitForChild("Components")
local Inputs_5 = Components_9:WaitForChild("Inputs")
local ImageListInput = require(Inputs_5:WaitForChild("ImageListInput"))
return function() -- Line: 51 -- upvalues: react (val), useToast (val), useStore (val), Player (val), Vitality (val), Color (val), Customization (val), Players (val), Extra (val), DynamicPage (val), Frame (val), Button (val), Table (val), ScrollingFrame (val), ColorPickerInput (val), ImageListInput (val), Eyebrows (val), EyePickerInput (val), Eyes (val), EyePickerVariantInput (val), Mouths (val)
    local u19, u20, u24, u25, u33, u34, u38, u39, u43, u44, u48, u49, u53, u54, u58, u59, u63, u64, u68, u69, u73, u74, u78, u79, u83, u84, u92, u93
    local u3 = react.useRef(nil)
    local u7 = react.useRef(nil)
    local u11 = react.useRef(nil)
    local u15 = react.useRef(nil)
    u19, u20 = react.useState(false)
    u24, u25 = react.useState(nil)
    u33, u34 = react.useState(Color3.fromRGB(0, 0, 0))
    u38, u39 = react.useState(1)
    u43, u44 = react.useState(1)
    u48, u49 = react.useState(1)
    u53, u54 = react.useState(1)
    u58, u59 = react.useState(1)
    u63, u64 = react.useState(1)
    u68, u69 = react.useState(1)
    u73, u74 = react.useState(1)
    u78, u79 = react.useState(false)
    u83, u84 = react.useState("")
    u92, u93 = react.useState(Color3.fromRGB(0, 0, 0))
    local u95 = useToast()
    local v1 = useStore(Player.Store, function(p1) -- Line: 80
    return p1
end).client.supporter == 1
    react.useEffect(function() -- Line: 87 -- upvalues: Vitality (upval), u25 (val), u34 (val), u44 (val), u49 (val), u39 (val), u54 (val), u93 (val), u59 (val), u64 (val), u69 (val), u74 (val), u20 (val)
        Vitality.Recustomize.listen(function(p1) -- Line: 88 -- upvalues: u25 (upval), u34 (upval), u44 (upval), u49 (upval), u39 (upval), u54 (upval), u93 (upval), u59 (upval), u64 (upval), u69 (upval), u74 (upval), u20 (upval)
            local customization = p1.customization
            u25(customization)
            if customization and customization.Eyes then
                local Color = customization.Eyes.Color
                u34(Color3.fromRGB(Color.R, Color.G, Color.B))
                u44(customization.Eyes.Type)
                u49(customization.Eyes.Frame)
            end
            if customization then
                local Hair
                if customization.Eyebrow then
                    u39(customization.Eyebrow)
                end
                if customization.Mouth then
                    u54(customization.Mouth)
                end
                if customization.Hair then
                    Hair = customization.Hair
                    u93(Color3.fromRGB(Hair.R, Hair.G, Hair.B))
                end
                if customization.Burns then
                    u59(customization.Burns)
                end
                if customization.Freckles then
                    u64(customization.Freckles)
                end
                if customization.Moles then
                    u69(customization.Moles)
                end
                if customization.Scars then
                    u74(customization.Scars)
                end
            end
            u20(true)
        end)
    end, {})
    react.useEffect(function() -- Line: 134 -- upvalues: Color (upval), u92 (val), Customization (upval), u79 (val), u84 (val), u11 (val)
        local v1, v2, v3
        v1, v2 = Color.Classify(u92)
        local v4 = Customization.BANNED_COLORS[v1]
        if not v4 then
            u79(false)
        elseif table.find(v4, v2) then
            u79(true)
        end
        if v2 ~= "normal" then
            v3 = v2 .. " " .. v1
        else
            v3 = v1
        end
        u84(v3)
        local current = u11.current
        if not current then
            return
        end
        local Parent = current.Parent
        if not Parent or not (Parent:IsA("Model")) then
            return
        end
        local v5 = {}
        for i, j in Parent:GetChildren() do
            if j:IsA("Model") then
                if j:GetAttribute("CustomizationAccessory") == true then
                    table.insert(v5, j)
                end
            elseif not (j:IsA("Folder")) then
            end
        end
        if 0 < #v5 then
            Customization.updateAccessoryColors(v5, u92)
            Customization.addHairTexture(v5, u92, "rbxassetid://119283505697797")
        end
    end, {u92})
    react.useEffect(function() -- Line: 171 -- upvalues: u3 (val), u19 (val), u7 (val), Players (upval), u15 (val), u11 (val)
        if not u3.current then
            return
        else
            if not u19 then
                return
            end
            if not u7.current then
                local Camera = Instance.new("Camera")
                u7.current = Camera
                local WorldModel = Instance.new("WorldModel")
                WorldModel.Parent = u3.current
                u3.current.CurrentCamera = Camera
                local Character = Players.LocalPlayer.Character
                if not Character then
                    return
                end
                Character.Archivable = true
                local v1 = Character:Clone()
                v1:RemoveTag("Alive")
                v1:RemoveTag("Character")
                v1:SetAttribute("network_id", nil)
                v1.Parent = WorldModel
                u15.current = v1:WaitForChild("FacePanel")
                local HumanoidRootPart = v1:FindFirstChild("HumanoidRootPart")
                u11.current = HumanoidRootPart
                local v2 = HumanoidRootPart.CFrame * CFrame.new(0, 1.25, -2.5)
                local v3 = math.rad(180)
                Camera.CFrame = v2 * CFrame.Angles(0, v3, 0)
                for i, j in v1:GetChildren() do
                    if j.Name == "Bandage" then
                        j:Destroy()
                    elseif j.Name ~= "GearBoxes" and j.Name ~= "LeftGearHandle" and j.Name ~= "RightGearHandle" and j.Name ~= "Animate" and j.Name ~= "Health" and not (j:IsA("Folder")) then
                    end
                end
                return function() -- Line: 224 -- upvalues: WorldModel (val), Camera (val)
                    WorldModel:Destroy()
                    Camera:Destroy()
                end
            elseif u7.current.Parent ~= nil then
                return
            end
        end
    end, {u19})
    react.useEffect(function() -- Line: 230 -- upvalues: u19 (val), u15 (val), Customization (upval), Extra (upval), u58 (val), u63 (val), u68 (val), u73 (val)
        local current
        if not u19 or not u15.current then
            return
        end
        current = u15.current
        Customization.setFaceExtraDecal(current, "Burns", Extra.Burns, u58)
        Customization.setFaceExtraDecal(current, "Freckles", Extra.Freckles, u63)
        Customization.setFaceExtraDecal(current, "Moles", Extra.Moles, u68)
        Customization.setFaceExtraDecal(current, "Scars", Extra.Scars, u73)
    end, {
        u19,
        u58,
        u63,
        u68,
        u73,
    })
    local createElement = react.createElement
    local v2 = {}
    local createElement_2 = react.createElement
    local v3 = {BackgroundTransparency = 1, Size = UDim2.fromScale(0.8, 0.8), AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5)}
    local v4 = {}
    local v5 = {BackgroundTransparency = 1, Size = UDim2.fromScale(0.5, 1), AnchorPoint = Vector2.new(0, 0.5), Position = UDim2.fromScale(0, 0.5)}
    local v6 = {Viewport = react.createElement("ViewportFrame", {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 1),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.475),
        ImageColor3 = Color3.fromRGB(255, 255, 255),
        Ambient = Color3.fromRGB(255, 255, 255),
        LightDirection = Vector3.new(8, 4, 0),
        LightColor = Color3.fromRGB(255, 255, 255),
        ref = u3,
    })}
    local v7 = {
        Text = "Submit",
        Brightness = 1,
        Clicked = function() -- Line: 273 -- upvalues: u78 (val), u95 (val), u83 (val), u24 (val), u33 (val), u92 (val), Table (upval), u43 (val), u48 (val), u53 (val), u38 (val), u73 (val), u58 (val), u63 (val), u68 (val), u20 (val), Vitality (upval)
            if u78 then
                u95({type = "error", message = "The hair color " .. u83 .. " is not permitted, choose a new one."})
                return
            end
            if not u24 then
                u95({message = "Customization data is not available.", type = "error"})
                return
            end
            local v1 = u33
            local v2 = u92
            local v3 = {}
            local v4 = {}
            local v5 = {}
            local v6 = math.floor(v1.R * 255 + 0.5)
            v5.R = math.clamp(v6, 0, 255)
            v6 = math.floor(v1.G * 255 + 0.5)
            v5.G = math.clamp(v6, 0, 255)
            v6 = math.floor(v1.B * 255 + 0.5)
            v5.B = math.clamp(v6, 0, 255)
            v4.Color = v5
            v4.Type = u43
            v4.Frame = u48
            v3.Eyes = v4
            v3.Mouth = u53
            v3.Eyebrow = u38
            v4 = {}
            local v7 = math.floor(v2.R * 255 + 0.5)
            v4.R = math.clamp(v7, 0, 255)
            v7 = math.floor(v2.G * 255 + 0.5)
            v4.G = math.clamp(v7, 0, 255)
            v7 = math.floor(v2.B * 255 + 0.5)
            v4.B = math.clamp(v7, 0, 255)
            v3.Hair = v4
            v3.Scars = u73
            v3.Burns = u58
            v3.Freckles = u63
            v3.Moles = u68
            local v8 = Table.merge(u24, v3)
            u20(false)
            Vitality.Recustomize.post({customization = v8})
        end,
    }
    local v8 = {Position = UDim2.fromScale(0.5, 1), AnchorPoint = Vector2.new(0.5, 0.5)}
    v7.Native = v8
    v6.Submit = react.createElement(Button, v7)
    v4.Left = react.createElement(Frame, v5, v6)
    local createElement_3 = react.createElement
    v6 = {Layout = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 4),
        HorizontalAlignment = Enum.HorizontalAlignment.Right,
        VerticalAlignment = Enum.VerticalAlignment.Top,
    }), ColorPicker = react.createElement(ColorPickerInput, {
        Enabled = true,
        LayoutOrder = 0,
        Default = u33,
        Updated = function(p1) -- Line: 345 -- upvalues: u15 (val), u34 (val)
            if not u15.current then
                return
            end
            u15.current.Iris.Color3 = p1
            u34(p1)
        end,
    })}
    local createElement_4 = react.createElement
    v7 = {
        Header = "Eyebrow Selection",
        Body = "Select the style of your eyebrows.",
        LayoutOrder = 1,
        Images = Eyebrows,
        ImageSize = UDim2.fromScale(3, 3),
        ImagePosition = UDim2.fromScale(1, 1),
    }
    if not v1 then
        v8 = {
            6,
            7,
            8,
            13,
            14,
        }
    else
        v8 = {}
    end
    v7.Locked = v8
    function v7.Clicked(p1) -- Line: 367 -- upvalues: u15 (val), Eyebrows (upval), u39 (val)
        if not u15.current then
            return
        end
        u15.current.Eyebrows.Texture = Eyebrows[p1]
        u39(p1)
    end
    v6.EyebrowPicker = createElement_4(ImageListInput, v7)
    local createElement_5 = react.createElement
    v7 = {LayoutOrder = 2, Color = u33}
    if not v1 then
        v8 = {
            9,
            10,
            11,
            12,
            13,
            14,
        }
    else
        v8 = {}
    end
    v7.Locked = v8
    function v7.Clicked(p1) -- Line: 383 -- upvalues: u15 (val), Eyes (upval), u48 (val), u44 (val)
        if not u15.current then
            return
        end
        local v1 = Eyes[p1]
        u15.current.Iris.Texture = v1.Iris
        u15.current.Eyes.Texture = v1.Frames[u48]
        u44(p1)
    end
    v6.EyePicker = createElement_5(EyePickerInput, v7)
    v6.EyeFramePicker = react.createElement(EyePickerVariantInput, {
        LayoutOrder = 2,
        Color = u33,
        Eye = u43,
        Clicked = function(p1) -- Line: 401 -- upvalues: u15 (val), u43 (val), Eyes (upval), u49 (val)
            if not u15.current then
                return
            end
            local v1 = Eyes[u43]
            u15.current.Iris.Texture = v1.Iris
            u15.current.Eyes.Texture = v1.Frames[p1]
            u49(p1)
        end,
    })
    local createElement_6 = react.createElement
    v7 = {LayoutOrder = 3, Images = Mouths.Mouths}
    if not v1 then
        v8 = {
            5,
            6,
            14,
            15,
            16,
            22,
            23,
            24,
            25,
            26,
            27,
        }
    else
        v8 = {}
    end
    v7.Locked = v8
    function v7.Clicked(p1) -- Line: 434 -- upvalues: u15 (val), Mouths (upval), u54 (val)
        if not u15.current then
            return
        end
        local v1 = Mouths.Mouths[p1]
        if v1 then
            u15.current.Mouth.Texture = v1
        end
        u54(p1)
    end
    v6.MouthPicker = createElement_6(ImageListInput, v7)
    v6.HairColorPicker = react.createElement(ColorPickerInput, {
        Enabled = true,
        LayoutOrder = 5,
        Header = "Hair Color",
        Body = "Your lore character's hair color.",
        Default = u92,
        Updated = function(p1) -- Line: 456 -- upvalues: u93 (val)
            u93(p1)
        end,
    })
    local createElement_7 = react.createElement
    v7 = {
        Header = "Burns",
        Body = "Select the burns on your character's skin.",
        LayoutOrder = 6,
        ImageSize = UDim2.fromScale(0.9, 0.9),
        ImagePosition = UDim2.fromScale(0.5, 0.5),
        Images = Extra.Burns,
    }
    if not v1 then
        v8 = {
            1,
            2,
            3,
            4,
            5,
            6,
            7,
        }
    else
        v8 = {}
    end
    v7.Locked = v8
    function v7.Clicked(p1) -- Line: 473 -- upvalues: u15 (val), Customization (upval), Extra (upval), u59 (val)
        if not u15.current then
            return
        end
        Customization.setFaceExtraDecal(u15.current, "Burns", Extra.Burns, p1)
        u59(p1)
    end
    v6.BurnPicker = createElement_7(ImageListInput, v7)
    local createElement_8 = react.createElement
    v7 = {
        Header = "Freckles",
        Body = "Select the freckles on your character's skin.",
        LayoutOrder = 7,
        ImageSize = UDim2.fromScale(0.9, 0.9),
        ImagePosition = UDim2.fromScale(0.5, 0.5),
        Images = Extra.Freckles,
    }
    if not v1 then
        v8 = {
            5,
            6,
            7,
            8,
            9,
            10,
            11,
            12,
            13,
        }
    else
        v8 = {}
    end
    v7.Locked = v8
    function v7.Clicked(p1) -- Line: 495 -- upvalues: u15 (val), Customization (upval), Extra (upval), u64 (val)
        if not u15.current then
            return
        end
        Customization.setFaceExtraDecal(u15.current, "Freckles", Extra.Freckles, p1)
        u64(p1)
    end
    v6.FrecklesPicker = createElement_8(ImageListInput, v7)
    local createElement_9 = react.createElement
    v7 = {
        Header = "Moles",
        Body = "Select the moles on your character's skin.",
        LayoutOrder = 8,
        ImageSize = UDim2.fromScale(0.9, 0.9),
        ImagePosition = UDim2.fromScale(0.5, 0.5),
        Images = Extra.Moles,
    }
    if not v1 then
        v8 = {6, 7}
    else
        v8 = {}
    end
    v7.Locked = v8
    function v7.Clicked(p1) -- Line: 517 -- upvalues: u15 (val), Customization (upval), Extra (upval), u69 (val)
        if not u15.current then
            return
        end
        Customization.setFaceExtraDecal(u15.current, "Moles", Extra.Moles, p1)
        u69(p1)
    end
    v6.MolesPicker = createElement_9(ImageListInput, v7)
    local createElement_10 = react.createElement
    v7 = {
        Header = "Scars",
        Body = "Select the scars on your character's skin.",
        LayoutOrder = 9,
        ImageSize = UDim2.fromScale(0.9, 0.9),
        ImagePosition = UDim2.fromScale(0.5, 0.5),
        Images = Extra.Scars,
    }
    if not v1 then
        v8 = {
            1,
            2,
            3,
            4,
            5,
            6,
            7,
            8,
            9,
            10,
            11,
        }
    else
        v8 = {}
        if not v8 then
            v8 = {
                1,
                2,
                3,
                4,
                5,
                6,
                7,
                8,
                9,
                10,
                11,
            }
        end
    end
    v7.Locked = v8
    function v7.Clicked(p1) -- Line: 539 -- upvalues: u15 (val), Customization (upval), Extra (upval), u74 (val)
        if not u15.current then
            return
        end
        Customization.setFaceExtraDecal(u15.current, "Scars", Extra.Scars, p1)
        u74(p1)
    end
    v6.ScarsPicker = createElement_10(ImageListInput, v7)
    v4.Right = createElement_3(ScrollingFrame, {Visible = true}, v6)
    v2.Content = createElement_2("Frame", v3, v4)
    return createElement(DynamicPage, {Enabled = u19}, v2)
end