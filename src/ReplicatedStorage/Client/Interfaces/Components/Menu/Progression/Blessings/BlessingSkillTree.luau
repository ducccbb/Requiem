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
--File: ReplicatedStorage.Client.Interfaces.Components.Menu.Progression.Blessings.BlessingSkillTree
--                               Dumped in 0.00168 seconds
--                          Bytecode version 9  |  12 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local BlessingSkillLine = require(v1.Parent:WaitForChild("BlessingSkillLine"))
local BlessingSkillNode = require(v1.Parent:WaitForChild("BlessingSkillNode"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_2:WaitForChild("Client")
local Interfaces = Client:WaitForChild("Interfaces")
local Hooks = Interfaces:WaitForChild("Hooks")
local useEventListener = require(Hooks:WaitForChild("useEventListener"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_3:WaitForChild("Common")
local Progression = Common:WaitForChild("Progression")
local Blessings = Progression:WaitForChild("Blessings")
local Tree = require(Blessings:WaitForChild("Tree"))
return function(p1) -- Line: 36 -- upvalues: react (val), useEventListener (val), UserInputService (val), RunService (val), Tree (val), BlessingSkillNode (val), BlessingSkillLine (val)
    local createNodeFromParentNode, u10, u11, u16, u17, u5, u6, v1, v2
    u5, u6 = react.useBinding(Vector2.new())
    u10, u11 = react.useState(false)
    u16, u17 = react.useBinding(Vector2.new())
    local v3 = react.useCallback(function(a1) -- Line: 43 -- upvalues: p1 (val), u11 (val)
        if not p1.Enabled then
            return
        end
        if a1.UserInputType == Enum.UserInputType.MouseButton3 then
            u11(true)
        end
    end, {p1.Enabled})
    local v4 = {p1.Enabled}
    local v5 = react.useCallback(function(a1) -- Line: 53 -- upvalues: p1 (val), u11 (val)
        if not p1.Enabled then
            return
        end
        if a1.UserInputType == Enum.UserInputType.MouseButton3 then
            u11(false)
        end
    end, v4)
    local v6 = {p1.Enabled, u10}
    local v7 = react.useCallback(function(a1) -- Line: 63 -- upvalues: p1 (val), u6 (val)
        if not p1.Enabled then
            return
        end
        if a1.UserInputType == Enum.UserInputType.MouseMovement then
            u6(Vector2.new(a1.Position.X, a1.Position.Y))
        end
    end, v6)
    useEventListener(UserInputService.InputBegan, v3)
    useEventListener(UserInputService.InputEnded, v5)
    useEventListener(UserInputService.InputChanged, v7)
    local v8 = {u10, p1.Enabled}
    react.useEffect(function() -- Line: 78 -- upvalues: u10 (val), p1 (val), u5 (val), RunService (upval), u17 (val), u16 (val)
        if not u10 or not p1.Enabled then
            return
        end
        local u6 = u5:getValue()
        local u12 = RunService.RenderStepped:Connect(function() -- Line: 83 -- upvalues: u5 (upval), u6 (ref), u17 (upval), u16 (upval)
            local v1 = u5:getValue()
            local v2 = v1 - u6
            u6 = v1
            u17(u16:getValue() + v2)
        end)
        return function() -- Line: 92 -- upvalues: u12 (val)
            u12:Disconnect()
        end
    end, v8)
    local u64 = Tree.Tree[Tree.Categories.Maria]
    local u65 = u64[1]
    local u69 = Vector2.new(0.5, 0.5)
    local function getNodeNameFromId(p1) -- Line: 104 -- upvalues: u64 (val)
        for k, v in pairs(u64) do
            if v.id == p1 then
                return v
            end
        end
        return nil
    end
    function createNodeFromParentNode(a1, p2, p3, p4) -- Line: 114 -- upvalues: react (upval), BlessingSkillNode (upval), p1 (val), getNodeNameFromId (val), BlessingSkillLine (upval), createNodeFromParentNode (val)
        local Magnitude, Unit, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16
        local unlocks = p3.unlocks
        if not unlocks then
            v16 = 0
        else
            v16 = #unlocks
        end
        local v17 = Vector2.new(0.5, 0.5)
        local v18 = UDim2.fromScale(p3.position.X, p3.position.Y)
        local v19 = {
            Speed = 0.3,
            Position = v18,
            DistanceFromCenter = p4,
            Enabled = p1.Enabled,
            Name = p3.id,
            Description = p3.description,
        }
        a1[p3.id] = react.createElement(BlessingSkillNode, v19)
        if not unlocks then
            return a1, p2
        end
        local v20 = v17 - p3.position
        if v20.Magnitude ~= 0 then
            Unit = v20.Unit
        else
            Unit = Vector2.new(1, 0)
        end
        Magnitude = (v17 - p3.position).Magnitude
        local v21 = math.atan2(Unit.Y, Unit.X)
        if Magnitude ~= 0 then
            v3 = 45
        else
            v3 = 360
        end
        v19 = math.rad(v3)
        v3 = v16
        local v22 = 1
        v9, v15, v2, v1 = p3, p4, p2, a1
        for i = 1, v3, v22 do
            v4 = unlocks[i]
            v5 = getNodeNameFromId(v4)
            if v5 then
                if Magnitude ~= 0 then
                    v7 = if v16 == 1 then 1.05 else v16
                    v6 = v21 + ((i - 1) * (v19 / (v7 - 1)) - v19 / 2)
                else
                    v6 = (i - 1) * (2 * math.pi / v16)
                end
                v7 = i % 2 == 1
                if not v7 then
                    v8 = 0.3
                else
                    v8 = 0.2
                end
                v11 = v9.position.X + v8 * math.cos(v6)
                v10 = Vector2.new(v11, v9.position.Y + v8 * math.sin(v6))
                v12 = v9.position.X - v8 * math.cos(v6)
                v11 = Vector2.new(v12, v9.position.Y - v8 * math.sin(v6))
                if (v11 - v17).Magnitude >= (v10 - v17).Magnitude then
                    v13 = v11
                else
                    v13 = v10
                end
                v5.position = v13
                if v16 % 2 == 1 and i == math.ceil(v16 / 2) and 1 < v16 then end
                v14 = (v13 - v17).Unit * 0.0275
                v2[v9.id .. v4] = react.createElement(BlessingSkillLine, {
                    Thickness = 2,
                    Straight = true,
                    Speed = 0.3,
                    Origin = v18 + UDim2.fromScale(v14.X, v14.Y),
                    Destination = UDim2.fromScale(v13.X, v13.Y),
                    DistanceFromCenter = v15,
                    Enabled = p1.Enabled,
                })
                createNodeFromParentNode(v1, v2, v5, v15 + 1)
            else
                warn("Could not find node with id", v4)
            end
        end
        return v1, v2
    end
    u65.position = u69
    v1, v2 = react.useMemo(function() -- Line: 235 -- upvalues: createNodeFromParentNode (val), u65 (val)
        return createNodeFromParentNode({}, {}, u65, 1)
    end, {p1.Enabled})
    return react.createElement("Frame", {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 1),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = u16:map(function(p1) -- Line: 242 -- upvalues: u69 (val)
            local v1 = UDim2.fromScale(u69.X, u69.Y)
            return v1 + UDim2.fromOffset(p1.X, p1.Y)
        end),
        Visible = p1.Enabled,
    }, {Ratio = react.createElement("UIAspectRatioConstraint", {AspectRatio = 1})}, v1, v2)
end