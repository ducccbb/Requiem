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
--                   File: ReplicatedStorage.Common.Animations.Animals
--                              Dumped in 0.000198 seconds
--                          Bytecode version 9  |  1 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
return {
    Wolf = {
        Default = {
            Idle = "rbxassetid://126748434556481",
            Walk = "rbxassetid://138069651089316",
            Run = "rbxassetid://94483273184404",
            Bite = "rbxassetid://107468245432445",
            Lunge = "rbxassetid://134848247824555",
            Retreat = "rbxassetid://134399817147019",
            Death = "rbxassetid://91463019595968",
            IdleActions = {"rbxassetid://107638305019742", "rbxassetid://84722558756315"},
            Slash = {Left = "rbxassetid://115073212776225"},
            StrafeBegin = {Right = "rbxassetid://121559029544027", Left = "rbxassetid://83613818787769"},
            Strafes = {Right = "rbxassetid://118045949722110", Left = "rbxassetid://121328988996387"},
            Stuns = {"rbxassetid://130029873979701", "rbxassetid://106596770844327"},
        },
    },
    Bear = {
        Default = {
            Idle = "rbxassetid://112040901548419",
            Walk = "rbxassetid://87438758464369",
            Run = "rbxassetid://87438758464369",
            Maul = "rbxassetid://86065122191059",
            Hit = "rbxassetid://122963338647637",
            Knock = "rbxassetid://80602326604831",
            Death = "rbxassetid://130574184682220",
            PlayerGrabbed = "rbxassetid://139829182021807",
            Attacks = {Slam = "rbxassetid://139943912092898", Bite1 = "rbxassetid://103176679487198", Bite2 = "rbxassetid://81290764810651"},
            Strafes = {Left = "rbxassetid://139403413174679", Right = "rbxassetid://100793462134542"},
        },
    },
}