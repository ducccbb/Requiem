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
--File: ReplicatedStorage.Packages._Index.pysephwasntavailable_roact-constant-fork@1.5.0.roact-constant-fork.invalidSetStateMessages
--                              Dumped in 0.000125 seconds
--                          Bytecode version 9  |  1 functions

local ComponentLifecyclePhase = require(script.Parent.ComponentLifecyclePhase)
local v1 = {}
v1[ComponentLifecyclePhase.WillUpdate] = "setState cannot be used in the willUpdate lifecycle method.\nConsider using the didUpdate method instead, or using getDerivedStateFromProps.\n\nCheck the definition of willUpdate in the component %q."
v1[ComponentLifecyclePhase.ShouldUpdate] = "setState cannot be used in the shouldUpdate lifecycle method.\nshouldUpdate must be a pure function that only depends on props and state.\n\nCheck the definition of shouldUpdate in the component %q."
v1[ComponentLifecyclePhase.Render] = "setState cannot be used in the render method.\nrender must be a pure function that only depends on props and state.\n\nCheck the definition of render in the component %q."
v1.default = "setState can not be used in the current situation, because Roact doesn't know\nwhich part of the lifecycle this component is in.\n\nThis is a bug in Roact.\nIt was triggered by the component %q.\n"
return v1