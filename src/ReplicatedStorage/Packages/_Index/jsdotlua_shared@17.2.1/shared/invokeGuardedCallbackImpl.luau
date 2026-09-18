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
--File: ReplicatedStorage.Packages._Index.jsdotlua_shared@17.2.1.shared.invokeGuardedCallbackImpl
--                              Dumped in 0.000197 seconds
--                          Bytecode version 9  |  2 functions

local describeError = require(script.Parent:WaitForChild("ErrorHandling.roblox")).describeError
return function(p1, p2, p3, p4, ...) -- Line: 15 -- upvalues: describeError (val)
    local v1
    local v2 = nil
    if _G.__YOLO__ then
        v1 = true
        if p4 ~= nil then
            p3(p4, ...)
        else
            p3(...)
        end
    else
        local v3, v4
        if p4 ~= nil then
            v3, v4 = xpcall(p3, describeError, p4, ...)
            v1 = v3
            v2 = v4
        else
            v3, v4 = xpcall(p3, describeError, ...)
            v1 = v3
            v2 = v4
        end
    end
    if not v1 then
        p1.onError(v2)
    end
end