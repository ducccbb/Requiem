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
--File: ReplicatedStorage.Client.User.Miscellaneous.Anxiety.Verifiable.NearbyDeathAnxiety
--                              Dumped in 0.000969 seconds
--                          Bytecode version 9  |  10 functions

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
local Utilities = Common:WaitForChild("Utilities")
local Camera = require(Utilities:WaitForChild("Camera"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Network = Common_2:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Player = require(Namespaces:WaitForChild("Player"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Signals = require(Common_3:WaitForChild("Signals"))
local ClientAnxietyHandler = require(script.Parent.Parent:WaitForChild("ClientAnxietyHandler"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_4:WaitForChild("Client")
local Progression = Client:WaitForChild("Progression")
local ClientAttributesHandler = require(Progression:WaitForChild("ClientAttributesHandler"))
local function calculateDeathMultiplier(p1) -- Line: 32
    return (math.clamp(math.exp(p1 * -0.1) * 0.7 + 0.3, 0.3, 1))
end
local function calculateBaseMultiplier(p1) -- Line: 51
    return (math.clamp(math.exp(math.clamp(p1 / 100, 0, 1) * -6) * 0.8 + 0.2, 0.2, 1))
end
local function onFirstDeathExperienced(p1) -- Line: 75 -- upvalues: ClientAnxietyHandler (val), RunService (val), Signals (val), Player (val)
    local u4 = ClientAnxietyHandler.addClientAdjustment({amount = 30, impact = 95, maximum = 95, key = "nearby_death"})
    task.delay(4, function() -- Line: 90 -- upvalues: ClientAnxietyHandler (upval), u4 (val)
        ClientAnxietyHandler.removeClientAdjustment(u4)
    end)
    local CurrentCamera = workspace.CurrentCamera
    local u18 = RunService.RenderStepped:Connect(function(a1) -- Line: 98 -- upvalues: CurrentCamera (val), p1 (val)
        local v1 = CFrame.new(CurrentCamera.CFrame.Position, p1)
        CurrentCamera.CFrame = CurrentCamera.CFrame:Lerp(v1, a1 * 2)
    end)
    Signals.Monologue:Fire({"He's gone, I've seen my first death...", "He's dead, right in front of me..."}, "Shake")
    task.delay(0.7, function() -- Line: 105 -- upvalues: u18 (ref)
        u18:Disconnect()
    end)
    task.delay(2, function() -- Line: 109 -- upvalues: Signals (upval)
        Signals.Monologue:Fire({"I'm going to be sick..."}, "Wobble")
        task.wait(2)
        Signals.Monologue:Fire({"Why? What went wrong to where it became this... unbearable?", "I can't handle this..."}, "Shake")
        task.wait(2)
        Signals.Monologue:Fire({"I'm not sure what to do...", "I need to get out of here..."}, "Wobble")
    end)
    Player.Anxiety.post({death = true})
    return true
end
return {
    verify = function(p1) -- Line: 142 -- upvalues: Camera (val), Players (val), ClientAttributesHandler (val), Signals (val), onFirstDeathExperienced (val), calculateDeathMultiplier (val), calculateBaseMultiplier (val), ClientAnxietyHandler (val), Player (val)
        local v1, v2
        if not (Camera.isVectorWithinView(p1)) then
            return false
        end
        local LocalPlayer = Players.LocalPlayer
        local Character = LocalPlayer
        if Character then
            Character = LocalPlayer.Character
            if Character then
                Character = LocalPlayer.Character:HasTag("Shifter")
            end
        end
        if Character then
            return false
        end
        local v3 = ClientAttributesHandler.getAttribute("Desensitized") == 1
        if v3 then
            Signals.Monologue:Fire({"I don't feel anymore.", "Death doesn't scare me.", "..."})
            return false
        end
        local v4 = ClientAttributesHandler.getAttribute("HasExperiencedDeathAnxietyData") == 0
        if v4 then
            return onFirstDeathExperienced(p1)
        end
        local DeathsAnxietyData = ClientAttributesHandler.getAttribute("DeathsAnxietyData")
        local BaseAnxietyData = ClientAttributesHandler.getAttribute("BaseAnxietyData")
        if typeof(DeathsAnxietyData) ~= "number" then
            v1 = 0
        else
            v1 = DeathsAnxietyData
        end
        if typeof(BaseAnxietyData) ~= "number" then
            v2 = 0
        else
            v2 = BaseAnxietyData
            if not v2 then
                v2 = 0
            end
        end
        local v5 = (calculateDeathMultiplier(v1) * 20 + calculateBaseMultiplier(v2) * 5) / 3
        local u88 = ClientAnxietyHandler.addClientAdjustment({
            impact = 90,
            maximum = 90,
            key = "nearby_death",
            amount = v5,
            reason = {"Another soul has been lost the the cold hands of death...", "Another life has been taken, was it worth it all?", "Why do we continue to live in this world, when it's so full of pain and suffering?"},
        })
        task.delay(3, function() -- Line: 212 -- upvalues: ClientAnxietyHandler (upval), u88 (val)
            ClientAnxietyHandler.removeClientAdjustment(u88)
        end)
        Player.Anxiety.post({death = true})
        return true
    end,
}