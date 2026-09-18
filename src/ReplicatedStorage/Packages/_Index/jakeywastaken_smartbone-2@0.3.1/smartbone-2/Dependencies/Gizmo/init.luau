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
--File: ReplicatedStorage.Packages._Index.jakeywastaken_smartbone-2@0.3.1.smartbone-2.Dependencies.Gizmo
--                               Dumped in 0.00142 seconds
--                          Bytecode version 9  |  23 functions

local deepCopy
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Terrain = workspace:WaitForChild("Terrain")
assert(Terrain, "No terrain object found under workspace...")
local AOTGizmoAdornment = Terrain:FindFirstChild("AOTGizmoAdornment")
local GizmoAdornment = Terrain:FindFirstChild("GizmoAdornment")
if not AOTGizmoAdornment then
    AOTGizmoAdornment = Instance.new("WireframeHandleAdornment")
    AOTGizmoAdornment.Adornee = Terrain
    AOTGizmoAdornment.ZIndex = 1
    AOTGizmoAdornment.AlwaysOnTop = true
    AOTGizmoAdornment.Name = "AOTGizmoAdornment"
    AOTGizmoAdornment.Parent = Terrain
end
if not GizmoAdornment then
    GizmoAdornment = Instance.new("WireframeHandleAdornment")
    GizmoAdornment.Adornee = Terrain
    GizmoAdornment.ZIndex = 1
    GizmoAdornment.AlwaysOnTop = false
    GizmoAdornment.Name = "GizmoAdornment"
    GizmoAdornment.Parent = Terrain
end
local Gizmos = script:WaitForChild("Gizmos")
local u48 = {}
local u49 = {}
local u50 = {}
local u51 = {}
local u52 = {AlwaysOnTop = true}
local u53 = {}
local u54 = false
local function Lerp(p1, p2, p3) -- Line: 76
    return p1 + (p2 - p1) * p3
end
function deepCopy(p1) -- Line: 80 -- upvalues: deepCopy (val)
    local v1 = {}
    for k, v in pairs(p1) do
        if type(v) == "table" then
            v = deepCopy(v)
        end
        v1[k] = v
    end
    return v1
end
local u62 = {
    Enabled = true,
    ActiveRays = 0,
    ActiveInstances = 0,
    Styles = {Color = "Color3", Transparency = "Transparency", AlwaysOnTop = "AlwaysOnTop"},
    AOTWireframeHandle = AOTGizmoAdornment,
    WireframeHandle = GizmoAdornment,
    GetPoolSize = function() -- Line: 472 -- upvalues: u53 (val)
        local v1 = 0
        local v2 = u53
        local v3 = nil
        local v4 = nil
        for i, j in v2, v3, v4 do
            v1 = v1 + #j
        end
        return v1
    end,
    PushProperty = function(p1, p2) -- Line: 482 -- upvalues: u52 (val), AOTGizmoAdornment (ref), GizmoAdornment (ref)
        u52[p1] = p2
        if p1 == "AlwaysOnTop" then
            return
        end
        pcall(function() -- Line: 489 -- upvalues: AOTGizmoAdornment (upval), p1 (val), p2 (val), GizmoAdornment (upval)
            AOTGizmoAdornment[p1] = p2
            GizmoAdornment[p1] = p2
        end)
    end,
    PopProperty = function(p1) -- Line: 495 -- upvalues: u52 (val), AOTGizmoAdornment (ref)
        if u52[p1] then
            return u52[p1]
        end
        return AOTGizmoAdornment[p1]
    end,
}
function u62.SetStyle(p1, p2, p3) -- Line: 503 -- upvalues: u62 (val)
    if p1 and typeof(p1) == "Color3" then
        u62.PushProperty("Color3", p1)
    end
    if p2 and typeof(p2) == "number" then
        u62.PushProperty("Transparency", p2)
    end
    if p3 and typeof(p3) == "boolean" then
        u62.PushProperty("AlwaysOnTop", p3)
    end
end
function u62.DoCleaning() -- Line: 517 -- upvalues: AOTGizmoAdornment (ref), GizmoAdornment (ref), u48 (ref), u53 (val), u62 (val)
    local ClassName
    AOTGizmoAdornment:Clear()
    GizmoAdornment:Clear()
    local v1 = u48
    local v2 = nil
    local v3 = nil
    for i, j in v1, v2, v3 do
        ClassName = j.ClassName
        if not (u53[ClassName]) then
            u53[ClassName] = {}
        end
        j:Remove()
        table.insert(u53[ClassName], j)
    end
    u48 = {}
    u62.ActiveRays = 0
    u62.ActiveInstances = 0
end
function u62.ScheduleCleaning() -- Line: 531 -- upvalues: u54 (ref), u62 (val)
    if u54 then
        return
    end
    u54 = true
    task.delay(0, function() -- Line: 538 -- upvalues: u62 (upval), u54 (upval)
        u62.DoCleaning()
        u54 = false
    end)
end
function u62.AddDebrisInSeconds(p1, p2) -- Line: 545 -- upvalues: u50 (val)
    table.insert(u50, {"Seconds", p1, os.clock(), p2})
end
function u62.AddDebrisInFrames(p1, p2) -- Line: 549 -- upvalues: u50 (val)
    table.insert(u50, {"Frames", p1, 0, p2})
end
function u62.TweenProperties(p1, p2, p3) -- Line: 553 -- upvalues: deepCopy (val), u51 (val)
    table.insert(u51, {
        Time = 0,
        p_Properties = p1,
        Properties = deepCopy(p1),
        Goal = p2,
        TweenInfo = p3,
    })
    local u11 = #u51
    return function() -- Line: 567 -- upvalues: u51 (upval), u11 (val)
        table.remove(u51, u11)
    end
end
function u62.Init() -- Line: 572 -- upvalues: RunService (val), u51 (val), TweenService (val), u50 (val), u49 (val)
    RunService.RenderStepped:Connect(function(p1) -- Line: 573 -- upvalues: u51 (upval), TweenService (upval), u50 (upval), u49 (upval)
        local LerpProperty, Properties, Value, v1, v2, v3, v4, v5, v6, v7
        local v8 = u51
        local v9 = nil
        local v10 = nil
        local v11 = p1
        for i, j in v8, v9, v10 do
            j.Time = j.Time + v11
            v4 = j.Time / j.TweenInfo.Time
            if 1 < v4 then
                v4 = 1
            end
            function LerpProperty(p1, p2, p3) -- Line: 582
                if type(p1) == "number" then
                    return p1 + (p2 - p1) * p3
                end
                return p1:Lerp(p2, p3)
            end
            Properties = j.Properties
            v7 = nil
            v1 = nil
            for k, n in Properties, v7, v1 do
                if j.Goal[k] then
                    Value = TweenService:GetValue(v4, j.TweenInfo.EasingStyle, j.TweenInfo.EasingDirection)
                    v3 = j.Goal[k]
                    if type(n) ~= "number" then
                        v2 = n:Lerp(v3, Value)
                    else
                        v2 = n + (v3 - n) * Value
                    end
                    j.p_Properties[k] = v2
                end
            end
            if v4 == 1 then
                table.remove(u51, i)
            end
        end
        v8 = u50
        v9 = nil
        v10 = nil
        for m, i5 in v8, v9, v10 do
            v5 = i5[2]
            v6 = i5[3]
            v7 = i5[4]
            if i5[1] ~= "Seconds" then
                if v5 >= v6 then
                    i5[2] = i5[2] + 1
                    v7()
                else
                    table.remove(u50, m)
                end
            elseif v5 >= os.clock() - v6 then
                v7()
            else
                table.remove(u50, m)
            end
        end
        v8 = u49
        v9 = nil
        v10 = nil
        for i6, i7 in v8, v9, v10 do
            v4 = i7[2]
            if v4.Enabled then
                if v4.Destroy then
                    table.remove(u49, i6)
                end
                i7[1]:Update(v4)
            end
        end
    end)
end
function u62.SetEnabled(p1) -- Line: 649 -- upvalues: u62 (val)
    u62.Enabled = p1
    if p1 == false then
        u62.DoCleaning()
    end
end
for i, j in Gizmos:GetChildren() do
    u62[j.Name] = require(j).Init(u62, u52, function(p1) -- Line: 63 -- upvalues: u53 (val)
        if not (u53[p1]) or not (u53[p1][1]) then
            return Instance.new(p1)
        end
        local v1 = u53[p1][1]
        table.remove(u53[p1], 1)
        return v1
    end, function(p1) -- Line: 52 -- upvalues: u53 (val)
        local ClassName = p1.ClassName
        if not (u53[ClassName]) then
            u53[ClassName] = {}
        end
        p1:Remove()
        table.insert(u53[ClassName], p1)
    end, function(p1, p2) -- Line: 44 -- upvalues: u49 (val)
        table.insert(u49, {p1, p2})
    end, function(p1) -- Line: 48 -- upvalues: u48 (ref)
        table.insert(u48, p1)
    end)
end
return u62