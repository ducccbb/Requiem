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
--                     File: ReplicatedStorage.Common.World.Lighting
--                               Dumped in 0.00122 seconds
--                          Bytecode version 9  |  7 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Lighting = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")
local Workspace = game:GetService("Workspace")
local u27 = {Cycles = {}}
local Cycles = u27.Cycles
Cycles.Day = {
    Range = {Start = 5, End = 15},
    Lighting = {
        Brightness = 3.11,
        EnvironmentDiffuseScale = 1,
        EnvironmentSpecularScale = 1,
        ExposureCompensation = 0.2,
        Ambient = Color3.fromRGB(49, 55, 81),
        ColorShift_Bottom = Color3.fromRGB(68, 76, 109),
        ColorShift_Top = Color3.fromRGB(233, 234, 255),
        OutdoorAmbient = Color3.fromRGB(115, 112, 95),
    },
    Clouds = {Density = 0.7, Color = Color3.fromRGB(255, 255, 255)},
    Correction = {Contrast = 0.2, Saturation = 0.1, TintColor = Color3.fromRGB(255, 255, 255)},
    Rays = {Intensity = 0.01, Spread = 0.1},
    Atmosphere = {
        Glare = 0,
        Haze = 0,
        Density = 0.3,
        Offset = 0.25,
        Color = Color3.fromRGB(199, 199, 199),
        Decay = Color3.fromRGB(106, 112, 125),
    },
}
local Cycles_2 = u27.Cycles
Cycles_2.Sunset = {
    Range = {Start = 15, End = 18},
    Lighting = {
        Brightness = 2.54,
        EnvironmentDiffuseScale = 1,
        EnvironmentSpecularScale = 1,
        ExposureCompensation = 0.1,
        Ambient = Color3.fromRGB(180, 133, 91),
        ColorShift_Bottom = Color3.fromRGB(109, 80, 71),
        ColorShift_Top = Color3.fromRGB(255, 204, 117),
        OutdoorAmbient = Color3.fromRGB(115, 84, 63),
    },
    Clouds = {Color = Color3.fromRGB(255, 207, 158)},
    Correction = {Contrast = 0.2, Saturation = 0.2, TintColor = Color3.fromRGB(255, 234, 216)},
    Rays = {Intensity = 0.086, Spread = 0.11},
    Atmosphere = {
        Glare = 0,
        Haze = 0,
        Density = 0.3,
        Offset = 0.25,
        Color = Color3.fromRGB(199, 199, 199),
        Decay = Color3.fromRGB(106, 112, 125),
    },
}
local Cycles_3 = u27.Cycles
Cycles_3.Night = {
    Range = {Start = 18, End = 5},
    Lighting = {
        Brightness = 2,
        EnvironmentDiffuseScale = 1,
        EnvironmentSpecularScale = 1,
        ExposureCompensation = 0,
        Ambient = Color3.fromRGB(59, 49, 91),
        ColorShift_Bottom = Color3.fromRGB(68, 76, 109),
        ColorShift_Top = Color3.fromRGB(162, 181, 209),
        OutdoorAmbient = Color3.fromRGB(104, 104, 115),
    },
    Clouds = {Density = 0, Color = Color3.fromRGB(0, 0, 0)},
    Correction = {Contrast = 0.2, Saturation = 0.1, TintColor = Color3.fromRGB(255, 255, 255)},
    Rays = {Intensity = 0, Spread = 0},
    Atmosphere = {
        Glare = 0,
        Haze = 0,
        Density = 0.6,
        Offset = 0,
        Color = Color3.fromRGB(199, 199, 199),
        Decay = Color3.fromRGB(106, 112, 125),
    },
}
return {
    Transition = 1.5,
    Speed = 14000,
    Presets = u27,
    ease = function(p1) -- Line: 163 -- upvalues: Workspace (val), Lighting (val), TweenService (val)
        local Clouds = Workspace.Terrain:FindFirstChild("Clouds")
        if not Clouds then
            Clouds = Instance.new("Clouds", Workspace.Terrain)
        end
        local ColorCorrection = Lighting:WaitForChild("ColorCorrection")
        local SunRays = Lighting:WaitForChild("SunRays")
        local Atmosphere = Lighting:WaitForChild("Atmosphere")
        local v1 = TweenInfo.new(2545.4545454545455, Enum.EasingStyle.Linear)
        TweenService:Create(Lighting, v1, p1.Lighting):Play()
        v1 = TweenInfo.new(848.4848484848485, Enum.EasingStyle.Linear)
        TweenService:Create(Clouds, v1, p1.Clouds):Play()
        v1 = TweenInfo.new(2545.4545454545455, Enum.EasingStyle.Linear)
        TweenService:Create(ColorCorrection, v1, p1.Correction):Play()
        v1 = TweenInfo.new(2545.4545454545455, Enum.EasingStyle.Linear)
        TweenService:Create(SunRays, v1, p1.Rays):Play()
        v1 = TweenInfo.new(2545.4545454545455, Enum.EasingStyle.Linear)
        TweenService:Create(Atmosphere, v1, p1.Atmosphere):Play()
    end,
    getCurrentCycleName = function() -- Line: 197 -- upvalues: Lighting (val), u27 (val)
        local ClockTime = Lighting.ClockTime
        local v1 = "Day"
        if u27.Cycles.Sunset.Range.Start > ClockTime then
            if u27.Cycles.Night.Range.Start <= ClockTime then
                v1 = "Night"
            elseif ClockTime < u27.Cycles.Day.Range.Start then
                v1 = "Night"
            end
            return v1
        elseif ClockTime < u27.Cycles.Sunset.Range.End then
            return "Sunset"
        end
    end,
    getNextCycle = function(p1) -- Line: 210
        local v1 = nil
        if p1 == "Day" then
            return "Sunset"
        end
        if p1 == "Sunset" then
            return "Night"
        end
        if p1 == "Night" then
            v1 = "Day"
        end
        return v1
    end,
    getLightingCycle = function() -- Line: 179 -- upvalues: Lighting (val), u27 (val)
        local Day
        local ClockTime = Lighting.ClockTime
        local Sunset = nil
        local v1 = nil
        if u27.Cycles.Sunset.Range.Start > ClockTime then
            if u27.Cycles.Night.Range.Start <= ClockTime then
                Sunset = u27.Cycles.Night
                v1 = "Night"
            elseif ClockTime < u27.Cycles.Day.Range.Start then
                Sunset = u27.Cycles.Night
                v1 = "Night"
            elseif u27.Cycles.Day.Range.Start <= ClockTime and ClockTime < u27.Cycles.Day.Range.End then
                Sunset = u27.Cycles.Day
                v1 = "Day"
            end
        elseif ClockTime < u27.Cycles.Sunset.Range.End then
            Sunset = u27.Cycles.Sunset
            v1 = "Sunset"
        end
        Day = Sunset
        if not Day then
            Day = u27.Cycles.Day
        end
        return Day, v1 or "Day"
    end,
    isTransitionOccurring = function() -- Line: 224 -- upvalues: Lighting (val), u27 (val)
        local ClockTime = Lighting.ClockTime
        for k, v in pairs(u27.Cycles) do
            if (function(p1, p2) -- Line: 228 -- upvalues: ClockTime (val)
    local v1
    if p1 >= p2 then
        if p1 > ClockTime then
            if 0 > ClockTime then
                if p1 > ClockTime then
                    v1 = false
                    if p2 - 1.5 <= ClockTime then
                        if ClockTime <= p2 then
                            v1 = true
                        else
                            v1 = false
                        end
                    end
                else
                    v1 = true
                    if ClockTime > p1 + 1.5 then
                        v1 = false
                        if p2 - 1.5 <= ClockTime then
                            if ClockTime <= p2 then
                                v1 = true
                            else
                                v1 = false
                            end
                        end
                    end
                end
            else
                v1 = true
                if ClockTime <= p2 then end
            end
        else
            v1 = true
            if ClockTime <= 24 then end
        end
        return v1
    else
        if p1 > ClockTime then
            v1 = false
            if p2 - 1.5 <= ClockTime then
                if ClockTime <= p2 then
                    v1 = true
                else
                    v1 = false
                end
            end
        else
            v1 = true
            if ClockTime > p1 + 1.5 then
                v1 = false
                if p2 - 1.5 <= ClockTime then
                    if ClockTime <= p2 then
                        v1 = true
                    else
                        v1 = false
                    end
                end
            end
        end
        return v1
    end
end)(v.Range.Start, v.Range.End) then
                return true, v
            end
        end
        return false, nil
    end,
}