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
--        File: ReplicatedStorage.Client.User.Miscellaneous.ClientStrangerHandler
--                              Dumped in 0.000890 seconds
--                          Bytecode version 9  |  6 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Assets = ReplicatedStorage:FindFirstChild("Assets")
local Lighting = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Alive = require(Common:WaitForChild("Alive"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Utilities = Common_2:WaitForChild("Utilities")
local Character = require(Utilities:WaitForChild("Character"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Network = Common_3:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Friends = require(Namespaces:WaitForChild("Friends"))
local State = script.Parent.Parent:WaitForChild("State")
local ClientSettingsHandler = require(State:WaitForChild("ClientSettingsHandler"))
local LocalPlayer = game:GetService("Players").LocalPlayer
local function getPlayerFromCharacter(p1) -- Line: 28 -- upvalues: Alive (val)
    for k, v in pairs(Alive.getPlayers()) do
        if v:GetAttribute("Character") == p1 then
            return v
        end
    end
    return nil
end
;(function() -- Line: 42 -- upvalues: Lighting (val), ClientSettingsHandler (val), TweenService (val), Friends (val), LocalPlayer (val), getPlayerFromCharacter (val), Alive (val), Assets (val)
    local ColorCorrectionEffect = Instance.new("ColorCorrectionEffect")
    ColorCorrectionEffect.Parent = Lighting
    local u4 = {}
    ClientSettingsHandler.onKeybindPressed("View Names"):Connect(function() -- Line: 48 -- upvalues: TweenService (upval), ColorCorrectionEffect (val), Friends (upval), LocalPlayer (upval), getPlayerFromCharacter (upval), Alive (upval), Assets (upval), u4 (ref)
        local Attribute, Name, v1, v2, v3
        local v4 = TweenInfo.new(0.2)
        TweenService:Create(ColorCorrectionEffect, v4, {Brightness = -0.1, Saturation = 0, Contrast = 0, TintColor = Color3.fromRGB(255, 255, 255)}):Play()
        local v5 = Friends.Store.get(LocalPlayer)
        for k, v in pairs(v5) do
            v2 = getPlayerFromCharacter(v.character)
            if v2 then
                Attribute = v2:GetAttribute("DisplayName")
                if not Attribute then
                    Attribute = v2:GetAttribute("Name")
                end
                v3 = Alive.getAliveCharacter(v2)
                if v3 and not (v3:HasTag("NoName")) and not (v3:GetAttribute("Cloaked")) then
                    v1 = Assets.Particles.UI.Nametag:Clone()
                    table.insert(u4, v1)
                    Name = v1:FindFirstChild("Name")
                    Name.Text = tostring(Attribute)
                    v1.Parent = v3:WaitForChild("Head")
                end
            end
        end
    end)
    ClientSettingsHandler.onKeybindReleased("View Names"):Connect(function() -- Line: 77 -- upvalues: TweenService (upval), ColorCorrectionEffect (val), u4 (ref)
        local v1 = TweenInfo.new(1)
        TweenService:Create(ColorCorrectionEffect, v1, {Brightness = 0, Saturation = 0, Contrast = 0, TintColor = Color3.fromRGB(255, 255, 255)}):Play()
        for k, v in pairs(u4) do
            v:Destroy()
        end
        u4 = {}
    end)
end)()
return {
    getPlayerName = function(p1, p2, p3) -- Line: 92 -- upvalues: Character (val), Friends (val), getPlayerFromCharacter (val)
        local Attribute, v1, v2
        if not p3 then
            v2 = "Someone"
        else
            v2 = "someone"
        end
        local v3 = Character.getCharacter(p2)
        if not v3 or v3:HasTag("NoName") or v3:GetAttribute("Cloaked") then
            return v2
        end
        local v4 = Friends.Store.get(p1)
        if not v4 then
            return v2
        end
        for k, v in pairs(v4) do
            v1 = getPlayerFromCharacter(v.character)
            if v1 and v1 == p2 then
                Attribute = p2:GetAttribute("DisplayName")
                if not Attribute then
                    Attribute = p2:GetAttribute("Name")
                end
                return (tostring(Attribute))
            end
        end
        return v2
    end,
}