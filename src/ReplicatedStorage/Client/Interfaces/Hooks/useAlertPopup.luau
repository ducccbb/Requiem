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
--             File: ReplicatedStorage.Client.Interfaces.Hooks.useAlertPopup
--                              Dumped in 0.000229 seconds
--                          Bytecode version 9  |  3 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Providers = script.Parent.Parent:WaitForChild("Providers")
local AlertPopupProvider = require(Providers:WaitForChild("AlertPopupProvider"))
return function(p1) -- Line: 14 -- upvalues: AlertPopupProvider (val)
    return function(a1, p2, p3) -- Line: 15 -- upvalues: AlertPopupProvider (upval), p1 (val)
        AlertPopupProvider.Signal:Fire(a1, p2, p1, p3)
    end
end