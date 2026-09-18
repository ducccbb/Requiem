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
--         File: ReplicatedStorage.Client.Interfaces.Routes.Debug.Debugger.Root
--                              Dumped in 0.000447 seconds
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
local Tools = v1.Parent:WaitForChild("Tools")
local Root = require(Tools:WaitForChild("Root"))
local Pages = v1.Parent:WaitForChild("Pages")
local Config = require(Pages:WaitForChild("Config"))
local Pages_2 = v1.Parent:WaitForChild("Pages")
local Enchantments = require(Pages_2:WaitForChild("Enchantments"))
local Pages_3 = v1.Parent:WaitForChild("Pages")
local Logs = require(Pages_3:WaitForChild("Logs"))
local Pages_4 = v1.Parent:WaitForChild("Pages")
local Proficiencies = require(Pages_4:WaitForChild("Proficiencies"))
local Pages_5 = v1.Parent:WaitForChild("Pages")
local Sacraments = require(Pages_5:WaitForChild("Sacraments"))
local Pages_6 = v1.Parent:WaitForChild("Pages")
local States = require(Pages_6:WaitForChild("States"))
local Pages_7 = v1.Parent:WaitForChild("Pages")
local Tests = require(Pages_7:WaitForChild("Tests"))
local Pages_8 = v1.Parent:WaitForChild("Pages")
local Values = require(Pages_8:WaitForChild("Values"))
local Components = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Primitives = Components:WaitForChild("Primitives")
local Frame = require(Primitives:WaitForChild("Frame"))
local Hooks = v1.Parent.Parent:WaitForChild("Hooks")
local useDebuggerEnabled = require(Hooks:WaitForChild("useDebuggerEnabled"))
return react.memo(function() -- Line: 35 -- upvalues: useDebuggerEnabled (val), react (val), Frame (val), Root (val), Config (val), Enchantments (val), Logs (val), Proficiencies (val), Sacraments (val), States (val), Tests (val), Values (val)
    return react.createElement(Frame, {Visible = useDebuggerEnabled()}, {
        Padding = react.createElement("UIPadding", {PaddingTop = UDim.new(0, 20), PaddingBottom = UDim.new(0, 20), PaddingLeft = UDim.new(0, 20), PaddingRight = UDim.new(0, 20)}),
        Tools = react.createElement(Root),
        Config = react.createElement(Config),
        Enchantments = react.createElement(Enchantments),
        Logs = react.createElement(Logs),
        Proficiencies = react.createElement(Proficiencies),
        Sacraments = react.createElement(Sacraments),
        States = react.createElement(States),
        Tests = react.createElement(Tests),
        Values = react.createElement(Values),
    })
end)