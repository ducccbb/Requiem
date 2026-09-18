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
--File: ReplicatedStorage.Client.Progression.Enchantments.Enchantments.Mythic.Eyes of Ymir
--                              Dumped in 0.000486 seconds
--                          Bytecode version 9  |  4 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Alive = require(Common:WaitForChild("Alive"))
local u47 = nil
local u48 = false
local u49 = nil
local v2 = {
    description = "Ymir has blessed my sight with powers far beyond our understanding.",
    passive = false,
    upgradable = false,
    art = "rbxassetid://75366588329169",
    glow = Color3.fromRGB(137, 212, 255),
    embers = Color3.fromRGB(217, 241, 255),
    pulse = true,
}
local function cleanup() -- Line: 41 -- upvalues: u49 (ref), u47 (ref), u48 (ref)
    if u49 then
        u49:Disconnect()
    end
    if u47 then
        u47:Destroy()
    end
    u48 = false
    u49 = nil
end
return {
    activated = function(p1) -- Line: 54 -- upvalues: u48 (ref), TweenService (val), u47 (ref), cleanup (val), Lighting (val), u49 (ref), UserInputService (val), Players (val), Alive (val)
        local v1
        if u48 then
            v1 = TweenInfo.new(0.2)
            TweenService:Create(u47, v1, {Brightness = 0, Saturation = 0, Contrast = 0, TintColor = Color3.fromRGB(255, 255, 255)}):Play()
            cleanup()
            return
        end
        u47 = Instance.new("ColorCorrectionEffect")
        u47.Parent = Lighting
        v1 = TweenInfo.new(0.2)
        TweenService:Create(u47, v1, {Brightness = -0.1, Saturation = 0, Contrast = 0, TintColor = Color3.fromRGB(255, 255, 255)}):Play()
        u49 = UserInputService.InputBegan:Connect(function(a1, p2) -- Line: 78 -- upvalues: u48 (upval), Players (upval), Alive (upval), p1 (val)
            if a1.UserInputType ~= Enum.UserInputType.MouseButton1 or not u48 then
                return
            end
            local v1 = Players.LocalPlayer:GetMouse().Target:FindFirstAncestorOfClass("Model")
            if not v1 then
                return
            end
            local v2 = Alive.getPlayerFromCharacter(v1)
            if not v2 then
                return
            end
            p1(v2)
        end)
        u48 = true
    end,
    settings = v2,
}