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
--              File: ReplicatedStorage.Client.Interfaces.Routes.Debug.Root
--                              Dumped in 0.000626 seconds
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
local Constants = require(Common_2:WaitForChild("Constants"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Administration_2 = Common_3:WaitForChild("Administration")
local Permissions = require(Administration_2:WaitForChild("Permissions"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_5:WaitForChild("Client")
local User = Client:WaitForChild("User")
local State = User:WaitForChild("State")
local ClientSettingsHandler = require(State:WaitForChild("ClientSettingsHandler"))
local Providers = v1.Parent:WaitForChild("Providers")
local DebugProvider = require(Providers:WaitForChild("DebugProvider"))
local Debugger_2 = v1.Parent:WaitForChild("Debugger")
local Root = require(Debugger_2:WaitForChild("Root"))
local Hooks = v1.Parent:WaitForChild("Hooks")
local useDebuggerEnabled = require(Hooks:WaitForChild("useDebuggerEnabled"))
local Hooks_2 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useStore = require(Hooks_2:WaitForChild("useStore"))
local function Debugger() -- Line: 34 -- upvalues: useDebuggerEnabled (val), react (val), ClientSettingsHandler (val), Root (val)
    local u1, u2
    u1, u2 = useDebuggerEnabled()
    react.useEffect(function() -- Line: 37 -- upvalues: ClientSettingsHandler (upval), u2 (val), u1 (val)
        local u7 = ClientSettingsHandler.onKeybindPressed("Debug Editor"):Connect(function() -- Line: 38 -- upvalues: u2 (upval), u1 (upval)
            u2(not u1)
        end)
        return function() -- Line: 42 -- upvalues: u7 (val)
            u7:Disconnect()
        end
    end, {u1})
    return react.createElement(Root)
end
return function() -- Line: 52 -- upvalues: useStore (val), Administration (val), Permissions (val), Constants (val), react (val), DebugProvider (val), Debugger (val)
    local IsDebuggingPlace, v1
    local v2 = useStore(Administration.Store, function(p1) -- Line: 53
        return p1
    end)
    if not v2 then
        IsDebuggingPlace = Constants.IsDebuggingPlace
        if not IsDebuggingPlace then
            IsDebuggingPlace = Constants.IsSupporterPlace
        end
    elseif v2.permission and Permissions.Accessability.Debug <= v2.permission then
        IsDebuggingPlace = true
        if v2.staffSlot == 1 then end
    end
    if not IsDebuggingPlace then
        v1 = react.createElement(react.Fragment)
    else
        v1 = react.createElement(DebugProvider.DebugProvider, {}, react.createElement(Debugger))
        if not v1 then
            v1 = react.createElement(react.Fragment)
        end
    end
    return v1
end