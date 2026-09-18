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
--             File: ReplicatedStorage.Common.Types.Building.Entries.Sandbox
--                              Dumped in 0.000307 seconds
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
local Sandbox = require(Categories:WaitForChild("Sandbox"))
local v3 = Placeables.createPlaceableSystem("Sandbox", Sandbox)
Placeables.registerPlaceableSystem("Sandbox", v3)
return {
    Sandbox = v3.items,
    getSandboxItem = v3.getItem,
    getSandboxItemModel = v3.getItemModel,
    getSandboxItemDirectoryFromPath = v3.getItemDirectoryFromPath,
    convertSandboxItemsToCategorical = v3.convertItemsToCategorical,
    createSandbox = v3.createCategorical,
}