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
-- File: ReplicatedStorage.Client.Progression.Proficiencies.Proficiencies.Skills.Tackle
--                               Dumped in 0.00102 seconds
--                          Bytecode version 9  |  8 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Alive = require(Common:WaitForChild("Alive"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Signals = require(Common_2:WaitForChild("Signals"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Animations = Common_3:WaitForChild("Animations")
local Enchantments = require(Animations:WaitForChild("Enchantments"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_4:WaitForChild("Common")
local Observers = Common_4:WaitForChild("Observers")
local useAnimatorObserver = require(Observers:WaitForChild("useAnimatorObserver"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_5:WaitForChild("Client")
local User = Client:WaitForChild("User")
local State = User:WaitForChild("State")
local States = require(State:WaitForChild("ClientStateHandler")).States
local ClientAttributesHandler = require(script.Parent.Parent.Parent.Parent:WaitForChild("ClientAttributesHandler"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_6:WaitForChild("Common")
local Statistics = Common_5:WaitForChild("Statistics")
local useJumpPower = require(Statistics:WaitForChild("useJumpPower"))
local LocalPlayer = Players.LocalPlayer
local u144 = nil
local u145 = nil
return {
    activated = function(p1) -- Line: 62 -- upvalues: ClientAttributesHandler (val), useJumpPower (val), useAnimatorObserver (val), Enchantments (val), LocalPlayer (val), Signals (val), u145 (ref), RunService (val), u144 (ref), Alive (val)
        local v1
        local HasFrontbreaker = ClientAttributesHandler.getAttribute("HasFrontbreaker")
        _, v1 = useJumpPower()
        local u59 = v1("tackle", 0, "set", 50)
        local u60 = useAnimatorObserver.play(Enchantments.Tackle, 0.1)
        if not u60 then
            return
        end
        local Character = LocalPlayer.Character
        if not Character then
            return
        end
        local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
        if not HumanoidRootPart then
            return
        end
        local u57 = p1
        while true do
            task.wait()
            if u60.IsPlaying and 0 < u60.Length then
                break
            end
        end
        Signals.Buff:Fire({id = "Tackling", length = u60.Length})
        local u39 = nil
        useAnimatorObserver.onKeyframeReachedSwitch(u60, {
            Push = function() -- Line: 92 -- upvalues: u145 (upval), RunService (upval), u39 (ref), HumanoidRootPart (val)
                u145 = RunService.RenderStepped:Connect(function() -- Line: 93 -- upvalues: u39 (upval), HumanoidRootPart (upval)
                    if not u39 then
                        local LookVector = HumanoidRootPart.CFrame.LookVector
                        u39 = Vector3.new(LookVector.X, 0, LookVector.Z).Unit * 75
                    end
                    HumanoidRootPart.AssemblyLinearVelocity = u39
                end)
            end,
            Freeze = function() -- Line: 105 -- upvalues: u60 (val), u144 (upval), RunService (upval), Alive (upval), LocalPlayer (upval), HumanoidRootPart (val), u57 (val), HasFrontbreaker (val), u145 (upval), Character (val)
                u60:AdjustSpeed(0)
                task.delay(0.1, function() -- Line: 108 -- upvalues: u60 (upval)
                    u60:AdjustSpeed(1)
                end)
                u144 = RunService.RenderStepped:Connect(function() -- Line: 112 -- upvalues: Alive (upval), LocalPlayer (upval), HumanoidRootPart (upval), u144 (upval), u57 (upval), HasFrontbreaker (upval), u145 (upval), Character (upval)
                    local HumanoidRootPart_2, Magnitude, v1, v2, v3
                    for i, j in Alive.getPlayers() do
                        if j ~= LocalPlayer then
                            v1 = Alive.getAliveCharacter(j)
                            if v1 then
                                HumanoidRootPart_2 = v1:FindFirstChild("HumanoidRootPart")
                                if HumanoidRootPart_2 then
                                    Magnitude = (HumanoidRootPart_2.Position - HumanoidRootPart.Position).Magnitude
                                    v3 = HumanoidRootPart_2.CFrame.LookVector:Dot(HumanoidRootPart.CFrame.LookVector)
                                    v2 = 0 < v3
                                    if Magnitude >= 6 then
                                        if Magnitude >= 6 then
                                            if Magnitude < 6 and not v2 then
                                                if u144 then
                                                    u144:Disconnect()
                                                    u144 = nil
                                                end
                                                if u145 then
                                                    u145:Disconnect()
                                                    u145 = nil
                                                end
                                                u57(Character)
                                            end
                                        elseif not v2 and HasFrontbreaker == 1 then
                                            if u144 then
                                                u144:Disconnect()
                                                u144 = nil
                                            end
                                            u57(v1, LocalPlayer)
                                        end
                                    elseif v2 then
                                        if u144 then
                                            u144:Disconnect()
                                            u144 = nil
                                        end
                                        u57(v1)
                                    end
                                end
                            end
                        end
                    end
                    return false
                end)
            end,
        })
        u60.Stopped:Once(function() -- Line: 167 -- upvalues: u59 (val), u145 (upval), u144 (upval)
            u59()
            if u145 then
                u145:Disconnect()
                u145 = nil
            end
            if u144 then
                u144:Disconnect()
                u144 = nil
            end
        end)
    end,
    settings = {
        blocked_states = {
            States.TOOL,
            States.BEING_CARRIED,
            States.CARRYING,
            States.STUNNED,
            States.PARRYING,
            States.CLASHING,
            States.GEAR_SWING,
        },
    },
}