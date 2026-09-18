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
--            File: ReplicatedStorage.Client.Interfaces.Routes.Screen.Aimlabs
--                               Dumped in 0.00244 seconds
--                          Bytecode version 9  |  30 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Promise = require(Common:WaitForChild("Promise"))
local Components = v1.Parent.Parent.Parent:WaitForChild("Components")
local Screen = Components:WaitForChild("Screen")
local DynamicPage = require(Screen:WaitForChild("DynamicPage"))
local Hooks = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useInterfaceState = require(Hooks:WaitForChild("useInterfaceState"))
local Hooks_2 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useMotion = require(Hooks_2:WaitForChild("useMotion"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Utilities = Common_2:WaitForChild("Utilities")
local Sounds = require(Utilities:WaitForChild("Sounds"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Sounds_2 = Common_3:WaitForChild("Sounds")
local Training = require(Sounds_2:WaitForChild("Training"))
local u127 = Color3.fromRGB(255, 255, 255)
local function Circle(p1) -- Line: 87 -- upvalues: useMotion (val), react (val), Promise (val), Sounds (val), Training (val), u127 (val)
    local u11, u7, v1, v2
    v1, u7 = useMotion(UDim2.fromOffset(0, 0))
    v2, u11 = useMotion(0.5)
    react.useEffect(function() -- Line: 99 -- upvalues: u7 (val), u11 (val), Promise (upval), p1 (val), Sounds (upval), Training (upval)
        u7:immediate(UDim2.fromOffset(0, 0))
        u11:immediate(0.5)
        local v1 = UDim2.fromOffset(100, 100)
        u7:tween(v1, {time = 0.15, style = Enum.EasingStyle.Back})
        local u30 = Promise.delay(0.15):andThen(function() -- Line: 111 -- upvalues: u7 (upval), p1 (upval), u11 (upval)
            local v1 = UDim2.fromOffset(60, 60)
            u7:tween(v1, {time = p1.lifetime, style = Enum.EasingStyle.Linear})
            u11:tween(1, {time = p1.lifetime, style = Enum.EasingStyle.Linear})
        end)
        local u40 = Promise.delay(p1.lifetime + 0.15):andThen(function() -- Line: 124 -- upvalues: p1 (upval)
            p1.onTimeout(p1.id)
        end)
        Sounds.playGlobalSoundEffect(Training.Spawn, 0.05, 0.3, 1, NumberRange.new(0.7, 0.8))
        return function() -- Line: 130 -- upvalues: u30 (val), u40 (val)
            u30:cancel()
            u40:cancel()
        end
    end, {p1.id})
    local v3 = {
        BackgroundTransparency = 0.8,
        ZIndex = 2,
        Size = v1,
        Position = p1.position,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
    }
    local v4 = {UICorner = react.createElement("UICorner", {CornerRadius = UDim.new(1, 0)}), UIStroke = react.createElement("UIStroke", {Thickness = 2, Color = u127, Transparency = v2}), Id = react.createElement("TextLabel", {
        BackgroundTransparency = 1,
        TextScaled = true,
        Size = UDim2.fromScale(0.4, 0.4),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Text = p1.id,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        Font = Enum.Font.GothamBold,
        TextTransparency = v2:map(function(p1) -- Line: 163
            return (math.max(0.8, p1))
        end),
    }), OuterStroke = react.createElement("UIStroke", {Thickness = 1, Color = Color3.fromRGB(255, 255, 255), Transparency = v2:map(function(p1) -- Line: 171
        return (math.max(0.8, p1))
    end), BorderOffset = UDim.new(0, 8)})}
    local v5 = {Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, Text = "", ZIndex = 3}
    v5[react.Event.Activated] = function() -- Line: 184 -- upvalues: Sounds (upval), Training (upval), p1 (val)
        Sounds.playGlobalSoundEffect(Training.Spawn, 0.1, 3, 1, NumberRange.new(1.2, 1.4))
        p1.onClicked(p1.id)
    end
    v4.ClickButton = react.createElement("TextButton", v5)
    return react.createElement("Frame", v3, v4)
end
return function() -- Line: 194 -- upvalues: useInterfaceState (val), react (val), Circle (val), DynamicPage (val)
    local aimlabs, aimlabs_2, u13, u14, u18, u19, u24, u28, u29, u33, u34, u38, u39, u43, u44, v1
    aimlabs, aimlabs_2 = useInterfaceState("aimlabs")
    local v2 = aimlabs_2
    if not v2 then
        v2 = {
            visible = false,
            success = function() end,
            fail = function() end,
        }
    end
    local u9 = v2
    u13, u14 = react.useState(u9.visible)
    u18, u19 = react.useState(20)
    local v3 = {}
    v1, u24 = react.useState(v3)
    u28, u29 = react.useState(false)
    u33, u34 = react.useState(false)
    u38, u39 = react.useBinding(1)
    u43, u44 = react.useState(0)
    local function onSuccess() -- Line: 210 -- upvalues: u9 (ref)
        u9.success()
    end
    local function onFail() -- Line: 215 -- upvalues: u9 (ref)
        u9.fail()
    end
    react.useEffect(function() -- Line: 220 -- upvalues: u14 (val), u9 (ref), u28 (val), u29 (val), u34 (val), u19 (val), u24 (val), u39 (val), u44 (val)
        u14(u9.visible)
        if u9.visible and not u28 then
            u29(true)
            u34(false)
            u19(20)
            u24({})
            u39(1)
            u44(0)
        end
    end, {u9.visible})
    local u58 = react.useMemo(function() -- Line: 235 -- upvalues: u43 (val)
        return (math.max(0.7 - u43 * 0.02, 0.5))
    end, {u43})
    local v4 = react.useMemo(function() -- Line: 243 -- upvalues: u43 (val)
        return (math.max(1.3 - u43 * 0.02, 0.5))
    end, {u43})
    react.useEffect(function() -- Line: 252 -- upvalues: u28 (val), u33 (val), u13 (val), u24 (val), u38 (val), u39 (val), u58 (val)
        if not u28 or u33 or not u13 then
            return
        end
        local function spawnCircle() -- Line: 258 -- upvalues: u33 (upval), u24 (upval), u38 (upval), u39 (upval)
            if u33 then
                return
            end
            u24(function(p1) -- Line: 263 -- upvalues: u38 (upval), u39 (upval)
                local v1, v2, v3, v4
                local v5 = math.random() * 0.8500000000000001 + 0.075
                local v6 = math.random() * 0.8500000000000001 + 0.075
                local v7 = UDim2.fromScale(v5, v6)
                local v8 = 20
                local v9 = 1
                for i = 1, v8, v9 do
                    v3 = math.random() * 0.8500000000000001 + 0.075
                    v4 = math.random() * 0.8500000000000001 + 0.075
                    v1 = UDim2.fromScale(v3, v4)
                    if (function(a1) -- Line: 272 -- upvalues: p1 (val)
    local v5, v6, v7, v10, v8, v9, v2, v3
    v5 = p1
    v6 = nil
    v7 = nil
    for i, j in v5, v6, v7 do
        v9 = a1.X.Scale - j.position.X.Scale
        v2 = a1.Y.Scale - j.position.Y.Scale
        v3 = math.sqrt(v9 * v9 + v2 * v2)
        if v3 < 0.15 then
            return false
        end
    end
    return true
end)(v1) then
                        v7 = v1
                        break
                    end
                end
                v8 = {id = tostring(u38:getValue()), position = v7}
                u39(u38:getValue() + 1)
                v9 = table.clone(p1)
                table.insert(v9, v8)
                return v9
            end)
        end
        spawnCircle()
        local u6 = true
        task.spawn(function() -- Line: 315 -- upvalues: u6 (ref), u33 (upval), u58 (upval), spawnCircle (val)
            while u6 do
                if u33 then
                    break
                end
                task.wait(u58)
                if u6 and not u33 then
                    spawnCircle()
                end
            end
        end)
        return function() -- Line: 324 -- upvalues: u6 (ref)
            u6 = false
        end
    end, {u28, u33, u13, u58})
    local v5 = {ScoreDisplay = react.createElement("TextLabel", {
        BackgroundTransparency = 1,
        TextScaled = true,
        ZIndex = 2,
        TextTransparency = 0.8,
        Size = UDim2.fromScale(0.3, 0.1),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Text = tostring(u18),
        TextColor3 = Color3.fromRGB(255, 255, 255),
        Font = Enum.Font.GothamBold,
    })}
    local v6 = v1
    local v7 = nil
    local v8 = nil
    for i, j in v6, v7, v8 do
        v5["Circle_" .. j.id] = react.createElement(Circle, {
            id = j.id,
            position = j.position,
            lifetime = v4,
            onClicked = function(p1) -- Line: 330 -- upvalues: u33 (val), u18 (val), u19 (val), u34 (val), u29 (val), u24 (val), onSuccess (val), aimlabs (val), u44 (val)
                if u33 then
                    return
                end
                local v1 = u18 - 1
                u19(v1)
                if v1 > 0 then
                    local v2
                    u24(function(a1) -- Line: 351 -- upvalues: p1 (val)
                        local v1 = {}
                        local v2 = a1
                        local v3 = nil
                        local v4 = nil
                        for i, j in v2, v3, v4 do
                            if j.id ~= p1 then
                                table.insert(v1, j)
                            end
                        end
                        return v1
                    end)
                    v2 = 20 - v1
                    if v2 % 2 == 0 then
                        u44((math.floor(v2 / 2)))
                    end
                    return
                end
                u34(true)
                u29(false)
                u24({})
                onSuccess()
                aimlabs({
                    visible = false,
                    success = function() end,
                    fail = function() end,
                })
            end,
            onTimeout = function(p1) -- Line: 370 -- upvalues: u33 (val), u34 (val), u29 (val), onFail (val), aimlabs (val)
                if u33 then
                    return
                end
                u34(true)
                u29(false)
                onFail()
                aimlabs({
                    visible = false,
                    success = function() end,
                    fail = function() end,
                })
            end,
        })
    end
    return react.createElement(DynamicPage, {Enabled = u13}, {Content = react.createElement("Frame", {BackgroundTransparency = 1, Size = UDim2.fromScale(0.75, 0.865), Position = UDim2.fromScale(0.5, 0.5), AnchorPoint = Vector2.new(0.5, 0.5)}, {Sizer = react.createElement("UISizeConstraint", {MinSize = Vector2.new(1000, 1000)}), Ratio = react.createElement("UIAspectRatioConstraint", {AspectRatio = 1.241})}, v5)})
end