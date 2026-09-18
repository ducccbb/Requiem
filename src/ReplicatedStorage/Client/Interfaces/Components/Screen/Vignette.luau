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
--         File: ReplicatedStorage.Client.Interfaces.Components.Screen.Vignette
--                              Dumped in 0.000299 seconds
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
local Primitives = script.Parent.Parent:WaitForChild("Primitives")
local Frame = require(Primitives:WaitForChild("Frame"))
return react.memo(function(p1) -- Line: 26 -- upvalues: react (val), Frame (val)
    return react.createElement(Frame, {ZIndex = -1}, {Vignette = react.createElement("ImageLabel", {
        Image = "rbxassetid://135589412519765",
        ImageTransparency = 0.2,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = -1,
        ImageColor3 = Color3.fromRGB(0, 0, 0),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(12, 17, 18),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1.3, 1.2),
        Visible = p1.Enabled,
    })})
end)