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
--                      File: ReplicatedStorage.Common.Types.Limbs
--                              Dumped in 0.000248 seconds
--                          Bytecode version 9  |  2 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Network = script.Parent.Parent:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
require(Namespaces:WaitForChild("Vitality"))
local function createLimbFromName(p1) -- Line: 14
    return {
        health = 100,
        pain = 0,
        infection = 0,
        bleeding = 0,
        name = p1,
        bandages = {},
        log = {},
        missing = {missing = 0, bleeding = 0, bandaged = 0, timestamp = 0},
    }
end
local v2 = {}
local Head = createLimbFromName("Head")
local Torso = createLimbFromName("Torso")
local v3 = createLimbFromName("Left Arm")
local v4 = createLimbFromName("Right Arm")
local v5 = createLimbFromName("Left Leg")
v2[1] = Head
v2[2] = Torso
v2[3] = v3
v2[4] = v4
v2[5] = v5
v2[6] = createLimbFromName("Right Leg")
return v2