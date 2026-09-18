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
--          File: ReplicatedStorage.Packages._Index.csqrl_sift@0.0.11.sift.Set
--                              Dumped in 0.000145 seconds
--                          Bytecode version 9  |  1 functions

local v1 = {
    add = require(script.add),
    copy = require(script.copy),
    count = require(script.count),
    delete = require(script.delete),
    difference = require(script.difference),
    differenceSymmetric = require(script.differenceSymmetric),
    filter = require(script.filter),
    fromArray = require(script.fromArray),
    has = require(script.has),
    intersection = require(script.intersection),
    isSubset = require(script.isSubset),
    isSuperset = require(script.isSuperset),
    map = require(script.map),
    merge = require(script.merge),
    toArray = require(script.toArray),
}
v1.fromList = v1.fromArray
v1.join = v1.merge
v1.subtract = v1.delete
v1.union = v1.merge
return v1