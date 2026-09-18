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
--File: ReplicatedStorage.Assets.Objects.Building Tools.Vendor.Roact.ComponentLifecyclePhase
--                              Dumped in 0.000173 seconds
--                          Bytecode version 9  |  1 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local Symbol = require(v1.Parent.Symbol)
local v3 = {
    Init = Symbol.named("init"),
    Render = Symbol.named("render"),
    ShouldUpdate = Symbol.named("shouldUpdate"),
    WillUpdate = Symbol.named("willUpdate"),
    DidMount = Symbol.named("didMount"),
    DidUpdate = Symbol.named("didUpdate"),
    WillUnmount = Symbol.named("willUnmount"),
    ReconcileChildren = Symbol.named("reconcileChildren"),
    Idle = Symbol.named("idle"),
}
return (require(v1.Parent.strict)(v3, "ComponentLifecyclePhase"))