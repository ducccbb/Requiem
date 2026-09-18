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
--       File: ReplicatedStorage.Assets.Objects.Building Tools.Libraries.fastSpawn
--                              Dumped in 0.000190 seconds
--                          Bytecode version 9  |  3 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
return function(p1, ...) -- Line: 12
    local v1 = type(p1) == "function"
    assert(v1)
    local u9 = {...}
    local u14 = select("#", ...)
    local BindableEvent = Instance.new("BindableEvent")
    BindableEvent.Event:Connect(function() -- Line: 19 -- upvalues: p1 (val), u9 (val), u14 (val)
        p1(unpack(u9, 1, u14))
    end)
    BindableEvent:Fire()
    BindableEvent:Destroy()
end