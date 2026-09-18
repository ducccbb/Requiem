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
--File: ReplicatedStorage.Packages._Index.jsdotlua_shared@17.2.1.shared.ReactFiberHostConfig.WithNoTestSelectors
--                              Dumped in 0.000122 seconds
--                          Bytecode version 9  |  2 functions

local invariant = require(script.Parent.Parent:WaitForChild("invariant"))
local function shim(...) -- Line: 16 -- upvalues: invariant (val)
    invariant(false, "The current renderer does not support test selectors. This error is likely caused by a bug in React. Please file an issue.")
end
return {
    supportsTestSelectors = false,
    findFiberRoot = shim,
    getBoundingRect = shim,
    getTextContent = shim,
    isHiddenSubtree = shim,
    matchAccessibilityRole = shim,
    setFocusIfFocusable = shim,
    setupIntersectionObserver = shim,
}