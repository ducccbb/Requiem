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
--        File: ReplicatedStorage.Client.Interfaces.Routes.Pages.Enchantment.Pack
--                               Dumped in 0.0116 seconds
--                          Bytecode version 9  |  82 functions

local u254, u257
local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local Components = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Menu = Components:WaitForChild("Menu")
local Progression = Menu:WaitForChild("Progression")
local Enchantment = require(Progression:WaitForChild("Enchantment"))
local Components_2 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Utilities = Components_2:WaitForChild("Utilities")
local FillProps = require(Utilities:WaitForChild("FillProps"))
local Components_3 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Utilities_2 = Components_3:WaitForChild("Utilities")
local Space3D = Utilities_2:WaitForChild("Space3D")
local Provider = require(Space3D:WaitForChild("Provider"))
local Components_4 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Utilities_3 = Components_4:WaitForChild("Utilities")
local Space3D_2 = Utilities_3:WaitForChild("Space3D")
local Surface = require(Space3D_2:WaitForChild("Surface"))
local Components_5 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Utilities_4 = Components_5:WaitForChild("Utilities")
local Space3D_3 = Utilities_4:WaitForChild("Space3D")
require(Space3D_3:WaitForChild("Types"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Progression_2 = Common:WaitForChild("Progression")
local Enchantments = Progression_2:WaitForChild("Enchantments")
local Rarities = require(Enchantments:WaitForChild("Rarities"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Utilities_5 = Common_2:WaitForChild("Utilities")
local Sounds = require(Utilities_5:WaitForChild("Sounds"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Sounds_2 = Common_3:WaitForChild("Sounds")
local Universal = require(Sounds_2:WaitForChild("Universal"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_5:WaitForChild("Common")
local Statistics = Common_4:WaitForChild("Statistics")
local useCameraTilt = require(Statistics:WaitForChild("useCameraTilt"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_6:WaitForChild("Common")
local Statistics_2 = Common_5:WaitForChild("Statistics")
local useFieldOfView = require(Statistics_2:WaitForChild("useFieldOfView"))
_, u254 = useCameraTilt()
_, u257 = useFieldOfView()
local u258 = {0.95, 1, 1.05}
local u262 = {
    Common = "rbxassetid://99848186568259",
    Uncommon = "rbxassetid://95612181856319",
    Rare = "rbxassetid://111482259252171",
    Epic = "rbxassetid://134223433972721",
    Legendary = "rbxassetid://94637323493819",
    Mythic = "rbxassetid://89926066789657",
    Unique = "rbxassetid://121983914914645",
    Special = "rbxassetid://121983914914645",
}
local u263 = {}
local u264 = {}
local v3 = {1, 2, 3}
u264.current = v3
local u269 = {}
local u270 = nil
local u271 = false
local u272 = nil
local u273 = nil
local u274 = nil
local u275 = nil
local function getPackEntry(p1) -- Line: 170 -- upvalues: u263 (val)
    local current = u263.current
    if not current then
        return nil
    end
    return current[p1]
end
local function getActiveCardIndices(p1) -- Line: 182
    if not p1 then
        return {}
    end
    local v1 = {}
    if p1[1] then
        table.insert(v1, 1)
    end
    if p1[2] then
        table.insert(v1, 2)
    end
    if p1[3] then
        table.insert(v1, 3)
    end
    return v1
end
local function syncActiveCardIndices(p1) -- Line: 200 -- upvalues: u264 (val), getActiveCardIndices (val)
    u264.current = getActiveCardIndices(p1)
end
local function getCardLayoutSlot(p1) -- Line: 208 -- upvalues: u264 (val)
    local current = u264.current
    local v1 = nil
    local v2 = nil
    for i, j in current, v1, v2 do
        if j == p1 then
            return i
        end
    end
    return p1
end
local function getCardCenterOffset(p1) -- Line: 221 -- upvalues: u264 (val), getCardLayoutSlot (val)
    local v1 = #u264.current
    if v1 == 0 then
        return 0
    end
    local v2 = getCardLayoutSlot(p1)
    return (v2 - (v1 + 1) / 2) * 217.34
end
local function getCardOutward(p1) -- Line: 237 -- upvalues: u264 (val), getCardLayoutSlot (val)
    local v1 = #u264.current
    if v1 <= 1 then
        return 0
    end
    local v2 = getCardLayoutSlot(p1)
    return v2 - (v1 + 1) / 2
end
local function getLegendaryCardIndex() -- Line: 252 -- upvalues: u263 (val), Rarities (val)
    local current = u263.current
    if not current then
        return 2
    end
    local v1 = current
    local v2 = nil
    local v3 = nil
    for i, j in v1, v2, v3 do
        if j.Rarity == Rarities.Rarities.Legendary then
            return i
        end
    end
    return 2
end
local function getRevealFlipSound(p1) -- Line: 273 -- upvalues: Rarities (val), Universal (val)
    if p1 == Rarities.Rarities.Legendary then
        return Universal.RevealLegendary, 3
    end
    if p1 == Rarities.Rarities.Epic then
        return Universal.RevealEpic, 2
    end
    if p1 == Rarities.Rarities.Rare then
        return Universal.RevealRare, 2
    end
    return Universal.Flipping, 2
end
local function playCardFlipSound(p1) -- Line: 289 -- upvalues: getCardLayoutSlot (val), u258 (val), getPackEntry (val), Rarities (val), getRevealFlipSound (val), Sounds (val)
    local Rarity, v1, v2
    local v3 = u258[getCardLayoutSlot(p1)] or 1
    local v4 = getPackEntry(p1)
    if not v4 then
        Rarity = Rarities.Rarities.Common
    else
        Rarity = v4.Rarity
    end
    v1, v2 = getRevealFlipSound(Rarity)
    Sounds.playGlobalSoundEffect(v1, 0.1, v2, 20, NumberRange.new(v3, v3))
end
local function playCardRevealSound(p1) -- Line: 302 -- upvalues: getCardLayoutSlot (val), u258 (val), Sounds (val), Universal (val)
    local v1 = u258[getCardLayoutSlot(p1)] or 1
    Sounds.playGlobalSoundEffect(Universal.Revealing, 0.1, 1, 20, NumberRange.new(v1, v1))
end
local function easeOutExpo(p1, p2) -- Line: 315
    return 1 - math.pow(1 - p1, p2)
end
local function getClickAnimationOffset(p1) -- Line: 323 -- upvalues: easeOutExpo (val)
    local v1 = easeOutExpo(p1, 3)
    return CFrame.Angles(0, math.pi * v1, 0)
end
local function isLegendary(p1) -- Line: 332 -- upvalues: getPackEntry (val), Rarities (val)
    local v1 = getPackEntry(p1)
    local v2 = if v1 ~= nil then v1.Rarity == Rarities.Rarities.Legendary else false
    return v2
end
local function getClickFlipDuration(p1) -- Line: 341 -- upvalues: isLegendary (val)
    if isLegendary(p1) then
        return 0.65
    end
    return 0.55
end
local function smoothStep(p1) -- Line: 349
    local v1 = math.clamp(p1, 0, 1)
    return v1 * v1 * (3 - v1 * 2)
end
local function ramp(p1, p2, p3) -- Line: 360 -- upvalues: smoothStep (val)
    if p3 > p2 then
        local v1 = (p1 - p2) / (p3 - p2)
        return smoothStep((math.clamp(v1, 0, 1)))
    end
    if p3 <= p1 then
        return 1
    end
    return 0
end
local function getLegendaryRevealVisualEnvelope(p1) -- Line: 373 -- upvalues: smoothStep (val)
    local v1 = math.clamp(p1, 0, 1)
    local v2 = smoothStep(v1) * math.pi
    local v3 = math.clamp((v1 - 0.62) / 0.38, 0, 1)
    local v4 = math.sin(v2)
    return v4 * (1 - smoothStep(v3) * 0.92)
end
local function ensureLegendaryRevealColorCorrection() -- Line: 385 -- upvalues: u274 (ref), Lighting (val)
    local ColorCorrectionEffect
    if not u274 then
        ColorCorrectionEffect = Instance.new("ColorCorrectionEffect")
        ColorCorrectionEffect.Name = "EnchantmentPackOpeningColorCorrection"
        ColorCorrectionEffect.Saturation = 0
        ColorCorrectionEffect.Brightness = 0
        ColorCorrectionEffect.Contrast = 0
        ColorCorrectionEffect.TintColor = Color3.fromRGB(255, 255, 255)
        ColorCorrectionEffect.Parent = Lighting
        u274 = ColorCorrectionEffect
        return ColorCorrectionEffect
    end
    if u274.Parent then
        return u274
    end
    ColorCorrectionEffect = Instance.new("ColorCorrectionEffect")
    ColorCorrectionEffect.Name = "EnchantmentPackOpeningColorCorrection"
    ColorCorrectionEffect.Saturation = 0
    ColorCorrectionEffect.Brightness = 0
    ColorCorrectionEffect.Contrast = 0
    ColorCorrectionEffect.TintColor = Color3.fromRGB(255, 255, 255)
    ColorCorrectionEffect.Parent = Lighting
    u274 = ColorCorrectionEffect
    return ColorCorrectionEffect
end
local function stopLegendaryRevealColorCorrection() -- Line: 404 -- upvalues: u275 (ref), u274 (ref), TweenService (val)
    if u275 then
        u275:Cancel()
        u275 = nil
    end
    local u6 = u274
    if not u6 then
        return
    end
    local v1 = TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
    local v2 = TweenService:Create(u6, v1, {Saturation = 0})
    u275 = v2
    v2:Play()
    v2.Completed:Once(function() -- Line: 422 -- upvalues: u6 (val), u274 (upval), u275 (upval)
        if u6.Parent then
            u6:Destroy()
        end
        if u274 == u6 then
            u274 = nil
        end
        u275 = nil
    end)
end
local function getLegendaryRevealCameraEffect(p1, p2) -- Line: 438 -- upvalues: getLegendaryRevealVisualEnvelope (val), smoothStep (val)
    local v1 = math.clamp(p1, 0, 1)
    local v2 = smoothStep(v1)
    local v3 = math.clamp((v1 - 0.62) / 0.38, 0, 1)
    local v4 = math.sin(v3 * math.pi)
    local v5 = math.sin(v2 * math.pi)
    local v6 = v5 * (1 - smoothStep(v3) * 0.95)
    local v7 = math.sin(p2 * 8.5 * 0.88 + 2.15) * 2.4 * v6
    return v7 + v4 * 1.6 * (1 - v4), getLegendaryRevealVisualEnvelope(p1) * 5
end
local function applyLegendaryRevealSaturation(p1) -- Line: 460 -- upvalues: ensureLegendaryRevealColorCorrection (val), getLegendaryRevealVisualEnvelope (val)
    ensureLegendaryRevealColorCorrection().Saturation = getLegendaryRevealVisualEnvelope(p1) * 0.42
end
local function stopLegendaryRevealCamera() -- Line: 468 -- upvalues: u270 (ref), stopLegendaryRevealColorCorrection (val), u272 (ref), u273 (ref), u271 (ref), RunService (val)
    u270 = nil
    stopLegendaryRevealColorCorrection()
    if u272 then
        u272(TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out))
        u272 = nil
    end
    if u273 then
        u273(TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out))
        u273 = nil
    end
    if u271 then
        u271 = false
        RunService:UnbindFromRenderStep("EnchantmentPackOpeningCamera")
    end
end
local function startLegendaryRevealCamera() -- Line: 491 -- upvalues: stopLegendaryRevealCamera (val), u272 (ref), u254 (val), u273 (ref), u257 (val), u270 (ref), u271 (ref), RunService (val), getLegendaryRevealCameraEffect (val), applyLegendaryRevealSaturation (val)
    stopLegendaryRevealCamera()
    u272 = u254("enchantment_pack_opening", 0, "set", 100)
    u273 = u257("enchantment_pack_opening", 0, "add", 100)
    u270 = os.clock()
    u271 = true
    local v1 = Enum.RenderPriority.Camera.Value + 1
    RunService:BindToRenderStep("EnchantmentPackOpeningCamera", v1, function() -- Line: 499 -- upvalues: u270 (upval), stopLegendaryRevealCamera (upval), getLegendaryRevealCameraEffect (upval), u254 (upval), u257 (upval), applyLegendaryRevealSaturation (upval)
        local v1, v2
        local v3 = u270
        if not v3 then
            stopLegendaryRevealCamera()
            return
        end
        local v4 = os.clock() - v3
        local v5 = math.clamp(v4 / 0.65, 0, 1)
        if 1 <= v5 then
            stopLegendaryRevealCamera()
            return
        end
        v1, v2 = getLegendaryRevealCameraEffect(v5, v4)
        u254("enchantment_pack_opening", v1, "set", 100)
        u257("enchantment_pack_opening", v2, "add", 100)
        applyLegendaryRevealSaturation(v5)
    end)
end
local function easeOutBack(p1) -- Line: 526
    local v1 = math.pow(p1 - 1, 3) * 3.467291 + 1
    return v1 + math.pow(p1 - 1, 2) * 2.467291
end
local function softWave(p1, p2, p3) -- Line: 538
    local v1 = math.sin(p1 * math.pi * p3 + p2)
    return v1 * 0.7 + math.sin(p1 * math.pi * p3 * 0.55 + p2 * 0.7 + 1.1) * 0.4
end
local function motionEnvelope(p1) -- Line: 548
    local v1 = math.sin(p1 * math.pi)
    local v2 = math.max(0, 1 - p1)
    return v1 * math.pow(v2, 0.35)
end
local function fallbackCardHalfHeight() -- Line: 557
    local CurrentCamera = workspace.CurrentCamera
    if not CurrentCamera then
        return 0.01
    end
    local v1 = math.max(CurrentCamera.ViewportSize.Y, 1)
    return math.tan(math.rad(CurrentCamera.FieldOfView) / 2) * 2 * 12 * (276 / v1) / 2
end
local function getCardHalfHeight(p1, p2) -- Line: 574 -- upvalues: fallbackCardHalfHeight (val), u269 (val)
    local v1 = fallbackCardHalfHeight()
    if not p2 then
        local SafeViewportSize = p1:GetSafeViewportSize()
        local StudsScreenSize = p1:GetStudsScreenSize(SafeViewportSize)
        if StudsScreenSize.Y ~= StudsScreenSize.Y or StudsScreenSize.Y <= 0 then
            return v1
        end
        local v2 = StudsScreenSize.Y * (276 / SafeViewportSize.Y) / 2
        if v2 ~= v2 or v2 <= 0 or v1 * 4 < v2 or v2 < v1 * 0.25 then
            return v1
        end
        if p2 then
            u269[p2] = v2
        end
        return v2
    else
        local v3 = u269[p2]
        if v3 then
            return v3
        end
    end
end
local function getNormalSelectedConfirmOffset(p1, p2, p3) -- Line: 614 -- upvalues: getCardHalfHeight (val), smoothStep (val), easeOutExpo (val)
    local v1 = getCardHalfHeight(p1, p2)
    local v2 = math.clamp(p3, 0, 1)
    local v3 = math.clamp(v2 / 0.45, 0, 1)
    local v4 = math.clamp((v2 - 0.35100000000000003) / 0.649, 0, 1)
    local v5 = smoothStep(v3)
    local v6 = smoothStep(v4)
    local v7 = easeOutExpo(v5, 2.3) * 1.35
    local v8 = math.sin(v5 * math.pi)
    local v9 = v8 * (1 - v6)
    v8 = v2 * math.pi * 4.6
    local v10 = math.sin(v8) * 0.042 * v9
    local v11 = math.sin(v8 * 1.28 + 0.65) * 0.042 * 0.88 * v9
    local v12 = CFrame.new(0, v1 * 0.18 * v5 + v1 * 1.55 * v6, -(v7 * (1 - v6 * 0.22)))
    return v12 * CFrame.Angles(math.sin(v8 * 0.82 + 1.15) * 0.042 * 0.68 * v9, v10, v11)
end
local function getNormalChosenFade(p1) -- Line: 641 -- upvalues: smoothStep (val)
    local v1 = math.clamp((p1 - 0.45) / 0.55, 0, 1)
    return smoothStep(v1)
end
local function getLegendarySelectedConfirmOffset(p1, p2, p3) -- Line: 652 -- upvalues: getCardHalfHeight (val), ramp (val), easeOutExpo (val)
    local v1 = getCardHalfHeight(p1, p2)
    local v2 = math.clamp(p3, 0, 1)
    local v3 = ramp(v2, 0, 0.2)
    local v4 = ramp(v2, 0.15000000000000002, 0.38)
    local v5 = math.sin(v3 * math.pi * 0.5)
    local v6 = v5 * (1 - v4)
    v5 = ramp(v2, 0.14, 0.38)
    local v7 = easeOutExpo(v5, 2.6)
    local v8 = ramp(v2, 0.3, 1)
    local v9 = easeOutExpo(v8, 1.5)
    local v10 = v9 * math.pi * 1.4
    local v11 = math.sin(v10) * v1 * 0.24 * v9
    local v12 = CFrame.new(v11, v1 * 1.7 * v9, v6 * -1.15 + v7 * 3.8 * (1 - v9 * 0.95) + v1 * (v9 * 0.07 + v9 * 0.09 * v9))
    return v12 * CFrame.Angles(v7 * 0.22 * (1 - v9 * 0.85) + v9 * -0.065, v10 * 0.42 * v9, 0)
end
local function getLegendaryChosenFade(p1) -- Line: 689 -- upvalues: easeOutExpo (val), ramp (val)
    local v1 = math.clamp(p1, 0, 1)
    local v2 = ramp(v1, 0.45999999999999996, 1)
    return easeOutExpo(v2, 2)
end
local function getCardFaceFrames(p1) -- Line: 697
    local CardFace = p1:FindFirstChild("CardFace")
    if not CardFace then
        local v1 = {}
        for i, j in p1:GetChildren() do
            if j:IsA("Frame") then
                table.insert(v1, j)
            end
        end
        return v1
    elseif CardFace:IsA("Frame") then
        return {CardFace}
    end
end
local function getNormalUnselectedConfirmOffset(p1, p2, p3) -- Line: 718 -- upvalues: getCardHalfHeight (val), easeOutExpo (val)
    local v1 = getCardHalfHeight(p1, p2)
    local v2 = easeOutExpo(p3, 2)
    return CFrame.new(0, -v1 * 0.48 * v2, -v1 * 0.55 * v2)
end
local function isLegendaryConfirmation(p1) -- Line: 728 -- upvalues: isLegendary (val)
    local v1 = if p1 ~= nil then isLegendary(p1) else false
    return v1
end
local function applyCardTransparency(p1, p2) -- Line: 737 -- upvalues: getCardFaceFrames (val)
    local CardFace
    local v1 = {p1.front, p1.back}
    local v2 = nil
    local v3 = nil
    local v4 = p2
    for i, j in v1, v2, v3 do
        if j and j.component2D then
            CardFace = j.component2D:FindFirstChild("CardFace")
            if not CardFace then
                for k, n in getCardFaceFrames(j.component2D) do
                    n.BackgroundTransparency = v4
                end
            else
                for m, i5 in CardFace:GetDescendants() do
                    if i5:IsA("ImageLabel") then
                        i5.ImageTransparency = v4
                    elseif i5:IsA("TextLabel") then
                        i5.TextTransparency = math.clamp(v4 + 0.2, 0, 1)
                    elseif i5:IsA("Frame") and i5.BackgroundTransparency < 1 then
                        i5.BackgroundTransparency = math.clamp(v4, 0, 1)
                    end
                end
            end
        end
    end
end
local function getCardBackFrame(p1, p2) -- Line: 771 -- upvalues: Rarities (val), u262 (val)
    if not p2 then
        return "rbxassetid://99848186568259"
    end
    return u262[Rarities.RarityNames[p1]] or "rbxassetid://99848186568259"
end
local function createCardFaceDown(p1, p2, p3) -- Line: 786 -- upvalues: react (val), FillProps (val), getCardBackFrame (val)
    local v1 = FillProps(p3, {
        Name = "CardFace",
        Active = true,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ClipsDescendants = true,
        ZIndex = 2,
        Size = UDim2.fromScale(1, 1),
    })
    return react.createElement("Frame", v1, {Frame = react.createElement("ImageLabel", {
        ImageTransparency = 0,
        BackgroundTransparency = 1,
        Image = getCardBackFrame(p1.Rarity, p2),
        ImageColor3 = Color3.fromRGB(216, 216, 216),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
    })})
end
local function createCardFaceRevealed(p1, p2) -- Line: 821 -- upvalues: react (val), FillProps (val), Enchantment (val)
    local v1 = FillProps(p2, {
        Name = "CardFace",
        Active = true,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ClipsDescendants = true,
        ZIndex = 2,
        Size = UDim2.fromScale(1, 1),
    })
    return react.createElement("Frame", v1, {Face = react.createElement(Enchantment.CardFace, {
        Enabled = true,
        Rarity = p1.Rarity,
        Label = p1.Name,
        Icon = p1.Icon,
        Art = p1.Art,
    })})
end
local function getRevealProgress(p1, p2) -- Line: 852 -- upvalues: getCardLayoutSlot (val)
    local v1 = p2 - (getCardLayoutSlot(p1) - 1) * 0.4
    if v1 <= 0 then
        return 0
    end
    if 0.7 <= v1 then
        return 1
    end
    return v1 / 0.7
end
local function pullUpOffset(p1, p2, p3) -- Line: 870 -- upvalues: getCardHalfHeight (val), easeOutBack (val), motionEnvelope (val), getCardOutward (val), softWave (val)
    local v1 = getCardHalfHeight(p1, p3)
    local v2 = math.clamp(p2, 0, 1)
    local v3 = easeOutBack(v2)
    local v4 = math.clamp(v3, 0, 1)
    local v5 = math.pi / 2
    local v6 = CFrame.new(0, -v1, 0)
    local v7 = v6 * CFrame.Angles(v5 * (1 - v4), 0, 0)
    v5 = v7 * CFrame.new(0, v1, 0)
    v6 = motionEnvelope(v2)
    local v8 = p3 * 1.35
    local v9 = getCardOutward(p3)
    local v10 = softWave(v2, v8 * 0.6, 0.9) * v1 * 0.38 * v6
    local v11 = math.abs(softWave(v2, v8, 0.65) * v6) * v1 * 0.34 * v9
    local v12 = CFrame.new(v11, 0, 0)
    local v13 = v12 * CFrame.Angles(0, math.abs((softWave(v2, v8 * 0.85, 0.5))) * 0.11 * v6 * v9, 0) * v5
    return v13 * CFrame.new(0, v10, v4 * 0.9)
end
local function hoverOffset(p1, p2, p3, p4, p5) -- Line: 902 -- upvalues: getCardHalfHeight (val)
    if p3 <= 0.001 then
        return CFrame.new()
    end
    local v1 = getCardHalfHeight(p1, p2)
    local v2 = math.sin(p4 * 8 + p2 * 1.4) * v1 * 0.004 * p3
    local v3 = math.sin(p4 * 9 + p2 * 0.9) * v1 * 0.003 * p3
    local v4 = math.sin(p4 * 8.5 + p2 * 1.1) * 0.006 * p3
    local v5 = -p5.X * p3
    local v6 = CFrame.new(v2, v1 * 0.32 * p3 + v3, p3 * 0.18)
    return v6 * CFrame.Angles(p5.Y * p3, v5, v4)
end
local function getCardScreenCenter(p1) -- Line: 930 -- upvalues: getCardCenterOffset (val)
    local ViewportSize = workspace.CurrentCamera.ViewportSize
    local v1 = getCardCenterOffset(p1)
    return Vector2.new(ViewportSize.X * 0.5 + v1, ViewportSize.Y * 0.62 - 138)
end
local function getLegendaryClickOffset(p1, p2, p3) -- Line: 942 -- upvalues: getCardHalfHeight (val), smoothStep (val)
    local v1 = math.clamp(p3, 0, 1)
    if v1 <= 0 then
        return CFrame.new()
    end
    local v2 = getCardHalfHeight(p1, p2)
    local v3 = smoothStep(v1)
    local v4 = v3 * math.pi
    local v5 = -v2 * 4.2 * math.sin(v4)
    local v6 = v2 * 2.35 * math.sin(v4)
    local v7 = v6 * math.sin(v4)
    v6 = v2 * 1.55 * math.sin(2 * v4) * 0.5
    local v8 = math.clamp((v1 - 0.62) / 0.38, 0, 1)
    local v9 = math.sin(v8 * math.pi)
    local v10 = math.pi * v3
    local v11 = math.sin(v4) * -0.3
    local v12 = CFrame.new(v6, v7 + -v2 * 0.12 * v9, v5 + v2 * 2 * v9)
    return v12 * CFrame.Angles(v11 + v9 * 0.1, v10, 0)
end
local function getSiblingLandingWobble(p1, p2, p3) -- Line: 976 -- upvalues: getLegendaryCardIndex (val), getCardHalfHeight (val), smoothStep (val)
    local v1
    if p2 >= getLegendaryCardIndex() then
        v1 = 0.045
    else
        v1 = 0.02
    end
    local v2 = p3 - v1
    if v2 < 0 then
        return CFrame.new()
    end
    local v3 = math.clamp(v2 / 1.15, 0, 1)
    if 1 <= v3 then
        return CFrame.new()
    end
    local v4 = getCardHalfHeight(p1, p2)
    local v5 = p2 - getLegendaryCardIndex()
    local v6 = smoothStep(v3)
    local v7 = math.sin(v6 * math.pi) ^ 2
    local v8 = math.sin(v6 * math.pi * 1.05 + p2 * 0.35)
    local v9 = v7 * (v8 * (1 - v6) ^ 2.2 * 0.1 + 1)
    local v10 = CFrame.new(v5 * v4 * 0.36 * v9, v4 * 0.05 * v7 * (1 - v6 * 0.4), -v4 * 0.14 * v9)
    return v10 * CFrame.Angles(v9 * 0.025, v5 * 0.09 * v9, v5 * -0.07 * v9)
end
local function getLegendaryWobbleElapsed(p1) -- Line: 1015
    if not p1 then
        return -1
    end
    local v1 = os.clock() - p1
    if 1.15 < v1 then
        return -1
    end
    return v1
end
local function getClickOffset(p1, p2, p3) -- Line: 1034 -- upvalues: isLegendary (val), getLegendaryClickOffset (val), getClickAnimationOffset (val)
    if isLegendary(p1) then
        return getLegendaryClickOffset(p2, p1, p3)
    end
    return getClickAnimationOffset(p3)
end
local function getShatterKnockawayDirection(p1, p2, p3, p4) -- Line: 1048 -- upvalues: getCardOutward (val), getCardLayoutSlot (val)
    local v1
    local v2 = p3 - p4
    local v3 = math.abs(v2.X)
    if v3 < 8 then
        v1 = getCardOutward(p1)
        v3 = v1 - getCardOutward(p2)
        v1 = math.abs(v3)
        if v1 < 0.01 then
            v1 = getCardLayoutSlot(p1)
            if getCardLayoutSlot(p2) > v1 then
                v3 = -1
            else
                v3 = 1
            end
        end
        return Vector2.new(v3, -0.3).Unit * math.max(v2.Magnitude, 12)
    end
    if v2.Magnitude >= 8 then
        return v2
    end
    v1 = getCardOutward(p1)
    v3 = v1 - getCardOutward(p2)
    v1 = math.abs(v3)
    if v1 < 0.01 then
        v1 = getCardLayoutSlot(p1)
        if getCardLayoutSlot(p2) > v1 then
            v3 = -1
        else
            v3 = 1
        end
    end
    return Vector2.new(v3, -0.3).Unit * math.max(v2.Magnitude, 12)
end
local function getShatterScreenFlight(p1, p2, p3) -- Line: 1076 -- upvalues: getCardScreenCenter (val), getShatterKnockawayDirection (val)
    local ViewportSize, huge, huge_2
    local CurrentCamera = workspace.CurrentCamera
    if not CurrentCamera then
        ViewportSize = Vector2.new(1920, 1080)
    else
        ViewportSize = CurrentCamera.ViewportSize
    end
    local v1 = getCardScreenCenter(p2)
    local v2 = Vector2.new(ViewportSize.X * 0.5, ViewportSize.Y * 0.5)
    local Unit = getShatterKnockawayDirection(p2, p3, v1, v2).Unit
    if 0.001 < Unit.X then
        huge = (ViewportSize.X + 197.34 + 140 - v1.X) / Unit.X
    elseif Unit.X >= -0.001 then
        huge = math.huge
    else
        huge = (-140 - v1.X) / Unit.X
    end
    if 0.001 < Unit.Y then
        huge_2 = (ViewportSize.Y + 276 + 140 - v1.Y) / Unit.Y
    elseif Unit.Y >= -0.001 then
        huge_2 = math.huge
    else
        huge_2 = (-140 - v1.Y) / Unit.Y
    end
    local v3 = math.min(huge, huge_2)
    local v4 = math.max(v3 + math.max(197.34, 276) * 0.75, ViewportSize.X * 0.42)
    local SafeViewportSize = p1:GetSafeViewportSize()
    local StudsScreenSize = p1:GetStudsScreenSize(SafeViewportSize)
    return Unit.X * v4 * (StudsScreenSize.X / SafeViewportSize.X), -Unit.Y * v4 * (StudsScreenSize.Y / SafeViewportSize.Y)
end
local function getShatterOffset(p1, p2, p3, p4, p5) -- Line: 1122 -- upvalues: getCardHalfHeight (val), getCardLayoutSlot (val), easeOutExpo (val), getShatterScreenFlight (val)
    local v1
    if p4 <= 0.001 or p2 == p3 then
        return CFrame.new()
    end
    local v2 = getCardHalfHeight(p1, p2)
    local v3 = getCardLayoutSlot(p2)
    local v4 = v3 - getCardLayoutSlot(p3)
    if v4 >= 0 then
        v3 = 1
    else
        v3 = -1
    end
    local v5 = p2 * 2.17 + p3 * 0.83
    local v6 = 1 - math.pow(1 - p4, 1.35)
    local v7 = easeOutExpo(p4, 1.9)
    local v8 = math.sin(p4 * math.pi)
    local v9 = v8 * (1 - p4 * 0.1)
    v8, v1 = getShatterScreenFlight(p1, p2, p3)
    local v10 = v8 * v6
    local v11 = v1 * v6 + v2 * 0.2 * v9
    if p5 then
        v10 = -v10
        v11 = -v11
    end
    local v12 = v3 * math.pi * (math.sin(v5) * 0.5 + 2.1) * v7
    local v13 = v3 * math.pi * (math.cos(v5 * 1.3) * 0.55 + 3.2) * v7
    local v14 = -v3 * math.pi * (math.sin(v5 * 0.7) * 0.35 + 1.45) * v7
    local v15 = v3 * math.pi * 0.55
    local v16 = CFrame.new(0, -v2, 0)
    local v17 = v16 * CFrame.Angles(v15 * math.sin(p4 * math.pi * 0.85), v13 * 0.22, v14 * 0.18)
    v15 = v17 * CFrame.new(0, v2, 0)
    local v18 = CFrame.new(v10, v11, 0)
    return v18 * CFrame.Angles(v12, v13, v14) * v15
end
local function getCardScreenBoundsFromPart(p1) -- Line: 1174
    local surfacePart = p1.surfacePart
    if not surfacePart or not p1.enabled then
        return nil
    end
    local CurrentCamera = workspace.CurrentCamera
    if not CurrentCamera then
        return nil
    end
    local v1 = surfacePart.Size.X * 0.5
    local v2 = surfacePart.Size.Y * 0.5
    local huge = math.huge
    local huge_2 = math.huge
    local v3 = -math.huge
    local v4 = -math.huge
    local v5 = false
    local v6 = {}
    local v7 = Vector3.new(-v1, v2, 0)
    local v8 = Vector3.new(v1, v2, 0)
    local v9 = Vector3.new(-v1, -v2, 0)
    v6[1] = v7
    v6[2] = v8
    v6[3] = v9
    v6[4] = (Vector3.new(v1, -v2, 0))
    local v10 = nil
    local v11 = nil
    for i, j in v6, v10, v11 do
        v9 = CurrentCamera:WorldToViewportPoint(surfacePart.CFrame:PointToWorldSpace(j))
        if 0 < v9.Z then
            v5 = true
            huge = math.min(huge, v9.X)
            huge_2 = math.min(huge_2, v9.Y)
            v3 = math.max(v3, v9.X)
            v4 = math.max(v4, v9.Y)
        end
    end
    if not v5 then
        return nil
    end
    return {position = Vector2.new(huge, huge_2), size = Vector2.new(v3 - huge, v4 - huge_2)}
end
local function getCardScreenBounds(p1, p2) -- Line: 1226 -- upvalues: getCardScreenBoundsFromPart (val), getCardScreenCenter (val)
    local v1
    local front = p1.front
    if not front then
        v1 = getCardScreenCenter(p2)
        return {position = v1 - Vector2.new(98.67, 138), size = Vector2.new(197.34, 276)}
    end
    v1 = getCardScreenBoundsFromPart(front)
    if v1 then
        return v1
    end
    v1 = getCardScreenCenter(p2)
    return {position = v1 - Vector2.new(98.67, 138), size = Vector2.new(197.34, 276)}
end
local function getCardScreenCenterFromBounds(p1) -- Line: 1246
    return p1.position + p1.size * 0.5
end
local function isMouseInsideBounds(p1, p2, p3) -- Line: 1256
    local v1 = p2.position - Vector2.new(p3, p3)
    local v2 = p2.position + p2.size + Vector2.new(p3, p3)
    local v3 = if v1.X <= p1.X then if p1.X <= v2.X then if v1.Y <= p1.Y then p1.Y <= v2.Y else false else false else false
    return v3
end
local function findHoveredCardIndex(p1, p2, p3, p4, p5) -- Line: 1270 -- upvalues: u264 (val), getCardScreenBounds (val), isMouseInsideBounds (val), getCardScreenCenterFromBounds (val)
    local Magnitude, v1, v2, v3, v4, v5, v6, v7, v8
    local v9 = nil
    local huge = math.huge
    local current = u264.current
    local v10 = nil
    local v11 = nil
    v6, v7, v2, v8, v1 = p3, p4, p2, p5, p1
    for i, j in current, v10, v11 do
        if v6[j] and 0.15 >= v7[j] then
            v3 = v2[j]
            if v3 and v3.front then
                v4 = getCardScreenBounds(v3, j)
                if v8 ~= j then
                    v5 = 18
                else
                    v5 = 36
                end
                if isMouseInsideBounds(v1, v4, v5) then
                    Magnitude = (v1 - getCardScreenCenterFromBounds(v4)).Magnitude
                    if Magnitude < huge then
                        huge = Magnitude
                        v9 = j
                    end
                end
            end
        end
    end
    return v9
end
local function cardPosition(p1) -- Line: 1310 -- upvalues: getCardCenterOffset (val)
    local v1 = getCardCenterOffset(p1)
    return UDim2.new(0.5, v1, 0.62, 0)
end
local function composeCardOffset(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13) -- Line: 1332 -- upvalues: pullUpOffset (val), isLegendaryConfirmation (val), hoverOffset (val), smoothStep (val), getClickOffset (val), getLegendarySelectedConfirmOffset (val), getNormalSelectedConfirmOffset (val), getShatterOffset (val), getNormalUnselectedConfirmOffset (val), isLegendary (val), getSiblingLandingWobble (val)
    local v1, v2, v3, v4, v5, v6
    local v7 = math.clamp(p7, 0, 1)
    local v8 = pullUpOffset(p1, p3, p2)
    local v9 = p10 == p2
    local v10 = if 1 > v7 then v9 else true
    local v11 = isLegendaryConfirmation(p10)
    local v12 = v11
    if v12 then
        v12 = false
        if p10 ~= nil then
            v12 = not v9
            if v12 then
                v12 = 0.001 < p9
            end
        end
    end
    local v13 = not v11
    if v13 then
        v13 = false
        if p10 ~= nil then
            v13 = not v9
            if v13 then
                v13 = 0.001 < p9
            end
        end
    end
    if 1 > p3 then
        v1 = CFrame.new()
    elseif p8 < 0.001 and p9 < 0.05 and not v9 then
        v1 = hoverOffset(p1, p2, p4, p5, p6)
    end
    local v14 = CFrame.new()
    if v9 and p12 and 0 <= p8 then
        if not v11 then
            v2 = 0.45
        else
            v2 = 0.2
        end
        v3 = 1 - smoothStep((math.clamp(p8 / v2, 0, 1)))
        if 0.001 < v3 then
            v14 = hoverOffset(p1, p2, p12.amount * v3, p5, p12.tilt * v3)
        end
    end
    v2 = CFrame.new()
    if 1 <= p3 then
        if not v9 then
            v2 = getClickOffset(p2, p1, v7)
        elseif p13 then
            v3 = math.clamp(p13, 0, 1)
            v5 = v3 + (1 - v3) * smoothStep((math.clamp(p8 / 0.35, 0, 1)))
            v2 = getClickOffset(p2, p1, v5)
        end
    end
    if 1 > p3 then
        v3 = CFrame.new()
    elseif v9 then
        if not v11 then
            v3 = getNormalSelectedConfirmOffset(p1, p2, p8)
        else
            v3 = getLegendarySelectedConfirmOffset(p1, p2, p8)
        end
    end
    if 1 > p3 then
        v4 = CFrame.new()
    elseif v12 then
        v4 = getShatterOffset(p1, p2, p10, p9, v10)
    end
    if 1 > p3 then
        v5 = CFrame.new()
    elseif v13 then
        v5 = getNormalUnselectedConfirmOffset(p1, p2, p9)
    end
    if isLegendary(p2) then
        v6 = CFrame.new()
    elseif 0 > p11 then
        v6 = CFrame.new()
    else
        v6 = getSiblingLandingWobble(p1, p2, p11)
    end
    if v12 then
        return v8 * v6 * v1 * v14 * v2 * v4 * v3
    end
    if v13 then
        return v8 * v6 * v1 * v14 * v2 * v5
    end
    return v8 * v6 * v1 * v14 * v2 * v3
end
local function applyCardOffsets(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13) -- Line: 1430 -- upvalues: composeCardOffset (val)
    local front = p1.front
    if front then
        front.offset = composeCardOffset(front, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13)
    end
    local back = p1.back
    if back then
        local v1 = composeCardOffset(back, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13)
        back.offset = v1 * CFrame.Angles(0, math.pi, 0)
    end
end
return function(p1) -- Line: 1490 -- upvalues: u263 (val), syncActiveCardIndices (val), react (val), getLegendaryWobbleElapsed (val), applyCardOffsets (val), getRevealProgress (val), isLegendary (val), startLegendaryRevealCamera (val), playCardFlipSound (val), u269 (val), applyCardTransparency (val), stopLegendaryRevealCamera (val), RunService (val), UserInputService (val), u264 (val), playCardRevealSound (val), findHoveredCardIndex (val), getCardHalfHeight (val), getClickFlipDuration (val), getCardLayoutSlot (val), getCardScreenBounds (val), getCardScreenCenterFromBounds (val), getLegendaryChosenFade (val), getNormalChosenFade (val), easeOutExpo (val), cardPosition (val), Surface (val), createCardFaceDown (val), createCardFaceRevealed (val), Provider (val)
    local cardClick, u11, v1, v2, v3
    local Enabled = p1.Enabled
    local Pack = p1.Pack
    u263.current = Pack
    syncActiveCardIndices(Pack)
    v1, u11 = react.useState(function() -- Line: 1496
        return table.create(3, false)
    end)
    local u325 = react.useRef({})
    local u19 = react.useRef(nil)
    local v4 = {0, 0, 0}
    local u26 = react.useRef(v4)
    local v5 = {Vector2.zero, Vector2.zero, Vector2.zero}
    local u33 = react.useRef(v5)
    local v6 = {0, 0, 0}
    local u40 = react.useRef(v6)
    local v7 = {false, false, false}
    local u47 = react.useRef(v7)
    local v8 = {0, 0, 0}
    local u54 = react.useRef(v8)
    local v9 = {0, 0, 0}
    local u61 = react.useRef(v9)
    local v10 = {0, 0, 0}
    local u68 = react.useRef(v10)
    local v11 = {0, 0, 0}
    local u75 = react.useRef(v11)
    local v12 = {0, 0, 0}
    local u82 = react.useRef(v12)
    local u86 = react.useRef(nil)
    local u90 = react.useRef(nil)
    local v13 = {false, false, false}
    local u97 = react.useRef(v13)
    local u104 = react.useRef({false, false, false})
    local u108 = react.useRef(nil)
    local v14 = {false, false, false}
    local u115 = react.useRef(v14)
    local u119 = react.useRef(0)
    local u123 = react.useRef(nil)
    local u130 = react.useRef({false, false, false})
    local u134 = react.useRef({})
    local u138 = react.useRef({})
    local u142 = react.useRef(false)
    local u146 = react.useRef(p1.onClaim)
    u146.current = p1.onClaim
    local v15 = p1.PreviewInsight == true
    local v16 = p1.AllowFlipAll == true
    local u159 = react.useRef(v16)
    u159.current = v16
    local u166 = react.useMemo(function() -- Line: 1534 -- upvalues: p1 (val)
        return (("EnchantmentPackOpening_%*"):format(p1.BindId or "default"))
    end, {p1.BindId})
    local function finishClaim(p1) -- Line: 1538 -- upvalues: u142 (val), u146 (val)
        local current
        if u142.current then
            return
        end
        u142.current = true
        current = u146.current
        if current then
            current(p1)
        end
    end
    local function isPackInteractionLocked() -- Line: 1550 -- upvalues: u142 (val), u90 (val)
        local current = u142.current
        if not current then
            current = u90.current ~= nil
        end
        return current
    end
    local function canFlipCard(p1) -- Line: 1554 -- upvalues: isPackInteractionLocked (val), u47 (val), u40 (val), u75 (val), u159 (val), u123 (val)
        local current
        if isPackInteractionLocked() or u47.current[p1] then
            return false
        end
        local v1 = u40.current[p1]
        if 0.5 <= v1 then
            return false
        end
        v1 = u75.current[p1]
        if 0.15 < v1 then
            return false
        end
        if u159.current then
            return true
        end
        current = u123.current
        local v2 = if current ~= nil then current == p1 else true
        return v2
    end
    local function canConfirmCard(p1) -- Line: 1579 -- upvalues: isPackInteractionLocked (val), u40 (val), u75 (val), u159 (val), u123 (val)
        local current
        if isPackInteractionLocked() then
            return false
        end
        local v1 = u40.current[p1]
        if v1 < 0.5 then
            return false
        end
        v1 = u75.current[p1]
        if 0.15 < v1 then
            return false
        end
        if u159.current then
            return true
        end
        current = u123.current
        if current == nil then
            return true
        end
        if current ~= p1 then
            return false
        end
        return true
    end
    local function syncCardOffsetsForIndex(p1) -- Line: 1602 -- upvalues: u325 (val), u119 (val), getLegendaryWobbleElapsed (upval), u108 (val), applyCardOffsets (upval), getRevealProgress (upval), u26 (val), u33 (val), u40 (val), u61 (val), u75 (val), u90 (val), u134 (val), u138 (val)
        local v1 = u325.current[p1]
        if not v1 then
            return
        end
        local current = u119.current
        local v2 = getLegendaryWobbleElapsed(u108.current)
        local v3 = getRevealProgress(p1, current)
        applyCardOffsets(v1, p1, v3, u26.current[p1], current, u33.current[p1], u40.current[p1], u61.current[p1], u75.current[p1], u90.current, v2, u134.current[p1], u138.current[p1])
    end
    local function mountBackSide(p1) -- Line: 1628 -- upvalues: u104 (val), u11 (val)
        if u104.current[p1] then
            return
        end
        u104.current[p1] = true
        u11(function(a1) -- Line: 1634 -- upvalues: p1 (val)
            if a1[p1] then
                return a1
            end
            local v1 = table.clone(a1)
            v1[p1] = true
            return v1
        end)
    end
    local function beginSpinAnimation(p1) -- Line: 1645 -- upvalues: isPackInteractionLocked (val), u47 (val), u40 (val), canFlipCard (val), u159 (val), u123 (val), mountBackSide (val), u54 (val), syncCardOffsetsForIndex (val), isLegendary (upval), u108 (val), startLegendaryRevealCamera (upval), playCardFlipSound (upval)
        if isPackInteractionLocked() or u47.current[p1] then
            return
        end
        local v1 = u40.current[p1]
        if 1 <= v1 or not (canFlipCard(p1)) then
            return
        end
        if not u159.current then
            u123.current = p1
        end
        mountBackSide(p1)
        u47.current[p1] = true
        u54.current[p1] = os.clock()
        syncCardOffsetsForIndex(p1)
        if isLegendary(p1) then
            u108.current = os.clock()
            startLegendaryRevealCamera()
        end
        playCardFlipSound(p1)
    end
    local function beginConfirmation(p1) -- Line: 1677 -- upvalues: u142 (val), u90 (val), u138 (val), u40 (val), u86 (val), u68 (val), u134 (val), u26 (val), u33 (val), u82 (val), finishClaim (val)
        if u142.current or u90.current ~= nil then
            return
        end
        u90.current = p1
        u138.current[p1] = u40.current[p1]
        u86.current = os.clock()
        u68.current[p1] = 1
        u134.current[p1] = {amount = u26.current[p1], tilt = u33.current[p1]}
        if p1 ~= 1 then
            u68.current[1] = 0
            u82.current[1] = 1
        end
        if p1 ~= 2 then
            u68.current[2] = 0
            u82.current[2] = 1
        end
        if p1 ~= 3 then
            u68.current[3] = 0
            u82.current[3] = 1
        end
        finishClaim(p1)
    end
    local function beginClickAnimation(p1) -- Line: 1703 -- upvalues: u97 (val), isPackInteractionLocked (val), u75 (val), u40 (val), canFlipCard (val), beginSpinAnimation (val), canConfirmCard (val), beginConfirmation (val)
        if not (u97.current[p1]) or isPackInteractionLocked() then
            return
        end
        local v1 = u75.current[p1]
        if 0.15 < v1 then
            return
        end
        v1 = u40.current[p1]
        if v1 < 0.5 then
            if not (canFlipCard(p1)) then
                return
            end
            beginSpinAnimation(p1)
            return
        end
        if not (canConfirmCard(p1)) then
            return
        end
        beginConfirmation(p1)
    end
    local v17 = {Enabled, u166}
    react.useEffect(function() -- Line: 1729 -- upvalues: Enabled (val), u269 (upval), syncActiveCardIndices (upval), u142 (val), u11 (val), u19 (val), u325 (val), applyCardOffsets (upval), applyCardTransparency (upval), u26 (val), u33 (val), u40 (val), u47 (val), u54 (val), u61 (val), u68 (val), u75 (val), u82 (val), u97 (val), u104 (val), u115 (val), u130 (val), u123 (val), u134 (val), u138 (val), u90 (val), u86 (val), u108 (val), stopLegendaryRevealCamera (upval), RunService (upval), u166 (val), u119 (val), UserInputService (upval), u264 (upval), playCardRevealSound (upval), isPackInteractionLocked (val), findHoveredCardIndex (upval), getLegendaryWobbleElapsed (upval), getRevealProgress (upval), getCardHalfHeight (upval), getClickFlipDuration (upval), u159 (val), isLegendary (upval), beginConfirmation (val), getCardLayoutSlot (upval), getCardScreenBounds (upval), getCardScreenCenterFromBounds (upval), getLegendaryChosenFade (upval), getNormalChosenFade (upval), easeOutExpo (upval)
        local v1, v2, v3
        if Enabled then
            local u106 = os.clock()
            local v4 = Enum.RenderPriority.Last.Value + 1
            RunService:BindToRenderStep(u166, v4, function(p1) -- Line: 1767 -- upvalues: u106 (val), u119 (upval), UserInputService (upval), u264 (upval), u97 (upval), u115 (upval), playCardRevealSound (upval), u19 (upval), isPackInteractionLocked (upval), findHoveredCardIndex (upval), u325 (upval), u75 (upval), getLegendaryWobbleElapsed (upval), u108 (upval), getRevealProgress (upval), u269 (upval), getCardHalfHeight (upval), getClickFlipDuration (upval), u54 (upval), u47 (upval), u40 (upval), u159 (upval), u130 (upval), u90 (upval), u123 (upval), isLegendary (upval), beginConfirmation (upval), u68 (upval), u61 (upval), u86 (upval), getCardLayoutSlot (upval), u82 (upval), u26 (upval), getCardScreenBounds (upval), getCardScreenCenterFromBounds (upval), u33 (upval), applyCardOffsets (upval), u134 (upval), u138 (upval), applyCardTransparency (upval), getLegendaryChosenFade (upval), getNormalChosenFade (upval), easeOutExpo (upval)
                local current_2, current_3, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, zero
                local v18 = os.clock() - u106
                u119.current = v18
                local MouseLocation = UserInputService:GetMouseLocation()
                local current = u264.current
                local v19 = nil
                local v20 = nil
                for i, j in current, v19, v20 do
                    v17 = v18 - (i - 1) * 0.4
                    v3 = 0.7 <= v17
                    u97.current[j] = v3
                    if 0 < v17 and not (u115.current[j]) then
                        u115.current[j] = true
                        playCardRevealSound(j)
                    end
                end
                if not (isPackInteractionLocked()) then
                    v19 = findHoveredCardIndex(MouseLocation, u325.current, u97.current, u75.current, u19.current)
                else
                    v19 = nil
                end
                u19.current = v19
                local v21 = getLegendaryWobbleElapsed(u108.current)
                if v21 < 0 then
                    u108.current = nil
                end
                v19 = 3
                v20 = 1
                for k = 1, v19, v20 do
                    v15 = u325.current[k]
                    if v15 and v15.front then
                        v16 = getRevealProgress(k, v18)
                        if 1 <= v16 and not (u269[k]) then
                            getCardHalfHeight(v15.front, k)
                        end
                        v17 = getClickFlipDuration(k)
                        v2 = os.clock() - u54.current[k]
                        if u47.current[k] then
                            u40.current[k] = math.clamp(v2 / v17, 0, 1)
                            v3 = u40.current[k]
                            if 1 <= v3 then
                                u47.current[k] = false
                            end
                        end
                        if not (isPackInteractionLocked()) and not u159.current and not (u130.current[k]) and u90.current == nil and u123.current == k then
                            v3 = u40.current[k]
                            if 0.5 <= v3 then
                                if not (isLegendary(k)) then
                                    v3 = 0
                                else
                                    v3 = 0.08
                                end
                                if v17 * 0.5 + v3 <= v2 then
                                    u130.current[k] = true
                                    beginConfirmation(k)
                                end
                            end
                        end
                        v4 = u61.current[k]
                        v5 = u75.current[k]
                        if not u86.current then
                            v4 = v4 + (u68.current[k] - v4) * math.min(1, v1 * 8)
                            v5 = v5 + (u82.current[k] - v5) * math.min(1, v1 * 8)
                        elseif u90.current then
                            v6 = os.clock() - u86.current
                            current_2 = u90.current
                            if not (isLegendary(current_2)) then
                                if k ~= current_2 then
                                    v5 = math.clamp(v6 / 0.8, 0, 1)
                                else
                                    v4 = math.clamp(v6 / 1.9, 0, 1)
                                end
                            elseif k ~= current_2 then
                                v11 = getCardLayoutSlot(k)
                                v10 = (v6 - 0.45 - math.abs(v11 - getCardLayoutSlot(current_2)) * 0.05) / 1.62
                                v5 = math.clamp(v10, 0, 1)
                            else
                                v4 = math.clamp(v6 / 2.85, 0, 1)
                            end
                        end
                        u61.current[k] = v4
                        u75.current[k] = v5
                        v6 = u19.current == k
                        v7 = u90.current == k
                        if not v6 then
                            v8 = 0
                        elseif not v7 and v4 < 0.001 and v5 < 0.05 then
                            v8 = 1
                        end
                        v9 = u26.current[k]
                        v9 = v9 + (v8 - v9) * math.min(1, v1 * 9)
                        u26.current[k] = v9
                        zero = Vector2.zero
                        if v6 then
                            v11 = getCardScreenBounds(v15, k)
                            v12 = MouseLocation - getCardScreenCenterFromBounds(v11)
                            v14 = math.clamp(v12.X / (v11.size.X * 0.55), -1, 1) * 0.24
                            zero = Vector2.new(v14, math.clamp(v12.Y / (v11.size.Y * 0.55), -1, 1) * 0.24)
                        end
                        v11 = u33.current[k]:Lerp(zero, (math.min(1, v1 * 11)))
                        u33.current[k] = v11
                        applyCardOffsets(v15, k, v16, v9, v18, v11, u40.current[k], u61.current[k], u75.current[k], u90.current, v21, u134.current[k], u138.current[k])
                        current_3 = u90.current
                        if not current_3 then
                            if not current_3 then
                                applyCardTransparency(v15, 0)
                            elseif not (isLegendary(current_3)) then
                                if k ~= current_3 then
                                    v13 = easeOutExpo(u75.current[k], 2) * 1
                                    applyCardTransparency(v15, v13)
                                else
                                    applyCardTransparency(v15, getNormalChosenFade(u61.current[k]))
                                end
                            end
                        elseif isLegendary(current_3) and k == current_3 then
                            applyCardTransparency(v15, getLegendaryChosenFade(u61.current[k]))
                        end
                    end
                end
            end)
            return function() -- Line: 1931 -- upvalues: RunService (upval), u166 (upval), stopLegendaryRevealCamera (upval)
                RunService:UnbindFromRenderStep(u166)
                stopLegendaryRevealCamera()
            end
        end
        table.clear(u269)
        syncActiveCardIndices(nil)
        u142.current = false
        u11(table.create(3, false))
        u19.current = nil
        v1 = 3
        v2 = 1
        for i = 1, v1, v2 do
            v3 = u325.current[i]
            if v3 then
                applyCardOffsets(v3, i, 0, 0, 0, Vector2.zero, 0, 0, 0, nil, -1, nil, nil)
                applyCardTransparency(v3, 0)
            end
            u26.current[i] = 0
            u33.current[i] = Vector2.zero
            u40.current[i] = 0
            u47.current[i] = false
            u54.current[i] = 0
            u61.current[i] = 0
            u68.current[i] = 0
            u75.current[i] = 0
            u82.current[i] = 0
            u97.current[i] = false
            u104.current[i] = false
            u115.current[i] = false
            u130.current[i] = false
        end
        u123.current = nil
        u134.current = {}
        u138.current = {}
        u90.current = nil
        u86.current = nil
        u108.current = nil
        stopLegendaryRevealCamera()
    end, v17)
    if not Enabled or not Pack then
        return nil
    end
    local v18 = {}
    local v19 = 3
    v17 = 1
    local u319 = p1
    for i = 1, v19, v17 do
        v2 = Pack[i]
        if v2 then
            v3 = {AnchorPoint = Vector2.new(0.5, 1), Position = cardPosition(i), Size = UDim2.fromOffset(197.34, 276)}
            local function bindSide(p1, p2) -- Line: 1954 -- upvalues: u325 (val), i (val), syncCardOffsetsForIndex (val)
                local v1 = u325.current[i]
                if not v1 then
                    u325.current[i] = {}
                end
                v1[p1] = p2
                if p2 then
                    if p1 == "back" then
                        local front = v1.front
                        if front then
                            p2.offset = front.offset * CFrame.Angles(0, math.pi, 0)
                        end
                    end
                    syncCardOffsetsForIndex(i)
                end
            end
            function cardClick() -- Line: 1973 -- upvalues: react (upval), beginClickAnimation (val), i (val)
                local v1 = {}
                v1[react.Event.InputBegan] = function(p1, p2) -- Line: 1975 -- upvalues: beginClickAnimation (upval), i (upval)
                    if p2.UserInputType == Enum.UserInputType.MouseButton1 then
                        beginClickAnimation(i)
                    end
                end
                return v1
            end
            table.insert(v18, react.createElement(Surface, {
                Compat = false,
                key = ("card-%*-front"):format(i),
                Enabled = u319.Enabled,
                OnComponent = function(p1) -- Line: 1989 -- upvalues: bindSide (val)
                    bindSide("front", p1)
                end,
                Native = v3,
            }, {CardFace = createCardFaceDown(v2, v15, cardClick())}))
            if Enabled and v1[i] then
                table.insert(v18, react.createElement(Surface, {
                    Compat = false,
                    key = ("card-%*-back"):format(i),
                    Enabled = u319.Enabled,
                    OnComponent = function(p1) -- Line: 2005 -- upvalues: bindSide (val)
                        bindSide("back", p1)
                    end,
                    Native = v3,
                }, {CardFace = createCardFaceRevealed(v2, cardClick())}))
            end
        end
    end
    return react.createElement(Provider.Provider, {Distance = 12, DisplayOrder = u319.DisplayOrder or 200}, v18)
end