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
--File: ReplicatedStorage.Client.Interfaces.Components.Menu.Progression.Effects.Cards.Effects
--                               Dumped in 0.00206 seconds
--                          Bytecode version 9  |  17 functions

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
local Embers = require(v1.Parent:WaitForChild("Embers"))
local Glow = require(v1.Parent:WaitForChild("Glow"))
local function registrationHasOverlayEffects(p1) -- Line: 45
    local v1 = if p1.glow == nil then p1.embers ~= nil else true
    return v1
end
local function registrationsHaveOverlayEffects(p1) -- Line: 49 -- upvalues: registrationHasOverlayEffects (val)
    local v1 = p1
    local v2 = nil
    local v3 = nil
    for i, j in v1, v2, v3 do
        if registrationHasOverlayEffects(j) then
            return true
        end
    end
    return false
end
local u45 = react.createContext(nil)
local function GlowOverlay(p1) -- Line: 69 -- upvalues: react (val), Glow (val)
    local card, glow
    if not p1.enabled or not p1.overlayRef.current or not p1.scrollRef.current then
        return nil
    end
    local v1 = {}
    local registrations = p1.registrations
    local v2 = nil
    local v3 = nil
    for i, j in registrations, v2, v3 do
        glow = j.glow
        card = j.card
        if glow and card and card.Parent then
            v1[i] = react.createElement(Glow, {
                card = card,
                color = glow,
                overlayRef = p1.overlayRef,
                pulse = j.pulse,
                phase = string.len(i) * 0.37,
            })
        end
    end
    return react.createElement(react.Fragment, {}, v1)
end
local function EmbersOverlay(p1) -- Line: 105 -- upvalues: react (val), Embers (val)
    local card, embers, v1, v2
    if not p1.enabled or not p1.overlayRef.current or not p1.scrollRef.current then
        return nil
    end
    local v3 = {}
    local registrations = p1.registrations
    local v4 = nil
    local v5 = nil
    for i, j in registrations, v4, v5 do
        embers = j.embers
        card = j.card
        if embers and card and card.Parent then
            v1 = {card = card, color = embers, overlayRef = p1.overlayRef}
            v2 = string.len(i) * 104729
            v1.seed = v2 + card.AbsoluteSize.X
            v3[i] = react.createElement(Embers, v1)
        end
    end
    return react.createElement(react.Fragment, {}, v3)
end
return {
    Provider = function(p1) -- Line: 151 -- upvalues: react (val), registrationsHaveOverlayEffects (val), GlowOverlay (val), EmbersOverlay (val), u45 (val)
        local Enabled, u10, u5, v1, v2
        local v3 = {}
        v1, u5 = react.useState(v3)
        v2, u10 = react.useState(0)
        local u14 = react.useRef({})
        local v4 = react.useRef(nil)
        local v5 = react.useRef(nil)
        local v6 = react.useRef(nil)
        local u31 = react.useCallback(function() -- Line: 160 -- upvalues: u10 (val)
            u10(function(p1) -- Line: 161
                return p1 + 1
            end)
        end, {})
        local u36 = react.useCallback(function(p1) -- Line: 166 -- upvalues: u14 (val)
            local v1 = u14.current[p1]
            if v1 then
                local v2 = v1
                local v3 = nil
                local v4 = nil
                for i, j in v2, v3, v4 do
                    j:Disconnect()
                end
                u14.current[p1] = nil
            end
        end, {})
        local u43 = react.useCallback(function(p1, p2, p3) -- Line: 176 -- upvalues: u36 (val), u5 (val), u31 (val), u14 (val)
            local PropertyChangedSignal, PropertyChangedSignal_2, v1, v2
            u36(p1)
            if not p2 or not p3.enabled then
                u5(function(a1) -- Line: 191 -- upvalues: p1 (val)
                    if a1[p1] == nil then
                        return a1
                    end
                    local v1 = table.clone(a1)
                    v1[p1] = nil
                    return v1
                end)
                return
            end
            if p3.glow then
                v1 = {}
                PropertyChangedSignal = p2:GetPropertyChangedSignal("AbsolutePosition")
                v2 = PropertyChangedSignal:Connect(u31)
                PropertyChangedSignal_2 = p2:GetPropertyChangedSignal("AbsoluteSize")
                v1[1] = v2
                v1[2] = PropertyChangedSignal_2:Connect(u31)
                u14.current[p1] = v1
                u5(function(a1) -- Line: 209 -- upvalues: p1 (val), p2 (val), p3 (val)
                    local v1 = table.clone(a1)
                    v1[p1] = {
                        card = p2,
                        rarity = p3.rarity,
                        hasCustomArt = p3.hasCustomArt,
                        enabled = p3.enabled,
                        glow = p3.glow,
                        embers = p3.embers,
                        pulse = p3.pulse,
                    }
                    return v1
                end)
                return
            end
            if not p3.embers then
                u5(function(a1) -- Line: 191 -- upvalues: p1 (val)
                    if a1[p1] == nil then
                        return a1
                    end
                    local v1 = table.clone(a1)
                    v1[p1] = nil
                    return v1
                end)
                return
            end
            v1 = {}
            PropertyChangedSignal = p2:GetPropertyChangedSignal("AbsolutePosition")
            v2 = PropertyChangedSignal:Connect(u31)
            PropertyChangedSignal_2 = p2:GetPropertyChangedSignal("AbsoluteSize")
            v1[1] = v2
            v1[2] = PropertyChangedSignal_2:Connect(u31)
            u14.current[p1] = v1
            u5(function(a1) -- Line: 209 -- upvalues: p1 (val), p2 (val), p3 (val)
                local v1 = table.clone(a1)
                v1[p1] = {
                    card = p2,
                    rarity = p3.rarity,
                    hasCustomArt = p3.hasCustomArt,
                    enabled = p3.enabled,
                    glow = p3.glow,
                    embers = p3.embers,
                    pulse = p3.pulse,
                }
                return v1
            end)
        end, {u31, u36})
        react.useEffect(function() -- Line: 224 -- upvalues: p1 (val), u14 (val), u36 (val), u5 (val)
            local current, v1, v2
            if not p1.Enabled then
                current = u14.current
                v1 = nil
                v2 = nil
                for i in current, v1, v2 do
                    u36(i)
                end
                u5({})
            end
            return function() -- Line: 233 -- upvalues: u14 (upval), u36 (upval)
                local current = u14.current
                local v1 = nil
                local v2 = nil
                for i in current, v1, v2 do
                    u36(i)
                end
            end
        end, {p1.Enabled, u36})
        Enabled = p1.Enabled
        if Enabled then
            Enabled = registrationsHaveOverlayEffects(v1)
        end
        local v7 = {}
        local v8 = {
            AnchorPoint = Vector2.new(0.5, 0.5),
            AutomaticCanvasSize = Enum.AutomaticSize.Y,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            CanvasSize = UDim2.new(),
            ClipsDescendants = true,
            Position = UDim2.fromScale(0.5, 0.5),
            ScrollBarThickness = p1.ScrollBarThickness or 3,
            Size = UDim2.fromScale(1, 1),
            ZIndex = 1,
            ref = v4,
        }
        v8[react.Change.CanvasPosition] = u31
        v8[react.Change.AbsoluteSize] = u31
        v7.Scroll = react.createElement("ScrollingFrame", v8, p1.children)
        if Enabled then
            v8 = {
                AnchorPoint = Vector2.new(0.5, 0.5),
                Active = false,
                BackgroundTransparency = 1,
                ClipsDescendants = true,
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.fromScale(2, 1),
                ZIndex = 0,
                ref = v5,
            }
            v8[react.Change.AbsoluteSize] = u31
            v8[react.Change.AbsolutePosition] = u31
            v7.Overlay = react.createElement("Frame", v8, {Glow = react.createElement(GlowOverlay, {
                enabled = true,
                layoutVersion = v2,
                registrations = v1,
                overlayRef = v5,
                scrollRef = v4,
            })})
            v8 = {
                AnchorPoint = Vector2.new(0.5, 0.5),
                Active = false,
                BackgroundTransparency = 1,
                ClipsDescendants = true,
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.fromScale(2, 1),
                ZIndex = 2,
                ref = v6,
            }
            v8[react.Change.AbsoluteSize] = u31
            v8[react.Change.AbsolutePosition] = u31
            v7.EmbersOverlay = react.createElement("Frame", v8, {Embers = react.createElement(EmbersOverlay, {
                enabled = true,
                layoutVersion = v2,
                registrations = v1,
                overlayRef = v6,
                scrollRef = v4,
            })})
        end
        local v9 = react.useMemo(function() -- Line: 310 -- upvalues: u43 (val), u31 (val)
            return {updateCard = u43, bumpLayout = u31}
        end, {u43, u31})
        return react.createElement(u45.Provider, {value = v9}, {Host = react.createElement("Frame", {BackgroundTransparency = 1, ClipsDescendants = false, Size = p1.Size, LayoutOrder = p1.LayoutOrder}, v7)})
    end,
    useCardAnchor = function(p1) -- Line: 329 -- upvalues: react (val), u45 (val)
        local u4 = react.useContext(u45)
        return react.useCallback(function(a1) -- Line: 341 -- upvalues: u4 (val), p1 (val)
            if not u4 then
                return
            end
            u4.updateCard(p1.effectId, a1, {
                rarity = p1.rarity,
                hasCustomArt = p1.hasCustomArt,
                enabled = p1.enabled,
                glow = p1.glow,
                embers = p1.embers,
                pulse = p1.pulse,
            })
        end, {
            u4,
            p1.effectId,
            p1.enabled,
            p1.rarity,
            p1.hasCustomArt,
            p1.glow,
            p1.embers,
            p1.pulse,
        })
    end,
}