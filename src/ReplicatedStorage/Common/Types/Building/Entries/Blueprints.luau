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
--           File: ReplicatedStorage.Common.Types.Building.Entries.Blueprints
--                              Dumped in 0.000201 seconds
--                          Bytecode version 9  |  1 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local Categories = v1.Parent.Parent:WaitForChild("Categories")
local Blueprints = require(Categories:WaitForChild("Blueprints"))
local Placeables = require(v1.Parent.Parent:WaitForChild("Placeables"))
local v3 = Placeables.createPlaceableSystem("Blueprints", Blueprints)
Placeables.registerPlaceableSystem("Blueprints", v3)
return {
    Blueprints = v3.items,
    getBlueprint = v3.getItem,
    getBlueprintModel = v3.getItemModel,
    getBlueprintDirectoryFromPath = v3.getItemDirectoryFromPath,
    convertBlueprintsToCategorical = v3.convertItemsToCategorical,
    createSandboxBlueprints = v3.createCategorical,
}