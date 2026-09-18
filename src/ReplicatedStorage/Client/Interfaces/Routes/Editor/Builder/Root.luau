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
--         File: ReplicatedStorage.Client.Interfaces.Routes.Editor.Builder.Root
--                              Dumped in 0.000523 seconds
--                          Bytecode version 9  |  3 functions

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
local Components = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Primitives = Components:WaitForChild("Primitives")
local Frame = require(Primitives:WaitForChild("Frame"))
local Providers = v1.Parent.Parent:WaitForChild("Providers")
local BuilderProvider = require(Providers:WaitForChild("BuilderProvider"))
local Layers = v1.Parent:WaitForChild("Layers")
local Blueprints_2 = Layers:WaitForChild("Blueprints")
local Blueprints = require(Blueprints_2:WaitForChild("Blueprints"))
local Layers_2 = v1.Parent:WaitForChild("Layers")
local Tools = Layers_2:WaitForChild("Tools")
local Gizmo = require(Tools:WaitForChild("Gizmo"))
local Layers_3 = v1.Parent:WaitForChild("Layers")
local Permissions = require(Layers_3:WaitForChild("Permissions"))
local Layers_4 = v1.Parent:WaitForChild("Layers")
local Tools_2 = Layers_4:WaitForChild("Tools")
local Snapping = require(Tools_2:WaitForChild("Snapping"))
local Layers_5 = v1.Parent:WaitForChild("Layers")
local Tools_3 = Layers_5:WaitForChild("Tools")
local Treasury = require(Tools_3:WaitForChild("Treasury"))
local Hooks = v1.Parent.Parent:WaitForChild("Hooks")
local useBuildEnabled = require(Hooks:WaitForChild("useBuildEnabled"))
local function Root() -- Line: 34 -- upvalues: useBuildEnabled (val), react (val), Frame (val), Blueprints (val), Snapping (val), Gizmo (val), Treasury (val), Permissions (val)
    return react.createElement(Frame, {Visible = useBuildEnabled()}, {
        Padding = react.createElement("UIPadding", {PaddingLeft = UDim.new(0, 10), PaddingRight = UDim.new(0, 10), PaddingTop = UDim.new(0, 10), PaddingBottom = UDim.new(0, 10)}),
        Blueprints = react.createElement(Blueprints),
        Snapping = react.createElement(Snapping),
        Gizmo = react.createElement(Gizmo),
        Treasury = react.createElement(Treasury),
        Permissions = react.createElement(Permissions),
    })
end
return function() -- Line: 64 -- upvalues: react (val), BuilderProvider (val), Root (val)
    return react.createElement(BuilderProvider.BuilderProvider, {}, {react.createElement(Root)})
end