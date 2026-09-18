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
--File: ReplicatedStorage.Client.Interfaces.Routes.Editor.Builder.Layers.Blueprints.Directory
--                              Dumped in 0.000729 seconds
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
local Hooks = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useBuildBlueprints = require(Hooks:WaitForChild("useBuildBlueprints"))
local Hooks_2 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useBuildDecorations = require(Hooks_2:WaitForChild("useBuildDecorations"))
local Hooks_3 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useBuildSandbox = require(Hooks_3:WaitForChild("useBuildSandbox"))
local Hooks_4 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useBuildSchematics = require(Hooks_4:WaitForChild("useBuildSchematics"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_2:WaitForChild("Client")
local Interfaces = Client:WaitForChild("Interfaces")
local Components = Interfaces:WaitForChild("Components")
local Editor = Components:WaitForChild("Editor")
local Builder = Editor:WaitForChild("Builder")
local Directory = Builder:WaitForChild("Directory")
local Header = require(Directory:WaitForChild("Header"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_3:WaitForChild("Client")
local Interfaces_2 = Client_2:WaitForChild("Interfaces")
local Components_2 = Interfaces_2:WaitForChild("Components")
local Editor_2 = Components_2:WaitForChild("Editor")
local Universal = Editor_2:WaitForChild("Universal")
local Layouts = Universal:WaitForChild("Layouts")
local Vertical = require(Layouts:WaitForChild("Vertical"))
return function() -- Line: 26 -- upvalues: useBuildBlueprints (val), useBuildDecorations (val), useBuildSandbox (val), useBuildSchematics (val), react (val), Vertical (val), Header (val)
    local v1, v2, v3
    v1, v2 = useBuildSandbox()
    local v4 = useBuildSchematics()
    local createElement = react.createElement
    local v5 = {
        BackgroundTransparency = 0.9,
        ScrollBarThickness = 2,
        BorderSizePixel = 0,
        Size = UDim2.fromScale(1, 1),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        CanvasSize = UDim2.fromScale(0, 0),
        BackgroundColor3 = Color3.fromRGB(24, 26, 31),
    }
    local v6 = {Layout = react.createElement(Vertical, {
        Spacing = 5,
        Native = {VerticalAlignment = Enum.VerticalAlignment.Top},
    }), Blueprints = react.createElement(Header, {Path = "Blueprints/*", Label = "Blueprints", Content = useBuildBlueprints()}), Decorations = react.createElement(Header, {Path = "Decorations/*", Label = "Decorations", Content = useBuildDecorations()})}
    if not v1 then
        v3 = nil
    else
        v3 = react.createElement(Header, {Path = "Sandbox/*", Label = "Sandbox", Content = v2})
    end
    v6.Sandbox = v3
    if not v1 then
        v3 = nil
    else
        v3 = react.createElement(Header, {Path = "Schematics/*", Label = "Schematics", Content = v4})
        if not v3 then
            v3 = nil
        end
    end
    v6.Schematics = v3
    return createElement("ScrollingFrame", v5, v6)
end