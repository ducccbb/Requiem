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
--    File: ReplicatedStorage.Client.Interfaces.Components.Screen.Leaderboard.Holder
--                              Dumped in 0.000329 seconds
--                          Bytecode version 9  |  2 functions

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
    return react.createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 0,
        AnchorPoint = Vector2.new(1, 0),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.new(1, -3, 0, 3),
        Size = UDim2.fromScale(0.196, 0.412),
        Visible = p1.Visible,
    }, {Layout = react.createElement("UIListLayout", {Padding = UDim.new(0, 2), HorizontalAlignment = Enum.HorizontalAlignment.Right, SortOrder = Enum.SortOrder.LayoutOrder}), Ratio = react.createElement("UIAspectRatioConstraint", {AspectRatio = 0.848}), Constraint = react.createElement("UISizeConstraint", {MaxSize = Vector2.new(250, math.huge)})}, p1.children)
end)