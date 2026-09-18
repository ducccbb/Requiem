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
--                     File: ReplicatedStorage.Common.Types.Prefabs
--                              Dumped in 0.000313 seconds
--                          Bytecode version 9  |  2 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v2 = {}
local Assets = ReplicatedStorage:WaitForChild("Assets")
local Prefabs = Assets:WaitForChild("Prefabs")
local v3 = {name = "Test", time = 10, health = 10}
local v4 = {}
v4["Wooden Log"] = 2
v3.materials = v4
v2.Test = v3
v3 = {
    name = "Campfire",
    time = 10,
    health = 10,
    sink = -1,
    marker = true,
    no_save = true,
    lifetime = 600,
}
v4 = {}
v4["Wooden Log"] = 15
v3.materials = v4
v2.Campfire = v3
return {
    Prefabs = v2,
    getPrefabModelByName = function(p1) -- Line: 70 -- upvalues: Prefabs (val)
        for k, v in pairs(Prefabs:GetChildren()) do
            for k2, i in pairs(v:GetChildren()) do
                if i.Name == v1 then
                    return i
                end
            end
        end
        return nil
    end,
}