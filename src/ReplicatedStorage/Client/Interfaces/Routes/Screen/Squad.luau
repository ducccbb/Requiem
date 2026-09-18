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
--             File: ReplicatedStorage.Client.Interfaces.Routes.Screen.Squad
--                              Dumped in 0.000657 seconds
--                          Bytecode version 9  |  5 functions

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
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_2:WaitForChild("Client")
local User = Client:WaitForChild("User")
local State = User:WaitForChild("State")
local ClientSettingsHandler = require(State:WaitForChild("ClientSettingsHandler"))
local Components = v1.Parent.Parent.Parent:WaitForChild("Components")
local Screen = Components:WaitForChild("Screen")
local Squad_2 = Screen:WaitForChild("Squad")
local Member = require(Squad_2:WaitForChild("Member"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_3:WaitForChild("Common")
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Squad = require(Namespaces:WaitForChild("Squad"))
local Hooks = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useRem = require(Hooks:WaitForChild("useRem"))
local Hooks_2 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useStore = require(Hooks_2:WaitForChild("useStore"))
local v3 = {None = 1}
return function() -- Line: 35 -- upvalues: useRem (val), react (val), ClientSettingsHandler (val), useStore (val), Squad (val), Member (val)
    local memberIds, u6, v1, v2, v3
    local v4 = useRem()
    v1, u6 = react.useState(1)
    local v5 = {}
    react.useEffect(function() -- Line: 39 -- upvalues: ClientSettingsHandler (upval), u6 (val)
        local v1 = ClientSettingsHandler.getSettingFromName("Squad Position") or 1
        u6(v1)
        return ClientSettingsHandler.onSettingChanged:Connect(function(p1, p2) -- Line: 43 -- upvalues: u6 (upval)
            if p1 == "Squad Position" then
                u6(p2 or 1)
            end
        end)
    end, v5)
    local v6 = useStore(Squad.Store, function(p1) -- Line: 50
        if not p1 then
            return {leaderId = 0, maxMembers = 5, memberIds = {}}
        end
        local v1 = {leaderId = p1.leaderId or 0}
        local memberIds = p1.memberIds
        if not memberIds then
            memberIds = {}
        end
        v1.memberIds = memberIds
        v1.maxMembers = p1.maxMembers or 5
        return v1
    end)
    memberIds = v6.memberIds
    if v1 == 1 or #memberIds < 2 then
        return react.createElement(react.Fragment)
    end
    v5 = {}
    for i, v in ipairs(memberIds) do
        v2 = {userId = v}
        v3 = v == v6.leaderId
        v2.isLeader = v3
        v2.layoutOrder = i
        v5[v] = react.createElement(Member, v2)
    end
    return react.createElement("Frame", {}, {List = react.createElement("UIListLayout", {SortOrder = Enum.SortOrder.LayoutOrder, VerticalAlignment = Enum.VerticalAlignment.Top, Padding = UDim.new(0, v4(5))})}, v5)
end