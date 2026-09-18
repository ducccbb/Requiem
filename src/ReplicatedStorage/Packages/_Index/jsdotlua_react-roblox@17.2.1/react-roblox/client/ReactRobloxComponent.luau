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
--File: ReplicatedStorage.Packages._Index.jsdotlua_react-roblox@17.2.1.react-roblox.client.ReactRobloxComponent
--                              Dumped in 0.000311 seconds
--                          Bytecode version 9  |  2 functions

local Object = require(script.Parent.Parent.Parent:WaitForChild("luau-polyfill")).Object
local roblox = script.Parent:WaitForChild("roblox")
local RobloxComponentProps = require(roblox:WaitForChild("RobloxComponentProps"))
require(script.Parent:WaitForChild("ReactRobloxHostTypes.roblox"))
return {
    setInitialProperties = RobloxComponentProps.setInitialProperties,
    diffProperties = function(p1, p2, p3, p4, p5) -- Line: 31 -- upvalues: Object (val)
        local v1, v2, v3, v4
        local v5 = nil
        local v6 = p3
        local v7 = nil
        local v8 = nil
        v4, v3 = p4, p3
        for i, j in v6, v7, v8 do
            if v4[i] == nil then
                v1 = v5
                if not v1 then
                    v1 = table.create(2)
                end
                v5 = v1
                table.insert(v5, i)
                table.insert(v5, Object.None)
            end
        end
        v6 = v4
        v7 = nil
        v8 = nil
        for k, n in v6, v7, v8 do
            if v3 == nil then
                v1 = nil
            else
                v1 = v3[k]
            end
            if n ~= v1 then
                v2 = v5
                if not v2 then
                    v2 = table.create(2)
                end
                v5 = v2
                table.insert(v5, k)
                table.insert(v5, n)
            end
        end
        return v5
    end,
    updateProperties = RobloxComponentProps.updateProperties,
    cleanupHostComponent = RobloxComponentProps.cleanupHostComponent,
}