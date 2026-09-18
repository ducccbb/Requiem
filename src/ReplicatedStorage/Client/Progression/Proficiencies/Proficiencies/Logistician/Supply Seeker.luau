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
--File: ReplicatedStorage.Client.Progression.Proficiencies.Proficiencies.Logistician.Supply Seeker
--                              Dumped in 0.000560 seconds
--                          Bytecode version 9  |  3 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local CollectionService = game:GetService("CollectionService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Character = require(Utilities:WaitForChild("Character"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_2:WaitForChild("Client")
local User = Client:WaitForChild("User")
local Miscellaneous = User:WaitForChild("Miscellaneous")
local ClientSenseRunner = require(Miscellaneous:WaitForChild("ClientSenseRunner"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Types = Common_2:WaitForChild("Types")
require(Types:WaitForChild("Sense"))
local v2 = {}
local u83 = Color3.fromRGB(255, 204, 204)
local u88 = Color3.fromRGB(255, 225, 196)
local u93 = Color3.fromRGB(225, 255, 229)
local function getFullnessColor(p1) -- Line: 37 -- upvalues: u83 (val), u88 (val), u93 (val)
    local v1 = math.clamp(p1, 0, 1)
    if v1 <= 0.5 then
        return u83:Lerp(u88, v1 / 0.5)
    end
    return u88:Lerp(u93, (v1 - 0.5) / 0.5)
end
local v3 = {}
function v3.activated() -- Line: 48 -- upvalues: Character (val), CollectionService (val), getFullnessColor (val), ClientSenseRunner (val)
    local Attribute, v1, v2
    local v3 = Character.getCharacter()
    if not v3 then
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
    local v5 = CollectionService:GetTagged("Interaction")
    local v6 = nil
    local v7 = nil
    for i, j in v5, v6, v7 do
        if j:IsA("BasePart") and v4.radius >= (v3.HumanoidRootPart.Position - j.Position).Magnitude then
            v2 = j:GetAttribute("MaxAmount")
            Attribute = j:GetAttribute("Amount")
            if v2 and Attribute and typeof(v2) == "number" and typeof(Attribute) == "number" then
                if 0 >= v2 then
                    v1 = 0
                else
                    v1 = Attribute / v2
                end
                table.insert(v4.objects, {instance = j.Parent, color = getFullnessColor(v1)})
            end
        end
    end
    ClientSenseRunner.onRevealSense(v4)
end
v3.settings = v2
return v3