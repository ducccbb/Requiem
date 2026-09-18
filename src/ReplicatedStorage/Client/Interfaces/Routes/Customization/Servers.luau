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
--        File: ReplicatedStorage.Client.Interfaces.Routes.Customization.Servers
--                               Dumped in 0.00204 seconds
--                          Bytecode version 9  |  24 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Promise = require(Common:WaitForChild("Promise"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_2:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Network = Common_2:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Servers = require(Namespaces:WaitForChild("Servers"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Network_2 = Common_3:WaitForChild("Network")
local Namespaces_2 = Network_2:WaitForChild("Namespaces")
local Vitality = require(Namespaces_2:WaitForChild("Vitality"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_5:WaitForChild("Common")
local Network_3 = Common_4:WaitForChild("Network")
local Namespaces_3 = Network_3:WaitForChild("Namespaces")
local Administration = require(Namespaces_3:WaitForChild("Administration"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_6:WaitForChild("Common")
local Administration_2 = Common_5:WaitForChild("Administration")
local Permissions = require(Administration_2:WaitForChild("Permissions"))
local Hooks = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useInterfaceState = require(Hooks:WaitForChild("useInterfaceState"))
local Hooks_2 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useStore = require(Hooks_2:WaitForChild("useStore"))
local Hooks_3 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useToast = require(Hooks_3:WaitForChild("useToast"))
local Components = v1.Parent.Parent.Parent:WaitForChild("Components")
local Menu = Components:WaitForChild("Menu")
local Servers_2 = Menu:WaitForChild("Servers")
local List = require(Servers_2:WaitForChild("List"))
local Components_2 = v1.Parent.Parent.Parent:WaitForChild("Components")
local Menu_2 = Components_2:WaitForChild("Menu")
local Servers_3 = Menu_2:WaitForChild("Servers")
local Slot = require(Servers_3:WaitForChild("Slot"))
return function() -- Line: 56 -- upvalues: useInterfaceState (val), react (val), useToast (val), useStore (val), Servers (val), Administration (val), Vitality (val), Permissions (val), Promise (val), Players (val), List (val), Slot (val)
    local u17, u18, u25, u29, u30, u34, u35, u8, v1, v2, visible
    local black = useInterfaceState("black")
    local teleporting = useInterfaceState("teleporting")
    u8, v1 = useInterfaceState("server-selecting")
    local v3 = v1
    if not v3 then
        v3 = {visible = false, place = 0}
    end
    local u13 = v3
    u17, u18 = react.useState(false)
    local u20 = useToast()
    v2, u25 = react.useState(false)
    u29, u30 = react.useState(nil)
    u34, u35 = react.useState(false)
    local v4 = useStore(Servers.Store, function(p1) -- Line: 71
        local v1 = p1
        if not v1 then
            v1 = {}
        end
        return v1
    end)
    local u45 = useStore(Administration.Store, function(p1) -- Line: 75
        return p1
    end)
    local u50 = useStore(Vitality.Store, function(p1) -- Line: 79
        return p1
    end)
    local v5 = {}
    local permission = u45
    if permission then
        permission = u45.permission
    end
    v5[1] = permission
    local u61 = react.useMemo(function() -- Line: 83 -- upvalues: u45 (val), Permissions (upval)
        local v1 = u45
        if v1 then
            v1 = Permissions.Accessability.Events <= u45.permission
        end
        return v1
    end, v5)
    local u67 = react.useCallback(function(p1) -- Line: 87 -- upvalues: u61 (val)
        local v1 = if p1 ~= nil then if p1.queue == 1 then not u61 else false else false
        return v1
    end, {u61})
    local u76 = react.useCallback(function(p1) -- Line: 91 -- upvalues: black (val), Promise (upval), teleporting (val)
        black({enabled = true, tween = TweenInfo.new(1)})
        Promise.delay(1):andThen(function() -- Line: 94 -- upvalues: teleporting (upval), black (upval), p1 (val)
            teleporting(true)
            black({enabled = false, tween = TweenInfo.new(0.5)})
            p1()
        end)
    end, {})
    local u86 = react.useCallback(function(p1) -- Line: 101 -- upvalues: u67 (val), u8 (val), u25 (val), Servers (upval), u76 (val)
        if not (u67(p1)) then
            u76(function() -- Line: 109 -- upvalues: Servers (upval), p1 (val)
                Servers.Join.post(p1)
            end)
            return
        end
        u8({visible = false, place = 0})
        u25(false)
        Servers.Join.post(p1)
    end, {u67, u76})
    react.useEffect(function() -- Line: 114 -- upvalues: Players (upval), u18 (val)
        local v1, v2
        v1, v2 = pcall(function() -- Line: 115 -- upvalues: Players (upval)
            return Players.LocalPlayer:GetRankInGroupAsync(34035348)
        end)
        if v1 then
            local v3 = v2 == 25
            u18(v3)
        end
    end, {})
    local u100 = u45
    if u100 then
        u100 = Permissions.Roles.Actor <= u45.permission
    end
    react.useEffect(function() -- Line: 127 -- upvalues: u13 (ref), u25 (val)
        if u13 and u13.visible then
            u25(false)
        end
    end, {u13})
    local v6 = {}
    local v7 = {Servers = v4, Place = u13.place}
    visible = u13.visible
    if visible then
        visible = not v2
    end
    v7.Visible = visible
    function v7.Closed() -- Line: 139 -- upvalues: u8 (val)
        u8({visible = false, place = 0})
    end
    function v7.Clicked(p1) -- Line: 143 -- upvalues: u50 (val), u30 (val), u35 (val), u100 (val), u25 (val), u86 (val)
        if u50.wiped == 1 then
            return
        end
        u30(p1)
        u35(false)
        if u100 then
            u25(true)
            return
        end
        u86(p1)
    end
    function v7.Create() -- Line: 159 -- upvalues: u50 (val), u35 (val), u100 (val), u25 (val), black (val), Promise (upval), teleporting (val), Servers (upval), u13 (ref)
        if u50.wiped == 1 then
            return
        end
        u35(true)
        if u100 then
            u25(true)
            return
        end
        black({enabled = true, tween = TweenInfo.new(1)})
        Promise.delay(1):andThen(function() -- Line: 173 -- upvalues: teleporting (upval), black (upval), Servers (upval), u13 (upval)
            teleporting(true)
            black({enabled = false, tween = TweenInfo.new(0.5)})
            Servers.Create.post(u13.place)
        end)
    end
    v6.List = react.createElement(List, v7)
    v6.Slot = react.createElement(Slot, {
        Servers = v4,
        Place = u13.place,
        Visible = v2,
        Clicked = function(p1) -- Line: 187 -- upvalues: u17 (val), u20 (val), Administration (upval), u34 (val), black (val), Promise (upval), teleporting (val), Servers (upval), u13 (ref), u29 (val), u67 (val), u25 (val), u86 (val), u76 (val)
            if p1 == "Staff" then
                local v1
                local v2 = p1 == "Staff"
                if not v2 then
                    v1 = 0
                else
                    v1 = 1
                end
                Administration.AdminSlot.post(v1)
                if u34 then
                    black({enabled = true, tween = TweenInfo.new(1)})
                    Promise.delay(1):andThen(function() -- Line: 203 -- upvalues: teleporting (upval), Servers (upval), u13 (upval)
                        teleporting(true)
                        Servers.Create.post(u13.place)
                    end)
                    return
                end
                if not u29 then
                    black({enabled = true, tween = TweenInfo.new(1)})
                    Promise.delay(1):andThen(function() -- Line: 218 -- upvalues: u29 (upval), u76 (upval), Servers (upval)
                        if u29 then
                            u76(function() -- Line: 220 -- upvalues: Servers (upval), u29 (upval)
                                Servers.Join.post(u29)
                            end)
                        end
                    end)
                    return
                end
                if u67(u29) then
                    u25(false)
                    u86(u29)
                    return
                end
                black({enabled = true, tween = TweenInfo.new(1)})
                Promise.delay(1):andThen(function() -- Line: 218 -- upvalues: u29 (upval), u76 (upval), Servers (upval)
                    if u29 then
                        u76(function() -- Line: 220 -- upvalues: Servers (upval), u29 (upval)
                            Servers.Join.post(u29)
                        end)
                    end
                end)
                return
            elseif u17 then
                u20({message = "You are a ranked actor, you cannot use this slot.", type = "error"})
                return
            end
        end,
        Closed = function() -- Line: 227 -- upvalues: u25 (val), u8 (val)
            u25(false)
            u8({visible = false, place = 0})
        end,
        Create = function() end,
    })
    return react.createElement(react.Fragment, {}, v6)
end