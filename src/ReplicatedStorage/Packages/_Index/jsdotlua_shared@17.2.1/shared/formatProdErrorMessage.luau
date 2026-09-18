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
--File: ReplicatedStorage.Packages._Index.jsdotlua_shared@17.2.1.shared.formatProdErrorMessage
--                              Dumped in 0.000184 seconds
--                          Bytecode version 9  |  2 functions

local HttpService = game:GetService("HttpService")
return function(p1, ...) -- Line: 17 -- upvalues: HttpService (val)
    local v1 = "https://reactjs.org/docs/error-decoder.html?invariant=" .. tostring(p1)
    local v2 = select("#", ...)
    local v3 = 1
    for i = 1, v2, v3 do
        v1 = v1 .. "&args[]=" .. HttpService:UrlEncode(select(i, ...))
    end
    return string.format("Minified React error #%d; visit %s for the full message or use the non-minified dev environment for full errors and additional helpful warnings.", p1, v1)
end