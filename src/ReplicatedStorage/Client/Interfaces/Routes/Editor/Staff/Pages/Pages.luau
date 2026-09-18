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
--       File: ReplicatedStorage.Client.Interfaces.Routes.Editor.Staff.Pages.Pages
--                              Dumped in 0.000569 seconds
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
local Spawner = v1.Parent:WaitForChild("Spawner")
local Animal = require(Spawner:WaitForChild("Animal"))
local Spawner_2 = v1.Parent:WaitForChild("Spawner")
local Prop = require(Spawner_2:WaitForChild("Prop"))
local Spawner_3 = v1.Parent:WaitForChild("Spawner")
local Titan = require(Spawner_3:WaitForChild("Titan"))
local Builder = require(v1.Parent:WaitForChild("Builder"))
local Character = require(v1.Parent:WaitForChild("Character"))
local Destruction = require(v1.Parent:WaitForChild("Destruction"))
local Slots = require(v1.Parent:WaitForChild("Slots"))
local Visibility = require(v1.Parent:WaitForChild("Visibility"))
local Logs = require(v1.Parent:WaitForChild("Logs"))
local Messages = require(v1.Parent:WaitForChild("Messages"))
local Pings = require(v1.Parent:WaitForChild("Pings"))
local Lighting_2 = v1.Parent:WaitForChild("Lighting")
local Lighting = require(Lighting_2:WaitForChild("Lighting"))
return react.memo(function() -- Line: 38 -- upvalues: react (val), Titan (val), Animal (val), Prop (val), Destruction (val), Builder (val), Visibility (val), Character (val), Slots (val), Pings (val), Logs (val), Messages (val), Lighting (val)
    return react.createElement(react.Fragment, {}, {
        Titan = react.createElement(Titan),
        Animal = react.createElement(Animal),
        Prop = react.createElement(Prop),
        Destruction = react.createElement(Destruction),
        Builder = react.createElement(Builder),
        Visibility = react.createElement(Visibility),
        Character = react.createElement(Character),
        Slots = react.createElement(Slots),
        Pings = react.createElement(Pings),
        Logs = react.createElement(Logs),
        Messages = react.createElement(Messages),
        Lighting = react.createElement(Lighting),
    })
end)