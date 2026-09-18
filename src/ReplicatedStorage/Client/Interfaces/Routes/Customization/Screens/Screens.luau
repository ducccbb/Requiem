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
--    File: ReplicatedStorage.Client.Interfaces.Routes.Customization.Screens.Screens
--                              Dumped in 0.000472 seconds
--                          Bytecode version 9  |  5 functions

local u43
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
if game.PlaceId ~= require(Common:WaitForChild("Constants")).Places.Lobby then
    u43 = {}
else
    u43 = {}
    local Types = script.Parent:WaitForChild("Types")
    u43.Arcane = require(Types:WaitForChild("Arcane"))
    if not u43 then
        u43 = {}
    end
end
local u44 = {
    "Tree",
    "Requiem_CreateCharacter_Player",
    "Requiem_CreateCharacter_Ymir",
    "Back",
    "Sand",
    "Sphere",
    "Dimension",
    "Draging",
    "Fog",
    "Infinite",
    "Part",
    "WaterExplosion",
    "Transition",
    "WaterStep",
    "YmirFlashStep",
    "stars",
    "Visuals",
}
local u62 = nil
local function onDeletePathsMap() -- Line: 47 -- upvalues: u44 (val)
    local v1
    local v2 = u44
    local v3 = nil
    local v4 = nil
    for i, j in v2, v3, v4 do
        v1 = workspace:WaitForChild(j, 3)
        if v1 then
            v1:Destroy()
        end
    end
end
return {
    onLoadCustomLoadingScreen = function(p1, p2) -- Line: 69 -- upvalues: onDeletePathsMap (val), u62 (ref), u43 (val)
        onDeletePathsMap()
        u62 = p1
        if u43[p1] then
            u43[p1].onLoad(p2)
        end
    end,
    onPreloadCustomLoadingScreen = function(p1) -- Line: 85 -- upvalues: u43 (val)
        if u43[p1] then
            u43[p1].onPreload()
        end
    end,
    onCancelCustomLoadingScreen = function() -- Line: 59 -- upvalues: u62 (ref), u43 (val)
        if u62 then
            u43[u62].onCancel()
        end
    end,
}