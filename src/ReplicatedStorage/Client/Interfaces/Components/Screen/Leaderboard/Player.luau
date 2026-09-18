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
--    File: ReplicatedStorage.Client.Interfaces.Components.Screen.Leaderboard.Player
--                              Dumped in 0.000638 seconds
--                          Bytecode version 9  |  4 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
return react.memo(function(p1) -- Line: 14 -- upvalues: react (val)
    local Username, u5, v1
    v1, u5 = react.useState(false)
    local createElement = react.createElement
    local Fragment = react.Fragment
    local v2 = {}
    local createElement_2 = react.createElement
    local v3 = {
        BackgroundColor3 = Color3.fromRGB(20, 22, 26),
        BackgroundTransparency = 0.25,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Position = UDim2.fromScale(0, 0.127),
        Size = UDim2.fromScale(1, 0.099),
        LayoutOrder = p1.LayoutOrder,
    }
    v3[react.Event.MouseEnter] = function() -- Line: 34 -- upvalues: p1 (val), u5 (val)
        if not p1.Friends then
            return
        end
        u5(true)
    end
    v3[react.Event.MouseLeave] = function() -- Line: 42 -- upvalues: p1 (val), u5 (val)
        if not p1.Friends then
            return
        end
        u5(false)
    end
    local v4 = {}
    local createElement_3 = react.createElement
    local v5 = {
        TextScaled = true,
        TextSize = 14,
        TextTransparency = 0.03,
        TextWrapped = true,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json"),
    }
    if not v1 then
        Username = p1.Display
    else
        Username = p1.Username
        if not Username then
            Username = p1.Display
        end
    end
    v5.Text = Username
    v5.TextColor3 = Color3.fromRGB(255, 255, 255)
    v5.TextXAlignment = Enum.TextXAlignment.Left
    v5.AnchorPoint = Vector2.new(0.5, 0.5)
    v5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    v5.BorderColor3 = Color3.fromRGB(0, 0, 0)
    v5.Position = UDim2.fromScale(0.453, 0.532)
    v5.Size = UDim2.fromScale(0.886, 0.75)
    v4.textLabel2 = createElement_3("TextLabel", v5)
    v4.uIPadding1 = react.createElement("UIPadding", {PaddingBottom = UDim.new(0, 4), PaddingLeft = UDim.new(0, 8), PaddingRight = UDim.new(0, 8), PaddingTop = UDim.new(0, 4)})
    v4.textLabel3 = react.createElement("TextLabel", {
        TextScaled = true,
        TextSize = 14,
        TextTransparency = 0.64,
        TextWrapped = true,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Italic),
        Text = p1.Rank,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextXAlignment = Enum.TextXAlignment.Right,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.699, 0.5),
        Size = UDim2.fromScale(0.601, 0.8),
    })
    v2.frame7 = createElement_2("Frame", v3, v4)
    return createElement(Fragment, {}, v2)
end)