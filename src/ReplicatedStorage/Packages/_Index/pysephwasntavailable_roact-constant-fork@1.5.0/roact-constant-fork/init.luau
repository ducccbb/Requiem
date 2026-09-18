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
--File: ReplicatedStorage.Packages._Index.pysephwasntavailable_roact-constant-fork@1.5.0.roact-constant-fork
--                              Dumped in 0.000210 seconds
--                          Bytecode version 9  |  1 functions

local GlobalConfig = require(script.GlobalConfig)
local createReconciler = require(script.createReconciler)
local createReconcilerCompat = require(script.createReconcilerCompat)
local RobloxRenderer = require(script.RobloxRenderer)
local strict = require(script.strict)
local Binding = require(script.Binding)
local v1 = createReconciler(RobloxRenderer)
local v2 = createReconcilerCompat(v1)
local v3 = {
    Component = require(script.Component),
    createElement = require(script.createElement),
    createFragment = require(script.createFragment),
    oneChild = require(script.oneChild),
    PureComponent = require(script.PureComponent),
    None = require(script.None),
    Portal = require(script.Portal),
    createRef = require(script.createRef),
    forwardRef = require(script.forwardRef),
    createBinding = Binding.create,
    joinBindings = Binding.join,
    createContext = require(script.createContext),
    Change = require(script.PropMarkers.Change),
    Children = require(script.PropMarkers.Children),
    Event = require(script.PropMarkers.Event),
    Constant = require(script.PropMarkers.Constant),
    Ref = require(script.PropMarkers.Ref),
    mount = v1.mountVirtualTree,
    unmount = v1.unmountVirtualTree,
    update = v1.updateVirtualTree,
    reify = v2.reify,
    teardown = v2.teardown,
    reconcile = v2.reconcile,
    setGlobalConfig = GlobalConfig.set,
    UNSTABLE = {},
}
return (strict(v3))