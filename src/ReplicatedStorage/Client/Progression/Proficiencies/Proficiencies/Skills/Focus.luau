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
--  File: ReplicatedStorage.Client.Progression.Proficiencies.Proficiencies.Skills.Focus
--                              Dumped in 0.000824 seconds
--                          Bytecode version 9  |  5 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local CollectionService = game:GetService("CollectionService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Alive = require(Common:WaitForChild("Alive"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Utilities = Common_2:WaitForChild("Utilities")
local Helper = require(Utilities:WaitForChild("Helper"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Utilities_2 = Common_3:WaitForChild("Utilities")
local State = require(Utilities_2:WaitForChild("State"))
local ClientAttributesHandler = require(script.Parent.Parent.Parent.Parent:WaitForChild("ClientAttributesHandler"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_4:WaitForChild("Common")
local Signals = require(Common_4:WaitForChild("Signals"))
local u104 = Color3.fromRGB(40, 180, 70)
local u109 = Color3.fromRGB(213, 52, 52)
local Highlight = Instance.new("Highlight")
Highlight.FillTransparency = 0.5
local function getFocusHighlightColor(p1) -- Line: 73 -- upvalues: ClientAttributesHandler (val), u109 (val), Alive (val), Helper (val), Players (val), u104 (val)
    local v1
    if ClientAttributesHandler.getAttribute("HasTargeting") ~= 1 then
        return nil
    end
    if not (p1:IsA("Model")) then
        v1 = p1:FindFirstAncestorOfClass("Model")
    else
        v1 = p1
    end
    if not v1 then
        return u109
    end
    local v2 = Alive.getPlayerFromCharacter(v1)
    if not v2 then
        return u109
    end
    if Helper.IsInSameBranch(Players.LocalPlayer, v2) then
        return u104
    end
    return u109
end
local InstanceAddedSignal = CollectionService:GetInstanceAddedSignal("Focused")
InstanceAddedSignal:Connect(function(p1) -- Line: 99 -- upvalues: getFocusHighlightColor (val), Highlight (val)
    local v1 = getFocusHighlightColor(p1)
    if v1 then
        Highlight.FillColor = v1
        Highlight.OutlineColor = v1
    end
    Highlight.Parent = p1
end)
local InstanceRemovedSignal = CollectionService:GetInstanceRemovedSignal("Focused")
InstanceRemovedSignal:Connect(function(p1) -- Line: 113 -- upvalues: Highlight (val)
    Highlight.Parent = nil
end)
return {
    activated = function() -- Line: 43 -- upvalues: State (val), ClientAttributesHandler (val), Signals (val)
        local Focusing = State("Focusing")
        local Sound = Instance.new("Sound")
        Sound.SoundId = "rbxassetid://104336865699525"
        Sound.Volume = 2
        Sound.Parent = workspace
        Sound:Play()
        Focusing(true)
        local GrappleFocusBaseLength = ClientAttributesHandler.getAttribute("GrappleFocusBaseLength")
        local GrappleFocusLengthMultiplier = ClientAttributesHandler.getAttribute("GrappleFocusLengthMultiplier")
        Signals.Buff:Fire({id = "Focus", length = GrappleFocusBaseLength * GrappleFocusLengthMultiplier})
        task.wait(GrappleFocusBaseLength * GrappleFocusLengthMultiplier)
        Focusing(false)
    end,
    settings = {handles = true},
}