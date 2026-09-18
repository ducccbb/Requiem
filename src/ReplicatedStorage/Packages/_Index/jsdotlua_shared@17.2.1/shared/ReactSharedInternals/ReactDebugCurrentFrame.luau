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
--File: ReplicatedStorage.Packages._Index.jsdotlua_shared@17.2.1.shared.ReactSharedInternals.ReactDebugCurrentFrame
--                              Dumped in 0.000165 seconds
--                          Bytecode version 9  |  3 functions

local u0 = {}
local u1 = nil
function u0.setExtraStackFrame(p1) -- Line: 16 -- upvalues: u1 (ref)
    if _G.__DEV__ then
        u1 = p1
    end
end
if _G.__DEV__ then
    u0.getCurrentStack = nil
    function u0.getStackAddendum() -- Line: 33 -- upvalues: u1 (ref), u0 (val)
        local v1 = ""
        if u1 then
            v1 = v1 .. u1
        end
        local getCurrentStack = u0.getCurrentStack
        if getCurrentStack then
            v1 = v1 .. (getCurrentStack() or "")
        end
        return v1
    end
end
return u0