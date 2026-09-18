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
--File: ReplicatedStorage.Packages._Index.jsdotlua_luau-polyfill@1.2.6.luau-polyfill.encodeURIComponent
--                              Dumped in 0.000303 seconds
--                          Bytecode version 9  |  2 functions

local HttpService = game:GetService("HttpService")
local charCodeAt = require(script.Parent.Parent:WaitForChild("string")).charCodeAt
local Error = require(script.Parent:WaitForChild("Error"))
return function(p1) -- Line: 8 -- upvalues: charCodeAt (val), Error (val), HttpService (val)
    local v1 = utf8.len(p1)
    if v1 == 0 or v1 == nil then
        return ""
    end
    local v2 = charCodeAt(p1, 1)
    if v1 == 1 then
        if v2 == 55296 then
            error(Error.new("URI malformed"))
        end
        if v2 == 57343 then
            error(Error.new("URI malformed"))
        end
    end
    if 56320 <= v2 and v2 < 57343 then
        error(Error.new("URI malformed"))
    end
    local v3 = HttpService:UrlEncode(p1):gsub("%%2D", "-")
    v3 = v3:gsub("%%5F", "_")
    v3 = v3:gsub("%%2E", ".")
    v3 = v3:gsub("%%21", "!")
    v3 = v3:gsub("%%7E", "~")
    v3 = v3:gsub("%%2A", "*")
    v3 = v3:gsub("%%27", "'")
    v3 = v3:gsub("%%28", "(")
    return (v3:gsub("%%29", ")"))
end