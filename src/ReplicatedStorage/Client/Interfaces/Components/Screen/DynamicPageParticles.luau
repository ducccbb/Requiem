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
--   File: ReplicatedStorage.Client.Interfaces.Components.Screen.DynamicPageParticles
--                               Dumped in 0.00297 seconds
--                          Bytecode version 9  |  11 functions

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
local function createParticle(p1) -- Line: 41
    local v1 = Random.new(p1)
    return {x = v1:NextNumber(0.05, 0.95), y = v1:NextNumber(0.05, 0.95), vx = v1:NextNumber(-0.014, 0.014), vy = v1:NextNumber(-0.014, 0.014)}
end
local function getCellKey(p1, p2) -- Line: 52
    local v1 = math.floor(p1 / 0.13)
    local v2 = math.floor(p2 / 0.13)
    return (("%*,%*"):format(v1, v2))
end
local function buildParticles(p1) -- Line: 58 -- upvalues: react (val)
    local v1
    local v2 = {}
    local v3 = 36
    local v4 = 1
    for i = 1, v3, v4 do
        v1 = ("Particle%*"):format(i)
        v2[v1] = react.createElement("Frame", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ZIndex = 2,
            ref = function(a1) -- Line: 63 -- upvalues: p1 (val), i (val)
                p1.current[i] = a1
                if a1 then
                    a1.Visible = false
                end
            end,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromOffset(3, 3),
        }, {Dot = react.createElement("Frame", {
            Name = "Dot",
            BackgroundTransparency = 0.95,
            BorderSizePixel = 0,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromOffset(3, 3),
        }, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(1, 0)})})})
    end
    return v2
end
local function buildLines(p1) -- Line: 95 -- upvalues: react (val)
    local v1
    local v2 = {}
    local v3 = 72
    local v4 = 1
    for i = 1, v3, v4 do
        v1 = ("Line%*"):format(i)
        v2[v1] = react.createElement("Frame", {
            BackgroundTransparency = 0.97,
            BorderSizePixel = 0,
            ZIndex = 1,
            ref = function(a1) -- Line: 100 -- upvalues: p1 (val), i (val)
                p1.current[i] = a1
                if a1 then
                    a1.Visible = false
                end
            end,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromOffset(0, 1),
        })
    end
    return v2
end
return react.memo(function(p1) -- Line: 119 -- upvalues: react (val), createParticle (val), RunService (val), getCellKey (val), buildLines (val), buildParticles (val)
    local u4 = react.useRef(nil)
    local v1 = {}
    local u8 = react.useRef(v1)
    local v2 = {}
    local u12 = react.useRef(v2)
    local v3 = {p1.Enabled, p1.Color}
    react.useEffect(function() -- Line: 124 -- upvalues: p1 (val), createParticle (upval), RunService (upval), u4 (val), u8 (val), getCellKey (upval), u12 (val)
        if not p1.Enabled then
            return
        end
        local u2 = false
        local u5 = table.create(36)
        local v1 = 36
        local v2 = 1
        for i = 1, v1, v2 do
            u5[i] = createParticle(i * 104729)
        end
        local u28 = RunService.RenderStepped:Connect(function(a1) -- Line: 136 -- upvalues: u2 (ref), u4 (upval), u5 (val), u8 (upval), p1 (upval), getCellKey (upval), u12 (upval)
            local Dot, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25
            if u2 then
                return
            end
            local current = u4.current
            if not current then
                return
            end
            local X = current.AbsoluteSize.X
            local Y = current.AbsoluteSize.Y
            if X <= 0 or Y <= 0 then
                return
            end
            local v26 = u5
            local v27 = nil
            local v28 = nil
            local v29 = a1
            for i, j in v26, v27, v28 do
                j.x = j.x + j.vx * v29
                j.y = j.y + j.vy * v29
                if j.x <= 0 then
                    j.x = 0
                    j.vx = math.abs(j.vx)
                elseif 1 <= j.x then
                    j.x = 1
                    j.vx = -math.abs(j.vx)
                end
                if j.y <= 0 then
                    j.y = 0
                    j.vy = math.abs(j.vy)
                elseif 1 <= j.y then
                    j.y = 1
                    j.vy = -math.abs(j.vy)
                end
            end
            v26 = u5
            v27 = nil
            v28 = nil
            for k, n in v26, v27, v28 do
                v25 = u8.current[k]
                if v25 then
                    v25.Visible = true
                    v25.Position = UDim2.fromScale(n.x, n.y)
                    Dot = v25:FindFirstChild("Dot")
                    if Dot then
                        Dot.BackgroundColor3 = p1.Color
                    end
                end
            end
            v26 = {}
            v27 = u5
            v28 = nil
            local v30 = nil
            for m, i5 in v27, v28, v30 do
                v1 = getCellKey(i5.x, i5.y)
                v2 = v26[v1]
                if not v2 then
                    v26[v1] = {m}
                else
                    table.insert(v2, m)
                end
            end
            v27 = table.create(36, 0)
            v28 = 0
            v30 = u5
            local v31 = nil
            v25 = nil
            for i6, i7 in v30, v31, v25 do
                if 3 > v27[i6] then
                    v3 = math.floor(i7.x / 0.13)
                    v4 = math.floor(i7.y / 0.13)
                    v5 = 1
                    v6 = 1
                    for i8 = -1, v5, v6 do
                        v7 = 1
                        v8 = 1
                        for i9 = -1, v7, v8 do
                            v9 = v26[("%*,%*"):format(v3 + i8, v4 + i9)]
                            if v9 then
                                v10 = v9
                                v11 = nil
                                v12 = nil
                                for i10, i11 in v10, v11, v12 do
                                    if i11 > i6 and 3 > v27[i6] and 3 > v27[i11] then
                                        v13 = u5[i11]
                                        v14 = v13.x - i7.x
                                        v15 = v13.y - i7.y
                                        v16 = v14 * v14 + v15 * v15
                                        if 0.016900000000000002 >= v16 and 72 > v28 then
                                            v28 = v28 + 1
                                            v17 = u12.current[v28]
                                            if v17 then
                                                v18 = i7.x * X
                                                v19 = i7.y * Y
                                                v20 = v13.x * X
                                                v21 = v13.y * Y
                                                v22 = v20 - v18
                                                v23 = v21 - v19
                                                v24 = math.sqrt(v22 * v22 + v23 * v23)
                                                if v24 >= 1 then
                                                    v17.Visible = true
                                                    v17.BackgroundColor3 = p1.Color
                                                    v17.Position = UDim2.fromOffset((v18 + v20) * 0.5, (v19 + v21) * 0.5)
                                                    v17.Size = UDim2.fromOffset(v24, 1)
                                                    v17.Rotation = math.deg((math.atan2(v23, v22)))
                                                    v27[i6] = v27[i6] + 1
                                                    v27[i11] = v27[i11] + 1
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
            v30 = 72
            v31 = 1
            for i12 = v28 + 1, v30, v31 do
                v1 = u12.current[i12]
                if v1 then
                    v1.Visible = false
                end
            end
        end)
        return function() -- Line: 285 -- upvalues: u2 (ref), u28 (val), u8 (upval), u12 (upval)
            local v1
            u2 = true
            u28:Disconnect()
            local v2 = 36
            local v3 = 1
            for i = 1, v2, v3 do
                v1 = u8.current[i]
                if v1 then
                    v1.Visible = false
                end
            end
            v2 = 72
            v3 = 1
            for j = 1, v2, v3 do
                v1 = u12.current[j]
                if v1 then
                    v1.Visible = false
                end
            end
        end
    end, v3)
    return react.createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ref = u4,
        Size = UDim2.fromScale(1, 1),
        Visible = p1.Enabled,
        ZIndex = p1.ZIndex or 1,
    }, {Lines = react.createElement("Frame", {BackgroundTransparency = 1, BorderSizePixel = 0, ZIndex = 1, Size = UDim2.fromScale(1, 1)}, buildLines(u12)), Particles = react.createElement("Frame", {BackgroundTransparency = 1, BorderSizePixel = 0, ZIndex = 2, Size = UDim2.fromScale(1, 1)}, buildParticles(u8))})
end)