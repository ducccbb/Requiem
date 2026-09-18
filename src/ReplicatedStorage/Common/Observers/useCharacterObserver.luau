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
--             File: ReplicatedStorage.Common.Observers.useCharacterObserver
--                              Dumped in 0.000913 seconds
--                          Bytecode version 9  |  8 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Players = game:GetService("Players")
local Character = require(script.Parent.Parent:WaitForChild("Logger"))("Character")
local u28 = {}
local u29 = {}
local u30 = {}
local function u31(p1, p2, p3) -- Line: 72 -- upvalues: Character (val), Players (val), u28 (val), u29 (val), u30 (val)
    local v1
    if not p1 then
        warn("useCharacterObserver : No callback provided")
    end
    Character.info("useCharacterObserver : Trying to observe the character")
    local LocalPlayer = p2
    if not LocalPlayer then
        LocalPlayer = Players.LocalPlayer
    end
    if p3 and u28[LocalPlayer] and u28[LocalPlayer][p3] then
        Character.info("useCharacterObserver : Cleaning up existing observer with ID" .. " " .. p3)
        u28[LocalPlayer][p3]()
        local v2 = u28[LocalPlayer]
        v2[p3] = nil
        if u29[LocalPlayer] and u29[LocalPlayer][p3] then
            v2 = u29[LocalPlayer]
            v2[p3] = nil
        end
        if u30[LocalPlayer] and u30[LocalPlayer][p3] then
            v2 = u30[LocalPlayer]
            v2[p3] = nil
        end
    end
    local u78 = nil
    LocalPlayer.CharacterRemoving:Connect(function() -- Line: 124 -- upvalues: u78 (ref), Character (upval)
        if not u78 then
            return
        end
        u78()
        Character.info("useCharacterObserver : Cleaning up the observer")
    end)
    if LocalPlayer.Character then
        v1 = p1(LocalPlayer.Character)
        Character.info("useCharacterObserver : Character observed")
        if typeof(v1) == "function" then
            u78 = v1
        end
    end
    local u87 = LocalPlayer.CharacterAdded:Connect(function(a1) -- Line: 145 -- upvalues: p1 (val), Character (upval), u78 (ref)
        local v1 = p1(a1)
        Character.info("useCharacterObserver : Character observed")
        if typeof(v1) == "function" then
            u78 = v1
        end
    end)
    function v1() -- Line: 156 -- upvalues: Character (upval), u87 (ref), u78 (ref), p3 (val), u28 (upval), LocalPlayer (val), u29 (upval), u30 (upval)
        Character.info("useCharacterObserver : Disconnecting the character observer")
        u87:Disconnect()
        if u78 then
            u78()
            Character.info("useCharacterObserver : Cleaning up the observer")
        end
        if p3 then
            local v1, v2
            if u28[LocalPlayer] then
                v2 = u28[LocalPlayer]
                if v2[p3] then
                    v1 = u28[LocalPlayer]
                    v1[p3] = nil
                end
            end
            if u29[LocalPlayer] then
                v2 = u29[LocalPlayer]
                if v2[p3] then
                    v1 = u29[LocalPlayer]
                    v1[p3] = nil
                end
            end
            if u30[LocalPlayer] then
                v2 = u30[LocalPlayer]
                if v2[p3] then
                    v1 = u30[LocalPlayer]
                    v1[p3] = nil
                end
            end
        end
    end
    if p3 then
        if not (u28[LocalPlayer]) then
            u28[LocalPlayer] = {}
        end
        u28[LocalPlayer][p3] = v1
        if not (u29[LocalPlayer]) then
            u29[LocalPlayer] = {}
        end
        u29[LocalPlayer][p3] = p1
        if not (u30[LocalPlayer]) then
            u30[LocalPlayer] = {}
        end
        u30[LocalPlayer][p3] = function(p1, p2) -- Line: 113 -- upvalues: u78 (ref)
            if p2 and u78 and typeof(u78) == "function" then
                pcall(u78)
            end
            u78 = p1
        end
    end
    return v1
end
local v2 = {}
function v2.retriggerObservers(p1) -- Line: 217 -- upvalues: Players (val), Character (val), u29 (val), u30 (val)
    local v1, v2
    local LocalPlayer = p1
    if not LocalPlayer then
        LocalPlayer = Players.LocalPlayer
    end
    if not LocalPlayer.Character then
        Character.info("retriggerObservers : Player has no character")
        return
    end
    local v3 = u29[LocalPlayer]
    if not v3 then
        Character.info("retriggerObservers : No observers found for player")
        return
    end
    local v4 = u30[LocalPlayer]
    if not v4 then
        Character.info("retriggerObservers : No cleanup updaters found for player")
        return
    end
    for k, v in pairs(v3) do
        Character.info("retriggerObservers : Retriggering observer " .. k)
        v2 = v4[k]
        if v2 then
            v2(nil, true)
            v1 = v(LocalPlayer.Character)
            v2(v1, false)
        end
    end
    Character.info("retriggerObservers : All observers retriggered")
end
local v3 = {
    __call = function(p1, ...) -- Line: 268 -- upvalues: u31 (val)
        return u31(...)
    end,
}
return (setmetatable(v2, v3))