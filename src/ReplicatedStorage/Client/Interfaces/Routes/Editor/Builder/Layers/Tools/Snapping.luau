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
-- File: ReplicatedStorage.Client.Interfaces.Routes.Editor.Builder.Layers.Tools.Snapping
--                              Dumped in 0.000582 seconds
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
local Editor_2 = Components_2:WaitForChild("Editor")
local Universal_2 = Editor_2:WaitForChild("Universal")
local Number = require(Universal_2:WaitForChild("Number"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_4:WaitForChild("Client")
local Interfaces_3 = Client_3:WaitForChild("Interfaces")
local Hooks = Interfaces_3:WaitForChild("Hooks")
local useRem = require(Hooks:WaitForChild("useRem"))
return function() -- Line: 23 -- upvalues: useRem (val), react (val), Container (val), Number (val)
    local v1 = {Padding = "Large", Layout = "Vertical", Spacing = 20}
    local v2 = {AnchorPoint = Vector2.new(0, 1)}
    local v3 = UDim2.fromScale(0, 1)
    v2.Position = v3 + UDim2.fromOffset(0, -useRem()(330))
    v1.Native = v2
    return react.createElement(Container, v1, {Size = react.createElement(Number, {
        Header = "Size Snapping",
        Default = 1,
        Divider = 150,
        Increment = 0.1,
        Width = 70,
        Range = NumberRange.new(0.1, 5),
    }), Rotation = react.createElement(Number, {
        Header = "Rotation Snapping",
        Default = 1,
        Divider = 150,
        Increment = 0.1,
        Width = 70,
        Range = NumberRange.new(0.1, 5),
    })})
end