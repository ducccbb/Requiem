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
--       File: ReplicatedStorage.Client.Entities.Titans.Utilities.ModelTitanClient
--                               Dumped in 0.00118 seconds
--                          Bytecode version 9  |  4 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local KinematicTitanClient = require(v1.Parent:WaitForChild("KinematicTitanClient"))
local NapeProtectionTitanClient = require(v1.Parent:WaitForChild("NapeProtectionTitanClient"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Customization = require(Utilities:WaitForChild("Customization"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Network = Common_2:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
require(Namespaces:WaitForChild("Titan"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Types = Common_3:WaitForChild("Types")
local Titan = require(Types:WaitForChild("Titan"))
local function getTitanClientModel(p1) -- Line: 27 -- upvalues: ReplicatedStorage (val)
    local Titans = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Titans")
    local Default = Titans:FindFirstChild(p1)
    if not Default then
        Default = Titans:WaitForChild("Default")
    end
    return Default
end
local function getTitanHair(p1) -- Line: 39 -- upvalues: ReplicatedStorage (val)
    local Hairs = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Titans"):WaitForChild("Hairs")
    return (Hairs:WaitForChild(p1))
end
return {
    onTitanModelCreated = function(p1) -- Line: 50 -- upvalues: Titan (val), getTitanClientModel (val), getTitanHair (val), Customization (val), KinematicTitanClient (val), NapeProtectionTitanClient (val)
        local v1 = Titan.getTitanFolder():FindFirstChild((tostring(p1.id)))
        if not v1 then
            error("Titan model not found: ", p1.id)
        end
        local HumanoidRootPart = v1:WaitForChild("HumanoidRootPart", 5)
        if not HumanoidRootPart then
            error("Titan root not found: ", p1.id)
        end
        local v2 = getTitanClientModel(p1.displayModel or "Default"):Clone()
        local v3 = getTitanHair(p1.hair)
        if v3 and p1.displayModel ~= "Clicker" then
            local v4 = v3:Clone()
            Customization.addAccessoryToViewportFrameRig(v2, v4)
        end
        v2:ScaleTo(p1.scale)
        KinematicTitanClient.setKinematicOrigins(v2, p1.id)
        v2:PivotTo(v1:GetPivot())
        local WeldConstraint = Instance.new("WeldConstraint")
        WeldConstraint.Part0 = HumanoidRootPart
        WeldConstraint.Part1 = v2:FindFirstChild("HumanoidRootPart")
        WeldConstraint.Parent = HumanoidRootPart
        for i, j in v1:GetDescendants() do
            if j:IsA("BasePart") then
                j.Transparency = 1
                j:AddTag("Collider")
                j.CanCollide = false
            end
        end
        v2.Parent = v1
        v2:AddTag("Alive")
        v2:AddTag("Titan")
        v2:SetAttribute("id", p1.id)
        local AnimationController = Instance.new("AnimationController")
        AnimationController.Parent = v2
        local Animator = Instance.new("Animator")
        Animator.Parent = AnimationController
        for k, n in v2:GetDescendants() do
            if n:IsA("BasePart") then
                n.CollisionGroup = "Titans"
            end
        end
        NapeProtectionTitanClient.applyFromServerRoot(v2, HumanoidRootPart)
        return {client = v2, server = v1, root = HumanoidRootPart, animator = Animator}
    end,
}