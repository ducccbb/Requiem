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
-- File: ReplicatedStorage.Client.Progression.Enchantments.Enchantments.Epic.Overcharged
--                              Dumped in 0.000237 seconds
--                          Bytecode version 9  |  2 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Lighting = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")
local v2 = {description = "You are able to exert your gear past the known boundaries.", drawbacks = "You have five percent less grapple range when active. Afterwards, you become very ineffective in using gear.", passive = false, upgradable = true}
local v3 = {wall = "Rose", enchantments = {}}
v2.prerequisites = v3
return {
    settings = v2,
    activated = function() -- Line: 29 -- upvalues: Lighting (val), TweenService (val)
        local BloomEffect = Instance.new("BloomEffect")
        BloomEffect.Parent = Lighting
        local v1 = TweenInfo.new(0.5)
        TweenService:Create(BloomEffect, v1, {Intensity = 1, Size = 56, Threshold = 0.5}):Play()
        task.wait(0.5)
        v1 = TweenInfo.new(3)
        TweenService:Create(BloomEffect, v1, {Intensity = 1, Size = 24, Threshold = 2}):Play()
        task.wait(3)
        BloomEffect:Destroy()
    end,
}