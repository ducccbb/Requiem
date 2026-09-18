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
--       File: ReplicatedStorage.Client.Interfaces.Components.Screen.Squad.Member
--                               Dumped in 0.00186 seconds
--                          Bytecode version 9  |  7 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local Hooks = script.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useRem = require(Hooks:WaitForChild("useRem"))
local u50 = Color3.fromRGB(252, 221, 98)
local function getLoreName(p1) -- Line: 24
    if not p1 then
        return "Unknown"
    end
    local Attribute = p1:GetAttribute("DisplayName")
    if not Attribute then
        Attribute = p1:GetAttribute("Name")
        if not Attribute then
            Attribute = p1.Name
        end
    end
    return Attribute
end
return react.memo(function(p1) -- Line: 32 -- upvalues: useRem (val), Players (val), react (val), getLoreName (val), u50 (val)
    local u14, v1, v2, v3
    local v4 = useRem()
    local PlayerByUserId = Players:GetPlayerByUserId(p1.userId)
    v3, u14 = react.useState(getLoreName(PlayerByUserId))
    react.useEffect(function() -- Line: 38 -- upvalues: Players (upval), p1 (val), u14 (val), getLoreName (upval)
        local PlayerByUserId = Players:GetPlayerByUserId(p1.userId)
        u14(getLoreName(PlayerByUserId))
        if not PlayerByUserId then
            return
        end
        local u11 = {}
        local AttributeChangedSignal = PlayerByUserId:GetAttributeChangedSignal("Name")
        table.insert(u11, AttributeChangedSignal:Connect(function() -- Line: 50 -- upvalues: u14 (upval), getLoreName (upval), PlayerByUserId (val)
            u14(getLoreName(PlayerByUserId))
        end))
        local AttributeChangedSignal_2 = PlayerByUserId:GetAttributeChangedSignal("DisplayName")
        table.insert(u11, AttributeChangedSignal_2:Connect(function() -- Line: 57 -- upvalues: u14 (upval), getLoreName (upval), PlayerByUserId (val)
            u14(getLoreName(PlayerByUserId))
        end))
        return function() -- Line: 62 -- upvalues: u11 (val)
            local v1 = u11
            local v2 = nil
            local v3 = nil
            for i, j in v1, v2, v3 do
                j:Disconnect()
            end
        end
    end, {p1.userId})
    local v5 = v4(16)
    local v6 = v4(24)
    local v7 = v4(8)
    local v8 = v5 + v4(6) + v7
    local v9 = v4(200)
    local v10 = p1.alignRight == true
    if v10 then
        v1 = {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            AnchorPoint = Vector2.new(1, 0.5),
            LayoutOrder = p1.layoutOrder,
            Position = UDim2.fromScale(1, 0),
            Size = UDim2.fromOffset(v9, v6),
        }
        v2 = {}
        local isLeader = p1.isLeader
        if isLeader then
            isLeader = react.createElement("ImageLabel", {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Image = "rbxassetid://87121838752872",
                AnchorPoint = Vector2.new(1, 0.5),
                ImageColor3 = u50,
                Position = UDim2.new(1, 0, 0.5, 0),
                ScaleType = Enum.ScaleType.Fit,
                Size = UDim2.fromOffset(v5, v5),
            })
        end
        v2.LeaderIcon = isLeader
        v2.Name = react.createElement("TextLabel", {
            BackgroundTransparency = 1,
            TextScaled = true,
            TextStrokeTransparency = 1,
            TextTransparency = 0.03,
            TextWrapped = true,
            AnchorPoint = Vector2.new(1, 0.5),
            FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json"),
            Position = UDim2.new(1, -v8, 0.5, 0),
            Size = UDim2.new(1, -v8, 1, 0),
            Text = v3,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextSize = v4(11),
            TextXAlignment = Enum.TextXAlignment.Right,
            TextYAlignment = Enum.TextYAlignment.Center,
        })
        return react.createElement("Frame", v1, v2)
    end
    v1 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0, 0.5),
        LayoutOrder = p1.layoutOrder,
        Position = UDim2.fromScale(0, 0),
        Size = UDim2.fromOffset(v9, v6),
    }
    v2 = {}
    local isLeader_2 = p1.isLeader
    if isLeader_2 then
        isLeader_2 = react.createElement("ImageLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Image = "rbxassetid://87121838752872",
            AnchorPoint = Vector2.new(0, 0.5),
            ImageColor3 = u50,
            Position = UDim2.new(0, 0, 0.5, 0),
            ScaleType = Enum.ScaleType.Fit,
            Size = UDim2.fromOffset(v5, v5),
        })
    end
    v2.LeaderIcon = isLeader_2
    v2.Name = react.createElement("TextLabel", {
        BackgroundTransparency = 1,
        TextScaled = true,
        TextStrokeTransparency = 1,
        TextTransparency = 0.03,
        TextWrapped = true,
        AnchorPoint = Vector2.new(0, 0.5),
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json"),
        Position = UDim2.new(0, v8, 0.5, 0),
        Size = UDim2.new(1, -v8, 0.8, 0),
        Text = v3,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = v4(11),
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Center,
    })
    return react.createElement("Frame", v1, v2)
end)