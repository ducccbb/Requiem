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
--File: ReplicatedStorage.Packages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactFiberHotReloading.new
--                              Dumped in 0.000207 seconds
--                          Bytecode version 9  |  6 functions

require(script.Parent.Parent:WaitForChild("shared"))
require(script.Parent:WaitForChild("ReactInternalTypes"))
return {
    resolveFunctionForHotReloading = function(p1) -- Line: 82
        if _G.__DEV__ then
            return p1
        end
        return p1
    end,
    resolveClassForHotReloading = function(p1) -- Line: 100
        if _G.__DEV__ then
            return p1
        end
        return p1
    end,
    resolveForwardRefForHotReloading = function(p1) -- Line: 106
        if _G.__DEV__ then
            return p1
        end
        return p1
    end,
    isCompatibleFamilyForHotReloading = function(p1, p2) -- Line: 144
        warn("isCompatibleFamilyForHotReloading is stubbed (returns false)")
        return false
    end,
    markFailedErrorBoundaryForHotReloading = function(p1) -- Line: 224
        if _G.__DEV__ then
            return
        end
    end,
}