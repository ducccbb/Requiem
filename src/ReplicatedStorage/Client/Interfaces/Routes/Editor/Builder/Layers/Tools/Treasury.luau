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
-- File: ReplicatedStorage.Client.Interfaces.Routes.Editor.Builder.Layers.Tools.Treasury
--                              Dumped in 0.000920 seconds
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
local Treasury = require(Namespaces:WaitForChild("Treasury"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_2:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
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
local Dropdown = require(Universal_2:WaitForChild("Dropdown"))
local Hooks = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useBuildSandbox = require(Hooks:WaitForChild("useBuildSandbox"))
local Hooks_2 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useBuildTreasury = require(Hooks_2:WaitForChild("useBuildTreasury"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_5:WaitForChild("Client")
local Interfaces_3 = Client_3:WaitForChild("Interfaces")
local Hooks_3 = Interfaces_3:WaitForChild("Hooks")
local useRem = require(Hooks_3:WaitForChild("useRem"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_6:WaitForChild("Client")
local Interfaces_4 = Client_4:WaitForChild("Interfaces")
local Hooks_4 = Interfaces_4:WaitForChild("Hooks")
local useStore = require(Hooks_4:WaitForChild("useStore"))
return function() -- Line: 27 -- upvalues: useRem (val), useBuildTreasury (val), useBuildSandbox (val), useStore (val), Treasury (val), react (val), Container (val), Dropdown (val)
    local u3, u4
    u3, u4 = useBuildTreasury()
    local u11 = useStore(Treasury.Store, function(p1) -- Line: 32
        return p1
    end)
    local u17 = react.useMemo(function() -- Line: 36 -- upvalues: u11 (val)
        if not u11 then
            return {}
        end
        local v1 = {}
        local v2 = u11
        local v3 = nil
        local v4 = nil
        for i, j in v2, v3, v4 do
            table.insert(v1, {j.name, j.treasuryID})
        end
        return v1
    end, {u11})
    local v1 = react.useMemo(function() -- Line: 50 -- upvalues: u17 (val)
        local v1 = {}
        for i, v in ipairs(u17) do
            table.insert(v1, v[1])
        end
        return v1
    end, {u17})
    local v2 = react.useCallback(function(p1) -- Line: 60 -- upvalues: u4 (val), u3 (val)
        u4({isUsing = p1, treasuryId = u3.treasuryId})
    end, {u17, u11, u3})
    local v3 = react.useCallback(function(p1) -- Line: 64 -- upvalues: u17 (val), u4 (val), u3 (val)
        for i, v in ipairs(u17) do
            if v[1] == p1 then
                u4({isUsing = u3.isUsing, treasuryId = v[2]})
            end
        end
    end, {u17, u11, u3})
    local v4 = {Padding = "Large", Layout = "Vertical", Spacing = 20}
    local v5 = {AnchorPoint = Vector2.new(1, 1)}
    local v6 = UDim2.fromScale(1, 1)
    v5.Position = v6 + UDim2.fromOffset(0, -useRem()(330))
    v5.Visible = not useBuildSandbox()
    v4.Native = v5
    return react.createElement(Container, v4, {Size = react.createElement(Dropdown, {
        Header = "Use Treasury",
        Divider = 150,
        Width = 150,
        Options = v1,
        Default = v1[1],
        Toggleable = {Visible = true, Default = false, Changed = v2},
        Changed = v3,
    })})
end