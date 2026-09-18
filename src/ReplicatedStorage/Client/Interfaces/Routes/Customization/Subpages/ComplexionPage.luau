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
--File: ReplicatedStorage.Client.Interfaces.Routes.Customization.Subpages.ComplexionPage
--                               Dumped in 0.00126 seconds
--                          Bytecode version 9  |  13 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Customization = Common:WaitForChild("Customization")
local Extra = require(Customization:WaitForChild("Extra"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_2:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Network = Common_2:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Player = require(Namespaces:WaitForChild("Player"))
local Components = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Inputs = Components:WaitForChild("Inputs")
local ColorSliderInput = require(Inputs:WaitForChild("ColorSliderInput"))
local Components_2 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Inputs_2 = Components_2:WaitForChild("Inputs")
local ImageListInput = require(Inputs_2:WaitForChild("ImageListInput"))
local Components_3 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Inputs_3 = Components_3:WaitForChild("Inputs")
local NumberSliderInput = require(Inputs_3:WaitForChild("NumberSliderInput"))
local Components_4 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Primitives = Components_4:WaitForChild("Primitives")
local ScrollingFrame = require(Primitives:WaitForChild("ScrollingFrame"))
local Hooks = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useStore = require(Hooks:WaitForChild("useStore"))
local u159 = Color3.fromRGB(206, 156, 127)
return function(p1) -- Line: 63 -- upvalues: react (val), u159 (val), useStore (val), Player (val), ScrollingFrame (val), ColorSliderInput (val), NumberSliderInput (val), ImageListInput (val), Extra (val)
    local u10, u14, u15, u19, u20, u24, u25, u29, u30, u34, u35, u4, u5, u9
    u4, u5 = react.useState(u159)
    u9, u10 = react.useState(0.5)
    u14, u15 = react.useState(0.85)
    u19, u20 = react.useState(1)
    u24, u25 = react.useState(1)
    u29, u30 = react.useState(1)
    u34, u35 = react.useState(1)
    local v1 = {}
    local u40 = react.useMemo(function() -- Line: 73 -- upvalues: p1 (val)
        local Head = p1.Character:WaitForChild("Head")
        return Head:WaitForChild("Decals").C0
    end, v1)
    v1 = useStore(Player.Store, function(p1) -- Line: 78
    return p1
end).client.supporter == 1
    react.useEffect(function() -- Line: 85 -- upvalues: p1 (val), u4 (val)
        for k, v in pairs(p1.Character:GetChildren()) do
            if v:IsA("BasePart") then
                v.Color = u4
            end
        end
    end, {u4})
    react.useEffect(function() -- Line: 93 -- upvalues: p1 (val), u40 (val), u9 (val), u14 (val), u19 (val), u24 (val), u29 (val), u34 (val)
        local Head = p1.Character:WaitForChild("Head")
        if not Head then
            return
        end
        Head.Decals.C0 = u40 * CFrame.new(0, (0.5 - u9) / 6, 0)
        p1.Updated({
            complexion = u14,
            face_height = u9,
            burns = u19,
            freckles = u24,
            moles = u29,
            scars = u34,
        })
    end, {
        u9,
        u14,
        u19,
        u24,
        u29,
        u34,
    })
    local createElement = react.createElement
    local v2 = {Visible = p1.Enabled}
    local v3 = {Layout = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 4),
        HorizontalAlignment = Enum.HorizontalAlignment.Right,
        VerticalAlignment = Enum.VerticalAlignment.Top,
    }), ColorSliderInput = react.createElement(ColorSliderInput, {
        DefaultPercent = 0.85,
        Header = "Skin Complexion",
        Body = "Your character's skin tone and complexion.",
        Initial = u159,
        Range = {Min = 0.25, Max = 0.975},
        Update = function(p1, p2) -- Line: 136 -- upvalues: u15 (val)
            u15(p2)
        end,
        Stepped = function(p1) -- Line: 141 -- upvalues: u5 (val)
            u5(p1)
        end,
    })}
    local v4 = {
        Initial = 0.5,
        Header = "Face Height",
        Body = "Adjust the height of your face.",
        Update = u10,
        Stepped = function(a1) -- Line: 153 -- upvalues: p1 (val), u10 (val)
            local Head
            if not (p1.Character:FindFirstChild("Head")) then
                p1.Character:WaitForChild("Head")
            end
            u10(a1)
        end,
    }
    local v5 = {LayoutOrder = 10, Size = UDim2.fromScale(0.417, 0.133)}
    v4.Native = v5
    v3.Height = react.createElement(NumberSliderInput, v4)
    local createElement_2 = react.createElement
    v4 = {
        Header = "Burns",
        Body = "Select the burns on your character's skin.",
        LayoutOrder = 3,
        ImageSize = UDim2.fromScale(0.9, 0.9),
        ImagePosition = UDim2.fromScale(0.5, 0.5),
        Images = Extra.Burns,
    }
    if not v1 then
        v5 = {
            1,
            2,
            3,
            4,
            5,
            6,
            7,
        }
    else
        v5 = {}
    end
    v4.Locked = v5
    function v4.Clicked(a1) -- Line: 179 -- upvalues: p1 (val), Extra (upval), u20 (val)
        p1.Character.Decals.Burns.Texture = Extra.Burns[a1]
        u20(a1)
    end
    v3.BurnPicker = createElement_2(ImageListInput, v4)
    local createElement_3 = react.createElement
    v4 = {
        Header = "Freckles",
        Body = "Select the freckles on your character's skin.",
        LayoutOrder = 3,
        ImageSize = UDim2.fromScale(0.9, 0.9),
        ImagePosition = UDim2.fromScale(0.5, 0.5),
        Images = Extra.Freckles,
    }
    if not v1 then
        v5 = {
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
        v5 = {}
    end
    v4.Locked = v5
    function v4.Clicked(a1) -- Line: 197 -- upvalues: p1 (val), Extra (upval), u25 (val)
        p1.Character.Decals.Freckles.Texture = Extra.Freckles[a1]
        u25(a1)
    end
    v3.FrecklesPicker = createElement_3(ImageListInput, v4)
    local createElement_4 = react.createElement
    v4 = {
        Header = "Moles",
        Body = "Select the moles on your character's skin.",
        LayoutOrder = 3,
        ImageSize = UDim2.fromScale(0.9, 0.9),
        ImagePosition = UDim2.fromScale(0.5, 0.5),
        Images = Extra.Moles,
    }
    if not v1 then
        v5 = {6, 7}
    else
        v5 = {}
    end
    v4.Locked = v5
    function v4.Clicked(a1) -- Line: 215 -- upvalues: p1 (val), Extra (upval), u30 (val)
        p1.Character.Decals.Moles.Texture = Extra.Moles[a1]
        u30(a1)
    end
    v3.MolesPicker = createElement_4(ImageListInput, v4)
    local createElement_5 = react.createElement
    v4 = {
        Header = "Scars",
        Body = "Select the scars on your character's skin.",
        LayoutOrder = 3,
        ImageSize = UDim2.fromScale(0.9, 0.9),
        ImagePosition = UDim2.fromScale(0.5, 0.5),
        Images = Extra.Scars,
    }
    if not v1 then
        v5 = {
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
        v5 = {}
        if not v5 then
            v5 = {
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
    v4.Locked = v5
    function v4.Clicked(a1) -- Line: 233 -- upvalues: p1 (val), Extra (upval), u35 (val)
        p1.Character.Decals.Scars.Texture = Extra.Scars[a1]
        u35(a1)
    end
    v3.ScarsPicker = createElement_5(ImageListInput, v4)
    return createElement(ScrollingFrame, v2, v3)
end