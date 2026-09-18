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
--           File: ReplicatedStorage.Client.Interfaces.Components.Screen.Emote
--                               Dumped in 0.00242 seconds
--                          Bytecode version 9  |  15 functions

local v1
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Emotes = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Emotes")
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Character = require(Utilities:WaitForChild("Character"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Network = Common_2:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Player = require(Namespaces:WaitForChild("Player"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_4:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_5:WaitForChild("Common")
local Signals = require(Common_3:WaitForChild("Signals"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Packages_2 = ReplicatedStorage_6:WaitForChild("Packages")
local trove = require(Packages_2:WaitForChild("trove"))
local Radial = require(script.Parent:WaitForChild("Radial"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_7:WaitForChild("Client")
local User = Client:WaitForChild("User")
local State = User:WaitForChild("State")
local ClientSettingsHandler = require(State:WaitForChild("ClientSettingsHandler"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_8:WaitForChild("Client")
local User_2 = Client_2:WaitForChild("User")
local State_2 = User_2:WaitForChild("State")
local ClientStateHandler = require(State_2:WaitForChild("ClientStateHandler"))
local States = ClientStateHandler.States
local Categories = ClientStateHandler.Categories
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_9:WaitForChild("Common")
local Observers = Common_4:WaitForChild("Observers")
local useAnimatorObserver = require(Observers:WaitForChild("useAnimatorObserver"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_10:WaitForChild("Common")
local Statistics = Common_5:WaitForChild("Statistics")
local useJumpPower = require(Statistics:WaitForChild("useJumpPower"))
local ReplicatedStorage_11 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_11:WaitForChild("Common")
local Statistics_2 = Common_6:WaitForChild("Statistics")
local useWalkSpeed = require(Statistics_2:WaitForChild("useWalkSpeed"))
local u320 = {
    {Name = "Sleep", Image = "rbxassetid://11963354446"},
    {Name = "Sit", Image = "rbxassetid://12966426423"},
    {Name = "Lean", Image = "rbxassetid://11432855001"},
    {Name = "Emote", Image = "rbxassetid://11432850205"},
    {Name = "Formal", Image = "rbxassetid://12974250071"},
    {Name = "Religious", Image = "rbxassetid://14202377484"},
    {Name = "Other", Image = "rbxassetid://11432831662"},
    {Name = "Chair", Image = "rbxassetid://12966426423"},
}
local u321 = {}
local u322 = {
    "At Ease",
    "Surrender",
    "Clapping",
    "Confused",
    "CrossArms",
    "Inspect",
    "Six Seven",
    "Pray 2",
    "stretch",
    "headache",
    "I dont know",
}
for i, j in Emotes:GetChildren() do
    u321[j.Name] = {}
    for k, n in j:GetChildren() do
        v1 = u321[j.Name]
        v1[k] = {Name = n.Name, Animation = n.AnimationId, Offset = CFrame.new(-4, 0, -4)}
    end
end
local u265 = trove.new()
local function compareString(p1, p2) -- Line: 97
    local v1
    function v1(p1) -- Line: 99
        local v1 = string.lower(p1)
        return string.gsub(v1, "[%s_]", "")
    end
    local v2 = v1(p1)
    local v3 = v2 == v1(p2)
    return v3
end
local function isWalkingEmote(p1) -- Line: 108 -- upvalues: u322 (val), compareString (val)
    local v1 = u322
    local v2 = nil
    local v3 = nil
    for i, j in v1, v2, v3 do
        if compareString(j, p1) then
            return true
        end
    end
    return false
end
local function isEmoteAnimation(p1) -- Line: 118 -- upvalues: u321 (val), compareString (val)
    local v1, v2, v3
    local v4 = u321
    local v5 = nil
    local v6 = nil
    for i, j in v4, v5, v6 do
        v1 = j
        v2 = nil
        v3 = nil
        for k, n in v1, v2, v3 do
            if compareString(n.Animation, v7) then
                return true
            end
        end
    end
    return false
end
local function onPlayEmote(p1) -- Line: 137 -- upvalues: ClientStateHandler (val), Categories (val), States (val), Signals (val), Player (val), u321 (val), compareString (val), Character (val), isEmoteAnimation (val), u265 (val), isWalkingEmote (val), useWalkSpeed (val), useJumpPower (val), useAnimatorObserver (val), RunService (val)
    if ClientStateHandler.isCategoryBusy(Categories.STRICT) then
        return Signals.Toast:Fire({message = "You cannot emote at this time.", type = "error"})
    elseif ClientStateHandler.isCategoryBusy(Categories.NO_GEAR_HANDLE_USAGE) then
        return Signals.Toast:Fire({message = "You cannot emote at this time.", type = "error"})
    elseif ClientStateHandler.isCategoryBusy(Categories.TOOLS) then
        return Signals.Toast:Fire({message = "You cannot emote at this time.", type = "error"})
    else
        local v1
        if ClientStateHandler.isStateBusy(States.COMBATTING) then
            return Signals.Toast:Fire({message = "You cannot emote at this time.", type = "error"})
        end
        local Animation = nil
        local v2 = nil
        if string.lower(p1) ~= "custom" then
            local v3, v4, v5
            local v6 = u321
            local v7 = nil
            local v8 = nil
            v1 = p1
            for i, j in v6, v7, v8 do
                v4 = j
                v5 = nil
                v3 = nil
                for k, n in v4, v5, v3 do
                    if compareString(n.Name, v1) then
                        Animation = n.Animation
                        v2 = i
                        break
                    end
                end
            end
            v6 = Character.getCharacter()
            if not v6 then
                return
            end
            local Humanoid = v6:FindFirstChild("Humanoid")
            if not Humanoid then
                return
            end
            local Animator = Humanoid:FindFirstChild("Animator")
            if not Animator then
                return
            end
            if string.lower(v1) == "end" then
                for i2, v in ipairs(Animator:GetPlayingAnimationTracks()) do
                    if isEmoteAnimation(v.Animation.AnimationId) then
                        v:Stop()
                    end
                end
                u265:Clean()
                return
            elseif string.lower(v1) ~= "un" then
                if not Animation then
                    return
                else
                    if not v2 then
                        return
                    end
                    u265:Clean()
                    if v2 ~= "Emote" then
                        if v2 ~= "Chair" then
                            local v9
                            local u142 = nil
                            local u152 = nil
                            if not (isWalkingEmote(v1)) then
                                local v10
                                _, v5 = useWalkSpeed()
                                u142 = v5("emote", 5, "set", 10)
                                _, v10 = useJumpPower()
                                u152 = v10("emote", 0, "set", 10)
                            end
                            local u161 = useAnimatorObserver.play(Animation, 0.2, Enum.AnimationPriority.Action3)
                            if u161 then
                                v3 = string.lower(v1)
                                if string.find(v3, "pushup") then
                                    u161.Looped = true
                                end
                            end
                            local u181 = if not (isWalkingEmote(v1)) then RunService.RenderStepped:Connect(function() -- Line: 263 -- upvalues: Character (upval), u265 (upval)
    local v1, v9, v2, v6, v7
    v1 = Character.getCharacter()
    if not v1 or v1.Humanoid.MoveDirection.Magnitude ~= 0 then
        u265:Clean()
        return
    end
    if v1.HumanoidRootPart.AssemblyLinearVelocity.Magnitude < 15 then
        return
    end
    u265:Clean()
    return
end) else nil
                            u265:Add(function() -- Line: 280 -- upvalues: u161 (val), u142 (ref), u152 (ref), u181 (ref)
                                if u161 then
                                    u161:Stop(0.2)
                                end
                                if u142 then
                                    u142()
                                end
                                if u152 then
                                    u152()
                                end
                                if u181 then
                                    u181:Disconnect()
                                end
                            end)
                            return
                        else
                            local PlayingAnimationTracks = Animator:GetPlayingAnimationTracks()
                            for i3, m in ipairs(PlayingAnimationTracks) do
                                if m.Animation.AnimationId == Animation then
                                    m:Stop(0.2)
                                    break
                                end
                            end
                            if not Humanoid.SeatPart then
                                return Signals.Toast:Fire({message = "You must be seated to use this emote.", type = "error"})
                            end
                        end
                    elseif Player.Store.client().client.supporter ~= 1 then
                        return Signals.Toast:Fire({message = "You do not have access to this emote.", type = "error"})
                    end
                end
            end
        else
            v2 = "Custom"
            local emote = Player.Store.client().client.emote
            if not emote then
                return Signals.Toast:Fire({message = "You do not have a custom emote.", type = "error"})
            else
                if emote == "" then
                    return Signals.Toast:Fire({message = "You do not have a custom emote.", type = "error"})
                end
                Animation = emote
                v1 = p1
            end
        end
    end
end
Signals.Emote:Connect(onPlayEmote)
return function() -- Line: 303 -- upvalues: react (val), ClientSettingsHandler (val), Radial (val), u320 (val), u321 (val), onPlayEmote (val)
    react.useEffect(function() -- Line: 304 -- upvalues: ClientSettingsHandler (upval), Radial (upval), u320 (upval), u321 (upval), onPlayEmote (upval)
        local u7 = ClientSettingsHandler.onKeybindPressed("Emote"):Connect(function() -- Line: 305 -- upvalues: Radial (upval), u320 (upval), u321 (upval), onPlayEmote (upval)
            Radial.updateRadialMenu({enabled = true, options = u320}):Connect(function(p1) -- Line: 306 -- upvalues: u321 (upval), Radial (upval), onPlayEmote (upval)
                local Name = p1.Name
                Radial.updateRadialMenu({enabled = true, options = u321[Name], key = Name}):Connect(function(p1) -- Line: 310 -- upvalues: Radial (upval), onPlayEmote (upval)
                    Radial.updateRadialMenu({enabled = false})
                    onPlayEmote(p1.Name)
                end)
            end)
        end)
        local u15 = ClientSettingsHandler.onKeybindReleased("Emote"):Connect(function() -- Line: 319 -- upvalues: Radial (upval)
            Radial.updateRadialMenu({enabled = false})
        end)
        return function() -- Line: 323 -- upvalues: u7 (val), u15 (val), Radial (upval)
            u7:Disconnect()
            u15:Disconnect()
            Radial.updateRadialMenu({enabled = false})
        end
    end, {})
    return react.createElement(react.Fragment, {})
end