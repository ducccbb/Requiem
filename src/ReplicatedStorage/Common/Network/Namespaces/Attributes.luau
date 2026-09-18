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
--             File: ReplicatedStorage.Common.Network.Namespaces.Attributes
--                              Dumped in 0.000155 seconds
--                          Bytecode version 9  |  1 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local Compressions = v1.Parent.Parent:WaitForChild("Compressions")
local Stores = Compressions:WaitForChild("Stores")
local Attributes = require(Stores:WaitForChild("Attributes"))
local Parent = require(v1.Parent.Parent)
local v3 = Parent.store().struct(Parent.any).id("9SqCwMkM")
v3.defer()
Parent.registerStoreCompressor(v3.seed, Attributes.compress, Attributes.decompress)
return {Store = v3}