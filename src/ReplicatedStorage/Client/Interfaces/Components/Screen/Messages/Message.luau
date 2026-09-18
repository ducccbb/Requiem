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
--     File: ReplicatedStorage.Client.Interfaces.Components.Screen.Messages.Message
--                              Dumped in 0.000940 seconds
--                          Bytecode version 9  |  2 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local Utilities = v1.Parent.Parent.Parent:WaitForChild("Utilities")
require(Utilities:WaitForChild("Color"))
local Utilities_2 = v1.Parent.Parent.Parent:WaitForChild("Utilities")
require(Utilities_2:WaitForChild("FillProps"))
local Primitives = v1.Parent.Parent.Parent:WaitForChild("Primitives")
require(Primitives:WaitForChild("Hitbox"))
local Utilities_3 = v1.Parent.Parent.Parent:WaitForChild("Utilities")
require(Utilities_3:WaitForChild("Stroke"))
local Primitives_2 = v1.Parent.Parent.Parent:WaitForChild("Primitives")
require(Primitives_2:WaitForChild("Label"))
local Hooks = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
require(Hooks:WaitForChild("useTextScale"))
local Hooks_2 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
require(Hooks_2:WaitForChild("useTheme"))
local function createMessage(p1, p2) -- Line: 31 -- upvalues: react (val)
    react.createElement("Frame", {
        BackgroundTransparency = 0.7,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(33, 33, 33),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
    }, {image = react.createElement("ImageLabel", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Image = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. p1.UserId .. "&width=420&height=420&format=png",
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.465, 0.215),
        Size = UDim2.fromScale(0.069, 0.124),
    }), name = react.createElement("TextLabel", {
        TextSize = 25,
        TextWrapped = true,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json"),
        Text = p1.Name .. " (@" .. p1.DisplayName .. ")",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.362, 0.339),
        Size = UDim2.fromScale(0.276, 0.0317),
    }), content = react.createElement("TextLabel", {
        TextSize = 20,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json"),
        Text = p2,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextYAlignment = Enum.TextYAlignment.Top,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.279, 0.389),
        Size = UDim2.fromScale(0.442, 0.578),
    }), line = react.createElement("Frame", {
        BorderSizePixel = 0,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.403, 0.376),
        Size = UDim2.fromScale(0.193, 0.00099),
    })})
end