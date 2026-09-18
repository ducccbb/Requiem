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
--              File: ReplicatedStorage.Client.Interfaces.Hooks.useProfile
--                              Dumped in 0.000504 seconds
--                          Bytecode version 9  |  6 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Promise = require(Common:WaitForChild("Promise"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_2:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local useAsyncEffect = require(script.Parent:WaitForChild("useAsyncEffect"))
local u54 = {}
local u55 = {}
return function() -- Line: 28 -- upvalues: react (val), useAsyncEffect (val), u54 (val), u55 (val), Promise (val), Players (val)
    local u13, u4, u9, v1, v2, v3
    v1, u4 = react.useState(nil)
    v2, u9 = react.useState("")
    u13, v3 = react.useState(0)
    useAsyncEffect(function() -- Line: 33 -- upvalues: u54 (upval), u13 (val), u55 (upval), u4 (val), u9 (val), Promise (upval), Players (upval)
        if not (u54[tostring(u13)]) or not (u55[tostring(u13)]) then
            return Promise.new(function(p1, p2) -- Line: 41 -- upvalues: u4 (upval), Players (upval), u13 (upval), u9 (upval), u54 (upval), u55 (upval)
                local v1, v2
                u4(nil)
                v1, v2 = pcall(function() -- Line: 44 -- upvalues: Players (upval), u13 (upval)
                    local v1 = tonumber(u13)
                    return Players:GetUserThumbnailAsync(v1, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
                end)
                if not v1 then
                    p2(v2)
                    return
                end
                local NameFromUserIdAsync = Players:GetNameFromUserIdAsync(u13)
                u4(v2)
                u9(NameFromUserIdAsync)
                u54[tostring(u13)] = v2
                u55[tostring(u13)] = NameFromUserIdAsync
                p1()
            end):catch(function() end)
        end
        u4(u54[tostring(u13)])
        u9(u55[tostring(u13)])
    end, {u13})
    return v3, v1, v2
end