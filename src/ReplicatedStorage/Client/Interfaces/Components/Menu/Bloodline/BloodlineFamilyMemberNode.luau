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
--File: ReplicatedStorage.Client.Interfaces.Components.Menu.Bloodline.BloodlineFamilyMemberNode
--                               Dumped in 0.00157 seconds
--                          Bytecode version 9  |  10 functions

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
local Hooks = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useAsyncEffect = require(Hooks:WaitForChild("useAsyncEffect"))
local Hooks_2 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useMotion = require(Hooks_2:WaitForChild("useMotion"))
local Hooks_3 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useRem = require(Hooks_3:WaitForChild("useRem"))
local Hooks_4 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useTheme = require(Hooks_4:WaitForChild("useTheme"))
local Hooks_5 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useTooltip = require(Hooks_5:WaitForChild("useTooltip"))
local Utilities = v1.Parent.Parent.Parent:WaitForChild("Utilities")
local Color = require(Utilities:WaitForChild("Color"))
local Primitives = v1.Parent.Parent.Parent:WaitForChild("Primitives")
local Frame = require(Primitives:WaitForChild("Frame"))
local u143 = {}
local u144 = {}
return function(p1) -- Line: 48 -- upvalues: useMotion (val), react (val), useTooltip (val), useTheme (val), useRem (val), useAsyncEffect (val), Promise (val), u143 (val), u144 (val), Players (val), Frame (val), Color (val)
    local u13, u17, u18, u20, u21, u4, u8, v1, v2, v3, v4, v5
    v1, u4 = useMotion(0)
    v4, u8 = useMotion(1)
    v5, u13 = react.useState("rbxassetid://0")
    u17, u18 = react.useState("")
    u20, u21 = useTooltip()
    local v6 = useTheme()
    local u25 = useRem()
    useAsyncEffect(function() -- Line: 59 -- upvalues: p1 (val), u4 (val), u8 (val), Promise (upval)
        if p1.Enabled then
            return Promise.delay(p1.DistanceFromCenter * p1.Speed):andThen(function() -- Line: 67 -- upvalues: u4 (upval), u8 (upval)
                u4:spring(80)
                u8:spring(0)
            end)
        end
        u4:immediate(0)
        u8:immediate(1)
        return Promise.resolve()
    end, {p1.Enabled})
    useAsyncEffect(function() -- Line: 73 -- upvalues: u13 (val), Promise (upval), u143 (upval), p1 (val), u144 (upval), u18 (val), Players (upval)
        u13("rbxassetid://0")
        return Promise.new(function(a1, p2) -- Line: 76 -- upvalues: u143 (upval), p1 (upval), u144 (upval), u13 (upval), u18 (upval), Players (upval)
            local NameFromUserIdAsync, v1, v2
            if not (u143[tostring(p1.User)]) then
                v1, v2 = pcall(function() -- Line: 85 -- upvalues: Players (upval), p1 (upval)
                    local v1 = tonumber(p1.User)
                    return Players:GetUserThumbnailAsync(v1, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
                end)
                if not v1 then
                    p2(v2)
                    return
                end
                NameFromUserIdAsync = Players:GetNameFromUserIdAsync(p1.User)
                u13(v2)
                u18(NameFromUserIdAsync)
                u143[tostring(p1.User)] = v2
                u144[tostring(p1.User)] = NameFromUserIdAsync
                a1()
                return
            end
            if u144[tostring(p1.User)] then
                u13(u143[tostring(p1.User)])
                u18(u144[tostring(p1.User)])
                a1()
                return
            end
            v1, v2 = pcall(function() -- Line: 85 -- upvalues: Players (upval), p1 (upval)
                local v1 = tonumber(p1.User)
                return Players:GetUserThumbnailAsync(v1, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
            end)
            if not v1 then
                p2(v2)
                return
            end
            NameFromUserIdAsync = Players:GetNameFromUserIdAsync(p1.User)
            u13(v2)
            u18(NameFromUserIdAsync)
            u143[tostring(p1.User)] = v2
            u144[tostring(p1.User)] = NameFromUserIdAsync
            a1()
        end)
    end, {p1.User})
    local v7 = {Position = p1.Position, Size = v1:map(function(p1) -- Line: 112 -- upvalues: u25 (val)
        local v1 = u25(p1)
        return UDim2.fromOffset(v1, u25(p1))
    end)}
    local v8 = {Debug = react.createElement("TextLabel", {BackgroundTransparency = 1, Visible = false, Text = p1.Position.X.Scale .. ", " .. p1.Position.Y.Scale, TextColor3 = Color3.fromRGB(255, 255, 255)})}
    local v9 = {
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = v6.PageBackground,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
        ZIndex = 2,
        BackgroundTransparency = v4,
    }
    v9[react.Event.MouseEnter] = function(...) -- Line: 134 -- upvalues: u20 (val), u17 (val)
        u20("Bloodline Member", u17, ...)
    end
    v9[react.Event.MouseLeave] = function() -- Line: 138 -- upvalues: u21 (val)
        u21()
    end
    local v10 = {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 10)})}
    local v11 = {Thickness = 2, Color = Color.Darken(v6.Primary, 0.3), Transparency = v4}
    v10.Stroke = react.createElement("UIStroke", v11)
    local Primary = p1.Primary
    if Primary then
        v11 = {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ZIndex = -1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.fromScale(0.5, 0.5),
        }
        local v12 = UDim2.fromScale(1, 1)
        v3 = u25(15)
        v11.Size = v12 + UDim2.fromOffset(v3, u25(15))
        Primary = react.createElement("Frame", v11, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 10)}), Stroke = react.createElement("UIStroke", {Color = Color.Darken(v6.Bar, 0.9), Transparency = v4})})
    end
    v10.Outline = Primary
    v11 = {
        BorderSizePixel = 0,
        ZIndex = 3,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
    }
    if p1.Status ~= 0 then
        v2 = 0.3
    else
        v2 = 1
    end
    v11.BackgroundTransparency = v2
    v11.Size = UDim2.fromScale(1, 1)
    v2 = {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 10)})}
    v3 = {Rotation = 45, Text = "DISOWNED", TextScaled = true, BackgroundTransparency = 1}
    local v13 = p1.Status == 2
    v3.Visible = v13
    v3.Size = UDim2.fromScale(0.9, 0.9)
    v3.TextColor3 = Color3.fromRGB(200, 90, 90)
    v3.Font = Enum.Font.SourceSansBold
    v3.AnchorPoint = Vector2.new(0.5, 0.5)
    v3.Position = UDim2.fromScale(0.5, 0.5)
    v2.Disowned = react.createElement("TextLabel", v3)
    v3 = {BackgroundTransparency = 1, Image = "rbxassetid://124811625794762", Size = UDim2.fromScale(0.8, 0.8)}
    v13 = p1.Status == 1
    v3.Visible = v13
    v3.AnchorPoint = Vector2.new(0.5, 0.5)
    v3.Position = UDim2.fromScale(0.5, 0.5)
    v3.ImageColor3 = Color3.fromRGB(94, 94, 94)
    v2.Dead = react.createElement("ImageLabel", v3)
    v10.Status = react.createElement("Frame", v11, v2)
    v10.Image = react.createElement("ImageLabel", {
        BackgroundTransparency = 1,
        ZIndex = 2,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Image = v5,
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(0.775, 0.775),
    }, {Ratio = react.createElement("UIAspectRatioConstraint", {AspectRatio = 1}), Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 10)})})
    v8.Content = react.createElement("Frame", v9, v10)
    return react.createElement(Frame, v7, v8)
end