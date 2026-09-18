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
--File: ReplicatedStorage.Packages._Index.jsdotlua_shared@17.2.1.shared.ReactSharedInternals
--                              Dumped in 0.000278 seconds
--                          Bytecode version 9  |  4 functions

local v1
local console = require(script.Parent.Parent:WaitForChild("luau-polyfill")).console
local function onlyInTestError(p1) -- Line: 26 -- upvalues: console (val)
    return function() -- Line: 27 -- upvalues: console (upval), p1 (val)
        console.error(p1 .. " is only available in tests, not in production")
    end
end
local ReactCurrentDispatcher = require(script:WaitForChild("ReactCurrentDispatcher"))
local ReactCurrentBatchConfig = require(script:WaitForChild("ReactCurrentBatchConfig"))
local ReactCurrentOwner = require(script:WaitForChild("ReactCurrentOwner"))
local ReactDebugCurrentFrame = require(script:WaitForChild("ReactDebugCurrentFrame"))
local IsSomeRendererActing = require(script:WaitForChild("IsSomeRendererActing"))
local v2 = {ReactCurrentDispatcher = ReactCurrentDispatcher, ReactCurrentBatchConfig = ReactCurrentBatchConfig, ReactCurrentOwner = ReactCurrentOwner, IsSomeRendererActing = IsSomeRendererActing}
if not _G.__DEV__ then
    v1 = {
        setExtraStackFrame = function(p1) end,
    }
else
    v1 = ReactDebugCurrentFrame
end
v2.ReactDebugCurrentFrame = v1
return v2