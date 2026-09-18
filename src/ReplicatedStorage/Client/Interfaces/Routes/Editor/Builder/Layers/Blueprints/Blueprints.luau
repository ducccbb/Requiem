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
--File: ReplicatedStorage.Client.Interfaces.Routes.Editor.Builder.Layers.Blueprints.Blueprints
--                               Dumped in 0.00122 seconds
--                          Bytecode version 9  |  4 functions

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
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_2:WaitForChild("Client")
local Interfaces = Client:WaitForChild("Interfaces")
local Components = Interfaces:WaitForChild("Components")
local Editor = Components:WaitForChild("Editor")
local Universal = Editor:WaitForChild("Universal")
local Container = require(Universal:WaitForChild("Container"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_3:WaitForChild("Client")
local Interfaces_2 = Client_2:WaitForChild("Interfaces")
local Components_2 = Interfaces_2:WaitForChild("Components")
local Primitives = Components_2:WaitForChild("Primitives")
local Frame = require(Primitives:WaitForChild("Frame"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_4:WaitForChild("Client")
local Interfaces_3 = Client_3:WaitForChild("Interfaces")
local Components_3 = Interfaces_3:WaitForChild("Components")
local Editor_2 = Components_3:WaitForChild("Editor")
local Universal_2 = Editor_2:WaitForChild("Universal")
local Text = require(Universal_2:WaitForChild("Text"))
local Directory = require(v1.Parent:WaitForChild("Directory"))
local Drawer = require(v1.Parent:WaitForChild("Drawer"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_5:WaitForChild("Client")
local Interfaces_4 = Client_4:WaitForChild("Interfaces")
local Hooks = Interfaces_4:WaitForChild("Hooks")
local useConstants = require(Hooks:WaitForChild("useConstants"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Client_5 = ReplicatedStorage_6:WaitForChild("Client")
local Interfaces_5 = Client_5:WaitForChild("Interfaces")
local Hooks_2 = Interfaces_5:WaitForChild("Hooks")
local useRem = require(Hooks_2:WaitForChild("useRem"))
local function Header() -- Line: 38 -- upvalues: useRem (val), useConstants (val), react (val), Frame (val), Text (val)
    local v1 = useRem()
    local v2 = useConstants()
    local Large = v2.Padding.Sizes.Large
    local v3 = {BackgroundTransparency = 0.7}
    local v4 = UDim2.fromScale(1, 0)
    local v5 = v1(Large * 2)
    v3.Size = v4 + UDim2.fromOffset(v5, v1(40))
    v3.AnchorPoint = Vector2.new(0.5, 0)
    v4 = UDim2.fromScale(0.5, 0)
    v3.Position = v4 + UDim2.fromOffset(0, -v1(Large))
    v3.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    return react.createElement(Frame, v3, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 4)}), Padding = react.createElement("UIPadding", v2.Padding.Universal.Large), Header = react.createElement(Text, {Text = "DEVELOPMENT WORKSPACE", Bold = true, FontSize = 15})})
end
local function Body() -- Line: 68 -- upvalues: useRem (val), useConstants (val), react (val), Frame (val), Directory (val), Drawer (val)
    local v1 = useRem()
    local Large = useConstants().Padding.Sizes.Large
    local v2 = {AnchorPoint = Vector2.new(0.5, 0)}
    local v3 = UDim2.fromScale(1, 0)
    v2.Size = v3 + UDim2.fromOffset(0, v1(266 - Large / 2))
    v3 = UDim2.fromScale(0.5, 0)
    v2.Position = v3 + UDim2.fromOffset(0, v1(20 + Large / 2))
    local v4 = {Left = react.createElement(Frame, {BackgroundTransparency = 1, Size = UDim2.fromScale(0.2, 1), AnchorPoint = Vector2.new(0, 0.5), Position = UDim2.fromScale(0, 0.5)}, {Directory = react.createElement(Directory, {})})}
    local v5 = {BackgroundTransparency = 1}
    local v6 = UDim2.fromScale(0.8, 1)
    local v7 = v1(-4)
    v5.Size = v6 + UDim2.fromOffset(v7, 0)
    v5.AnchorPoint = Vector2.new(1, 0.5)
    v5.Position = UDim2.fromScale(1, 0.5)
    v4.Right = react.createElement(Frame, v5, {Drawer = react.createElement(Drawer, {})})
    return react.createElement(Frame, v2, v4)
end
return function() -- Line: 105 -- upvalues: useRem (val), react (val), Container (val), Header (val), Body (val)
    local v1 = {}
    local v2 = {}
    local v3 = UDim2.fromScale(1, 0)
    v2.Size = v3 + UDim2.fromOffset(0, useRem()(306))
    v2.AnchorPoint = Vector2.new(0.5, 1)
    v2.Position = UDim2.fromScale(0.5, 1)
    v1.Native = v2
    return react.createElement(Container, v1, {Header = react.createElement(Header), Body = react.createElement(Body)})
end