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
--  File: ReplicatedStorage.Client.Interfaces.Routes.Editor.Staff.Pages.Spawner.Animal
--                              Dumped in 0.000832 seconds
--                          Bytecode version 9  |  6 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Administration = require(Namespaces:WaitForChild("Administration"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_2:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_3:WaitForChild("Client")
local User = Client:WaitForChild("User")
local Editor = User:WaitForChild("Editor")
local Universal = Editor:WaitForChild("Universal")
local UserPlacementHandler = require(Universal:WaitForChild("UserPlacementHandler"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_4:WaitForChild("Client")
local Interfaces = Client_2:WaitForChild("Interfaces")
local Components = Interfaces:WaitForChild("Components")
local Editor_2 = Components:WaitForChild("Editor")
local Universal_2 = Editor_2:WaitForChild("Universal")
local Container = require(Universal_2:WaitForChild("Container"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_5:WaitForChild("Client")
local Interfaces_2 = Client_3:WaitForChild("Interfaces")
local Components_2 = Interfaces_2:WaitForChild("Components")
local Editor_3 = Components_2:WaitForChild("Editor")
local Universal_3 = Editor_3:WaitForChild("Universal")
local Dropdown = require(Universal_3:WaitForChild("Dropdown"))
local Hooks = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useEditorEnabled = require(Hooks:WaitForChild("useEditorEnabled"))
local Hooks_2 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useEditorTools = require(Hooks_2:WaitForChild("useEditorTools"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_6:WaitForChild("Client")
local Interfaces_3 = Client_4:WaitForChild("Interfaces")
local Hooks_3 = Interfaces_3:WaitForChild("Hooks")
local useOrder = require(Hooks_3:WaitForChild("useOrder"))
return react.memo(function() -- Line: 31 -- upvalues: useOrder (val), useEditorTools (val), useEditorEnabled (val), react (val), Administration (val), UserPlacementHandler (val), Container (val), Dropdown (val)
    local Wolf, Wolf_2
    local v1 = useOrder()
    local u3 = useEditorTools()
    local u5 = useEditorEnabled()
    Wolf, Wolf_2 = react.useState("Wolf")
    local u16 = react.useCallback(function(p1) -- Line: 39 -- upvalues: Administration (upval), Wolf (val), UserPlacementHandler (upval)
        local Pivot = p1:GetPivot()
        Administration.Animal.unreliablePost(Pivot, Wolf)
        UserPlacementHandler.onSuccessfulPlacement()
    end, {Wolf})
    local v2 = {}
    local v3 = if u3 == "Animal" then u5 else false
    v2[1] = v3
    v2[2] = Wolf
    react.useEffect(function() -- Line: 46 -- upvalues: u5 (val), u3 (val), UserPlacementHandler (upval), Wolf (val), u16 (val)
        if not u5 or u3 ~= "Animal" then
            return
        end
        UserPlacementHandler.setPropSettings(UserPlacementHandler.Presets.WireframeLookAt)
        local v1 = UserPlacementHandler.getModelFromAssets((("Entities/%*"):format(Wolf)))
        if not v1 then
            return warn((("Could not find model for variant %*"):format(Wolf)))
        end
        local u30 = UserPlacementHandler.onBeginModelPlacement(v1):Connect(u16)
        return function() -- Line: 62 -- upvalues: UserPlacementHandler (upval), u30 (val)
            UserPlacementHandler.onEndModelPlacement()
            u30:Disconnect()
        end
    end, v2)
    v2 = {Draggable = true, Layout = "Vertical", Spacing = 10, Position = UDim2.fromScale(0.1, 0.5)}
    v3 = {}
    local v4 = u3 == "Animal"
    v3.Visible = v4
    v2.Native = v3
    return react.createElement(Container, v2, {Variant = react.createElement(Dropdown, {
        Header = "Variant",
        Default = "Wolf",
        Divider = 150,
        Options = {"Wolf", "Bear"},
        Changed = function(p1) -- Line: 85 -- upvalues: Wolf_2 (val)
            Wolf_2(p1)
        end,
        Native = {LayoutOrder = v1()},
    })})
end)