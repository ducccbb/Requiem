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
--   File: ReplicatedStorage.Client.Interfaces.Routes.Pages.Construction.Construction
--                               Dumped in 0.00155 seconds
--                          Bytecode version 9  |  7 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Construction = require(Namespaces:WaitForChild("Construction"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_2:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local Components = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Screen = Components:WaitForChild("Screen")
local DynamicPage = require(Screen:WaitForChild("DynamicPage"))
local Components_2 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Primitives = Components_2:WaitForChild("Primitives")
local Frame = require(Primitives:WaitForChild("Frame"))
local Components_3 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Menu = Components_3:WaitForChild("Menu")
local Header = Menu:WaitForChild("Header")
local PageHeader = require(Header:WaitForChild("PageHeader"))
local Components_4 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Menu_2 = Components_4:WaitForChild("Menu")
local PageLayout = require(Menu_2:WaitForChild("PageLayout"))
local Components_5 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Universal = Components_5:WaitForChild("Universal")
local Progress = require(Universal:WaitForChild("Progress"))
local Components_6 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Primitives_2 = Components_6:WaitForChild("Primitives")
local Ratio = require(Primitives_2:WaitForChild("Ratio"))
local Components_7 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Utilities = Components_7:WaitForChild("Utilities")
local Scaler = require(Utilities:WaitForChild("Scaler"))
local Components_8 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Utilities_2 = Components_8:WaitForChild("Utilities")
local TransparencyGroup = require(Utilities_2:WaitForChild("TransparencyGroup"))
local Components_9 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Primitives_3 = Components_9:WaitForChild("Primitives")
local VerticalListLayout = require(Primitives_3:WaitForChild("VerticalListLayout"))
local Hooks = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useInterfaceState = require(Hooks:WaitForChild("useInterfaceState"))
local Hooks_2 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useOrder = require(Hooks_2:WaitForChild("useOrder"))
local Hooks_3 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useRem = require(Hooks_3:WaitForChild("useRem"))
return function() -- Line: 56 -- upvalues: useRem (val), useOrder (val), useInterfaceState (val), react (val), HttpService (val), Progress (val), Construction (val), Frame (val), DynamicPage (val), TransparencyGroup (val), Scaler (val), Ratio (val), PageLayout (val), PageHeader (val), VerticalListLayout (val)
    local construction, construction_2, current, materials, materials_2, required, u15, u16, u329, v1, v2, v3
    local v4 = useRem()
    local v5 = useOrder()
    construction, construction_2 = useInterfaceState("construction")
    local v6 = construction_2
    if not v6 then
        v6 = {visible = false}
    end
    local u301 = v6
    u15, u16 = react.useState(nil)
    v3, u329 = react.useState(u301.visible)
    react.useEffect(function() -- Line: 66 -- upvalues: u329 (val), u301 (ref), HttpService (upval), u16 (val)
        u329(u301.visible)
        local u38 = nil
        if u301.model and u301.model:GetAttribute("Data") then
            local v1 = HttpService:JSONDecode(u301.model:GetAttribute("Data"))
            u16(table.clone(v1))
            local AttributeChangedSignal = u301.model:GetAttributeChangedSignal("Data")
            u38 = AttributeChangedSignal:Connect(function() -- Line: 75 -- upvalues: u301 (upval), HttpService (upval), u16 (upval)
                local Attribute = u301.model:GetAttribute("Data")
                local v1 = HttpService:JSONDecode(Attribute)
                u16(table.clone(v1))
            end)
        end
        return function() -- Line: 83 -- upvalues: u38 (ref)
            if u38 then
                u38:Disconnect()
            end
        end
    end, {u301.visible})
    local v7 = {}
    local v8 = true
    local v9 = pairs
    if not u15 then
        materials = {}
    else
        materials = u15.materials
    end
    for k, v in v9(materials) do
        if v.current < v.required then
            v8 = false
            break
        end
    end
    if v8 then
        local health, maxhealth
        local createElement = react.createElement
        local v10 = {Header = "Construction Site", Body = "Use a hammer in order to construct the prefab.", Animated = true}
        if not u15 then
            health = 0
        else
            health = u15.health
        end
        v10.Value = health
        local v11 = {Min = 0}
        if not u15 then
            maxhealth = 0
        else
            maxhealth = u15.maxhealth
        end
        v11.Max = maxhealth
        v10.Range = v11
        v10.Native = {LayoutOrder = v5()}
        v7.progress_bar = createElement(Progress, v10)
    end
    v9 = pairs
    if not u15 then
        materials_2 = {}
    else
        materials_2 = u15.materials
    end
    for k2, i in v9(materials_2) do
        required = i.required
        current = i.current
        v1 = {Animated = true, Value = i.current, Header = k2}
        if not v8 then
            v2 = "You need to provide " .. tostring(required - current) .. " more of this material."
        else
            v2 = "This material has been fully provided."
        end
        v1.Body = v2
        if current >= required then
            v2 = nil
        else
            v2 = "Provide"
        end
        v1.Button = v2
        function v1.Clicked() -- Line: 136 -- upvalues: Construction (upval), u15 (val), k2 (val)
            local id
            local post = Construction.Provide.post
            local v1 = {}
            if not u15 then
                id = 0
            else
                id = u15.id
                if not id then
                    id = 0
                end
            end
            v1.id = id
            v1.name = k2
            post(v1)
        end
        v1.Range = {Min = 0, Max = i.required}
        v1.Native = {LayoutOrder = v5()}
        v7[k2] = react.createElement(Progress, v1)
    end
    return react.createElement(Frame, {}, {Page = react.createElement(DynamicPage, {Enabled = v3}), react.createElement(TransparencyGroup, {
        ZIndex = 3,
        Enabled = v3,
        Tween = TweenInfo.new(0.3),
        Delays = {Enabled = 0.2, Disabled = 0},
    }, {Content = react.createElement("Frame", {
        BackgroundTransparency = 1,
        ZIndex = 2,
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(0.75, 0.865),
        AnchorPoint = Vector2.new(0.5, 0.5),
    }, {Scaler = react.createElement(Scaler, {
        Enabled = v3,
        Delay = {Enabled = 0.2, Disabled = 0},
    }, {Ratio = react.createElement(Ratio, {Ratio = 1.241}), Layout = react.createElement(PageLayout), Header = react.createElement(PageHeader, {
        Header = "Construction Site",
        Body = "Provide the materials outlined to create the prefab.",
        Icon = "rbxassetid://12967712847",
        Closed = function() -- Line: 182 -- upvalues: u301 (ref), construction (val), u329 (val)
            u301.visible = false
            construction(table.clone(u301))
            u329(false)
        end,
    }), Content = react.createElement(Frame, {Size = UDim2.fromScale(1, 0.823)}, {Layout = react.createElement(VerticalListLayout, {VerticalAlignment = Enum.VerticalAlignment.Top, Spacing = v4(10)})}, v7)})})})})
end