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
--File: ReplicatedStorage.Client.Interfaces.Routes.Menu.Subpages.Profile.Subpages.CompanionsPage
--                               Dumped in 0.00367 seconds
--                          Bytecode version 9  |  15 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Companions = require(Namespaces:WaitForChild("Companions"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Utilities = Common_2:WaitForChild("Utilities")
local Number = require(Utilities:WaitForChild("Number"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_3:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_4:WaitForChild("Client")
local Interfaces = Client:WaitForChild("Interfaces")
local Components = Interfaces:WaitForChild("Components")
local Universal = Components:WaitForChild("Universal")
local HeaderBodyComponent = require(Universal:WaitForChild("HeaderBodyComponent"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_5:WaitForChild("Client")
local Interfaces_2 = Client_2:WaitForChild("Interfaces")
local Components_2 = Interfaces_2:WaitForChild("Components")
local Primitives = Components_2:WaitForChild("Primitives")
local Image = require(Primitives:WaitForChild("Image"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_6:WaitForChild("Client")
local Interfaces_3 = Client_3:WaitForChild("Interfaces")
local Components_3 = Interfaces_3:WaitForChild("Components")
local Primitives_2 = Components_3:WaitForChild("Primitives")
local ScrollingFrame = require(Primitives_2:WaitForChild("ScrollingFrame"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_7:WaitForChild("Client")
local Interfaces_4 = Client_4:WaitForChild("Interfaces")
local Components_4 = Interfaces_4:WaitForChild("Components")
local Primitives_3 = Components_4:WaitForChild("Primitives")
local Text = require(Primitives_3:WaitForChild("Text"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Client_5 = ReplicatedStorage_8:WaitForChild("Client")
local Interfaces_5 = Client_5:WaitForChild("Interfaces")
local Components_5 = Interfaces_5:WaitForChild("Components")
local Primitives_4 = Components_5:WaitForChild("Primitives")
local VerticalListLayout = require(Primitives_4:WaitForChild("VerticalListLayout"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Client_6 = ReplicatedStorage_9:WaitForChild("Client")
local Interfaces_6 = Client_6:WaitForChild("Interfaces")
local Components_6 = Interfaces_6:WaitForChild("Components")
local Inputs = Components_6:WaitForChild("Inputs")
local Button = require(Inputs:WaitForChild("Button"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Client_7 = ReplicatedStorage_10:WaitForChild("Client")
local Interfaces_7 = Client_7:WaitForChild("Interfaces")
local Components_7 = Interfaces_7:WaitForChild("Components")
local Universal_2 = Components_7:WaitForChild("Universal")
local Form = require(Universal_2:WaitForChild("Form"))
local ReplicatedStorage_11 = game:GetService("ReplicatedStorage")
local Client_8 = ReplicatedStorage_11:WaitForChild("Client")
local Interfaces_8 = Client_8:WaitForChild("Interfaces")
local Components_8 = Interfaces_8:WaitForChild("Components")
local Screen = Components_8:WaitForChild("Screen")
local Popup = require(Screen:WaitForChild("Popup"))
local ReplicatedStorage_12 = game:GetService("ReplicatedStorage")
local Client_9 = ReplicatedStorage_12:WaitForChild("Client")
local Interfaces_9 = Client_9:WaitForChild("Interfaces")
local Components_9 = Interfaces_9:WaitForChild("Components")
local Universal_3 = Components_9:WaitForChild("Universal")
local Progress = require(Universal_3:WaitForChild("Progress"))
local ReplicatedStorage_13 = game:GetService("ReplicatedStorage")
local Client_10 = ReplicatedStorage_13:WaitForChild("Client")
local Interfaces_10 = Client_10:WaitForChild("Interfaces")
local Hooks = Interfaces_10:WaitForChild("Hooks")
local useAlertPopup = require(Hooks:WaitForChild("useAlertPopup"))
local ReplicatedStorage_14 = game:GetService("ReplicatedStorage")
local Client_11 = ReplicatedStorage_14:WaitForChild("Client")
local Interfaces_11 = Client_11:WaitForChild("Interfaces")
local Hooks_2 = Interfaces_11:WaitForChild("Hooks")
local useInputPopup = require(Hooks_2:WaitForChild("useInputPopup"))
local ReplicatedStorage_15 = game:GetService("ReplicatedStorage")
local Client_12 = ReplicatedStorage_15:WaitForChild("Client")
local Interfaces_12 = Client_12:WaitForChild("Interfaces")
local Hooks_3 = Interfaces_12:WaitForChild("Hooks")
local useOrder = require(Hooks_3:WaitForChild("useOrder"))
local ReplicatedStorage_16 = game:GetService("ReplicatedStorage")
local Client_13 = ReplicatedStorage_16:WaitForChild("Client")
local Interfaces_13 = Client_13:WaitForChild("Interfaces")
local Hooks_4 = Interfaces_13:WaitForChild("Hooks")
local usePopup = require(Hooks_4:WaitForChild("usePopup"))
local ReplicatedStorage_17 = game:GetService("ReplicatedStorage")
local Client_14 = ReplicatedStorage_17:WaitForChild("Client")
local Interfaces_14 = Client_14:WaitForChild("Interfaces")
local Hooks_5 = Interfaces_14:WaitForChild("Hooks")
local useRem = require(Hooks_5:WaitForChild("useRem"))
local ReplicatedStorage_18 = game:GetService("ReplicatedStorage")
local Client_15 = ReplicatedStorage_18:WaitForChild("Client")
local Interfaces_15 = Client_15:WaitForChild("Interfaces")
local Hooks_6 = Interfaces_15:WaitForChild("Hooks")
local useStore = require(Hooks_6:WaitForChild("useStore"))
local ReplicatedStorage_19 = game:GetService("ReplicatedStorage")
local Client_16 = ReplicatedStorage_19:WaitForChild("Client")
local Interfaces_16 = Client_16:WaitForChild("Interfaces")
local Hooks_7 = Interfaces_16:WaitForChild("Hooks")
local useToast = require(Hooks_7:WaitForChild("useToast"))
local u473 = {}
local v2 = Color3.fromRGB(112, 193, 255)
u473[1] = v2
u473[2] = Color3.fromRGB(255, 105, 222)
local u484 = {"Horse", "Pigeon", "Wolf", "Bear"}
local u489 = {
    {
        "Bred",
        "Run Speed",
        "Turn Speed",
        "Jump Power",
        "Stamina",
        "Health",
    },
    {"Flight Speed", "Health"},
    {
        "Run Speed",
        "Turn Speed",
        "Jump Power",
        "Stamina",
        "Health",
    },
    {
        "Run Speed",
        "Turn Speed",
        "Jump Power",
        "Stamina",
        "Health",
    },
}
local function CompanionsPagePopup(p1) -- Line: 66 -- upvalues: react (val), useToast (val), u484 (val), useInputPopup (val), Companions (val), useRem (val), useOrder (val), useAlertPopup (val), u489 (val), Progress (val), u473 (val), Popup (val), Button (val)
    local u98
    if not p1.Companion then
        warn("CompanionsPagePopup received nil companion")
        return react.createElement(react.Fragment, {})
    end
    local closePopup = p1.closePopup
    local u13 = useToast()
    local u115 = u484[p1.Companion.type] or "Companion"
    local u151 = useInputPopup(function(a1) -- Line: 78 -- upvalues: u13 (val), u115 (val), Companions (upval), p1 (val)
        if not a1 then
            u13({message = "The specified name is invalid.", type = "error"})
            return
        end
        u13({type = "info", message = "Sent a request to rename your " .. u115 .. " to " .. a1 .. "."})
        Companions.Rename.post({id = p1.Companion.id, name = a1})
    end)
    local v1 = useRem()
    local u145 = useOrder()
    local v2 = {}
    local u154 = useAlertPopup(function(a1) -- Line: 99 -- upvalues: closePopup (val), Companions (upval), p1 (val)
        closePopup()
        if not a1 then
            return
        end
        Companions.Release.post(p1.Companion.id)
    end)
    if not p1.Companion.metadata then
        u98 = p1
    else
        local v3, v4, v5, v6, v7
        u98 = p1
        for k, v in pairs(p1.Companion.metadata) do
            v3 = u489[u98.Companion.type]
            if v3 then
                v4 = v3[k]
                if v4 and v4 ~= "Bred" then
                    v5 = {Animated = true, Display = true, Header = v4, Value = v}
                    v6 = {Min = 0, Max = 100}
                    v5.Range = v6
                    if u98.Companion.gender == 2 then
                        v6 = Color3.fromRGB(118, 54, 104)
                    elseif not (u473[u98.Companion.gender]) then
                        v6 = Color3.fromRGB(255, 255, 255)
                    else
                        v6 = u473[u98.Companion.gender]
                    end
                    v5.Color = v6
                    v6 = {BackgroundTransparency = 1}
                    v7 = UDim2.fromScale(1, 0)
                    v6.Size = v7 + UDim2.fromOffset(0, v1(30))
                    v5.Native = v6
                    v2[v4] = react.createElement(Progress, v5)
                end
            end
        end
    end
    return react.createElement(react.Fragment, {}, {Header = react.createElement(Popup.Header, {Header = u115 .. " Settings", Body = "Your " .. u115 .. " " .. (u98.Companion.name or "Unnamed") .. " and their respective statistics."}), Body = react.createElement(Popup.Body, {Bottom = 50}, v2), Buttons = react.createElement(Popup.Buttons, {}, (function() -- Line: 160 -- upvalues: react (upval), Button (upval), u145 (val), closePopup (val), Companions (upval), u98 (val), u151 (val), u115 (val), u154 (val)
        local v1 = {Close = react.createElement(Button, {
            Text = "Close",
            Brightness = 1,
            Color = Color3.fromRGB(255, 255, 255),
            TextColor = Color3.fromRGB(0, 0, 0),
            Native = {LayoutOrder = 4 - u145()},
            Clicked = function() -- Line: 170 -- upvalues: closePopup (upval)
                closePopup()
            end,
        })}
        local v2 = {
            Text = "Set as Primary",
            Brightness = 1,
            Type = 3,
            Color = Color3.fromRGB(255, 255, 255),
            TextColor = Color3.fromRGB(255, 255, 255),
        }
        local v3 = {LayoutOrder = 4 - u145()}
        v2.Native = v3
        function v2.Clicked() -- Line: 184 -- upvalues: Companions (upval), u98 (upval)
            Companions.Active.post(u98.Companion.id)
        end
        v1.Activate = react.createElement(Button, v2)
        v2 = {Brightness = 1, Type = 3}
        if u98.Companion.favorite ~= 1 then
            v3 = "Favorite"
        else
            v3 = "Unfavorite"
        end
        v2.Text = v3
        v2.Color = Color3.fromRGB(255, 255, 255)
        v2.TextColor = Color3.fromRGB(255, 255, 255)
        v2.Native = {LayoutOrder = 4 - u145()}
        function v2.Clicked() -- Line: 198 -- upvalues: Companions (upval), u98 (upval)
            Companions.Favorite.post(u98.Companion.id)
        end
        v1.Favorite = react.createElement(Button, v2)
        v1.Rename = react.createElement(Button, {
            Text = "Rename",
            Brightness = 1,
            Type = 3,
            Color = Color3.fromRGB(255, 255, 255),
            TextColor = Color3.fromRGB(255, 255, 255),
            Native = {LayoutOrder = 4 - u145()},
            Clicked = function() -- Line: 212 -- upvalues: u151 (upval), u115 (upval)
                u151("Rename " .. u115, "Enter a new name for your " .. u115 .. ".", "New Name")
            end,
        })
        v1.Delete = react.createElement(Button, {
            Text = "Release",
            Brightness = 0.6,
            Type = 4,
            TextColor = Color3.fromRGB(255, 255, 255),
            Native = {LayoutOrder = 4 - u145()},
            Clicked = function() -- Line: 229 -- upvalues: u154 (upval), u115 (upval), u98 (upval)
                u154("Release " .. u115, "Are you sure you want to release " .. (u98.Companion.name or "this companion") .. "?", Color3.fromRGB(255, 0, 0))
            end,
        })
        if u98.Companion.type == 2 then
            v1.Message = react.createElement(Button, {
                Text = "Send Message",
                Brightness = 1,
                Type = 3,
                Color = Color3.fromRGB(255, 255, 255),
                TextColor = Color3.fromRGB(255, 255, 255),
                Native = {LayoutOrder = 4 - u145()},
                Clicked = function() -- Line: 249 -- upvalues: closePopup (upval)
                    closePopup()
                end,
            })
        end
        return v1
    end)())})
end
local function CompanionsItem(p1) -- Line: 263 -- upvalues: react (val), useOrder (val), useRem (val), usePopup (val), Form (val), CompanionsPagePopup (val), u473 (val), Image (val), HeaderBodyComponent (val), Text (val), Number (val), u484 (val)
    local Companion, name, u16, u17, v1, v2
    if not p1.Companion then
        warn("CompanionsItem received nil companion")
        return react.createElement(react.Fragment, {})
    end
    local v3 = useOrder()
    local v4 = useRem()
    u16, u17, v2 = usePopup()
    Companion = p1.Companion
    local createElement = react.createElement
    local Form_2 = Form.Form
    local v5 = {
        Darken = false,
        Clicked = function() -- Line: 279 -- upvalues: u16 (val), react (upval), CompanionsPagePopup (upval), Companion (val), u17 (val), u473 (upval)
            local v1 = {Companion = react.createElement(CompanionsPagePopup, {Companion = Companion, closePopup = u17})}
            local v2 = {}
            local v3 = u473[Companion.gender]
            if not v3 then
                v3 = Color3.fromRGB(255, 255, 255)
            end
            v2.color = v3
            u16(v1, v2)
        end,
    }
    if p1.Companion.favorite ~= 1 then
        v1 = 2
    else
        v1 = 1
    end
    v5.LayoutOrder = v1
    v1 = {CompanionsPopup = v2}
    local createElement_2 = react.createElement
    local Divider = Form.Divider
    local v6 = {}
    local v7 = {Image = "rbxassetid://11419717444"}
    local v8 = u473[Companion.gender]
    if not v8 then
        v8 = Color3.fromRGB(255, 255, 255)
    end
    v7.ImageColor3 = v8
    local v9 = v4(20)
    v7.Size = UDim2.fromOffset(v9, v4(20))
    v7.LayoutOrder = v3()
    v6.Image = react.createElement(Image, v7)
    local createElement_3 = react.createElement
    v7 = {}
    if p1.Companion.favorite ~= 1 then
        name = Companion.name
        if not name then
            name = "Unnamed Companion"
        end
    else
        name = "⭐ " .. (Companion.name or "Unnamed Companion")
    end
    v7.Header = name
    v7.Native = {LayoutOrder = v3()}
    v6.Label = createElement_3(HeaderBodyComponent, v7)
    v6.Age = react.createElement(Text, {Text = Number.GetLeadingTimestamp(Companion.age or 0) .. " of age.", LayoutOrder = v3()})
    v1.Left = createElement_2(Divider, {Side = "Left"}, v6)
    v6 = {}
    v7 = {}
    if Companion.gender ~= 1 then
        v9 = "Female "
    else
        v9 = "Male "
    end
    v7.Text = v9 .. (u484[Companion.type] or "Companion")
    v7.LayoutOrder = v3()
    v7.TextXAlignment = Enum.TextXAlignment.Right
    v6.Label = react.createElement(Text, v7)
    v7 = {Image = "rbxassetid://11422142913", ImageTransparency = 0.24}
    v9 = v4(15)
    v7.Size = UDim2.fromOffset(v9, v4(15))
    v7.LayoutOrder = v3()
    v6.Arrow = react.createElement(Image, v7)
    v1.Right = react.createElement(Form.Divider, {Side = "Right"}, v6)
    return createElement(Form_2, v5, v1)
end
return function(p1) -- Line: 343 -- upvalues: useStore (val), Companions (val), react (val), CompanionsItem (val), ScrollingFrame (val), VerticalListLayout (val)
    local v1, v2
    v1 = useStore(Companions.Store, function(p1) -- Line: 344
        local v1 = p1
        if not v1 then
            v1 = {}
        end
        return v1
    end)
    local v3 = {}
    for i, v in ipairs(v1) do
        if not v.id then
            v2 = "Companion_" .. tostring(i)
        else
            v2 = tostring(v.id)
        end
        v3[v2] = react.createElement(CompanionsItem, {Companion = v})
    end
    return react.createElement(ScrollingFrame, {Visible = p1.Enabled}, {Layout = react.createElement(VerticalListLayout, {Spacing = 10, VerticalAlignment = Enum.VerticalAlignment.Top})}, v3)
end