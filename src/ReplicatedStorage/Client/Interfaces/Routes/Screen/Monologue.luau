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
--           File: ReplicatedStorage.Client.Interfaces.Routes.Screen.Monologue
--                               Dumped in 0.00225 seconds
--                          Bytecode version 9  |  29 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Promise = require(Common:WaitForChild("Promise"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_2:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Signals = require(Common_2:WaitForChild("Signals"))
local Components = v1.Parent.Parent.Parent:WaitForChild("Components")
local Primitives = Components:WaitForChild("Primitives")
local Text = require(Primitives:WaitForChild("Text"))
local Hooks = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useAsyncEffect = require(Hooks:WaitForChild("useAsyncEffect"))
local Hooks_2 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useMotion = require(Hooks_2:WaitForChild("useMotion"))
local function MonologueText(p1) -- Line: 46 -- upvalues: useMotion (val), react (val), Promise (val), useAsyncEffect (val), Text (val)
    local effect, fontFace, fontSize, position, rotation, u4, u8, v1, v2
    v1, u4 = useMotion(1)
    v2, u8 = useMotion(p1.StackIndex)
    local u12 = react.useRef(false)
    react.useEffect(function() -- Line: 55 -- upvalues: u4 (val)
        u4:spring(0)
    end, {})
    react.useEffect(function() -- Line: 59 -- upvalues: u8 (val), p1 (val)
        u8:spring(p1.StackIndex)
    end, {p1.StackIndex})
    react.useEffect(function() -- Line: 63 -- upvalues: p1 (val), u12 (val), u4 (val), Promise (upval)
        if p1.Monologue.removing and not u12.current then
            u12.current = true
            u4:spring(1)
            Promise.delay(0.5):andThen(function() -- Line: 67 -- upvalues: p1 (upval)
                p1.OnRemove()
            end)
        end
    end, {p1.Monologue.removing})
    useAsyncEffect(function() -- Line: 73 -- upvalues: Promise (upval), u12 (val), u4 (val), p1 (val)
        local v1 = Promise.delay(5):andThen(function() -- Line: 75 -- upvalues: u12 (upval), u4 (upval), Promise (upval)
            if u12.current then
                return
            end
            u12.current = true
            u4:spring(1)
            return Promise.delay(1)
        end)
        return v1:andThen(function() -- Line: 83 -- upvalues: u12 (upval), p1 (upval)
            if u12.current then
                p1.OnRemove()
            end
        end)
    end, {})
    local createElement = react.createElement
    local v3 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Size = UDim2.fromOffset(200, 50),
        AnchorPoint = Vector2.new(0.5, 0.5),
    }
    if not p1.Monologue.style then
        position = v2:map(function(p1) -- Line: 97
            local v1 = UDim2.fromScale(0.5, 0.5)
            return v1 - UDim2.fromScale(0, p1 / 3)
        end)
    else
        position = p1.Monologue.style.position
    end
    v3.Position = position
    if not p1.Monologue.style then
        rotation = 0
    else
        rotation = p1.Monologue.style.rotation
    end
    v3.Rotation = rotation
    local v4 = {}
    local createElement_2 = react.createElement
    local v5 = {BackgroundTransparency = 1, BorderSizePixel = 0}
    if not p1.Monologue.style then
        fontFace = Font.new("rbxasset://fonts/families/Fondamento.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
    else
        fontFace = p1.Monologue.style.fontFace
    end
    v5.FontFace = fontFace
    v5.Text = p1.Monologue.message
    local color = p1.Monologue.color
    if not color then
        if not p1.Monologue.style then
            color = Color3.fromRGB(255, 255, 255)
        else
            color = p1.Monologue.style.textColor
        end
    end
    v5.TextColor3 = color
    if not p1.Monologue.style then
        fontSize = 28
    else
        fontSize = p1.Monologue.style.fontSize
    end
    v5.TextSize = fontSize
    v5.AnchorPoint = Vector2.new(0.5, 0.5)
    v5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    v5.BorderColor3 = Color3.fromRGB(0, 0, 0)
    v5.TextXAlignment = Enum.TextXAlignment.Center
    v5.TextYAlignment = Enum.TextYAlignment.Center
    v5.Position = UDim2.fromScale(0.5, 0.5)
    v5.Size = UDim2.fromOffset(200, 50)
    v5.TextTransparency = v1
    if not p1.Monologue.effect then
        effect = nil
    elseif p1.Monologue.effect == "None" then
        effect = nil
    else
        effect = p1.Monologue.effect
        if not effect then
            effect = nil
        end
    end
    v5.Effect = effect
    v4.Text = createElement_2(Text, v5, {Stroke = react.createElement("UIStroke", {Transparency = v1:map(function(p1) -- Line: 127
        return p1 * 0.61 + 0.39
    end)})})
    return createElement("Frame", v3, v4)
end
return function() -- Line: 136 -- upvalues: react (val), Signals (val), MonologueText (val)
    local u3, u4, v1
    local v2 = {}
    u3, u4 = react.useState(v2)
    local v3 = {}
    local u8 = react.useRef(v3)
    local u12 = react.useRef(false)
    local u13 = nil
    local function u14() -- Line: 143 -- upvalues: u4 (val)
        u4(function(p1) -- Line: 144
            local huge = math.huge
            local v1 = nil
            for k, v in pairs(p1) do
                if not v.removing and v.spawnTime < huge then
                    v1 = k
                    huge = v.spawnTime
                end
            end
            if not v1 then
                return p1
            end
            local v2 = table.clone(p1)
            v2[v1] = table.clone(v2[v1])
            v2[v1].removing = true
            return v2
        end)
    end
    local function u15() -- Line: 164 -- upvalues: u8 (val), u4 (val), u14 (val), u13 (ref)
        local u4 = table.remove(u8.current, 1)
        if not u4 then
            return
        end
        local v1 = tostring(os.clock())
        local u17 = v1 .. "-" .. tostring(math.random(1, 100000))
        u4(function(p1) -- Line: 172 -- upvalues: u17 (val), u4 (val)
            local v1 = table.clone(p1)
            v1[u17] = {
                removing = false,
                id = u17,
                message = u4.message,
                spawnTime = os.clock(),
                effect = u4.effect,
                color = u4.color,
                style = u4.style,
            }
            return v1
        end)
        v1 = #u8.current
        if 0 < v1 then
            task.delay(0.3, function() -- Line: 187 -- upvalues: u14 (upval), u13 (upval)
                u14()
                task.delay(0.3, function() -- Line: 189 -- upvalues: u13 (upval)
                    u13()
                end)
            end)
        end
    end
    function u13() -- Line: 196 -- upvalues: u12 (val), u8 (val), u15 (val)
        if u12.current or #u8.current == 0 then
            return
        end
        u12.current = true
        u15()
        u12.current = false
    end
    react.useEffect(function() -- Line: 210 -- upvalues: Signals (upval), u4 (val), u8 (val), u14 (val), u13 (ref)
        local u5 = Signals.Monologue:Connect(function(p1, p2, p3, p4) -- Line: 212 -- upvalues: u4 (upval), u8 (upval), u14 (upval), u13 (upval)
            local u11
            if typeof(p1) ~= "table" then
                u11 = p1
            else
                u11 = p1[math.random(1, #p1)]
            end
            u4(function(p1) -- Line: 217 -- upvalues: u8 (upval), u11 (ref), p2 (val), p3 (val), p4 (val), u14 (upval), u13 (upval)
                local v1 = 0
                for k, v in pairs(p1) do
                    if not v.removing then
                        v1 = v1 + 1
                    end
                end
                if 5 <= v1 then
                    table.insert(u8.current, {message = u11, effect = p2, color = p3, style = p4})
                    task.defer(function() -- Line: 233 -- upvalues: u14 (upval), u13 (upval)
                        u14()
                        task.delay(0.3, function() -- Line: 235 -- upvalues: u13 (upval)
                            u13()
                        end)
                    end)
                    return p1
                end
                local v2 = tostring(os.clock())
                local v3 = v2 .. "-" .. tostring(math.random(1, 100000))
                v2 = table.clone(p1)
                v2[v3] = {
                    removing = false,
                    id = v3,
                    message = u11,
                    spawnTime = os.clock(),
                    effect = p2,
                    color = p3,
                    style = p4,
                }
                return v2
            end)
        end)
        return function() -- Line: 259 -- upvalues: u5 (val)
            u5:Disconnect()
        end
    end, {})
    local v4 = react.useMemo(function() -- Line: 264 -- upvalues: u3 (val)
        local v1 = {}
        for k, v in pairs(u3) do
            table.insert(v1, v)
        end
        table.sort(v1, function(p1, p2) -- Line: 269
            local v1 = p1.spawnTime < p2.spawnTime
            return v1
        end)
        return v1
    end, {u3})
    local v5 = {}
    local v6 = 0
    for i, v in ipairs(v4) do
        if not v.removing then
            v6 = v6 + 1
        end
    end
    for i2, i3 in ipairs(v4) do
        if not i3.removing then
            v6 = v6 - 1
            v1 = v6
        else
            v1 = v6
        end
        v5[i3.id] = react.createElement(MonologueText, {
            Monologue = i3,
            StackIndex = v1,
            OnRemove = function() -- Line: 296 -- upvalues: u4 (val), i3 (val)
                u4(function(p1) -- Line: 297 -- upvalues: i3 (upval)
                    local v1 = table.clone(p1)
                    v1[i3.id] = nil
                    return v1
                end)
            end,
        })
    end
    return react.createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.788),
        Size = UDim2.fromScale(1, 0.1),
    }, v5)
end