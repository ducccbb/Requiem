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
--           File: ReplicatedStorage.Client.Interfaces.Routes.Screen.Freezing
--                               Dumped in 0.00100 seconds
--                          Bytecode version 9  |  9 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Types = Common:WaitForChild("Types")
local Locations = require(Types:WaitForChild("Locations"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_2:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local Hooks = script.Parent.Parent.Parent:WaitForChild("Hooks")
local useMotion = require(Hooks:WaitForChild("useMotion"))
return function() -- Line: 25 -- upvalues: useMotion (val), react (val), Lighting (val), Players (val), Locations (val), TweenService (val)
    local u3, v1
    v1, u3 = useMotion(0)
    local u9 = react.useRef(Instance.new("ColorCorrectionEffect"))
    react.useEffect(function() -- Line: 30 -- upvalues: u9 (val), Lighting (upval)
        local current
        if not u9.current then
            return
        end
        current = u9.current
        current.Name = "FreezingColorCorrection"
        current.Parent = Lighting
    end, {})
    react.useEffect(function() -- Line: 40 -- upvalues: Players (upval), Locations (upval), u3 (val), u9 (val), TweenService (upval)
        local u2 = coroutine.create(function() -- Line: 41 -- upvalues: Players (upval), Locations (upval), u3 (upval), u9 (upval), TweenService (upval)
            local lerp, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10
            while task.wait(1) do
                v1 = game.PlaceId == Locations.Places[Locations.Locations.TUNDRA]
                v4 = workspace:GetAttribute("TemperatureOverride") ~= nil
                if v1 then
                    v6 = (88 - (Players.LocalPlayer:GetAttribute("Temperature") or 98)) / 5
                    v5 = math.clamp(v6, 0, 1)
                    v8 = {frequency = 2}
                    u3:spring(v5, v8)
                    if u9.current then
                        function lerp(p1, p2, p3) -- Line: 63
                            return p1 + (p2 - p1) * p3
                        end
                        v7 = lerp(0, 0.5, v5)
                        v8 = lerp(0, -0.8, v5)
                        v10 = lerp(255, 160, v5)
                        v2 = lerp(255, 201, v5)
                        v9 = Color3.fromRGB(v10, v2, lerp(255, 255, v5))
                        v3 = TweenInfo.new(3)
                        TweenService:Create(u9.current, v3, {Contrast = v7, Saturation = v8, TintColor = v9}):Play()
                    end
                elseif not v4 then
                end
            end
        end)
        coroutine.resume(u2)
        return function() -- Line: 87 -- upvalues: u2 (val)
            coroutine.close(u2)
        end
    end, {})
    return react.createElement("Frame", {BackgroundTransparency = 1, AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5), Size = UDim2.fromScale(1, 1)}, {Vignette = react.createElement("ImageLabel", {
        Image = "rbxassetid://135589412519765",
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ImageColor3 = Color3.fromRGB(11, 152, 239),
        ImageTransparency = v1:map(function(p1) -- Line: 102
            return 0.68 + (1 - p1) * 0.32
        end),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(12, 17, 18),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1.5, 1),
    }), Snow = react.createElement("ImageLabel", {
        Image = "rbxassetid://107154912681755",
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ImageColor3 = Color3.fromRGB(179, 202, 255),
        ImageTransparency = v1:map(function(p1) -- Line: 118
            return 0.57 + (1 - p1) * 0.43
        end),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1.15, 1.15),
    })})
end