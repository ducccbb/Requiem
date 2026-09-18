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
--            File: ReplicatedStorage.Client.Interfaces.Routes.Screen.Knocked
--                               Dumped in 0.00155 seconds
--                          Bytecode version 9  |  8 functions

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
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Vitality = require(Namespaces:WaitForChild("Vitality"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_3:WaitForChild("Client")
local User = Client:WaitForChild("User")
local State = User:WaitForChild("State")
local ClientStateHandler = require(State:WaitForChild("ClientStateHandler"))
local States = ClientStateHandler.States
local Components = v1.Parent.Parent.Parent:WaitForChild("Components")
local Utilities = Components:WaitForChild("Utilities")
local TransparencyGroup = require(Utilities:WaitForChild("TransparencyGroup"))
local Hooks = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useStore = require(Hooks:WaitForChild("useStore"))
return function() -- Line: 30 -- upvalues: useStore (val), Vitality (val), react (val), ClientStateHandler (val), States (val), Lighting (val), TweenService (val), TransparencyGroup (val)
    local u9, v1
    local v2 = useStore(Vitality.Store, function(p1) -- Line: 31
        return p1
    end)
    v1, u9 = react.useState(false)
    local u15 = if v2.knocked == 1 then if v2.health <= 0 then v1 else false else false
    react.useEffect(function() -- Line: 41 -- upvalues: ClientStateHandler (upval), u9 (val)
        ClientStateHandler.onServerStateChanged(ClientStateHandler.Server.KNOCKED):Connect(function(p1) -- Line: 42 -- upvalues: u9 (upval)
            u9(p1)
        end)
    end, {})
    react.useEffect(function() -- Line: 48 -- upvalues: u15 (val), ClientStateHandler (upval), States (upval), Lighting (upval), TweenService (upval)
        if not u15 then
            return
        end
        ClientStateHandler.updateState(States.KNOCKED, true)
        local ColorCorrectionEffect = Instance.new("ColorCorrectionEffect")
        ColorCorrectionEffect.Name = "Knocked"
        ColorCorrectionEffect.Parent = Lighting
        local BlurEffect = Instance.new("BlurEffect")
        BlurEffect.Name = "Knocked"
        BlurEffect.Parent = Lighting
        local v1 = TweenInfo.new(2)
        TweenService:Create(ColorCorrectionEffect, v1, {Saturation = -1, Brightness = -0.3}):Play()
        v1 = TweenInfo.new(2)
        TweenService:Create(BlurEffect, v1, {Size = 40}):Play()
        return function() -- Line: 76 -- upvalues: TweenService (upval), ColorCorrectionEffect (val), BlurEffect (val), ClientStateHandler (upval), States (upval)
            local v1 = TweenInfo.new(2)
            TweenService:Create(ColorCorrectionEffect, v1, {Saturation = 0, Brightness = 0}):Play()
            v1 = TweenInfo.new(2)
            TweenService:Create(BlurEffect, v1, {Size = 0}):Play()
            task.delay(2, function() -- Line: 86 -- upvalues: BlurEffect (upval), ColorCorrectionEffect (upval)
                BlurEffect:Destroy()
                ColorCorrectionEffect:Destroy()
            end)
            ClientStateHandler.updateState(States.KNOCKED, false)
        end
    end, {u15})
    local v3 = {}
    local v4 = v2.knocked == 1
    v3.Enabled = v4
    v3.Tween = TweenInfo.new(2)
    return react.createElement(TransparencyGroup, v3, {Background = react.createElement("Frame", {
        BackgroundTransparency = 0.5,
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        Size = UDim2.fromScale(1, 1),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
    }), Vignette = react.createElement("ImageLabel", {
        Image = "rbxassetid://135589412519765",
        ImageTransparency = 0.2,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ImageColor3 = Color3.fromRGB(12, 17, 18),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(12, 17, 18),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1.2, 1),
    }), Text = react.createElement("TextLabel", {
        Text = "You are knocked out, wait to be revived...",
        BackgroundTransparency = 1,
        TextSize = 25,
        ZIndex = 100,
        FontFace = Font.new("rbxasset://fonts/families/Fondamento.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.8),
        TextColor3 = Color3.fromRGB(255, 255, 255),
    })})
end