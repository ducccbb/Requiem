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
--   File: ReplicatedStorage.Client.Interfaces.Routes.Editor.Providers.BuilderProvider
--                               Dumped in 0.00112 seconds
--                          Bytecode version 9  |  12 functions

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
local Types = Common:WaitForChild("Types")
local Building_2 = Types:WaitForChild("Building")
local Entries = Building_2:WaitForChild("Entries")
local Blueprints = require(Entries:WaitForChild("Blueprints"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Network = Common_2:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Building = require(Namespaces:WaitForChild("Building"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Signals = require(Common_3:WaitForChild("Signals"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_5:WaitForChild("Common")
local Types_2 = Common_4:WaitForChild("Types")
require(Types_2:WaitForChild("Editor"))
local Hooks = script.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useSignal = require(Hooks:WaitForChild("useSignal"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_6:WaitForChild("Common")
local Types_3 = Common_5:WaitForChild("Types")
local Building_3 = Types_3:WaitForChild("Building")
local Categories = Building_3:WaitForChild("Categories")
local Blueprints_2 = require(Categories:WaitForChild("Blueprints"))
local function __createFakeBuilderStore() -- Line: 91 -- upvalues: Blueprints_2 (val)
    local v1 = {}
    local v2 = Blueprints_2
    local v3 = nil
    local v4 = nil
    for i, j in v2, v3, v4 do
        table.insert(v1, j.id)
    end
    return {blueprints = v1, zone = {}}
end
local function __mapNetworkToBuilderStore(p1) -- Line: 102 -- upvalues: Blueprints (val)
    return {
        server = {blueprints = Blueprints.convertBlueprintsToCategorical(p1.blueprints)},
    }
end
local u159 = react.createContext(__mapNetworkToBuilderStore(__createFakeBuilderStore()))
return {
    BuilderProvider = function(p1) -- Line: 116 -- upvalues: react (val), __mapNetworkToBuilderStore (val), __createFakeBuilderStore (val), useSignal (val), Signals (val), Building (val), u159 (val)
        local Mouse, Mouse_2, u10, u15, u19, u20, u29, u34, u35, v1, v2, v3, v4, v5, v6, v7
        local u5 = react.useMemo(function() -- Line: 117 -- upvalues: __mapNetworkToBuilderStore (upval), __createFakeBuilderStore (upval)
            return __mapNetworkToBuilderStore(__createFakeBuilderStore())
        end, {})
        v6, u10 = react.useState(false)
        v7, u15 = react.useState({})
        u19, u20 = react.useState(nil)
        Mouse, Mouse_2 = react.useState("Mouse")
        u29, v1 = react.useState({isUsing = false, treasuryId = 0})
        u34, u35 = react.useState(false)
        v2, v3 = react.useState(false)
        v4, v5 = react.useState(nil)
        local u49 = react.useRef(nil)
        useSignal(u35, {Signals.Editor.Building.UpdateSandboxMode})
        useSignal(u10, {Signals.Editor.Building.UpdateEnabled})
        useSignal(u20, {Signals.Editor.Building.UpdateSelection})
        useSignal(u15, {Signals.Editor.Building.UpdateZoneInformation})
        useSignal(Mouse_2, {Signals.Editor.Building.UpdateTool})
        useSignal(v5, {Signals.Editor.Building.UpdateZonePermissionPage})
        react.useEffect(function() -- Line: 155 -- upvalues: Signals (upval), u10 (val), u15 (val), u20 (val), Building (upval), u35 (val)
            Signals.Editor.Building.OnEnabledUpdated:Connect(u10)
            Signals.Editor.Building.OnZoneInformationUpdated:Connect(u15)
            Signals.Editor.Building.OnSelectionUpdated:Connect(u20)
            Building.SetSandboxMode.listen(u35)
        end, {})
        react.useEffect(function() -- Line: 165 -- upvalues: u15 (val), u5 (val)
            u15(u5.zoneInformation)
        end, {u5.zoneInformation})
        react.useEffect(function() -- Line: 170 -- upvalues: Signals (upval), u19 (val)
            Signals.Editor.Building.OnSelectionUpdated:Fire(u19)
        end, {u19})
        react.useEffect(function() -- Line: 175 -- upvalues: Signals (upval), Mouse (val)
            Signals.Editor.Building.OnToolUpdated:Fire(Mouse)
        end, {Mouse})
        react.useEffect(function() -- Line: 180 -- upvalues: Building (upval), u34 (val)
            Building.SetSandboxMode.post(u34)
        end, {u34})
        react.useEffect(function() -- Line: 185 -- upvalues: Signals (upval), u29 (val)
            Signals.Editor.Building.OnTreasuryUpdated:Fire(u29)
        end, {u29})
        react.useEffect(function() -- Line: 189 -- upvalues: Mouse (val), u19 (val), u49 (val), u20 (val)
            if Mouse == "Stamp" or not u19 or u49.current ~= "Stamp" then
                u49.current = Mouse
                return
            end
            local v1 = string.split(u19, "/")
            if 2 >= #v1 then
                u20(nil)
                u49.current = Mouse
                return
            end
            local v2 = table.concat(v1, "/", 1, #v1 - 1)
            if not v2 then
                return u20(nil)
            end
            u20(v2 .. "/*")
            u49.current = Mouse
        end, {Mouse, u19})
        return react.createElement(u159.Provider, {
            value = {
                server = u5.server,
                setEnabled = u10,
                enabled = v6,
                setZoneInformation = u15,
                zoneInformation = v7,
                setSelection = u20,
                selection = u19,
                setTool = Mouse_2,
                tool = Mouse,
                setTreasury = v1,
                treasury = u29,
                setIsSandboxMode = u35,
                isSandboxMode = u34,
                setShowDescendants = v3,
                showDescendants = v2,
                setZonePermissionPage = v5,
                zonePermissionPage = v4,
            },
        }, p1.children)
    end,
    BuilderContext = u159,
}