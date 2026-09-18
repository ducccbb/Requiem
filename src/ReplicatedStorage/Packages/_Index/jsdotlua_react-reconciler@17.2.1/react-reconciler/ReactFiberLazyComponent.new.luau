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
--File: ReplicatedStorage.Packages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactFiberLazyComponent.new
--                              Dumped in 0.000175 seconds
--                          Bytecode version 9  |  2 functions

return {
    resolveDefaultProps = function(p1, p2) -- Line: 14
        local defaultProps
        if not p1 or typeof(p1) ~= "table" or not p1.defaultProps then
            return p2
        end
        local v1 = table.clone(p2)
        defaultProps = p1.defaultProps
        local v2 = defaultProps
        local v3 = nil
        local v4 = nil
        for i, j in v2, v3, v4 do
            if v1[i] == nil then
                v1[i] = defaultProps[i]
            end
        end
        return v1
    end,
}