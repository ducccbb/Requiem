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
--          File: ReplicatedStorage.Client.Interfaces.Routes.Screen.Calculator
--                               Dumped in 0.00121 seconds
--                          Bytecode version 9  |  18 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Signals = require(Common:WaitForChild("Signals"))
local Hooks = script.Parent.Parent.Parent:WaitForChild("Hooks")
local useMotion = require(Hooks:WaitForChild("useMotion"))
local u59 = Color3.fromRGB(255, 0, 0)
local function formatDamage(p1) -- Line: 33
    if p1 == math.floor(p1) then
        return (tostring(p1))
    end
    return string.format("%.2f", p1)
end
local function randomPosition() -- Line: 41
    local v1 = math.random(58, 88) / 100
    return UDim2.fromScale(v1, math.random(40, 60) / 100)
end
local function fadeSpeed(p1, p2) -- Line: 45
    return math.abs(p2 - p1) / 0.25
end
local function CalculatorEntry(p1) -- Line: 49 -- upvalues: useMotion (val), react (val), fadeSpeed (val), formatDamage (val), u59 (val)
    local u4, u8, v1, v2
    v1, u4 = useMotion(p1.fromAmount)
    v2, u8 = useMotion(1)
    local u12 = react.useRef(false)
    react.useEffect(function() -- Line: 62 -- upvalues: u8 (val), fadeSpeed (upval), u4 (val), p1 (val)
        local v1
        u8:immediate(1)
        u8:linear(0.2, {speed = fadeSpeed(1, 0.2)})
        u4:immediate(p1.fromAmount)
        local v2 = math.abs(p1.toAmount - p1.fromAmount)
        if 0 >= v2 then
            v1 = 2
        else
            v1 = v2 / 0.5
        end
        u4:linear(p1.toAmount, {speed = v1})
    end, {p1.id})
    react.useEffect(function() -- Line: 75 -- upvalues: p1 (val), u12 (val), u4 (val), u8 (val), fadeSpeed (upval)
        if not p1.fadingOut or u12.current then
            return
        end
        u12.current = true
        u4:immediate(u4:get())
        local v1 = u8:get()
        u8:linear(1, {speed = fadeSpeed(v1, 1)})
        local id = p1.id
        task.delay(0.3, function() -- Line: 87 -- upvalues: p1 (upval), id (val)
            p1.onRemove(id)
        end)
    end, {p1.fadingOut})
    return react.createElement("TextLabel", {
        BackgroundTransparency = 1,
        TextSize = 38,
        AnchorPoint = Vector2.new(0.5, 0.5),
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
        Position = p1.position,
        Size = UDim2.fromOffset(240, 56),
        Text = v1:map(formatDamage),
        TextColor3 = u59,
        TextTransparency = v2,
        ZIndex = p1.layer + 15,
    })
end
return function() -- Line: 110 -- upvalues: react (val), randomPosition (val), Signals (val), CalculatorEntry (val)
    local u4, v1, v2
    local v3 = {}
    v1, u4 = react.useState(v3)
    local u8 = react.useRef(0)
    local u12 = react.useRef(0)
    local function showTotal(p1) -- Line: 127 -- upvalues: u8 (val), u12 (val), u4 (val), randomPosition (upval)
        local current = u8.current
        u8.current = p1
        local v1 = u12
        v1.current = v1.current + 1
        u4(function(a1) -- Line: 132 -- upvalues: u12 (upval), current (val), p1 (val), randomPosition (upval)
            local v1 = {}
            local v2 = a1
            local v3 = nil
            local v4 = nil
            for i, j in v2, v3, v4 do
                if not j.fadingOut then
                    table.insert(v1, {
                        fadingOut = true,
                        id = j.id,
                        fromAmount = j.fromAmount,
                        toAmount = j.toAmount,
                        position = j.position,
                    })
                else
                    table.insert(v1, j)
                end
            end
            table.insert(v1, {
                fadingOut = false,
                id = u12.current,
                fromAmount = current,
                toAmount = p1,
                position = randomPosition(),
            })
            return v1
        end)
    end
    local function resetDisplay() -- Line: 161 -- upvalues: u8 (val), u4 (val)
        u8.current = 0
        u4(function(p1) -- Line: 164
            if #p1 == 0 then
                return p1
            end
            local v1 = {}
            local v2 = p1
            local v3 = nil
            local v4 = nil
            for i, j in v2, v3, v4 do
                if not j.fadingOut then
                    table.insert(v1, {
                        fadingOut = true,
                        id = j.id,
                        fromAmount = j.fromAmount,
                        toAmount = j.toAmount,
                        position = j.position,
                    })
                else
                    table.insert(v1, j)
                end
            end
            return v1
        end)
    end
    react.useEffect(function() -- Line: 187 -- upvalues: Signals (upval), resetDisplay (val), showTotal (val)
        local u5 = Signals.Calculator:Connect(function(p1) -- Line: 188 -- upvalues: resetDisplay (upval), showTotal (upval)
            if p1.reset then
                resetDisplay()
                return
            end
            if typeof(p1.total) ~= "number" or p1.total <= 0 then
                return
            end
            showTotal(p1.total)
        end)
        return function() -- Line: 201 -- upvalues: u5 (val)
            u5:Disconnect()
        end
    end, {})
    local v4 = {}
    local v5 = v1
    local v6 = nil
    local v7 = nil
    for i, j in v5, v6, v7 do
        v2 = tostring(j.id)
        v4[v2] = react.createElement(CalculatorEntry, {
            id = j.id,
            fromAmount = j.fromAmount,
            toAmount = j.toAmount,
            position = j.position,
            fadingOut = j.fadingOut,
            layer = i,
            onRemove = function(p1) -- Line: 115 -- upvalues: u4 (val)
                u4(function(a1) -- Line: 116 -- upvalues: p1 (val)
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
            end,
        })
    end
    return react.createElement(react.Fragment, {}, v4)
end