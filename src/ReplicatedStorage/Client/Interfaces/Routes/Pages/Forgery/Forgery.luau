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
--        File: ReplicatedStorage.Client.Interfaces.Routes.Pages.Forgery.Forgery
--                               Dumped in 0.00346 seconds
--                          Bytecode version 9  |  23 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Inventory = require(Namespaces:WaitForChild("Inventory"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_2:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Utilities = Common_2:WaitForChild("Utilities")
local Table = require(Utilities:WaitForChild("Table"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_4:WaitForChild("Client")
local User = Client:WaitForChild("User")
local Equipment = User:WaitForChild("Equipment")
local Tools = Equipment:WaitForChild("Tools")
local ClientInventoryHandler = require(Tools:WaitForChild("ClientInventoryHandler"))
local Components = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Inputs = Components:WaitForChild("Inputs")
local Button = require(Inputs:WaitForChild("Button"))
local Components_2 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Utilities_2 = Components_2:WaitForChild("Utilities")
local Color = require(Utilities_2:WaitForChild("Color"))
local Components_3 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Screen = Components_3:WaitForChild("Screen")
local DynamicPage = require(Screen:WaitForChild("DynamicPage"))
local Components_4 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Universal = Components_4:WaitForChild("Universal")
local Form = require(Universal:WaitForChild("Form"))
local Components_5 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Primitives = Components_5:WaitForChild("Primitives")
local Frame = require(Primitives:WaitForChild("Frame"))
local Components_6 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Menu = Components_6:WaitForChild("Menu")
local Header = Menu:WaitForChild("Header")
local PageHeader = require(Header:WaitForChild("PageHeader"))
local Components_7 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Universal_2 = Components_7:WaitForChild("Universal")
local HeaderBodyComponent = require(Universal_2:WaitForChild("HeaderBodyComponent"))
local Components_8 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Universal_3 = Components_8:WaitForChild("Universal")
local ItemViewport = require(Universal_3:WaitForChild("ItemViewport"))
local Components_9 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Menu_2 = Components_9:WaitForChild("Menu")
local PageLayout = require(Menu_2:WaitForChild("PageLayout"))
local Components_10 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Universal_4 = Components_10:WaitForChild("Universal")
local Progress = require(Universal_4:WaitForChild("Progress"))
local Components_11 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Primitives_2 = Components_11:WaitForChild("Primitives")
local Ratio = require(Primitives_2:WaitForChild("Ratio"))
local Components_12 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Utilities_3 = Components_12:WaitForChild("Utilities")
local Scaler = require(Utilities_3:WaitForChild("Scaler"))
local Components_13 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Primitives_3 = Components_13:WaitForChild("Primitives")
local ScrollingFrame = require(Primitives_3:WaitForChild("ScrollingFrame"))
local Components_14 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Utilities_4 = Components_14:WaitForChild("Utilities")
local TransparencyGroup = require(Utilities_4:WaitForChild("TransparencyGroup"))
local Components_15 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Primitives_4 = Components_15:WaitForChild("Primitives")
local VerticalListLayout = require(Primitives_4:WaitForChild("VerticalListLayout"))
local Hooks = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useConstants = require(Hooks:WaitForChild("useConstants"))
local Hooks_2 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useInterfaceState = require(Hooks_2:WaitForChild("useInterfaceState"))
local Hooks_3 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useOrder = require(Hooks_3:WaitForChild("useOrder"))
local Hooks_4 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useRem = require(Hooks_4:WaitForChild("useRem"))
local Hooks_5 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useTheme = require(Hooks_5:WaitForChild("useTheme"))
local function ForgeryHeatComponent(p1) -- Line: 57 -- upvalues: useRem (val), useConstants (val), useTheme (val), react (val), RunService (val), Frame (val), Color (val), Progress (val), Button (val)
    local u14, u15, u23, u24, u32, u33, u39, u40, u48, u49, u53, u54
    local v1 = useRem()
    local v2 = useConstants()
    local v3 = useTheme()
    u14, u15 = react.useBinding(math.random(100, 200) / 1000)
    u23, u24 = react.useBinding(math.random(30, 60) / 100)
    u32, u33 = react.useBinding(math.random(20, 80) / 100)
    u39, u40 = react.useBinding(tick() - 100)
    u48, u49 = react.useBinding(math.random(5, 15) / 10)
    u53, u54 = react.useState(false)
    react.useEffect(function() -- Line: 70 -- upvalues: u53 (val), p1 (val)
        if u53 then
            p1.Ranged(true)
            return
        end
        p1.Ranged(false)
    end, {u53})
    react.useEffect(function() -- Line: 78 -- upvalues: p1 (val), u33 (val), u40 (val), u49 (val), u15 (val), u24 (val)
        if not p1.Enabled then
            u33(math.random(20, 80) / 100)
            u40(tick() - 100)
            u49(math.random(5, 15) / 10)
            u15(math.random(100, 200) / 1000)
            u24(math.random(30, 60) / 100)
        end
    end, {p1.Enabled})
    react.useEffect(function() -- Line: 89 -- upvalues: p1 (val), RunService (upval), u14 (val), u23 (val), u32 (val), u54 (val), u39 (val), u33 (val), u48 (val)
        if not p1.Enabled then
            return
        end
        local u7 = RunService.RenderStepped:Connect(function(p1) -- Line: 94 -- upvalues: u14 (upval), u23 (upval), u32 (upval), u54 (upval), u39 (upval), u33 (upval), u48 (upval)
            local v1, v2
            local v3 = u14:getValue()
            local v4 = u23:getValue()
            local v5 = v4 + v3 / 2
            v4 = u32:getValue() - v3
            if v5 - v3 / 2 >= v4 then
                u54(false)
            elseif v4 >= v5 + v3 / 2 then
                u54(false)
            else
                u54(true)
            end
            local v6 = tick() - u39:getValue()
            if v6 < 0.15 then
                v2 = u32:getValue()
                v1 = v2 + p1 * 0.4
                u33((math.clamp(v1, 0, 1)))
                return
            end
            v6 = tick() - u39:getValue()
            if v6 < u48:getValue() then
                return
            end
            v2 = u32:getValue()
            v1 = v2 - p1 * 0.05
            u33((math.clamp(v1, 0, 1)))
        end)
        return function() -- Line: 117 -- upvalues: u7 (val)
            u7:Disconnect()
        end
    end, {p1.Enabled, u32})
    local v4 = {}
    local v5 = UDim2.fromScale(1, 0)
    v4.Size = v5 + UDim2.fromOffset(0, v1(40))
    local v6 = {Padding = react.createElement("UIPadding", v2.Padding.Universal.Medium)}
    local v7 = {BackgroundTransparency = 0, ZIndex = 2}
    local v8 = u14:getValue()
    local v9 = UDim2.fromScale(v8, 0)
    v7.Size = v9 + UDim2.fromOffset(0, v1(3))
    v7.BackgroundColor3 = Color.Brighten(v3.Secondary, 0.2)
    v7.AnchorPoint = Vector2.new(0, 0.5)
    v8 = u23:getValue()
    v9 = v8 + u14:getValue() / 2
    v7.Position = UDim2.fromScale(v9, 0.25)
    v6.Range = react.createElement(Frame, v7, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(1, 0)})})
    v7 = {BackgroundTransparency = 0.2, ZIndex = 1}
    v9 = UDim2.fromScale(0.9, 0)
    v7.Size = v9 + UDim2.fromOffset(0, v1(2))
    v7.BackgroundColor3 = Color.Darken(v3.Secondary, 0.8)
    v7.AnchorPoint = Vector2.new(0, 0.5)
    v9 = UDim2.fromScale(0, 0.25)
    local v10 = v1(v2.Padding.Sizes.Large)
    v7.Position = v9 + UDim2.fromOffset(v10, 0)
    v6.Red = react.createElement(Frame, v7, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(1, 0)})})
    v7 = {Enabled = true, Value = u32}
    local v11 = {BackgroundTransparency = 1, AnchorPoint = Vector2.new(0, 0.5), Position = UDim2.fromScale(0, 0.5)}
    v8 = UDim2.fromScale(0.925, 0)
    v11.Size = v8 + UDim2.fromOffset(0, v1(20))
    v7.Native = v11
    v6.Progress = react.createElement(Progress, v7)
    v6.Button = react.createElement(Button, {
        Text = "Apply Heat",
        Clicked = function() -- Line: 167 -- upvalues: u40 (val), u49 (val)
            u40(tick())
            u49(math.random(5, 15) / 10)
        end,
        Native = {AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.fromScale(0.975, 0.5)},
    })
    return react.createElement(Frame, v4, v6)
end
local function ForgeryMinigame(p1) -- Line: 180 -- upvalues: react (val), useRem (val), useTheme (val), useOrder (val), ForgeryHeatComponent (val), RunService (val), Frame (val), VerticalListLayout (val), Form (val), HeaderBodyComponent (val), Progress (val)
    local u10, u15, u86, u9, u90, u94, v1, v2
    u86, u90 = react.useBinding(0.5)
    u9, u10 = react.useBinding(0)
    u94, u15 = react.useState(false)
    local v3 = useRem()
    local v4 = useTheme()
    local v5 = useOrder()
    local v6 = {}
    local v7 = 3
    local v8 = 1
    local u53 = p1
    for i = 1, v7, v8 do
        v1 = tostring(i)
        if not u53.Forging then
            v2 = ""
        else
            v2 = tostring(u53.Forging.id) .. u53.Forging.offset
        end
        v6[v1 .. v2] = react.createElement(ForgeryHeatComponent, {
            Enabled = u53.Enabled,
            Ranged = function(p1) -- Line: 196 -- upvalues: u10 (val), u9 (val), u15 (val)
                if not p1 then
                    u10(u9:getValue() - 1)
                else
                    u10(u9:getValue() + 1)
                end
                if u9:getValue() == 0 then
                    u15(true)
                    return
                end
                u15(false)
            end,
        })
    end
    react.useEffect(function() -- Line: 212 -- upvalues: u53 (val), RunService (upval), u86 (val), u90 (val), u94 (val)
        if not u53.Enabled then
            return
        end
        local u2 = nil
        u2 = RunService.RenderStepped:Connect(function(p1) -- Line: 218 -- upvalues: u86 (upval), u53 (upval), u90 (upval), u2 (ref), u94 (upval)
            local v1, v2
            local v3 = u86:getValue()
            if 1 <= v3 then
                u53.Finished(true)
                u90(0.5)
                u2:Disconnect()
                return
            end
            v3 = u86:getValue()
            if v3 <= 0 then
                u53.Finished(false)
                u90(0.5)
                u2:Disconnect()
                return
            end
            if u94 then
                v2 = u86:getValue()
                v1 = v2 + p1 * 0.1
                u90((math.clamp(v1, 0, 1)))
                return
            end
            v2 = u86:getValue()
            v1 = v2 - p1 * 0.05
            u90((math.clamp(v1, 0, 1)))
        end)
        return function() -- Line: 240 -- upvalues: u2 (ref)
            u2:Disconnect()
        end
    end, {u94, u53.Enabled})
    local v9 = {Visible = u53.Enabled}
    local v10 = {Layout = react.createElement(VerticalListLayout, {VerticalAlignment = Enum.VerticalAlignment.Top, Spacing = v3(10)}), Header = react.createElement(Form.Form, {
        Height = "P_30",
        Native = {LayoutOrder = v5()},
    }, {Left = react.createElement(Form.Divider, {Side = "Left"}, {Label = react.createElement(HeaderBodyComponent, {Header = "Maintain the Heat", Body = "Maintain the proper heat to forge the ingot.", Wrap = true})})}), Progress = react.createElement(Progress, {
        Header = "Progress",
        Body = "Forge the ingot by maintaining the heat.",
        Enabled = true,
        Value = u86,
        Native = {LayoutOrder = v5()},
    })}
    local v11 = {BackgroundColor3 = v4.PageBackground, BackgroundTransparency = v4.PageTransparency}
    local v12 = UDim2.fromScale(1, 0)
    local v13 = v3(150)
    v11.Size = v12 + UDim2.fromOffset(0, v13 + v3(50))
    v11.LayoutOrder = v5()
    v10.Minigames = react.createElement(Frame, v11, {Layout = react.createElement(VerticalListLayout, {VerticalAlignment = Enum.VerticalAlignment.Center, Spacing = v3(10)}), Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 10)})}, v6)
    return react.createElement(Frame, v9, v10)
end
local function ForgeryHomePage(p1) -- Line: 298 -- upvalues: useRem (val), react (val), Form (val), HeaderBodyComponent (val), ClientInventoryHandler (val), ItemViewport (val), Button (val), ScrollingFrame (val), VerticalListLayout (val)
    local u0
    local v1 = {}
    local v2 = useRem()
    if not p1.Ores then
        v1.invalid = react.createElement(Form.Form, {}, {Left = react.createElement(Form.Divider, {Side = "Left"}, {Label = react.createElement(HeaderBodyComponent, {Header = "No ores found", Body = "You need to have ores in your inventory to forge ingots.", Wrap = true})})})
        u0 = p1
    elseif #p1.Ores ~= 0 then
        local v3, v4, v5, v6, v7, v8, v9, v10
        u0 = p1
        for k, v in pairs(p1.Ores) do
            v9 = ClientInventoryHandler.getItemNameFromHash(v.id) or ""
            v10 = ClientInventoryHandler.getItemModel(v.id)
            v3 = {}
            v4 = {}
            v5 = v10
            if v5 then
                v6 = {Model = v10}
                v7 = {}
                v8 = v2(50)
                v7.Size = UDim2.fromOffset(v8, v2(50))
                v6.Native = v7
                function v6.Render(p1) -- Line: 333 -- upvalues: ClientInventoryHandler (upval), v (val)
                    ClientInventoryHandler.onRenderItemModel(v, p1)
                end
                v5 = react.createElement(ItemViewport, v6)
            end
            v4.Viewport = v5
            v4.Label = react.createElement(HeaderBodyComponent, {Body = "Forge this ore in to an ingot.", Wrap = true, Header = table.concat(v.tags, " ") .. " " .. v9})
            v3.Left = react.createElement(Form.Divider, {Side = "Left"}, v4)
            v3.Right = react.createElement(Form.Divider, {Side = "Right"}, {Button = react.createElement(Button, {
                Text = "Forge",
                Clicked = function() -- Line: 350 -- upvalues: u0 (val), v (val)
                    u0.Forging(v)
                end,
            })})
            v1[tostring(k) .. v9] = react.createElement(Form.Form, {Height = "P_30"}, v3)
        end
    else
        v1.invalid = react.createElement(Form.Form, {}, {Left = react.createElement(Form.Divider, {Side = "Left"}, {Label = react.createElement(HeaderBodyComponent, {Header = "No ores found", Body = "You need to have ores in your inventory to forge ingots.", Wrap = true})})})
        u0 = p1
    end
    return react.createElement(ScrollingFrame, {Visible = u0.Enabled}, {Layout = react.createElement(VerticalListLayout, {VerticalAlignment = Enum.VerticalAlignment.Top})}, v1)
end
return function() -- Line: 368 -- upvalues: useInterfaceState (val), react (val), Inventory (val), Players (val), Table (val), ClientInventoryHandler (val), Frame (val), DynamicPage (val), TransparencyGroup (val), Scaler (val), Ratio (val), PageLayout (val), PageHeader (val), ForgeryHomePage (val), ForgeryMinigame (val)
    local forgery, forgery_2, u11, u12, u17, u21, u22, v1, v2
    forgery, forgery_2 = useInterfaceState("forgery")
    local v3 = forgery_2
    if not v3 then
        v3 = {visible = false}
    end
    local u7 = v3
    u11, u12 = react.useState(nil)
    v2, u17 = react.useState(u7.visible)
    u21, u22 = react.useState({})
    local v4 = react.useMemo(function() -- Line: 376 -- upvalues: u7 (ref), Inventory (upval), Players (upval), Table (upval), ClientInventoryHandler (upval), u21 (val)
        if not u7.visible then
            return {}
        end
        local v1 = Inventory.Store.get(Players.LocalPlayer)
        local v2 = Table.values(v1)
        return Table.filter(v2, function(p1) -- Line: 383 -- upvalues: ClientInventoryHandler (upval), u21 (upval)
            local v1 = ClientInventoryHandler.getItemNameFromHash(p1.id) or ""
            local v2 = string.split(v1, " ")
            if table.find(u21, p1) then
                return false
            end
            local v3 = if v2[2] ~= "Ore" then if v2[3] ~= "Ore" then v1 == "Ore" else true else true
            return v3
        end)
    end, {u7.visible, u21})
    react.useEffect(function() -- Line: 395 -- upvalues: u17 (val), u7 (ref), u12 (val)
        u17(u7.visible)
        u12(nil)
    end, {u7.visible})
    local createElement = react.createElement
    local v5 = {Page = react.createElement(DynamicPage, {Enabled = v2})}
    local createElement_2 = react.createElement
    local v6 = {
        ZIndex = 3,
        Enabled = v2,
        Tween = TweenInfo.new(0.3),
        Delays = {Enabled = 0.2, Disabled = 0},
    }
    local v7 = {}
    local createElement_3 = react.createElement
    local v8 = {
        BackgroundTransparency = 1,
        ZIndex = 2,
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(0.75, 0.865),
        AnchorPoint = Vector2.new(0.5, 0.5),
    }
    local v9 = {}
    local createElement_4 = react.createElement
    local v10 = {Ratio = react.createElement(Ratio, {Ratio = 1.241}), Layout = react.createElement(PageLayout)}
    local createElement_5 = react.createElement
    local v11 = {Header = "Forging Station", Body = "Forge your raw ores in to ingots.", Icon = "rbxassetid://14187764914"}
    if u11 then
        v1 = nil
    else
        function v1() -- Line: 427 -- upvalues: u7 (ref), forgery (val), u17 (val)
            u7.visible = false
            forgery(table.clone(u7))
            u17(false)
        end
    end
    v11.Closed = v1
    v10.Header = createElement_5(PageHeader, v11)
    local createElement_6 = react.createElement
    v11 = {Size = UDim2.fromScale(1, 0.823)}
    v1 = {}
    local v12 = {}
    local v13 = v2
    if v13 then
        v13 = not u11
    end
    v12.Enabled = v13
    v12.Ores = v4
    function v12.Forging(p1) -- Line: 443 -- upvalues: u12 (val)
        u12(p1)
    end
    v1.Home = react.createElement(ForgeryHomePage, v12)
    local createElement_7 = react.createElement
    v12 = {}
    if not v2 then
        v13 = false
    else
        v13 = not (not u11)
    end
    v12.Enabled = v13
    v12.Item = u11
    function v12.Finished(p1) -- Line: 452 -- upvalues: Inventory (upval), u11 (val), u21 (val), u22 (val), u12 (val)
        local v1
        local v2 = {hash = u11.id, offset = u11.offset}
        if not p1 then
            v1 = 0
        else
            v1 = 1
        end
        v2.success = v1
        Inventory.Forge.post(v2)
        table.insert(u21, u11)
        u22(table.clone(u21))
        u12(nil)
    end
    v1.Forging = createElement_7(ForgeryMinigame, v12)
    v10.Content = createElement_6(Frame, v11, v1)
    v9.Scaler = createElement_4(Scaler, {
        Enabled = v2,
        Delay = {Enabled = 0.2, Disabled = 0},
    }, v10)
    v7.Content = createElement_3("Frame", v8, v9)
    v5.Transparency = createElement_2(TransparencyGroup, v6, v7)
    return createElement(Frame, {}, v5)
end