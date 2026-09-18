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
--   File: ReplicatedStorage.Client.Interfaces.Routes.Customization.Subpages.HairPage
--                              Dumped in 0.000742 seconds
--                          Bytecode version 9  |  4 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local Components = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Utilities = Components:WaitForChild("Utilities")
local Color = require(Utilities:WaitForChild("Color"))
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local Components_2 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Inputs = Components_2:WaitForChild("Inputs")
local ColorPickerInput = require(Inputs:WaitForChild("ColorPickerInput"))
local Components_3 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Inputs_2 = Components_3:WaitForChild("Inputs")
local ErrorInput = require(Inputs_2:WaitForChild("ErrorInput"))
local Components_4 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Primitives = Components_4:WaitForChild("Primitives")
local Frame = require(Primitives:WaitForChild("Frame"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Utilities_2 = Common:WaitForChild("Utilities")
local Customization = require(Utilities_2:WaitForChild("Customization"))
return function(p1) -- Line: 41 -- upvalues: react (val), Customization (val), Color (val), Frame (val), ColorPickerInput (val), ErrorInput (val)
    local u12, u17, u6, u7, v1, v2
    u6, u7 = react.useState(Customization.getRandomHairColor())
    v1, u12 = react.useState(false)
    v2, u17 = react.useState("")
    react.useEffect(function() -- Line: 46 -- upvalues: Color (upval), u6 (val), Customization (upval), u12 (val), p1 (val), u17 (val)
        local v1, v2, v3
        v1, v2 = Color.Classify(u6)
        local v4 = Customization.BANNED_COLORS[v1]
        if not v4 then
            u12(false)
            p1.Updated(false, u6)
        elseif table.find(v4, v2) then
            u12(true)
            p1.Updated(true, u6)
        end
        if v2 ~= "normal" then
            v3 = v2 .. " " .. v1
        else
            v3 = v1
        end
        u17(v3)
        local v5 = {}
        for k, v in pairs(p1.Character:GetChildren()) do
            if v:IsA("Model") then
                if v:GetAttribute("CustomizationAccessory") == true then
                    table.insert(v5, v)
                end
            elseif not (v:IsA("Folder")) then
            end
        end
        Customization.updateAccessoryColors(v5, u6)
        Customization.addHairTexture(v5, u6, "rbxassetid://119283505697797")
    end, {u6})
    return react.createElement(Frame, {Visible = p1.Enabled}, {Layout = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 4),
        HorizontalAlignment = Enum.HorizontalAlignment.Right,
        VerticalAlignment = Enum.VerticalAlignment.Top,
    }), ColorPicker = react.createElement(ColorPickerInput, {
        LayoutOrder = 0,
        Header = "Hair Color",
        Body = "Your lore character's hair color.",
        Enabled = p1.Enabled,
        Default = u6,
        Updated = function(p1) -- Line: 95 -- upvalues: u7 (val)
            u7(p1)
        end,
    }), IsInvalidColor = react.createElement(ErrorInput, {
        Header = "Not Permitted",
        Body = "The hair color \"" .. v2 .. "\" is not permitted, choose a new one.",
        Native = {Visible = v1},
    })})
end