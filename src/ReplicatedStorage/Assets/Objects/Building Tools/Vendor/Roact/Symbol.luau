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
--       File: ReplicatedStorage.Assets.Objects.Building Tools.Vendor.Roact.Symbol
--                              Dumped in 0.000170 seconds
--                          Bytecode version 9  |  3 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
v1 = {}
function v1.named(p1) -- Line: 23
    local v1 = type(p1) == "string"
    assert(v1, "Symbols must be created using a string name!")
    local v2 = newproxy(true)
    local u18 = ("Symbol(%s)"):format(p1)
    local v3 = getmetatable(v2)
    function v3.__tostring() -- Line: 30 -- upvalues: u18 (val)
        return u18
    end
    return v2
end
return v1