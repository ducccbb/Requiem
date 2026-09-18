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
--               File: ReplicatedStorage.Common.Effects.Types.Gear.Grapple
--                               Dumped in 0.00148 seconds
--                          Bytecode version 9  |  3 functions

local u95
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Draw = require(Utilities:WaitForChild("Draw"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Signals = require(Common_2:WaitForChild("Signals"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Utilities_2 = Common_3:WaitForChild("Utilities")
local Table = require(Utilities_2:WaitForChild("Table"))
local Universal = script.Parent.Parent:WaitForChild("Universal")
local EmitAttachment = require(Universal:WaitForChild("EmitAttachment"))
local u92 = {}
local u93 = {}
function u95(p1, p2, p3, p4) -- Line: 38 -- upvalues: Players (val), EmitAttachment (val), u93 (val), Workspace (val), Draw (val), u92 (val), Signals (val), Table (val), u95 (ref), TweenService (val)
    if not p1 then
        return
    else
        local v1, v2
        if not p2 then
            return
        end
        local Character = Players.LocalPlayer.Character
        local PrimaryPart_2 = Character
        if PrimaryPart_2 then
            PrimaryPart_2 = Character.PrimaryPart
        end
        if not PrimaryPart_2 then
            return
        end
        local PrimaryPart = p1.PrimaryPart
        if not PrimaryPart then
            return
        end
        local Torso = p1:FindFirstChild("Torso")
        if not Torso then
            return
        end
        local v3 = p1
        if v3 then
            v3 = p1:FindFirstChild(p2 .. "GrappleParticle", true)
        end
        if v3 then
            EmitAttachment(v3)
        end
        if p1 == Character then
            return
        end
        if not p3 then
            if u93[p1] and u93[p1][p2] then
                local v4 = u93[p1][p2]
                v4.active = false
                if u92[v4.id] then
                    local connection = u92[v4.id].connection
                    if connection then
                        connection:Disconnect()
                    end
                    u92[v4.id] = nil
                    Signals.PlayerGrappledClient:Fire({active = false, id = v4.id}, #Table.keys(u92))
                end
                v1 = u93[p1]
                v1[p2] = nil
                local Attachment1 = v4.beam.Attachment1
                if Attachment1 then
                    v2 = TweenInfo.new(0.15)
                    TweenService:Create(Attachment1, v2, {WorldPosition = v4.exit.WorldPosition}):Play()
                    task.wait(0.1)
                end
                if v4.beam then
                    v4.beam:Destroy()
                    v4.exit:Destroy()
                    v4.goal:Destroy()
                    v4.immediate:Destroy()
                end
            end
            return
        elseif p4 then
            local Parent, u117, v5
            if 2000 < (PrimaryPart_2.Position - PrimaryPart.Position).Magnitude then
                return
            end
            if u93[p1] and u93[p1][p2] then
                v1 = u93[p1][p2]
                v1.beam:Destroy()
                v1.exit:Destroy()
                v1.goal:Destroy()
                v1.immediate:Destroy()
                v5 = u93[p1]
                v5[p2] = nil
            end
            if p2 ~= "Left" then
                v5 = 1.06
            else
                v5 = -1.06
            end
            v1 = CFrame.new(v5, -0.8, -0.45)
            local Attachment = Instance.new("Attachment")
            Attachment.Parent = Torso
            Attachment.CFrame = v1
            local Attachment_2 = Instance.new("Attachment")
            Attachment_2.Parent = Workspace.Terrain
            if not p4 then
                u117 = p4
            elseif not p4.Parent then
                u117 = p4
            elseif not (p4.Parent:IsA("Model")) then
                u117 = p4
            elseif not (p4.Parent:FindFirstChild("HumanoidRootPart")) then
                u117 = p4
            else
                u117 = p4.Parent:FindFirstChild("HumanoidRootPart")
            end
            local Attachment_3 = Instance.new("Attachment")
            Attachment_3.Parent = u117
            Attachment_3.CFrame = u117.CFrame:ToObjectSpace(CFrame.new(p3))
            Attachment_3.Name = "__GRAPPLED_TO"
            if u117.Parent and u117.Parent:IsA("Model") then
                Parent = u117.Parent
                if Players:GetPlayerFromCharacter(Parent) and u117.Parent:FindFirstChild("HumanoidRootPart") and not (u117.Parent:HasTag("Shifter")) then
                    Attachment_3.Position = Vector3.new(0, 0, 0)
                end
            end
            local v6 = Draw.line(Attachment, Attachment_2, Color3.fromRGB())
            v6.Parent = u117.Parent
            v6.CurveSize0 = 20
            v6.CurveSize1 = -20
            Attachment_2.Parent = u117
            Attachment_2.WorldPosition = Attachment.WorldPosition
            v2 = u93[p1]
            if not v2 then
                v2 = {}
            end
            u93[p1] = v2
            local v7 = u93[p1]
            v7[p2] = {
                active = true,
                beam = v6,
                id = math.random(1, 10000),
                exit = Attachment,
                goal = Attachment_2,
                immediate = Attachment_3,
            }
            if u117 and u117.Parent and u117.Parent == Players.LocalPlayer.Character and u93[p1][p2] and not (Players.LocalPlayer.Character:HasTag("Shifter")) then
                u92[u93[p1][p2].id] = u93[p1][p2]
                Signals.PlayerGrappledClient:Fire(u93[p1][p2], #Table.keys(u92))
                v7 = u92[u93[p1][p2].id]
                local AttributeChangedSignal = u117.Parent:GetAttributeChangedSignal("Shaking")
                v7.connection = AttributeChangedSignal:Connect(function() -- Line: 161 -- upvalues: u117 (ref), u95 (upval), p1 (val), p2 (val)
                    if u117.Parent:GetAttribute("Shaking") then
                        u95(p1, p2)
                    end
                end)
            end
            local v8 = TweenInfo.new(0.06)
            TweenService:Create(Attachment_2, v8, {WorldPosition = Attachment_3.WorldPosition}):Play()
            v8 = TweenInfo.new(0.18, Enum.EasingStyle.Back)
            TweenService:Create(v6, v8, {CurveSize0 = 0, CurveSize1 = 0}):Play()
            task.wait(0.06)
            v6.Attachment1 = Attachment_3
            return
        end
    end
end
return u95