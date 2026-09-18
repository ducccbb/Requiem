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
--File: ReplicatedStorage.Common.Effects.Types.Cutscenes.Keyframes.WallDefenseShiganshina1
--                              Dumped in 0.000212 seconds
--                          Bytecode version 9  |  2 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
return function(p1, p2) -- Line: 8
    if p1 == "NPC2Hook" then
        p2.NPC2Animation.Beam.Enabled = true
        return
    end
    if p1 == "NPC2HookBreak" then
        p2.NPC2Animation.Beam.Enabled = false
        return
    end
    if p1 == "NPC1Hook" then
        p2.NPC1Animation.Beam.Enabled = true
        return
    end
    if p1 == "NPC1HookBreak" then
        p2.NPC1Animation.Beam.Enabled = false
        return
    end
    if p1 == "FOV_45" then
        workspace.CurrentCamera.FieldOfView = 40
        return
    end
    if p1 == "FOV_70" then
        workspace.CurrentCamera.FieldOfView = 70
    end
end