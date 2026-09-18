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
--File: ReplicatedStorage.Packages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactFiberWorkInProgress
--                              Dumped in 0.000224 seconds
--                          Bytecode version 9  |  3 functions

local ReactFiberLane = require(script.Parent:WaitForChild("ReactFiberLane"))
local NoLanes = ReactFiberLane.NoLanes
local mergeLanes = ReactFiberLane.mergeLanes
return {
    workInProgressRootSkippedLanes = function(p1) -- Line: 24 -- upvalues: NoLanes (ref)
        if p1 == nil then
            return NoLanes
        end
        NoLanes = p1
        return NoLanes
    end,
    markSkippedUpdateLanes = function(p1) -- Line: 34 -- upvalues: NoLanes (ref), mergeLanes (val)
        NoLanes = mergeLanes(p1, NoLanes)
    end,
}