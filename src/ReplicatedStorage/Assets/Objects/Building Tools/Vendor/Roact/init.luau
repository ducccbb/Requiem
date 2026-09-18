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
--          File: ReplicatedStorage.Assets.Objects.Building Tools.Vendor.Roact
--                              Dumped in 0.000267 seconds
--                          Bytecode version 9  |  1 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local GlobalConfig = require(v1.GlobalConfig)
local createReconciler = require(v1.createReconciler)
local createReconcilerCompat = require(v1.createReconcilerCompat)
local RobloxRenderer = require(v1.RobloxRenderer)
local strict = require(v1.strict)
local Binding = require(v1.Binding)
local v3 = createReconciler(RobloxRenderer)
local v4 = createReconcilerCompat(v3)
local v5 = {
    Component = require(v1.Component),
    createElement = require(v1.createElement),
    createFragment = require(v1.createFragment),
    oneChild = require(v1.oneChild),
    PureComponent = require(v1.PureComponent),
    None = require(v1.None),
    Portal = require(v1.Portal),
    createRef = require(v1.createRef),
    createBinding = Binding.create,
    joinBindings = Binding.join,
    createContext = require(v1.createContext),
    Change = require(v1.PropMarkers.Change),
    Children = require(v1.PropMarkers.Children),
    Event = require(v1.PropMarkers.Event),
    Ref = require(v1.PropMarkers.Ref),
    mount = v3.mountVirtualTree,
    unmount = v3.unmountVirtualTree,
    update = v3.updateVirtualTree,
    reify = v4.reify,
    teardown = v4.teardown,
    reconcile = v4.reconcile,
    setGlobalConfig = GlobalConfig.set,
    UNSTABLE = {},
}
return (strict(v5))