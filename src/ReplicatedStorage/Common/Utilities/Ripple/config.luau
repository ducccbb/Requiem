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
--                File: ReplicatedStorage.Common.Utilities.Ripple.config
--                              Dumped in 0.000169 seconds
--                          Bytecode version 9  |  1 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
return {
    spring = {
        default = {tension = 170, friction = 26},
        gentle = {tension = 120, friction = 14},
        wobbly = {tension = 180, friction = 12},
        stiff = {tension = 210, friction = 20},
        slow = {tension = 280, friction = 60},
        molasses = {tension = 280, friction = 120},
    },
    linear = {
        default = {speed = 1},
    },
    tween = {
        default = {
            time = 1,
            repeatCount = 0,
            reverses = false,
            delayTime = 0,
            style = Enum.EasingStyle.Quad,
            direction = Enum.EasingDirection.Out,
        },
    },
}