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
--            File: ReplicatedStorage.Client.Interfaces.Routes.Screen.Bossbar
--                               Dumped in 0.00135 seconds
--                          Bytecode version 9  |  6 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Player = require(Namespaces:WaitForChild("Player"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_2:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local Hooks = script.Parent.Parent.Parent:WaitForChild("Hooks")
local useRem = require(Hooks:WaitForChild("useRem"))
local function BossbarEntry(p1) -- Line: 36 -- upvalues: useRem (val), react (val)
    local v1 = useRem()
    local bossbar = p1.bossbar
    local v2 = v1(517, "pixel")
    local v3 = v1(14, "pixel")
    local v4 = v1(16, "pixel")
    local v5 = v3 + v4 + v1(4, "pixel")
    local v6 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Size = UDim2.fromOffset(v2, v5),
    }
    local v7 = {}
    local v8 = {
        TextScaled = false,
        TextWrapped = false,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        FontFace = Font.new("rbxasset://fonts/families/AccanthisADFStd.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
        Text = bossbar.header,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = v1(24, "pixel"),
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Bottom,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
    }
    local v9 = v1(6, "pixel")
    v8.Position = UDim2.fromOffset(v9, 0)
    local v10 = -v1(12, "pixel")
    v8.Size = UDim2.new(1, v10, 0, v3)
    v7.Label = react.createElement("TextLabel", v8, {UIStroke3 = react.createElement("UIStroke", {Transparency = 0.32})})
    v8 = {
        BackgroundTransparency = 0.2,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 1),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.new(0.5, 0, 1, 0),
        Size = UDim2.new(1, 0, 0, v4),
    }
    local v11 = {UIStroke = react.createElement("UIStroke", {Color = Color3.fromRGB(163, 163, 163)})}
    local v12 = {
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundColor3 = Color3.fromRGB(84, 84, 84),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0, 0.5),
        Size = UDim2.fromScale(1, 1),
    }
    local v13 = {}
    local v14 = {BorderSizePixel = 0, AnchorPoint = Vector2.new(0, 0.5)}
    local color = bossbar.color
    if not color then
        color = Color3.fromRGB(182, 0, 0)
    end
    v14.BackgroundColor3 = color
    v14.BorderColor3 = Color3.fromRGB(0, 0, 0)
    v14.Position = UDim2.fromScale(0, 0.5)
    v14.Size = UDim2.fromScale(bossbar.health / bossbar.maxHealth, 1)
    local v15 = {}
    local v16 = {Rotation = 90}
    local v17 = {}
    local v18 = ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255))
    v17[1] = v18
    v17[2] = ColorSequenceKeypoint.new(1, Color3.fromRGB(225, 225, 225))
    v16.Color = ColorSequence.new(v17)
    v15.UIGradient = react.createElement("UIGradient", v16)
    v13.Fill = react.createElement("Frame", v14, v15)
    v13.UIStroke1 = react.createElement("UIStroke", {Transparency = 0.51, BorderOffset = UDim.new(0, 3), Color = Color3.fromRGB(255, 255, 255)})
    v11.Bar = react.createElement("Frame", v12, v13)
    v11.UIPadding = react.createElement("UIPadding", {PaddingBottom = UDim.new(0, 4), PaddingLeft = UDim.new(0, 4), PaddingRight = UDim.new(0, 4), PaddingTop = UDim.new(0, 4)})
    v11.UIStroke2 = react.createElement("UIStroke", {Transparency = 0.51, BorderOffset = UDim.new(0, 3), Color = Color3.fromRGB(255, 255, 255)})
    v7.Container = react.createElement("Frame", v8, v11)
    return react.createElement("Frame", v6, v7)
end
return function() -- Line: 137 -- upvalues: useRem (val), react (val), Player (val), BossbarEntry (val)
    local u6, v1, v2
    local v3 = useRem()
    local v4 = {}
    v1, u6 = react.useState(v4)
    react.useEffect(function() -- Line: 141 -- upvalues: u6 (val), Player (upval)
        return Player.Bossbar.listen(function(p1) -- Line: 142 -- upvalues: u6 (upval)
            u6(function(a1) -- Line: 143 -- upvalues: p1 (val)
                local v1
                local v2 = table.clone(a1)
                if p1.visible then
                    v1 = tostring(p1.userid)
                    v2[v1] = p1
                    return v2
                end
                v1 = tostring(p1.userid)
                v2[v1] = nil
                return v2
            end)
        end)
    end, {})
    local v5 = {}
    local v6 = v1
    local v7 = nil
    local v8 = nil
    for i, j in v6, v7, v8 do
        v2 = tostring(i)
        v5[v2] = react.createElement(BossbarEntry, {bossbar = j})
    end
    v8 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
    }
    local v9 = UDim2.fromScale(0.5, 0.00771)
    v8.Position = v9 + UDim2.fromOffset(0, v3(20, "pixel"))
    v9 = v3(517, "pixel")
    v8.Size = UDim2.fromOffset(v9, 0)
    return react.createElement("Frame", v8, {List = react.createElement("UIListLayout", {Padding = UDim.new(0, v3(15, "pixel")), SortOrder = Enum.SortOrder.LayoutOrder})}, v5)
end