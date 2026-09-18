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
--    File: ReplicatedStorage.Client.Interfaces.Routes.Menu.Stories.Disciplines.story
--                               Dumped in 0.00339 seconds
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
local Components = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Utilities = Components:WaitForChild("Utilities")
local QuickStory = require(Utilities:WaitForChild("QuickStory"))
local Components_2 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Utilities_2 = Components_2:WaitForChild("Utilities")
require(Utilities_2:WaitForChild("Color"))
local Components_3 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Primitives = Components_3:WaitForChild("Primitives")
local Frame = require(Primitives:WaitForChild("Frame"))
local Components_4 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Universal = Components_4:WaitForChild("Universal")
local Storybox = require(Universal:WaitForChild("Storybox"))
local Hooks = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useDebounceState = require(Hooks:WaitForChild("useDebounceState"))
local Hooks_2 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useRem = require(Hooks_2:WaitForChild("useRem"))
local Hooks_3 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useTheme = require(Hooks_3:WaitForChild("useTheme"))
local v3 = {}
local u142 = {}
local v4 = {name = "Manuevering Gear", description = "You can now use your manuevering gear with decent capabilities.", icon = "rbxassetid://84319030405944", __unlocked = true}
local v5 = {
    name = "Precise Slash",
    description = "You can now hold your blades and percisely slash.",
    icon = "rbxassetid://115560520059804",
    __unlocked = true,
    requirements = {"Manuevering Gear"},
}
local v6 = {
    name = "Battle Instinct",
    description = "Slashing at the same time as an opponent will now initiate a clash.",
    icon = "rbxassetid://115560520059804",
    __unlocked = true,
    requirements = {"Precise Slash"},
}
local v7 = {
    name = "Reelstrike",
    description = "If hooked on a target, and reeling, when in range, you will now lunge and attack.",
    icon = "rbxassetid://115560520059804",
    requirements = {"Battle Instinct"},
    secondary_requirement = {"Quick Recovery"},
}
local v8 = {
    name = "Yanking",
    description = "Dashing backwards while grappling on a target, will now yank the target towards you.",
    icon = "rbxassetid://115560520059804",
    requirements = {"Reelstrike"},
}
local v9 = {
    name = "Quickdraw",
    description = "Holding your handles key, while they are away, will now take them out and do a quick slash.",
    icon = "rbxassetid://115560520059804",
    requirements = {"Reelstrike"},
}
local v10 = {
    name = "Quick Reflexes",
    description = "You can now dash with your manuevering gear, by double tapping movement keys.",
    icon = "rbxassetid://84319030405944",
    __unlocked = true,
    requirements = {"Manuevering Gear"},
}
local v11 = {
    name = "Quick Recovery",
    description = "You can now press 'shift' while sliding to come to a quick stop.",
    icon = "rbxassetid://84319030405944",
    requirements = {"Quick Reflexes"},
}
local v12 = {
    name = "Point Launch",
    description = "You can now press 'space' while sliding to launch yourself forward.",
    icon = "rbxassetid://84319030405944",
    requirements = {"Quick Recovery"},
}
local v13 = {
    name = "Downshift",
    description = "You can now double tap 'shift' in the air to launch downwards.",
    icon = "rbxassetid://84319030405944",
    requirements = {"Quick Recovery"},
}
local v14 = {
    name = "Aero Vault",
    description = "You can now double tap 'space' while falling to launch upwards.",
    icon = "rbxassetid://84319030405944",
    requirements = {"Point Launch"},
}
local v15 = {"Anchor Sliding"}
v14.secondary_requirement = v15
u142[1] = v4
u142[2] = v5
u142[3] = v6
u142[4] = v7
u142[5] = v8
u142[6] = v9
u142[7] = v10
u142[8] = v11
u142[9] = v12
u142[10] = v13
u142[11] = {
    name = "Wall Running",
    description = "If grappling along a wall, you will now run along the wall.",
    icon = "rbxassetid://84319030405944",
    requirements = {"Downshift"},
}
u142[12] = {
    name = "Anchor Sliding",
    description = "You can now control the direction of your ground slide.",
    icon = "rbxassetid://84319030405944",
    requirements = {"Wall Running"},
}
u142[13] = v14
local function DisciplinesComponent() -- Line: 168 -- upvalues: useDebounceState (val), useRem (val), useTheme (val), react (val), u142 (val), Frame (val)
    local u11, u4, u5, v1, v2, v3
    u4, u5 = useDebounceState(Vector2.new(), {wait = 0.5, leading = true})
    local v4 = {wait = 0.5, leading = true}
    v1, u11 = useDebounceState(Vector2.new(), v4)
    local u13 = useRem()
    local u15 = useTheme()
    local v5 = {u4, v1}
    v2 = react.useMemo(function() -- Line: 174 -- upvalues: u142 (upval), react (upval), Frame (upval), u13 (val), u15 (val), u4 (val)
        local createChildUnlockNodes, secondary_requirement, v1, v2, v3, v4, v5, v6
        local u43 = {}
        local u5 = Color3.fromRGB(255, 255, 255)
        local u9 = Vector2.new(0.5, 0.1)
        local v7 = u142[1]
        local function getNodeUnlocks(p1) -- Line: 185 -- upvalues: u142 (upval)
            local requirements, v1, v2
            local v3 = {}
            local v4 = u142
            local v5 = nil
            local v6 = nil
            local v7 = p1
            for i, j in v4, v5, v6 do
                if j.requirements then
                    requirements = j.requirements
                    v1 = nil
                    v2 = nil
                    for k, n in requirements, v1, v2 do
                        if n == v7.name then
                            table.insert(v3, j.name)
                        end
                    end
                end
            end
            return v3
        end
        local function getNodeFromName(p1) -- Line: 202 -- upvalues: u142 (upval)
            local v1 = u142
            local v2 = nil
            local v3 = nil
            for i, j in v1, v2, v3 do
                if j.name == p1 then
                    return j
                end
            end
            return nil
        end
        v7.position = u9
        local function createNodeComponent(p1, p2) -- Line: 216 -- upvalues: react (upval), Frame (upval), u13 (upval), u5 (val), u15 (upval)
            local v1, v2, v3, v4, v5
            if not p1.position then
                return
            end
            local v6 = {BackgroundTransparency = 1, ZIndex = 2, Position = UDim2.fromScale(p1.position.X, p1.position.Y), Size = UDim2.fromOffset(50, 50)}
            local v7 = {}
            local v8 = {BackgroundTransparency = 1, ZIndex = 3, Position = UDim2.fromScale(0.5, 0.5), AnchorPoint = Vector2.new(0.5, 0.5)}
            local v9 = u13(40)
            v8.Size = UDim2.fromOffset(v9, u13(40))
            v8.Image = p1.icon or "rbxassetid://124811625794762"
            if not p1.__unlocked then
                v5 = 0.5
            else
                v5 = 0.3
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
            v9 = u13(50 + v1)
            if not p1.__isLeaf then
                v2 = 0
            else
                v2 = 10
            end
            v8.Size = UDim2.fromOffset(v9, u13(50 + v2))
            v8.BackgroundColor3 = u15.PageBackground
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
            local v11 = u13(10)
            v10.Size = v2 + UDim2.fromOffset(v11, u13(10))
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
                v3 = 1
            else
                v3 = 0.9
            end
            v11.Transparency = v3
            v1.Stroke = react.createElement("UIStroke", v11)
            v5.Outline = react.createElement("Frame", v10, v1)
            v7.Diamond = react.createElement("Frame", v8, v5)
            return react.createElement(Frame, v6, v7)
        end
        local function createLineComponent(p1, p2, p3) -- Line: 283 -- upvalues: u4 (upval), react (upval), u5 (val)
            local v1, v2, v3, v4, v5, v6, v7
            if not p1.position or not p2.position then
                return nil
            end
            local v8 = p1.position.X * u4.X
            local v9 = p1.position.Y * u4.Y
            local v10 = p2.position.X * u4.X
            local v11 = p2.position.Y * u4.Y
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
        function createChildUnlockNodes(p1, p2) -- Line: 355 -- upvalues: u43 (val), createNodeComponent (val), getNodeUnlocks (val), getNodeFromName (val), u9 (val), createLineComponent (val), createChildUnlockNodes (val)
            local unlocks, v1, v2, v3, v4, v5
            u43[p1.name] = createNodeComponent(p1, p2)
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
                    u43[v8.name .. v3.name] = createLineComponent(v8, v3)
                    createChildUnlockNodes(v3)
                end
            end
        end
        createChildUnlockNodes(v7, true)
        v6 = u142
        v1 = nil
        v2 = nil
        for i, j in v6, v1, v2 do
            if j.secondary_requirement then
                secondary_requirement = j.secondary_requirement
                v3 = nil
                v4 = nil
                for k, n in secondary_requirement, v3, v4 do
                    v5 = getNodeFromName(n)
                    if v5 then
                        u43[j.name .. n] = createLineComponent(j, v5, true)
                    end
                end
            end
        end
        return u43
    end, v5)
    v3 = {AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5), Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1}
    v3[react.Change.AbsoluteSize] = function(p1) -- Line: 440 -- upvalues: u5 (val)
        u5(p1.AbsoluteSize)
    end
    v3[react.Change.AbsolutePosition] = function(p1) -- Line: 444 -- upvalues: u11 (val)
        u11(p1.AbsolutePosition)
    end
    return react.createElement("Frame", v3, {}, v2)
end
return QuickStory(v3, function(p1) -- Line: 450 -- upvalues: react (val), Storybox (val), DisciplinesComponent (val)
    return react.createElement(Storybox, {Size = 0.9}, {Content = react.createElement("Frame", {BackgroundTransparency = 1, Position = UDim2.fromScale(0.5, 0.5), Size = UDim2.fromScale(0.75, 0.865), AnchorPoint = Vector2.new(0.5, 0.5)}, {Ratio = react.createElement("UIAspectRatioConstraint", {AspectRatio = 1.241})}, {Disciplines = react.createElement(DisciplinesComponent, {})})})
end)