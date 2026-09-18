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
--        File: ReplicatedStorage.Client.User.Character.CharacterAccessoryHandler
--                              Dumped in 0.000780 seconds
--                          Bytecode version 9  |  6 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Assets = game:GetService("ReplicatedStorage"):WaitForChild("Assets")
local Objects = Assets:WaitForChild("Objects")
local Accessories = Assets:WaitForChild("Accessories")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Player = require(Namespaces:WaitForChild("Player"))
local State = script.Parent.Parent:WaitForChild("State")
local ClientSettingsHandler = require(State:WaitForChild("ClientSettingsHandler"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Utilities = Common_2:WaitForChild("Utilities")
local Character = require(Utilities:WaitForChild("Character"))
local u83 = {}
local u84 = nil
local function doesAccessoryHaveADropSet(p1) -- Line: 34 -- upvalues: Objects (val)
    local AccessorySets = Objects:WaitForChild("AccessorySets")
    local v1 = AccessorySets:FindFirstChild("Dropped" .. p1:gsub("attachment_", "")) ~= nil
    return v1
end
local function getEquippedAccessories() -- Line: 50 -- upvalues: Character (val), doesAccessoryHaveADropSet (val), Accessories (val), u83 (val), u84 (ref)
    local v1, v2
    local v3 = Character.getCharacter()
    if not v3 then
        return
    end
    local function normalizeChildName(p1) -- Line: 56
        return p1:gsub("attachment_", "")
    end
    for i, j in v3:GetDescendants() do
        if j:HasTag("Accessory") then
            v1 = normalizeChildName(j.Name)
            if doesAccessoryHaveADropSet(v1) then
                v2 = Accessories:FindFirstChild(v1)
                u83[v2] = v2
            end
        end
    end
    if u84 then
        return u83
    end
    u84 = v3.ChildRemoved:Connect(function(p1) -- Line: 81 -- upvalues: normalizeChildName (val), Accessories (upval), u83 (upval)
        if p1:HasTag("Accessory") then
            local v1 = normalizeChildName(p1.Name)
            local v2 = Accessories:FindFirstChild(v1)
            u83[v2] = nil
        end
    end)
    return u83
end
ClientSettingsHandler.onKeybindPressed("Remove Gear"):Connect(function() -- Line: 99 -- upvalues: getEquippedAccessories (val), u83 (val), Player (val)
    getEquippedAccessories()
    local v1 = u83
    local v2 = nil
    local v3 = nil
    for i, j in v1, v2, v3 do
        Player.DropAccessory.post(i)
    end
end)
return {}