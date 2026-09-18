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
--    File: ReplicatedStorage.Client.Interfaces.Routes.Editor.Staff.Tools.Selections
--                               Dumped in 0.00361 seconds
--                          Bytecode version 9  |  12 functions

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
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Building = require(Namespaces:WaitForChild("Building"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Network_2 = Common_2:WaitForChild("Network")
local Namespaces_2 = Network_2:WaitForChild("Namespaces")
local Administration = require(Namespaces_2:WaitForChild("Administration"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_3:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Administration_2 = Common_3:WaitForChild("Administration")
local Permissions = require(Administration_2:WaitForChild("Permissions"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_5:WaitForChild("Common")
local Signals = require(Common_4:WaitForChild("Signals"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_6:WaitForChild("Client")
local Interfaces = Client:WaitForChild("Interfaces")
local Components = Interfaces:WaitForChild("Components")
local Editor = Components:WaitForChild("Editor")
local Universal = Editor:WaitForChild("Universal")
local Checkbox = require(Universal:WaitForChild("Checkbox"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_7:WaitForChild("Client")
local Interfaces_2 = Client_2:WaitForChild("Interfaces")
local Components_2 = Interfaces_2:WaitForChild("Components")
local Editor_2 = Components_2:WaitForChild("Editor")
local Universal_2 = Editor_2:WaitForChild("Universal")
local Container = require(Universal_2:WaitForChild("Container"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_8:WaitForChild("Client")
local Interfaces_3 = Client_3:WaitForChild("Interfaces")
local Components_3 = Interfaces_3:WaitForChild("Components")
local Primitives = Components_3:WaitForChild("Primitives")
local Frame = require(Primitives:WaitForChild("Frame"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_9:WaitForChild("Client")
local Interfaces_4 = Client_4:WaitForChild("Interfaces")
local Components_4 = Interfaces_4:WaitForChild("Components")
local Editor_3 = Components_4:WaitForChild("Editor")
local Universal_3 = Editor_3:WaitForChild("Universal")
local Icon = require(Universal_3:WaitForChild("Icon"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Client_5 = ReplicatedStorage_10:WaitForChild("Client")
local Interfaces_5 = Client_5:WaitForChild("Interfaces")
local Components_5 = Interfaces_5:WaitForChild("Components")
local Editor_4 = Components_5:WaitForChild("Editor")
local Universal_4 = Editor_4:WaitForChild("Universal")
local Spacer = require(Universal_4:WaitForChild("Spacer"))
local Hooks = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useEditorEnabled = require(Hooks:WaitForChild("useEditorEnabled"))
local Hooks_2 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useEditorPages = require(Hooks_2:WaitForChild("useEditorPages"))
local Hooks_3 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useEditorStates = require(Hooks_3:WaitForChild("useEditorStates"))
local Hooks_4 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useEditorTools = require(Hooks_4:WaitForChild("useEditorTools"))
local ReplicatedStorage_11 = game:GetService("ReplicatedStorage")
local Client_6 = ReplicatedStorage_11:WaitForChild("Client")
local Interfaces_6 = Client_6:WaitForChild("Interfaces")
local Hooks_5 = Interfaces_6:WaitForChild("Hooks")
local useEventListener = require(Hooks_5:WaitForChild("useEventListener"))
local ReplicatedStorage_12 = game:GetService("ReplicatedStorage")
local Client_7 = ReplicatedStorage_12:WaitForChild("Client")
local Interfaces_7 = Client_7:WaitForChild("Interfaces")
local Hooks_6 = Interfaces_7:WaitForChild("Hooks")
local useOrder = require(Hooks_6:WaitForChild("useOrder"))
local ReplicatedStorage_13 = game:GetService("ReplicatedStorage")
local Client_8 = ReplicatedStorage_13:WaitForChild("Client")
local Interfaces_8 = Client_8:WaitForChild("Interfaces")
local Hooks_7 = Interfaces_8:WaitForChild("Hooks")
local useRem = require(Hooks_7:WaitForChild("useRem"))
local ReplicatedStorage_14 = game:GetService("ReplicatedStorage")
local Client_9 = ReplicatedStorage_14:WaitForChild("Client")
local Interfaces_9 = Client_9:WaitForChild("Interfaces")
local Hooks_8 = Interfaces_9:WaitForChild("Hooks")
local useStore = require(Hooks_8:WaitForChild("useStore"))
local ReplicatedStorage_15 = game:GetService("ReplicatedStorage")
local Client_10 = ReplicatedStorage_15:WaitForChild("Client")
local Interfaces_10 = Client_10:WaitForChild("Interfaces")
local Hooks_9 = Interfaces_10:WaitForChild("Hooks")
local useToast = require(Hooks_9:WaitForChild("useToast"))
return react.memo(function() -- Line: 44 -- upvalues: useOrder (val), useEditorTools (val), useEditorPages (val), useEditorStates (val), useToast (val), useEditorEnabled (val), react (val), useStore (val), Administration (val), Permissions (val), useEventListener (val), UserInputService (val), useRem (val), Container (val), Spacer (val), Icon (val), Signals (val), Building (val), Frame (val), Checkbox (val)
    local u10, u11, u19, u20, u4, v1, v2, v3
    local v4 = useOrder()
    v1, u4 = useEditorTools()
    v2, _, v3 = useEditorPages()
    u10, u11 = useEditorStates()
    local u13 = useToast()
    local u15 = useEditorEnabled()
    u19, u20 = react.useState(false)
    local v5 = {}
    local u24 = react.useRef(v5)
    local u29 = useStore(Administration.Store, function(p1) -- Line: 56
        return p1
    end)
    local v6 = react.useMemo(function() -- Line: 60 -- upvalues: u29 (val), Permissions (upval)
        local permission = u29
        if permission then
            permission = u29.permission
        end
        if not permission then
            return {
                canAccessBuilder = false,
                canAccessTitan = false,
                canAccessAnimal = false,
                canAccessProp = false,
                canAccessVisibility = false,
                canAccessCharacter = false,
                canAccessSlots = false,
                canAccessDestruction = false,
                canAccessPings = false,
                canAccessLogs = false,
                canAccessMessages = false,
                canAccessFreecam = false,
                canAccessTeleport = false,
                canAccessLighting = false,
            }
        end
        local v1 = {}
        local v2 = if Permissions.Accessability.Sandbox <= permission then if Permissions.Editor.Builder <= permission then u29.staffSlot == 1 else false else false
        v1.canAccessBuilder = v2
        v2 = Permissions.Editor.Titan <= permission
        v1.canAccessTitan = v2
        v2 = Permissions.Editor.Animal <= permission
        v1.canAccessAnimal = v2
        v2 = Permissions.Editor.Prop <= permission
        v1.canAccessProp = v2
        v2 = Permissions.Editor.Visibility <= permission
        v1.canAccessVisibility = v2
        v2 = Permissions.Editor.Character <= permission
        v1.canAccessCharacter = v2
        v2 = Permissions.Editor.Slots <= permission
        v1.canAccessSlots = v2
        v2 = Permissions.Editor.Destruction <= permission
        v1.canAccessDestruction = v2
        v2 = Permissions.Editor.Pings <= permission
        v1.canAccessPings = v2
        v2 = Permissions.Editor.Logs <= permission
        v1.canAccessLogs = v2
        v2 = Permissions.Editor.Messages <= permission
        v1.canAccessMessages = v2
        v2 = Permissions.Editor.Freecam <= permission
        v1.canAccessFreecam = v2
        v2 = Permissions.Editor.Teleport <= permission
        v1.canAccessTeleport = v2
        v2 = Permissions.Editor.Lighting <= permission
        v1.canAccessLighting = v2
        return v1
    end, {u29})
    local canAccessBuilder = v6.canAccessBuilder
    local canAccessTitan = v6.canAccessTitan
    local canAccessAnimal = v6.canAccessAnimal
    local canAccessProp = v6.canAccessProp
    local canAccessVisibility = v6.canAccessVisibility
    local canAccessCharacter = v6.canAccessCharacter
    local canAccessSlots = v6.canAccessSlots
    local canAccessDestruction = v6.canAccessDestruction
    local canAccessPings = v6.canAccessPings
    local canAccessLogs = v6.canAccessLogs
    local canAccessMessages = v6.canAccessMessages
    local canAccessFreecam = v6.canAccessFreecam
    local canAccessTeleport = v6.canAccessTeleport
    local canAccessLighting = v6.canAccessLighting
    react.useEffect(function() -- Line: 116 -- upvalues: u11 (val), u19 (val), u10 (val)
        u11({freecam = u19, indicator = u10.indicator, visible = u10.visible})
    end, {u19, u10.visible, u10.indicator})
    useEventListener(UserInputService.InputBegan, function(p1, p2) -- Line: 125 -- upvalues: u15 (val), u24 (val), UserInputService (upval), u20 (val), u19 (val)
        if not u15 then
            return
        end
        if p1.KeyCode == Enum.KeyCode.LeftControl then
            u24.current.leftControl = tick()
        end
        if p1.KeyCode == Enum.KeyCode.E then
            u24.current.e = tick()
        end
        if p1.KeyCode == Enum.KeyCode.LeftControl then
            if u24.current.leftControl and u24.current.e then
                (function() -- Line: 131 -- upvalues: u24 (upval), UserInputService (upval), u20 (upval), u19 (upval)
                    if not u24.current.leftControl or not u24.current.e then
                        return
                    end
                    local v1 = tick() - u24.current.leftControl
                    local v2 = tick() - u24.current.e
                    if v1 < 0.3 and v2 < 0.3 and UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) and UserInputService:IsKeyDown(Enum.KeyCode.E) then
                        u20(function() -- Line: 145 -- upvalues: u19 (upval)
                            return not u19
                        end)
                    end
                end)()
            end
        elseif p1.KeyCode == Enum.KeyCode.E and u24.current.leftControl and u24.current.e then
            (function() -- Line: 131 -- upvalues: u24 (upval), UserInputService (upval), u20 (upval), u19 (upval)
                if not u24.current.leftControl or not u24.current.e then
                    return
                end
                local v1 = tick() - u24.current.leftControl
                local v2 = tick() - u24.current.e
                if v1 < 0.3 and v2 < 0.3 and UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) and UserInputService:IsKeyDown(Enum.KeyCode.E) then
                    u20(function() -- Line: 145 -- upvalues: u19 (upval)
                        return not u19
                    end)
                end
            end)()
        end
    end)
    local v7 = useRem()
    local u83 = react.useMemo(function() -- Line: 173 -- upvalues: canAccessTitan (val), canAccessAnimal (val), canAccessProp (val), canAccessVisibility (val), canAccessCharacter (val), canAccessSlots (val), canAccessBuilder (val), canAccessDestruction (val), canAccessPings (val), canAccessLogs (val), canAccessMessages (val), canAccessLighting (val), canAccessFreecam (val), canAccessTeleport (val)
        local v1 = {
            Mouse = true,
            Titan = canAccessTitan,
            Animal = canAccessAnimal,
            Prop = canAccessProp,
            Visibility = canAccessVisibility,
            Character = canAccessCharacter,
            Slots = canAccessSlots,
            Builder = canAccessBuilder,
            Destruction = canAccessDestruction,
            Pings = canAccessPings,
            Logs = canAccessLogs,
            Messages = canAccessMessages,
            Lighting = canAccessLighting,
        }
        local v2 = canAccessFreecam
        if not v2 then
            v2 = canAccessTeleport
        end
        v1.Box = v2
        return v1
    end, {
        canAccessTitan,
        canAccessAnimal,
        canAccessProp,
        canAccessVisibility,
        canAccessCharacter,
        canAccessSlots,
        canAccessBuilder,
        canAccessDestruction,
        canAccessPings,
        canAccessLogs,
        canAccessMessages,
        canAccessFreecam,
        canAccessLighting,
        canAccessTeleport,
    })
    local u102 = react.useMemo(function() -- Line: 208 -- upvalues: u83 (val)
        local v1, v2, v3, v4, v5, v6, v7
        local v8 = {
            "Mouse",
            "Spacer1",
            "Titan",
            "Animal",
            "Prop",
            "Spacer2",
            "Visibility",
            "Spacer3",
            "Character",
            "Spacer4",
            "Slots",
            "Spacer5",
            "Builder",
            "Spacer6",
            "Destruction",
            "Spacer7",
            "Pings",
            "Spacer9",
            "Logs",
            "Spacer10",
            "Messages",
            "Spacer8",
            "Lighting",
            "Spacer12",
            "Box",
        }
        local v9 = {}
        for i, v in ipairs(v8) do
            if string.find(v, "Spacer") then
                v5 = nil
                v6 = 1
                v7 = -1
                for i2 = i - 1, v6, v7 do
                    v2 = v8[i2]
                    if not (string.find(v2, "Spacer")) and u83[v2] == true then
                        v5 = i2
                        break
                    end
                end
                v6 = nil
                v7 = #v8
                v1 = 1
                for j = i + 1, v7, v1 do
                    v3 = v8[j]
                    if not (string.find(v3, "Spacer")) and u83[v3] == true then
                        v6 = j
                        break
                    end
                end
                if not v5 then
                    v9[v] = false
                elseif v6 then
                    v7 = false
                    v1 = v6 - 1
                    v2 = 1
                    for k = v5 + 1, v1, v2 do
                        v4 = v8[k]
                        if not (string.find(v4, "Spacer")) and u83[v4] == true then
                            v7 = true
                            break
                        end
                    end
                    if v7 then
                        v9[v] = false
                    else
                        v1 = false
                        v2 = i - 1
                        v3 = 1
                        for n = v5 + 1, v2, v3 do
                            if string.find(v8[n], "Spacer") then
                                v1 = true
                                break
                            end
                        end
                        if v1 then
                            v9[v] = false
                        else
                            v9[v] = true
                        end
                    end
                end
            end
        end
        return v9
    end, {
        canAccessTitan,
        canAccessAnimal,
        canAccessProp,
        canAccessVisibility,
        canAccessCharacter,
        canAccessSlots,
        canAccessBuilder,
        canAccessDestruction,
        canAccessPings,
        canAccessLogs,
        canAccessMessages,
        canAccessFreecam,
        canAccessTeleport,
        canAccessLighting,
    })
    local function getSpacerVisibility(p1) -- Line: 326 -- upvalues: u102 (val)
        local v1 = u102[p1] == true
        return v1
    end
    local v8 = {Spacer0 = react.createElement(Spacer, {Visible = false, Hidden = false, Width = 0, LayoutOrder = v4()})}
    local v9 = {Image = "rbxassetid://12974400739", Label = "Select", Clicked = u4}
    local v10 = v1 == "Select"
    v9.Selected = v10
    v10 = {Visible = true, LayoutOrder = v4()}
    v9.Native = v10
    v8.Mouse = react.createElement(Icon, v9)
    v8.Spacer1 = react.createElement(Spacer, {LayoutOrder = v4(), Hidden = not getSpacerVisibility("Spacer1")})
    v9 = {Image = "rbxassetid://11295291707", Label = "Titan", Clicked = u4}
    v10 = v1 == "Titan"
    v9.Selected = v10
    v10 = {LayoutOrder = v4(), Visible = canAccessTitan}
    v9.Native = v10
    v8.Titan = react.createElement(Icon, v9)
    v9 = {Image = "rbxassetid://12974446859", Label = "Animal", Clicked = u4}
    v10 = v1 == "Animal"
    v9.Selected = v10
    v10 = {LayoutOrder = v4(), Visible = canAccessAnimal}
    v9.Native = v10
    v8.Animal = react.createElement(Icon, v9)
    v9 = {Image = "rbxassetid://12966415768", Label = "Prop", Clicked = u4}
    v10 = v1 == "Prop"
    v9.Selected = v10
    v9.Native = {LayoutOrder = v4(), Visible = canAccessProp}
    v8.Prop = react.createElement(Icon, v9)
    v8.Spacer2 = react.createElement(Spacer, {LayoutOrder = v4(), Hidden = not getSpacerVisibility("Spacer2")})
    v8.Visibility = react.createElement(Icon, {
        Image = "rbxassetid://12975608671",
        Label = "Visibility",
        Clicked = v3,
        Selected = v2.Visibility,
        Native = {LayoutOrder = v4(), Visible = canAccessVisibility},
    })
    v8.Spacer3 = react.createElement(Spacer, {Visible = false, Width = 2, LayoutOrder = v4(), Hidden = not getSpacerVisibility("Spacer3")})
    v8.Character = react.createElement(Icon, {
        Image = "rbxassetid://11295273292",
        Label = "Character",
        Clicked = v3,
        Selected = v2.Character,
        Native = {LayoutOrder = v4(), Visible = canAccessCharacter},
    })
    v8.Spacer4 = react.createElement(Spacer, {Visible = false, Width = 2, LayoutOrder = v4(), Hidden = not getSpacerVisibility("Spacer4")})
    v9 = {Image = "rbxassetid://12975608671", Label = "Slots", Clicked = v3, Selected = v2.Slots}
    v10 = {LayoutOrder = v4(), Visible = canAccessSlots}
    v9.Native = v10
    v8.Slots = react.createElement(Icon, v9)
    v8.Spacer5 = react.createElement(Spacer, {LayoutOrder = v4(), Hidden = not getSpacerVisibility("Spacer5")})
    v9 = {
        Image = "rbxassetid://12967712847",
        Label = "Builder",
        Clicked = function() -- Line: 459 -- upvalues: canAccessBuilder (val), Signals (upval), u4 (val), Building (upval), u13 (val)
            if canAccessBuilder then
                Signals.Editor.Building.UpdateSandboxMode:Fire(true)
                u4("Builder")
                Building.SetSandboxMode.post(true)
                return
            end
            Signals.Editor.Building.UpdateSandboxMode:Fire(false)
            u13({message = "You do not have permission to access the builder.", type = "error"})
            Building.SetSandboxMode.post(false)
        end,
    }
    v10 = v1 == "Builder"
    v9.Selected = v10
    v10 = {LayoutOrder = v4(), Visible = canAccessBuilder}
    v9.Native = v10
    v8.Builder = react.createElement(Icon, v9)
    v8.Spacer6 = react.createElement(Spacer, {Visible = false, Width = 2, LayoutOrder = v4(), Hidden = not getSpacerVisibility("Spacer6")})
    v9 = {Image = "rbxassetid://12966837030", Label = "Destruction", Clicked = u4}
    v10 = v1 == "Destruction"
    v9.Selected = v10
    v9.Native = {LayoutOrder = v4(), Visible = canAccessDestruction}
    v8.Destruction = react.createElement(Icon, v9)
    v8.Spacer7 = react.createElement(Spacer, {LayoutOrder = v4(), Hidden = not getSpacerVisibility("Spacer7")})
    v8.Pings = react.createElement(Icon, {
        Image = "rbxassetid://12974455496",
        Label = "Pings",
        Clicked = v3,
        Selected = v2.Pings,
        Native = {LayoutOrder = v4(), Visible = canAccessPings},
    })
    v8.Spacer9 = react.createElement(Spacer, {Visible = false, Width = 2, LayoutOrder = v4(), Hidden = not getSpacerVisibility("Spacer9")})
    v8.Logs = react.createElement(Icon, {
        Image = "rbxassetid://11963367322",
        Label = "Logs",
        Clicked = v3,
        Selected = v2.Logs,
        Native = {LayoutOrder = v4(), Visible = canAccessLogs},
    })
    v8.Spacer10 = react.createElement(Spacer, {Visible = false, Width = 2, LayoutOrder = v4(), Hidden = not getSpacerVisibility("Spacer10")})
    v8.Messages = react.createElement(Icon, {
        Image = "rbxassetid://11295283960",
        Label = "Messages",
        Clicked = v3,
        Selected = v2.Messages,
        Native = {LayoutOrder = v4(), Visible = canAccessMessages},
    })
    v8.Spacer8 = react.createElement(Spacer, {LayoutOrder = v4(), Hidden = not getSpacerVisibility("Spacer8")})
    v8.Lighting = react.createElement(Icon, {
        Image = "rbxassetid://12975600954",
        Label = "Lighting",
        Clicked = v3,
        Selected = v2.Lighting,
        Native = {LayoutOrder = v4(), Visible = canAccessLighting},
    })
    v8.Spacer12 = react.createElement(Spacer, {LayoutOrder = v4(), Hidden = not getSpacerVisibility("Spacer12")})
    v9 = {BackgroundTransparency = 1}
    local v11 = v7(100)
    v9.Size = UDim2.fromOffset(v11, v7(80))
    v9.LayoutOrder = v4()
    v9.Visible = canAccessFreecam or canAccessTeleport
    v8.Box = react.createElement(Frame, v9, {Layout = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, v7(20)),
    }), Freecam = react.createElement(Checkbox, {
        Label = "Freecam\n<font color=\"rgb(150, 150, 150)\" size=\"12\">Ctrl + E</font>",
        Default = u19,
        Native = {LayoutOrder = v4(), Visible = canAccessFreecam},
        Toggled = u20,
    }), ClickTp = react.createElement(Checkbox, {
        Default = false,
        Label = "Click Teleport\n<font color=\"rgb(150, 150, 150)\" size=\"12\">Alt + Click</font>",
        Native = {LayoutOrder = v4(), Visible = canAccessTeleport},
    })})
    v8.Spacer11 = react.createElement(Spacer, {Visible = false, Hidden = true, Width = 0, LayoutOrder = v4()})
    return react.createElement(Container, {Padding = "Large", Layout = "Horizontal", Spacing = 20}, v8)
end)