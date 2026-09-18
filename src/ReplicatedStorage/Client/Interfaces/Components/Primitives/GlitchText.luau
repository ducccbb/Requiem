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
--      File: ReplicatedStorage.Client.Interfaces.Components.Primitives.GlitchText
--                               Dumped in 0.00315 seconds
--                          Bytecode version 9  |  20 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local RunService = game:GetService("RunService")
local TextService = game:GetService("TextService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Table = require(Utilities:WaitForChild("Table"))
local u56 = {}
local v2 = Color3.fromRGB(255, 255, 255)
local v3 = Color3.fromRGB(225, 225, 225)
local v4 = Color3.fromRGB(190, 190, 190)
u56[1] = v2
u56[2] = v3
u56[3] = v4
u56[4] = Color3.fromRGB(155, 155, 155)
local u77 = {
    containerWidth = 200,
    containerHeight = 80,
    textWidth = 160,
    textHeight = 40,
    xStart = 20,
    yStart = 0,
    textSize = 24,
}
local function hideStatic(p1) -- Line: 88
    local v1
    local v2 = 18
    local v3 = 1
    local v4 = p1
    for i = 1, v2, v3 do
        v1 = v4.current[i]
        if v1 then
            v1.Visible = false
        end
    end
end
local function findInactiveSlot(p1) -- Line: 97
    local v1 = 18
    local v2 = 1
    for i = 1, v1, v2 do
        if not (p1[i].active) then
            return p1[i]
        end
    end
    return nil
end
local function resolveTextSize(p1) -- Line: 107 -- upvalues: u77 (val)
    if typeof(p1) == "number" then
        return p1
    end
    return u77.textSize
end
local function resolveFont(p1) -- Line: 115
    local Unknown = p1
    if not Unknown then
        Unknown = Enum.Font.Unknown
    end
    return Unknown
end
local function measureTextRegionFromProps(p1, p2, p3, p4, p5, p6, p7) -- Line: 119 -- upvalues: TextService (val)
    local TextSize = TextService:GetTextSize(p2, p3, p4, Vector2.new(p7, p1.Y))
    local v1 = 0
    local v2 = 0
    if p5 == Enum.TextXAlignment.Center then
        v1 = (p1.X - TextSize.X) / 2
    elseif p5 == Enum.TextXAlignment.Right then
        v1 = p1.X - TextSize.X
    end
    if p6 == Enum.TextYAlignment.Top then
        v2 = 0
    elseif p6 == Enum.TextYAlignment.Center then
        v2 = (p1.Y - TextSize.Y) / 2
    elseif p6 == Enum.TextYAlignment.Bottom then
        v2 = p1.Y - TextSize.Y
    end
    return {
        containerWidth = math.max(p1.X, 1),
        containerHeight = math.max(p1.Y, 1),
        textWidth = math.max(TextSize.X, 1),
        textHeight = math.max(TextSize.Y, 1),
        xStart = math.max(v1, 0),
        yStart = math.max(v2, 0),
        textSize = p3,
    }
end
local function randomDashWidth(p1) -- Line: 158
    local v1 = math.clamp(p1.textWidth * 0.14, 6, 28)
    local v2 = math.clamp(p1.textSize * 0.2, 4, v1)
    local v3 = math.floor(v2)
    return math.random(v3, (math.floor(v1)))
end
local function spawnStatic(p1, p2, p3, p4) -- Line: 165 -- upvalues: randomDashWidth (val), u56 (val)
    p1.active = true
    local v1 = p3
    if not v1 then
        v1 = p2.yStart + math.random() * p2.textHeight
    end
    p1.pixelY = v1
    v1 = p4
    if not v1 then
        v1 = p2.xStart + math.random() * p2.textWidth
    end
    p1.pixelX = v1
    p1.xOffset = math.random(-4, 4)
    p1.width = randomDashWidth(p2)
    if 0.75 >= math.random() then
        v1 = 1
    else
        v1 = 2
    end
    p1.height = v1
    p1.transparency = 0.2 + math.random() * 0.45
    p1.color = u56[math.random(1, #u56)]
    v1 = 0.45 < math.random()
    p1.onTop = v1
    p1.age = 0
    p1.maxAge = 0.03 + math.random() * 0.09
    p1.drift = (math.random() - 0.5) * 90
end
local function spawnStaticBurst(p1, p2) -- Line: 180 -- upvalues: findInactiveSlot (val), spawnStatic (val), randomDashWidth (val)
    local v1, v2, v3
    local v4 = p2.textWidth * 0.6
    local v5 = math.random(2, 4)
    local v6 = math.clamp(p2.textWidth * 0.04, 6, 18)
    local v7 = v5
    local v8 = 1
    for i = 1, v7, v8 do
        v3 = findInactiveSlot(p1)
        if not v3 then
            break
        end
        v2 = math.random() - 0.5
        v1 = p2.yStart + math.random() * p2.textHeight + v2 * math.clamp(p2.textSize * 0.12, 2, 6)
        v2 = p2.xStart + math.random() * math.max(v4, 1) + (i - 1) * v6
        spawnStatic(v3, p2, v1, v2 + math.random() * 4)
        v3.width = randomDashWidth(p2) * 0.75
        v3.maxAge = 0.02 + math.random() * 0.06
    end
end
local function spawnChanceForRegion(p1, p2) -- Line: 203
    return p2 - math.clamp(p1.textWidth * p1.textHeight / 12000, 0, 0.12)
end
local function updateTextJitter(p1, p2, p3) -- Line: 210
    local v1 = math.clamp(p2.textSize * 0.04, 0.8, 2)
    p1.x = p1.x * 0.62 + (math.random() - 0.5) * 1.4 * v1
    p1.y = p1.y * 0.62 + (math.random() - 0.5) * 0.4 * v1
    if 0.94 < math.random() then
        p1.x = p1.x + (math.random() - 0.5) * 2.5 * v1
    end
    p3(Vector2.new(p1.x, p1.y))
end
return react.memo(function(p1) -- Line: 223 -- upvalues: react (val), u77 (val), resolveTextSize (val), u56 (val), RunService (val), measureTextRegionFromProps (val), resolveFont (val), updateTextJitter (val), spawnChanceForRegion (val), findInactiveSlot (val), spawnStatic (val), spawnStaticBurst (val), hideStatic (val), Table (val)
    local TextTransparency, u27, u51, v1, v2, v3, v4, v5
    local u166 = react.useRef(nil)
    local v6 = {}
    local u154 = react.useRef(v6)
    local v7 = {}
    local u12 = react.useRef(v7)
    local u18 = react.useRef((table.clone(u77)))
    local u22 = react.useRef({x = 0, y = 0})
    v5, u27 = react.useBinding(Vector2.zero)
    local u30 = resolveTextSize(p1.TextSize)
    local v8 = react.useMemo(function() -- Line: 234 -- upvalues: p1 (val)
        return table.clone(p1)
    end, {p1})
    react.useEffect(function() -- Line: 238 -- upvalues: u12 (val), u56 (upval), RunService (upval), u166 (val), u18 (val), measureTextRegionFromProps (upval), p1 (val), u30 (val), resolveFont (upval), updateTextJitter (upval), u22 (val), u27 (val), spawnChanceForRegion (upval), findInactiveSlot (upval), spawnStatic (upval), spawnStaticBurst (upval), u154 (val), hideStatic (upval)
        local v1 = 18
        local v2 = 1
        for i = 1, v1, v2 do
            u12.current[i] = {
                active = false,
                pixelX = 0,
                pixelY = 0,
                xOffset = 0,
                width = 8,
                height = 1,
                transparency = 0.5,
                onTop = false,
                age = 0,
                maxAge = 0.05,
                drift = 0,
                color = u56[1],
            }
        end
        local u20 = RunService.Heartbeat:Connect(function(a1) -- Line: 256 -- upvalues: u166 (upval), u18 (upval), measureTextRegionFromProps (upval), p1 (upval), u30 (upval), resolveFont (upval), updateTextJitter (upval), u22 (upval), u27 (upval), spawnChanceForRegion (upval), findInactiveSlot (upval), u12 (upval), spawnStatic (upval), spawnStaticBurst (upval), u154 (upval)
            local transparency, v1, v2, v3, v4, v5
            local current = u166.current
            local current_2 = u18.current
            if current and 0 < current.AbsoluteSize.X then
                v4 = resolveFont(p1.Font)
                current_2 = measureTextRegionFromProps(current.AbsoluteSize, p1.Text, u30, v4, p1.TextXAlignment, p1.TextYAlignment, current.AbsoluteSize.X)
                u18.current = current_2
            end
            updateTextJitter(u22.current, current_2, u27)
            if spawnChanceForRegion(current_2, 0.9) < math.random() then
                v2 = findInactiveSlot(u12.current)
                if v2 then
                    spawnStatic(v2, current_2)
                end
            end
            if spawnChanceForRegion(current_2, 0.965) < math.random() then
                spawnStaticBurst(u12.current, current_2)
            end
            v2 = 18
            local v6 = 1
            local v7 = a1
            for i = 1, v2, v6 do
                v3 = u154.current[i]
                v4 = u12.current[i]
                if v3 and v4 then
                    if v4.active then
                        v4.age = v4.age + v7
                        v4.xOffset = v4.xOffset + v4.drift * v7
                        if v4.maxAge > v4.age then
                            v5 = v4.age / v4.maxAge
                            if v5 < 0.2 then
                                transparency = v4.transparency + 0.25
                            elseif 0.75 >= v5 then
                                transparency = v4.transparency
                            end
                            v3.Visible = true
                            if not v4.onTop then
                                v1 = 1
                            else
                                v1 = 3
                            end
                            v3.ZIndex = v1
                            v3.Position = UDim2.fromOffset(v4.pixelX + v4.xOffset, v4.pixelY)
                            v3.Size = UDim2.fromOffset(v4.width, v4.height)
                            v3.BackgroundColor3 = v4.color
                            v3.BackgroundTransparency = transparency
                        else
                            v4.active = false
                            v3.Visible = false
                        end
                    elseif spawnChanceForRegion(current_2, 0.88) < math.random() then
                        spawnStatic(v4, current_2)
                    end
                end
            end
        end)
        return function() -- Line: 324 -- upvalues: u20 (val), u27 (upval), hideStatic (upval), u154 (upval)
            u20:Disconnect()
            u27(Vector2.zero)
            hideStatic(u154)
        end
    end, {
        p1.Text,
        u30,
        p1.Font,
        p1.TextXAlignment,
        p1.TextYAlignment,
    })
    v1, u51 = react.useBinding(0)
    react.useEffect(function() -- Line: 333 -- upvalues: p1 (val), u51 (val)
        if typeof(p1.TextTransparency) == "number" then
            u51(p1.TextTransparency)
            return
        end
        if p1.TextTransparency == nil then
            u51(0)
        end
    end, {p1.TextTransparency})
    if typeof(p1.TextTransparency) ~= "table" then
        TextTransparency = v1
    else
        TextTransparency = p1.TextTransparency
    end
    local v9 = {
        RichText = true,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 2,
        Text = p1.Text,
        TextColor3 = p1.TextColor3,
        TextTransparency = TextTransparency,
        TextSize = p1.TextSize,
        TextWrapped = p1.TextWrapped,
        TextXAlignment = p1.TextXAlignment,
        TextYAlignment = p1.TextYAlignment,
        MaxVisibleGraphemes = p1.MaxVisibleGraphemes,
        Font = p1.Font,
        FontFace = p1.FontFace,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = v5:map(function(p1) -- Line: 360
            return UDim2.new(0.5, p1.X, 0.5, p1.Y)
        end),
        Size = UDim2.fromScale(1, 1),
    }
    local v10 = {}
    local v11 = {}
    local v12 = 18
    local v13 = 1
    for i = 1, v12, v13 do
        v3 = {
            BackgroundTransparency = 0.4,
            BorderSizePixel = 0,
            ref = function(p1) -- Line: 372 -- upvalues: u154 (val), i (val)
                u154.current[i] = p1
                if p1 then
                    p1.Visible = false
                end
            end,
            AnchorPoint = Vector2.new(0, 0.5),
            BackgroundColor3 = Color3.fromRGB(230, 230, 230),
            Position = UDim2.fromOffset(0, 0),
            Size = UDim2.fromOffset(12, 1),
        }
        if i % 2 ~= 0 then
            v4 = 1
        else
            v4 = 3
        end
        v3.ZIndex = v4
        v2 = react.createElement("Frame", v3)
        if i % 2 ~= 0 then
            v10[("Static%*"):format(i)] = v2
        else
            v11[("Static%*"):format(i)] = v2
        end
    end
    local v14 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ClipsDescendants = false,
        ZIndex = 2,
        ref = function(p1) -- Line: 396 -- upvalues: u166 (val)
            u166.current = p1
        end,
    }
    local AnchorPoint = v8.AnchorPoint
    if not AnchorPoint then
        AnchorPoint = Vector2.new(0.5, 0.5)
    end
    v14.AnchorPoint = AnchorPoint
    local Position = v8.Position
    if not Position then
        Position = UDim2.fromScale(0.5, 0.5)
    end
    v14.Position = Position
    local Size = v8.Size
    if not Size then
        Size = UDim2.fromScale(1, 0.2)
    end
    v14.Size = Size
    v14.Rotation = v8.Rotation
    v2 = {BehindStatic = react.createElement(react.Fragment, {}, v10)}
    v4 = Table.merge(v9, {})
    v2.Main = react.createElement("TextLabel", v4, u230.children)
    v2.FrontStatic = react.createElement(react.Fragment, {}, v11)
    return react.createElement("Frame", v14, v2)
end)