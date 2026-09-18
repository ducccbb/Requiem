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
--          File: ReplicatedStorage.Client.User.Character.CharacterCarryHandler
--                               Dumped in 0.00135 seconds
--                          Bytecode version 9  |  14 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Alive = require(Common:WaitForChild("Alive"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Network = Common_2:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Miscellaneous = require(Namespaces:WaitForChild("Miscellaneous"))
local State = v1.Parent.Parent:WaitForChild("State")
local ClientSettingsHandler = require(State:WaitForChild("ClientSettingsHandler"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Signals = require(Common_3:WaitForChild("Signals"))
local State_2 = v1.Parent.Parent:WaitForChild("State")
local ClientStateHandler = require(State_2:WaitForChild("ClientStateHandler"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_4:WaitForChild("Common")
local Observers = Common_4:WaitForChild("Observers")
local useCharacterObserver = require(Observers:WaitForChild("useCharacterObserver"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_5:WaitForChild("Common")
local Animations = Common_5:WaitForChild("Animations")
local Default = require(Animations:WaitForChild("Default"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_6:WaitForChild("Common")
local Observers_2 = Common_6:WaitForChild("Observers")
local useAnimatorObserver = require(Observers_2:WaitForChild("useAnimatorObserver"))
local LocalPlayer = Players.LocalPlayer
local u162 = false
local PlayerScripts = LocalPlayer:WaitForChild("PlayerScripts")
local Controls = require(PlayerScripts:WaitForChild("PlayerModule")):GetControls()
local u176 = false
local function isCurrentlyCarryingPlayer() -- Line: 48 -- upvalues: Players (val), u176 (ref)
    local Character = Players.LocalPlayer.Character
    if not Character then
        return false
    end
    if u176 then
        return true
    end
    local Carrying = Character:FindFirstChild("Carrying")
    if not Carrying then
        return false
    end
    return Carrying
end
local function onClientBeingCarried() -- Line: 72 -- upvalues: LocalPlayer (val), Controls (val), u162 (ref)
    local Character = LocalPlayer.Character
    if not Character then
        return
    end
    local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
    if not HumanoidRootPart then
        return
    end
    if HumanoidRootPart:GetAttribute("Handcuffed") then
        Controls:Disable()
        u162 = true
    end
end
local function onAttemptToFindTarget() -- Line: 95 -- upvalues: Alive (val), LocalPlayer (val), Workspace (val), UserInputService (val), Signals (val), Players (val)
    local v1
    local v2 = RaycastParams.new()
    local v3 = {}
    local v4 = Alive.getPlayers()
    local v5 = nil
    local v6 = nil
    for i, j in v4, v5, v6 do
        v1 = Alive.getAliveCharacter(j)
        if v1 and v1 ~= LocalPlayer.Character then
            table.insert(v3, v1)
        end
    end
    v2.FilterDescendantsInstances = v3
    v2.FilterType = Enum.RaycastFilterType.Include
    local MouseLocation = UserInputService:GetMouseLocation()
    local v7 = Workspace.CurrentCamera:ScreenPointToRay(MouseLocation.X, MouseLocation.Y - game:GetService("GuiService"):GetGuiInset().Y)
    local v8 = Workspace:Spherecast(v7.Origin, 2, v7.Direction * 40, v2)
    if not v8 then
        Signals.Toast:Fire({message = "You must be looking at a character to carry them.", type = "error"})
        return nil
    end
    if not v8.Instance or not (v8.Instance.Parent:IsA("Model")) or not (v8.Instance.Parent:FindFirstChildWhichIsA("Humanoid")) then
        return nil
    end
    v1 = Alive.getPlayerFromCharacter(v8.Instance.Parent)
    if v1 == Players.LocalPlayer then
        return nil
    end
    if 10 < (LocalPlayer.Character.HumanoidRootPart.Position - v8.Instance.Parent.HumanoidRootPart.Position).Magnitude then
        Signals.Toast:Fire({message = "You are too far away from the character to carry them.", type = "error"})
        return nil
    end
    if v1 then
        return v1
    end
    Signals.Toast:Fire({message = "You must be looking at a character to carry them.", type = "error"})
end
;(function() -- Line: 166 -- upvalues: ClientSettingsHandler (val), isCurrentlyCarryingPlayer (val), Miscellaneous (val), onAttemptToFindTarget (val), u176 (ref), ClientStateHandler (val), useAnimatorObserver (val), Default (val), onClientBeingCarried (val), useCharacterObserver (val), u162 (ref), Controls (val)
    ClientSettingsHandler.onKeybindPressed("Carry"):Connect(function() -- Line: 167 -- upvalues: isCurrentlyCarryingPlayer (upval), Miscellaneous (upval), onAttemptToFindTarget (upval)
        if isCurrentlyCarryingPlayer() then
            Miscellaneous.Carry.unreliablePost(nil)
            return
        end
        local v1 = onAttemptToFindTarget()
        if not v1 then
            return
        end
        Miscellaneous.Carry.unreliablePost(v1)
    end)
    Miscellaneous.CarryState.connect(function(p1) -- Line: 182 -- upvalues: u176 (upval), ClientStateHandler (upval)
        local v1 = p1 == 1
        u176 = v1
        ClientStateHandler.updateState(ClientStateHandler.States.CARRYING, u176)
    end)
    local function onBeingCarried() -- Line: 187 -- upvalues: ClientStateHandler (upval), useAnimatorObserver (upval), Default (upval), onClientBeingCarried (upval)
        ClientStateHandler.updateState(ClientStateHandler.States.BEING_CARRIED, true)
        useAnimatorObserver.play(Default.Carried, 0.15)
        onClientBeingCarried()
    end
    useCharacterObserver(function(p1) -- Line: 194 -- upvalues: ClientStateHandler (upval), onBeingCarried (val), useAnimatorObserver (upval), Default (upval), u162 (upval), Controls (upval)
        p1.ChildAdded:Connect(function(p1) -- Line: 195 -- upvalues: ClientStateHandler (upval)
            if p1:IsA("Seat") and p1.Name == "Carrying" then
                ClientStateHandler.updateState(ClientStateHandler.States.CARRYING, true)
                p1.Destroying:Once(function() -- Line: 198 -- upvalues: ClientStateHandler (upval)
                    ClientStateHandler.updateState(ClientStateHandler.States.CARRYING, false)
                end)
            end
        end)
        local AttributeChangedSignal = p1:GetAttributeChangedSignal("Carried")
        AttributeChangedSignal:Connect(function() -- Line: 205 -- upvalues: p1 (val), ClientStateHandler (upval), onBeingCarried (upval), useAnimatorObserver (upval), Default (upval), u162 (upval), Controls (upval)
            local Attribute = p1:GetAttribute("Carried")
            if not Attribute then
                if not Attribute and ClientStateHandler.isStateBusy(ClientStateHandler.States.BEING_CARRIED) then
                    ClientStateHandler.updateState(ClientStateHandler.States.BEING_CARRIED, false)
                    useAnimatorObserver.stop(Default.Carried, 0.2)
                    if u162 then
                        Controls:Enable()
                        u162 = false
                    end
                end
                return
            end
            if not (ClientStateHandler.isStateBusy(ClientStateHandler.States.BEING_CARRIED)) then
                onBeingCarried()
                return
            end
            if not Attribute and ClientStateHandler.isStateBusy(ClientStateHandler.States.BEING_CARRIED) then
                ClientStateHandler.updateState(ClientStateHandler.States.BEING_CARRIED, false)
                useAnimatorObserver.stop(Default.Carried, 0.2)
                if u162 then
                    Controls:Enable()
                    u162 = false
                end
            end
        end)
        local Humanoid = p1:WaitForChild("Humanoid")
        Humanoid.Seated:Connect(function() -- Line: 222 -- upvalues: Humanoid (val), ClientStateHandler (upval), u162 (upval), Controls (upval), useAnimatorObserver (upval), Default (upval), onBeingCarried (upval)
            local SeatPart = Humanoid.SeatPart
            if SeatPart then
                if SeatPart.Name == "Carrying" then
                    onBeingCarried()
                end
                return
            end
            if ClientStateHandler.isStateBusy(ClientStateHandler.States.BEING_CARRIED) then
                ClientStateHandler.updateState(ClientStateHandler.States.BEING_CARRIED, false)
                if u162 then
                    Controls:Enable()
                    u162 = false
                end
                useAnimatorObserver.stop(Default.Carried, 0.2)
            end
        end)
        return function() end
    end)
end)()
return {}