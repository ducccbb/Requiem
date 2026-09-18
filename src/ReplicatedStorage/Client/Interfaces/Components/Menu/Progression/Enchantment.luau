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
--   File: ReplicatedStorage.Client.Interfaces.Components.Menu.Progression.Enchantment
--                               Dumped in 0.00222 seconds
--                          Bytecode version 9  |  19 functions

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
local Hooks = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useAsyncEffect = require(Hooks:WaitForChild("useAsyncEffect"))
local Hooks_2 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useMotion = require(Hooks_2:WaitForChild("useMotion"))
local Hooks_3 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useRem = require(Hooks_3:WaitForChild("useRem"))
local Effects_2 = v1.Parent:WaitForChild("Effects")
local Cards = Effects_2:WaitForChild("Cards")
local Effects = require(Cards:WaitForChild("Effects"))
local Primitives = v1.Parent.Parent.Parent:WaitForChild("Primitives")
local Frame = require(Primitives:WaitForChild("Frame"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Progression = Common_2:WaitForChild("Progression")
local Enchantments = Progression:WaitForChild("Enchantments")
local Rarities = require(Enchantments:WaitForChild("Rarities"))
local u138 = UDim2.fromScale(0.93, 0.95)
local u142 = UDim.new(0.1, 0)
local u143 = {
    Common = "rbxassetid://99848186568259",
    Uncommon = "rbxassetid://95612181856319",
    Rare = "rbxassetid://111482259252171",
    Epic = "rbxassetid://134223433972721",
    Legendary = "rbxassetid://94637323493819",
    Mythic = "rbxassetid://89926066789657",
    Unique = "rbxassetid://121983914914645",
    Special = "rbxassetid://121983914914645",
}
local u148 = (function(p1, p2) -- Line: 93
    local v1 = {}
    local v2 = NumberSequenceKeypoint.new(0, 1)
    local v3 = NumberSequenceKeypoint.new(0.5 - p2, 1)
    local v4 = NumberSequenceKeypoint.new(0.5, p1)
    local v5 = NumberSequenceKeypoint.new(p2 + 0.5, 1)
    v1[1] = v2
    v1[2] = v3
    v1[3] = v4
    v1[4] = v5
    v1[5] = NumberSequenceKeypoint.new(1, 1)
    return NumberSequence.new(v1)
end)(0.74, 0.07)
local function hasCustomArt(p1) -- Line: 112
    local v1 = if p1 ~= nil then p1 ~= "" else false
    return v1
end
local function EnchantmentCardShineLane(p1) -- Line: 120 -- upvalues: useMotion (val), react (val), u148 (val)
    local u4, v1
    v1, u4 = useMotion(-1)
    local u6 = p1.DurationSeconds or 5
    local u9 = p1.Loop ~= false
    react.useEffect(function() -- Line: 130 -- upvalues: p1 (val), u9 (val), u4 (val), u6 (val)
        local u0 = false
        local u3 = task.spawn(function() -- Line: 133 -- upvalues: p1 (upval), u9 (upval), u0 (ref), u4 (upval), u6 (upval)
            if 0 < p1.DelaySeconds then
                task.wait(p1.DelaySeconds)
            end
            if not u9 then
                u4:immediate(-1)
                u4:tween(1, {time = u6, style = Enum.EasingStyle.Linear})
            else
                while not u0 do
                    u4:immediate(-1)
                    u4:tween(1, {time = u6, style = Enum.EasingStyle.Linear})
                    task.wait(u6 + 10)
                end
            end
        end)
        return function() -- Line: 156 -- upvalues: u0 (ref), u3 (val)
            u0 = true
            task.cancel(u3)
        end
    end, {p1.DelaySeconds, u6, u9})
    return react.createElement("Frame", {
        BackgroundTransparency = 0,
        BorderSizePixel = 0,
        ZIndex = 1,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        LayoutOrder = p1.LayoutOrder,
        Size = UDim2.fromScale(1, 1),
    }, {Gradient = react.createElement("UIGradient", {Rotation = 45, Transparency = u148, Offset = v1:map(function(p1) -- Line: 173
        return Vector2.new(p1, p1)
    end)})})
end
local function EnchantmentCardShine(p1) -- Line: 184 -- upvalues: react (val), EnchantmentCardShineLane (val), u138 (val), u142 (val)
    local v1
    local v2 = {}
    local v3 = p1.DurationSeconds or 5
    local v4 = not p1.Once
    if not p1.CatchUpDelay then
        local v5
        v1 = 2
        local v6 = 1
        for i = 1, v1, v6 do
            v5 = ("Lane%*"):format(i)
            v2[v5] = react.createElement(EnchantmentCardShineLane, {DelaySeconds = (i - 1) * 7.5, DurationSeconds = v3, LayoutOrder = i, Loop = v4})
        end
    else
        v1 = math.clamp(p1.CatchUpDelay, 0, v3 * 0.95)
        v2.Lane1 = react.createElement(EnchantmentCardShineLane, {DelaySeconds = 0, LayoutOrder = 1, DurationSeconds = v3, Loop = v4})
        v2.Lane2 = react.createElement(EnchantmentCardShineLane, {LayoutOrder = 2, DelaySeconds = v1, DurationSeconds = v3 - v1, Loop = v4})
    end
    return react.createElement("Frame", {
        BackgroundTransparency = 1,
        ClipsDescendants = true,
        ZIndex = 4,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = u138,
    }, {Corner = react.createElement("UICorner", {CornerRadius = u142}), Clip = react.createElement("Frame", {BackgroundTransparency = 1, ClipsDescendants = true, ZIndex = 1, Size = UDim2.fromScale(1, 1)}, v2)})
end
local function EnchantmentCardFace(p1) -- Line: 245 -- upvalues: useRem (val), u143 (val), Rarities (val), hasCustomArt (val), react (val), EnchantmentCardShine (val)
    local v1
    local v2 = useRem()
    local v3 = p1.Enabled ~= false
    local v4 = u143[Rarities.RarityNames[p1.Rarity]]
    if not (hasCustomArt(p1.Art)) then
        return react.createElement(react.Fragment, {}, {Art = react.createElement("ImageLabel", {
            BackgroundTransparency = 1,
            Image = v4,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(1, 1),
            ImageColor3 = Color3.fromRGB(216, 216, 216),
        }), Image = react.createElement("ImageLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Image = p1.Icon or "rbxassetid://124091212951883",
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.fromScale(0.5, 0.424),
            Size = UDim2.fromScale(0.735, 0.525),
        }, {UIAspectRatioConstraint = react.createElement("UIAspectRatioConstraint")}), Label = react.createElement("TextLabel", {
            TextScaled = true,
            TextTransparency = 0.2,
            TextWrapped = true,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ZIndex = 3,
            FontFace = Font.new("rbxasset://fonts/families/Balthazar.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
            Text = p1.Label,
            TextColor3 = Color3.fromRGB(253, 254, 253),
            TextSize = v2(20),
            TextYAlignment = Enum.TextYAlignment.Top,
            AnchorPoint = Vector2.new(0.5, 0),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.fromScale(0.5, 0.739),
            Size = UDim2.fromScale(0.514, 0.164),
        }, {UIAspectRatioConstraint = react.createElement("UIAspectRatioConstraint", {AspectRatio = 2.24}), UITextSizeConstraint = react.createElement("UITextSizeConstraint", {MaxTextSize = 20})})})
    end
    local createElement = react.createElement
    local Fragment = react.Fragment
    local v5 = {Art = react.createElement("ImageLabel", {
        BackgroundTransparency = 1,
        ZIndex = 1,
        Image = p1.Art,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
    })}
    if not v3 then
        v1 = nil
    elseif p1.Rarity ~= Rarities.Rarities.Mythic then
        v1 = nil
    else
        v1 = react.createElement(EnchantmentCardShine, {Once = p1.ShineOnce, DurationSeconds = p1.ShineDurationSeconds, CatchUpDelay = p1.ShineCatchUpDelay})
        if not v1 then
            v1 = nil
        end
    end
    v5.Shine = v1
    return createElement(Fragment, {}, v5)
end
return {
    Card = function(p1) -- Line: 329 -- upvalues: useMotion (val), Effects (val), hasCustomArt (val), useAsyncEffect (val), Promise (val), react (val), Frame (val), Rarities (val), EnchantmentCardFace (val)
        local u4, u8, v1, v2, v3
        v1, u4 = useMotion(1.5)
        v3, u8 = useMotion(0)
        local v4 = if p1.Glow == nil then p1.Embers ~= nil else true
        local v5 = {}
        local EffectId = p1.EffectId
        if not EffectId then
            EffectId = p1.Label
        end
        v5.effectId = EffectId
        v5.enabled = p1.Enabled and v4
        v5.rarity = p1.Rarity
        v5.hasCustomArt = hasCustomArt(p1.Art)
        v5.glow = p1.Glow
        v5.embers = p1.Embers
        local v6 = p1.Pulse == true
        v5.pulse = v6
        local v7 = Effects.useCardAnchor(v5)
        useAsyncEffect(function() -- Line: 345 -- upvalues: p1 (val), Promise (upval), u4 (val)
            if not p1.Enabled then
                return Promise.delay(0):andThen(function() -- Line: 347 -- upvalues: u4 (upval)
                    u4:immediate(1.5)
                end)
            end
            local EntranceDelay = p1.EntranceDelay
            if EntranceDelay == nil then
                EntranceDelay = (p1.Index or 1) / 30
            end
            return Promise.delay(EntranceDelay or 0):andThen(function() -- Line: 357 -- upvalues: u4 (upval)
                u4:spring(0.5)
            end)
        end, {p1.Enabled, p1.EntranceDelay, p1.Index})
        local v8 = {ClipsDescendants = true, AnchorPoint = Vector2.new(0, 0), Position = UDim2.fromScale(0, 0)}
        if p1.Rarity == Rarities.Rarities.Unique then
            v2 = 1500
        elseif p1.Claimed then
            v2 = 500 - (p1.Rarity * 200 + p1.Index)
        else
            v2 = -500
        end
        v8.LayoutOrder = v2
        v8.Visible = p1.Enabled
        v8.Size = UDim2.fromScale(1, 1)
        v8.Reference = v7
        v8[react.Event.MouseEnter] = function(...) -- Line: 373 -- upvalues: u8 (val)
            u8:spring(-10)
        end
        v8[react.Event.MouseLeave] = function(...) -- Line: 377 -- upvalues: u8 (val)
            u8:spring(0)
        end
        v2 = {}
        local v9 = {
            AutoButtonColor = false,
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 1),
            Text = "",
            ZIndex = 2,
        }
        v9[react.Event.MouseButton1Click] = function(...) -- Line: 388 -- upvalues: p1 (val)
            if p1.Clicked then
                p1.Clicked()
            end
        end
        v2.Button = react.createElement("TextButton", v9)
        v2.Card = react.createElement(Frame, {BackgroundTransparency = 1, Size = v3:map(function(p1) -- Line: 398
            local v1 = UDim2.fromScale(1, 1)
            return v1 + UDim2.fromOffset(p1, p1)
        end), AnchorPoint = Vector2.new(0.5, 0.5), Position = v1:map(function(p1) -- Line: 402
            return UDim2.fromScale(0.5, p1)
        end)}, {Face = react.createElement(EnchantmentCardFace, {
            Rarity = p1.Rarity,
            Label = p1.Label,
            Icon = p1.Icon,
            Art = p1.Art,
            Enabled = p1.Enabled,
        })})
        return react.createElement(Frame, v8, v2)
    end,
    CardFace = EnchantmentCardFace,
}