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
--File: ReplicatedStorage.Packages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactTestSelectors
--                              Dumped in 0.000171 seconds
--                          Bytecode version 9  |  2 functions

require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local supportsTestSelectors = require(script.Parent:WaitForChild("ReactFiberHostConfig")).supportsTestSelectors
local v1 = {}
local u19 = {}
function v1.onCommitRoot() -- Line: 511 -- upvalues: supportsTestSelectors (val), u19 (val)
    if supportsTestSelectors then
        local v1 = u19
        local v2 = nil
        local v3 = nil
        for i, j in v1, v2, v3 do
            j()
        end
    end
end
return v1