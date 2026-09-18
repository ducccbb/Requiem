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
--     File: ReplicatedStorage.Packages._Index.csqrl_sift@0.0.11.sift.Array.shuffle
--                              Dumped in 0.000168 seconds
--                          Bytecode version 9  |  2 functions

local copy = require(script.Parent.copy)
return function(p1) -- Line: 19 -- upvalues: copy (val)
    local v1, v2
    local v3 = Random.new(os.time() * #p1)
    local v4 = copy(p1)
    local v5 = 1
    local v6 = -1
    for i = #v4, v5, v6 do
        v1 = v3:NextInteger(1, i)
        v2 = v4[i]
        v4[i] = v4[v1]
        v4[v1] = v2
    end
    return v4
end