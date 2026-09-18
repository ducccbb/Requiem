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
--           File: ReplicatedStorage.Common.Types.Building.Entries.Schematics
--                              Dumped in 0.000291 seconds
--                          Bytecode version 9  |  1 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local Placeables = require(v1.Parent.Parent:WaitForChild("Placeables"))
local Categories = v1.Parent.Parent:WaitForChild("Categories")
local Schematics = require(Categories:WaitForChild("Schematics"))
local v3 = Placeables.createPlaceableSystem("Schematics", Schematics)
Placeables.registerPlaceableSystem("Schematics", v3)
return {
    Schematics = v3.items,
    getSchematic = v3.getItem,
    getSchematicModel = v3.getItemModel,
    getSchematicDirectoryFromPath = v3.getItemDirectoryFromPath,
    convertSchematicsItemsToCategorical = v3.convertItemsToCategorical,
    createSchematics = v3.createCategorical,
}