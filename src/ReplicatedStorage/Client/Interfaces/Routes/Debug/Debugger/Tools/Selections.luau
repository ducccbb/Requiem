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
--   File: ReplicatedStorage.Client.Interfaces.Routes.Debug.Debugger.Tools.Selections
--                              Dumped in 0.000806 seconds
--                          Bytecode version 9  |  2 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Constants = require(Common:WaitForChild("Constants"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_3:WaitForChild("Client")
local Interfaces = Client:WaitForChild("Interfaces")
local Components = Interfaces:WaitForChild("Components")
local Editor = Components:WaitForChild("Editor")
local Universal = Editor:WaitForChild("Universal")
local Container = require(Universal:WaitForChild("Container"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_4:WaitForChild("Client")
local Interfaces_2 = Client_2:WaitForChild("Interfaces")
local Components_2 = Interfaces_2:WaitForChild("Components")
local Editor_2 = Components_2:WaitForChild("Editor")
local Universal_2 = Editor_2:WaitForChild("Universal")
local Icon = require(Universal_2:WaitForChild("Icon"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_5:WaitForChild("Client")
local Interfaces_3 = Client_3:WaitForChild("Interfaces")
local Components_3 = Interfaces_3:WaitForChild("Components")
local Editor_3 = Components_3:WaitForChild("Editor")
local Universal_3 = Editor_3:WaitForChild("Universal")
local Spacer = require(Universal_3:WaitForChild("Spacer"))
local Hooks = script.Parent.Parent.Parent:WaitForChild("Hooks")
local useDebuggerPages = require(Hooks:WaitForChild("useDebuggerPages"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_6:WaitForChild("Client")
local Interfaces_4 = Client_4:WaitForChild("Interfaces")
local Hooks_2 = Interfaces_4:WaitForChild("Hooks")
local useOrder = require(Hooks_2:WaitForChild("useOrder"))
return react.memo(function() -- Line: 29 -- upvalues: useOrder (val), useDebuggerPages (val), Constants (val), react (val), Container (val), Spacer (val), Icon (val)
    local v1, v2, v3
    local v4 = useOrder()
    v1, _, v2 = useDebuggerPages()
    local IsDebuggingPlace = not Constants.IsSupporterPlace
    if not IsDebuggingPlace then
        IsDebuggingPlace = Constants.IsDebuggingPlace
    end
    local createElement = react.createElement
    local v5 = {
        Spacer0 = react.createElement(Spacer, {Visible = false, Hidden = false, Width = 0, LayoutOrder = v4()}),
        Values = react.createElement(Icon, {
            Image = "rbxassetid://12974242378",
            Label = "Values",
            Clicked = v2,
            Selected = v1.Values,
            Native = {LayoutOrder = v4(), Visible = IsDebuggingPlace},
        }),
        Logs = react.createElement(Icon, {
            Image = "rbxassetid://11295289733",
            Label = "Logs",
            Clicked = v2,
            Selected = v1.Logs,
            Native = {LayoutOrder = v4(), Visible = IsDebuggingPlace},
        }),
        Config = react.createElement(Icon, {
            Image = "rbxassetid://11430230718",
            Label = "Config",
            Clicked = v2,
            Selected = v1.Config,
            Native = {LayoutOrder = v4(), Visible = IsDebuggingPlace},
        }),
        States = react.createElement(Icon, {
            Image = "rbxassetid://11293977875",
            Label = "States",
            Clicked = v2,
            Selected = v1.States,
            Native = {LayoutOrder = v4(), Visible = IsDebuggingPlace},
        }),
        Spacer2 = react.createElement(Spacer, {Width = 2, LayoutOrder = v4(), Visible = IsDebuggingPlace}),
    }
    if not IsDebuggingPlace then
        v3 = react.createElement(react.Fragment)
    else
        v3 = react.createElement(Spacer, {Visible = false, Hidden = false, Width = 1, LayoutOrder = v4()})
        if not v3 then
            v3 = react.createElement(react.Fragment)
        end
    end
    v5.Spacer5 = v3
    v5.Enchants = react.createElement(Icon, {
        Image = "rbxassetid://12967618029",
        Label = "Enchants",
        Clicked = v2,
        Selected = v1.Enchants,
        Native = {Visible = true, LayoutOrder = v4()},
    })
    v5.Spacer3 = react.createElement(Spacer, {Visible = false, Hidden = false, Width = 5, LayoutOrder = v4()})
    v5.Proficiency = react.createElement(Icon, {
        Image = "rbxassetid://12974204015",
        Label = "Proficiency",
        Clicked = v2,
        Selected = v1.Proficiency,
        Native = {Visible = true, LayoutOrder = v4()},
    })
    v5.Spacer4 = react.createElement(Spacer, {Visible = false, Hidden = false, Width = 5, LayoutOrder = v4()})
    v5.Sacraments = react.createElement(Icon, {
        Image = "rbxassetid://12966420371",
        Label = "Sacraments",
        Clicked = v2,
        Selected = v1.Sacraments,
        Native = {Visible = true, LayoutOrder = v4()},
    })
    v5.Spacer6 = react.createElement(Spacer, {Visible = false, Hidden = false, Width = 1, LayoutOrder = v4()})
    v5.Spacer7 = react.createElement(Spacer, {Visible = true, Width = 2, LayoutOrder = v4()})
    v5.Tests = react.createElement(Icon, {
        Image = "rbxassetid://11422151787",
        Label = "Tests",
        Clicked = v2,
        Selected = v1.Tests,
        Native = {Visible = true, LayoutOrder = v4()},
    })
    v5.Spacer11 = react.createElement(Spacer, {Visible = false, Hidden = false, Width = 0, LayoutOrder = v4()})
    return createElement(Container, {Padding = "Large", Layout = "Horizontal", Spacing = 20}, v5)
end)