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
--        File: ReplicatedStorage.Client.Interfaces.Routes.Pages.Enchantment.Card
--                               Dumped in 0.00356 seconds
--                          Bytecode version 9  |  42 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Enchantments = require(Namespaces:WaitForChild("Enchantments"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_2:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_3:WaitForChild("Client")
local Progression = Client:WaitForChild("Progression")
local Enchantments_2 = Progression:WaitForChild("Enchantments")
local ClientEnchantmentsHandler = require(Enchantments_2:WaitForChild("ClientEnchantmentsHandler"))
local Components = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Menu = Components:WaitForChild("Menu")
local Progression_2 = Menu:WaitForChild("Progression")
local Enchantment = require(Progression_2:WaitForChild("Enchantment"))
local Components_2 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Utilities = Components_2:WaitForChild("Utilities")
local FillProps = require(Utilities:WaitForChild("FillProps"))
local Components_3 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Utilities_2 = Components_3:WaitForChild("Utilities")
local Space3D = Utilities_2:WaitForChild("Space3D")
local Provider = require(Space3D:WaitForChild("Provider"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_4:WaitForChild("Common")
local Progression_3 = Common_2:WaitForChild("Progression")
local Enchantments_3 = Progression_3:WaitForChild("Enchantments")
local Rarities = require(Enchantments_3:WaitForChild("Rarities"))
local Components_4 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Utilities_3 = Components_4:WaitForChild("Utilities")
local Space3D_2 = Utilities_3:WaitForChild("Space3D")
local Surface = require(Space3D_2:WaitForChild("Surface"))
local Components_5 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Utilities_4 = Components_5:WaitForChild("Utilities")
local Space3D_3 = Utilities_4:WaitForChild("Space3D")
require(Space3D_3:WaitForChild("Types"))
local function getMotionBind(p1) -- Line: 126
    if p1 then
        return (("EnchantmentCardMotion_%*"):format(p1))
    end
    return "EnchantmentCardMotion"
end
local function easeOutExpo(p1, p2) -- Line: 139
    return 1 - math.pow(1 - p1, p2)
end
local function getRevealEase(p1) -- Line: 147 -- upvalues: easeOutExpo (val)
    local v1 = math.clamp(p1, 0, 1)
    return easeOutExpo(v1, 2.8)
end
local function smoothStep(p1) -- Line: 155
    return p1 * p1 * (3 - p1 * 2)
end
local function easeOutBack(p1, p2) -- Line: 164
    local v1 = p2 * 1.70158
    local v2 = (v1 + 1) * math.pow(p1 - 1, 3) + 1
    return v2 + v1 * math.pow(p1 - 1, 2)
end
local function softWave(p1, p2, p3) -- Line: 176
    local v1 = math.sin(p1 * math.pi * p3 + p2)
    return v1 * 0.7 + math.sin(p1 * math.pi * p3 * 0.55 + p2 * 0.7 + 1.1) * 0.4
end
local function motionEnvelope(p1) -- Line: 186
    local v1 = math.sin(p1 * math.pi)
    local v2 = math.max(0, 1 - p1)
    return v1 * math.pow(v2, 0.35)
end
local function fallbackCardHalfHeight() -- Line: 195
    local CurrentCamera = workspace.CurrentCamera
    if not CurrentCamera then
        return 0.01
    end
    local v1 = math.max(CurrentCamera.ViewportSize.Y, 1)
    return math.tan(math.rad(CurrentCamera.FieldOfView) / 2) * 2 * 12 * (276 / v1) / 2
end
local function measureCardHalfHeight(p1) -- Line: 211 -- upvalues: fallbackCardHalfHeight (val)
    local v1 = fallbackCardHalfHeight()
    local SafeViewportSize = p1:GetSafeViewportSize()
    local StudsScreenSize = p1:GetStudsScreenSize(SafeViewportSize)
    if StudsScreenSize.Y ~= StudsScreenSize.Y or StudsScreenSize.Y <= 0 then
        return nil
    end
    local v2 = StudsScreenSize.Y * (276 / SafeViewportSize.Y) / 2
    if v2 ~= v2 or v2 <= 0 or v1 * 4 < v2 or v2 < v1 * 0.25 then
        return nil
    end
    return v2
end
local function getIdleBobInBlend(p1, p2) -- Line: 238 -- upvalues: smoothStep (val)
    if p1 == "reveal" or p1 == "flip" then
        return 0
    end
    if p1 == "dismiss" then
        return 1
    end
    return smoothStep((math.clamp(p2 / 0.3, 0, 1)))
end
local function getIdleBobOutBlend(p1) -- Line: 254 -- upvalues: smoothStep (val)
    if p1 <= 0 then
        return 1
    end
    if 0.2 <= p1 then
        return 0
    end
    return 1 - smoothStep(p1 / 0.2)
end
local function pullUpOffset(p1, p2, p3, p4, p5) -- Line: 274 -- upvalues: getRevealEase (val), motionEnvelope (val), softWave (val), getIdleBobOutBlend (val)
    local v1
    local v2 = math.clamp(p2, 0, 1)
    local v3 = getRevealEase(v2)
    local v4 = getRevealEase(v2)
    local v5 = math.pi / 2
    local v6 = CFrame.new(0, -p1, 0)
    local v7 = v6 * CFrame.Angles(-(v5 * (1 - v3)), 0, 0)
    local v8 = motionEnvelope(v2)
    if 1 > v2 then
        local v9 = softWave(v2, 0, 0.9) * p1 * 0.38 * v8
        v1 = v9 * (1 - p5)
    else
        v1 = 0
    end
    return v7 * CFrame.new(0, p1, 0) * CFrame.new(0, v1 + math.sin(p3 * 1.35) * p1 * 0.055 * (p5 * getIdleBobOutBlend(p4)), (1 - v4) * -3.4 + v3 * 0.9)
end
local function getFlipRotation(p1) -- Line: 309 -- upvalues: easeOutExpo (val)
    local v1 = math.clamp(p1, 0, 1)
    local v2 = 1 - easeOutExpo(v1, 2.2)
    return v2 * math.pi
end
local function getDismissEase(p1) -- Line: 317 -- upvalues: easeOutExpo (val)
    local v1 = math.clamp(p1, 0, 1)
    return easeOutExpo(v1, 2)
end
local function getCardOffsets(p1, p2, p3, p4, p5, p6) -- Line: 331 -- upvalues: pullUpOffset (val), getFlipRotation (val), getDismissEase (val)
    local v1 = pullUpOffset(p1, p2, p4, p5, p6)
    local v2 = getFlipRotation(p3)
    local v3 = getDismissEase(p5)
    local v4 = v3 * math.pi
    v3 = v1 * CFrame.Angles(0, v2 + v4, 0)
    return v3, v1 * CFrame.Angles(0, v2 + math.pi + v4, 0)
end
local function getRestAnchorY() -- Line: 354
    return 0.5 + 138 / workspace.CurrentCamera.ViewportSize.Y
end
local function getCardPosition(p1) -- Line: 363 -- upvalues: getRevealEase (val), getRestAnchorY (val)
    local v1 = getRevealEase(p1)
    local v2 = (getRestAnchorY() - 0.55) * v1 + 0.55
    return UDim2.new(v1 * 0.08500000000000002 + 0.055, 0, v2 - (1 - v1) * 0.09, 0)
end
local function getRestCardPosition() -- Line: 378 -- upvalues: getCardPosition (val)
    return getCardPosition(1)
end
local function getFlipCardPosition(p1) -- Line: 386 -- upvalues: getRestCardPosition (val)
    local v1 = getRestCardPosition()
    local v2 = math.clamp(p1, 0, 1)
    local v3 = math.sin(v2 * math.pi) * -0.06
    return UDim2.new(v1.X.Scale, 0, v1.Y.Scale + v3, 0)
end
local function getDismissCardPosition(p1) -- Line: 397 -- upvalues: getRestCardPosition (val), getDismissEase (val)
    local v1 = getRestCardPosition()
    local v2 = getDismissEase(p1)
    return UDim2.new(v1.X.Scale, 0, v1.Y.Scale + v2 * -0.22, 0)
end
local function getDismissTransparency(p1) -- Line: 410 -- upvalues: easeOutExpo (val)
    local v1 = math.clamp(p1, 0, 1)
    return easeOutExpo(v1, 1.6)
end
local function getDismissScale(p1) -- Line: 418 -- upvalues: getDismissEase (val)
    return getDismissEase(p1) * -0.5 + 1
end
local function applyCardTransparency(p1, p2) -- Line: 428
    local CardFace
    local v1 = {p1.front, p1.back}
    local v2 = nil
    local v3 = nil
    local v4 = p2
    for i, j in v1, v2, v3 do
        if j and j.component2D then
            CardFace = j.component2D:FindFirstChild("CardFace")
            if CardFace then
                for k, n in CardFace:GetDescendants() do
                    if n:IsA("ImageLabel") then
                        n.ImageTransparency = v4
                    elseif n:IsA("TextLabel") then
                        n.TextTransparency = math.clamp(v4 + 0.2, 0, 1)
                    elseif n:IsA("Frame") and n.BackgroundTransparency < 1 then
                        n.BackgroundTransparency = math.clamp(v4, 0, 1)
                    end
                end
            end
        end
    end
end
local function getAnimationState(p1) -- Line: 459
    if p1 < 1.05 then
        return {
            phase = "reveal",
            flipProgress = 0,
            holdElapsed = 0,
            dismissProgress = 0,
            revealProgress = p1 / 1.05,
            motionElapsed = p1,
        }
    end
    local v1 = p1 - 1.05
    if v1 < 0.72 then
        if v1 < 0.12 then
            return {
                phase = "flip",
                revealProgress = 1,
                flipProgress = 0,
                holdElapsed = 0,
                dismissProgress = 0,
                motionElapsed = p1,
            }
        end
        return {
            phase = "flip",
            revealProgress = 1,
            holdElapsed = 0,
            dismissProgress = 0,
            flipProgress = (v1 - 0.12) / 0.6,
            motionElapsed = p1,
        }
    end
    local v2 = v1 - 0.72
    if v2 < 4 then
        return {
            phase = "hold",
            revealProgress = 1,
            flipProgress = 1,
            dismissProgress = 0,
            motionElapsed = p1,
            holdElapsed = v2,
        }
    end
    local v3 = v2 - 4
    if v3 < 0.9 then
        return {
            phase = "dismiss",
            revealProgress = 1,
            flipProgress = 1,
            holdElapsed = 4,
            motionElapsed = p1,
            dismissProgress = v3 / 0.9,
        }
    end
    return {
        phase = "done",
        revealProgress = 1,
        flipProgress = 1,
        holdElapsed = 4,
        dismissProgress = 1,
        motionElapsed = p1,
    }
end
local function getCardScale(p1) -- Line: 534 -- upvalues: getRevealEase (val)
    return getRevealEase(p1) * 0.5 + 0.5
end
local function getCardSize(p1) -- Line: 543
    return UDim2.fromOffset(p1 * 197.34, p1 * 276)
end
local function CardReveal(p1) -- Line: 553 -- upvalues: react (val), getMotionBind (val), fallbackCardHalfHeight (val), getCardOffsets (val), getCardPosition (val), getCardScale (val), getCardSize (val), applyCardTransparency (val), measureCardHalfHeight (val), RunService (val), getAnimationState (val), getIdleBobInBlend (val), getDismissScale (val), getDismissCardPosition (val), getFlipCardPosition (val), getDismissTransparency (val), Provider (val), Surface (val), FillProps (val), Enchantment (val)
    local u15, v1, v2, v3, v4, v5
    local Enabled = p1.Enabled
    local Enchantment_2 = p1.Enchantment
    local v6 = p1.DisplayOrder or 200
    local v7 = {p1.BindId}
    local u10 = react.useMemo(function() -- Line: 557 -- upvalues: getMotionBind (upval), p1 (val)
        return getMotionBind(p1.BindId)
    end, v7)
    v5, u15 = react.useState(false)
    local v8 = {}
    local u19 = react.useRef(v8)
    local u24 = react.useRef(fallbackCardHalfHeight())
    local u28 = react.useRef(false)
    local u32 = react.useRef(p1.onComplete)
    u32.current = p1.onComplete
    v1, v2 = getCardOffsets(u24.current, 0, 0, 0, 0, 0)
    local u46 = react.useRef(v1)
    local u50 = react.useRef(v2)
    local u56 = react.useRef(getCardPosition(0))
    local u62 = react.useRef(getCardScale(0))
    local function syncCard(p1, p2, p3, p4, p5) -- Line: 574 -- upvalues: u46 (val), u50 (val), u56 (val), u62 (val), getCardSize (upval), u19 (val), applyCardTransparency (upval)
        u46.current = p1
        u50.current = p2
        u56.current = p3
        u62.current = p4
        local v1 = getCardSize(p4)
        local current = u19.current
        local front = current.front
        if front then
            if front.parent2D then
                front.parent2D.Position = p3
                front.parent2D.Size = v1
                front.parent2D.Visible = true
            end
            front.offset = p1
        end
        local back = current.back
        if back then
            if back.parent2D then
                back.parent2D.Position = p3
                back.parent2D.Size = v1
                back.parent2D.Visible = true
            end
            back.offset = p2
        end
        applyCardTransparency(current, p5)
    end
    local function applyCurrentOffsets(p1, p2) -- Line: 612 -- upvalues: u56 (val), getCardSize (upval), u62 (val), u50 (val), u46 (val)
        if p1.parent2D then
            p1.parent2D.AnchorPoint = Vector2.new(0.5, 1)
            p1.parent2D.Position = u56.current
            p1.parent2D.Size = getCardSize(u62.current)
            p1.parent2D.Visible = false
        end
        if p2 == "back" then
            p1.offset = u50.current
            return
        end
        p1.offset = u46.current
    end
    local function bindSide(p1, p2) -- Line: 627 -- upvalues: u19 (val), measureCardHalfHeight (upval), u24 (val), getCardOffsets (upval), u46 (val), u50 (val), applyCurrentOffsets (val)
        u19.current[p1] = p2
        if not p2 then
            return
        end
        if p1 == "front" then
            local v1 = measureCardHalfHeight(p2)
            if v1 then
                local v2, v3
                u24.current = v1
                v2, v3 = getCardOffsets(v1, 0, 0, 0, 0, 0)
                u46.current = v2
                u50.current = v3
            end
        end
        applyCurrentOffsets(p2, p1)
        if p1 == "back" and u19.current.front then
            p2.offset = u50.current
        end
    end
    local v9 = {Enabled, u10}
    react.useEffect(function() -- Line: 654 -- upvalues: Enabled (val), u19 (val), u28 (val), u15 (val), u24 (val), fallbackCardHalfHeight (upval), getCardOffsets (upval), u46 (val), u50 (val), u56 (val), getCardPosition (upval), u62 (val), getCardScale (upval), RunService (upval), u10 (val), getAnimationState (upval), u32 (val), getIdleBobInBlend (upval), getDismissScale (upval), getDismissCardPosition (upval), getFlipCardPosition (upval), getDismissTransparency (upval), measureCardHalfHeight (upval), syncCard (val)
        local u62, v1, v2
        if not Enabled then
            u19.current = {}
            u28.current = false
            u15(false)
            u24.current = fallbackCardHalfHeight()
            v1, v2 = getCardOffsets(u24.current, 0, 0, 0, 0, 0)
            u46.current = v1
            u50.current = v2
            u56.current = getCardPosition(0)
            u62.current = getCardScale(0)
            return
        end
        u24.current = fallbackCardHalfHeight()
        u28.current = false
        u15(false)
        v1, v2 = getCardOffsets(u24.current, 0, 0, 0, 0, 0)
        u46.current = v1
        u50.current = v2
        u56.current = getCardPosition(0)
        u62.current = getCardScale(0)
        local u59 = 0
        local current = u24.current
        u62 = false
        local u63 = false
        local v3 = Enum.RenderPriority.Last.Value + 1
        RunService:BindToRenderStep(u10, v3, function(p1) -- Line: 682 -- upvalues: u59 (ref), getAnimationState (upval), u63 (ref), u32 (upval), u28 (upval), u15 (upval), u19 (upval), getIdleBobInBlend (upval), getCardScale (upval), getDismissScale (upval), getDismissCardPosition (upval), getFlipCardPosition (upval), getCardPosition (upval), getDismissTransparency (upval), measureCardHalfHeight (upval), current (ref), u62 (ref), u24 (upval), getCardOffsets (upval), syncCard (upval)
            local revealProgress, v1, v2
            u59 = u59 + p1
            local v3 = getAnimationState(u59)
            if v3.phase == "done" then
                if not u63 then
                    u63 = true
                    local current_2 = u32.current
                    if current_2 then
                        current_2()
                    end
                end
                return
            end
            if not u28.current then
                if v3.phase == "hold" then
                    if 1 <= v3.flipProgress then
                        u28.current = true
                        u15(true)
                    end
                elseif v3.phase ~= "dismiss" then
                end
            end
            local front = u19.current.front
            local v4 = getIdleBobInBlend(v3.phase, v3.holdElapsed)
            if v3.phase ~= "reveal" then
                revealProgress = 1
            else
                revealProgress = v3.revealProgress
            end
            local v5 = getCardScale(revealProgress)
            local v6 = v5 * getDismissScale(v3.dismissProgress)
            if 0 < v3.dismissProgress then
                v5 = getDismissCardPosition(v3.dismissProgress)
            elseif v3.phase ~= "flip" then
                v5 = getCardPosition(revealProgress)
            else
                v5 = getFlipCardPosition(v3.flipProgress)
            end
            local v7 = getDismissTransparency(v3.dismissProgress)
            if not front then
                if front and not u62 then
                    v1 = measureCardHalfHeight(front)
                    if v1 then
                        current = v1
                        u24.current = v1
                        u62 = true
                    end
                end
            elseif v3.phase == "reveal" then
                v1 = measureCardHalfHeight(front)
                if v1 then
                    current = v1
                end
            elseif front and not u62 then
                v1 = measureCardHalfHeight(front)
                if v1 then
                    current = v1
                    u24.current = v1
                    u62 = true
                end
            end
            v1, v2 = getCardOffsets(current, revealProgress, v3.flipProgress, v3.motionElapsed, v3.dismissProgress, v4)
            syncCard(v1, v2, v5, v6, v7)
        end)
        return function() -- Line: 743 -- upvalues: RunService (upval), u10 (upval)
            RunService:UnbindFromRenderStep(u10)
        end
    end, v9)
    if not Enabled then
        return nil
    end
    v3, v4 = getCardOffsets(u24.current, 0, 0, 0, 0, 0)
    v9 = {Visible = false, AnchorPoint = Vector2.new(0.5, 1), Position = getCardPosition(0), Size = getCardSize(getCardScale(0))}
    local v10 = {}
    local v11 = {
        Enabled = true,
        Compat = false,
        Offset = v3,
        OnComponent = function(p1) -- Line: 769 -- upvalues: bindSide (val)
            bindSide("front", p1)
        end,
        Native = v9,
    }
    local v12 = {}
    local v13 = FillProps({}, {
        Name = "CardFace",
        Active = true,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ClipsDescendants = true,
        ZIndex = 2,
        Size = UDim2.fromScale(1, 1),
    })
    v12.CardFace = react.createElement("Frame", v13, {Face = react.createElement(Enchantment.CardFace, {
        ShineOnce = true,
        ShineDurationSeconds = 2.8,
        ShineCatchUpDelay = 0.65,
        Rarity = Enchantment_2.Rarity,
        Label = Enchantment_2.Name,
        Icon = Enchantment_2.Icon,
        Art = Enchantment_2.Art,
        Enabled = v5,
    })})
    v10.Front = react.createElement(Surface, v11, v12)
    v10.Back = react.createElement(Surface, {
        Enabled = true,
        Compat = false,
        Offset = v4,
        OnComponent = function(p1) -- Line: 804 -- upvalues: bindSide (val)
            bindSide("back", p1)
        end,
        Native = v9,
    }, {CardFace = react.createElement("Frame", {
        Name = "CardFace",
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ClipsDescendants = true,
        ZIndex = 2,
        Size = UDim2.fromScale(1, 1),
    }, {Frame = react.createElement("ImageLabel", {
        Image = "rbxassetid://99848186568259",
        ImageTransparency = 0,
        BackgroundTransparency = 1,
        ImageColor3 = Color3.fromRGB(216, 216, 216),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
    })})})
    return react.createElement(Provider.Provider, {Distance = 12, DisplayOrder = v6}, v10)
end
local function resolveCardEnchantment(p1) -- Line: 842 -- upvalues: ClientEnchantmentsHandler (val), Rarities (val)
    if type(p1) ~= "string" or p1 == "" then
        return nil
    end
    local v1 = ClientEnchantmentsHandler.getEnchantmentHashFromName(p1)
    local v2 = ClientEnchantmentsHandler.getEnchantmentFromHash(v1)
    if not v2 then
        return nil
    end
    local v3 = {Name = v2.Name or p1}
    local Rarity = v2.Rarity
    if not Rarity then
        Rarity = Rarities.Rarities.Common
    end
    v3.Rarity = Rarity
    v3.Icon = v2.Icon
    v3.Art = v2.Art
    return v3
end
return function() -- Line: 866 -- upvalues: react (val), Enchantments (val), resolveCardEnchantment (val), CardReveal (val)
    local u4, u9, v1, v2
    v1, u4 = react.useState(false)
    v2, u9 = react.useState(nil)
    local v3 = {}
    react.useEffect(function() -- Line: 870 -- upvalues: Enchantments (upval), resolveCardEnchantment (upval), u9 (val), u4 (val)
        return Enchantments.Animation.listen(function(p1) -- Line: 871 -- upvalues: resolveCardEnchantment (upval), u9 (upval), u4 (upval)
            local v1 = resolveCardEnchantment(p1.name)
            if not v1 then
                warn((("[EnchantmentCard] Unknown enchantment animation payload: %*"):format(p1.name)))
                return
            end
            u9({bindId = ("award-%*-%*"):format(p1.name, (math.random(1, 50000))), enchantment = v1})
            u4(true)
        end)
    end, v3)
    if not v1 or not v2 then
        return nil
    end
    v3 = {DisplayOrder = 201}
    local v4 = not (not v1)
    v3.Enabled = v4
    v3.Enchantment = v2.enchantment
    v3.BindId = v2.bindId
    function v3.onComplete() -- Line: 897 -- upvalues: u4 (val)
        u4(false)
    end
    return react.createElement(CardReveal, v3)
end