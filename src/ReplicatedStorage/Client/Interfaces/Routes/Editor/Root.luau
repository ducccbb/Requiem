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
--             File: ReplicatedStorage.Client.Interfaces.Routes.Editor.Root
--                              Dumped in 0.000600 seconds
--                          Bytecode version 9  |  7 functions

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
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Administration_2 = Common_2:WaitForChild("Administration")
local Permissions = require(Administration_2:WaitForChild("Permissions"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_4:WaitForChild("Client")
local User = Client:WaitForChild("User")
local State = User:WaitForChild("State")
local ClientSettingsHandler = require(State:WaitForChild("ClientSettingsHandler"))
local Providers = v1.Parent:WaitForChild("Providers")
local EditorProvider = require(Providers:WaitForChild("EditorProvider"))
local Staff = v1.Parent:WaitForChild("Staff")
local Root = require(Staff:WaitForChild("Root"))
local Hooks = v1.Parent:WaitForChild("Hooks")
local useEditorEnabled = require(Hooks:WaitForChild("useEditorEnabled"))
local Hooks_2 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useStore = require(Hooks_2:WaitForChild("useStore"))
local function Editor() -- Line: 33 -- upvalues: useEditorEnabled (val), react (val), ClientSettingsHandler (val), Root (val)
    local u1, u2
    u1, u2 = useEditorEnabled()
    react.useEffect(function() -- Line: 36 -- upvalues: ClientSettingsHandler (upval), u2 (val), u1 (val)
        local u7 = ClientSettingsHandler.onKeybindPressed("Staff Editor"):Connect(function() -- Line: 37 -- upvalues: u2 (upval), u1 (upval)
            u2(not u1)
        end)
        return function() -- Line: 41 -- upvalues: u7 (val)
            u7:Disconnect()
        end
    end, {u1})
    return react.createElement(Root)
end
return function() -- Line: 51 -- upvalues: useStore (val), Administration (val), Permissions (val), react (val), EditorProvider (val), Editor (val)
    local v1
    local v2 = useStore(Administration.Store, function(p1) -- Line: 52
        return p1
    end)
    local permission = v2
    if permission then
        permission = v2.permission
        if permission then
            permission = false
            if Permissions.Accessability.Editor <= v2.permission then
                permission = v2.staffSlot == 1
            end
        end
    end
    if not permission then
        v1 = react.createElement(react.Fragment)
    else
        v1 = react.createElement(EditorProvider.EditorProvider, {}, react.createElement(Editor))
        if not v1 then
            v1 = react.createElement(react.Fragment)
        end
    end
    return v1
end