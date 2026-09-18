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
--             File: ReplicatedStorage.Client.Interfaces.Routes.Screen.Buffs
--                               Dumped in 0.00155 seconds
--                          Bytecode version 9  |  19 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Promise = require(Common:WaitForChild("Promise"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_2:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Signals = require(Common_2:WaitForChild("Signals"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Network = Common_3:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Vitality = require(Namespaces:WaitForChild("Vitality"))
local Hooks = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useAsyncEffect = require(Hooks:WaitForChild("useAsyncEffect"))
local Hooks_2 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useMotion = require(Hooks_2:WaitForChild("useMotion"))
local Hooks_3 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useRem = require(Hooks_3:WaitForChild("useRem"))
local function Buff(p1) -- Line: 43 -- upvalues: useRem (val), useMotion (val), react (val), RunService (val), useAsyncEffect (val), Promise (val)
    local u13, u24, u29, v1
    local u2 = useRem()
    local v2 = u2(294)
    v1, u13 = useMotion(UDim2.fromOffset(v2, u2(0)))
    local v3 = u2(-588)
    v2, u24 = useMotion(UDim2.fromOffset(v3, u2(0)))
    v3, u29 = react.useBinding(p1.length)
    react.useEffect(function() -- Line: 56 -- upvalues: u13 (val), u2 (val), u24 (val)
        local v1 = u2(294)
        u13:spring(UDim2.fromOffset(v1, u2(31)))
        v1 = u2(0)
        u24:spring(UDim2.fromOffset(v1, u2(0)))
    end, {})
    react.useEffect(function() -- Line: 62 -- upvalues: RunService (upval), p1 (val), u29 (val)
        local u5 = RunService.Heartbeat:Connect(function() -- Line: 63 -- upvalues: p1 (upval), u29 (upval)
            local v1 = p1.expiresAt - os.clock()
            u29((math.max(0, v1)))
        end)
        return function() -- Line: 68 -- upvalues: u5 (val)
            u5:Disconnect()
        end
    end, {p1.expiresAt})
    useAsyncEffect(function() -- Line: 74 -- upvalues: Promise (upval), p1 (val), u24 (val), u2 (val), u13 (val)
        local v1 = Promise.delay(p1.length):andThen(function() -- Line: 76 -- upvalues: u24 (upval), u2 (upval), u13 (upval), Promise (upval)
            local v1 = u2(-588)
            u24:spring(UDim2.fromOffset(v1, u2(0)))
            v1 = u2(294)
            u13:spring(UDim2.fromOffset(v1, u2(0)))
            return Promise.delay(0.3)
        end)
        return v1:andThen(function() -- Line: 84 -- upvalues: p1 (upval)
            p1.onRemove(p1.id)
        end)
    end, {p1.expiresAt})
    local v4 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0, 0.963),
    }
    local v5 = u2(294)
    v4.Size = UDim2.fromOffset(v5, u2(31))
    local v6 = {}
    local v7 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ClipsDescendants = true,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        AnchorPoint = Vector2.new(0, 0.5),
        Position = UDim2.fromScale(0, 0.5),
        Size = v1,
    }
    local v8 = {Extend = react.createElement("Frame", {
        BorderSizePixel = 0,
        ZIndex = 2,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0, -0.00407),
        Size = UDim2.new(0, 3, 1, 0),
    })}
    local v9 = {
        BorderSizePixel = 0,
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Size = UDim2.fromScale(1, 1),
        Position = v2,
    }
    local v10 = {}
    local v11 = {}
    local v12 = {}
    local v13 = NumberSequenceKeypoint.new(0, 0.107)
    v12[1] = v13
    v12[2] = NumberSequenceKeypoint.new(1, 1)
    v11.Transparency = NumberSequence.new(v12)
    v10.Gradient = react.createElement("UIGradient", v11)
    v10.Label = react.createElement("TextLabel", {
        RichText = true,
        TextScaled = false,
        TextWrapped = true,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        FontFace = Font.new("rbxasset://fonts/families/AccanthisADFStd.json"),
        Text = v3:map(function(a1) -- Line: 133 -- upvalues: p1 (val)
            return string.format("%s <font transparency=\"0.5\">%.2f</font>", p1.id, a1)
        end),
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = u2(15),
        TextXAlignment = Enum.TextXAlignment.Left,
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.new(0.0168, 6, 0.5, 0),
        Size = UDim2.fromScale(0.67, 0.592),
    })
    v8.Content = react.createElement("Frame", v9, v10)
    v6.InnerWrapper = react.createElement("Frame", v7, v8)
    return react.createElement("Frame", v4, v6)
end
return function() -- Line: 155 -- upvalues: react (val), Vitality (val), Signals (val), Buff (val)
    local u4, v1
    local v2 = {}
    v1, u4 = react.useState(v2)
    local u9 = react.useCallback(function(p1, p2) -- Line: 159 -- upvalues: u4 (val)
        u4(function(a1) -- Line: 160 -- upvalues: p1 (val), p2 (val)
            local v1 = table.clone(a1)
            v1[p1] = {
                data = {id = p1, length = p2},
                expiresAt = os.clock() + p2,
            }
            return v1
        end)
    end, {})
    local v3 = react.useCallback(function(p1) -- Line: 171 -- upvalues: u4 (val)
        u4(function(a1) -- Line: 172 -- upvalues: p1 (val)
            local v1 = table.clone(a1)
            v1[p1] = nil
            return v1
        end)
    end, {})
    react.useEffect(function() -- Line: 180 -- upvalues: Vitality (upval), u9 (val), Signals (upval)
        local u4 = Vitality.Buff.listen(function(p1) -- Line: 182 -- upvalues: u9 (upval)
            u9(p1.id, p1.length)
        end)
        local u10 = Signals.Buff:Connect(function(p1) -- Line: 187 -- upvalues: u9 (upval)
            u9(p1.id, p1.length)
        end)
        return function() -- Line: 192 -- upvalues: u4 (val), u10 (val)
            u4()
            u10:Disconnect()
        end
    end, {u9})
    local v4 = {}
    local v5 = v1
    local v6 = nil
    local v7 = nil
    for i, j in v5, v6, v7 do
        v4[i] = react.createElement(Buff, {id = j.data.id, length = j.data.length, expiresAt = j.expiresAt, onRemove = v3})
    end
    return react.createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0, 1),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.new(0, 10, 1, -10),
        Size = UDim2.fromOffset(294, 842),
    }, {List = react.createElement("UIListLayout", {Padding = UDim.new(0, 5), SortOrder = Enum.SortOrder.LayoutOrder, VerticalAlignment = Enum.VerticalAlignment.Bottom})}, v4)
end