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
--             File: ReplicatedStorage.Common.Effects.Types.Cutscenes.Medic
--                              Dumped in 0.000870 seconds
--                          Bytecode version 9  |  3 functions

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
local Animations = Common:WaitForChild("Animations")
local Cinematics = require(Animations:WaitForChild("Cinematics"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Observers = Common_2:WaitForChild("Observers")
local useAnimatorObserver = require(Observers:WaitForChild("useAnimatorObserver"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Utilities = Common_3:WaitForChild("Utilities")
local Customization = require(Utilities:WaitForChild("Customization"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_5:WaitForChild("Common")
local Signals = require(Common_4:WaitForChild("Signals"))
local Objects = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Objects")
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_6:WaitForChild("Common")
local Utilities_2 = Common_5:WaitForChild("Utilities")
local State = require(Utilities_2:WaitForChild("State"))
return function(p1) -- Line: 46 -- upvalues: State (val), Objects (val), Customization (val), Players (val), Workspace (val), RunService (val), Signals (val), useAnimatorObserver (val), Cinematics (val)
    local black = State("black")
    black({enabled = true, tween = TweenInfo.new(0.5)})
    task.wait(0.5)
    local u20 = Objects:WaitForChild("Requiem_PlayerCamera"):Clone()
    u20.HumanoidRootPart.CFrame = p1.Bed.Pivot.CFrame
    u20.HumanoidRootPart.Anchored = true
    u20.Parent = p1
    local v1 = p1.Medic:Clone()
    v1.HumanoidRootPart.CFrame = p1.Bed.Pivot.CFrame
    v1.HumanoidRootPart.Anchored = true
    v1.Parent = p1
    Customization.decorateRigCopyingRig(u20, Players.LocalPlayer.Character)
    local CurrentCamera = Workspace.CurrentCamera
    Signals.Bars:Fire(0.3, 0)
    useAnimatorObserver.playAnimationOnRig(v1, Cinematics.MedicNPCAnimation):Play()
    local v2 = useAnimatorObserver.playAnimationOnRig(u20, Cinematics.MedicBeingHealedAnimation)
    v2:Play()
    while true do
        task.wait()
        if 0 <= v2.Length then
            break
        end
    end
    task.wait(0.1)
    black({enabled = false, tween = TweenInfo.new(1)})
    task.wait(v2.Length - 1)
    black({enabled = true, tween = TweenInfo.new(0.6)})
    task.wait(0.6)
    Signals.Bars:Fire(0, 0)
    RunService.RenderStepped:Connect(function() -- Line: 77 -- upvalues: u20 (val)
        workspace.CurrentCamera.CFrame = u20.Camera.Camera.CFrame
    end):Disconnect()
    CurrentCamera.CFrame = CurrentCamera.CFrame
    v1:Destroy()
    u20:Destroy()
    black({enabled = false, tween = TweenInfo.new(0.5)})
end