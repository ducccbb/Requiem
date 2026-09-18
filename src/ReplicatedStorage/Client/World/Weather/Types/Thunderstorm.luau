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
--            File: ReplicatedStorage.Client.World.Weather.Types.Thunderstorm
--                              Dumped in 0.000672 seconds
--                          Bytecode version 9  |  6 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Workspace = game:GetService("Workspace")
local WorldRainClient = require(script.Parent.Parent:WaitForChild("WorldRainClient"))
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Sounds = require(Utilities:WaitForChild("Sounds"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Sounds_2 = Common_2:WaitForChild("Sounds")
local Universal = require(Sounds_2:WaitForChild("Universal"))
local u78 = 0
local u79 = nil
local u80 = nil
local u81 = nil
local function onLightningTickStepped() -- Line: 36 -- upvalues: u79 (ref), TweenService (val), Universal (val), Sounds (val), Lighting (val)
    local v1 = Random.new(u79):NextInteger(1, 100)
    if 40 <= v1 then
        return
    end
    local ColorCorrectionEffect = Instance.new("ColorCorrectionEffect")
    ColorCorrectionEffect.Brightness = 1.4
    ColorCorrectionEffect.Contrast = 0.5
    ColorCorrectionEffect.Saturation = 0.75
    ColorCorrectionEffect.TintColor = Color3.fromRGB(255, 255, 255)
    local v2 = TweenInfo.new(0.25)
    TweenService:Create(ColorCorrectionEffect, v2, {Brightness = 0, Contrast = 0, Saturation = 0, TintColor = Color3.fromRGB(255, 255, 255)}):Play()
    local v3 = Universal.Thunder[math.random(1, #Universal.Thunder)]
    Sounds.playGlobalSoundEffect(v3, 0.25, 1, nil, NumberRange.new(0.9, 1.1))
    ColorCorrectionEffect.Parent = Lighting
end
return {
    begin = function() -- Line: 68 -- upvalues: u80 (ref), WorldRainClient (val), u78 (ref), Workspace (val), u81 (ref), RunService (val), u79 (ref), onLightningTickStepped (val)
        u80 = task.delay(8, function() -- Line: 69 -- upvalues: WorldRainClient (upval)
            WorldRainClient.begin()
        end)
        u78 = Workspace:GetServerTimeNow()
        u81 = RunService.RenderStepped:Connect(function(p1) -- Line: 77 -- upvalues: u78 (upval), u79 (upval), onLightningTickStepped (upval)
            u78 = u78 + p1
            local v1 = math.floor(u78 / 10) * 10
            if v1 == u79 then
                if not u79 then
                    u79 = v1
                end
                return
            end
            if u79 then
                u79 = v1
                onLightningTickStepped()
                return
            end
            if not u79 then
                u79 = v1
            end
        end)
    end,
    stop = function() -- Line: 96 -- upvalues: WorldRainClient (val), u80 (ref), u81 (ref), u79 (ref), u78 (ref)
        WorldRainClient.stop()
        if u80 then
            task.cancel(u80)
            u80 = nil
        end
        if u81 then
            u81:Disconnect()
            u81 = nil
        end
        u79 = nil
        u78 = 0
    end,
}