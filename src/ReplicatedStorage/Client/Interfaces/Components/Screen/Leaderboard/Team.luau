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
--     File: ReplicatedStorage.Client.Interfaces.Components.Screen.Leaderboard.Team
--                               Dumped in 0.00144 seconds
--                          Bytecode version 9  |  3 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Types = Common:WaitForChild("Types")
local Branches = require(Types:WaitForChild("Branches"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_2:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Utilities = Common_2:WaitForChild("Utilities")
local String = require(Utilities:WaitForChild("String"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Utilities_2 = Common_3:WaitForChild("Utilities")
local Table = require(Utilities_2:WaitForChild("Table"))
local function getTeamColor(p1) -- Line: 17 -- upvalues: Branches (val)
    local v1, v2
    if p1 == Branches.Branches.SCOUTING_LEGION then
        v1 = {}
        v2 = Color3.fromRGB(15, 21, 54)
        v1[1] = v2
        v1[2] = Color3.fromRGB(48, 106, 157)
        return v1
    end
    if p1 == Branches.Branches.STATIONARY_GUARD then
        v1 = {}
        v2 = Color3.fromRGB(54, 13, 13)
        v1[1] = v2
        v1[2] = Color3.fromRGB(157, 51, 51)
        return v1
    end
    if p1 == Branches.Branches.MILITARY_POLICE then
        v1 = {}
        v2 = Color3.fromRGB(17, 54, 31)
        v1[1] = v2
        v1[2] = Color3.fromRGB(78, 157, 57)
        return v1
    end
    if p1 == Branches.Branches.CIVILIAN then
        v1 = {}
        v2 = Color3.fromRGB(80, 80, 80)
        v1[1] = v2
        v1[2] = Color3.fromRGB(255, 255, 255)
        return v1
    end
    if p1 == Branches.Branches.GOVERNMENT then
        v1 = {}
        v2 = Color3.fromRGB(107, 50, 124)
        v1[1] = v2
        v1[2] = Color3.fromRGB(137, 97, 150)
        return v1
    end
    if p1 == Branches.Branches.TRAINEE_CORPS then
        v1 = {}
        v2 = Color3.fromRGB(87, 60, 40)
        v1[1] = v2
        v1[2] = Color3.fromRGB(143, 107, 80)
        return v1
    end
    if p1 == Branches.Branches.IRON_MARCH_UNION then
        v1 = {}
        v2 = Color3.fromRGB(50, 64, 31)
        v1[1] = v2
        v1[2] = Color3.fromRGB(50, 64, 31)
        return v1
    end
    v1 = {}
    v2 = Color3.fromRGB(80, 80, 80)
    v1[1] = v2
    v1[2] = Color3.fromRGB(255, 255, 255)
    return v1
end
return react.memo(function(p1) -- Line: 48 -- upvalues: String (val), Table (val), Branches (val), getTeamColor (val), react (val)
    local v1 = Table.inverse(Branches.Branches)
    local v2 = String.capitalizeAllFirstLetters(v1[p1.Branch])
    local v3 = getTeamColor(p1.Branch)
    local v4 = Branches.Labels[p1.Branch]
    local v5 = {}
    local v6 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ClipsDescendants = true,
        AnchorPoint = Vector2.new(1, 0),
        BackgroundColor3 = Color3.fromRGB(37, 29, 29),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.998, 0),
        Size = UDim2.fromScale(1, 0.11),
        LayoutOrder = p1.LayoutOrder or 0,
        Visible = p1.Visible,
    }
    local v7 = {uICorner4 = react.createElement("UICorner", {CornerRadius = UDim.new(0, 5)}), frame4 = react.createElement("Frame", {
        BackgroundTransparency = 0.15,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(1, 0),
        BackgroundColor3 = v3[1],
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(1, -1.16e-07),
        Size = UDim2.fromScale(1, 2.02),
    }, {uICorner5 = react.createElement("UICorner", {CornerRadius = UDim.new(0, 5)})})}
    local v8 = {
        BackgroundTransparency = 0.8,
        BorderSizePixel = 0,
        ZIndex = 3,
        BackgroundColor3 = v3[2],
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Size = UDim2.fromScale(1, 1),
    }
    local v9 = {}
    local v10 = {Rotation = 90}
    local v11 = {}
    local v12 = NumberSequenceKeypoint.new(0, 1)
    v11[1] = v12
    v11[2] = NumberSequenceKeypoint.new(1, 0)
    v10.Transparency = NumberSequence.new(v11)
    v9.uIGradient = react.createElement("UIGradient", v10)
    v7.frame5 = react.createElement("Frame", v8, v9)
    v8 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 3,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
    }
    v9 = {textLabel1 = react.createElement("TextLabel", {
        TextScaled = true,
        TextSize = 14,
        TextTransparency = 0.24,
        TextWrapped = true,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
        Text = v2,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextXAlignment = Enum.TextXAlignment.Left,
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.148, 0.5),
        Size = UDim2.fromScale(0.685, 0.543),
    })}
    v10 = {
        ImageTransparency = 0.75,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Image = v4,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.898, 0.492),
        Size = UDim2.fromScale(0.309, 2.53),
    }
    local v13 = {uIAspectRatioConstraint4 = react.createElement("UIAspectRatioConstraint", {AspectRatio = 1.03})}
    local v14 = {Rotation = -180}
    local v15 = {}
    local v16 = NumberSequenceKeypoint.new(0, 0)
    local v17 = NumberSequenceKeypoint.new(0.834, 1)
    v15[1] = v16
    v15[2] = v17
    v15[3] = NumberSequenceKeypoint.new(1, 1)
    v14.Transparency = NumberSequence.new(v15)
    v13.uIGradient1 = react.createElement("UIGradient", v14)
    v9.imageLabel1 = react.createElement("ImageLabel", v10, v13)
    v9.imageLabel2 = react.createElement("ImageLabel", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 2,
        Image = v4,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.0839, 0.492),
        Size = UDim2.fromScale(0.101, 0.83),
    }, {uIAspectRatioConstraint5 = react.createElement("UIAspectRatioConstraint", {AspectRatio = 1.03})})
    v7.frame6 = react.createElement("Frame", v8, v9)
    v5.frame3 = react.createElement("Frame", v6, v7)
    return react.createElement(react.Fragment, {}, v5)
end)