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
--                        File: StarterGui.Freecam.FreecamScript
--                               Dumped in 0.00958 seconds
--                          Bytecode version 9  |  60 functions

local MouseWheel, u346, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13
local u0 = script
script = nil
local v14 = getfenv(0)
v14.script = nil
_G.script = nil
v14 = getfenv(0)
v14.getfenv = nil
for i, j in u0.Parent.Parent:GetChildren() do
    if j ~= u0.Parent and j.Name == "Freecam" then
        j:Destroy()
    end
end
u0.Parent.Parent.ChildAdded:Connect(function(p1) -- Line: 58
    if p1.Name == "Freecam" then
        p1:Destroy()
    end
end)
local Players_2 = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Network = require(Common:WaitForChild("Network"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Network_2 = Common_2:WaitForChild("Network")
local Namespaces = Network_2:WaitForChild("Namespaces")
local Administration = require(Namespaces:WaitForChild("Administration"))
Network.loaded:await()
local v15 = Administration.Store.get(Players_2.LocalPlayer)
if not v15 then
    while true do
        task.wait()
        print("Yay")
        v15 = Administration.Store.get(Players_2.LocalPlayer)
        if v15 then
            break
        end
    end
end
if v15.permission <= 6 then
    u0.Parent:Destroy()
    return
end
local pi = math.pi
local abs = math.abs
local clamp = math.clamp
local exp = math.exp
local rad = math.rad
local sign = math.sign
local sqrt = math.sqrt
local tan = math.tan
local ContextActionService = game:GetService("ContextActionService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local StarterGui = game:GetService("StarterGui")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local GameSettings = UserSettings().GameSettings
local Lighting = game:GetService("Lighting")
local LocalPlayer = Players.LocalPlayer
if not LocalPlayer then
    Players:GetPropertyChangedSignal("LocalPlayer"):Wait()
    LocalPlayer = Players.LocalPlayer
end
local u161 = nil
local u162 = nil
local CurrentCamera = Workspace.CurrentCamera
local PropertyChangedSignal = Workspace:GetPropertyChangedSignal("CurrentCamera")
PropertyChangedSignal:Connect(function() -- Line: 112 -- upvalues: Workspace (val), CurrentCamera (ref)
    local CurrentCamera_2 = Workspace.CurrentCamera
    if CurrentCamera_2 then
        CurrentCamera = CurrentCamera_2
    end
end)
local u173 = nil
local u174 = nil
local u175 = nil
v1, v2 = pcall(function() -- Line: 125
    return UserSettings():IsUserFeatureEnabled("UserExitFreecamBreaksWithShiftlock")
end)
local u181 = v1 and v2
v2, v3 = pcall(function() -- Line: 133
    return UserSettings():IsUserFeatureEnabled("UserShowGuiHideToggles")
end)
local u187 = v2 and v3
v3, v4 = pcall(function() -- Line: 141
    return UserSettings():IsUserFeatureEnabled("UserFixFreecamDeltaTimeCalculation")
end)
local u193 = v3 and v4
v4, v5 = pcall(function() -- Line: 149
    return UserSettings():IsUserFeatureEnabled("UserFixFreecamGuiChangeVisibility2")
end)
v3 = v4 and v5
v5, v6 = pcall(function() -- Line: 157
    return UserSettings():IsUserFeatureEnabled("UserFreecamControlSpeed")
end)
v4 = v5 and v6
v6, v7 = pcall(function() -- Line: 165
    return UserSettings():IsUserFeatureEnabled("UserFreecamTiltControl")
end)
v5 = v6 and v7
v7, v8 = pcall(function() -- Line: 173
    return UserSettings():IsUserFeatureEnabled("UserFreecamSmoothnessControl")
end)
v6 = v7 and v8
v8, v9 = pcall(function() -- Line: 181
    return UserSettings():IsUserFeatureEnabled("UserFreecamGuiDestabilization")
end)
v7 = v8 and v9
v9, v10 = pcall(function() -- Line: 189
    return UserSettings():IsUserFeatureEnabled("UserFreecamDepthOfFieldEffect3")
end)
v8 = v9 and v10
v10, v11 = pcall(function() -- Line: 197
    return UserSettings():IsUserFeatureEnabled("UserFreecamPlayerLock2")
end)
v9 = v10 and v11
v11, v12 = pcall(function() -- Line: 205
    return UserSettings():IsUserFeatureEnabled("UserFreecamPlayerLockResetHeight")
end)
v10 = v11 and v12
v12, v13 = pcall(function() -- Line: 213
    return UserSettings():IsUserFeatureEnabled("UserFreecamCustomGui")
end)
v11 = v12 and v13
local u248 = true
local u249 = true
local u250 = true
local u251 = true
local u252 = true
local u253 = true
local u254 = true
local u255 = true
local u256 = true
local Value = Enum.ContextActionPriority.High.Value
local u261 = {Enum.KeyCode.LeftShift, Enum.KeyCode.P}
local u264 = {}
u264[Enum.KeyCode.Z] = true
u264[Enum.KeyCode.C] = true
local u269 = {}
u269[Enum.KeyCode.ButtonL1] = true
u269[Enum.KeyCode.ButtonR1] = true
local u274 = {}
u274[Enum.KeyCode.BackSlash] = true
local u277 = {}
u277[Enum.KeyCode.Slash] = true
local u280 = {}
u280[Enum.KeyCode.R] = true
u280[Enum.KeyCode.T] = true
local u285 = {}
u285[Enum.KeyCode.G] = true
local u288 = {}
u288[Enum.KeyCode.X] = true
local u291 = {}
u291[Enum.KeyCode.L] = true
local u299 = Vector3.new(1, 1, 1) * 64
local u304 = Vector2.new(0.75, 1) * 8
local u307 = -pi / 2
local u311 = rad(90)
local u312 = 1.5
local u313 = 1
local u314 = 4
local u315 = 1
local u316 = {}
local u317 = 0
local u318 = {}
local u319 = nil
local u320 = nil
local u321 = nil
local u322 = nil
local u323 = nil
local u324 = false
local u325 = 20
local u326 = 0
local u327 = {}
local u328 = 1
local u329 = nil
local u330 = false
local u331 = false
local u332 = {}
u332.__index = u332
function u332.new(p1, p2) -- Line: 323 -- upvalues: u332 (val)
    local v1 = setmetatable({}, u332)
    v1.f = p1
    v1.p = p2
    v1.v = p2 * 0
    return v1
end
function u332:Update(p2, p3) -- Line: 331 -- upvalues: pi (val), exp (val)
    local v1 = self.f * 2 * pi
    local v = self.v
    local v2 = p3 - self.p
    local v3 = exp(-v1 * p2)
    local v4 = p3 + (v * p2 - v2 * (v1 * p2 + 1)) * v3
    self.p = v4
    self.v = (v1 * p2 * (v2 * v1 - v) + v) * v3
    return v4
end
function u332:SetFreq(p2) -- Line: 348
    self.f = p2
end
function u332:Reset(p2) -- Line: 352
    self.p = p2
    self.v = p2 * 0
end
local u339 = Vector3.new()
if not u252 then
    u346 = Vector2.new()
else
    u346 = Vector3.new()
end
local u347 = 0
local new = u332.new
local u354 = new(u312, (Vector3.new()))
local u360 = u332.new(u313, Vector2.new())
local u365 = u332.new(u314, 0)
local u370 = u332.new(u315, 0)
local u371 = {}
local function fCurve(p1) -- Line: 381 -- upvalues: exp (val)
    local v1 = exp(2 * p1) - 1
    return v1 / (exp(2) - 1)
end
local function fDeadzone(p1) -- Line: 385 -- upvalues: fCurve (val)
    return fCurve((p1 - 0.15) / 0.85)
end
local function thumbstickCurve(p1) -- Line: 389 -- upvalues: sign (val), fDeadzone (val), abs (val), clamp (val)
    local v1 = sign(p1)
    local v2 = fDeadzone((abs(p1)))
    return v1 * clamp(v2, 0, 1)
end
local u383 = {
    ButtonX = 0,
    ButtonY = 0,
    DPadDown = 0,
    DPadUp = 0,
    DPadLeft = 0,
    DPadRight = 0,
    ButtonL2 = 0,
    ButtonR2 = 0,
    ButtonL1 = 0,
    ButtonR1 = 0,
    Thumbstick1 = Vector2.new(),
    Thumbstick2 = Vector2.new(),
}
local u388 = {
    W = 0,
    A = 0,
    S = 0,
    D = 0,
    E = 0,
    Q = 0,
    U = 0,
    H = 0,
    J = 0,
    K = 0,
    I = 0,
    Y = 0,
    Up = 0,
    Down = 0,
    Left = 0,
    Right = 0,
    LeftShift = 0,
    RightShift = 0,
    Z = 0,
    C = 0,
    Comma = 0,
    Period = 0,
    LeftBracket = 0,
    RightBracket = 0,
    Semicolon = 0,
    Quote = 0,
    V = 0,
    B = 0,
    N = 0,
    M = 0,
    BackSlash = 0,
    Minus = 0,
    Equals = 0,
    Slash = 0,
    R = 0,
    T = 0,
    G = 0,
    X = 0,
    L = 0,
}
local u428 = {MouseWheel = 0, Delta = Vector2.new()}
local u435 = Vector3.new(1, 1, 1)
local u440 = Vector3.new(1, 1, 1)
local v16 = Vector2.new(1, 1)
local u447 = v16 * (pi / 64)
local u448 = u447 / 60
local v17 = Vector2.new(1, 1)
local u454 = v17 * (pi / 8)
local u455 = {
    FarIntensity = {ADJ = 0.1, MIN = 0, MAX = 1},
    NearIntensity = {ADJ = 0.1, MIN = 0, MAX = 1},
    FocusDistance = {ADJ = 20, MIN = 0, MAX = 200},
    FocusRadius = {ADJ = 5, MIN = 0, MAX = 50},
}
local AttributeChangedSignal = 1
local Push = 1
local u462 = 1
function u371.Vel(p1) -- Line: 504 -- upvalues: u253 (ref), AttributeChangedSignal (ref), u388 (val), u383 (val), clamp (val), thumbstickCurve (ref), u435 (val), u440 (val), UserInputService (val)
    if not u253 then
        AttributeChangedSignal = clamp(AttributeChangedSignal + p1 * (u388.Up - u388.Down) * 0.75, 0.01, 4)
    else
        AttributeChangedSignal = clamp(AttributeChangedSignal + p1 * (u388.Up - u388.Down + u383.DPadUp - u383.DPadDown) * 0.75, 0.01, 4)
    end
    local v1 = thumbstickCurve(u383.Thumbstick1.X)
    local v2 = thumbstickCurve(u383.ButtonR2)
    local v3 = v2 - thumbstickCurve(u383.ButtonL2)
    local v4 = Vector3.new(v1, v3, thumbstickCurve(-u383.Thumbstick1.Y))
    local v5 = u388.S - u388.W
    v1 = Vector3.new(u388.D - u388.A + u388.K - u388.H, u388.E - u388.Q + u388.I - u388.Y, v5 + u388.J - u388.U)
    v1 = UserInputService:IsKeyDown(Enum.KeyCode.LeftShift)
    if not v1 then
        v1 = UserInputService:IsKeyDown(Enum.KeyCode.RightShift)
    end
    if not v1 then
        v5 = 1
    else
        v5 = 0.25
    end
    return (v4 * u435 + v1 * u440) * (AttributeChangedSignal * v5)
end
function u371.Pan(p1) -- Line: 527 -- upvalues: thumbstickCurve (ref), u383 (val), u454 (val), u428 (val), u447 (val), u193 (ref), u448 (val)
    local v1 = thumbstickCurve(u383.Thumbstick2.Y)
    local v2 = Vector2.new(v1, thumbstickCurve(-u383.Thumbstick2.X))
    v2 = if u193 and 0 < p1 then u428.Delta / p1 * u448 else u428.Delta * u447
    u428.Delta = Vector2.new()
    return v2 * u454 + v2
end
function u371.Fov(p1) -- Line: 542 -- upvalues: u253 (ref), u462 (ref), u388 (val), u383 (val), clamp (val), u428 (val), u193 (ref)
    if u253 then
        u462 = clamp(u462 + p1 * (u388.Right - u388.Left + u383.DPadRight - u383.DPadLeft) * 0.75, 0.01, 4)
    end
    local v1 = (u383.ButtonX - u383.ButtonY) * 0.25
    local v2 = if u193 and 0 < p1 then u428.MouseWheel / p1 * 0.016666666666666666 else u428.MouseWheel * 1
    u428.MouseWheel = 0
    if u253 then
        return (v1 + v2) * u462
    end
    return v1 + v2
end
function u371.Roll(p1) -- Line: 561 -- upvalues: Push (ref), u388 (val), clamp (val), u383 (val)
    Push = clamp(Push + p1 * (u388.Period - u388.Comma) * 0.75, 0.01, 4)
    return ((u383.ButtonR1 - u383.ButtonL1) * 1 + (u388.C - u388.Z) * 1) * Push
end
function u371.SpringControl(p1) -- Line: 570 -- upvalues: u250 (ref), UserInputService (val), u312 (ref), u388 (val), clamp (val), u354 (val), u313 (ref), u360 (val), u314 (ref), u365 (val), u315 (ref), u370 (val)
    if not u250 then
        u312 = clamp(u312 + p1 * (u388.RightBracket - u388.LeftBracket) * 0.75, 0.01, 10)
        u354:SetFreq(u312)
        u313 = clamp(u313 + p1 * (u388.Quote - u388.Semicolon) * 0.75, 0.01, 10)
        u360:SetFreq(u313)
        u314 = clamp(u314 + p1 * (u388.B - u388.V) * 0.75, 0.01, 10)
        u365:SetFreq(u314)
        u315 = clamp(u315 + p1 * (u388.M - u388.N) * 0.75, 0.01, 10)
        u370:SetFreq(u315)
        return
    end
    local v1 = UserInputService:IsKeyDown(Enum.KeyCode.LeftShift)
    if not v1 then
        v1 = UserInputService:IsKeyDown(Enum.KeyCode.RightShift)
    end
    local v2 = UserInputService:IsKeyDown(Enum.KeyCode.LeftControl)
    if not v2 then
        v2 = UserInputService:IsKeyDown(Enum.KeyCode.RightControl)
    end
    if v1 or v2 then
        return
    end
    u312 = clamp(u312 + p1 * (u388.RightBracket - u388.LeftBracket) * 0.75, 0.01, 10)
    u354:SetFreq(u312)
    u313 = clamp(u313 + p1 * (u388.Quote - u388.Semicolon) * 0.75, 0.01, 10)
    u360:SetFreq(u313)
    u314 = clamp(u314 + p1 * (u388.B - u388.V) * 0.75, 0.01, 10)
    u365:SetFreq(u314)
    u315 = clamp(u315 + p1 * (u388.M - u388.N) * 0.75, 0.01, 10)
    u370:SetFreq(u315)
end
function u371.DoF(p1) -- Line: 593 -- upvalues: UserInputService (val), u173 (ref), u388 (val), u455 (val), clamp (val)
    local v1 = UserInputService:IsKeyDown(Enum.KeyCode.LeftShift)
    if not v1 then
        v1 = UserInputService:IsKeyDown(Enum.KeyCode.RightShift)
    end
    local v2 = UserInputService:IsKeyDown(Enum.KeyCode.LeftControl)
    if not v2 then
        v2 = UserInputService:IsKeyDown(Enum.KeyCode.RightControl)
    end
    if v1 then
        u173.FarIntensity = clamp(u173.FarIntensity + p1 * (u388.RightBracket - u388.LeftBracket) * u455.FarIntensity.ADJ, u455.FarIntensity.MIN, u455.FarIntensity.MAX)
        u173.InFocusRadius = clamp(u173.InFocusRadius + p1 * (u388.Equals - u388.Minus) * u455.FocusRadius.ADJ, u455.FocusRadius.MIN, u455.FocusRadius.MAX)
        return
    end
    if v2 then
        u173.NearIntensity = clamp(u173.NearIntensity + p1 * (u388.RightBracket - u388.LeftBracket) * u455.NearIntensity.ADJ, u455.NearIntensity.MIN, u455.NearIntensity.MAX)
        return
    end
    u173.FocusDistance = clamp(u173.FocusDistance + p1 * (u388.Equals - u388.Minus) * u455.FocusDistance.ADJ, u455.FocusDistance.MIN, u455.FocusDistance.MAX)
end
local function resetKeys(p1, p2) -- Line: 624
    for k, v in pairs(p1) do
        if p2[k.Name] then
            p2[k.Name] = 0
        end
    end
end
local function handleDoubleTapReset(p1) -- Line: 632 -- upvalues: u316 (val), u317 (ref), u346 (ref), u370 (val), u250 (ref), resetKeys (val), u269 (val), u383 (val), u264 (val), u388 (val)
    local v1
    local v2 = os.clock()
    local v3 = u316[p1]
    if not v3 then
        v1 = -1
    else
        v1 = v2 - v3
    end
    if v3 and v1 <= 0.25 then
        local v4 = v2 - u317
        if 0.1 <= v4 then
            u346 = Vector3.new(u346.x, u346.y, 0)
            u370:Reset(0)
            if not u250 then
                u383.ButtonL1 = 0
                u383.ButtonR1 = 0
                u388.C = 0
                u388.Z = 0
            else
                resetKeys(u269, u383)
                resetKeys(u264, u388)
            end
            u317 = v2
        end
    end
    u316[p1] = v2
end
local function findPlayerLockRootPart(p1) -- Line: 657 -- upvalues: u327 (ref), u328 (ref), u324 (ref)
    local Character, Humanoid, v1
    if not u327 then
        return nil
    end
    local v2 = #u327
    if v2 < 1 then
        return nil
    end
    v2 = #u327
    local v3 = 1
    local v4 = p1
    for i = 1, v2, v3 do
        u328 = (u328 - 1 + v4) % #u327 + 1
        v1 = u327[u328]
        Character = v1
        if Character then
            Character = v1.Character
        end
        if Character then
            Humanoid = Character:FindFirstChildOfClass("Humanoid")
            if Humanoid and Humanoid.RootPart then
                return Humanoid.RootPart
            end
        end
        if v4 == 0 then
            v4 = 1
        end
    end
    u324 = false
    return nil
end
local function Keypress(p1, p2, p3) -- Line: 684 -- upvalues: u388 (val), u252 (ref), u264 (val), handleDoubleTapReset (val), u250 (ref), u274 (val), u173 (ref), u318 (ref), CurrentCamera (ref), Lighting (val), u320 (ref), u321 (ref), resetKeys (val), u255 (ref), u277 (val), u324 (ref), u325 (ref), u256 (ref), u326 (ref), u329 (ref), findPlayerLockRootPart (val), u280 (val), u327 (ref), u249 (ref), u285 (val), u162 (ref), u288 (val), u330 (ref), u175 (ref), u291 (val), u331 (ref), StarterGui (val)
    local v1
    if p2 ~= Enum.UserInputState.Begin then
        v1 = 0
    else
        v1 = 1
    end
    u388[p3.KeyCode.Name] = v1
    if u252 and u264[p3.KeyCode] and p3.UserInputState == Enum.UserInputState.Begin then
        handleDoubleTapReset(p3.KeyCode)
    end
    if u250 and u274[p3.KeyCode] and p3.UserInputState == Enum.UserInputState.Begin then
        if u173.Enabled then
            for i, v in ipairs(u318) do
                if v.Parent then
                    v.Enabled = true
                end
            end
            if u320 then
                u320:Disconnect()
                u320 = nil
            end
            if u321 then
                u321:Disconnect()
                u321 = nil
            end
            u318 = {}
        else
            u318 = {}
            for i2, i3 in ipairs(CurrentCamera:GetChildren()) do
                if i3:IsA("DepthOfFieldEffect") and i3.Enabled then
                    u318[#u318 + 1] = i3
                    i3.Enabled = false
                end
            end
            for i4, j in ipairs(Lighting:GetChildren()) do
                if j:IsA("DepthOfFieldEffect") and j.Enabled then
                    u318[#u318 + 1] = j
                    j.Enabled = false
                end
            end
            u320 = CurrentCamera.ChildAdded:Connect(function(p1) -- Line: 710 -- upvalues: u318 (upval)
                if p1:IsA("DepthOfFieldEffect") and p1.Enabled then
                    u318[#u318 + 1] = p1
                    p1.Enabled = false
                end
            end)
            u321 = Lighting.ChildAdded:Connect(function(p1) -- Line: 716 -- upvalues: u318 (upval)
                if p1:IsA("DepthOfFieldEffect") and p1.Enabled then
                    u318[#u318 + 1] = p1
                    p1.Enabled = false
                end
            end)
        end
        u173.Enabled = not u173.Enabled
        resetKeys(u274, u388)
    end
    if u255 then
        if u277[p3.KeyCode] and p3.UserInputState == Enum.UserInputState.Begin then
            u324 = not u324
            if u324 then
                u325 = 20
                if u256 then
                    u326 = 0
                end
                u329 = findPlayerLockRootPart(0)
            end
            resetKeys(u277, u388)
        end
        if u280[p3.KeyCode] and p3.UserInputState == Enum.UserInputState.Begin then
            if u324 then
                local v2 = #u327
                if 0 < v2 then
                    u329 = findPlayerLockRootPart(u388.T - u388.R)
                end
            end
            resetKeys(u280, u388)
        end
    end
    if u249 then
        if u285[p3.keyCode] and p3.UserInputState == Enum.UserInputState.Begin then
            if u162 and u162.Parent then
                u162.Enabled = not u162.Enabled
            end
            resetKeys(u285, u388)
        end
        if u288[p3.keyCode] and p3.UserInputState == Enum.UserInputState.Begin then
            u330 = not u330
            if u175 then
                for k, k2 in pairs((u175.getScreenGuis())) do
                    if k2.Parent and k2 ~= u162 then
                        k2.Enabled = u330
                    end
                end
            end
            resetKeys(u288, u388)
        end
        if u291[p3.keyCode] and p3.UserInputState == Enum.UserInputState.Begin then
            u331 = not u331
            StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, u331)
            resetKeys(u291, u388)
        end
    end
    return Enum.ContextActionResult.Sink
end
local function GpButton(p1, p2, p3) -- Line: 797 -- upvalues: u383 (val), u252 (ref), u269 (val), handleDoubleTapReset (val)
    local v1
    if p2 ~= Enum.UserInputState.Begin then
        v1 = 0
    else
        v1 = 1
    end
    u383[p3.KeyCode.Name] = v1
    if u252 and u269[p3.KeyCode] and p3.UserInputState == Enum.UserInputState.Begin then
        handleDoubleTapReset(p3.KeyCode)
    end
    return Enum.ContextActionResult.Sink
end
local function MousePan(p1, p2, p3) -- Line: 809 -- upvalues: u428 (val)
    local Delta = p3.Delta
    u428.Delta = Vector2.new(-Delta.y, -Delta.x)
    return Enum.ContextActionResult.Sink
end
local function Thumb(p1, p2, p3) -- Line: 815 -- upvalues: u383 (val)
    u383[p3.KeyCode.Name] = p3.Position
    return Enum.ContextActionResult.Sink
end
local function Trigger(p1, p2, p3) -- Line: 820 -- upvalues: u383 (val)
    u383[p3.KeyCode.Name] = p3.Position.z
    return Enum.ContextActionResult.Sink
end
function MouseWheel(p1, p2, p3) -- Line: 825 -- upvalues: u428 (val)
    u428[p3.UserInputType.Name] = -p3.Position.z
    return Enum.ContextActionResult.Sink
end
local function Zero(p1) -- Line: 830
    for k, v in pairs(p1) do
        p1[k] = v * 0
    end
end
function u371.StartCapture() -- Line: 836 -- upvalues: u253 (ref), ContextActionService (val), Keypress (val), Value (val), GpButton (val), u252 (ref), u248 (ref), u250 (ref), u255 (ref), u249 (ref), MousePan (val), MouseWheel (val), Trigger (val), Thumb (val)
    if not u253 then
        ContextActionService:BindActionAtPriority("FreecamKeyboard", Keypress, false, Value, Enum.KeyCode.W, Enum.KeyCode.U, Enum.KeyCode.A, Enum.KeyCode.H, Enum.KeyCode.S, Enum.KeyCode.J, Enum.KeyCode.D, Enum.KeyCode.K, Enum.KeyCode.E, Enum.KeyCode.I, Enum.KeyCode.Q, Enum.KeyCode.Y, Enum.KeyCode.Up, Enum.KeyCode.Down)
    else
        ContextActionService:BindActionAtPriority("FreecamKeyboard", Keypress, false, Value, Enum.KeyCode.W, Enum.KeyCode.U, Enum.KeyCode.A, Enum.KeyCode.H, Enum.KeyCode.S, Enum.KeyCode.J, Enum.KeyCode.D, Enum.KeyCode.K, Enum.KeyCode.E, Enum.KeyCode.I, Enum.KeyCode.Q, Enum.KeyCode.Y)
        ContextActionService:BindActionAtPriority("FreecamKeyboardControlSpeed", Keypress, false, Value, Enum.KeyCode.Up, Enum.KeyCode.Down, Enum.KeyCode.Left, Enum.KeyCode.Right)
        ContextActionService:BindActionAtPriority("FreecamGamepadControlSpeed", GpButton, false, Value, Enum.KeyCode.DPadUp, Enum.KeyCode.DPadDown, Enum.KeyCode.DPadLeft, Enum.KeyCode.DPadRight)
    end
    if u252 then
        ContextActionService:BindActionAtPriority("FreecamKeyboardTiltControl", Keypress, false, Value, Enum.KeyCode.Z, Enum.KeyCode.C)
        ContextActionService:BindActionAtPriority("FreecamGamepadTiltControl", GpButton, false, Value, Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1)
        ContextActionService:BindActionAtPriority("FreecamKeyboardTiltControlSpeed", Keypress, false, Value, Enum.KeyCode.Comma, Enum.KeyCode.Period)
        if u248 then
            ContextActionService:BindActionAtPriority("FreecamKeyboardSmoothnessControl", Keypress, false, Value, Enum.KeyCode.LeftBracket, Enum.KeyCode.RightBracket, Enum.KeyCode.Semicolon, Enum.KeyCode.Quote, Enum.KeyCode.V, Enum.KeyCode.B, Enum.KeyCode.N, Enum.KeyCode.M)
        end
    end
    if u250 then
        ContextActionService:BindActionAtPriority("FreecamKeyboardDoFToggle", Keypress, false, Value, Enum.KeyCode.BackSlash)
        ContextActionService:BindActionAtPriority("FreecamKeyboardDoFControls", Keypress, false, Value, Enum.KeyCode.Minus, Enum.KeyCode.Equals)
    end
    if u255 then
        ContextActionService:BindActionAtPriority("FreecamKeyboardPlayerLockToggle", Keypress, false, Value, Enum.KeyCode.Slash)
        ContextActionService:BindActionAtPriority("FreecamKeyboardPlayerLockSwitch", Keypress, false, Value, Enum.KeyCode.R, Enum.KeyCode.T)
    end
    if u249 then
        ContextActionService:BindActionAtPriority("FreecamKeyboardCustomGuiToggle", Keypress, false, Value, Enum.KeyCode.G)
        ContextActionService:BindActionAtPriority("FreecamKeyboardPlayerGuiToggle", Keypress, false, Value, Enum.KeyCode.X)
        ContextActionService:BindActionAtPriority("FreecamKeyboardLeaderboardToggle", Keypress, false, Value, Enum.KeyCode.L)
    end
    ContextActionService:BindActionAtPriority("FreecamMousePan", MousePan, false, Value, Enum.UserInputType.MouseMovement)
    ContextActionService:BindActionAtPriority("FreecamMouseWheel", MouseWheel, false, Value, Enum.UserInputType.MouseWheel)
    ContextActionService:BindActionAtPriority("FreecamGamepadButton", GpButton, false, Value, Enum.KeyCode.ButtonX, Enum.KeyCode.ButtonY)
    ContextActionService:BindActionAtPriority("FreecamGamepadTrigger", Trigger, false, Value, Enum.KeyCode.ButtonR2, Enum.KeyCode.ButtonL2)
    ContextActionService:BindActionAtPriority("FreecamGamepadThumbstick", Thumb, false, Value, Enum.KeyCode.Thumbstick1, Enum.KeyCode.Thumbstick2)
end
function u371.StopCapture() -- Line: 916 -- upvalues: u249 (ref), AttributeChangedSignal (ref), u253 (ref), u462 (ref), u252 (ref), Push (ref), Zero (val), u383 (val), u388 (val), u428 (val), ContextActionService (val), u248 (ref), u250 (ref), u255 (ref)
    if not u249 then
        AttributeChangedSignal = 1
        if u253 then
            u462 = 1
        end
        if u252 then
            Push = 1
        end
    end
    Zero(u383)
    Zero(u388)
    Zero(u428)
    ContextActionService:UnbindAction("FreecamKeyboard")
    if u253 then
        ContextActionService:UnbindAction("FreecamKeyboardControlSpeed")
        ContextActionService:UnbindAction("FreecamGamepadControlSpeed")
    end
    if u252 then
        ContextActionService:UnbindAction("FreecamKeyboardTiltControl")
        ContextActionService:UnbindAction("FreecamGamepadTiltControl")
        ContextActionService:UnbindAction("FreecamKeyboardTiltControlSpeed")
        if u248 then
            ContextActionService:UnbindAction("FreecamKeyboardSmoothnessControl")
        end
    end
    if u250 then
        ContextActionService:UnbindAction("FreecamKeyboardDoFToggle")
        ContextActionService:UnbindAction("FreecamKeyboardDoFControls")
    end
    if u255 then
        ContextActionService:UnbindAction("FreecamKeyboardPlayerLockToggle")
        ContextActionService:UnbindAction("FreecamKeyboardPlayerLockSwitch")
    end
    if u249 then
        ContextActionService:UnbindAction("FreecamKeyboardCustomGuiToggle")
        ContextActionService:UnbindAction("FreecamKeyboardPlayerGuiToggle")
        ContextActionService:UnbindAction("FreecamKeyboardLeaderboardToggle")
    end
    ContextActionService:UnbindAction("FreecamMousePan")
    ContextActionService:UnbindAction("FreecamMouseWheel")
    ContextActionService:UnbindAction("FreecamGamepadButton")
    ContextActionService:UnbindAction("FreecamGamepadTrigger")
    ContextActionService:UnbindAction("FreecamGamepadThumbstick")
end
function u371.getNavSpeed() -- Line: 962 -- upvalues: AttributeChangedSignal (ref)
    return AttributeChangedSignal
end
function u371.getFovSpeed() -- Line: 966 -- upvalues: u462 (ref)
    return u462
end
function u371.getRollSpeed() -- Line: 970 -- upvalues: Push (ref)
    return Push
end
function thumbstickCurve(p1) -- Line: 978 -- upvalues: u248 (ref), u371 (val), u250 (ref), u173 (ref), u354 (val), u360 (val), u365 (val), u252 (ref), u370 (val), rad (val), tan (val), u347 (ref), sqrt (val), clamp (val), u304 (val), u346 (ref), u307 (val), pi (val), u311 (val), u339 (ref), u299 (val), u255 (ref), u324 (ref), u329 (ref), u325 (ref), u326 (ref), u249 (ref), u174 (ref), u162 (ref), u312 (ref), u313 (ref), u314 (ref), u315 (ref), u253 (ref), u327 (ref), u328 (ref), CurrentCamera (ref)
    local v1, v2, v3
    if u248 then
        u371.SpringControl(p1)
    end
    if u250 and u173 and u173.Parent then
        u371.DoF(p1)
    end
    local v4 = u354:Update(p1, u371.Vel(p1))
    local v5 = u360:Update(p1, u371.Pan(p1))
    local v6 = u365:Update(p1, u371.Fov(p1))
    local v7 = if u252 then u370:Update(p1, u371.Roll(p1)) else nil
    local v8 = tan((rad(35)))
    local v9 = sqrt(v8 / tan((rad(u347 / 2))))
    v8 = u347 + v6 * 300 * (p1 / v9)
    u347 = clamp(v8, 1, 120)
    if not u252 then
        u346 = u346 + v5 * u304 * (p1 / v9)
        v2 = clamp(u346.x, -u311, u311)
        u346 = Vector2.new(v2, u346.y % (2 * pi))
        v2 = CFrame.new(u339)
        v8 = v2 * CFrame.fromOrientation(u346.x, u346.y, 0)
        v1 = v8 * CFrame.new(v4 * u299 * p1)
    else
        v8 = v5 * u304 * (p1 / v9)
        u346 = u346 + Vector3.new(v8.X, v8.Y, v7 * u307 * (p1 / v9))
        if not u248 then
            v3 = clamp(u346.x, -u311, u311)
            u346 = Vector3.new(v3, u346.y % (2 * pi), u346.z)
        else
            u346 = Vector3.new(u346.x % (2 * pi), u346.y % (2 * pi), u346.z % (2 * pi))
        end
        v3 = CFrame.new(u339)
        v2 = v3 * CFrame.fromOrientation(u346.x, u346.y, u346.z)
        v1 = v2 * CFrame.new(v4 * u299 * p1)
    end
    if u255 and u324 and u329 then
        v2 = v4.Y * u299.Y * p1
        u325 = clamp(u325 + v4.Z * u299.Z * p1, 5, 50)
        local v10 = u326 + v2
        u326 = clamp(v10, -10, 10)
        v3 = CFrame.new(u329.Position + Vector3.new(0, u326, 0))
        if not u252 then
            v10 = CFrame.fromOrientation(u346.x, u346.y, 0)
        else
            v10 = CFrame.fromOrientation(u346.x, u346.y, u346.z)
        end
        v1 = v3 * v10 * CFrame.new(0, 0, u325)
    end
    if u249 and u174 and u174.Parent and u162 and u162.Parent and u162.Enabled then
        v8 = ""
        if 0 < p1 then
            v2 = (v1.p - u339) / p1
            v8 = v8 .. string.format("Velocity: (%.1f, %.1f, %.1f)\n", v2.X, v2.Y, v2.Z)
        end
        v8 = v8 .. string.format("FOV: %.1f\n", u347)
        if u252 then
            v8 = v8 .. string.format("Tilt: %.1f°\n", (math.deg(u346.z)))
        end
        if u248 then
            v8 = (((v8 .. string.format("Stiffness (Vel): %.1f\n", u312)) .. string.format("Stiffness (Pan): %.1f\n", u313)) .. string.format("Stiffness (FOV): %.1f\n", u314)) .. string.format("Stiffness (Roll): %.1f\n", u315)
        end
        if u253 then
            v8 = ((v8 .. string.format("Movement Speed: %.1f\n", u371.getNavSpeed())) .. string.format("Zoom Speed: %.1f\n", u371.getFovSpeed())) .. string.format("Tilt Speed: %.1f\n", u371.getRollSpeed())
        end
        if u250 then
            if not u173 then
                v8 = v8 .. string.format("Custom Depth Of Field: Off\n")
            elseif u173.Parent and u173.Enabled then
                v8 = ((((v8 .. string.format("Custom Depth Of Field: On\n")) .. string.format("Custom Depth Of Field Near Intensity: %.1f\n", u173.NearIntensity)) .. string.format("Custom Depth Of Field Far Intensity: %.1f\n", u173.FarIntensity)) .. string.format("Custom Depth Of Field Focus Distance: %.1f\n", u173.FocusDistance)) .. string.format("Custom Depth Of Field Focus Radius: %.1f\n", u173.InFocusRadius)
            end
        end
        if u255 then
            if not u324 then
                v8 = v8 .. string.format("Player Lock: Off\n")
            else
                v2 = #u327
                if 0 >= v2 then
                    v8 = v8 .. string.format("Player Lock: Off\n")
                else
                    v8 = v8 .. string.format("Player Lock: %s\n", u327[u328].Name)
                end
            end
        end
        u174.Text = v8
    end
    u339 = v1.p
    CurrentCamera.CFrame = v1
    CurrentCamera.Focus = v1
    CurrentCamera.FieldOfView = u347
end
local function CheckMouseLockAvailability() -- Line: 1094 -- upvalues: Players (val), GameSettings (val)
    local v1 = Players.LocalPlayer.DevComputerMovementMode == Enum.DevComputerMovementMode.Scriptable
    local v2 = GameSettings.ControlMode == Enum.ControlMode.MouseLockSwitch
    local v3 = GameSettings.ComputerMovementMode == Enum.ComputerMovementMode.ClickToMove
    local v4 = Players.LocalPlayer.DevEnableMouseLock
    if v4 then
        v4 = v2
        if v4 then
            v4 = not v3
            if v4 then
                v4 = not v1
            end
        end
    end
    return v4
end
u175 = {}
local removePlayerFromList = nil
local initializePlayerList = nil
local StartFreecam = nil
local StopFreecam = nil
local u549 = nil
local ToggleFreecam = nil
local CheckMacro = {}
local u552 = {Backpack = true, Chat = true, Health = true, PlayerList = true}
AttributeChangedSignal = {BadgesNotificationsActive = true, PointsNotificationsActive = true}
function Push() -- Line: 1127 -- upvalues: u552 (val), StarterGui (val), AttributeChangedSignal (val), LocalPlayer (ref), CheckMacro (ref), u254 (ref), u319 (ref), u249 (ref), u330 (ref), ToggleFreecam (ref), CurrentCamera (ref), StartFreecam (ref), u549 (ref), StopFreecam (ref), initializePlayerList (ref), UserInputService (val), u181 (ref), CheckMouseLockAvailability (val), removePlayerFromList (ref)
    for k in pairs(u552) do
        u552[k] = StarterGui:GetCoreGuiEnabled(Enum.CoreGuiType[k])
        StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType[k], false)
    end
    for k2 in pairs(AttributeChangedSignal) do
        AttributeChangedSignal[k2] = StarterGui:GetCore(k2)
        StarterGui:SetCore(k2, false)
    end
    local PlayerGui = LocalPlayer:FindFirstChildOfClass("PlayerGui")
    if PlayerGui then
        for k3, v in pairs(PlayerGui:GetChildren()) do
            if v:IsA("ScreenGui") and v.Enabled then
                CheckMacro[#CheckMacro + 1] = v
                v.Enabled = false
            end
        end
        if u254 then
            u319 = PlayerGui.ChildAdded:Connect(function(p1) -- Line: 1145 -- upvalues: CheckMacro (upval), u249 (upval), u330 (upval)
                if not (p1:IsA("ScreenGui")) or not p1.Enabled then
                    return
                end
                CheckMacro[#CheckMacro + 1] = p1
                if u249 then
                    p1.Enabled = u330
                    return
                end
                p1.Enabled = false
            end)
        end
    end
    ToggleFreecam = CurrentCamera.FieldOfView
    CurrentCamera.FieldOfView = 70
    StartFreecam = CurrentCamera.CameraType
    CurrentCamera.CameraType = Enum.CameraType.Custom
    u549 = CurrentCamera.CFrame
    StopFreecam = CurrentCamera.Focus
    initializePlayerList = UserInputService.MouseIconEnabled
    UserInputService.MouseIconEnabled = false
    if not u181 then
        removePlayerFromList = UserInputService.MouseBehavior
    elseif not (CheckMouseLockAvailability()) then
        removePlayerFromList = UserInputService.MouseBehavior
    else
        removePlayerFromList = Enum.MouseBehavior.Default
    end
    UserInputService.MouseBehavior = Enum.MouseBehavior.Default
end
u175.Push = Push
function Push() -- Line: 1179 -- upvalues: u552 (val), StarterGui (val), AttributeChangedSignal (val), CheckMacro (ref), u249 (ref), u162 (ref), u254 (ref), u319 (ref), CurrentCamera (ref), ToggleFreecam (ref), StartFreecam (ref), u549 (ref), StopFreecam (ref), UserInputService (val), initializePlayerList (ref), removePlayerFromList (ref)
    for k, v in pairs(u552) do
        StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType[k], v)
    end
    for k2, i in pairs(AttributeChangedSignal) do
        StarterGui:SetCore(k2, i)
    end
    for k3, j in pairs(CheckMacro) do
        if not u249 then
            if j.Parent then
                j.Enabled = true
            end
        elseif j.Parent and j ~= u162 then
            j.Enabled = true
        end
    end
    if u254 then
        if u319 then
            u319:Disconnect()
            u319 = nil
        end
        CheckMacro = {}
    end
    CurrentCamera.FieldOfView = ToggleFreecam
    ToggleFreecam = nil
    CurrentCamera.CameraType = StartFreecam
    StartFreecam = nil
    CurrentCamera.CFrame = u549
    u549 = nil
    CurrentCamera.Focus = StopFreecam
    StopFreecam = nil
    UserInputService.MouseIconEnabled = initializePlayerList
    initializePlayerList = nil
    UserInputService.MouseBehavior = removePlayerFromList
    removePlayerFromList = nil
end
u175.Pop = Push
function Push() -- Line: 1225 -- upvalues: CheckMacro (ref)
    return CheckMacro
end
u175.getScreenGuis = Push
function removePlayerFromList(p1) -- Line: 1230 -- upvalues: u327 (ref), u328 (ref), u324 (ref)
    for i, v in ipairs(u327) do
        if v == p1 then
            table.remove(u327, i)
            if u328 == i and u324 then
                u324 = false
                u328 = 1
            end
            if i < u328 then
                u328 = u328 - 1
            end
            if #u327 >= u328 and u328 >= 1 then
                break
            end
            u328 = 1
            return
        end
    end
end
function initializePlayerList() -- Line: 1254 -- upvalues: u327 (ref), Players (val), LocalPlayer (ref), u328 (ref), u322 (ref), u323 (ref), removePlayerFromList (val)
    u327 = Players:GetPlayers()
    for i, v in ipairs(u327) do
        if v == LocalPlayer then
            u328 = i
            break
        end
    end
    u322 = Players.PlayerAdded:Connect(function(p1) -- Line: 1264 -- upvalues: u327 (upval)
        table.insert(u327, p1)
    end)
    u323 = Players.PlayerRemoving:Connect(removePlayerFromList)
end
function StartFreecam() -- Line: 1271 -- upvalues: u255 (ref), initializePlayerList (val), u251 (ref), u187 (ref), u0 (val), CurrentCamera (ref), u252 (ref), u346 (ref), u339 (ref), u347 (ref), u354 (val), u360 (val), u365 (val), u370 (val), u249 (ref), u248 (ref), u312 (ref), u313 (ref), u314 (ref), u315 (ref), u161 (ref), LocalPlayer (ref), u162 (ref), u174 (ref), u175 (ref), u250 (ref), u173 (ref), RunService (val), thumbstickCurve (val), u371 (val)
    if u255 then
        initializePlayerList()
    end
    if not u251 and u187 then
        u0:SetAttribute("FreecamEnabled", true)
    end
    local CFrame = CurrentCamera.CFrame
    if not u252 then
        u346 = Vector2.new(CFrame:toEulerAnglesYXZ())
    else
        u346 = Vector3.new(CFrame:toEulerAnglesYXZ())
    end
    u339 = CFrame.p
    u347 = CurrentCamera.FieldOfView
    u354:Reset((Vector3.new()))
    u360:Reset(Vector2.new())
    u365:Reset(0)
    if u252 then
        u370:Reset(0)
    end
    if not u249 and u248 then
        u312 = 1.5
        u313 = 1
        u314 = 4
        u315 = 1
    end
    if u249 then
        u161 = LocalPlayer:WaitForChild("PlayerGui")
        u162 = u161:WaitForChild("Freecam")
        if not u174 then
            u174 = Instance.new("TextLabel")
            u174.Name = "FreecamCustomGui"
            u174.TextColor3 = Color3.new(1, 1, 1)
            u174.Font = Enum.Font.SourceSansBold
            u174.TextSize = 20
            u174.TextStrokeTransparency = 0
            u174.BackgroundTransparency = 1
            u174.TextWrapped = true
            u174.TextXAlignment = Enum.TextXAlignment.Right
            u174.AutomaticSize = Enum.AutomaticSize.Y
            u174.AnchorPoint = Vector2.new(1, 1)
            u174.Position = UDim2.new(1, -10, 1, -10)
            u174.Size = UDim2.new(0, 400, 0, 0)
            u174.Parent = u162
        elseif u174.Parent then
        end
    end
    u175.Push()
    if u250 then
        if not u173 then
            u173 = Instance.new("DepthOfFieldEffect")
            u173.Enabled = false
            u173.Name = "FreecamDepthOfField"
            u173.Parent = CurrentCamera
        elseif not u173.Parent then
            u173 = Instance.new("DepthOfFieldEffect")
            u173.Enabled = false
            u173.Name = "FreecamDepthOfField"
            u173.Parent = CurrentCamera
        end
    end
    RunService:BindToRenderStep("Freecam", Enum.RenderPriority.Camera.Value, thumbstickCurve)
    u371.StartCapture()
end
function StopFreecam() -- Line: 1343 -- upvalues: u251 (ref), u187 (ref), u0 (val), u255 (ref), u322 (ref), u323 (ref), u324 (ref), u328 (ref), u327 (ref), u250 (ref), u173 (ref), u318 (ref), u320 (ref), u321 (ref), u249 (ref), u162 (ref), u330 (ref), u331 (ref), u371 (val), RunService (val), u175 (ref)
    if not u251 and u187 then
        u0:SetAttribute("FreecamEnabled", false)
    end
    if u255 then
        if u322 then
            u322:Disconnect()
            u322 = nil
        end
        if u323 then
            u323:Disconnect()
            u323 = nil
        end
        u324 = false
        u328 = 1
        u327 = {}
    end
    if u250 and u173 and u173.Parent then
        if u173.Enabled then
            for i, v in ipairs(u318) do
                if v.Parent then
                    v.Enabled = true
                end
            end
            if u320 then
                u320:Disconnect()
                u320 = nil
            end
            if u321 then
                u321:Disconnect()
                u321 = nil
            end
            u318 = {}
        end
        u173.Enabled = false
    end
    if u249 then
        if u162 and u162.Parent then
            u162.Enabled = false
        end
        u330 = false
        u331 = false
    end
    u371.StopCapture()
    RunService:UnbindFromRenderStep("Freecam")
    u175.Pop()
end
u549 = false
function ToggleFreecam() -- Line: 1404 -- upvalues: u549 (ref), StopFreecam (val), StartFreecam (val), u251 (ref), u0 (val)
    if not u549 then
        StartFreecam()
    else
        StopFreecam()
    end
    u549 = not u549
    if u251 then
        u0:SetAttribute("FreecamEnabled", u549)
    end
end
function CheckMacro(p1) -- Line: 1416 -- upvalues: UserInputService (val), ToggleFreecam (val)
    local v1 = #p1 - 1
    local v2 = 1
    for i = 1, v1, v2 do
        if not (UserInputService:IsKeyDown(p1[i])) then
            return
        end
    end
    ToggleFreecam()
end
u462 = "FreecamToggle"
ContextActionService:BindActionAtPriority(u462, function(p1, p2, p3) -- Line: 1425 -- upvalues: u261 (val), CheckMacro (val)
    if p2 == Enum.UserInputState.Begin and p3.KeyCode == u261[#u261] then
        CheckMacro(u261)
    end
    return Enum.ContextActionResult.Pass
end, false, Enum.ContextActionPriority.Low.Value, u261[#u261])
if u251 then
    u0:SetAttribute("FreecamEnabled", u549)
    AttributeChangedSignal = u0:GetAttributeChangedSignal("FreecamEnabled")
    function u462() -- Line: 1438 -- upvalues: u0 (val), u549 (ref), StartFreecam (val), StopFreecam (val)
        local Attribute = u0:GetAttribute("FreecamEnabled")
        if typeof(Attribute) ~= "boolean" then
            u0:SetAttribute("FreecamEnabled", u549)
            return
        end
        if Attribute == u549 then
            return
        end
        if Attribute then
            StartFreecam()
            u549 = true
            return
        end
        StopFreecam()
        u549 = false
    end
    AttributeChangedSignal:Connect(u462)
elseif u187 then
    u0:SetAttribute("FreecamEnabled", u549)
    AttributeChangedSignal = u0:GetAttributeChangedSignal("FreecamEnabled")
    function u462() -- Line: 1438 -- upvalues: u0 (val), u549 (ref), StartFreecam (val), StopFreecam (val)
        local Attribute = u0:GetAttribute("FreecamEnabled")
        if typeof(Attribute) ~= "boolean" then
            u0:SetAttribute("FreecamEnabled", u549)
            return
        end
        if Attribute == u549 then
            return
        end
        if Attribute then
            StartFreecam()
            u549 = true
            return
        end
        StopFreecam()
        u549 = false
    end
    AttributeChangedSignal:Connect(u462)
end
return {}