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
-- File: ReplicatedStorage.Assets.Objects.Building Tools.Libraries.Cryo.List.removeRange
--                              Dumped in 0.000276 seconds
--                          Bytecode version 9  |  2 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
return function(p1, p2, p3) -- Line: 11
    local v1 = p2 <= p3
    assert(v1, "startIndex must be less than or equal to endIndex")
    local v2 = {}
    v1 = 1
    local v3 = math.min(#p1, p2 - 1)
    local v4 = 1
    for i = 1, v3, v4 do
        v2[v1] = p1[i]
        v1 = v1 + 1
    end
    v3 = #p1
    v4 = 1
    for j = p3 + 1, v3, v4 do
        v2[v1] = p1[j]
        v1 = v1 + 1
    end
    return v2
end