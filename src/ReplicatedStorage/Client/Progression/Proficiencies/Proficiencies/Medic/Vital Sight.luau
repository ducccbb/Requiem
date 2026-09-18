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
--File: ReplicatedStorage.Client.Progression.Proficiencies.Proficiencies.Medic.Vital Sight
--                              Dumped in 0.000512 seconds
--                          Bytecode version 9  |  4 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Character = require(Utilities:WaitForChild("Character"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Network = Common_2:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
require(Namespaces:WaitForChild("Vitality"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_3:WaitForChild("Client")
local User = Client:WaitForChild("User")
local Miscellaneous = User:WaitForChild("Miscellaneous")
local ClientSenseRunner = require(Miscellaneous:WaitForChild("ClientSenseRunner"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Alive = require(Common_3:WaitForChild("Alive"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_5:WaitForChild("Common")
local Types = Common_4:WaitForChild("Types")
require(Types:WaitForChild("Sense"))
local u116 = Color3.fromRGB(255, 255, 255)
local u121 = Color3.fromRGB(255, 209, 166)
local u126 = Color3.fromRGB(255, 116, 116)
local function getHealthColor(p1) -- Line: 39 -- upvalues: u126 (val), u121 (val), u116 (val)
    local v1 = math.clamp(p1, 0, 1)
    if v1 <= 0.5 then
        return u126:Lerp(u121, v1 / 0.5)
    end
    return u121:Lerp(u116, (v1 - 0.5) / 0.5)
end
return {
    requested = function(p1) -- Line: 53 -- upvalues: Character (val), Alive (val), getHealthColor (val), ClientSenseRunner (val)
        local v1, v2, v3
        if not (Character.getCharacter()) then
            return
        end
        local v4 = {
            radius = 300,
            duration = 1.5,
            indicator = true,
            hold = 4,
            objects = {},
            color = Color3.fromRGB(255, 255, 255),
        }
        for k, v in pairs(p1) do
            v2 = tonumber(k)
            if v2 then
                v3 = Alive.getAliveCharacterById(v2)
                if v3 then
                    v1 = v.health / v.maxHealth
                    table.insert(v4.objects, {instance = v3, color = getHealthColor(v1), fillTransparency = math.lerp(0.5, 1, v1), outlineTransparency = math.lerp(0, 1, v1)})
                end
            end
        end
        ClientSenseRunner.onRevealSense(v4)
    end,
    activated = function() end,
    settings = {},
}