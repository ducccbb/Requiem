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
--  File: ReplicatedStorage.Packages._Index.pyseph_packetprofiler@2.3.0.packetprofiler
--                              Dumped in 0.000194 seconds
--                          Bytecode version 9  |  1 functions

local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
if RunService:IsStudio() then
    return nil
end
local Packages = require(script.Modules.Packages)
local Roact = require(Packages.Directory.Roact)
local MainPlugin = require(script.Components.MainPlugin)
local v1 = Roact.createElement(MainPlugin)
Roact.mount(v1, Players.LocalPlayer.PlayerGui, "PacketProfiler")
return nil