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
--             File: ReplicatedStorage.Client.Interfaces.Routes.Screen.Shake
--                               Dumped in 0.00154 seconds
--                          Bytecode version 9  |  11 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Gear = require(Namespaces:WaitForChild("Gear"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Promise = require(Common_2:WaitForChild("Promise"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_3:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Utilities = Common_3:WaitForChild("Utilities")
require(Utilities:WaitForChild("Signal"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_5:WaitForChild("Common")
local Signals = require(Common_4:WaitForChild("Signals"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_6:WaitForChild("Common")
local Animations = Common_5:WaitForChild("Animations")
local Gear_2 = require(Animations:WaitForChild("Gear"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_7:WaitForChild("Common")
local Observers = Common_6:WaitForChild("Observers")
local useAnimatorObserver = require(Observers:WaitForChild("useAnimatorObserver"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Common_7 = ReplicatedStorage_8:WaitForChild("Common")
local Utilities_2 = Common_7:WaitForChild("Utilities")
local Sounds = require(Utilities_2:WaitForChild("Sounds"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Common_8 = ReplicatedStorage_9:WaitForChild("Common")
local Sounds_2 = Common_8:WaitForChild("Sounds")
local Gear_3 = require(Sounds_2:WaitForChild("Gear"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_10:WaitForChild("Client")
local Progression = Client:WaitForChild("Progression")
local ClientAttributesHandler = require(Progression:WaitForChild("ClientAttributesHandler"))
local Hooks = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useAsyncEffect = require(Hooks:WaitForChild("useAsyncEffect"))
local Hooks_2 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useEventListener = require(Hooks_2:WaitForChild("useEventListener"))
local Hooks_3 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useRem = require(Hooks_3:WaitForChild("useRem"))
local Components = v1.Parent.Parent.Parent:WaitForChild("Components")
local Primitives = Components:WaitForChild("Primitives")
local Frame = require(Primitives:WaitForChild("Frame"))
local Components_2 = v1.Parent.Parent.Parent:WaitForChild("Components")
local Utilities_3 = Components_2:WaitForChild("Utilities")
local TransparencyGroup = require(Utilities_3:WaitForChild("TransparencyGroup"))
return function(p1) -- Line: 45 -- upvalues: useRem (val), react (val), useEventListener (val), Signals (val), Players (val), Sounds (val), Gear_3 (val), ClientAttributesHandler (val), RunService (val), useAnimatorObserver (val), Gear_2 (val), Gear (val), useAsyncEffect (val), Promise (val), Frame (val), TransparencyGroup (val)
    local u11, u12, u6, u7
    local v1 = useRem()
    u6, u7 = react.useBinding(1)
    u11, u12 = react.useState(false)
    useEventListener(Signals.PlayerGrappledClient, function(p1, p2) -- Line: 51 -- upvalues: u12 (val)
        if p2 == 0 then
            u12(false)
            return
        end
        u12(true)
    end)
    react.useEffect(function() -- Line: 60 -- upvalues: u11 (val), Players (upval), Sounds (upval), Gear_3 (upval), Signals (upval), u7 (val), u6 (val), ClientAttributesHandler (upval), RunService (upval), useAnimatorObserver (upval), Gear_2 (upval), Gear (upval), u12 (val)
        local u11
        if not u11 then
            return
        end
        local Character = Players.LocalPlayer.Character
        local PrimaryPart = Character
        if PrimaryPart then
            PrimaryPart = Character.PrimaryPart
        end
        if not Character or not PrimaryPart then
            return
        end
        local u10 = tick() - 5
        u11 = nil
        Sounds.playGlobalSoundEffect(Gear_3.Shake, 0.2, 1)
        Sounds.playGlobalSoundEffect(Gear_3.Blades.Blood[1], 0.2, 0.8)
        local u35 = Signals.PlayerDashBoosted:Connect(function() -- Line: 84 -- upvalues: u7 (upval), u6 (upval)
            local v1 = u6:getValue() - 0.15
            u7((math.clamp(v1, 0, 1)))
        end)
        local u40 = ClientAttributesHandler.getAttribute("GearGrappleShakeMultiplier") or 1
        u11 = RunService.RenderStepped:Connect(function(p1) -- Line: 91 -- upvalues: u6 (upval), Sounds (upval), Gear_3 (upval), useAnimatorObserver (upval), Gear_2 (upval), u11 (ref), Gear (upval), u12 (upval), u7 (upval), u40 (val), u10 (ref), PrimaryPart (val)
            local v1 = u6:getValue()
            if v1 < 0.01 then
                Sounds.playGlobalSoundEffect(Gear_3.Woosh, 0.2, 0.75)
                useAnimatorObserver.play(Gear_2.Shake, 0.1)
                u11:Disconnect()
                task.delay(0.3, function() -- Line: 98 -- upvalues: Gear (upval), u12 (upval)
                    Gear.Shake.post(0)
                    u12(false)
                end)
                return
            end
            local v2 = u6:getValue()
            u7(v2 - p1 / 10 * u40)
            v1 = tick() - u10
            if v1 < 0.2 then
                return
            end
            v1 = 0
            local Children = PrimaryPart:GetChildren()
            for i, v in ipairs(Children) do
                if v.Name == "__GRAPPLED_TO" then
                    v1 = v1 + 1
                end
            end
            if v1 == 0 then
                u12(false)
                u11:Disconnect()
            end
            u10 = tick()
        end)
        return function() -- Line: 135 -- upvalues: u11 (ref), u35 (ref)
            u11:Disconnect()
            u35:Disconnect()
        end
    end, {u11})
    useAsyncEffect(function() -- Line: 141 -- upvalues: u11 (val), Promise (upval), u7 (val)
        if not u11 then
            return Promise.delay(0.3):andThen(function() -- Line: 143 -- upvalues: u7 (upval)
                u7(1)
            end)
        end
        u7(1)
    end, {u11})
    local v2 = {BorderSizePixel = 0, BackgroundTransparency = 1, Position = UDim2.fromScale(0.5, 0.5)}
    local v3 = {}
    local v4 = {Enabled = u11, Tween = TweenInfo.new(0.3)}
    local v5 = {}
    local v6 = {
        BackgroundTransparency = 0.75,
        BorderSizePixel = 0,
        ZIndex = -1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.7),
    }
    local v7 = v1(364)
    v6.Size = UDim2.fromOffset(v7, v1(23))
    v5.Backdrop = react.createElement("Frame", v6)
    v6 = {
        BackgroundTransparency = 0.7,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(189, 189, 189),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.7),
    }
    v7 = v1(352)
    v6.Size = UDim2.fromOffset(v7, v1(11))
    v5.frame1 = react.createElement("Frame", v6, {frame2 = react.createElement("Frame", {
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundColor3 = Color3.fromRGB(213, 89, 89),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0, 0.5),
        Size = u6:map(function(p1) -- Line: 187
            return UDim2.fromScale(p1, 1)
        end),
    })})
    v5.uIPadding = react.createElement("UIPadding", {PaddingBottom = UDim.new(0, v1(6)), PaddingLeft = UDim.new(0, v1(6)), PaddingRight = UDim.new(0, v1(6)), PaddingTop = UDim.new(0, v1(6))})
    v5.uIStroke = react.createElement("UIStroke", {Transparency = 0.7, Color = Color3.fromRGB(255, 255, 255)})
    v6 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.7),
    }
    v7 = v1(372)
    v6.Size = UDim2.fromOffset(v7, v1(31))
    v5.frame3 = react.createElement("Frame", v6, {uIStroke1 = react.createElement("UIStroke", {Transparency = 0.8, Color = Color3.fromRGB(255, 255, 255)})})
    v3.Group = react.createElement(TransparencyGroup, v4, v5)
    return react.createElement(Frame, v2, v3)
end