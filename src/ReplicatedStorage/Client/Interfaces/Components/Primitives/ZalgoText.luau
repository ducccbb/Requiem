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
--       File: ReplicatedStorage.Client.Interfaces.Components.Primitives.ZalgoText
--                               Dumped in 0.00177 seconds
--                          Bytecode version 9  |  14 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local u32 = {
    "̍",
    "̎",
    "̄",
    "̅",
    "̿",
    "̑",
    "̆",
    "̐",
    "͒",
    "͗",
    "͑",
    "̇",
    "̈",
    "̃",
    "̂",
    "̌",
    "̏",
    "̒",
    "̓",
    "̔",
    "̽",
    "̉",
    "ͣ",
    "ͤ",
    "ͥ",
    "ͦ",
    "ͧ",
    "ͨ",
    "ͩ",
    "ͪ",
    "ͫ",
    "ͬ",
    "ͭ",
    "ͮ",
    "ͯ",
}
local u68 = {
    "̕",
    "̛",
    "̀",
    "́",
    "̴",
    "̵",
    "̶",
    "̷",
    "̸",
    "͂",
    "̓",
    "̈́",
    "͆",
}
local u82 = {
    "̖",
    "̗",
    "̘",
    "̙",
    "̜",
    "̝",
    "̞",
    "̟",
    "̠",
    "̤",
    "̥",
    "̦",
    "̩",
    "̪",
    "̫",
    "̬",
    "̭",
    "̮",
    "̯",
    "̰",
    "̱",
    "̲",
    "̳",
    "̹",
    "̺",
    "̻",
    "̼",
    "̽",
    "̾",
}
local function appendMarks(p1, p2, p3) -- Line: 123
    local v1 = p3
    local v2 = 1
    for i = 1, v1, v2 do
        p1[#p1 + 1] = p2[math.random(1, #p2)]
    end
end
local function shouldSkipCharacter(p1) -- Line: 129
    if p1 == " " or p1 == "\n" or p1 == "\t" then
        return true
    end
    local v1 = utf8.codepoint(p1)
    if not v1 then
        return true
    end
    local v2 = if v1 >= 32 then if 8192 <= v1 then v1 <= 8303 else false else true
    return v2
end
local function toZalgo(p1, p2, p3, p4) -- Line: 142 -- upvalues: shouldSkipCharacter (val), appendMarks (val), u32 (val), u68 (val), u82 (val)
    local v1
    local v2 = {}
    local v3 = false
    for i, j in utf8.graphemes(p1) do
        v1 = p1:sub(i, j)
        if v1 == "<" then
            v3 = true
            v2[#v2 + 1] = v1
        elseif v1 == ">" then
            v3 = false
            v2[#v2 + 1] = v1
        elseif not v3 then
            v2[#v2 + 1] = v1
            if not (shouldSkipCharacter(v1)) then
                appendMarks(v2, u32, math.random(0, p2))
                appendMarks(v2, u68, math.random(0, p3))
                appendMarks(v2, u82, math.random(0, p4))
            end
        else
            v2[#v2 + 1] = v1
        end
    end
    return table.concat(v2)
end
local function buildLabelProps(p1, p2, p3, p4, p5) -- Line: 180
    return {
        RichText = true,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Text = p2,
        TextColor3 = p1.TextColor3,
        TextTransparency = p3,
        TextSize = p1.TextSize,
        TextWrapped = p1.TextWrapped,
        TextXAlignment = p1.TextXAlignment,
        TextYAlignment = p1.TextYAlignment,
        MaxVisibleGraphemes = p1.MaxVisibleGraphemes,
        Font = p1.Font,
        FontFace = p1.FontFace,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = p4,
        Size = UDim2.fromScale(1, 1),
        ZIndex = p5,
    }
end
return react.memo(function(p1) -- Line: 208 -- upvalues: react (val), toZalgo (val), RunService (val), buildLabelProps (val)
    local TextTransparency, u11, u16, u21, v1, v2, v3
    local v4 = {p1}
    local v5 = react.useMemo(function() -- Line: 209 -- upvalues: p1 (val)
        return table.clone(p1)
    end, v4)
    v1, u11 = react.useState(function() -- Line: 213 -- upvalues: toZalgo (upval), p1 (val)
        return toZalgo(p1.Text, 4, 2, 6)
    end)
    v2, u16 = react.useBinding(Vector2.zero)
    v3, u21 = react.useBinding(0)
    react.useEffect(function() -- Line: 221 -- upvalues: p1 (val), u21 (val)
        if typeof(p1.TextTransparency) == "number" then
            u21(p1.TextTransparency)
            return
        end
        if p1.TextTransparency == nil then
            u21(0)
        end
    end, {p1.TextTransparency})
    if typeof(p1.TextTransparency) ~= "table" then
        TextTransparency = v3
    else
        TextTransparency = p1.TextTransparency
    end
    local v6 = TextTransparency:map(function(p1) -- Line: 233
        local v1 = p1 * 0.5 + 0.5
        return (math.clamp(v1, 0, 1))
    end)
    react.useEffect(function() -- Line: 237 -- upvalues: u11 (val), toZalgo (upval), p1 (val), RunService (upval), u16 (val)
        u11(toZalgo(p1.Text, 4, 2, 6))
        local u9 = 0
        local u15 = RunService.Heartbeat:Connect(function(a1) -- Line: 241 -- upvalues: u9 (ref), u11 (upval), toZalgo (upval), p1 (upval), u16 (upval)
            u9 = u9 + a1
            if u9 < 0.06 then
                return
            end
            u9 = 0
            u11(toZalgo(p1.Text, 4, 2, 6))
            local v1 = math.random(-2, 2)
            u16(Vector2.new(v1, math.random(-2, 2)))
        end)
        return function() -- Line: 253 -- upvalues: u15 (val), u16 (upval)
            u15:Disconnect()
            u16(Vector2.zero)
        end
    end, {p1.Text})
    local v7 = v2:map(function(p1) -- Line: 259
        return UDim2.new(0.5, p1.X, 0.5, p1.Y)
    end)
    local v8 = {BackgroundTransparency = 1, BorderSizePixel = 0, ClipsDescendants = false, ZIndex = 2}
    local AnchorPoint = v5.AnchorPoint
    if not AnchorPoint then
        AnchorPoint = Vector2.new(0.5, 0.5)
    end
    v8.AnchorPoint = AnchorPoint
    local Position = v5.Position
    if not Position then
        Position = UDim2.fromScale(0.5, 0.5)
    end
    v8.Position = Position
    local Size = v5.Size
    if not Size then
        Size = UDim2.fromScale(1, 0.2)
    end
    v8.Size = Size
    v8.Rotation = v5.Rotation
    local v9 = {Corrupted = react.createElement("TextLabel", buildLabelProps(p1, v1, v6, v7, 1))}
    local Text = p1.Text
    local v10 = UDim2.fromScale(0.5, 0.5)
    local v11 = buildLabelProps(p1, Text, TextTransparency, v10, 2)
    v9.Main = react.createElement("TextLabel", v11, p1.children)
    return react.createElement("Frame", v8, v9)
end)