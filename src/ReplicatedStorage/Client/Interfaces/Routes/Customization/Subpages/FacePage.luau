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
--   File: ReplicatedStorage.Client.Interfaces.Routes.Customization.Subpages.FacePage
--                               Dumped in 0.00137 seconds
--                          Bytecode version 9  |  9 functions

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
local Player = require(Namespaces:WaitForChild("Player"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_2:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local Components = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Inputs = Components:WaitForChild("Inputs")
local ColorPickerInput = require(Inputs:WaitForChild("ColorPickerInput"))
local Components_2 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Inputs_2 = Components_2:WaitForChild("Inputs")
local EyePickerInput = require(Inputs_2:WaitForChild("EyePickerInput"))
local Components_3 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Inputs_3 = Components_3:WaitForChild("Inputs")
local EyePickerVariantInput = require(Inputs_3:WaitForChild("EyePickerVariantInput"))
local Components_4 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Inputs_4 = Components_4:WaitForChild("Inputs")
local ImageListInput = require(Inputs_4:WaitForChild("ImageListInput"))
local Components_5 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Primitives = Components_5:WaitForChild("Primitives")
local ScrollingFrame = require(Primitives:WaitForChild("ScrollingFrame"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Customization = Common_2:WaitForChild("Customization")
local Eyebrows = require(Customization:WaitForChild("Eyebrows"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Customization_2 = Common_3:WaitForChild("Customization")
local Eyes = require(Customization_2:WaitForChild("Eyes"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_5:WaitForChild("Common")
local Customization_3 = Common_4:WaitForChild("Customization")
local Mouths = require(Customization_3:WaitForChild("Mouths"))
local Hooks = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useStore = require(Hooks:WaitForChild("useStore"))
return function(p1) -- Line: 73 -- upvalues: react (val), useStore (val), Player (val), ScrollingFrame (val), ColorPickerInput (val), ImageListInput (val), Eyebrows (val), EyePickerInput (val), Eyes (val), EyePickerVariantInput (val), Mouths (val)
    local u12, u13, u17, u18, u22, u23, u27, u28, u7, u8, v1
    u7, u8 = react.useState(p1.Character.Decals.Iris.Color3)
    u12, u13 = react.useState(1)
    u17, u18 = react.useState(1)
    u22, u23 = react.useState(1)
    u27, u28 = react.useState(1)
    local v2 = useStore(Player.Store, function(p1) -- Line: 82
    return p1
end).client.supporter == 1
    react.useEffect(function() -- Line: 89 -- upvalues: p1 (val), u22 (val), u27 (val), u12 (val), u17 (val), u7 (val)
        p1.Updated({
            eyebrows = u22,
            mouth = u27,
            eyes = {
                variant = u12,
                frame = u17,
                color = {r = math.floor(u7.R * 255), g = math.floor(u7.G * 255), b = math.floor(u7.B * 255)},
            },
        })
    end, {
        u7,
        u12,
        u17,
        u22,
        u27,
    })
    local createElement = react.createElement
    local v3 = {Visible = p1.Enabled}
    local v4 = {Layout = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 4),
        HorizontalAlignment = Enum.HorizontalAlignment.Right,
        VerticalAlignment = Enum.VerticalAlignment.Top,
    }), ColorPicker = react.createElement(ColorPickerInput, {
        LayoutOrder = 0,
        Enabled = p1.Enabled,
        Default = u7,
        Updated = function(a1) -- Line: 123 -- upvalues: p1 (val), u8 (val)
            p1.Character.Decals.Iris.Color3 = a1
            u8(a1)
        end,
    })}
    local createElement_2 = react.createElement
    local v5 = {
        Header = "Eyebrow Selection",
        Body = "Select the style of your eyebrows.",
        LayoutOrder = 1,
        Images = Eyebrows,
        ImageSize = UDim2.fromScale(3, 3),
        ImagePosition = UDim2.fromScale(1, 1),
    }
    if not v2 then
        v1 = {
            6,
            7,
            8,
            13,
            14,
        }
    else
        v1 = {}
    end
    v5.Locked = v1
    function v5.Clicked(a1) -- Line: 141 -- upvalues: p1 (val), Eyebrows (upval), u23 (val)
        p1.Character.Decals.Eyebrows.Texture = Eyebrows[a1]
        u23(a1)
    end
    v4.EyebrowPicker = createElement_2(ImageListInput, v5)
    local createElement_3 = react.createElement
    v5 = {LayoutOrder = 2, Color = u7}
    if not v2 then
        v1 = {
            9,
            10,
            11,
            12,
            13,
            14,
        }
    else
        v1 = {}
    end
    v5.Locked = v1
    function v5.Clicked(a1) -- Line: 153 -- upvalues: p1 (val), Eyes (upval), u17 (val), u13 (val)
        p1.Character.Decals.Iris.Texture = Eyes[a1].Iris
        p1.Character.Decals.Eyes.Texture = Eyes[a1].Frames[u17]
        u13(a1)
    end
    v4.EyePicker = createElement_3(EyePickerInput, v5)
    v4.EyeFramePicker = react.createElement(EyePickerVariantInput, {
        LayoutOrder = 2,
        Color = u7,
        Eye = u12,
        Clicked = function(a1) -- Line: 166 -- upvalues: p1 (val), Eyes (upval), u12 (val), u18 (val)
            p1.Character.Decals.Iris.Texture = Eyes[u12].Iris
            p1.Character.Decals.Eyes.Texture = Eyes[u12].Frames[a1]
            u18(a1)
        end,
    })
    local createElement_4 = react.createElement
    v5 = {LayoutOrder = 3, Images = Mouths.Mouths}
    if not v2 then
        v1 = {
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
        v1 = {}
        if not v1 then
            v1 = {
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
        end
    end
    v5.Locked = v1
    function v5.Clicked(a1) -- Line: 192 -- upvalues: p1 (val), Mouths (upval), u28 (val)
        p1.Character.Decals.Mouth.Texture = Mouths.Mouths[a1]
        u28(a1)
    end
    v4.MouthPicker = createElement_4(ImageListInput, v5)
    return createElement(ScrollingFrame, v3, v4)
end