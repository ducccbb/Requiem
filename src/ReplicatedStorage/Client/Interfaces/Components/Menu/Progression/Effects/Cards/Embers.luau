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
--File: ReplicatedStorage.Client.Interfaces.Components.Menu.Progression.Effects.Cards.Embers
--                               Dumped in 0.00163 seconds
--                          Bytecode version 9  |  10 functions

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
local function smoothStep(p1) -- Line: 48
    local v1 = math.clamp(p1, 0, 1)
    return v1 * v1 * (3 - v1 * 2)
end
local function getEmberOpacity(p1) -- Line: 53 -- upvalues: smoothStep (val)
    local v1 = smoothStep((0.96 - p1) / 0.16)
    return v1 * smoothStep((p1 - 0.04) / 0.16) * 0.58
end
local function resetEmber(p1, p2, p3) -- Line: 60
    p1.x = p2:NextNumber(0.15, 0.85)
    p1.y = p3 or 0.96
    p1.vx = p2:NextNumber(-0.02, 0.02)
    p1.vy = p2:NextNumber(0.045, 0.075)
    p1.size = p2:NextNumber(2.5, 4.5)
end
local function getBrightEmberColor(p1) -- Line: 68
    local v1 = Color3.fromRGB(255, 236, 196)
    return p1:Lerp(v1, 0.15)
end
return react.memo(function(p1) -- Line: 72 -- upvalues: react (val), resetEmber (val), RunService (val), getBrightEmberColor (val), getEmberOpacity (val)
    local v1, v2
    local v3 = {}
    local u4 = react.useRef(v3)
    react.useEffect(function() -- Line: 75 -- upvalues: p1 (val), resetEmber (upval), RunService (upval), getBrightEmberColor (upval), u4 (val), getEmberOpacity (upval)
        local v1, v2, v3
        local u3 = Random.new(p1.seed)
        local u6 = table.create(9)
        local v4 = 9
        local v5 = 1
        for i = 1, v4, v5 do
            v1 = {}
            v3 = (1 - (i - 1) / math.max(8, 1)) * 0.9199999999999999 + 0.04
            v2 = v3 + u3:NextNumber(-0.03, 0.03)
            resetEmber(v1, u3, (math.clamp(v2, 0.04, 0.96)))
            u6[i] = v1
        end
        local u44 = false
        local u52 = RunService.RenderStepped:Connect(function(a1) -- Line: 89 -- upvalues: u44 (ref), p1 (upval), getBrightEmberColor (upval), u6 (val), resetEmber (upval), u3 (val), u4 (upval), getEmberOpacity (upval)
            local Core, v1, v2, v3, v4, v5
            if u44 then
                return
            end
            local card = p1.card
            local current = p1.overlayRef.current
            if not card or not card.Parent or not current then
                return
            end
            local AbsolutePosition = card.AbsolutePosition
            local AbsoluteSize = card.AbsoluteSize
            if AbsoluteSize.X <= 0 or AbsoluteSize.Y <= 0 then
                return
            end
            local AbsolutePosition_2 = current.AbsolutePosition
            local v6 = math.clamp(AbsoluteSize.Y / 300, 0.85, 1.1)
            local v7 = getBrightEmberColor(p1.color)
            local v8 = u6
            local v9 = nil
            local v10 = nil
            local v11 = a1
            for i, j in v8, v9, v10 do
                j.y = j.y - j.vy * v11
                j.x = j.x + j.vx * v11
                if j.y <= 0.04 then
                    resetEmber(j, u3)
                end
                v1 = u4.current[i]
                if v1 then
                    v2 = getEmberOpacity(j.y)
                    v3 = j.size * v6
                    v4 = 0.001 < v2
                    v1.Visible = v4
                    if v4 then
                        v1.AnchorPoint = Vector2.new(0.5, 0.5)
                        v1.BackgroundColor3 = v7
                        v1.BackgroundTransparency = 1 - v2 * 0.32
                        v5 = AbsolutePosition.Y + j.y * AbsoluteSize.Y
                        v1.Position = UDim2.fromOffset(AbsolutePosition.X + j.x * AbsoluteSize.X - AbsolutePosition_2.X, v5 - AbsolutePosition_2.Y)
                        v1.Size = UDim2.fromOffset(v3 * 1.35, v3 * 1.35)
                        Core = v1:FindFirstChild("Core")
                        if Core then
                            v5 = Color3.fromRGB(255, 255, 255)
                            Core.BackgroundColor3 = v7:Lerp(v5, 0.22)
                            Core.BackgroundTransparency = 1 - v2 * 0.72
                            Core.Size = UDim2.fromOffset(v3, v3)
                        end
                    end
                end
            end
        end)
        return function() -- Line: 150 -- upvalues: u44 (ref), u52 (val), u4 (upval)
            local v1
            u44 = true
            u52:Disconnect()
            local v2 = 9
            local v3 = 1
            for i = 1, v2, v3 do
                v1 = u4.current[i]
                if v1 then
                    v1.Visible = false
                end
            end
        end
    end, {p1.card, p1.color, p1.seed})
    v3 = {}
    v1 = 9
    local v4 = 1
    for i = 1, v1, v4 do
        v2 = ("Ember%*"):format(i)
        v3[v2] = react.createElement("Frame", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ZIndex = 3,
            ref = function(p1) -- Line: 166 -- upvalues: u4 (val), i (val)
                u4.current[i] = p1
                if p1 then
                    p1.Visible = false
                end
            end,
        }, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(1, 0)}), Core = react.createElement("Frame", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ZIndex = 2,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
        }, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(1, 0)})})})
    end
    return react.createElement(react.Fragment, {}, v3)
end)