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
--                    File: ReplicatedStorage.Common.Utilities.Debris
--                               Dumped in 0.00266 seconds
--                          Bytecode version 9  |  18 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local Workspace = game:GetService("Workspace")
local Sounds = require(v1.Parent:WaitForChild("Sounds"))
local Sounds_2 = v1.Parent.Parent:WaitForChild("Sounds")
local Debris = require(Sounds_2:WaitForChild("Debris"))
local u50 = Vector3.new(0, -10, 0)
local u51 = 0
local function getCircularSurfaceAppearance(p1) -- Line: 27
    local Instance = p1.Instance
    if not Instance or not (Instance:IsA("BasePart")) then
        return nil, nil
    end
    local Material = Instance.Material
    if Material == Enum.Material.Slate or Material == Enum.Material.Concrete then
        return Material, Instance.Color
    end
    if Material ~= Enum.Material.Cobblestone then
        return nil, nil
    end
    return Material, Instance.Color
end
local function createRockPart(p1) -- Line: 47 -- upvalues: Workspace (val)
    local Part = Instance.new("Part")
    Part.CanCollide = false
    Part.CanQuery = false
    Part.CanTouch = false
    Part.Anchored = true
    Part.Size = Vector3.new(1, 1, 1)
    Part.Color = Color3.fromRGB(95, 95, 95)
    Part.Material = Enum.Material.Slate
    Part.Parent = Workspace
    if not p1 then
        local v1 = 10 + math.random(0, 100) / 100
        task.delay(v1, function() -- Line: 59 -- upvalues: Part (val)
            Part:Destroy()
        end)
    end
    return Part
end
local function arc(p1, p2, p3, p4, p5) -- Line: 67
    local v1, v2, v3
    local Unit = (p2 - p1).Unit
    local v4 = math.rad(p5)
    local v5 = -Unit.Z
    v5 = {}
    local v6 = p4 - 1
    local v7 = 1
    for i = 0, v6, v7 do
        v2 = -math.rad(p5) / 2
        v1 = v2 + i * (v4 / (p4 - 1))
        v3 = Unit * math.cos(v1) * p3
        table.insert(v5, p1 + (v3 + Vector3.new(v5, 0, Unit.X).Unit * math.sin(v1) * p3))
    end
    return v5
end
local v3 = {}
function v3.circular(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11) -- Line: 285 -- upvalues: Workspace (val), u51 (ref), Sounds (val), Debris (val), u50 (val), createRockPart (val), getCircularSurfaceAppearance (val), TweenService (val)
    local Position, Position_2, u22, u291, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18
    local v19 = RaycastParams.new()
    local v20 = p6
    if not v20 then
        v20 = {}
    end
    v19.FilterDescendantsInstances = v20
    v19.FilterType = Enum.RaycastFilterType.Exclude
    if not p9 then
        u22 = nil
    else
        u22 = Random.new(p9)
    end
    local function nextInteger(p1, p2) -- Line: 304 -- upvalues: u22 (val)
        if u22 then
            return u22:NextInteger(p1, p2)
        end
        return math.random(p1, p2)
    end
    local v21 = Vector3.new(0, -2000, 0)
    local v22 = Workspace:Raycast(p1, v21, v19)
    if not v22 then
        return
    end
    if not p11 then
        Position = v22.Position
    else
        Position = Vector3.new(v22.Position.X, p11, v22.Position.Z)
    end
    local v23 = tick()
    local v24 = v23 - u51
    if 0.1 <= v24 then
        u51 = v23
        local Part = Instance.new("Part")
        Part.CanCollide = false
        Part.CanQuery = false
        Part.CanTouch = false
        Part.Anchored = true
        Part.Size = Vector3.new(1, 1, 1)
        Part.Transparency = 1
        Part.Position = Position
        Part.Parent = Workspace
        v2 = Debris.Circular[nextInteger(1, #Debris.Circular)]
        Sounds.playFalloffSoundEffect(v2, Part, 3000, p8 or 4, {min = 0.9, max = 1.1})
        task.delay(10, function() -- Line: 346 -- upvalues: Part (val)
            Part:Destroy()
        end)
    end
    v24 = {}
    v21 = 0
    v2 = p4
    local v25 = 1
    v10, v1, v17, v18, u291, v16 = p4, p2, p7, p10, p3, p5
    for i = 1, v2, v25 do
        if 0 >= v21 then
            v3 = math.rad(i / v10 * 360)
            v4 = nextInteger(90, 110) / 100
            v7 = math.cos(v3)
            v5 = Position.X + v7 * (v1 * v4)
            v8 = math.sin(v3)
            v8 = Vector3.new(v5, Position.Y, Position.Z + v8 * (v1 * v4))
            v6 = Workspace:Raycast(v8, u50, v19)
            if v6 then
                Position_2 = v6.Position
                local u162 = createRockPart(v17)
                u162.CanCollide = v18 or false
                u162.CanQuery = v18 or false
                u162.CanTouch = v18 or false
                v9, v11 = getCircularSurfaceAppearance(v6)
                if v9 and v11 then
                    u162.Material = v9
                    u162.Color = v11
                end
                u162.Size = Vector3.new(u291, u291, u291) * (nextInteger(90, 110) / 100)
                u162.Position = Position_2
                v12 = math.rad(15)
                v14 = math.rad((nextInteger(-15, 15)))
                v13 = CFrame.Angles(v12, v14, (math.rad((nextInteger(-15, 15)))))
                u162.CFrame = CFrame.new(Position_2, Position_2 + Vector3.new(Position_2.X - Position.X, 0, Position_2.Z - Position.Z).Unit) * v13
                if v16 then
                    u162.CFrame = u162.CFrame * CFrame.new(0, -u291 * 2 - u291 / 4, 0)
                    v15 = TweenInfo.new(v16)
                    TweenService:Create(u162, v15, {CFrame = u162.CFrame * CFrame.new(0, u291 * 2, 0)}):Play()
                end
                u162.Parent = Workspace
                table.insert(v24, u162)
                if not v17 then
                    task.delay(3, function() -- Line: 411 -- upvalues: TweenService (upval), u162 (val), u291 (val)
                        local v1 = TweenInfo.new(10)
                        TweenService:Create(u162, v1, {CFrame = u162.CFrame * CFrame.new(0, -(u291 * 2) * 2, 0), Size = Vector3.new(0, 0, 0)}):Play()
                        task.delay(10, function() -- Line: 417 -- upvalues: u162 (upval)
                            u162:Destroy()
                        end)
                    end)
                end
            else
                v21 = nextInteger(2, 3)
            end
        else
            v21 = v21 - 1
        end
    end
    return v24
end
function v3.gravity(p1, p2, p3, p4, p5, p6, p7, p8) -- Line: 427 -- upvalues: Workspace (val), createRockPart (val), TweenService (val)
    local v1, v2, v3, v4, v5, v6, v7, v8, v9
    local v10 = RaycastParams.new()
    local v11 = p8
    if not v11 then
        v11 = {}
    end
    v10.FilterDescendantsInstances = v11
    v10.FilterType = Enum.RaycastFilterType.Exclude
    local v12 = Vector3.new(0, -1000, 0)
    v11 = Workspace:Raycast(p1, v12, v10)
    if not v11 then
        return
    end
    local Position = v11.Position
    local v13 = p4
    v12 = 1
    for i = 1, v13, v12 do
        v1 = math.rad(i / p4 * 360)
        v2 = math.random(90, 130) / 100
        v6 = math.cos(v1)
        v3 = Position.X + v6 * (p2 * v2)
        v7 = math.sin(v1)
        v4 = Position.Z + v7 * (p2 * v2)
        v5 = math.random(90, 110) / 100
        local u68 = createRockPart()
        u68.CanCollide = false
        u68.CanQuery = false
        u68.CanTouch = false
        u68.Size = Vector3.new(p3, p3, p3) * v5
        u68.Position = Vector3.new(v3, Position.Y, v4)
        v8 = CFrame.new(u68.Position, u68.Position + Vector3.new(v3 - Position.X, 0, v4 - Position.Z).Unit)
        u68.CFrame = v8 * CFrame.new(0, -p3 * 2 - p3 / 4, 0)
        v9 = TweenInfo.new(p6)
        TweenService:Create(u68, v9, {Transparency = 1, CFrame = u68.CFrame * CFrame.new(0, p5, 0), Size = Vector3.new(0.1, p3 * p7, 0.1)}):Play()
        u68.Parent = Workspace
        task.delay(3, function() -- Line: 480 -- upvalues: u68 (val)
            u68:Destroy()
        end)
    end
    return {}
end
function v3.rocks(p1, p2, p3, p4, p5, p6, p7) -- Line: 221 -- upvalues: Workspace (val), createRockPart (val), TweenService (val)
    local v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11
    local v12 = RaycastParams.new()
    local v13 = p7
    if not v13 then
        v13 = {}
    end
    v12.FilterDescendantsInstances = v13
    v12.FilterType = Enum.RaycastFilterType.Exclude
    local v14 = Vector3.new(0, -1000, 0)
    v13 = Workspace:Raycast(p1, v14, v12)
    if not v13 then
        return
    end
    local Position = v13.Position
    local v15 = {}
    local v16 = p4
    v14 = 1
    for i = 1, v16, v14 do
        v1 = math.rad(i / p4 * 360)
        v2 = math.random(90, 110) / 100
        v6 = math.cos(v1)
        v3 = Position.X + v6 * (p2 * v2)
        v7 = math.sin(v1)
        v4 = Position.Z + v7 * (p2 * v2)
        v5 = math.random(90, 110) / 100
        local u67 = createRockPart()
        u67.CanCollide = false
        u67.CanQuery = false
        u67.CanTouch = false
        u67.Anchored = false
        u67.Size = Vector3.new(p3, p3, p3) * v5
        u67.Position = Vector3.new(v3, Position.Y, v4)
        v7 = math.random(70, 110) / 100
        v8 = (Vector3.new(v3, Position.Y, v4) - Position).Unit * (p6 * v7)
        v8 = v8 + Vector3.new(0, p5 * v7, 0)
        u67.Parent = Workspace
        u67.AssemblyLinearVelocity = v8
        v9 = math.random(-20, 20)
        v10 = math.random(-20, 20)
        u67.AssemblyAngularVelocity = Vector3.new(v9, v10, math.random(-20, 20))
        u67.Name = "Rock"
        v11 = TweenInfo.new(3)
        TweenService:Create(u67, v11, {Transparency = 1, Size = Vector3.new(1, 1, 1)}):Play()
        task.delay(3, function() -- Line: 275 -- upvalues: u67 (val)
            u67:Destroy()
        end)
        table.insert(v15, u67)
    end
    return v15
end
v3.arc = arc
function v3.shockwave(p1, p2, p3, p4, p5, p6, p7) -- Line: 97 -- upvalues: Workspace (val), arc (val), createRockPart (val), TweenService (val), Players (val)
    local u8 = RaycastParams.new()
    local v1 = p6
    if not v1 then
        v1 = {}
    end
    u8.FilterDescendantsInstances = v1
    u8.FilterType = Enum.RaycastFilterType.Exclude
    local v2 = Vector3.new(0, -1000, 0)
    local u25 = Workspace:Raycast(p1, v2, u8)
    if not u25 then
        return
    end
    local u26 = false
    local u27 = 0
    task.spawn(function() -- Line: 119 -- upvalues: p3 (val), p4 (val), arc (upval), p1 (val), p2 (val), p5 (val), u27 (ref), Workspace (upval), u8 (val), createRockPart (upval), u25 (val), TweenService (upval), u26 (ref), Players (upval), p7 (val)
        local v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13
        local v14 = p3
        local v15 = 1
        for i = 1, v14, v15 do
            v10 = p4 * 30 + i * 30 * p4
            v11 = arc(p1, p2, v10, p4 * 5 + i, p4 * 50)
            task.wait(p5)
            u27 = u27 + 1
            v12 = math.floor(#v11 / 2)
            v13 = #v11
            for k, v in pairs(v11) do
                v2 = Vector3.new(0, -1000, 0)
                v1 = Workspace:Raycast(v, v2, u8)
                if v1 and v1.Position then
                    u27 = u27 + 1
                    local u64 = createRockPart()
                    u64.CanCollide = false
                    u64.CanQuery = false
                    u64.CanTouch = false
                    if u64.Shape ~= Enum.PartType.Block then
                        u64.Shape = Enum.PartType.Block
                    end
                    local u85 = (1 - k / p3 / 2 + 0.5) * 30 * p4 * (math.random(98, 103) / 100)
                    v4 = math.abs(v12 - k) * 2
                    v7 = (math.max(v4, 1) / v13 + 0.5) / 2
                    v3 = 1 - math.max(v7, 0.1) + 0.5
                    u64.Size = Vector3.new(u85 * v3, u85 * v3, u85 * v3)
                    v5 = math.rad((math.random(15, 20)))
                    v8 = math.rad((math.random(-20, 20)))
                    v6 = CFrame.Angles(v5, v8, (math.rad((math.random(-20, 20)))))
                    v8 = CFrame.new(v1.Position, u25.Position) * v6
                    u64.CFrame = v8 * CFrame.new(0, -u85 * 2 - u85 / 4, 0)
                    local u154 = u64.CFrame * CFrame.new(0, u85 * 2, 0)
                    v9 = TweenInfo.new(p5 * 4)
                    TweenService:Create(u64, v9, {CFrame = u154}):Play()
                    if u27 % 3 == 0 and not u26 then
                        task.delay(p5 * 2, function() -- Line: 176 -- upvalues: u26 (upval), Players (upval), u154 (val), u85 (val), p7 (upval)
                            if u26 then
                                return
                            end
                            local Character = Players.LocalPlayer.Character
                            local PrimaryPart = Character
                            if PrimaryPart then
                                PrimaryPart = Character.PrimaryPart
                            end
                            if PrimaryPart and (PrimaryPart.Position - u154.Position).Magnitude < u85 * 1.2 and p7 then
                                p7()
                                u26 = true
                            end
                        end)
                    end
                    task.delay(p5 * 4, function() -- Line: 196 -- upvalues: TweenService (upval), u64 (val), u85 (val)
                        local v1 = TweenInfo.new(2.5)
                        TweenService:Create(u64, v1, {CFrame = u64.CFrame * CFrame.new(0, -(u85 * 2) * 2, 0)}):Play()
                        task.wait(2.5)
                        u64:Destroy()
                    end)
                    u64.Parent = Workspace
                end
            end
        end
    end)
end
return v3