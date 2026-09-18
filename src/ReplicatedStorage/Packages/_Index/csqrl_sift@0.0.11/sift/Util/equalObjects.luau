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
--   File: ReplicatedStorage.Packages._Index.csqrl_sift@0.0.11.sift.Util.equalObjects
--                              Dumped in 0.000147 seconds
--                          Bytecode version 9  |  2 functions

require(script.Parent.Parent.Types)
return function(...) -- Line: 20
    local v1 = select(1, ...)
    local v2 = select("#", ...)
    local v3 = 1
    for i = 2, v2, v3 do
        if v1 ~= select(i, ...) then
            return false
        end
    end
    return true
end