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
--             File: ReplicatedStorage.Assets.Objects.Building Tools.Loader
--                              Dumped in 0.000418 seconds
--                          Bytecode version 9  |  1 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Parent = script.Parent
local Loaded = Parent:WaitForChild("Loaded")
while not Loaded.Value do
    Loaded.Changed:Wait()
end
local Core = require(Parent:WaitForChild("Core"))
local Tools = Parent:WaitForChild("Tools")
local Move = require(Tools:WaitForChild("Move"))
Core.AssignHotkey("Z", Core.Support.Call(Core.EquipTool, Move))
Core.AddToolButton(Core.Assets.MoveIcon, "Z", Move)
local Resize = require(Tools:WaitForChild("Resize"))
Core.AssignHotkey("X", Core.Support.Call(Core.EquipTool, Resize))
Core.AddToolButton(Core.Assets.ResizeIcon, "X", Resize)
local Rotate = require(Tools:WaitForChild("Rotate"))
Core.AssignHotkey("C", Core.Support.Call(Core.EquipTool, Rotate))
Core.AddToolButton(Core.Assets.RotateIcon, "C", Rotate)
local Paint = require(Tools:WaitForChild("Paint"))
Core.AssignHotkey("V", Core.Support.Call(Core.EquipTool, Paint))
Core.AddToolButton(Core.Assets.PaintIcon, "V", Paint)
local Surface = require(Tools:WaitForChild("Surface"))
Core.AssignHotkey("B", Core.Support.Call(Core.EquipTool, Surface))
Core.AddToolButton(Core.Assets.SurfaceIcon, "B", Surface)
local Material = require(Tools:WaitForChild("Material"))
Core.AssignHotkey("N", Core.Support.Call(Core.EquipTool, Material))
Core.AddToolButton(Core.Assets.MaterialIcon, "N", Material)
local Anchor = require(Tools:WaitForChild("Anchor"))
Core.AssignHotkey("M", Core.Support.Call(Core.EquipTool, Anchor))
Core.AddToolButton(Core.Assets.AnchorIcon, "M", Anchor)
local Collision = require(Tools:WaitForChild("Collision"))
Core.AssignHotkey("K", Core.Support.Call(Core.EquipTool, Collision))
Core.AddToolButton(Core.Assets.CollisionIcon, "K", Collision)
local NewPart = require(Tools:WaitForChild("NewPart"))
Core.AssignHotkey("J", Core.Support.Call(Core.EquipTool, NewPart))
Core.AddToolButton(Core.Assets.NewPartIcon, "J", NewPart)
local Mesh = require(Tools:WaitForChild("Mesh"))
Core.AssignHotkey("H", Core.Support.Call(Core.EquipTool, Mesh))
Core.AddToolButton(Core.Assets.MeshIcon, "H", Mesh)
local Texture = require(Tools:WaitForChild("Texture"))
Core.AssignHotkey("G", Core.Support.Call(Core.EquipTool, Texture))
Core.AddToolButton(Core.Assets.TextureIcon, "G", Texture)
local Weld = require(Tools:WaitForChild("Weld"))
Core.AssignHotkey("F", Core.Support.Call(Core.EquipTool, Weld))
Core.AddToolButton(Core.Assets.WeldIcon, "F", Weld)
local Lighting = require(Tools:WaitForChild("Lighting"))
Core.AssignHotkey("U", Core.Support.Call(Core.EquipTool, Lighting))
Core.AddToolButton(Core.Assets.LightingIcon, "U", Lighting)
local Decorate = require(Tools:WaitForChild("Decorate"))
Core.AssignHotkey("P", Core.Support.Call(Core.EquipTool, Decorate))
Core.AddToolButton(Core.Assets.DecorateIcon, "P", Decorate)
return Core