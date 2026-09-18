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
--   File: ReplicatedStorage.Common.Utilities.RaycastHitboxV4.Solvers.LinkAttachments
--                              Dumped in 0.000232 seconds
--                          Bytecode version 9  |  4 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
return {
    Solve = function(p1, p2) -- Line: 16
        return p2.Instances[1].WorldPosition, p2.Instances[2].WorldPosition - p2.Instances[1].WorldPosition
    end,
    UpdateToNextPosition = function(p1, p2) -- Line: 23
        return p2.Instances[1].WorldPosition
    end,
    Visualize = function(p1, p2) -- Line: 27
        return CFrame.lookAt(p2.Instances[1].WorldPosition, p2.Instances[2].WorldPosition)
    end,
}