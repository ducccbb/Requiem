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
--       File: ReplicatedStorage.Client.User.Equipment.Tools.Tools.Identification
--                              Dumped in 0.000745 seconds
--                          Bytecode version 9  |  5 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Alive = require(Common:WaitForChild("Alive"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Utilities = Common_2:WaitForChild("Utilities")
local Character = require(Utilities:WaitForChild("Character"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_3:WaitForChild("Packages")
local trove = require(Packages:WaitForChild("trove"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_4:WaitForChild("Client")
local Interfaces = Client:WaitForChild("Interfaces")
local Routes = Interfaces:WaitForChild("Routes")
local Interactions = Routes:WaitForChild("Interactions")
local Interaction = require(Interactions:WaitForChild("Interaction"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_5:WaitForChild("Common")
local Types = Common_3:WaitForChild("Types")
local v2 = {description = "A identification card, used for identifying yourself to others.", category = require(Types:WaitForChild("Item")).CATEGORIES.Tool}
local u116 = trove.new()
local u117 = nil
local function removeInteractions() -- Line: 44 -- upvalues: u117 (ref), Interaction (val)
    if not u117 then
        return
    end
    local v1 = Interaction.getCurrentInteraction()
    if not v1 or v1.name ~= "Identification" then
        u117:SetAttribute("Type", nil)
        u117:RemoveTag("Interaction")
        u117 = nil
        return
    end
    if v1.radialMenuOpen then
        return
    end
    u117:SetAttribute("Type", nil)
    u117:RemoveTag("Interaction")
    u117 = nil
end
return {
    equipped = function(p1) -- Line: 65 -- upvalues: u116 (val), RunService (val), Character (val), removeInteractions (val), Alive (val), u117 (ref)
        u116:Clean()
        u116:Add(RunService.RenderStepped:Connect(function() -- Line: 70 -- upvalues: Character (upval), u116 (upval), removeInteractions (upval), Alive (upval), u117 (upval)
            local HumanoidRootPart_2, Magnitude, v1
            local v2 = Character.getCharacter()
            if not v2 then
                u116:Clean()
                return removeInteractions()
            end
            local HumanoidRootPart = v2:FindFirstChild("HumanoidRootPart")
            if not HumanoidRootPart then
                return removeInteractions()
            end
            local v3 = nil
            local huge = math.huge
            for i, v in ipairs(Alive.getPlayers()) do
                v1 = Alive.getAliveCharacter(v)
                if v1 and v1 ~= v2 then
                    HumanoidRootPart_2 = v1:FindFirstChild("HumanoidRootPart")
                    if HumanoidRootPart_2 then
                        Magnitude = (HumanoidRootPart.Position - HumanoidRootPart_2.Position).Magnitude
                        if Magnitude <= 10 and Magnitude < huge then
                            huge = Magnitude
                            v3 = HumanoidRootPart_2
                        end
                    end
                end
            end
            local v4 = v3
            if not v4 then
                return removeInteractions()
            end
            local v5 = (v2.HumanoidRootPart.Position - v4.Position):Dot(v4.CFrame.LookVector)
            local v6 = 0 < v5
            if not v6 then
                return removeInteractions()
            end
            if v4 ~= u117 then
                removeInteractions()
            end
            v5 = u117
            u117 = v4
            if not v4 then
                if not v4 and v5 then
                    removeInteractions()
                end
                return
            end
            if v5 ~= v4 then
                v4:SetAttribute("Type", "Identification")
                v4:AddTag("Interaction")
                return
            end
            if not v4 and v5 then
                removeInteractions()
            end
        end))
    end,
    unequipped = function() -- Line: 146 -- upvalues: u116 (val), removeInteractions (val)
        u116:Clean()
        removeInteractions()
    end,
    data = v2,
}