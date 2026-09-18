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
--               File: ReplicatedStorage.Common.Effects.Types.Tools.Arrow
--                               Dumped in 0.00201 seconds
--                          Bytecode version 9  |  6 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Signals = require(Common:WaitForChild("Signals"))
local Objects = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Objects")
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Alive = require(Common_2:WaitForChild("Alive"))
local Arrow = Objects:WaitForChild("Arrow")
local function onArrowHitObject(p1, p2, p3, p4, p5) -- Line: 48
    local Unit = p5.Unit
    local v1 = Vector3.new(0, 1, 0)
    local v2 = math.abs(Unit.Y)
    if 0.9 < v2 then
        v1 = Vector3.new(1, 0, 0)
    end
    local Unit_2 = Unit:Cross(v1).Unit
    local Unit_3 = Unit_2:Cross(Unit).Unit
    p2.CFrame = CFrame.fromMatrix(p4, Unit_2, Unit_3, Unit)
    p2.Anchored = false
    local WeldConstraint = Instance.new("WeldConstraint")
    WeldConstraint.Part0 = p3
    WeldConstraint.Part1 = p2
    WeldConstraint.Parent = p3
    task.delay(60, function() -- Line: 83 -- upvalues: p1 (val), WeldConstraint (val)
        p1:Destroy()
        WeldConstraint:Destroy()
    end)
end
return function(p1, p2) -- Line: 91 -- upvalues: Players (val), Arrow (val), Alive (val), RunService (val), Workspace (val), Signals (val), onArrowHitObject (val)
    local PlayerByUserId, Root, gravity, startPos, u16, u26, u38, u45, v1, velocity
    local userId = p2.userId
    if userId then
        userId = Players.LocalPlayer.UserId == p2.userId
    end
    if not p2.userId or not userId then
        u16 = Arrow:Clone()
        Root = u16:FindFirstChild("Root")
        u16.Parent = workspace
        startPos = p2.startPos
        velocity = p2.velocity
        gravity = p2.gravity
        u26 = 0
        PlayerByUserId = Players:GetPlayerByUserId(p2.userId)
        v1 = PlayerByUserId
        if v1 then
            v1 = Alive.getAliveCharacter(PlayerByUserId)
        end
        u38 = RaycastParams.new()
        u38.FilterType = Enum.RaycastFilterType.Exclude
        u38.FilterDescendantsInstances = {Root, v1}
        u45 = nil
        u45 = RunService.RenderStepped:Connect(function(p1) -- Line: 124 -- upvalues: u26 (ref), startPos (ref), velocity (ref), gravity (val), Root (val), Workspace (upval), u38 (val), u45 (ref), userId (val), Signals (upval), onArrowHitObject (upval), u16 (val), p2 (val)
            local Instance, Instance_2, Position
            u26 = u26 + p1
            local v1 = startPos
            startPos = startPos + velocity * 0.03
            velocity = velocity + gravity * 0.03
            local Unit = velocity.Unit
            local v2 = Vector3.new(0, 1, 0)
            local v3 = math.abs(Unit.Y)
            if 0.9 < v3 then
                v2 = Vector3.new(1, 0, 0)
            end
            local Unit_2 = Unit:Cross(v2).Unit
            local Unit_3 = Unit_2:Cross(Unit).Unit
            local v4 = CFrame.fromMatrix(startPos, Unit_2, Unit_3, Unit)
            Root.CFrame = v4
            local v5 = Workspace:Spherecast(v1, 1, (startPos - v1) * 30, u38)
            if not v5 then
                Instance = nil
            else
                Instance = v5.Instance
            end
            if not v5 then
                Position = nil
            else
                Position = v5.Position
            end
            if not v5 then
                Instance_2 = nil
            else
                Instance_2 = v5.Instance
            end
            if v5 and v5.Instance then
                if v5.Instance.Name == "Boundary" then
                    local Wolf = v5.Instance.Parent:IsA("Model")
                    if Wolf then
                        Wolf = v5.Instance.Parent:FindFirstChild("Wolf")
                    end
                    local RootPart = Wolf
                    if RootPart then
                        RootPart = Wolf:FindFirstChild("RootPart")
                    end
                    if 4 < (RootPart.Position - Position).Magnitude then
                        v5 = nil
                        Instance = nil
                        Wolf = false
                        Position = nil
                    end
                    local Instance_3 = v5
                    if Instance_3 then
                        Instance_3 = v5.Instance
                        if Instance_3 then
                            Instance_3 = v5.Instance.Parent
                            if Instance_3 then
                                Instance_3 = v5.Instance.Parent:FindFirstChild("RootPart")
                            end
                        end
                    end
                    if Wolf then
                        local FrontTorso = Wolf:FindFirstChild("FrontTorso")
                        if FrontTorso then
                            Instance = FrontTorso
                            Position = FrontTorso.Position
                            Instance_2 = Instance_3 or RootPart
                        end
                    end
                elseif v5.Instance.Name ~= "Collider" then
                end
            end
            if v5 then
                u45:Disconnect()
                if userId then
                    Signals.Arrow:Fire(Instance_2 or Instance)
                end
                onArrowHitObject(u16, Root, Instance, Position, velocity.Unit)
                return
            end
            if (startPos - p2.endPos).Magnitude < 2 then
                u45:Disconnect()
                u16:Destroy()
            elseif 3 <= u26 then
                u45:Disconnect()
                u16:Destroy()
            end
        end)
        task.delay(60, function() -- Line: 212 -- upvalues: u45 (ref), Root (val), u16 (val)
            if u45.Connected then
                u45:Disconnect()
            end
            if Root.Parent then
                u16:Destroy()
            end
        end)
        return
    end
    if not p2.skip then
        return
    end
    u16 = Arrow:Clone()
    Root = u16:FindFirstChild("Root")
    u16.Parent = workspace
    startPos = p2.startPos
    velocity = p2.velocity
    gravity = p2.gravity
    u26 = 0
    PlayerByUserId = Players:GetPlayerByUserId(p2.userId)
    v1 = PlayerByUserId
    if v1 then
        v1 = Alive.getAliveCharacter(PlayerByUserId)
    end
    u38 = RaycastParams.new()
    u38.FilterType = Enum.RaycastFilterType.Exclude
    u38.FilterDescendantsInstances = {Root, v1}
    u45 = nil
    u45 = RunService.RenderStepped:Connect(function(p1) -- Line: 124 -- upvalues: u26 (ref), startPos (ref), velocity (ref), gravity (val), Root (val), Workspace (upval), u38 (val), u45 (ref), userId (val), Signals (upval), onArrowHitObject (upval), u16 (val), p2 (val)
        local Instance, Instance_2, Position
        u26 = u26 + p1
        local v1 = startPos
        startPos = startPos + velocity * 0.03
        velocity = velocity + gravity * 0.03
        local Unit = velocity.Unit
        local v2 = Vector3.new(0, 1, 0)
        local v3 = math.abs(Unit.Y)
        if 0.9 < v3 then
            v2 = Vector3.new(1, 0, 0)
        end
        local Unit_2 = Unit:Cross(v2).Unit
        local Unit_3 = Unit_2:Cross(Unit).Unit
        local v4 = CFrame.fromMatrix(startPos, Unit_2, Unit_3, Unit)
        Root.CFrame = v4
        local v5 = Workspace:Spherecast(v1, 1, (startPos - v1) * 30, u38)
        if not v5 then
            Instance = nil
        else
            Instance = v5.Instance
        end
        if not v5 then
            Position = nil
        else
            Position = v5.Position
        end
        if not v5 then
            Instance_2 = nil
        else
            Instance_2 = v5.Instance
        end
        if v5 and v5.Instance then
            if v5.Instance.Name == "Boundary" then
                local Wolf = v5.Instance.Parent:IsA("Model")
                if Wolf then
                    Wolf = v5.Instance.Parent:FindFirstChild("Wolf")
                end
                local RootPart = Wolf
                if RootPart then
                    RootPart = Wolf:FindFirstChild("RootPart")
                end
                if 4 < (RootPart.Position - Position).Magnitude then
                    v5 = nil
                    Instance = nil
                    Wolf = false
                    Position = nil
                end
                local Instance_3 = v5
                if Instance_3 then
                    Instance_3 = v5.Instance
                    if Instance_3 then
                        Instance_3 = v5.Instance.Parent
                        if Instance_3 then
                            Instance_3 = v5.Instance.Parent:FindFirstChild("RootPart")
                        end
                    end
                end
                if Wolf then
                    local FrontTorso = Wolf:FindFirstChild("FrontTorso")
                    if FrontTorso then
                        Instance = FrontTorso
                        Position = FrontTorso.Position
                        Instance_2 = Instance_3 or RootPart
                    end
                end
            elseif v5.Instance.Name ~= "Collider" then
            end
        end
        if v5 then
            u45:Disconnect()
            if userId then
                Signals.Arrow:Fire(Instance_2 or Instance)
            end
            onArrowHitObject(u16, Root, Instance, Position, velocity.Unit)
            return
        end
        if (startPos - p2.endPos).Magnitude < 2 then
            u45:Disconnect()
            u16:Destroy()
        elseif 3 <= u26 then
            u45:Disconnect()
            u16:Destroy()
        end
    end)
    task.delay(60, function() -- Line: 212 -- upvalues: u45 (ref), Root (val), u16 (val)
        if u45.Connected then
            u45:Disconnect()
        end
        if Root.Parent then
            u16:Destroy()
        end
    end)
end