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
--              File: ReplicatedStorage.Common.Effects.Types.Titans.Limbcut
--                               Dumped in 0.00212 seconds
--                          Bytecode version 9  |  11 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Particles = require(Utilities:WaitForChild("Particles"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_3:WaitForChild("Client")
local Entities = Client:WaitForChild("Entities")
local Titans = Entities:WaitForChild("Titans")
local ClientTitanHandler = require(Titans:WaitForChild("ClientTitanHandler"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_4:WaitForChild("Common")
local Types = Common_2:WaitForChild("Types")
require(Types:WaitForChild("Titan"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_5:WaitForChild("Common")
local Alive = require(Common_3:WaitForChild("Alive"))
local u103 = {
    arms = {
        left = {root = "LeftLowerArm", endPart = "LeftHand"},
        right = {root = "RightLowerArm", endPart = "RightHand"},
    },
}
local v2 = {
    left = {root = "LeftLowerLeg", endPart = "LeftFoot"},
}
local v3 = {root = "RightLowerLeg", endPart = "RightFoot"}
v2.right = v3
u103.legs = v2
local function onConnectModelToObject(p1, p2) -- Line: 58
    local WeldConstraint
    for i, v in ipairs(p1:GetDescendants()) do
        if v:IsA("BasePart") then
            WeldConstraint = Instance.new("WeldConstraint")
            WeldConstraint.Part0 = v
            WeldConstraint.Part1 = p2
            WeldConstraint.Parent = v
        end
    end
end
local function getLimbPartEntries(p1, p2, p3) -- Line: 76
    local u3 = {}
    local function addPart(a1, p2) -- Line: 83 -- upvalues: p1 (val), u3 (val), p3 (val)
        local v1 = p1:FindFirstChild(a1)
        if v1 then
            table.insert(u3, {part = v1, role = p2})
        end
        if p3 and p3 ~= "" then
            local v2 = p1:FindFirstChild(a1 .. "_Extra")
            if v2 then
                table.insert(u3, {part = v2, role = p2})
            end
        end
    end
    addPart(p2.root, "root")
    addPart(p2.endPart, "end")
    return u3
end
return function(p1, p2, p3, p4, p5) -- Line: 103 -- upvalues: ClientTitanHandler (val), Alive (val), u103 (val), getLimbPartEntries (val), ReplicatedStorage (val), onConnectModelToObject (val), Particles (val), Workspace (val), TweenService (val)
    local u5 = nil
    local v1 = (function(p1) -- Line: 110 -- upvalues: ClientTitanHandler (upval), Alive (upval), u5 (ref)
        local v1 = ClientTitanHandler.getTitanById(p1)
        if v1 then
            if not v1 or not v1.model.client then
                return
            end
            u5 = v1
            return v1.model.client
        end
        local v2 = Alive.getAlivePlayerById(p1)
        if v2 then
            return Alive.getAliveCharacter(v2)
        end
        if not v1 or not v1.model.client then
            return
        end
        u5 = v1
        return v1.model.client
    end)(p3)
    if not v1 then
        return
    end
    local v2 = u103[p1][p2]
    if not v2 then
        return
    end
    local u17 = getLimbPartEntries(v1, v2, p5)
    local v3 = u17
    local v4 = nil
    local v5 = nil
    for i, j in v3, v4, v5 do
        j.part.Transparency = 1
    end
    local Damaged = ReplicatedStorage.Assets.Titans.Damaged
    v4 = Damaged
    if p5 and p5 ~= "" then
        v5 = Damaged:FindFirstChild(p5)
        if v5 then
            v4 = v5
        end
    end
    v5 = v1:FindFirstChild(v2.root)
    local v6 = v4:FindFirstChild(p2 .. " Lower")
    if not v5 then
        return
    else
        if not v6 then
            return
        end
        local Scale = v1:GetScale()
        local u62 = v6:Clone()
        u62:ScaleTo(Scale)
        u62:PivotTo(v5.CFrame)
        if u62.PrimaryPart then
            u62.PrimaryPart:Destroy()
        end
        onConnectModelToObject(u62, v5)
        u62.Parent = v1
        task.delay(p4, function() -- Line: 180 -- upvalues: u62 (ref), u17 (val)
            u62:Destroy()
            local v1 = u17
            local v2 = nil
            local v3 = nil
            for i, j in v1, v2, v3 do
                j.part.Transparency = 0
            end
        end)
        local u104 = ReplicatedStorage.Assets.Particles.Titans.Damage:WaitForChild("Limb"):Clone()
        local Bone = u62:WaitForChild("Bone")
        if Bone then
            u104.Parent = Bone
            task.delay(1, function() -- Line: 196 -- upvalues: Particles (upval), u104 (val)
                Particles.deepDisableParticles(u104)
            end)
        end
        local v7 = v4:FindFirstChild(p2 .. " Debris")
        if not v7 then
            return
        end
        local u126 = v7:Clone()
        for k, v in pairs(u126:GetDescendants()) do
            if v:IsA("BasePart") then
                v.CanCollide = false
                v.CollisionGroup = "Corpse"
                task.delay(0.5, function() -- Line: 213 -- upvalues: v (val)
                    v.CanCollide = true
                end)
            end
        end
        u126:ScaleTo(Scale)
        u126:PivotTo(v5.CFrame)
        u126.Parent = Workspace
        task.delay(2, function() -- Line: 223 -- upvalues: u126 (ref), TweenService (upval)
            local v1
            for k, v in pairs(u126:GetDescendants()) do
                if v:IsA("BasePart") then
                    v1 = TweenInfo.new(5)
                    TweenService:Create(v, v1, {Transparency = 1}):Play()
                end
            end
            task.wait(5)
            u126:Destroy()
        end)
        task.wait(p4 - 1.6)
        if not u5 then
            local v8 = v4:FindFirstChild("Heal"):Clone()
            if not v8.PrimaryPart then
                return
            end
            local Animation = Instance.new("Animation")
            Animation.AnimationId = "rbxassetid://127120609686687"
            v8:ScaleTo(Scale * 0.8)
            v8:PivotTo(v5.CFrame * CFrame.new(0, -Scale * 0.3, 0))
            local WeldConstraint = Instance.new("WeldConstraint")
            WeldConstraint.Part0 = v5
            WeldConstraint.Part1 = v8.PrimaryPart
            WeldConstraint.Parent = v8.PrimaryPart
            local AnimationController = v8:FindFirstChildWhichIsA("AnimationController")
            local Animator = AnimationController
            if Animator then
                Animator = AnimationController:FindFirstChildOfClass("Animator")
            end
            local v9 = {}
            local v10 = {}
            for k2, k3 in pairs(v8:GetDescendants()) do
                if k3:IsA("BasePart") then
                    v9[k3] = k3.Transparency
                    v10[k3] = k3.Size
                    k3.Size = Vector3.new(0, 0, 0)
                    k3.Transparency = 1
                end
            end
            local v11 = u17
            local v12 = nil
            local v13 = nil
            for n, m in v11, v12, v13 do
                v10[m.part] = m.part.Size
                m.part.Size = Vector3.new(0, 0, 0)
            end
            v8.Parent = Workspace
            if not Animator then
                return
            else
                local v14
                v11 = Animator:LoadAnimation(Animation)
                task.wait(0.5)
                v11:Play()
                v11:AdjustSpeed(0.8)
                task.wait(0.1)
                for k4, i5 in pairs(v8:GetDescendants()) do
                    if i5:IsA("BasePart") then
                        v14 = TweenInfo.new(0.4)
                        TweenService:Create(i5, v14, {Transparency = v9[i5], Size = v10[i5]}):Play()
                        task.delay(2, function() -- Line: 304 -- upvalues: TweenService (upval), i5 (val)
                            local v1 = TweenInfo.new(0.1)
                            TweenService:Create(i5, v1, {Transparency = 1}):Play()
                        end)
                    end
                end
                task.wait(0.5)
                if not u5 then
                    local part_2
                    v12 = u17
                    v13 = nil
                    local v15 = nil
                    for i6, i7 in v12, v13, v15 do
                        if i7.role == "root" then
                            part_2 = i7.part
                            v14 = TweenInfo.new(0.4)
                            TweenService:Create(part_2, v14, {Transparency = 0, Size = v10[i7.part]}):Play()
                        end
                    end
                    task.wait(0.2)
                    if not u5 then
                        local part
                        v12 = u17
                        v13 = nil
                        v15 = nil
                        for i8, i9 in v12, v13, v15 do
                            if i9.role == "end" then
                                part = i9.part
                                v14 = TweenInfo.new(0.4)
                                TweenService:Create(part, v14, {Transparency = 0, Size = v10[i9.part]}):Play()
                            end
                        end
                        task.wait(0.3)
                        v8:Destroy()
                        return
                    elseif u5.inactive then
                        v8:Destroy()
                        return
                    end
                elseif u5.inactive then
                    v8:Destroy()
                    return
                end
            end
        elseif u5.inactive then
            return
        end
    end
end