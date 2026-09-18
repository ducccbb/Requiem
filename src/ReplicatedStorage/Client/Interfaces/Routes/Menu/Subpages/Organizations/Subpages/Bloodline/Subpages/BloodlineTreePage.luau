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
--File: ReplicatedStorage.Client.Interfaces.Routes.Menu.Subpages.Organizations.Subpages.Bloodline.Subpages.BloodlineTreePage
--                               Dumped in 0.00193 seconds
--                          Bytecode version 9  |  16 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Types = Common:WaitForChild("Types")
require(Types:WaitForChild("Bloodline"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_3:WaitForChild("Client")
local Interfaces = Client:WaitForChild("Interfaces")
local Components = Interfaces:WaitForChild("Components")
local Menu = Components:WaitForChild("Menu")
local Progression = Menu:WaitForChild("Progression")
local Blessings = Progression:WaitForChild("Blessings")
local BlessingSkillLine = require(Blessings:WaitForChild("BlessingSkillLine"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_4:WaitForChild("Client")
local Interfaces_2 = Client_2:WaitForChild("Interfaces")
local Components_2 = Interfaces_2:WaitForChild("Components")
local Menu_2 = Components_2:WaitForChild("Menu")
local Bloodline_2 = Menu_2:WaitForChild("Bloodline")
local BloodlineFamilyMemberNode = require(Bloodline_2:WaitForChild("BloodlineFamilyMemberNode"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_5:WaitForChild("Client")
local Interfaces_3 = Client_3:WaitForChild("Interfaces")
local Hooks = Interfaces_3:WaitForChild("Hooks")
local useEventListener = require(Hooks:WaitForChild("useEventListener"))
return function(p1) -- Line: 53 -- upvalues: react (val), useEventListener (val), UserInputService (val), RunService (val), BloodlineFamilyMemberNode (val), BlessingSkillLine (val)
    local createNodeFromParentNode, u12, u13, u18, u19, u7, u8
    local u1 = {}
    local u2 = {}
    u7, u8 = react.useBinding(Vector2.new())
    u12, u13 = react.useState(false)
    u18, u19 = react.useBinding(Vector2.new())
    local v1 = react.useCallback(function(a1) -- Line: 61 -- upvalues: p1 (val), u13 (val)
        if not p1.Enabled then
            return
        end
        if a1.UserInputType == Enum.UserInputType.MouseButton3 then
            u13(true)
        end
    end, {p1.Enabled})
    local v2 = {p1.Enabled}
    local v3 = react.useCallback(function(a1) -- Line: 71 -- upvalues: p1 (val), u13 (val)
        if not p1.Enabled then
            return
        end
        if a1.UserInputType == Enum.UserInputType.MouseButton3 then
            u13(false)
        end
    end, v2)
    local v4 = {p1.Enabled, u12}
    local v5 = react.useCallback(function(a1) -- Line: 81 -- upvalues: p1 (val), u8 (val)
        if not p1.Enabled then
            return
        end
        if a1.UserInputType == Enum.UserInputType.MouseMovement then
            u8(Vector2.new(a1.Position.X, a1.Position.Y))
        end
    end, v4)
    useEventListener(UserInputService.InputBegan, v1)
    useEventListener(UserInputService.InputEnded, v3)
    useEventListener(UserInputService.InputChanged, v5)
    local v6 = {u12, p1.Enabled}
    react.useEffect(function() -- Line: 95 -- upvalues: u12 (val), p1 (val), u7 (val), RunService (upval), u19 (val), u18 (val)
        local u12
        if not u12 or not p1.Enabled then
            return
        end
        local u6 = u7:getValue()
        u12 = RunService.RenderStepped:Connect(function() -- Line: 100 -- upvalues: u7 (upval), u6 (ref), u19 (upval), u18 (upval)
            local v1 = u7:getValue()
            local v2 = v1 - u6
            u6 = v1
            u19(u18:getValue() + v2)
        end)
        return function() -- Line: 109 -- upvalues: u12 (val)
            u12:Disconnect()
        end
    end, v6)
    local function mapBloodlineTreeToTreeType(p1) -- Line: 114
        local v1, v2, v3
        local v4 = {}
        local function generateNodeId(p1) -- Line: 119
            return "Node_" .. tostring(p1)
        end
        local function findChildren(a1) -- Line: 124 -- upvalues: p1 (val)
            local v1
            local v2 = {}
            for i, v in ipairs(p1) do
                if v.parent == a1 then
                    v1 = tostring(v.user)
                    table.insert(v2, v1 .. "_" .. tostring(v.parent_id))
                end
            end
            return v2
        end
        for i, v in ipairs(p1) do
            v3 = {id = generateNodeId((tostring(v.user)))}
            v1 = {}
            v3.unlocks = v1
            v3.user = v.user
            v3.status = v.status
            v1 = i == 1
            v3.primary = v1
            v2 = tostring(v.user)
            v3.key = generateNodeId(v2 .. "_" .. tostring(v.parent_id))
            v1 = findChildren(v.user)
            if 0 < #v1 then
                for i2, i3 in ipairs(v1) do
                    v3.unlocks[i2] = generateNodeId((tostring(i3)))
                end
            end
            table.insert(v4, v3)
        end
        return v4
    end
    local v7 = {p1.Bloodline.tree}
    local u68 = react.useMemo(function() -- Line: 161 -- upvalues: mapBloodlineTreeToTreeType (val), p1 (val)
        local tree = p1.Bloodline.tree
        if not tree then
            tree = {}
        end
        return mapBloodlineTreeToTreeType(tree)
    end, v7)
    local u69 = u68[1]
    local u73 = Vector2.new(0.5, 0.5)
    local function getNodeNameFromKey(p1) -- Line: 170 -- upvalues: u68 (val)
        for k, v in pairs(u68) do
            if v.key == p1 then
                return v
            end
        end
        return nil
    end
    local u75 = {}
    function createNodeFromParentNode(a1, p2) -- Line: 182 -- upvalues: u75 (val), u1 (val), react (upval), BloodlineFamilyMemberNode (upval), p1 (val), getNodeNameFromKey (val), u2 (val), BlessingSkillLine (upval), createNodeFromParentNode (val)
        local Unit, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11
        local unlocks = a1.unlocks
        if not unlocks then
            v11 = 0
        else
            v11 = #unlocks
        end
        local v12 = Vector2.new(0.5, 0.5)
        if u75[a1.key] then
            return
        end
        u75[a1.key] = true
        local v13 = UDim2.fromScale(a1.position.X, a1.position.Y)
        local v14 = {
            Speed = 0.3,
            Position = v13,
            DistanceFromCenter = p2,
            User = a1.user,
            Status = a1.status,
            Primary = a1.primary,
            Enabled = p1.Enabled,
        }
        u1[a1.key] = react.createElement(BloodlineFamilyMemberNode, v14)
        if not unlocks then
            return
        end
        local Magnitude = (v12 - a1.position).Magnitude
        if Magnitude ~= 0 then
            Unit = (a1.position - v12).Unit
        else
            Unit = Vector2.new(1, 0)
        end
        local v15 = math.atan2(Unit.Y, Unit.X)
        local v16 = v11
        v14 = 1
        v1, v2 = a1, p2
        for i = 1, v16, v14 do
            v3 = 0.4 + v11 * 0.09
            v4 = unlocks[i]
            if not (u75[v4]) then
                v5 = getNodeNameFromKey(v4)
                if Magnitude ~= 0 then
                    v7 = math.pi * 0.95
                    v6 = if v11 == 1 then v15 else v15 - v7 / 2 + (i - 1) / (v11 - 1) * v7
                else
                    if v11 % 2 ~= 0 then
                        v7 = 0
                    else
                        v7 = math.pi / v11
                    end
                    v6 = -math.pi / 2 + v7 + (i - 1) * (2 * math.pi / v11)
                end
                v9 = math.cos(v6)
                v7 = v1.position.X + v9 * (v3 * 0.4)
                v10 = math.sin(v6)
                v8 = Vector2.new(v7, v1.position.Y + v10 * (v3 * 0.4))
                v5.position = v8
                if v11 % 2 == 1 and i == math.ceil(v11 / 2) and 1 < v11 then end
                v10 = (v8 - v12).Unit * 0.0275
                u2[v1.key .. v4] = react.createElement(BlessingSkillLine, {
                    Thickness = 2,
                    Straight = true,
                    Speed = 0.3,
                    Origin = v13 + UDim2.fromScale(v10.X, v10.Y),
                    Destination = UDim2.fromScale(v8.X, v8.Y),
                    DistanceFromCenter = v2,
                    Enabled = p1.Enabled,
                })
                createNodeFromParentNode(v5, v2 + 1)
            end
        end
    end
    if u69 then
        u69.position = u73
    end
    react.useMemo(function() -- Line: 298 -- upvalues: u69 (val), createNodeFromParentNode (val)
        if not u69 then
            return
        end
        createNodeFromParentNode(u69, 0)
    end, {
        p1.Enabled,
        u68,
        u73,
        u75,
        u1,
        u2,
        u69,
    })
    return react.createElement("Frame", {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 1),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Visible = p1.Enabled,
    }, {Holder = react.createElement("Frame", {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 1),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = u18:map(function(p1) -- Line: 315 -- upvalues: u73 (val)
            local v1 = UDim2.fromScale(u73.X, u73.Y)
            return v1 + UDim2.fromOffset(p1.X, p1.Y)
        end),
        Visible = p1.Enabled,
    }, {Ratio = react.createElement("UIAspectRatioConstraint", {AspectRatio = 1})}, u1, u2)})
end