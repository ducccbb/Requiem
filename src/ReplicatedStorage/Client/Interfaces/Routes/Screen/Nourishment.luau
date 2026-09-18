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
--          File: ReplicatedStorage.Client.Interfaces.Routes.Screen.Nourishment
--                               Dumped in 0.00113 seconds
--                          Bytecode version 9  |  10 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local Lighting = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Config = require(Common:WaitForChild("Config"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Food = Common_2:WaitForChild("Food")
local NourishmentDebuffs = require(Food:WaitForChild("NourishmentDebuffs"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_3:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Network = Common_3:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Server = require(Namespaces:WaitForChild("Server"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_5:WaitForChild("Common")
local Network_2 = Common_4:WaitForChild("Network")
local Namespaces_2 = Network_2:WaitForChild("Namespaces")
local Vitality = require(Namespaces_2:WaitForChild("Vitality"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_6:WaitForChild("Client")
local User = Client:WaitForChild("User")
local State = User:WaitForChild("State")
local ClientStatusHandler = require(State:WaitForChild("ClientStatusHandler"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_7:WaitForChild("Common")
local Statistics = Common_5:WaitForChild("Statistics")
local useBlurEffect = require(Statistics:WaitForChild("useBlurEffect"))
local Hooks = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useMotion = require(Hooks:WaitForChild("useMotion"))
local Hooks_2 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useStore = require(Hooks_2:WaitForChild("useStore"))
local u187 = TweenInfo.new(1.5)
local u188 = {
    "Peckish",
    "Hungry",
    "Starving",
    "Thirsty",
    "Parched",
    "Dehydrated",
}
return function() -- Line: 40 -- upvalues: useBlurEffect (val), useMotion (val), useStore (val), Vitality (val), Server (val), react (val), NourishmentDebuffs (val), Config (val), Lighting (val), u187 (val), TweenService (val), u188 (val), ClientStatusHandler (val)
    local u2, u6, v1, visuals
    _, u2 = useBlurEffect()
    v1, u6 = useMotion(1)
    local u11 = useStore(Vitality.Store, function(p1) -- Line: 44
        if not p1 then
            return {hunger = 100, thirst = 100, maxHunger = 100, maxThirst = 100}
        end
        return {hunger = p1.hunger or 0, thirst = p1.thirst or 0, maxHunger = p1.maxHunger or 100, maxThirst = p1.maxThirst or 100}
    end)
    local v2 = useStore(Server.Store, function(p1) -- Line: 62
        local event
        if not p1 then
            event = 0
        else
            event = p1.event
            if not event then
                event = 0
            end
        end
        return event
    end)
    local u22 = react.useMemo(function() -- Line: 66 -- upvalues: NourishmentDebuffs (upval), u11 (val)
        return NourishmentDebuffs.resolveDebuffState(u11.hunger, u11.maxHunger, u11.thirst, u11.maxThirst)
    end, {u11})
    local u28 = if v2 == 0 then Config.Constants.IsDebuggingPlace == true else true
    if not u28 then
        visuals = NourishmentDebuffs.NONE_VISUALS
    else
        visuals = u22.visuals
    end
    local u39 = react.useRef(Instance.new("ColorCorrectionEffect"))
    react.useEffect(function() -- Line: 80 -- upvalues: u39 (val), Lighting (upval)
        local current = u39.current
        if not current then
            return
        end
        current.Name = "NourishmentColorCorrection"
        current.Parent = Lighting
        return function() -- Line: 89 -- upvalues: current (val)
            current:Destroy()
        end
    end, {})
    react.useEffect(function() -- Line: 94 -- upvalues: u2 (val), visuals (val), u187 (upval), u6 (val), u39 (val), TweenService (upval)
        local u7 = u2("nourishment", visuals.blur, "set", 4, u187)
        u6:spring(visuals.vignetteTransparency, {frequency = 1.5})
        local current = u39.current
        if current then
            TweenService:Create(current, u187, {Saturation = visuals.saturation, Brightness = visuals.brightness, Contrast = visuals.contrast}):Play()
        end
        return function() -- Line: 110 -- upvalues: u7 (val), u187 (upval)
            u7(u187)
        end
    end, {
        visuals.blur,
        visuals.saturation,
        visuals.brightness,
        visuals.contrast,
        visuals.vignetteTransparency,
    })
    react.useEffect(function() -- Line: 115 -- upvalues: u28 (val), u188 (upval), ClientStatusHandler (upval), u22 (val)
        local v1, v2, v3, v4, v5
        if not u28 then
            v1 = u188
            v2 = nil
            v3 = nil
            for k, n in v1, v2, v3 do
                if ClientStatusHandler.hasPlayerStatus(n) then
                    ClientStatusHandler.removePlayerStatus(n)
                end
            end
            return
        end
        v1 = {}
        if u22.hungerTier then
            v1[u22.hungerTier.status] = true
        end
        if u22.thirstTier then
            v1[u22.thirstTier.status] = true
        end
        v2 = u188
        v3 = nil
        local v6 = nil
        for i, j in v2, v3, v6 do
            v4 = v1[j] == true
            v5 = ClientStatusHandler.hasPlayerStatus(j)
            if not v4 then
                if not v4 and v5 then
                    ClientStatusHandler.removePlayerStatus(j)
                end
            elseif not v5 then
                ClientStatusHandler.addPlayerStatus(j)
            end
        end
    end, {u28, u22.hungerTier, u22.thirstTier})
    return react.createElement("Frame", {BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1)}, {Vignette = react.createElement("ImageLabel", {
        Image = "rbxassetid://135589412519765",
        BackgroundTransparency = 1,
        ZIndex = 0,
        ImageColor3 = Color3.fromRGB(36, 24, 12),
        ImageTransparency = v1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1.15, 1.15),
    })})
end