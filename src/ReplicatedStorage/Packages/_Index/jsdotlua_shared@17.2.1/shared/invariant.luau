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
--    File: ReplicatedStorage.Packages._Index.jsdotlua_shared@17.2.1.shared.invariant
--                              Dumped in 0.000116 seconds
--                          Bytecode version 9  |  2 functions

local Error = require(script.Parent.Parent:WaitForChild("luau-polyfill")).Error
return function(p1, p2, ...) -- Line: 24 -- upvalues: Error (val)
    if not p1 then
        error(Error(string.format(p2, ...)))
    end
end