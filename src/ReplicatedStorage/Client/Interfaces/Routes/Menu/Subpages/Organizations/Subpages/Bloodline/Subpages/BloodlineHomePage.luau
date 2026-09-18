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
--File: ReplicatedStorage.Client.Interfaces.Routes.Menu.Subpages.Organizations.Subpages.Bloodline.Subpages.BloodlineHomePage
--                              Dumped in 0.000857 seconds
--                          Bytecode version 9  |  6 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Bloodline = require(Namespaces:WaitForChild("Bloodline"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_2:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Types = Common_2:WaitForChild("Types")
require(Types:WaitForChild("Bloodline"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_4:WaitForChild("Client")
local Interfaces = Client:WaitForChild("Interfaces")
local Components = Interfaces:WaitForChild("Components")
local Primitives = Components:WaitForChild("Primitives")
local Frame = require(Primitives:WaitForChild("Frame"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_5:WaitForChild("Client")
local Interfaces_2 = Client_2:WaitForChild("Interfaces")
local Components_2 = Interfaces_2:WaitForChild("Components")
local Primitives_2 = Components_2:WaitForChild("Primitives")
local VerticalListLayout = require(Primitives_2:WaitForChild("VerticalListLayout"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_6:WaitForChild("Client")
local Interfaces_3 = Client_3:WaitForChild("Interfaces")
local Components_3 = Interfaces_3:WaitForChild("Components")
local Universal = Components_3:WaitForChild("Universal")
local Pagination = require(Universal:WaitForChild("Pagination"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_7:WaitForChild("Client")
local Interfaces_4 = Client_4:WaitForChild("Interfaces")
local Hooks = Interfaces_4:WaitForChild("Hooks")
local useAlertPopup = require(Hooks:WaitForChild("useAlertPopup"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Client_5 = ReplicatedStorage_8:WaitForChild("Client")
local Interfaces_5 = Client_5:WaitForChild("Interfaces")
local Hooks_2 = Interfaces_5:WaitForChild("Hooks")
local useOrder = require(Hooks_2:WaitForChild("useOrder"))
local u201 = {}
u201["Bloodline Member"] = "member"
u201["Bloodline Heir"] = "heir"
u201["Bloodline Head"] = "head"
local u205 = nil
return function(p1) -- Line: 52 -- upvalues: useOrder (val), react (val), useAlertPopup (val), u205 (ref), Bloodline (val), Frame (val), VerticalListLayout (val), Pagination (val), Players (val), u201 (val)
    local member, member_2
    member, member_2 = react.useState("member")
    local u10 = useAlertPopup(function(p1) -- Line: 56 -- upvalues: u205 (upval), Bloodline (upval)
        if not p1 or not u205 then
            return
        end
        Bloodline.Action.post({action = 2, user = u205})
    end)
    local createElement = react.createElement
    local v1 = {Visible = p1.Enabled}
    local v2 = {Layout = react.createElement(VerticalListLayout, {Spacing = 10, VerticalAlignment = Enum.VerticalAlignment.Top})}
    local createElement_2 = react.createElement
    local Pagination_2 = Pagination.Pagination
    local v3 = {
        Header = "Bloodline Members",
        Width = "None",
        Maximum = 20,
        Loading = false,
        Filters = {"Bloodline Member", "Bloodline Heir", "Bloodline Head"},
        Results = p1.Bloodline.pagination,
    }
    local v4 = {LayoutOrder = useOrder()()}
    v3.Native = v4
    v3.Pages = p1.Bloodline.pages
    if p1.Bloodline.head ~= Players.LocalPlayer.UserId then
        v4 = nil
    else
        v4 = {
            Labels = {
                {label = "Assign Bloodline Heir"},
                {label = "Assign Bloodline Head"},
                {label = "Disown Member"},
            },
            Callback = function(p1, p2) -- Line: 93 -- upvalues: Players (upval), u205 (upval), u10 (val), Bloodline (upval)
                if p2 == Players.LocalPlayer.UserId then
                    return
                end
                u205 = p2
                if p1 == 2 then
                    u10("Assign Bloodline Head", "Are you sure you want to assign this user as the bloodline head?", Color3.fromRGB(255, 0, 0))
                    return
                end
                Bloodline.Action.post({user = p2, action = p1})
            end,
        }
        if not v4 then
            v4 = nil
        end
    end
    v3.Contexts = v4
    function v3.Paged(p1) -- Line: 112 -- upvalues: Bloodline (upval), member (val)
        Bloodline.Paginate.post({page = p1, filter = member})
    end
    function v3.Filtered(p1) -- Line: 116 -- upvalues: u201 (upval), member_2 (val), Bloodline (upval)
        local v1 = u201[p1]
        member_2(v1)
        Bloodline.Paginate.post({page = 1, filter = v1})
    end
    v2.Members = createElement_2(Pagination_2, v3)
    return createElement(Frame, v1, v2)
end