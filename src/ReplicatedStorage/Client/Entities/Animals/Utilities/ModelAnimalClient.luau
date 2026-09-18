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
--      File: ReplicatedStorage.Client.Entities.Animals.Utilities.ModelAnimalClient
--                              Dumped in 0.000619 seconds
--                          Bytecode version 9  |  4 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
require(Namespaces:WaitForChild("Animal"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Types = Common_2:WaitForChild("Types")
local Animals = Types:WaitForChild("Animals")
local Animal = require(Animals:WaitForChild("Animal"))
local function getAnimalClientModel(p1) -- Line: 23 -- upvalues: ReplicatedStorage (val)
    return (ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Animals"):WaitForChild(p1))
end
return {
    onAnimalModelCreated = function(p1) -- Line: 34 -- upvalues: Animal (val), getAnimalClientModel (val)
        local v1 = Animal.getAnimalFolder():FindFirstChild((tostring(p1.id)))
        if not v1 then
            error("Animal model not found: ", p1.id)
        end
        local RootPart = v1:WaitForChild("RootPart", 5)
        if not RootPart then
            error("Animal root not found: ", p1.id)
        end
        local v2 = getAnimalClientModel(p1.variant):Clone()
        v2:ScaleTo(p1.scale)
        if p1.variant ~= "Bear" then
            v2:PivotTo(v1:GetPivot())
        else
            local Pivot = v1:GetPivot()
            v2:PivotTo(Pivot * CFrame.new(0, p1.scale * -2.85, 0))
        end
        local WeldConstraint = Instance.new("WeldConstraint")
        WeldConstraint.Part0 = RootPart
        WeldConstraint.Part1 = v2:FindFirstChild("RootPart")
        WeldConstraint.Parent = RootPart
        for i, j in v1:GetDescendants() do
            if j:IsA("BasePart") then
                j.Transparency = 1
                j:AddTag("Collider")
                j.CanCollide = false
            end
        end
        v2.Parent = v1
        v2:AddTag("Alive")
        v2:AddTag("Animal")
        v2:SetAttribute("id", p1.id)
        local AnimationController = Instance.new("AnimationController")
        AnimationController.Parent = v2
        local Animator = Instance.new("Animator")
        Animator.Parent = AnimationController
        for k, n in v2:GetDescendants() do
            if n:IsA("BasePart") then
                n.CollisionGroup = "Animals"
            end
        end
        return {client = v2, server = v1, root = RootPart, animator = Animator}
    end,
    anchorClientCorpse = function(p1, p2) -- Line: 126
        if p1:HasTag("Alive") then
            p1:RemoveTag("Alive")
        end
        for i, j in p2:GetChildren() do
            if j:IsA("WeldConstraint") then
                j:Destroy()
            end
        end
        local RootPart = p1:FindFirstChild("RootPart")
        for k, n in p1:GetDescendants() do
            if n:IsA("BasePart") then
                n.AssemblyLinearVelocity = Vector3.zero
                n.AssemblyAngularVelocity = Vector3.zero
            end
        end
        if RootPart then
            RootPart.Anchored = true
        end
    end,
}