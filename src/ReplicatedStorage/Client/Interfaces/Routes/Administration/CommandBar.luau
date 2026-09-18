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
--      File: ReplicatedStorage.Client.Interfaces.Routes.Administration.CommandBar
--                               Dumped in 0.00344 seconds
--                          Bytecode version 9  |  17 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Administration_2 = Common:WaitForChild("Administration")
local Arguments = require(Administration_2:WaitForChild("Arguments"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Network = Common_2:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Administration = require(Namespaces:WaitForChild("Administration"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_3:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Utilities = Common_3:WaitForChild("Utilities")
local String = require(Utilities:WaitForChild("String"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_5:WaitForChild("Common")
local Utilities_2 = Common_4:WaitForChild("Utilities")
local Table = require(Utilities_2:WaitForChild("Table"))
local Components = v1.Parent.Parent.Parent:WaitForChild("Components")
local Utilities_3 = Components:WaitForChild("Utilities")
local Color = require(Utilities_3:WaitForChild("Color"))
local Hooks = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useConstants = require(Hooks:WaitForChild("useConstants"))
local Hooks_2 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useEventListener = require(Hooks_2:WaitForChild("useEventListener"))
local Hooks_3 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useKeyPress = require(Hooks_3:WaitForChild("useKeyPress"))
local Hooks_4 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useLatest = require(Hooks_4:WaitForChild("useLatest"))
local Hooks_5 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useOrder = require(Hooks_5:WaitForChild("useOrder"))
local Hooks_6 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useRem = require(Hooks_6:WaitForChild("useRem"))
local Hooks_7 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useStore = require(Hooks_7:WaitForChild("useStore"))
local Hooks_8 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useTextScale = require(Hooks_8:WaitForChild("useTextScale"))
local Hooks_9 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useTheme = require(Hooks_9:WaitForChild("useTheme"))
local Components_2 = v1.Parent.Parent.Parent:WaitForChild("Components")
local Primitives = Components_2:WaitForChild("Primitives")
local Frame = require(Primitives:WaitForChild("Frame"))
local Components_3 = v1.Parent.Parent.Parent:WaitForChild("Components")
local Primitives_2 = Components_3:WaitForChild("Primitives")
local HorizontalListLayout = require(Primitives_2:WaitForChild("HorizontalListLayout"))
local Components_4 = v1.Parent.Parent.Parent:WaitForChild("Components")
local Primitives_3 = Components_4:WaitForChild("Primitives")
local VerticalListLayout = require(Primitives_3:WaitForChild("VerticalListLayout"))
local function stripTabCharacters(p1, p2) -- Line: 44
    local v1
    local v2 = p1:gsub("\t", "")
    if v2 == p1 or p2 == nil then
        return v2, p2
    end
    local v3 = 0
    local v4 = math.min(p2 - 1, #p1)
    local v5 = 1
    local v6 = p1
    for i = 1, v4, v5 do
        if v6:byte(i) == 9 then
            v3 = v3 + 1
        end
    end
    v4 = math.clamp(v1 - v3, 1, #v2 + 1)
    return v2, v4
end
return function() -- Line: 63 -- upvalues: useRem (val), useTheme (val), useConstants (val), useOrder (val), useTextScale (val), react (val), useStore (val), Administration (val), useKeyPress (val), useLatest (val), Arguments (val), useEventListener (val), UserInputService (val), String (val), Table (val), Color (val), HorizontalListLayout (val), Frame (val), stripTabCharacters (val), VerticalListLayout (val)
    local u13, u14, u18, u19, u28, u33, u37, u38, u43, u48, v1, v2, v3, v4, v5, v6
    local v7 = useRem()
    local u3 = useTheme()
    local v8 = useConstants()
    local v9 = useOrder()
    local v10 = useTextScale()
    u13, u14 = react.useState("")
    u18, u19 = react.useState(false)
    local u23 = react.useRef(nil)
    v1, u28 = react.useState(nil)
    v2, u33 = react.useState(nil)
    u37, u38 = react.useState(nil)
    v3, u43 = react.useState(u3.Primary)
    v4, u48 = react.useState({})
    local u53 = useStore(Administration.Store, function(p1) -- Line: 82
        local commands
        if not p1 then
            commands = {}
        else
            commands = p1.commands
            if not commands then
                commands = {}
            end
        end
        return commands
    end)
    local u58 = useStore(Administration.Store, function(p1) -- Line: 86
        local staffSlot
        if not p1 then
            staffSlot = 0
        else
            staffSlot = p1.staffSlot
            if not staffSlot then
                staffSlot = 0
            end
        end
        return staffSlot
    end)
    local u61 = useKeyPress(Enum.KeyCode.Semicolon)
    local u65 = useKeyPress(Enum.KeyCode.Return, true)
    local u68 = useLatest(v4)
    local u73 = react.useMemo(function() -- Line: 95 -- upvalues: Arguments (upval)
        return Arguments()
    end, {})
    local v11 = {connected = u18}
    useEventListener(UserInputService.InputBegan, function(p1) -- Line: 101 -- upvalues: u23 (val), UserInputService (upval), u68 (val), String (upval), Table (upval)
        if p1.KeyCode ~= Enum.KeyCode.Tab then
            return
        end
        local current = u23.current
        if not current then
            return
        end
        if UserInputService:GetFocusedTextBox() == current then
            local current_2 = u68.current
            local Text = current.Text
            local v1 = String.split(Text)
            if not (v1[1]) then
                return
            end
            local v2 = Table.filter(current_2, function(p1) -- Line: 122 -- upvalues: Text (val)
                local v1 = p1:lower()
                local v2 = v1 == Text:lower()
                return v2
            end)
            local v3 = nil
            if 0 < #v2 then
                v1[#v1] = v2[1]
                v3 = table.concat(v1, " ") .. " "
            elseif 0 < #current_2 then
                v1[#v1] = current_2[1]
                v3 = table.concat(v1, " ") .. " "
            end
            if v3 then
                current.Text = v3
                current.CursorPosition = #v3 + 1
            end
            return
        elseif not (current:IsFocused()) then
            return
        end
    end, v11)
    react.useEffect(function() -- Line: 143 -- upvalues: String (upval), u13 (val), u18 (val), u48 (val), u38 (val), u28 (val), u33 (val), u37 (val), Table (upval), u53 (val), u43 (val), u3 (val), u73 (val)
        local u3 = String.split(u13)
        if not (u3[1]) then
            u48({})
            u38(nil)
            u28(nil)
            u33(nil)
            return
        else
            local v1, v2
            if not u18 then
                u48({})
                u38(nil)
                u28(nil)
                u33(nil)
                return
            end
            if not u37 then
                v1 = Table.filter(u53, function(p1) -- Line: 157 -- upvalues: u3 (ref)
                    local v1 = p1.name:lower()
                    local v2 = v1 == u3[1]:lower()
                    return v2
                end)
                v2 = v1[1]
                if not v1 then
                    u38(nil)
                elseif v2 then
                    u38(v2)
                end
            end
            if #u3 ~= 1 then
                if not u37 then
                    if #u3 == 2 and not u37 then
                        u48({"Unknown command"})
                        u43(u3.Primary)
                    end
                    return
                end
                u3 = String.mashExcessArguments(u3, #u37.arguments + 1)
                v1 = #u3 - 1
                local v3 = #u13
                if u13:sub(v3, #u13) == " " then
                    v1 = v1 + 1
                end
                v2 = u37.arguments[v1]
                if not v2 then
                    u48({})
                    u28(nil)
                    u33(nil)
                    return
                end
                local v4 = v2.path:split("/")
                v3 = u73[v4[1]]
                local v5 = v3[v4[2]]
                if not v5 then
                    v5 = v3[v4[2] .. "Argument"]
                end
                if v5 then
                    local v6, v7
                    u28(v2)
                    v6, v7 = v5.autocomplete(u3[v1 + 1] or "", u3, v1)
                    local v8 = v6
                    if not v8 then
                        v8 = {}
                    end
                    u48(v8)
                    if v7 then
                        u43(v7)
                    end
                    if type(v5.getDescription) ~= "function" then
                        u33(v2.description)
                    else
                        u33(v5.getDescription(u3, v1))
                    end
                end
                return
            elseif not u37 then
                v1 = Table.filter(u53, function(p1) -- Line: 172 -- upvalues: u3 (ref)
                    local v1 = p1.name:sub(1, #u3[1]):lower()
                    local v2 = v1 == u3[1]:lower()
                    return v2
                end)
                v2 = {}
                for k, v in pairs(v1) do
                    table.insert(v2, v.name)
                end
                u48(v2)
                u43(u3.Primary)
                return
            end
        end
    end, {u13, u37, u18, u23})
    react.useEffect(function() -- Line: 227 -- upvalues: u18 (val), u23 (val), u28 (val), u33 (val), u38 (val), u48 (val)
        local StarterGui = game:GetService("StarterGui")
        if not u18 then
            StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, true)
        elseif not u23.current then
            StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, true)
        else
            StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, false)
            u28(nil)
            u33(nil)
            u38(nil)
            u48({})
            u23.current:CaptureFocus()
        end
        return function() -- Line: 241
            local StarterGui = game:GetService("StarterGui")
            StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, true)
        end
    end, {u18, u23})
    react.useEffect(function() -- Line: 246 -- upvalues: u53 (val), u58 (val), u61 (val), u19 (val)
        if #u53 == 0 or u58 == 0 then
            return
        end
        if u61 then
            u19(true)
        end
    end, {u61})
    react.useEffect(function() -- Line: 256 -- upvalues: u65 (val), u23 (val), u19 (val), u37 (val), Administration (upval)
        if u65 and u23.current then
            u19(false)
            if u37 then
                Administration.Execute.post({command = u23.current.Text})
                u23.current.Text = ""
            end
        end
    end, {u65, u23})
    local v12 = {}
    for k, v in pairs(v4) do
        v12[v] = react.createElement("TextLabel", {
            TextTransparency = 0.6,
            Size = UDim2.fromOffset(0, v7(25)),
            TextXAlignment = Enum.TextXAlignment.Left,
            AutomaticSize = Enum.AutomaticSize.X,
            Text = v,
            BackgroundColor3 = Color.Darken(u3.PageBackground, 0.7),
            TextColor3 = u3.Primary,
            TextSize = v10(14),
            Font = Enum.Font.SourceSansBold,
        }, {Padding = react.createElement("UIPadding", v8.Padding.Universal.Small), Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, v7(4))})})
    end
    if v1 then
        v11 = {LayoutOrder = 100, Size = UDim2.fromOffset(0, v7(25)), AutomaticSize = Enum.AutomaticSize.X, BackgroundColor3 = Color.Darken(u3.PageBackground, 0.7)}
        v5 = {Padding = react.createElement("UIPadding", v8.Padding.Universal.Small), Layout = react.createElement(HorizontalListLayout, {Spacing = 10, HorizontalAlignment = Enum.HorizontalAlignment.Left, VerticalAlignment = Enum.VerticalAlignment.Center}), Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, v7(4))}), Header = react.createElement("TextLabel", {
            BackgroundTransparency = 1,
            TextTransparency = 0.4,
            Size = UDim2.fromOffset(0, 1),
            AutomaticSize = Enum.AutomaticSize.X,
            TextXAlignment = Enum.TextXAlignment.Left,
            Text = "@" .. string.lower(v1.name),
            TextColor3 = v3,
            Font = Enum.Font.SourceSansBold,
            TextSize = v10(14),
        })}
        v6 = {
            BackgroundTransparency = 1,
            TextTransparency = 0.65,
            Size = UDim2.fromOffset(0, 1),
            AutomaticSize = Enum.AutomaticSize.X,
            TextXAlignment = Enum.TextXAlignment.Right,
        }
        local description = v2
        if not description then
            description = v1.description
        end
        v6.Text = description
        v6.TextColor3 = u3.Primary
        v6.Font = Enum.Font.SourceSans
        v6.TextSize = v10(14)
        v5.Body = react.createElement("TextLabel", v6)
        v12.argument = react.createElement("Frame", v11, v5)
    end
    v5 = {}
    v6 = {BackgroundTransparency = 0}
    local v13 = UDim2.fromScale(1, 0)
    local v14 = -v7(400)
    v6.Size = v13 + UDim2.fromOffset(v14, v7(40))
    v13 = UDim2.fromScale(0.5, 1)
    v6.Position = v13 + UDim2.fromOffset(0, -v7(300))
    v6.BackgroundColor3 = Color.Darken(u3.PageBackground, 0.7)
    local v15 = {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, v7(5))}), Padding = react.createElement("UIPadding", v8.Padding.Universal.Medium)}
    v14 = {
        Size = UDim2.fromScale(1, 1),
        TextXAlignment = Enum.TextXAlignment.Left,
        BackgroundTransparency = 1,
        TextColor3 = u3.Primary,
        TextTransparency = 0.4,
        PlaceholderText = "Type a command...",
    }
    v14[react.Change.Text] = function(p1) -- Line: 360 -- upvalues: stripTabCharacters (upval), u14 (val)
        local v1, v2
        v1, v2 = stripTabCharacters(p1.Text, p1.CursorPosition)
        if v1 ~= p1.Text then
            p1.Text = v1
            if v2 then
                p1.CursorPosition = v2
            end
        end
        u14(p1.Text)
    end
    v14[react.Event.FocusLost] = function(p1, p2) -- Line: 371 -- upvalues: u19 (val)
        u19(false)
    end
    v14.ref = u23
    v15.Input = react.createElement("TextBox", v14)
    v14 = {BackgroundTransparency = 1, AnchorPoint = Vector2.new(0.5, 1)}
    local v16 = UDim2.fromScale(0.5, 0)
    v14.Position = v16 + UDim2.fromOffset(-v8.Padding.Sizes.Medium / 2, -v8.Padding.Sizes.Medium * 2)
    local v17 = {Layout = react.createElement(HorizontalListLayout, {HorizontalAlignment = Enum.HorizontalAlignment.Left})}
    local v18 = {
        TextTransparency = 1,
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(0, 1),
        AutomaticSize = Enum.AutomaticSize.X,
        TextXAlignment = Enum.TextXAlignment.Left,
        Text = u13,
        LayoutOrder = v9(),
    }
    local v19 = not (not u37)
    v18.Visible = v19
    v17.Offset = react.createElement("TextLabel", v18)
    v17.Autocompletion = react.createElement(Frame, {BackgroundTransparency = 1, Size = UDim2.fromOffset(0, v7(100)), AutomaticSize = Enum.AutomaticSize.X, LayoutOrder = v9()}, {Layout = react.createElement(VerticalListLayout, {Spacing = 2, HorizontalAlignment = Enum.HorizontalAlignment.Left})}, v12)
    v15.Autocompletion = react.createElement(Frame, v14, v17)
    v5.Bar = react.createElement(Frame, v6, v15)
    return react.createElement(Frame, {Visible = u18}, v5)
end