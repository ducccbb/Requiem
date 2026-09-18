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
--      File: ReplicatedStorage.Client.Interfaces.Components.Editor.Universal.Icon
--                               Dumped in 0.00150 seconds
--                          Bytecode version 9  |  8 functions

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
local Hooks = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useRem = require(Hooks:WaitForChild("useRem"))
local Utilities = v1.Parent.Parent.Parent:WaitForChild("Utilities")
local FillProps = require(Utilities:WaitForChild("FillProps"))
local Text = require(v1.Parent:WaitForChild("Text"))
return function(p1) -- Line: 37 -- upvalues: useRem (val), react (val), FillProps (val), Text (val)
    local AnchorPoint, LayoutOrder, Native, Position, Selected, Visible, u7, v1, v2, v3, v4
    local v5 = useRem()
    v4, u7 = react.useBinding(false)
    local v6 = react.useCallback(function() -- Line: 42 -- upvalues: p1 (val), u7 (val)
        if p1.Static then
            return
        end
        u7(true)
    end, {})
    local v7 = react.useCallback(function() -- Line: 50 -- upvalues: p1 (val), u7 (val)
        if p1.Static then
            return
        end
        u7(false)
    end, {})
    if not p1.Label then
        local createElement = react.createElement
        Native = p1.Native
        if not Native then
            Native = {}
        end
        v1 = {Image = p1.Image}
        if typeof(p1.Selected) ~= "boolean" then
            if not p1.Disabled then
                v2 = v4:map(function(p1) -- Line: 66
                    local v1
                    if not p1 then
                        v1 = Color3.fromRGB(145, 145, 145)
                    else
                        v1 = Color3.fromRGB(255, 255, 255)
                        if not v1 then
                            v1 = Color3.fromRGB(145, 145, 145)
                        end
                    end
                    return v1
                end)
            else
                v2 = Color3.fromRGB(82, 82, 82)
                if not v2 then
                    v2 = v4:map(function(p1) -- Line: 66
                        local v1
                        if not p1 then
                            v1 = Color3.fromRGB(145, 145, 145)
                        else
                            v1 = Color3.fromRGB(255, 255, 255)
                            if not v1 then
                                v1 = Color3.fromRGB(145, 145, 145)
                            end
                        end
                        return v1
                    end)
                end
            end
        elseif p1.Selected then
            v2 = Color3.fromRGB(43, 177, 255)
        end
        v1.ImageColor3 = v2
        v1.AnchorPoint = Vector2.new(0.5, 0.5)
        v1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        v1.BorderSizePixel = 0
        v1.BackgroundTransparency = 1
        local v8 = v5(25)
        v1.Size = UDim2.fromOffset(v8, v5(25))
        v1[react.Event.MouseButton1Click] = function() -- Line: 77 -- upvalues: p1 (val)
            if p1.Clicked then
                p1.Clicked(p1.Label)
            end
        end
        v1[react.Event.MouseEnter] = v6
        v1[react.Event.MouseLeave] = v7
        local v9 = FillProps(Native, v1)
        return createElement("ImageButton", v9, p1.children)
    end
    if typeof(p1.Selected) ~= "boolean" then
        Selected = false
    else
        Selected = p1.Selected
    end
    local createElement_2 = react.createElement
    local v10 = {BackgroundTransparency = 1}
    v2 = v5(25)
    v10.Size = UDim2.fromOffset(v2, v5(50))
    if not p1.Native then
        AnchorPoint = nil
    else
        AnchorPoint = p1.Native.AnchorPoint
    end
    v10.AnchorPoint = AnchorPoint
    if not p1.Native then
        Position = nil
    else
        Position = p1.Native.Position
    end
    v10.Position = Position
    if not p1.Native then
        LayoutOrder = nil
    else
        LayoutOrder = p1.Native.LayoutOrder
    end
    v10.LayoutOrder = LayoutOrder
    if not p1.Native then
        Visible = false
    elseif p1.Native.Visible ~= nil then
        Visible = p1.Native.Visible
    end
    v10.Visible = Visible
    v1 = {Layout = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, v5(5)),
    })}
    local createElement_3 = react.createElement
    local v11 = {BackgroundTransparency = 1, LayoutOrder = 1}
    local v12 = v5(25)
    v11.Size = UDim2.fromOffset(v12, v5(25))
    local v13 = {}
    if not Selected then
        v12 = nil
    else
        v12 = react.createElement("Frame", {
            BackgroundTransparency = 0.9,
            BorderSizePixel = 0,
            ZIndex = 0,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Size = UDim2.fromScale(1.5, 1.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
        }, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 4)})})
    end
    v13.Background = v12
    local createElement_4 = react.createElement
    local v14 = {Image = p1.Image}
    if typeof(p1.Selected) ~= "boolean" then
        v3 = v4:map(function(p1) -- Line: 136
            local v1
            if not p1 then
                v1 = Color3.fromRGB(145, 145, 145)
            else
                v1 = Color3.fromRGB(212, 212, 212)
                if not v1 then
                    v1 = Color3.fromRGB(145, 145, 145)
                end
            end
            return v1
        end)
    elseif not p1.Selected then
        v3 = v4:map(function(p1) -- Line: 136
            local v1
            if not p1 then
                v1 = Color3.fromRGB(145, 145, 145)
            else
                v1 = Color3.fromRGB(212, 212, 212)
                if not v1 then
                    v1 = Color3.fromRGB(145, 145, 145)
                end
            end
            return v1
        end)
    else
        v3 = Color3.fromRGB(255, 255, 255)
        if not v3 then
            v3 = v4:map(function(p1) -- Line: 136
                local v1
                if not p1 then
                    v1 = Color3.fromRGB(145, 145, 145)
                else
                    v1 = Color3.fromRGB(212, 212, 212)
                    if not v1 then
                        v1 = Color3.fromRGB(145, 145, 145)
                    end
                end
                return v1
            end)
        end
    end
    v14.ImageColor3 = v3
    v14.AnchorPoint = Vector2.new(0.5, 0.5)
    v14.Position = UDim2.fromScale(0.5, 0.5)
    v14.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    v14.BorderSizePixel = 0
    v14.BackgroundTransparency = 1
    local v15 = v5(25)
    v14.Size = UDim2.fromOffset(v15, v5(25))
    v14.ZIndex = 1
    v14[react.Event.MouseButton1Click] = function() -- Line: 149 -- upvalues: p1 (val)
        if p1.Clicked then
            p1.Clicked(p1.Label)
        end
    end
    v14[react.Event.MouseEnter] = v6
    v14[react.Event.MouseLeave] = v7
    v13.Icon = createElement_4("ImageButton", v14, p1.children)
    v1.IconContainer = createElement_3("Frame", v11, v13)
    v1.Label = react.createElement(Text, {
        Text = p1.Label,
        TextSize = v5(12),
        Native = {LayoutOrder = 2, Size = UDim2.new(1, 0, 0, v5(30))},
    })
    return createElement_2("Frame", v10, v1)
end