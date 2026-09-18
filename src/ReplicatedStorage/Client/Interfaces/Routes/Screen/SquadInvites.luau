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
--         File: ReplicatedStorage.Client.Interfaces.Routes.Screen.SquadInvites
--                              Dumped in 0.000759 seconds
--                          Bytecode version 9  |  11 functions

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
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Squad = require(Namespaces:WaitForChild("Squad"))
local Components = v1.Parent.Parent.Parent:WaitForChild("Components")
local Screen = Components:WaitForChild("Screen")
local Request = require(Screen:WaitForChild("Request"))
local Hooks = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useRem = require(Hooks:WaitForChild("useRem"))
local function getLeaderName(p1) -- Line: 23
    local Attribute = p1:GetAttribute("DisplayName")
    if not Attribute then
        Attribute = p1:GetAttribute("Name")
        if not Attribute then
            Attribute = p1.Name
        end
    end
    return Attribute
end
return function() -- Line: 27 -- upvalues: useRem (val), react (val), Squad (val), getLeaderName (val), Request (val)
    local u6, v1
    local v2 = useRem()
    v1, u6 = react.useState({})
    local function removeInvite(p1) -- Line: 31 -- upvalues: u6 (val)
        u6(function(a1) -- Line: 32 -- upvalues: p1 (val)
            local v1 = table.clone(a1)
            v1[p1] = nil
            return v1
        end)
    end
    react.useEffect(function() -- Line: 39 -- upvalues: Squad (upval), getLeaderName (upval), u6 (val)
        return Squad.SquadInvite.listen(function(p1) -- Line: 40 -- upvalues: getLeaderName (upval), u6 (upval)
            local leader = p1.leader
            if not leader then
                return
            end
            local UserId = leader.UserId
            local u5 = getLeaderName(leader)
            u6(function(p1) -- Line: 49 -- upvalues: UserId (val), u5 (val), leader (val)
                local v1 = table.clone(p1)
                v1[UserId] = {header = "Squad Invite", description = u5 .. " is inviting you to their squad.", leader = leader, id = UserId}
                return v1
            end)
        end)
    end, {})
    local v3 = {}
    local v4 = v1
    local v5 = nil
    local v6 = nil
    for i, j in v4, v5, v6 do
        v3[j.id] = react.createElement(Request, {
            duration = 20,
            header = j.header,
            description = j.description,
            onAllow = function() -- Line: 71 -- upvalues: removeInvite (val), j (val), Squad (upval)
                removeInvite(j.id)
                Squad.SquadInviteResponse.post({accepted = 1, leader = j.leader})
            end,
            onDeny = function() -- Line: 79 -- upvalues: removeInvite (val), j (val), Squad (upval)
                removeInvite(j.id)
                Squad.SquadInviteResponse.post({accepted = 0, leader = j.leader})
            end,
            onExpire = function() -- Line: 87 -- upvalues: removeInvite (val), j (val), Squad (upval)
                removeInvite(j.id)
                Squad.SquadInviteResponse.post({accepted = 0, leader = j.leader})
            end,
        })
    end
    v6 = {BackgroundTransparency = 1, BorderSizePixel = 0, AnchorPoint = Vector2.new(1, 1)}
    local v7 = UDim2.fromScale(1, 1)
    local v8 = -v2(1)
    v6.Position = v7 + UDim2.fromOffset(v8, -v2(50))
    v7 = v2(316)
    v6.Size = UDim2.fromOffset(v7, v2(152))
    return react.createElement("Frame", v6, {List = react.createElement("UIListLayout", {SortOrder = Enum.SortOrder.LayoutOrder, VerticalAlignment = Enum.VerticalAlignment.Bottom})}, v3)
end