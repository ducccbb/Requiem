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
--File: ReplicatedStorage.Client.Interfaces.Routes.Menu.Subpages.Progression.Subpages.DisciplinesPage
--                               Dumped in 0.00358 seconds
--                          Bytecode version 9  |  14 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Progression = Common:WaitForChild("Progression")
local Disciplines_3 = Progression:WaitForChild("Disciplines")
local Disciplines = require(Disciplines_3:WaitForChild("Disciplines"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Network = Common_2:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Disciplines_2 = require(Namespaces:WaitForChild("Disciplines"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_3:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_4:WaitForChild("Client")
local Interfaces = Client:WaitForChild("Interfaces")
local Components = Interfaces:WaitForChild("Components")
local Universal = Components:WaitForChild("Universal")
local Form = require(Universal:WaitForChild("Form"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_5:WaitForChild("Client")
local Interfaces_2 = Client_2:WaitForChild("Interfaces")
local Components_2 = Interfaces_2:WaitForChild("Components")
local Primitives = Components_2:WaitForChild("Primitives")
local Frame = require(Primitives:WaitForChild("Frame"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_6:WaitForChild("Client")
local Interfaces_3 = Client_3:WaitForChild("Interfaces")
local Components_3 = Interfaces_3:WaitForChild("Components")
local Universal_2 = Components_3:WaitForChild("Universal")
local HeaderBodyComponent = require(Universal_2:WaitForChild("HeaderBodyComponent"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_7:WaitForChild("Client")
local Interfaces_4 = Client_4:WaitForChild("Interfaces")
local Components_4 = Interfaces_4:WaitForChild("Components")
local Inputs = Components_4:WaitForChild("Inputs")
local Button = require(Inputs:WaitForChild("Button"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Client_5 = ReplicatedStorage_8:WaitForChild("Client")
local Interfaces_5 = Client_5:WaitForChild("Interfaces")
local Components_5 = Interfaces_5:WaitForChild("Components")
local Primitives_2 = Components_5:WaitForChild("Primitives")
local VerticalListLayout = require(Primitives_2:WaitForChild("VerticalListLayout"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Client_6 = ReplicatedStorage_9:WaitForChild("Client")
local Interfaces_6 = Client_6:WaitForChild("Interfaces")
local Hooks = Interfaces_6:WaitForChild("Hooks")
local useDebounceState = require(Hooks:WaitForChild("useDebounceState"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Client_7 = ReplicatedStorage_10:WaitForChild("Client")
local Interfaces_7 = Client_7:WaitForChild("Interfaces")
local Hooks_2 = Interfaces_7:WaitForChild("Hooks")
local useOrder = require(Hooks_2:WaitForChild("useOrder"))
local ReplicatedStorage_11 = game:GetService("ReplicatedStorage")
local Client_8 = ReplicatedStorage_11:WaitForChild("Client")
local Interfaces_8 = Client_8:WaitForChild("Interfaces")
local Hooks_3 = Interfaces_8:WaitForChild("Hooks")
local useRem = require(Hooks_3:WaitForChild("useRem"))
local ReplicatedStorage_12 = game:GetService("ReplicatedStorage")
local Client_9 = ReplicatedStorage_12:WaitForChild("Client")
local Interfaces_9 = Client_9:WaitForChild("Interfaces")
local Hooks_4 = Interfaces_9:WaitForChild("Hooks")
local useStore = require(Hooks_4:WaitForChild("useStore"))
local ReplicatedStorage_13 = game:GetService("ReplicatedStorage")
local Client_10 = ReplicatedStorage_13:WaitForChild("Client")
local Interfaces_10 = Client_10:WaitForChild("Interfaces")
local Hooks_5 = Interfaces_10:WaitForChild("Hooks")
local useTheme = require(Hooks_5:WaitForChild("useTheme"))
local ReplicatedStorage_14 = game:GetService("ReplicatedStorage")
local Client_11 = ReplicatedStorage_14:WaitForChild("Client")
local Interfaces_11 = Client_11:WaitForChild("Interfaces")
local Hooks_6 = Interfaces_11:WaitForChild("Hooks")
local useToast = require(Hooks_6:WaitForChild("useToast"))
local function DisciplinesComponent(p1) -- Line: 40 -- upvalues: useDebounceState (val), useRem (val), useTheme (val), react (val), Frame (val)
    local icon, u12, u5, u6, v1, v2, v3, v4, v5
    u5, u6 = useDebounceState(Vector2.new(), {wait = 0.5, leading = true})
    local v6 = {wait = 0.5, leading = true}
    v4, u12 = useDebounceState(Vector2.new(), v6)
    local u14 = useRem()
    local u16 = useTheme()
    local v7 = {u5, v4, p1.Tree}
    v5 = react.useMemo(function() -- Line: 46 -- upvalues: p1 (val), react (upval), Frame (upval), u14 (val), u16 (val), u5 (val)
        local Tree, createChildUnlockNodes, secondary_requirement, v1, v2, v3, v4, v5
        local u45 = {}
        local u5 = Color3.fromRGB(255, 255, 255)
        local u9 = Vector2.new(0.5, 0.1)
        local v6 = p1.Tree[1]
        if not v6 then
            return u45
        end
        local function getNodeUnlocks(a1) -- Line: 60 -- upvalues: p1 (upval)
            local requirements, v1, v2
            local v3 = {}
            local Tree = p1.Tree
            local v4 = nil
            local v5 = nil
            local v6 = a1
            for i, j in Tree, v4, v5 do
                if j.requirements then
                    requirements = j.requirements
                    v1 = nil
                    v2 = nil
                    for k, n in requirements, v1, v2 do
                        if n == v6.name then
                            table.insert(v3, j.name)
                        end
                    end
                end
            end
            return v3
        end
        local function getNodeFromName(a1) -- Line: 77 -- upvalues: p1 (upval)
            local Tree = p1.Tree
            local v1 = nil
            local v2 = nil
            for i, j in Tree, v1, v2 do
                if j.name == a1 then
                    return j
                end
            end
            return nil
        end
        v6.position = u9
        local function createNodeComponent(p1, p2) -- Line: 91 -- upvalues: react (upval), Frame (upval), u14 (upval), u5 (val), u16 (upval)
            local v1, v2, v3, v4, v5
            if not p1.position then
                return
            end
            local v6 = {BackgroundTransparency = 1, ZIndex = 2, Position = UDim2.fromScale(p1.position.X, p1.position.Y), Size = UDim2.fromOffset(70, 70)}
            local v7 = {}
            local v8 = {BackgroundTransparency = 1, ZIndex = 3, Position = UDim2.fromScale(0.5, 0.5), AnchorPoint = Vector2.new(0.5, 0.5)}
            local v9 = u14(50)
            v8.Size = UDim2.fromOffset(v9, u14(50))
            v8.Image = p1.icon or "rbxassetid://124811625794762"
            if not p1.__unlocked then
                v5 = 0.8
            else
                v5 = 0.4
            end
            v8.ImageTransparency = v5
            v8.ImageColor3 = u5
            v7.Icon = react.createElement("ImageLabel", v8)
            v8 = {BackgroundTransparency = 0, ZIndex = 2, Position = UDim2.fromScale(0.5, 0.5), AnchorPoint = Vector2.new(0.5, 0.5)}
            if not p1.__isLeaf then
                v1 = 0
            else
                v1 = 10
            end
            v9 = u14(70 + v1)
            if not p1.__isLeaf then
                v2 = 0
            else
                v2 = 10
            end
            v8.Size = UDim2.fromOffset(v9, u14(70 + v2))
            v8.BackgroundColor3 = u16.PageBackground
            if not p1.__isOrigin then
                v5 = 45
            else
                v5 = 0
            end
            v8.Rotation = v5
            v5 = {}
            local v10 = {}
            if not p1.__isLeaf then
                v2 = 0
            else
                v2 = 1
            end
            v10.CornerRadius = UDim.new(v2, 0)
            v5.Corner = react.createElement("UICorner", v10)
            v10 = {Thickness = 1, Color = u5}
            if not p1.__unlocked then
                v1 = 0.8
            else
                v1 = 0.5
            end
            v10.Transparency = v1
            v5.Stroke = react.createElement("UIStroke", v10)
            v10 = {BackgroundTransparency = 1, ZIndex = 2, Position = UDim2.fromScale(0.5, 0.5), AnchorPoint = Vector2.new(0.5, 0.5)}
            v2 = UDim2.fromScale(1, 1)
            local v11 = u14(10)
            v10.Size = v2 + UDim2.fromOffset(v11, u14(10))
            v1 = {}
            v11 = {}
            if not p1.__isLeaf then
                v4 = 0
            else
                v4 = 1
            end
            v11.CornerRadius = UDim.new(v4, 0)
            v1.Corner = react.createElement("UICorner", v11)
            v11 = {Thickness = 1, Color = u5}
            if not p1.__unlocked then
                v3 = 0.8
            else
                v3 = 0.7
            end
            v11.Transparency = v3
            v1.Stroke = react.createElement("UIStroke", v11)
            v5.Outline = react.createElement("Frame", v10, v1)
            v7.Diamond = react.createElement("Frame", v8, v5)
            return react.createElement(Frame, v6, v7)
        end
        local function createLineComponent(p1, p2, p3) -- Line: 160 -- upvalues: u5 (upval), react (upval), u5 (val)
            local v1, v2, v3, v4, v5, v6, v7
            if not p1.position or not p2.position then
                return nil
            end
            local v8 = p1.position.X * u5.X
            local v9 = p1.position.Y * u5.Y
            local v10 = p2.position.X * u5.X
            local v11 = p2.position.Y * u5.Y
            local v12 = v10 - v8
            local v13 = v11 - v9
            local v14 = math.sqrt(v12 * v12 + v13 * v13)
            local v15 = math.atan2(v13, v12)
            if not p3 then
                local v16
                v1 = UDim2.fromOffset((v8 + v10) / 2 - v14 / 2, (v9 + v11) / 2 - 1)
                v2 = UDim2.fromOffset(v14, 2)
                local v17 = {BorderSizePixel = 0, Position = v1, Size = v2, BackgroundColor3 = u5}
                if not p2.__unlocked then
                    v16 = 0.92
                else
                    v16 = 0.7
                end
                v17.BackgroundTransparency = v16
                v17.Rotation = math.deg(v15)
                v17.AnchorPoint = Vector2.new(0, 0.5)
                return react.createElement("Frame", v17)
            end
            local v18 = math.floor(v14 / 14)
            local v19 = {}
            v1 = v18
            v2 = 1
            local v20 = p2
            for i = 1, v1, v2 do
                v3 = (i - 1) * 14
                v4 = UDim2.fromOffset(v8 + v12 / v14 * (v3 + 4) - 4, v9 + v13 / v14 * (v3 + 4) - 1)
                v5 = tostring(i)
                v6 = {BorderSizePixel = 0, Position = v4, Size = UDim2.fromOffset(3, 3), BackgroundColor3 = u5}
                if not v20.__unlocked then
                    v7 = 0.92
                else
                    v7 = 0.7
                end
                v6.BackgroundTransparency = v7
                v6.Rotation = math.deg(v15)
                v6.AnchorPoint = Vector2.new(0, 0.5)
                v19[v5] = react.createElement("Frame", v6, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(1, 0)})})
            end
            return react.createElement(react.Fragment, {}, v19)
        end
        function createChildUnlockNodes(p1, p2) -- Line: 236 -- upvalues: u45 (val), createNodeComponent (val), getNodeUnlocks (val), getNodeFromName (val), u9 (val), createLineComponent (val), createChildUnlockNodes (val)
            local unlocks, v1, v2, v3, v4, v5
            u45[p1.name] = createNodeComponent(p1, p2)
            p1.unlocks = getNodeUnlocks(p1)
            if not p1.unlocks or #p1.unlocks == 0 then
                return
            end
            unlocks = p1.unlocks
            local v6 = nil
            local v7 = nil
            local v8 = p1
            for i, j in unlocks, v6, v7 do
                v3 = getNodeFromName(j)
                if v3 and v8.position then
                    if #v8.unlocks == 1 then
                        v3.position = Vector2.new(v8.position.X, v8.position.Y + 0.2)
                    elseif v8.position == u9 then
                        v3.position = Vector2.new(v8.position.X + -(#v8.unlocks - 1) * 0.2 / 2 + 0.2 * (i - 1), v8.position.Y + 0.2)
                    elseif i == 1 then
                        v3.position = Vector2.new(v8.position.X, v8.position.Y + 0.2)
                    elseif i == 2 then
                        v4 = v8.position.X - -0.2
                        v5 = v8.position.X + -0.2
                        v1 = math.abs(v4 - 0.5)
                        if math.abs(v5 - 0.5) >= v1 then
                            v2 = v5
                        else
                            v2 = v4
                        end
                        v3.position = Vector2.new(v2, v8.position.Y)
                        v3.__isLeaf = true
                    end
                    u45[v8.name .. v3.name] = createLineComponent(v8, v3)
                    createChildUnlockNodes(v3)
                end
            end
        end
        createChildUnlockNodes(v6, true)
        Tree = p1.Tree
        v1 = nil
        v2 = nil
        for i, j in Tree, v1, v2 do
            if j.secondary_requirement then
                secondary_requirement = j.secondary_requirement
                v3 = nil
                v4 = nil
                for k, n in secondary_requirement, v3, v4 do
                    v5 = getNodeFromName(n)
                    if v5 then
                        u45[j.name .. n] = createLineComponent(j, v5, true)
                    end
                end
            end
        end
        return u45
    end, v7)
    local createElement = react.createElement
    v1 = {AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5), Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1}
    v1[react.Change.AbsoluteSize] = function(p1) -- Line: 321 -- upvalues: u6 (val)
        u6(p1.AbsoluteSize)
    end
    v1[react.Change.AbsolutePosition] = function(p1) -- Line: 325 -- upvalues: u12 (val)
        u12(p1.AbsolutePosition)
    end
    v2 = {Ratio = react.createElement("UIAspectRatioConstraint", {AspectRatio = 1})}
    local createElement_2 = react.createElement
    v3 = {ImageTransparency = 0.98, BackgroundTransparency = 1, ZIndex = 0}
    if not (p1.Tree[1]) then
        icon = "rbxassetid://124811625794762"
    else
        icon = p1.Tree[1].icon
        if not icon then
            icon = "rbxassetid://124811625794762"
        end
    end
    v3.Image = icon
    v3.Position = UDim2.fromScale(0.5, 0.4)
    v3.AnchorPoint = Vector2.new(0.5, 0.5)
    v3.Size = UDim2.fromScale(1, 1)
    v2.BackgroundImage = createElement_2("ImageLabel", v3)
    return createElement("Frame", v1, v2, v5)
end
return function(p1) -- Line: 342 -- upvalues: useRem (val), useOrder (val), useToast (val), react (val), useStore (val), Disciplines_2 (val), Disciplines (val), Form (val), HeaderBodyComponent (val), Button (val), Frame (val), DisciplinesComponent (val), VerticalListLayout (val)
    local u11, u215, v1, v2, v3, v4, v5, v6, v7
    local v8 = useRem()
    local v9 = useOrder()
    useToast()
    u215, u11 = react.useState(nil)
    local u16 = useStore(Disciplines_2.Store, function(p1) -- Line: 348
        local v1 = p1
        if not v1 then
            v1 = {}
        end
        return v1
    end)
    if not u215 then
        v7 = {}
    else
        v7 = Disciplines.getDisciplineTree(u215)
    end
    react.useEffect(function() -- Line: 354 -- upvalues: u215 (val), u16 (val), u11 (val)
        if not u215 then
            local v1 = #u16
            if 0 < v1 then
                u11(u16[1].name)
            end
        end
    end, {u16, u215})
    local v10 = {}
    local v11 = u16
    local v12 = nil
    local v13 = nil
    for i, j in v11, v12, v13 do
        v1 = {
            Native = {LayoutOrder = v9()},
        }
        v2 = {}
        v3 = {}
        v4 = {BackgroundTransparency = 1, ImageTransparency = 0.75, Image = Disciplines.Icons[j.name]}
        v6 = v8(45)
        v4.Size = UDim2.fromOffset(v6, v8(45))
        v4.LayoutOrder = v9()
        v4.ResampleMode = Enum.ResamplerMode.Pixelated
        v3.Icon = react.createElement("ImageLabel", v4, {Ratio = react.createElement("UIAspectRatioConstraint", {AspectRatio = 1})})
        v4 = {Wrap = true, Header = "Discipline of " .. j.name, Body = Disciplines.Descriptions[j.name]}
        v5 = {BackgroundTransparency = 1, LayoutOrder = v9()}
        v4.Native = v5
        v3.Progress = react.createElement(HeaderBodyComponent, v4)
        v2.Left = react.createElement(Form.Divider, {Side = "Left", Width = 0.85}, v3)
        v3 = {}
        v4 = {Text = "View Discipline"}
        v5 = u215 == j.name
        v4.Disabled = v5
        function v4.Clicked() -- Line: 403 -- upvalues: u11 (val), j (val)
            u11(j.name)
        end
        v3.Button = react.createElement(Button, v4)
        v2.Right = react.createElement(Form.Divider, {Side = "Right", Width = 0.1}, v3)
        v10[j.name] = react.createElement(Form.Form, v1, v2)
    end
    v13 = {Visible = p1.Enabled}
    local v14 = {}
    local createElement = react.createElement
    local v15 = {BackgroundTransparency = 1, AnchorPoint = Vector2.new(0, 0)}
    v1 = UDim2.fromScale(0, 0)
    v15.Position = v1 + UDim2.fromOffset(0, v8(0))
    v15.Size = UDim2.fromScale(0.5, 1)
    v14.Left = createElement(Frame, v15, {Tree = react.createElement(DisciplinesComponent, {Tree = v7})})
    v14.Right = react.createElement(Frame, {BackgroundTransparency = 1, AnchorPoint = Vector2.new(1, 0), Position = UDim2.fromScale(1, 0), Size = UDim2.fromScale(0.5, 1)}, {Layout = react.createElement(VerticalListLayout, {Spacing = 5, VerticalAlignment = Enum.VerticalAlignment.Top})}, v10)
    return react.createElement(Frame, v13, v14)
end