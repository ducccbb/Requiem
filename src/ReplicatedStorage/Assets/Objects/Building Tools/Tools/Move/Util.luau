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
--         File: ReplicatedStorage.Assets.Objects.Building Tools.Tools.Move.Util
--                              Dumped in 0.000224 seconds
--                          Bytecode version 9  |  3 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local v2 = {}
function v2.TranslatePartsRelativeToPart(p1, p2, p3) -- Line: 8
    local v1 = p2[p1].CFrame:inverse()
    for k, v in pairs(p2) do
        k.CFrame = p1.CFrame * (v1 * v.CFrame)
    end
    for k2, i in pairs(p3) do
        k2.WorldPivot = p1.CFrame * (v1 * i.Pivot)
    end
end
function v2.GetIncrementMultiple(p1, p2) -- Line: 32
    local v1 = p1 % p2
    local v2 = p1 - v1
    local v3 = p1 - v1 + p2
    local v4 = math.abs(p1 - v2)
    if v4 <= math.abs(p1 - v3) then
        return v2
    end
    return v3
end
return v2