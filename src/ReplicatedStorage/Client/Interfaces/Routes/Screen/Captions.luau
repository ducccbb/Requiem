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
--           File: ReplicatedStorage.Client.Interfaces.Routes.Screen.Captions
--                               Dumped in 0.00119 seconds
--                          Bytecode version 9  |  16 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Signals = require(Common:WaitForChild("Signals"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_2:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local Hooks = script.Parent.Parent.Parent:WaitForChild("Hooks")
local useMotion = require(Hooks:WaitForChild("useMotion"))
local function CaptionLabel(p1) -- Line: 37 -- upvalues: useMotion (val), react (val)
    local u4, u8, v1, v2
    v1, u4 = useMotion(0)
    v2, u8 = useMotion(p1.StackIndex)
    react.useEffect(function() -- Line: 45 -- upvalues: u8 (val), p1 (val)
        u8:spring(p1.StackIndex)
    end, {p1.StackIndex})
    react.useEffect(function() -- Line: 49 -- upvalues: u4 (val), p1 (val)
        local u0 = false
        u4:immediate(0)
        local v1 = utf8.len(p1.Caption.text)
        if not v1 then
            v1 = #p1.Caption.text
        end
        local u16 = v1 * 0.035
        u4:tween(v1, {time = u16, style = Enum.EasingStyle.Linear, direction = Enum.EasingDirection.Out})
        task.spawn(function() -- Line: 63 -- upvalues: u16 (val), u0 (ref), p1 (upval)
            task.wait(u16 + 3)
            if u0 then
                return
            end
            p1.OnRemove()
        end)
        return function() -- Line: 73 -- upvalues: u0 (ref)
            u0 = true
        end
    end, {p1.Caption.id})
    return react.createElement("TextLabel", {
        TextScaled = false,
        TextSize = 20,
        TextWrapped = true,
        BackgroundTransparency = 0,
        BorderSizePixel = 0,
        FontFace = Font.new("rbxasset://fonts/families/Merriweather.json"),
        Text = p1.Caption.text,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        AnchorPoint = Vector2.new(0.5, 1),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = v2:map(function(p1) -- Line: 90
            local v1 = UDim2.fromScale(0.5, 0.85)
            return v1 - UDim2.fromOffset(0, p1 * 33)
        end),
        AutomaticSize = Enum.AutomaticSize.X,
        Size = UDim2.fromOffset(0, 29),
        MaxVisibleGraphemes = v1,
    }, {Padding = react.createElement("UIPadding", {PaddingLeft = UDim.new(0, 5), PaddingRight = UDim.new(0, 5), PaddingTop = UDim.new(0, 5), PaddingBottom = UDim.new(0, 5)})})
end
return function() -- Line: 106 -- upvalues: react (val), Signals (val), CaptionLabel (val)
    local u3, u4, v1
    local v2 = {}
    u3, u4 = react.useState(v2)
    react.useEffect(function() -- Line: 109 -- upvalues: Signals (upval), u4 (val)
        local u5 = Signals.Captions:Connect(function(p1) -- Line: 110 -- upvalues: u4 (upval)
            if type(p1) ~= "string" then
                return
            end
            local v1 = tostring(os.clock())
            local u16 = v1 .. "-" .. tostring(math.random(1, 100000))
            u4(function(a1) -- Line: 117 -- upvalues: u16 (val), p1 (val)
                local v1 = table.clone(a1)
                v1[u16] = {id = u16, text = p1, spawnTime = os.clock()}
                return v1
            end)
        end)
        return function() -- Line: 128 -- upvalues: u5 (val)
            u5:Disconnect()
        end
    end, {})
    v1 = react.useMemo(function() -- Line: 133 -- upvalues: u3 (val)
        local v1 = {}
        for k, v in pairs(u3) do
            table.insert(v1, v)
        end
        table.sort(v1, function(p1, p2) -- Line: 138
            local v1 = p1.spawnTime < p2.spawnTime
            return v1
        end)
        return v1
    end, {u3})
    local v3 = {}
    local v4 = 0
    for i, v in ipairs(v1) do
        v3[v.id] = react.createElement(CaptionLabel, {
            Caption = v,
            StackIndex = v4,
            OnRemove = function() -- Line: 151 -- upvalues: u4 (val), v (val)
                u4(function(p1) -- Line: 152 -- upvalues: v (upval)
                    local v1 = table.clone(p1)
                    v1[v.id] = nil
                    return v1
                end)
            end,
        })
        v4 = v4 + 1
    end
    return react.createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 1),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 1),
        Size = UDim2.fromScale(1, 1),
    }, v3)
end