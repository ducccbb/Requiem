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
--     File: ReplicatedStorage.Client.Interfaces.Routes.Pages.Stores.Shops.Stablemen
--                               Dumped in 0.00365 seconds
--                          Bytecode version 9  |  21 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Companions = require(Namespaces:WaitForChild("Companions"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Constants = require(Common_2:WaitForChild("Constants"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Types = Common_3:WaitForChild("Types")
local Animals = Types:WaitForChild("Animals")
local Gender = require(Animals:WaitForChild("Gender"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_4:WaitForChild("Common")
local Utilities = Common_4:WaitForChild("Utilities")
local Horse = require(Utilities:WaitForChild("Horse"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_5:WaitForChild("Common")
local Network_2 = Common_5:WaitForChild("Network")
local Namespaces_2 = Network_2:WaitForChild("Namespaces")
local Shop = require(Namespaces_2:WaitForChild("Shop"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_6:WaitForChild("Common")
local Utilities_2 = Common_6:WaitForChild("Utilities")
local Number = require(Utilities_2:WaitForChild("Number"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_7 = ReplicatedStorage_7:WaitForChild("Common")
local Promise = require(Common_7:WaitForChild("Promise"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_8:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Common_8 = ReplicatedStorage_9:WaitForChild("Common")
local Utilities_3 = Common_8:WaitForChild("Utilities")
local Table = require(Utilities_3:WaitForChild("Table"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_10:WaitForChild("Client")
local Interfaces = Client:WaitForChild("Interfaces")
local Components = Interfaces:WaitForChild("Components")
local Universal = Components:WaitForChild("Universal")
local Badge = require(Universal:WaitForChild("Badge"))
local ReplicatedStorage_11 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_11:WaitForChild("Client")
local Interfaces_2 = Client_2:WaitForChild("Interfaces")
local Components_2 = Interfaces_2:WaitForChild("Components")
local Primitives = Components_2:WaitForChild("Primitives")
local Frame = require(Primitives:WaitForChild("Frame"))
local ReplicatedStorage_12 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_12:WaitForChild("Client")
local Interfaces_3 = Client_3:WaitForChild("Interfaces")
local Components_3 = Interfaces_3:WaitForChild("Components")
local Universal_2 = Components_3:WaitForChild("Universal")
local HeaderBodyComponent = require(Universal_2:WaitForChild("HeaderBodyComponent"))
local ReplicatedStorage_13 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_13:WaitForChild("Client")
local Interfaces_4 = Client_4:WaitForChild("Interfaces")
local Components_4 = Interfaces_4:WaitForChild("Components")
local Primitives_2 = Components_4:WaitForChild("Primitives")
local Image = require(Primitives_2:WaitForChild("Image"))
local ReplicatedStorage_14 = game:GetService("ReplicatedStorage")
local Client_5 = ReplicatedStorage_14:WaitForChild("Client")
local Interfaces_5 = Client_5:WaitForChild("Interfaces")
local Components_5 = Interfaces_5:WaitForChild("Components")
local Primitives_3 = Components_5:WaitForChild("Primitives")
local ScrollingFrame = require(Primitives_3:WaitForChild("ScrollingFrame"))
local ReplicatedStorage_15 = game:GetService("ReplicatedStorage")
local Client_6 = ReplicatedStorage_15:WaitForChild("Client")
local Interfaces_6 = Client_6:WaitForChild("Interfaces")
local Components_6 = Interfaces_6:WaitForChild("Components")
local Primitives_4 = Components_6:WaitForChild("Primitives")
local VerticalListLayout = require(Primitives_4:WaitForChild("VerticalListLayout"))
local ReplicatedStorage_16 = game:GetService("ReplicatedStorage")
local Client_7 = ReplicatedStorage_16:WaitForChild("Client")
local Interfaces_7 = Client_7:WaitForChild("Interfaces")
local Components_7 = Interfaces_7:WaitForChild("Components")
local Inputs = Components_7:WaitForChild("Inputs")
local Button = require(Inputs:WaitForChild("Button"))
local ReplicatedStorage_17 = game:GetService("ReplicatedStorage")
local Client_8 = ReplicatedStorage_17:WaitForChild("Client")
local Interfaces_8 = Client_8:WaitForChild("Interfaces")
local Components_8 = Interfaces_8:WaitForChild("Components")
local Universal_3 = Components_8:WaitForChild("Universal")
local Form = require(Universal_3:WaitForChild("Form"))
local ReplicatedStorage_18 = game:GetService("ReplicatedStorage")
local Client_9 = ReplicatedStorage_18:WaitForChild("Client")
local Interfaces_9 = Client_9:WaitForChild("Interfaces")
local Components_9 = Interfaces_9:WaitForChild("Components")
local Universal_4 = Components_9:WaitForChild("Universal")
local Loading = require(Universal_4:WaitForChild("Loading"))
local ReplicatedStorage_19 = game:GetService("ReplicatedStorage")
local Client_10 = ReplicatedStorage_19:WaitForChild("Client")
local Interfaces_10 = Client_10:WaitForChild("Interfaces")
local Components_10 = Interfaces_10:WaitForChild("Components")
local Menu = Components_10:WaitForChild("Menu")
local PageLayout = require(Menu:WaitForChild("PageLayout"))
local ReplicatedStorage_20 = game:GetService("ReplicatedStorage")
local Client_11 = ReplicatedStorage_20:WaitForChild("Client")
local Interfaces_11 = Client_11:WaitForChild("Interfaces")
local Components_11 = Interfaces_11:WaitForChild("Components")
local Menu_2 = Components_11:WaitForChild("Menu")
local Tabs = Menu_2:WaitForChild("Tabs")
local TabLayout = require(Tabs:WaitForChild("TabLayout"))
local ReplicatedStorage_21 = game:GetService("ReplicatedStorage")
local Client_12 = ReplicatedStorage_21:WaitForChild("Client")
local Interfaces_12 = Client_12:WaitForChild("Interfaces")
local Components_12 = Interfaces_12:WaitForChild("Components")
local Menu_3 = Components_12:WaitForChild("Menu")
local Tabs_2 = Menu_3:WaitForChild("Tabs")
local Tablet = require(Tabs_2:WaitForChild("Tablet"))
local ReplicatedStorage_22 = game:GetService("ReplicatedStorage")
local Client_13 = ReplicatedStorage_22:WaitForChild("Client")
local Interfaces_13 = Client_13:WaitForChild("Interfaces")
local Components_13 = Interfaces_13:WaitForChild("Components")
local Primitives_5 = Components_13:WaitForChild("Primitives")
local Label = require(Primitives_5:WaitForChild("Label"))
local Interactions = script.Parent.Parent.Parent.Parent:WaitForChild("Interactions")
local Interaction = require(Interactions:WaitForChild("Interaction"))
local ReplicatedStorage_23 = game:GetService("ReplicatedStorage")
local Client_14 = ReplicatedStorage_23:WaitForChild("Client")
local Interfaces_14 = Client_14:WaitForChild("Interfaces")
local Hooks = Interfaces_14:WaitForChild("Hooks")
local useAsyncEffect = require(Hooks:WaitForChild("useAsyncEffect"))
local ReplicatedStorage_24 = game:GetService("ReplicatedStorage")
local Client_15 = ReplicatedStorage_24:WaitForChild("Client")
local Interfaces_15 = Client_15:WaitForChild("Interfaces")
local Hooks_2 = Interfaces_15:WaitForChild("Hooks")
local useConstants = require(Hooks_2:WaitForChild("useConstants"))
local ReplicatedStorage_25 = game:GetService("ReplicatedStorage")
local Client_16 = ReplicatedStorage_25:WaitForChild("Client")
local Interfaces_16 = Client_16:WaitForChild("Interfaces")
local Hooks_3 = Interfaces_16:WaitForChild("Hooks")
local useOrder = require(Hooks_3:WaitForChild("useOrder"))
local ReplicatedStorage_26 = game:GetService("ReplicatedStorage")
local Client_17 = ReplicatedStorage_26:WaitForChild("Client")
local Interfaces_17 = Client_17:WaitForChild("Interfaces")
local Hooks_4 = Interfaces_17:WaitForChild("Hooks")
local useRem = require(Hooks_4:WaitForChild("useRem"))
local ReplicatedStorage_27 = game:GetService("ReplicatedStorage")
local Client_18 = ReplicatedStorage_27:WaitForChild("Client")
local Interfaces_18 = Client_18:WaitForChild("Interfaces")
local Hooks_5 = Interfaces_18:WaitForChild("Hooks")
local useToast = require(Hooks_5:WaitForChild("useToast"))
local u676 = {"Purchase", "Breed"}
local function HorseShopItem(p1) -- Line: 77 -- upvalues: useRem (val), useOrder (val), useToast (val), Gender (val), react (val), useAsyncEffect (val), Promise (val), Badge (val), Form (val), Loading (val), Image (val), Constants (val), Number (val), HeaderBodyComponent (val), Button (val), Shop (val)
    local Male, u21, v1
    local Horse = p1.Horse
    local v2 = useRem()
    local v3 = useOrder()
    local u7 = useToast()
    if Horse.meta[1] ~= 1 then
        Male = Gender.Colors.Female
    else
        Male = Gender.Colors.Male
    end
    local v4 = {}
    v1, u21 = react.useState(false)
    useAsyncEffect(function() -- Line: 89 -- upvalues: Promise (upval), u21 (val)
        return Promise.delay(3):andThen(function() -- Line: 90 -- upvalues: u21 (upval)
            u21(false)
        end)
    end, {v1})
    for k, v in pairs(Horse.tags) do
        if k ~= 1 then
            v4[k .. v] = react.createElement(Badge, {
                Outline = true,
                Text = v,
                Native = {LayoutOrder = 10 + v3()},
                Color = Color3.fromRGB(92, 92, 92),
                TextColor = Color3.fromRGB(171, 171, 171),
            })
        end
    end
    local v5 = {
        Padding = "Large",
        Native = {LayoutOrder = p1.Index},
    }
    local v6 = {Loading = react.createElement(Loading, {Padding = "Large", Enabled = v1})}
    local v7 = {}
    local v8 = {Image = "rbxassetid://11419717444"}
    local v9 = v2(20)
    v8.Size = UDim2.fromOffset(v9, v2(20))
    v8.ImageColor3 = Male
    v8.LayoutOrder = v3()
    v7.Gender = react.createElement(Image, v8)
    v7.Price = react.createElement(Badge, {
        Outline = true,
        Text = Constants.Currency.Symbol .. Number.FormatWithCommas(Horse.price),
        Native = {LayoutOrder = v3()},
        Color = Color3.fromRGB(59, 92, 59),
        TextColor = Color3.fromRGB(97, 144, 97),
    })
    v7.Label = react.createElement(HeaderBodyComponent, {
        Body = "",
        Header = Horse.name,
        Native = {LayoutOrder = v3()},
    })
    v6.Left = react.createElement(Form.Divider, {Side = "Left"}, v7, v4)
    v6.Right = react.createElement(Form.Divider, {Side = "Right"}, {Overall = react.createElement(HeaderBodyComponent, {
        Header = "",
        Body = "Overall Rating " .. Horse.tags[1],
        Native = {LayoutOrder = v3()},
    }), Purchase = react.createElement(Button, {
        Text = "Purchase",
        Color = Color3.fromRGB(42, 70, 42),
        Clicked = function() -- Line: 162 -- upvalues: u21 (val), u7 (val), Shop (upval), p1 (val)
            u21(true)
            u7({message = "Attempting to process your purchase request...", type = "info"})
            Shop.Purchase.post(p1.Horse)
        end,
    })})
    return react.createElement(Form.Form, v5, v6)
end
local function StablemenPurchasePage(p1) -- Line: 173 -- upvalues: Table (val), react (val), HorseShopItem (val), ScrollingFrame (val), VerticalListLayout (val)
    local Content
    if not p1.Enabled then
        Content = {}
    else
        Content = p1.Content
    end
    p1.Content = Content
    local v1 = {}
    local v2 = if not p1.Enabled then {} else Table.copy(p1.Content)
    table.sort(v2, function(p1, p2) -- Line: 184
        if not p1 or not p2 or not p1.price or not p2.price then
            return false
        end
        local v1 = p2.price < p1.price
        return v1
    end)
    for k, v in pairs(v2) do
        if typeof(v) == "table" and v.name then
            v1[v.name .. k] = react.createElement(HorseShopItem, {Horse = v, Index = k})
        end
    end
    return react.createElement(ScrollingFrame, {Visible = p1.Enabled}, {Layout = react.createElement(VerticalListLayout, {Spacing = 6, VerticalAlignment = Enum.VerticalAlignment.Top})}, v1)
end
local function StablemenBreedHorseItem(p1) -- Line: 217 -- upvalues: useRem (val), Gender (val), Horse (val), react (val), Frame (val), Image (val), Label (val), HeaderBodyComponent (val)
    local Male, name, v1, v2, v3, v4
    local v5 = useRem()
    if p1.Gender ~= 1 then
        Male = Gender.Colors.Female
    else
        Male = Gender.Colors.Male
    end
    local v6 = Horse.isHorseOldEnoughToBreed(p1.Horse)
    local v7 = Horse.isHorseOnBreedingCooldown(p1.Horse)
    if p1.Gender ~= 1 then
        v3 = "Female"
    else
        v3 = "Male"
    end
    local v8 = string.format("%s Horse ready for breeding.", v3)
    if not v7 then
        v2 = v8
    else
        v2 = "This horse is currently on a breeding cooldown."
    end
    v8 = v2
    if v6 then
        v2 = v8
    else
        v2 = "This horse is not yet ready to breed, it is too young."
    end
    local createElement = react.createElement
    local v9 = {}
    local v10 = UDim2.fromScale(1, 0)
    v9.Size = v10 + UDim2.fromOffset(0, v5(100))
    if not p1.Horse then
        v4 = 0.5
    else
        v4 = 0.85
    end
    v9.BackgroundTransparency = v4
    v9.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    v4 = {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, v5(10))})}
    local v11 = {ClipsDescendants = true, Visible = not p1.Horse}
    local v12 = {}
    local v13 = {Image = "rbxassetid://11419717444", ImageTransparency = 0.5}
    local v14 = v5(110)
    v13.Size = UDim2.fromOffset(v14, v5(110))
    v13.ImageColor3 = Male
    v13.Position = UDim2.fromScale(0.5, 1.15)
    v12.Gender = react.createElement(Image, v13)
    v13 = {TextTransparency = 0.5}
    if p1.Gender ~= 1 then
        v1 = "female"
    else
        v1 = "male"
    end
    v13.Text = string.format("No %s horse within this stable.", v1)
    v13.Position = UDim2.fromScale(0.5, 0.5)
    v13.AnchorPoint = Vector2.new(0.5, 0.5)
    v13.TextXAlignment = Enum.TextXAlignment.Center
    v12.Label = react.createElement(Label, v13)
    v4.Missing = react.createElement(Frame, v11, v12)
    local createElement_2 = react.createElement
    v11 = {}
    local v15 = p1.Horse == nil
    v11.Visible = not v15
    v12 = {}
    local createElement_3 = react.createElement
    v13 = {}
    if not p1.Horse then
        name = ""
    else
        name = p1.Horse.name
        if not name then
            name = ""
        end
    end
    v13.Header = name
    v13.Body = v2
    v14 = UDim2.fromScale(0, 0.5)
    local v16 = v5(15)
    v13.Position = v14 + UDim2.fromOffset(v16, 0)
    v13.Colors = {Header = Male}
    v12.Label = createElement_3(HeaderBodyComponent, v13)
    v4.Valid = createElement_2(Frame, v11, v12)
    return createElement(Frame, v9, v4)
end
local function StablemenStableGroupPage(p1) -- Line: 275 -- upvalues: useRem (val), useConstants (val), react (val), useAsyncEffect (val), Promise (val), Form (val), Loading (val), HeaderBodyComponent (val), Button (val), Constants (val), Companions (val), Frame (val), VerticalListLayout (val), StablemenBreedHorseItem (val)
    local u10, u11
    local Stable = p1.Stable
    local v1 = useRem()
    local v2 = useConstants()
    u10, u11 = react.useState(false)
    useAsyncEffect(function() -- Line: 283 -- upvalues: Promise (upval), u11 (val)
        return Promise.delay(2):andThen(function() -- Line: 284 -- upvalues: u11 (upval)
            u11(false)
        end)
    end, {u10})
    local v3 = {Height = "P_40"}
    local v4 = {}
    local v5 = UDim2.fromScale(1, 0)
    v4.Size = v5 + UDim2.fromOffset(0, v1(300))
    v3.Native = v4
    v4 = {Loading = react.createElement(Loading, {Enabled = u10, Padding = UDim2.fromOffset(v2.Padding.Sizes.Large, v2.Padding.Sizes.P_40)}), Left = react.createElement(Form.Divider, {
        Side = "Left",
        Native = {Position = UDim2.fromScale(0, 0)},
    }, {Header = react.createElement(HeaderBodyComponent, {Body = "Put your horses in the stable in order to breed them.", Wrap = true, Header = "Stable " .. p1.Index, Position = UDim2.new()})}), Right = react.createElement(Form.Divider, {
        Side = "Right",
        Native = {Position = UDim2.fromScale(1, 0), AnchorPoint = Vector2.new(1, 0)},
    }, {Breeding = react.createElement(Button, {
        Text = "Breed Horses " .. Constants.Currency.Symbol .. "100",
        Color = Color3.fromRGB(42, 70, 42),
        Clicked = function() -- Line: 325 -- upvalues: u10 (val), Stable (val), Companions (upval), u11 (val)
            if u10 or not Stable.valid or not Stable.male or not Stable.female then
                return
            end
            Companions.Breed.post({male = Stable.male.id, female = Stable.female.id})
            u11(true)
        end,
        Native = {Visible = Stable.valid},
    })})}
    local v6 = {}
    local v7 = UDim2.fromScale(1, 0)
    v6.Size = v7 + UDim2.fromOffset(0, v1(50))
    v7 = UDim2.fromScale(0.5, 0)
    v6.Position = v7 + UDim2.fromOffset(0, v1(30))
    v6.AnchorPoint = Vector2.new(0.5, 0)
    v4.Content = react.createElement(Frame, v6, {Layout = react.createElement(VerticalListLayout, {Spacing = 6, VerticalAlignment = Enum.VerticalAlignment.Top}), Male = react.createElement(StablemenBreedHorseItem, {Gender = 1, Horse = Stable.male}), Female = react.createElement(StablemenBreedHorseItem, {Gender = 2, Horse = Stable.female})})
    return react.createElement(Form.Form, v3, v4)
end
local function StablemenBreedPage(p1) -- Line: 372 -- upvalues: react (val), Interaction (val), HttpService (val), Horse (val), StablemenStableGroupPage (val), ScrollingFrame (val), VerticalListLayout (val)
    local u4, u5, v1
    u4, u5 = react.useState(0)
    local u12 = react.useMemo(function() -- Line: 375 -- upvalues: p1 (val)
        if not p1.Enabled or not p1.Interaction then
            return {}
        end
        local Parent = p1.Interaction.Parent
        local Stables = Parent
        if Stables then
            Stables = Parent:WaitForChild("Stables")
        end
        local v1 = Stables
        if not v1 then
            return {}
        end
        local v2 = {}
        local v3 = #v1:GetChildren()
        local v4 = 1
        for i = 1, v3, v4 do
            v2[i] = v1:FindFirstChild((tostring(i)))
        end
        return v2
    end, {p1.Enabled, p1.Interaction})
    local u20 = react.useMemo(function() -- Line: 395 -- upvalues: Interaction (upval), u12 (val), HttpService (upval), Horse (upval)
        local part, v1, v2, v3, v4, v5, v6, v7, v8
        local v9 = {}
        local Octree = Interaction.Octree
        for k, v in pairs(u12) do
            v6 = Octree:SearchRadius(v.Position, 10)
            v7 = nil
            v8 = nil
            v1 = nil
            v2 = nil
            for k2, i in pairs(v6) do
                part = i.Object.part
                if part:IsA("Seat") and part:GetAttribute("Type") == "Mount" then
                    v5 = HttpService:JSONDecode(part:GetAttribute("Data"))
                    if v5 and v5.type == 1 then
                        if v5.gender ~= 1 then
                            v8 = v5
                            v2 = part
                        else
                            v7 = v5
                            v1 = part
                        end
                    end
                end
            end
            v3 = {male = v7, female = v8, male_seat = v1, female_seat = v2}
            if not v7 then
                v4 = false
            elseif Horse.isHorseOldEnoughToBreed(v7) and not (Horse.isHorseOnBreedingCooldown(v7)) and v8 and Horse.isHorseOldEnoughToBreed(v8) and not (Horse.isHorseOnBreedingCooldown(v8)) then
                v4 = true
            end
            v3.valid = v4
            v9[k] = v3
        end
        return v9
    end, {p1.Enabled, u12, u4})
    react.useEffect(function() -- Line: 452 -- upvalues: u20 (val), u5 (val), u4 (val)
        local trackDataChanged
        local u27 = {}
        for k, v in pairs(u20) do
            if v.valid then
                function trackDataChanged(p1) -- Line: 460 -- upvalues: u27 (val), u5 (upval), u4 (upval)
                    local AttributeChangedSignal = p1:GetAttributeChangedSignal("Data")
                    table.insert(u27, AttributeChangedSignal:Connect(function() -- Line: 463 -- upvalues: u5 (upval), u4 (upval)
                        u5(u4 + 1)
                    end))
                end
                if v.male_seat then
                    trackDataChanged(v.male_seat)
                end
                if v.female_seat then
                    trackDataChanged(v.female_seat)
                end
            end
        end
        return function() -- Line: 478 -- upvalues: u27 (val)
            for k, v in pairs(u27) do
                v:Disconnect()
            end
        end
    end, {u20})
    local v2 = {}
    for k, v in pairs(u20) do
        v1 = tostring(k)
        v2[v1] = react.createElement(StablemenStableGroupPage, {Index = k, Stable = v})
    end
    return react.createElement(ScrollingFrame, {Visible = p1.Enabled}, {Layout = react.createElement(VerticalListLayout, {Spacing = 6, VerticalAlignment = Enum.VerticalAlignment.Top})}, v2)
end
return function(p1) -- Line: 503 -- upvalues: react (val), u676 (val), Tablet (val), Frame (val), PageLayout (val), TabLayout (val), StablemenPurchasePage (val), StablemenBreedPage (val)
    local Enabled, u6, v1, v2, v3
    v1, u6 = react.useState(u676[1])
    local v4 = {}
    local v5 = p1
    for i, v in ipairs(u676) do
        v2 = {Text = v}
        v3 = v1 == v
        v2.Selected = v3
        function v2.Clicked(...) -- Line: 513 -- upvalues: u6 (val), v (val)
            u6(v)
        end
        v4[v] = react.createElement(Tablet, v2)
    end
    local v6 = {Visible = v5.Enabled}
    local v7 = {Layout = react.createElement(PageLayout, {Ratio = false}), Tabs = react.createElement(TabLayout, {Subtabs = true}, v4)}
    local v8 = {Size = UDim2.fromScale(1, 1)}
    v2 = {}
    local v9 = {Content = v5.Content}
    Enabled = if v1 == "Purchase" then v5.Enabled else false
    v9.Enabled = Enabled
    v2.Store = react.createElement(StablemenPurchasePage, v9)
    v9 = {}
    local Enabled_2 = v5.Enabled
    if Enabled_2 then
        Enabled_2 = v1 == "Breed"
    end
    v9.Enabled = Enabled_2
    v9.Interaction = v5.Interaction
    v2.Breed = react.createElement(StablemenBreedPage, v9)
    v7.Content = react.createElement(Frame, v8, v2)
    return react.createElement(Frame, v6, v7)
end