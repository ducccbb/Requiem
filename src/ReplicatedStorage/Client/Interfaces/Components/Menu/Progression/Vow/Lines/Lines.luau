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
-- File: ReplicatedStorage.Client.Interfaces.Components.Menu.Progression.Vow.Lines.Lines
--                               Dumped in 0.00104 seconds
--                          Bytecode version 9  |  8 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
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
return function(p1) -- Line: 31 -- upvalues: useMotion (val), useAsyncEffect (val), Promise (val), react (val)
    local IsTopLayer, u8, v1, v2
    if not p1.Enabled then
        v2 = 1
    else
        v2 = 0
    end
    v1, u8 = useMotion(v2)
    useAsyncEffect(function() -- Line: 34 -- upvalues: p1 (val), Promise (upval), u8 (val)
        if not p1.Enabled then
            return Promise.delay(0):andThen(function() -- Line: 36 -- upvalues: u8 (upval)
                u8:immediate(1)
            end)
        end
        return Promise.delay(p1.Position * 0.2):andThen(function() -- Line: 40 -- upvalues: u8 (upval)
            u8:spring(0.5)
        end)
    end, {p1.Enabled})
    useAsyncEffect(function() -- Line: 46 -- upvalues: p1 (val), Promise (upval), u8 (val)
        if p1.Blocked then
            return Promise.delay(0):andThen(function() -- Line: 48 -- upvalues: u8 (upval)
                u8:immediate(1)
            end)
        end
        u8:immediate(1)
        return Promise.delay(p1.Position * 0.2):andThen(function() -- Line: 55 -- upvalues: u8 (upval)
            u8:spring(0.5)
        end)
    end, {p1.Rerenderer})
    local createElement = react.createElement
    local Fragment = react.Fragment
    local v3 = {}
    local createElement_2 = react.createElement
    local v4 = {
        BorderSizePixel = 0,
        Rotation = 60,
        ZIndex = -1,
        AnchorPoint = Vector2.new(1, 0.5),
        BackgroundColor3 = Color3.fromRGB(84, 90, 106),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.3),
        Size = UDim2.fromOffset(243, 3),
    }
    local v5 = not p1.IsTopLayer
    if v5 then
        v5 = p1.Position == 1
    end
    v4.Visible = v5
    if p1.IsTopLayer then
        v5 = 1
    elseif p1.Position == 1 then
        v5 = v1
    end
    v4.BackgroundTransparency = v5
    v5 = {}
    local v6 = {Rotation = 90}
    local v7 = {}
    local v8 = NumberSequenceKeypoint.new(0, 1)
    local v9 = NumberSequenceKeypoint.new(0.5, 0)
    v7[1] = v8
    v7[2] = v9
    v7[3] = NumberSequenceKeypoint.new(1, 1)
    v6.Transparency = NumberSequence.new(v7)
    v5.Gradient = react.createElement("UIGradient", v6)
    v3.Upward = createElement_2("Frame", v4, v5)
    local createElement_3 = react.createElement
    v4 = {BorderSizePixel = 0, ZIndex = -1, AnchorPoint = Vector2.new(0, 0.5), BackgroundColor3 = Color3.fromRGB(84, 90, 106)}
    if 1 >= p1.Position then
        v5 = 1
    else
        v5 = v1
    end
    v4.BackgroundTransparency = v5
    v4.BorderColor3 = Color3.fromRGB(0, 0, 0)
    v4.Position = UDim2.fromScale(-0.307, 0.5)
    v4.Size = UDim2.fromOffset(86, 5)
    v5 = 1 < p1.Position
    v4.Visible = v5
    v5 = {}
    v6 = {Rotation = 90}
    v7 = {}
    v8 = NumberSequenceKeypoint.new(0, 1)
    v9 = NumberSequenceKeypoint.new(0.5, 0)
    v7[1] = v8
    v7[2] = v9
    v7[3] = NumberSequenceKeypoint.new(1, 1)
    v6.Transparency = NumberSequence.new(v7)
    v5.Gradient = react.createElement("UIGradient", v6)
    v3.Straight = createElement_3("Frame", v4, v5)
    local createElement_4 = react.createElement
    v4 = {
        BorderSizePixel = 0,
        Rotation = -62,
        ZIndex = -1,
        AnchorPoint = Vector2.new(1, 0.5),
        BackgroundColor3 = Color3.fromRGB(84, 90, 106),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.7),
        Size = UDim2.fromOffset(243, 3),
    }
    IsTopLayer = p1.IsTopLayer
    if IsTopLayer then
        IsTopLayer = p1.Position == 1
    end
    v4.Visible = IsTopLayer
    if not p1.IsTopLayer then
        v5 = 1
    elseif p1.Position ~= 1 then
        v5 = 1
    else
        v5 = v1
        if not v5 then
            v5 = 1
        end
    end
    v4.BackgroundTransparency = v5
    v5 = {}
    v6 = {Rotation = 90}
    v7 = {}
    v8 = NumberSequenceKeypoint.new(0, 1)
    v9 = NumberSequenceKeypoint.new(0.5, 0)
    v7[1] = v8
    v7[2] = v9
    v7[3] = NumberSequenceKeypoint.new(1, 1)
    v6.Transparency = NumberSequence.new(v7)
    v5.Gradient = react.createElement("UIGradient", v6)
    v3.Downward = createElement_4("Frame", v4, v5)
    return createElement(Fragment, {}, v3)
end