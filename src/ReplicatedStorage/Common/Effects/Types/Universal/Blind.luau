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
--             File: ReplicatedStorage.Common.Effects.Types.Universal.Blind
--                              Dumped in 0.000310 seconds
--                          Bytecode version 9  |  3 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local LocalPlayer = game:GetService("Players").LocalPlayer
local TweenService = game:GetService("TweenService")
return function(...) -- Line: 14 -- upvalues: LocalPlayer (val), TweenService (val)
    if ....type ~= "Create" then
        local PlayerGui = LocalPlayer.PlayerGui
        local v1 = TweenInfo.new(0.35)
        TweenService:Create(PlayerGui:FindFirstChild("PlayerBlindness").Frame, v1, {BackgroundTransparency = 1}):Play()
        task.delay(0.6, function() -- Line: 35 -- upvalues: PlayerGui (val)
            PlayerGui:FindFirstChild("PlayerBlindness"):Destroy()
        end)
        return
    end
    local PlayerGui_2 = LocalPlayer.PlayerGui
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "PlayerBlindness"
    ScreenGui.IgnoreGuiInset = true
    local Frame = Instance.new("Frame")
    Frame.BackgroundColor3 = Color3.new(0, 0, 0)
    Frame.AnchorPoint = Vector2.new(0.5, 0.5)
    Frame.Size = UDim2.fromScale(5, 5)
    Frame.BackgroundTransparency = 1
    Frame.Parent = ScreenGui
    ScreenGui.Parent = PlayerGui_2
    local v2 = TweenInfo.new(0.35)
    TweenService:Create(Frame, v2, {BackgroundTransparency = 0}):Play()
end