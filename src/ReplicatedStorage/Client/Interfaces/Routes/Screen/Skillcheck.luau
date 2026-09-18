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
--          File: ReplicatedStorage.Client.Interfaces.Routes.Screen.Skillcheck
--                               Dumped in 0.00311 seconds
--                          Bytecode version 9  |  18 functions

local u249
local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Player = require(Namespaces:WaitForChild("Player"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_2:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_3:WaitForChild("Client")
local User = Client:WaitForChild("User")
local State = User:WaitForChild("State")
local ClientStateHandler = require(State:WaitForChild("ClientStateHandler"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_4:WaitForChild("Common")
local Utilities = Common_2:WaitForChild("Utilities")
local Sounds = require(Utilities:WaitForChild("Sounds"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_5:WaitForChild("Common")
local Sounds_2 = Common_3:WaitForChild("Sounds")
local Universal = require(Sounds_2:WaitForChild("Universal"))
local Components = v1.Parent.Parent.Parent:WaitForChild("Components")
local Screen = Components:WaitForChild("Screen")
local DynamicPage = require(Screen:WaitForChild("DynamicPage"))
local Components_2 = v1.Parent.Parent.Parent:WaitForChild("Components")
local Primitives = Components_2:WaitForChild("Primitives")
local Frame = require(Primitives:WaitForChild("Frame"))
local Components_3 = v1.Parent.Parent.Parent:WaitForChild("Components")
local Primitives_2 = Components_3:WaitForChild("Primitives")
local Text = require(Primitives_2:WaitForChild("Text"))
local Components_4 = v1.Parent.Parent.Parent:WaitForChild("Components")
local Utilities_2 = Components_4:WaitForChild("Utilities")
local TransparencyGroup = require(Utilities_2:WaitForChild("TransparencyGroup"))
local Hooks = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useMotion = require(Hooks:WaitForChild("useMotion"))
local Hooks_2 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useRem = require(Hooks_2:WaitForChild("useRem"))
local Hooks_3 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useTheme = require(Hooks_3:WaitForChild("useTheme"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_6:WaitForChild("Common")
local Statistics = Common_4:WaitForChild("Statistics")
_, u249 = require(Statistics:WaitForChild("useJumpPower"))()
local function Ring() -- Line: 55 -- upvalues: useRem (val), useMotion (val), react (val)
    local u5, u9, v1, v2
    local u1 = useRem()
    v1, u5 = useMotion(0)
    v2, u9 = useMotion(0.92)
    react.useEffect(function() -- Line: 61 -- upvalues: u5 (val), u9 (val)
        u5:immediate(0)
        u9:immediate(0.92)
        u9:spring(1)
        u5:spring(1)
    end, {})
    return react.createElement("ImageLabel", {
        Image = "rbxassetid://127999577981138",
        BackgroundTransparency = 1,
        Size = v1:map(function(p1) -- Line: 70 -- upvalues: u1 (val)
            local v1 = u1(900 + 900 * p1)
            return UDim2.fromOffset(v1, u1(900 + 900 * p1))
        end),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        ImageColor3 = Color3.fromRGB(142, 147, 163),
        ImageTransparency = v2,
        Visible = v2:map(function(p1) -- Line: 79
            local v1 = p1 == 1
            return not v1
        end),
    })
end
return function() -- Line: 89 -- upvalues: useTheme (val), react (val), useMotion (val), u249 (val), RunService (val), Player (val), Sounds (val), Universal (val), ClientStateHandler (val), UserInputService (val), Ring (val), Frame (val), DynamicPage (val), TransparencyGroup (val), Text (val)
    local u11, u15, u16, u20, u21, u25, u26, u30, u31, u35, u36, u40, u44, u45, u6, v1, v2, v3, v4
    local v5 = useTheme()
    v1, u6 = react.useState(false)
    v4, u11 = react.useState(0)
    u15, u16 = react.useState(0)
    u20, u21 = react.useState(0)
    u25, u26 = react.useBinding(0)
    u30, u31 = react.useBinding(0)
    u35, u36 = react.useBinding(1)
    v2, u40 = useMotion(1)
    u44, u45 = react.useState(0)
    local u49 = react.useRef(0)
    react.useEffect(function() -- Line: 106 -- upvalues: u44 (val), u31 (val), u26 (val), u49 (val), u249 (upval), u20 (val), u25 (val), u30 (val), RunService (upval), u15 (val), u35 (val), Player (upval), u6 (val), u45 (val), Sounds (upval), Universal (upval), ClientStateHandler (upval), UserInputService (upval), u11 (val), u36 (val), u40 (val)
        local u35
        if u44 == 0 then
            return
        end
        u31(math.random(120, 240))
        u26(0)
        u49.current = 0
        local u17 = u249("skillcheck", 0, "set", 10)
        local u18 = false
        local u24 = 90 + (u20 - 1) * 410 / 99
        local function onVerifyRotations() -- Line: 126 -- upvalues: u25 (upval), u30 (upval)
            local v1
            local v2 = u25:getValue()
            local v3 = u30:getValue()
            v2 = (v2 % 360 + 360) % 360
            v3 = (v3 % 360 + 360) % 360
            local v4 = v3 - 20
            local v5 = v3 + 20
            if v4 < 0 then
                v1 = if v4 + 360 > v2 then v2 <= v5 else true
                return v1
            end
            if 360 < v5 then
                v1 = if v4 > v2 then v2 <= v5 - 360 else true
                return v1
            end
            v1 = if v4 <= v2 then v2 <= v5 else false
            return v1
        end
        local u27 = tick()
        u35 = RunService.RenderStepped:Connect(function(p1) -- Line: 153 -- upvalues: u49 (upval), u15 (upval), u24 (val), u25 (upval), u35 (upval), u26 (upval), u27 (val), onVerifyRotations (val), u18 (ref), Player (upval), u6 (upval), u45 (upval), Sounds (upval), Universal (upval)
            local v1 = u25:getValue()
            local v2 = v1 + u24 * (1 + u49.current / math.max(u15, 1)) * p1 * u35:getValue()
            u26((v2 % 360 + 360) % 360)
            v1 = tick() - u27
            if v1 < 0.3 then
                return
            end
            v1 = onVerifyRotations()
            if not u18 or v1 then
                u18 = v1
                return
            end
            Player.Skillcheck.post(0)
            u6(false)
            u45(0)
            Sounds.playGlobalSoundEffect(Universal.WoodBlockRattle, 0.1, 2, 2)
        end)
        ClientStateHandler.updateState(ClientStateHandler.States.LOCKED, true)
        local u50 = UserInputService.InputBegan:Connect(function(p1, p2) -- Line: 188 -- upvalues: onVerifyRotations (val), u11 (upval), u15 (upval), u49 (upval), Player (upval), u6 (upval), u45 (upval), Sounds (upval), Universal (upval), u36 (upval), u35 (upval), u30 (upval), u31 (upval), u18 (ref), u40 (upval)
            local v1, v2
            if p1.KeyCode ~= Enum.KeyCode.Space then
                return
            end
            if not (onVerifyRotations()) then
                Player.Skillcheck.post(0)
                u6(false)
                u45(0)
                Sounds.playGlobalSoundEffect(Universal.WoodBlockRattle, 0.1, 2, 2)
                return
            end
            u11(function(p1) -- Line: 191 -- upvalues: u15 (upval), u49 (upval), Player (upval), u6 (upval), u45 (upval), Sounds (upval), Universal (upval), u36 (upval), u35 (upval)
                local v1 = math.min(p1 + 1, u15)
                u49.current = v1
                if v1 == u15 then
                    Player.Skillcheck.post(1)
                    u6(false)
                    u45(0)
                end
                Sounds.playGlobalSoundEffect(Universal.GlassyPop, 0.1, 2, 2, NumberRange.new(0.8 + v1 / u15 / 2))
                u36(u35:getValue() * -1)
                return v1
            end)
            local v3 = u30:getValue()
            while true do
                v1 = math.random(0, 360)
                v2 = math.abs(v1 - v3)
                v2 = math.min(v2, 360 - v2)
                if 140 <= v2 then
                    break
                end
            end
            u31(v1)
            u18 = false
            u40:spring(0.9)
            task.delay(0.2, function() -- Line: 226 -- upvalues: u40 (upval)
                u40:spring(1)
            end)
        end)
        return function() -- Line: 239 -- upvalues: u35 (ref), u50 (ref), u17 (val), ClientStateHandler (upval)
            u35:Disconnect()
            u50:Disconnect()
            task.delay(0.2, u17)
            ClientStateHandler.updateState(ClientStateHandler.States.LOCKED, false)
        end
    end, {u44, u20, u15, v1})
    react.useEffect(function() -- Line: 248 -- upvalues: Player (upval), u21 (val), u16 (val), u11 (val), u49 (val), u6 (val), u45 (val)
        Player.Skillcheck.listen(function(p1) -- Line: 249 -- upvalues: u21 (upval), u16 (upval), u11 (upval), u49 (upval), u6 (upval), u45 (upval)
            u21(p1.difficulty)
            u16(p1.amount)
            u11(0)
            u49.current = 0
            u6(true)
            u45(p1.__id)
        end)
    end, {})
    local v6 = {}
    local v7 = v4
    local v8 = 1
    for i = 1, v7, v8 do
        v3 = tostring(i)
        v6[v3] = react.createElement(Ring, {Index = i})
    end
    v3 = {Page = react.createElement(DynamicPage, {Enabled = v1})}
    local v9 = {Enabled = v1, Tween = TweenInfo.new(0.3)}
    local v10 = {}
    local v11 = {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(0.45, 0.45),
    }
    local v12 = {Ratio = react.createElement("UIAspectRatioConstraint"), Text = react.createElement(Text, {
        Text = "SPACE",
        TextTransparency = 0.85,
        BackgroundTransparency = 1,
        TextScaled = true,
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Size = UDim2.fromScale(1, 0.085),
        TextXAlignment = Enum.TextXAlignment.Center,
        TextYAlignment = Enum.TextYAlignment.Center,
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
    })}
    local v13 = {TextTransparency = 0.9, BackgroundTransparency = 1, TextScaled = true}
    local v14 = tostring(v4)
    v13.Text = "[ " .. v14 .. "/" .. tostring(u15) .. " ]"
    v13.Position = UDim2.fromScale(0.5, 0.575)
    v13.AnchorPoint = Vector2.new(0.5, 0.5)
    v13.Size = UDim2.fromScale(1, 0.05)
    v13.TextXAlignment = Enum.TextXAlignment.Center
    v13.TextYAlignment = Enum.TextYAlignment.Center
    v13.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    v12.Progress = react.createElement(Text, v13)
    v12.Circle = react.createElement("ImageLabel", {
        Image = "rbxassetid://85251174800525",
        ImageTransparency = 0.47,
        BackgroundTransparency = 1,
        ImageColor3 = v5.Background,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = v2:map(function(p1) -- Line: 342
            return UDim2.fromScale(1 * p1, 1 * p1)
        end),
        Rotation = u30,
    })
    v12.Validation = react.createElement("ImageLabel", {
        Image = "rbxassetid://119581788403550",
        ImageTransparency = 0,
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        ImageColor3 = Color3.fromRGB(52, 56, 66),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = v2:map(function(p1) -- Line: 356
            return UDim2.fromScale(1 * p1, 1 * p1)
        end),
        Rotation = u30,
    })
    v12.Spinner = react.createElement("Frame", {
        ZIndex = 2,
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = v2:map(function(p1) -- Line: 366
            return UDim2.fromScale(1 * p1, 1 * p1)
        end),
        Rotation = u25,
    }, {Indicator = react.createElement("Frame", {AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = Color3.fromRGB(182, 189, 216), Position = UDim2.fromScale(0.5, 0.036), Size = UDim2.fromScale(0.013, 0.07)}, {Corner = react.createElement("UICorner")})})
    v10.Content = react.createElement("Frame", v11, v12)
    v3.Group = react.createElement(TransparencyGroup, v9, v10, v6)
    return react.createElement(Frame, {}, v3)
end