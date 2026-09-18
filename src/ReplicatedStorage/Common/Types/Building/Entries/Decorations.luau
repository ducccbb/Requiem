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
--           File: ReplicatedStorage.Common.Types.Building.Entries.Decorations
--                              Dumped in 0.000234 seconds
--                          Bytecode version 9  |  1 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local Categories = v1.Parent.Parent:WaitForChild("Categories")
local Decorations = require(Categories:WaitForChild("Decorations"))
local Placeables = require(v1.Parent.Parent:WaitForChild("Placeables"))
local v3 = Placeables.createPlaceableSystem("Decorations", Decorations)
Placeables.registerPlaceableSystem("Decorations", v3)
return {
    Decorations = v3.items,
    getDecoration = v3.getItem,
    getDecorationModel = v3.getItemModel,
    getDecorationDirectoryFromPath = v3.getItemDirectoryFromPath,
    convertDecorationsToCategorical = v3.convertItemsToCategorical,
    createDecorations = v3.createCategorical,
}