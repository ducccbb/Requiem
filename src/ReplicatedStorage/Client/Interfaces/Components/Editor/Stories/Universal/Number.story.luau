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
--File: ReplicatedStorage.Client.Interfaces.Components.Editor.Stories.Universal.Number.story
--                              Dumped in 0.000712 seconds
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
local Universal = v1.Parent.Parent.Parent:WaitForChild("Universal")
local Number = require(Universal:WaitForChild("Number"))
local Utilities = v1.Parent.Parent.Parent.Parent:WaitForChild("Utilities")
local QuickStory = require(Utilities:WaitForChild("QuickStory"))
local function Story() -- Line: 23 -- upvalues: react (val), Number (val)
    local u3, u4
    u3, u4 = react.useState({
        NoCheckboxNoLabel = 10,
        NoCheckboxWithLabel = 10,
        CheckboxNoLabel = 10,
        CheckboxWithLabel = 10,
        LowIncrementWithSuffix = 10,
        AllowNegativeNumbers = 1,
        ClampedNumberRange = 1,
    })
    local v1 = react.useMemo(function() -- Line: 34 -- upvalues: u3 (val)
        return u3.NoCheckboxNoLabel + u3.NoCheckboxWithLabel + u3.CheckboxNoLabel + u3.CheckboxWithLabel + u3.LowIncrementWithSuffix + u3.AllowNegativeNumbers + u3.ClampedNumberRange
    end, {u3})
    local v2 = {Sum = react.createElement("TextLabel", {
        TextScaled = true,
        TextSize = 14,
        BackgroundTransparency = 1,
        Text = ("Sum: %*"):format(v1),
        TextColor3 = Color3.fromRGB(255, 255, 255),
        Size = UDim2.fromOffset(200, 20),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.4),
    }), NoCheckboxNoLabel = react.createElement(Number, {
        Default = 10,
        Update = function(p1) -- Line: 60 -- upvalues: u3 (val), u4 (val)
            u3.NoCheckboxNoLabel = p1
            u4(table.clone(u3))
        end,
    })}
    local v3 = {Default = 10, Header = "Number"}
    local v4 = {}
    local v5 = UDim2.fromScale(0.5, 0.5)
    v4.Position = v5 + UDim2.fromOffset(0, 50)
    v3.Native = v4
    function v3.Update(p1) -- Line: 74 -- upvalues: u3 (val), u4 (val)
        u3.NoCheckboxWithLabel = p1
        u4(table.clone(u3))
    end
    v2.NoCheckboxWithLabel = react.createElement(Number, v3)
    v3 = {
        Default = 10,
        Toggleable = {Visible = true, Default = true},
    }
    v4 = {}
    v5 = UDim2.fromScale(0.5, 0.5)
    v4.Position = v5 + UDim2.fromOffset(0, 100)
    v3.Native = v4
    function v3.Update(p1) -- Line: 91 -- upvalues: u3 (val), u4 (val)
        u3.CheckboxNoLabel = p1
        u4(table.clone(u3))
    end
    v2.CheckboxNoLabel = react.createElement(Number, v3)
    v3 = {
        Default = 10,
        Header = "Checkbox Label",
        Toggleable = {Visible = true, Default = true},
    }
    v4 = {}
    v5 = UDim2.fromScale(0.5, 0.5)
    v4.Position = v5 + UDim2.fromOffset(0, 150)
    v3.Native = v4
    function v3.Update(p1) -- Line: 110 -- upvalues: u3 (val), u4 (val)
        u3.CheckboxWithLabel = p1
        u4(table.clone(u3))
    end
    v2.CheckboxWithLabel = react.createElement(Number, v3)
    v3 = {
        Default = 10,
        Header = "Suffix and Low Increment",
        Suffix = " studs",
        Increment = 0.1,
        Toggleable = {Visible = true, Default = true},
    }
    v4 = {}
    v5 = UDim2.fromScale(0.5, 0.5)
    v4.Position = v5 + UDim2.fromOffset(0, 200)
    v3.Native = v4
    function v3.Update(p1) -- Line: 132 -- upvalues: u3 (val), u4 (val)
        u3.LowIncrementWithSuffix = p1
        u4(table.clone(u3))
    end
    v2.LowIncrementWithSuffix = react.createElement(Number, v3)
    v3 = {Default = 1, Header = "Negatives Allowed", Negatives = true}
    v4 = {}
    v5 = UDim2.fromScale(0.5, 0.5)
    v4.Position = v5 + UDim2.fromOffset(0, 250)
    v3.Native = v4
    function v3.Update(p1) -- Line: 148 -- upvalues: u3 (val), u4 (val)
        u3.AllowNegativeNumbers = p1
        u4(table.clone(u3))
    end
    v2.AllowNegativeNumbers = react.createElement(Number, v3)
    v3 = {Default = 1, Header = "Clamped [-5, 5]", Negatives = true, Range = NumberRange.new(-5, 5)}
    v4 = {}
    v5 = UDim2.fromScale(0.5, 0.5)
    v4.Position = v5 + UDim2.fromOffset(0, 300)
    v3.Native = v4
    function v3.Update(p1) -- Line: 165 -- upvalues: u3 (val), u4 (val)
        u3.ClampedNumberRange = p1
        u4(table.clone(u3))
    end
    v2.ClampedNumberRange = react.createElement(Number, v3)
    return react.createElement(react.Fragment, {}, v2)
end
return QuickStory({}, function(p1) -- Line: 175 -- upvalues: react (val), Story (val)
    return react.createElement(Story)
end)