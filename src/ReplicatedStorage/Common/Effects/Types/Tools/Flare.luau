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
--               File: ReplicatedStorage.Common.Effects.Types.Tools.Flare
--                               Dumped in 0.00188 seconds
--                          Bytecode version 9  |  8 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Character = require(Utilities:WaitForChild("Character"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Utilities_2 = Common_2:WaitForChild("Utilities")
local Particles = require(Utilities_2:WaitForChild("Particles"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Utilities_3 = Common_3:WaitForChild("Utilities")
local NumberSequence = require(Utilities_3:WaitForChild("NumberSequence"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_5:WaitForChild("Common")
local Utilities_4 = Common_4:WaitForChild("Utilities")
local Sounds = require(Utilities_4:WaitForChild("Sounds"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_6:WaitForChild("Common")
local Sounds_2 = Common_5:WaitForChild("Sounds")
local Tools = Sounds_2:WaitForChild("Tools")
local Flare = require(Tools:WaitForChild("Flare"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_7:WaitForChild("Client")
local Progression = Client:WaitForChild("Progression")
local ClientAttributesHandler = require(Progression:WaitForChild("ClientAttributesHandler"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_8:WaitForChild("Client")
local User = Client_2:WaitForChild("User")
local State = User:WaitForChild("State")
local ClientStatusHandler = require(State:WaitForChild("ClientStatusHandler"))
local Assets = ReplicatedStorage:WaitForChild("Assets")
local Objects = Assets:WaitForChild("Objects")
local Flare_2 = Objects:WaitForChild("Flare")
local Waypoint = Objects:WaitForChild("Waypoint")
local u205 = Assets:WaitForChild("Particles"):WaitForChild("Tools"):WaitForChild("Flare Gun")
local u206 = {}
return function(p1, p2) -- Line: 53 -- upvalues: Players (val), ClientAttributesHandler (val), Character (val), u206 (val), Workspace (val), Waypoint (val), ClientStatusHandler (val), u205 (val), Sounds (val), Flare (val), Particles (val), TweenService (val), Flare_2 (val), NumberSequence (val), RunService (val)
    if not p2.server then
        local Part, v1, v2
        local v3 = ClientAttributesHandler.getAttribute("HasEmergencyLocator") == 1
        if v3 then
            local color_2 = p2.color
            if color_2 == Color3.fromRGB(175, 12, 190) then
                v1 = Character.getDistance(p2.startPos.Position)
                if v1 and v1 <= 2000 and not (u206[p2.userId]) then
                    u206[p2.userId] = true
                    Part = Instance.new("Part")
                    Part.Size = Vector3.new(1, 1, 1)
                    Part.CFrame = p2.startPos
                    Part.Color = Color3.fromRGB(175, 12, 190)
                    Part.Anchored = true
                    Part.CanCollide = false
                    Part.CanQuery = false
                    Part.CanTouch = false
                    Part.Transparency = 1
                    Part.Name = "EmergencyLocatorWaypoint"
                    Part.Parent = Workspace
                    Part:AddTag("Waypoint")
                    v2 = Waypoint:Clone()
                    v2.Adornee = Part
                    v2.Parent = Part
                    local Color = v2.Color
                    Color.BackgroundColor3 = Color3.fromRGB(175, 12, 190)
                    task.delay(10, function() -- Line: 91 -- upvalues: Part (val), u206 (upval), p2 (val)
                        Part:Destroy()
                        u206[p2.userId] = nil
                    end)
                end
            end
        end
        v1 = Character.getDistance(p2.startPos.Position)
        local v4 = ClientAttributesHandler.getAttribute("HasFlareExpert") == 1
        if v1 and v1 < 15 and not v4 then
            ClientStatusHandler.addPlayerStatus("Concussed", 0.8)
        end
        local color = p2.color
        local u97 = p2.scaleMultiplier or 1
        local u99 = p2.durationMultiplier or 1
        local u101 = p2.brightnessMultiplier or 1
        local Position_2 = p2.startPos.Position
        local CFrame = nil
        local u106 = tick()
        local u110 = u205:Clone()
        local startPos = p2.startPos
        local v5 = math.rad(90)
        u110.CFrame = startPos * CFrame.Angles(v5, 0, 0)
        u110.Parent = Workspace
        for i, j in u110.Flash:GetChildren() do
            if j:IsA("ParticleEmitter") then
                j.Color = ColorSequence.new(color)
            end
        end
        Sounds.playRangedSoundEffect(Flare.Nearby, u110, 150, 3)
        local v6 = math.clamp(1 - v1 / 5000, 0, 1)
        Sounds.playRangedSoundEffect(Flare.Far, u110, 5000, v6 * 3 * u101)
        Particles.deepEmitParticles(u110)
        local function onAddDisplayPart(p1, p2) -- Line: 139 -- upvalues: CFrame (ref), color (val), Workspace (upval), TweenService (upval), u97 (val), u101 (val), u99 (val)
            local v1
            if not CFrame then
                return
            end
            local Magnitude = (p1.Position - CFrame.Position).Magnitude
            local v2 = CFrame.new(p1.Position, CFrame.Position)
            CFrame = v2
            if p2 < 0.1 then
                return
            end
            local Part = Instance.new("Part")
            Part.Size = Vector3.new(0.1, 0.1, Magnitude)
            Part.CFrame = v2
            Part.Material = Enum.Material.Neon
            Part.Anchored = true
            Part.CanCollide = false
            Part.CanQuery = false
            Part.CanTouch = false
            Part.CastShadow = false
            Part.Transparency = 1
            Part.Color = color
            Part.Parent = Workspace
            if p2 > 0.3 then
                v1 = p2
            else
                v1 = 1 - (p2 - 0.1) / 0.19999999999999998 * (1 - p2)
            end
            if v1 ~= Part.Transparency then
                local v3 = TweenInfo.new(3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
                TweenService:Create(Part, v3, {Transparency = v1}):Play()
            end
            local v4 = 3 * u97 * u101
            local v5 = TweenInfo.new(5 * u99)
            TweenService:Create(Part, v5, {Size = Vector3.new(v4, v4, Magnitude)}):Play()
            task.delay(7 * u99, function() -- Line: 194 -- upvalues: TweenService (upval), Part (val), u99 (upval)
                local v1 = TweenInfo.new(5 * u99)
                TweenService:Create(Part, v1, {Transparency = 1}):Play()
            end)
            task.delay(12 * u99, function() -- Line: 200 -- upvalues: Part (val)
                Part:Destroy()
            end)
        end
        local u172 = Flare_2:Clone()
        local Trail = u172.Trail
        Trail.Color = ColorSequence.new(color)
        local Flare_3 = u172.Flare
        Flare_3.Color = ColorSequence.new(color)
        u172.Anchored = true
        u172.CFrame = CFrame.new(Position_2)
        u172.Parent = Workspace
        v5 = 0.5 * u97
        local v7 = {}
        local v8 = NumberSequenceKeypoint.new(0, 0)
        local v9 = NumberSequenceKeypoint.new(0.3, 0)
        local v10 = NumberSequenceKeypoint.new(0.5, 0)
        local v11 = NumberSequenceKeypoint.new(0.724, 0)
        v7[1] = v8
        v7[2] = v9
        v7[3] = v10
        v7[4] = v11
        v7[5] = NumberSequenceKeypoint.new(1, 0)
        local v12 = NumberSequence.new(v7)
        v8 = {}
        v9 = NumberSequenceKeypoint.new(0, 1.75 * v5)
        v10 = NumberSequenceKeypoint.new(0.3, 8 * v5)
        v11 = NumberSequenceKeypoint.new(0.5, 9.5 * v5)
        local v13 = NumberSequenceKeypoint.new(0.724, 7.31 * v5)
        v8[1] = v9
        v8[2] = v10
        v8[3] = v11
        v8[4] = v13
        v8[5] = NumberSequenceKeypoint.new(1, 0 * v5)
        v7 = NumberSequence.new(v8)
        v9 = {}
        v10 = NumberSequenceKeypoint.new(0, 1)
        v11 = NumberSequenceKeypoint.new(0.5, 1)
        v9[1] = v10
        v9[2] = v11
        v9[3] = NumberSequenceKeypoint.new(1, 1)
        v8 = NumberSequence.new(v9)
        v9 = math.clamp(1 - u101, 0, 1)
        v11 = {}
        v13 = NumberSequenceKeypoint.new(0, 1)
        local v14 = NumberSequenceKeypoint.new(0.5, v9)
        v11[1] = v13
        v11[2] = v14
        v11[3] = NumberSequenceKeypoint.new(1, 1)
        v10 = NumberSequence.new(v11)
        local u284 = NumberSequence.tweenNumberSequence(v12, v7, TweenInfo.new(8 * u99))
        local u297 = NumberSequence.tweenNumberSequence(v8, v10, TweenInfo.new(8 * u99, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true))
        local u302 = Vector3.new(0, -98.1, 0)
        local u305 = 0
        local u311 = (p2.targetPos.Position - Position_2).Unit * 500
        local u312 = Position_2
        local u313 = false
        local u314 = nil
        task.delay(12 * u99 + 2 * u99, function() -- Line: 353 -- upvalues: u172 (val), u110 (val)
            if u172.Parent then
                u172:Destroy()
            end
            u110:Destroy()
        end)
        return
    elseif p2.userId == Players.LocalPlayer.UserId then
        return
    end
end