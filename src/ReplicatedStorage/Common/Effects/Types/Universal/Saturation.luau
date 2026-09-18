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
--           File: ReplicatedStorage.Common.Effects.Types.Universal.Saturation
--                              Dumped in 0.000393 seconds
--                          Bytecode version 9  |  4 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Lighting = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage:WaitForChild("Client")
local User = Client:WaitForChild("User")
local State = User:WaitForChild("State")
local ClientSettingsHandler = require(State:WaitForChild("ClientSettingsHandler"))
return function(p1) -- Line: 16 -- upvalues: ClientSettingsHandler (val), Lighting (val), TweenService (val)
    local u1 = p1 or 1
    if not (ClientSettingsHandler.getSettingFromName("Kill Saturation")) then
        return
    end
    local ColorCorrectionEffect = Instance.new("ColorCorrectionEffect")
    ColorCorrectionEffect.Saturation = 0
    ColorCorrectionEffect.Brightness = 0
    ColorCorrectionEffect.TintColor = Color3.fromRGB(255, 255, 255)
    ColorCorrectionEffect.Parent = Lighting
    local v1 = TweenInfo.new(0.5)
    TweenService:Create(ColorCorrectionEffect, v1, {Saturation = -0.8 * u1}):Play()
    v1 = TweenInfo.new(0.2)
    TweenService:Create(ColorCorrectionEffect, v1, {Brightness = 0.5 * u1}):Play()
    task.spawn(function() -- Line: 38 -- upvalues: TweenService (upval), ColorCorrectionEffect (val), u1 (val)
        task.wait(0.2)
        local v1 = TweenInfo.new(0.2)
        TweenService:Create(ColorCorrectionEffect, v1, {Brightness = -0.5 * u1}):Play()
        task.delay(0.2, function() -- Line: 45 -- upvalues: TweenService (upval), ColorCorrectionEffect (upval), u1 (upval)
            local v1 = TweenInfo.new(0.2)
            TweenService:Create(ColorCorrectionEffect, v1, {Brightness = 0 * u1}):Play()
        end)
        task.wait(0.3)
        v1 = TweenInfo.new(1)
        TweenService:Create(ColorCorrectionEffect, v1, {Saturation = 0 * u1}):Play()
    end)
end