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
--File: ReplicatedStorage.Packages._Index.pyseph_packetprofiler@2.3.0.packetprofiler.Components.TopbarButtonsGroup
--                              Dumped in 0.000899 seconds
--                          Bytecode version 9  |  12 functions

local TextService = game:GetService("TextService")
local RunService = game:GetService("RunService")
local Packages = require(script.Parent.Parent.Modules.Packages)
local Roact = require(Packages.Directory.Roact)
local u24 = not RunService:IsRunning()
local function TopbarOptionsButton(p1) -- Line: 13 -- upvalues: Roact (val)
    local v1
    local createElement = Roact.createElement
    local v2 = {
        AutoLocalize = false,
        Text = p1.ButtonName,
        TextXAlignment = Enum.TextXAlignment.Right,
        TextYAlignment = Enum.TextYAlignment.Center,
        Font = Enum.Font.Code,
    }
    if p1.Theme.Name ~= "Light" then
        v1 = Color3.new(1, 1, 1)
    else
        v1 = Color3.new(0, 0, 0)
        if not v1 then
            v1 = Color3.new(1, 1, 1)
        end
    end
    v2.TextColor3 = v1
    v2.TextSize = 12
    v2.BackgroundColor3 = p1.Theme:GetColor("ScrollBarBackground")
    v2.Size = p1.Size
    v2.BorderSizePixel = 0
    v2[Roact.Event.Activated] = p1.OnClick
    return createElement("TextButton", v2)
end
local v1 = Roact.Component:extend("TopbarButtonsGroup")
function v1.init(p1) -- Line: 31 -- upvalues: Roact (val)
    local v1, v2
    v1, v2 = Roact.createBinding(0)
    p1.MouseHovering = v1
    p1.SetMouseHovering = v2
    p1.TopbarRef = Roact.createRef()
end
function v1.render(p1) -- Line: 36 -- upvalues: TextService (val), TopbarOptionsButton (val), Roact (val), u24 (val)
    local v1
    local props = p1.props
    local v2 = {}
    local TextSize = TextService:GetTextSize(props.Text, 12, Enum.Font.Code, Vector2.new(10000, 11))
    local X = TextSize.X
    local Options = props.Options
    local v3 = nil
    local v4 = nil
    for i, j in Options, v3, v4 do
        X = math.max(X, TextService:GetTextSize(j.Name, 11, Enum.Font.Code, Vector2.new(10000, 11)).X)
    end
    local Options_2 = props.Options
    v3 = nil
    v4 = nil
    for k, n in Options_2, v3, v4 do
        table.insert(v2, TopbarOptionsButton({ButtonName = n.Name, OnClick = n.Callback, Theme = props.Theme, Size = UDim2.fromOffset(X, 11)}))
    end
    local createElement = Roact.createElement
    v4 = {AutoLocalize = false, Text = props.Text}
    if props.Theme.Name ~= "Light" then
        v1 = Color3.new(1, 1, 1)
    else
        v1 = Color3.new(0, 0, 0)
        if not v1 then
            v1 = Color3.new(1, 1, 1)
        end
    end
    v4.TextColor3 = v1
    v4.BackgroundColor3 = p1.MouseHovering:map(function(p1) -- Line: 60 -- upvalues: props (val)
        local Color
        if 0 >= p1 then
            Color = props.Theme:GetColor("ScrollBarBackground")
        else
            Color = props.Theme:GetColor("Light")
            if not Color then
                Color = props.Theme:GetColor("ScrollBarBackground")
            end
        end
        return Color
    end)
    v4.TextSize = 12
    v4.Font = Enum.Font.Code
    v4.BorderSizePixel = 0
    v4.Size = UDim2.fromOffset(TextSize.X, 10)
    v4.TextXAlignment = Enum.TextXAlignment.Left
    v4.TextYAlignment = Enum.TextYAlignment.Center
    v4.LayoutOrder = props.LayoutOrder
    v4.Visible = not u24
    v4[Roact.Event.MouseEnter] = function() -- Line: 71 -- upvalues: p1 (val)
        p1.SetMouseHovering(1)
    end
    v4[Roact.Event.MouseLeave] = function() -- Line: 74 -- upvalues: p1 (val)
        task.defer(function() -- Line: 75 -- upvalues: p1 (upval)
            if p1.MouseHovering:getValue() == 1 then
                p1.SetMouseHovering(0)
            end
        end)
    end
    v4[Roact.Ref] = p1.TopbarRef
    v1 = {}
    local v5 = {AutomaticSize = Enum.AutomaticSize.Y, BackgroundTransparency = 1, Visible = p1.MouseHovering:map(function(p1) -- Line: 86
        local v1 = 0 < p1
        return v1
    end), Position = UDim2.fromOffset(0, 10)}
    v5[Roact.Event.MouseEnter] = function() -- Line: 90 -- upvalues: p1 (val)
        p1.SetMouseHovering(2)
    end
    v5[Roact.Event.MouseLeave] = function() -- Line: 93 -- upvalues: p1 (val)
        task.defer(function() -- Line: 94 -- upvalues: p1 (upval)
            if p1.MouseHovering:getValue() == 2 then
                p1.SetMouseHovering(0)
            end
        end)
    end
    v5.Size = UDim2.fromOffset(X, 0)
    v1.OptionsHolder = Roact.createElement("Frame", v5, {OptionsListLayout = Roact.createElement("UIListLayout", {FillDirection = Enum.FillDirection.Vertical, HorizontalAlignment = Enum.HorizontalAlignment.Left, VerticalAlignment = Enum.VerticalAlignment.Top}), Buttons = Roact.createFragment(v2)})
    return createElement("TextLabel", v4, v1)
end
return v1