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
--          File: ReplicatedStorage.Client.Interfaces.Components.Screen.Anxiety
--                               Dumped in 0.00186 seconds
--                          Bytecode version 9  |  18 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Character = require(Utilities:WaitForChild("Character"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_2:WaitForChild("Client")
local Progression = Client:WaitForChild("Progression")
local ClientAttributesHandler = require(Progression:WaitForChild("ClientAttributesHandler"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_3:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_4:WaitForChild("Common")
local Signals = require(Common_2:WaitForChild("Signals"))
local Hooks = script.Parent.Parent.Parent:WaitForChild("Hooks")
local useMotion = require(Hooks:WaitForChild("useMotion"))
return function(p1) -- Line: 30 -- upvalues: useMotion (val), react (val), Character (val), RunService (val), Signals (val), ClientAttributesHandler (val)
    local u13, u4, u8, u9, v1, v2
    v1, u4 = useMotion(0)
    u8, u9 = react.useState(0)
    v2, u13 = useMotion(1)
    react.useEffect(function() -- Line: 35 -- upvalues: Character (upval), RunService (upval), u9 (val), Signals (upval), ClientAttributesHandler (upval)
        local u0 = nil
        local u1 = nil
        local function onBeginAnxietyReplenish() -- Line: 42 -- upvalues: u1 (ref), Character (upval), RunService (upval), u9 (upval), Signals (upval)
            if u1 then
                u1:Disconnect()
            end
            local u5 = 0
            local u8 = Character.getCharacter()
            u1 = RunService.RenderStepped:Connect(function(p1) -- Line: 52 -- upvalues: u9 (upval), u5 (ref), u1 (upval), u8 (val), Signals (upval)
                u9(function(a1) -- Line: 53 -- upvalues: u5 (upval), p1 (val), u1 (upval), u8 (upval), Signals (upval)
                    local v1
                    if 3 >= u5 then
                        v1 = 1
                    else
                        v1 = 7
                    end
                    local v2 = math.clamp(a1 - p1 * (0.75 * v1), 0, 100)
                    if v2 <= 0 then
                        u1:Disconnect()
                    end
                    if u8 then
                        if u8.HumanoidRootPart.AssemblyLinearVelocity.Magnitude >= 8 then
                            u5 = 0
                        else
                            u5 = u5 + p1
                        end
                    end
                    Signals.OnAnxietyChanged:Fire(v2)
                    return v2
                end)
            end)
        end
        local function onBeginAnxietyDepletion() -- Line: 83 -- upvalues: u0 (ref), onBeginAnxietyReplenish (val)
            u0 = task.delay(10, onBeginAnxietyReplenish)
        end
        Signals.Anxiety:Connect(function(p1) -- Line: 90 -- upvalues: u0 (ref), u1 (ref), onBeginAnxietyDepletion (val), u9 (upval), Signals (upval)
            if u0 then
                task.cancel(u0)
            end
            if u1 then
                u1:Disconnect()
            end
            if p1 == 0 then
                return onBeginAnxietyDepletion()
            end
            u9(function(a1) -- Line: 106 -- upvalues: p1 (val), Signals (upval)
                local v1 = math.clamp(a1 + p1, 0, 100)
                Signals.OnAnxietyChanged:Fire(v1)
                return v1
            end)
            onBeginAnxietyDepletion()
        end)
        local u18 = ClientAttributesHandler.onAttributeChanged("ReduceCurrentAnxietyAmount"):Connect(function(p1) -- Line: 126 -- upvalues: u9 (upval), Signals (upval)
            if p1 == 1 then
                u9(function(p1) -- Line: 128 -- upvalues: Signals (upval)
                    local v1 = math.clamp(p1 * 0.5, 0, 100)
                    Signals.OnAnxietyChanged:Fire(v1)
                    return v1
                end)
            end
        end)
        local u26 = ClientAttributesHandler.onAttributeChanged("BraceAnxietyReduction"):Connect(function(p1) -- Line: 139 -- upvalues: u9 (upval), Signals (upval)
            if p1 == 1 then
                u9(function(p1) -- Line: 141 -- upvalues: Signals (upval)
                    local v1 = math.clamp(p1 * 0.9, 0, 100)
                    Signals.OnAnxietyChanged:Fire(v1)
                    return v1
                end)
            end
        end)
        return function() -- Line: 149 -- upvalues: u26 (val), u18 (val)
            u26:Disconnect()
            u18:Disconnect()
        end
    end, {})
    react.useEffect(function() -- Line: 155 -- upvalues: u8 (val), u13 (val), u4 (val)
        if u8 == 0 then
            u13:spring(1)
        else
            u13:spring(0)
        end
        u4:spring(u8 / 100)
    end, {u8})
    local v3 = {Vignette = react.createElement("ImageLabel", {
        Image = "rbxassetid://135589412519765",
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = -1,
        ImageColor3 = Color3.fromRGB(0, 0, 0),
        ImageTransparency = v1:map(function(p1) -- Line: 169
            if p1 < 0.5 then
                return 1
            end
            return (math.lerp(1, 0, (p1 - 0.5) / 0.5))
        end),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(12, 17, 18),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
        Visible = v1:map(function(p1) -- Line: 186
            local v1 = 0.5 <= p1
            return v1
        end),
    })}
    local v4 = {
        BorderSizePixel = 0,
        Visible = false,
        AnchorPoint = Vector2.new(0.5, 1),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 1),
        Size = UDim2.new(1, 0, 0, 12),
        BackgroundTransparency = v2,
    }
    local v5 = {}
    local v6 = {
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(1, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(1, 0.5),
        BackgroundTransparency = v2,
        Size = v1:map(function(p1) -- Line: 212
            return UDim2.fromScale(p1, 1)
        end),
    }
    local v7 = {}
    local v8 = {Rotation = -90}
    local v9 = {}
    local v10 = NumberSequenceKeypoint.new(0, 0)
    v9[1] = v10
    v9[2] = NumberSequenceKeypoint.new(1, 1)
    v8.Transparency = NumberSequence.new(v9)
    v7.Gradient = react.createElement("UIGradient", v8)
    v5.Fill = react.createElement("Frame", v6, v7)
    v6 = {Rotation = -90}
    local v11 = {}
    local v12 = NumberSequenceKeypoint.new(0, 0)
    v11[1] = v12
    v11[2] = NumberSequenceKeypoint.new(1, 1)
    v6.Transparency = NumberSequence.new(v11)
    v5.Gradient = react.createElement("UIGradient", v6)
    v3.Bar = react.createElement("Frame", v4, v5)
    return react.createElement(react.Fragment, {}, v3)
end