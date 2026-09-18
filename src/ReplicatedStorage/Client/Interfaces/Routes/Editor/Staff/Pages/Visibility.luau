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
--    File: ReplicatedStorage.Client.Interfaces.Routes.Editor.Staff.Pages.Visibility
--                              Dumped in 0.000991 seconds
--                          Bytecode version 9  |  6 functions

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
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_2:WaitForChild("Client")
local Interfaces = Client:WaitForChild("Interfaces")
local Components = Interfaces:WaitForChild("Components")
local Editor = Components:WaitForChild("Editor")
local Universal = Editor:WaitForChild("Universal")
local Checkbox = require(Universal:WaitForChild("Checkbox"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_3:WaitForChild("Client")
local Interfaces_2 = Client_2:WaitForChild("Interfaces")
local Components_2 = Interfaces_2:WaitForChild("Components")
local Editor_2 = Components_2:WaitForChild("Editor")
local Universal_2 = Editor_2:WaitForChild("Universal")
local Container = require(Universal_2:WaitForChild("Container"))
local Hooks = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useEditorEnabled = require(Hooks:WaitForChild("useEditorEnabled"))
local Hooks_2 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useEditorPages = require(Hooks_2:WaitForChild("useEditorPages"))
local Hooks_3 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useEditorStates = require(Hooks_3:WaitForChild("useEditorStates"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_4:WaitForChild("Client")
local Interfaces_3 = Client_3:WaitForChild("Interfaces")
local Hooks_4 = Interfaces_3:WaitForChild("Hooks")
local useEventListener = require(Hooks_4:WaitForChild("useEventListener"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_5:WaitForChild("Client")
local Interfaces_4 = Client_4:WaitForChild("Interfaces")
local Hooks_5 = Interfaces_4:WaitForChild("Hooks")
local useOrder = require(Hooks_5:WaitForChild("useOrder"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Client_5 = ReplicatedStorage_6:WaitForChild("Client")
local Interfaces_5 = Client_5:WaitForChild("Interfaces")
local Hooks_6 = Interfaces_5:WaitForChild("Hooks")
local useRem = require(Hooks_6:WaitForChild("useRem"))
return react.memo(function() -- Line: 29 -- upvalues: useOrder (val), useRem (val), useEditorPages (val), useEditorEnabled (val), react (val), useEditorStates (val), useEventListener (val), UserInputService (val), Container (val), Checkbox (val)
    local u11, u12, u16, u23, u24, v1
    local v2 = useOrder()
    local v3 = useRem()
    local u7 = useEditorEnabled()
    u11, u12 = react.useState(false)
    u16, v1 = react.useState(false)
    local u21 = react.useRef({})
    u23, u24 = useEditorStates()
    useEventListener(UserInputService.InputBegan, function(p1, p2) -- Line: 43 -- upvalues: u7 (val), u21 (val), UserInputService (upval), u12 (val), u11 (val)
        if not u7 then
            return
        end
        if p1.KeyCode == Enum.KeyCode.LeftControl then
            u21.current.leftControl = tick()
        end
        if p1.KeyCode == Enum.KeyCode.Q then
            u21.current.q = tick()
        end
        if p1.KeyCode == Enum.KeyCode.LeftControl then
            if u21.current.leftControl and u21.current.q then
                (function() -- Line: 49 -- upvalues: u21 (upval), UserInputService (upval), u12 (upval), u11 (upval)
                    if not u21.current.leftControl or not u21.current.q then
                        return
                    end
                    local v1 = tick() - u21.current.leftControl
                    local v2 = tick() - u21.current.q
                    if v1 < 0.3 and v2 < 0.3 and UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) and UserInputService:IsKeyDown(Enum.KeyCode.Q) then
                        u12(function() -- Line: 63 -- upvalues: u11 (upval)
                            return not u11
                        end)
                    end
                end)()
            end
        elseif p1.KeyCode == Enum.KeyCode.Q and u21.current.leftControl and u21.current.q then
            (function() -- Line: 49 -- upvalues: u21 (upval), UserInputService (upval), u12 (upval), u11 (upval)
                if not u21.current.leftControl or not u21.current.q then
                    return
                end
                local v1 = tick() - u21.current.leftControl
                local v2 = tick() - u21.current.q
                if v1 < 0.3 and v2 < 0.3 and UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) and UserInputService:IsKeyDown(Enum.KeyCode.Q) then
                    u12(function() -- Line: 63 -- upvalues: u11 (upval)
                        return not u11
                    end)
                end
            end)()
        end
    end)
    react.useEffect(function() -- Line: 88 -- upvalues: u24 (val), u11 (val), u16 (val), u23 (val)
        u24({visible = not u11, indicator = u16, freecam = u23.freecam})
    end, {u11, u16, u23.freecam})
    local v4 = {Draggable = true, Spacing = 10, Position = UDim2.fromScale(0.1, 0.3)}
    local v5 = {}
    local v6 = not (not (useEditorPages().Visibility))
    v5.Visible = v6
    v4.Native = v5
    return react.createElement(Container, v4, {Layout = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, v3(20)),
    }), Variant = react.createElement(Checkbox, {
        Label = "Invisible\n<font color=\"rgb(150, 150, 150)\" size=\"12\">Ctrl + Q</font>",
        Default = u11,
        Native = {LayoutOrder = v2()},
        Toggled = u12,
    }), Display = react.createElement(Checkbox, {
        Label = "Indicator in Freecam",
        Default = false,
        Native = {LayoutOrder = v2()},
        Toggled = v1,
    })})
end)