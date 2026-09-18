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
--File: ReplicatedStorage.Packages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler
--                              Dumped in 0.000172 seconds
--                          Bytecode version 9  |  2 functions

require(script:WaitForChild("ReactInternalTypes"))
require(script:WaitForChild("ReactRootTags"))
return function(p1) -- Line: 28
    local ReactFiberHostConfig = require(script:WaitForChild("ReactFiberHostConfig"))
    local v1 = p1
    local v2 = nil
    local v3 = nil
    for i, j in v1, v2, v3 do
        ReactFiberHostConfig[i] = j
    end
    return require(script:WaitForChild("ReactFiberReconciler"))
end