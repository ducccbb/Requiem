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
--          File: ReplicatedStorage.Client.Interfaces.Routes.Screen.Leaderboard
--                               Dumped in 0.00204 seconds
--                          Bytecode version 9  |  23 functions

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
local Alive = require(Common:WaitForChild("Alive"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Types = Common_2:WaitForChild("Types")
local Branches = require(Types:WaitForChild("Branches"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Network = Common_3:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Friends = require(Namespaces:WaitForChild("Friends"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_4:WaitForChild("Common")
local Network_2 = Common_4:WaitForChild("Network")
local Namespaces_2 = Network_2:WaitForChild("Namespaces")
local Server = require(Namespaces_2:WaitForChild("Server"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_5:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_6:WaitForChild("Common")
local Utilities = Common_5:WaitForChild("Utilities")
local String = require(Utilities:WaitForChild("String"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_7:WaitForChild("Common")
local Utilities_2 = Common_6:WaitForChild("Utilities")
local Table = require(Utilities_2:WaitForChild("Table"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Common_7 = ReplicatedStorage_8:WaitForChild("Common")
local Network_3 = Common_7:WaitForChild("Network")
local Namespaces_3 = Network_3:WaitForChild("Namespaces")
local Vitality = require(Namespaces_3:WaitForChild("Vitality"))
local Components = v1.Parent.Parent.Parent:WaitForChild("Components")
local Screen = Components:WaitForChild("Screen")
local Leaderboard = Screen:WaitForChild("Leaderboard")
local Team = require(Leaderboard:WaitForChild("Team"))
local Components_2 = v1.Parent.Parent.Parent:WaitForChild("Components")
local Screen_2 = Components_2:WaitForChild("Screen")
local Leaderboard_2 = Screen_2:WaitForChild("Leaderboard")
local Display = require(Leaderboard_2:WaitForChild("Display"))
local Components_3 = v1.Parent.Parent.Parent:WaitForChild("Components")
local Screen_3 = Components_3:WaitForChild("Screen")
local Leaderboard_3 = Screen_3:WaitForChild("Leaderboard")
local Holder = require(Leaderboard_3:WaitForChild("Holder"))
local Components_4 = v1.Parent.Parent.Parent:WaitForChild("Components")
local Screen_4 = Components_4:WaitForChild("Screen")
local Leaderboard_4 = Screen_4:WaitForChild("Leaderboard")
local List = require(Leaderboard_4:WaitForChild("List"))
local Components_5 = v1.Parent.Parent.Parent:WaitForChild("Components")
local Screen_5 = Components_5:WaitForChild("Screen")
local Leaderboard_5 = Screen_5:WaitForChild("Leaderboard")
local Player = require(Leaderboard_5:WaitForChild("Player"))
local Hooks = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useStore = require(Hooks:WaitForChild("useStore"))
local u291 = {}
u291[Branches.Branches.SCOUTING_LEGION] = 1
u291[Branches.Branches.STATIONARY_GUARD] = 2
u291[Branches.Branches.MILITARY_POLICE] = 3
u291[Branches.Branches.TRAINEE_CORPS] = 4
u291[Branches.Branches.CIVILIAN] = 5
u291[Branches.Branches.GOVERNMENT] = 6
u291[Branches.Branches.IRON_MARCH_UNION] = 7
local u313 = {
    Branches.Branches.SCOUTING_LEGION,
    Branches.Branches.STATIONARY_GUARD,
    Branches.Branches.MILITARY_POLICE,
    Branches.Branches.TRAINEE_CORPS,
    Branches.Branches.GOVERNMENT,
    Branches.Branches.CIVILIAN,
}
local u326 = {Branches.Branches.IRON_MARCH_UNION}
return function() -- Line: 72 -- upvalues: react (val), Branches (val), useStore (val), Server (val), Vitality (val), Friends (val), Players (val), Alive (val), u326 (val), u313 (val), u291 (val), Team (val), Table (val), Player (val), String (val), Holder (val), Display (val), List (val)
    local health, maxHealth, u12, u3, u4, v1, v2, v3
    local v4 = {}
    u3, u4 = react.useState(v4)
    v2, u12 = react.useState(Branches.Labels[0])
    local v5 = useStore(Server.Store, function(p1) -- Line: 78
        return p1
    end)
    local v6 = useStore(Vitality.Store, function(p1) -- Line: 82
        return p1
    end)
    local u27 = useStore(Friends.Store, function(p1) -- Line: 87
        return p1
    end)
    local function createPlayerData(p1) -- Line: 92
        return {
            id = p1.UserId,
            name = p1.Name,
            branch = p1:GetAttribute("Branch") or 0,
            rank = p1:GetAttribute("Rank") or 0,
            character = p1:GetAttribute("Character"),
            loreName = p1:GetAttribute("Name"),
            display = p1:GetAttribute("DisplayName"),
        }
    end
    local v7 = {u3, u27}
    local u35 = react.useMemo(function() -- Line: 105 -- upvalues: u3 (val), u27 (val), Players (upval)
        local branch, display, v1, v2
        local v3 = {}
        for k, v in pairs(u3) do
            branch = v.branch
            v1 = false
            for k2, i in pairs(u27) do
                if i.character == v.character then
                    v1 = true
                    break
                end
            end
            if k == Players.LocalPlayer.UserId then
                v1 = true
            end
            v2 = {
                id = k,
                name = v.name,
                branch = branch,
                rank = v.rank,
                friended = v1,
            }
            if not v1 then
                display = "???"
            else
                display = v.display
                if not display then
                    display = v.loreName
                    if not display then
                        display = v.name
                    end
                end
            end
            v2.display = display
            if not (v3[branch]) then
                v3[branch] = {}
            end
            table.insert(v3[branch], v2)
        end
        for k3, j in pairs(v3) do
            table.sort(j, function(p1, p2) -- Line: 144
                local v1
                if p1.rank ~= p2.rank then
                    v1 = p2.rank < p1.rank
                    return v1
                end
                v1 = p1.name < p2.name
                return v1
            end)
        end
        return v3
    end, v7)
    react.useEffect(function() -- Line: 156 -- upvalues: u4 (val), createPlayerData (val), Alive (upval)
        local v1, v2
        local u0 = {}
        local function updatePlayerData(p1) -- Line: 160 -- upvalues: u4 (upval), createPlayerData (upval)
            u4(function(a1) -- Line: 161 -- upvalues: p1 (val), createPlayerData (upval)
                local v1 = table.clone(a1)
                v1[p1.UserId] = createPlayerData(p1)
                return v1
            end)
        end
        local function setupPlayerListeners(p1) -- Line: 169 -- upvalues: updatePlayerData (val), u0 (val)
            updatePlayerData(p1)
            local AttributeChangedSignal = p1:GetAttributeChangedSignal("Branch")
            local v1 = AttributeChangedSignal:Connect(function() -- Line: 174 -- upvalues: updatePlayerData (upval), p1 (val)
                updatePlayerData(p1)
            end)
            local AttributeChangedSignal_2 = p1:GetAttributeChangedSignal("Rank")
            local v2 = AttributeChangedSignal_2:Connect(function() -- Line: 178 -- upvalues: updatePlayerData (upval), p1 (val)
                updatePlayerData(p1)
            end)
            local AttributeChangedSignal_3 = p1:GetAttributeChangedSignal("Name")
            local v3 = AttributeChangedSignal_3:Connect(function() -- Line: 182 -- upvalues: updatePlayerData (upval), p1 (val)
                updatePlayerData(p1)
            end)
            local AttributeChangedSignal_4 = p1:GetAttributeChangedSignal("Character")
            local v4 = AttributeChangedSignal_4:Connect(function() -- Line: 186 -- upvalues: updatePlayerData (upval), p1 (val)
                updatePlayerData(p1)
            end)
            local AttributeChangedSignal_5 = p1:GetAttributeChangedSignal("DisplayName")
            local v5 = AttributeChangedSignal_5:Connect(function() -- Line: 190 -- upvalues: updatePlayerData (upval), p1 (val)
                updatePlayerData(p1)
            end)
            table.insert(u0, v1)
            table.insert(u0, v2)
            table.insert(u0, v3)
            table.insert(u0, v4)
            table.insert(u0, v5)
        end
        for k, v in pairs(Alive.getPlayers()) do
            setupPlayerListeners(v)
        end
        v1 = Alive.PlayerAdded:Connect(function(p1) -- Line: 207 -- upvalues: setupPlayerListeners (val)
            setupPlayerListeners(p1)
        end)
        v2 = Alive.PlayerRemoving:Connect(function(p1) -- Line: 212 -- upvalues: u4 (upval)
            u4(function(a1) -- Line: 213 -- upvalues: p1 (val)
                local v1 = table.clone(a1)
                v1[p1.UserId] = nil
                return v1
            end)
        end)
        table.insert(u0, v1)
        table.insert(u0, v2)
        return function() -- Line: 223 -- upvalues: u0 (val)
            for k, v in pairs(u0) do
                v:Disconnect()
            end
        end
    end, {})
    react.useEffect(function() -- Line: 231 -- upvalues: Alive (upval), u12 (val), Branches (upval)
        local v1 = Alive.LocalPlayer:GetAttribute("Branch") or 0
        u12(Branches.Labels[v1])
    end)
    v3 = react.useMemo(function() -- Line: 239 -- upvalues: Alive (upval), Branches (upval), u326 (upval), u313 (upval), u35 (val), u291 (upval), react (upval), Team (upval), Table (upval), Player (upval), String (upval)
        local branch, rank, v1, v2, v3, v4, v5, v6, v7, v8
        local v9 = {}
        if Alive.LocalPlayer:GetAttribute("Branch") or 0 == Branches.Branches.IRON_MARCH_UNION then
            v3 = true
        else
            v3 = false
        end
        if not v3 then
            v7 = u313
        else
            v7 = u326
        end
        for i, v in ipairs(v7) do
            v8 = u35[v]
            v1 = v8
            if v1 then
                v1 = 0 < #v8
            end
            if v1 then
                v2 = u291[v] * 10000
                table.insert(v9, react.createElement(Team, {Visible = true, Branch = v, LayoutOrder = v2, key = "branch_" .. v}))
                if v8 then
                    for i2, i3 in ipairs(v8) do
                        branch = i3.branch
                        rank = i3.rank
                        if 0 >= branch then
                            v4 = {}
                        else
                            v4 = Table.inverse(Branches.BranchRanks[branch])
                        end
                        v5 = {Username = i3.name or "", Display = i3.display or "", Branch = branch}
                        if branch ~= 0 then
                            v6 = tostring(String.capitalizeAllFirstLetters(v4[rank] or "Civilian"))
                        else
                            v6 = "Civilian"
                        end
                        v5.Rank = v6
                        v5.LayoutOrder = v2 + i2
                        v5.Friends = i3.friended
                        v5.key = "player_" .. i3.id
                        table.insert(v9, react.createElement(Player, v5))
                    end
                end
            elseif not v3 then
            end
        end
        return v9
    end, {u35})
    local createElement = react.createElement
    v1 = {}
    local v8 = v5.event == 0
    v1.Visible = v8
    v8 = {}
    local createElement_2 = react.createElement
    local v9 = {Username = Alive.LocalPlayer.Name, Icon = v2}
    if not v6 then
        health = 100
    else
        health = v6.health
    end
    v9.Health = health
    if not v6 then
        maxHealth = 100
    else
        maxHealth = v6.maxHealth
        if not maxHealth then
            maxHealth = 100
        end
    end
    v9.MaxHealth = maxHealth
    v8.Display = createElement_2(Display, v9)
    v8.List = react.createElement(List, {}, v3)
    return createElement(Holder, v1, v8)
end