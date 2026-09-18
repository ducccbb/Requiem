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
--File: ReplicatedStorage.Client.Interfaces.Components.Menu.Progression.Blessings.BlessingSkillNode
--                               Dumped in 0.00104 seconds
--                          Bytecode version 9  |  8 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Promise = require(Common:WaitForChild("Promise"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_2:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_3:WaitForChild("Client")
local Interfaces = Client:WaitForChild("Interfaces")
local Hooks = Interfaces:WaitForChild("Hooks")
local useAsyncEffect = require(Hooks:WaitForChild("useAsyncEffect"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_4:WaitForChild("Client")
local Interfaces_2 = Client_2:WaitForChild("Interfaces")
local Hooks_2 = Interfaces_2:WaitForChild("Hooks")
local useMotion = require(Hooks_2:WaitForChild("useMotion"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_5:WaitForChild("Client")
local Interfaces_3 = Client_3:WaitForChild("Interfaces")
local Hooks_3 = Interfaces_3:WaitForChild("Hooks")
local useRem = require(Hooks_3:WaitForChild("useRem"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_6:WaitForChild("Client")
local Interfaces_4 = Client_4:WaitForChild("Interfaces")
local Hooks_4 = Interfaces_4:WaitForChild("Hooks")
local useTheme = require(Hooks_4:WaitForChild("useTheme"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Client_5 = ReplicatedStorage_7:WaitForChild("Client")
local Interfaces_5 = Client_5:WaitForChild("Interfaces")
local Hooks_5 = Interfaces_5:WaitForChild("Hooks")
local useTooltip = require(Hooks_5:WaitForChild("useTooltip"))
local Utilities = v1.Parent.Parent.Parent.Parent:WaitForChild("Utilities")
local Color = require(Utilities:WaitForChild("Color"))
local Primitives = v1.Parent.Parent.Parent.Parent:WaitForChild("Primitives")
local Frame = require(Primitives:WaitForChild("Frame"))
return function(p1) -- Line: 42 -- upvalues: useMotion (val), useTooltip (val), useTheme (val), useRem (val), useAsyncEffect (val), Promise (val), react (val), Frame (val), Color (val)
    local u10, u11, u4, u8, v1, v2
    v1, u4 = useMotion(0)
    v2, u8 = useMotion(1)
    u10, u11 = useTooltip()
    local v3 = useTheme()
    local u15 = useRem()
    useAsyncEffect(function() -- Line: 50 -- upvalues: p1 (val), u4 (val), u8 (val), Promise (upval)
        if p1.Enabled then
            return Promise.delay(p1.DistanceFromCenter * p1.Speed):andThen(function() -- Line: 58 -- upvalues: u4 (upval), u8 (upval)
                u4:spring(60)
                u8:spring(0)
            end)
        end
        u4:immediate(0)
        u8:immediate(1)
        return Promise.resolve()
    end, {p1.Enabled})
    react.useMemo(function() -- Line: 64
        local v1 = math.random(-3, 3) / 10
        return UDim2.new(0, 0, v1, 0)
    end, {})
    local v4 = {Position = p1.Position, Size = v1:map(function(p1) -- Line: 70 -- upvalues: u15 (val)
        local v1 = u15(p1)
        return UDim2.fromOffset(v1, u15(p1))
    end)}
    local v5 = {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(1, 0)})}
    local v6 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = -1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
    }
    local v7 = UDim2.fromScale(1, 1)
    local v8 = u15(15)
    v6.Size = v7 + UDim2.fromOffset(v8, u15(15))
    v5.Outline = react.createElement("Frame", v6, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(1, 0)}), Stroke = react.createElement("UIStroke", {Color = Color.Darken(v3.Bar, 0.9), Transparency = v2})})
    v6 = {
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = v3.PageBackground,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
        ZIndex = 2,
        BackgroundTransparency = v2,
    }
    v6[react.Event.MouseEnter] = function(...) -- Line: 107 -- upvalues: u10 (val), p1 (val)
        u10(p1.Name or "Skill", p1.Description or "Unknown description...", ...)
    end
    v6[react.Event.MouseLeave] = function() -- Line: 111 -- upvalues: u11 (val)
        u11()
    end
    v5.Content = react.createElement("Frame", v6, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(1, 0)}), Stroke = react.createElement("UIStroke", {Thickness = 2, Color = Color.Darken(v3.Primary, 0.3), Transparency = v2})})
    return react.createElement(Frame, v4, v5)
end