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
--    File: ReplicatedStorage.Client.User.Miscellaneous.Anxiety.ClientAnxietyHandler
--                               Dumped in 0.00254 seconds
--                          Bytecode version 9  |  24 functions

local u272, u275
local u0 = script
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Player = require(Namespaces:WaitForChild("Player"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Network_2 = Common_2:WaitForChild("Network")
local Namespaces_2 = Network_2:WaitForChild("Namespaces")
local Server = require(Namespaces_2:WaitForChild("Server"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_3:WaitForChild("Client")
local Progression = Client:WaitForChild("Progression")
local ClientAttributesHandler = require(Progression:WaitForChild("ClientAttributesHandler"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Constants = require(Common_3:WaitForChild("Constants"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_5:WaitForChild("Common")
local Utilities = Common_4:WaitForChild("Utilities")
local Shake = require(Utilities:WaitForChild("Shake"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_6:WaitForChild("Common")
local Signals = require(Common_5:WaitForChild("Signals"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_7:WaitForChild("Common")
local Utilities_2 = Common_6:WaitForChild("Utilities")
local Table = require(Utilities_2:WaitForChild("Table"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_8:WaitForChild("Packages")
local trove = require(Packages:WaitForChild("trove"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Common_7 = ReplicatedStorage_9:WaitForChild("Common")
local Utilities_3 = Common_7:WaitForChild("Utilities")
local Sounds = require(Utilities_3:WaitForChild("Sounds"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Common_8 = ReplicatedStorage_10:WaitForChild("Common")
local Sounds_2 = Common_8:WaitForChild("Sounds")
local Universal = require(Sounds_2:WaitForChild("Universal"))
local u208 = {}
local u210 = trove.new()
local u211 = false
local u212 = 0
local ReplicatedStorage_11 = game:GetService("ReplicatedStorage")
local Common_9 = ReplicatedStorage_11:WaitForChild("Common")
local Statistics = Common_9:WaitForChild("Statistics")
local useCameraTilt = require(Statistics:WaitForChild("useCameraTilt"))
local ReplicatedStorage_12 = game:GetService("ReplicatedStorage")
local Common_10 = ReplicatedStorage_12:WaitForChild("Common")
local Statistics_2 = Common_10:WaitForChild("Statistics")
local useFieldOfView = require(Statistics_2:WaitForChild("useFieldOfView"))
local ReplicatedStorage_13 = game:GetService("ReplicatedStorage")
local Common_11 = ReplicatedStorage_13:WaitForChild("Common")
local Utilities_4 = Common_11:WaitForChild("Utilities")
local State = require(Utilities_4:WaitForChild("State"))
_, u272 = useFieldOfView()
_, u275 = useCameraTilt()
local u276 = {server = {}, client = {}}
local function addClientAnxiety(p1, p2) -- Line: 83 -- upvalues: ClientAttributesHandler (val), Signals (val), u212 (ref)
    local v1 = p1 * ClientAttributesHandler.getAttribute("AnxietyResistanceMultiplier")
    Signals.Anxiety:Fire(v1)
    if 20 <= v1 then
        local v2 = u212 + v1
        if 60 <= v2 then end
    end
end
local function onBeginAnxietyEffects() -- Line: 114 -- upvalues: u211 (ref), Lighting (val), State (val), u212 (ref), Sounds (val), Universal (val), u272 (val), u275 (val), Shake (val), u210 (val), RunService (val)
    u211 = true
    local ColorCorrectionEffect = Instance.new("ColorCorrectionEffect")
    ColorCorrectionEffect.Name = "__RequiemAnxietyEffectColor"
    ColorCorrectionEffect.Parent = Lighting
    local DepthOfFieldEffect = Instance.new("DepthOfFieldEffect")
    DepthOfFieldEffect.Name = "__RequiemAnxietyEffectDepth"
    DepthOfFieldEffect.Enabled = false
    DepthOfFieldEffect.FarIntensity = 0
    DepthOfFieldEffect.NearIntensity = 0
    DepthOfFieldEffect.FocusDistance = 0
    DepthOfFieldEffect.InFocusRadius = 40
    DepthOfFieldEffect.Parent = Lighting
    local u16 = 0
    local u17 = 0
    local u18 = nil
    local u19 = nil
    local u20 = nil
    local u21 = false
    local u22 = nil
    local u23 = nil
    local function onHandleBlink(p1, p2) -- Line: 145 -- upvalues: State (upval), u212 (upval), u21 (ref)
        local blink = State("blink")
        if 80 >= u212 then
            if u21 and u212 < 80 then
                u21 = false
                blink({enabled = false, frequency = 0, speed = 0})
            end
            return
        end
        if not u21 then
            u21 = true
            blink({enabled = true, speed = 0.5, frequency = NumberRange.new(1, 3)})
            return
        end
        if u21 and u212 < 80 then
            u21 = false
            blink({enabled = false, frequency = 0, speed = 0})
        end
    end
    local function onHandleHeartbeat(p1, p2) -- Line: 168 -- upvalues: u212 (upval), u18 (ref), Sounds (upval), Universal (upval)
        if 50 >= u212 then
            if u18 then
                u18:Stop()
                u18 = nil
            end
            return
        end
        if not u18 then
            u18 = Sounds.playGlobalSoundEffect(Universal.Anxiety.Heartbeat, 2, 0)
            return
        end
        u18.Looped = true
        local v1 = math.clamp((u212 - 50) / 50, 0, 1) * 4
        u18.Volume = math.lerp(u18.Volume, v1, p2)
    end
    local function onHandleHyperVentilation(p1, p2) -- Line: 186 -- upvalues: u212 (upval), u20 (ref), Sounds (upval), Universal (upval)
        if 80 >= u212 then
            if u20 then
                u20:Stop()
                u20 = nil
            end
            return
        end
        if u20 then
            local v1 = math.clamp((u212 - 80) / 20, 0, 1) * 0.4
            u20.Volume = math.lerp(u20.Volume, v1, p2)
            return
        end
        if math.random() < 0.02 then
            return
        end
        u20 = Sounds.playGlobalSoundEffect(Universal.Anxiety.HyperVentilation, 2, 0, nil, NumberRange.new(0.8, 1.2))
        task.delay(18, function() -- Line: 203 -- upvalues: u20 (upval)
            if u20 then
                u20:Destroy()
            end
            u20 = nil
        end)
    end
    local function onHandleHaunt(p1, p2) -- Line: 225 -- upvalues: u19 (ref), u212 (upval), Sounds (upval), Universal (upval)
        if u19 then
            return
        end
        if 60 < u212 and math.random() < 0.02 then
            local v1 = math.clamp((u212 - 60) / 40, 0, 1)
            local v2 = v1 * (math.random() * 0.5 + 0.3)
            local u32 = Sounds.playGlobalSoundEffect(Universal.Anxiety.Haunt, 0.1, v2 / 2, nil, NumberRange.new(0.2, 1.2))
            task.delay(10, function() -- Line: 236 -- upvalues: u32 (val), u19 (upval)
                u32:Destroy()
                u19 = nil
            end)
            u19 = u32
        end
    end
    local function onHandleLighting(p1, p2) -- Line: 248 -- upvalues: u212 (upval), ColorCorrectionEffect (val)
        if 50 >= u212 then
            ColorCorrectionEffect.Saturation = math.lerp(ColorCorrectionEffect.Saturation, 0, p2)
            ColorCorrectionEffect.Brightness = math.lerp(ColorCorrectionEffect.Brightness, 0, p2)
            ColorCorrectionEffect.Contrast = math.lerp(ColorCorrectionEffect.Contrast, 0, p2)
            return
        end
        local v1 = math.clamp((u212 - 50) / 50, 0, 1)
        local v2 = math.lerp(0, -1.05, v1)
        ColorCorrectionEffect.Saturation = math.lerp(ColorCorrectionEffect.Saturation, v2, p2)
        v2 = math.lerp(0, -0.2, v1)
        ColorCorrectionEffect.Brightness = math.lerp(ColorCorrectionEffect.Brightness, v2, p2)
        v2 = math.lerp(0, -0.2, v1)
        ColorCorrectionEffect.Contrast = math.lerp(ColorCorrectionEffect.Contrast, v2, p2)
    end
    local function onHandleBlur(p1, p2) -- Line: 268 -- upvalues: u212 (upval), u16 (ref), DepthOfFieldEffect (val)
        if 65 >= u212 then
            DepthOfFieldEffect.Enabled = false
            return
        end
        local v1 = math.clamp((u212 - 65) / 35, 0, 1)
        u16 = u16 + p1
        local v2 = math.sin(u16 + math.pi * 1.5) + 1
        DepthOfFieldEffect.FarIntensity = v2 * v1 / 2
        DepthOfFieldEffect.Enabled = true
    end
    local function onHandleFieldOfView(p1, p2) -- Line: 284 -- upvalues: u212 (upval), u22 (ref), u23 (ref), u17 (ref), u272 (upval), u275 (upval)
        if 80 >= u212 then
            if u22 then
                if u22 then
                    u22()
                    u22 = nil
                end
                if u23 then
                    u23()
                    u23 = nil
                end
            elseif not u23 then
            end
            return
        elseif workspace.CurrentCamera then
            if u22 then
                u22()
            end
            if u23 then
                u23()
            end
            local v1 = math.clamp((u212 - 80) / 20, 0, 1)
            u17 = u17 + p1
            local v2 = math.sin(u17 * 2)
            u22 = u272("anxiety", v2 * 7 * v1 + 70, "set", 20)
            u23 = u275("anxiety", v2 * 12 * v1, "set", 20)
            return
        end
    end
    local function onHandleShake(p1, p2) -- Line: 321 -- upvalues: u212 (upval), Shake (upval)
        local CurrentCamera = workspace.CurrentCamera
        if 80 < u212 then
            local v1 = math.clamp((u212 - 80) / 20, 0, 1) * 0.0225
            local v2 = Shake.new()
            v2.FadeInTime = v1
            v2.FadeOutTime = v1
            v2.Frequency = v1
            v2.Amplitude = v1
            v2.PositionInfluence = Vector3.new(v1, v1, v1)
            v2:Start()
            v2:BindToRenderStep(Shake.NextRenderName(), Enum.RenderPriority.Last.Value, function(p1, p2) -- Line: 340 -- upvalues: CurrentCamera (val)
                if CurrentCamera then
                    local v1 = CurrentCamera
                    local v2 = CFrame.new(p1)
                    v1.CFrame = v1.CFrame * (v2 * CFrame.Angles(p2.X, p2.Y, p2.Z))
                end
            end)
        end
    end
    u210:Add(RunService.RenderStepped:Connect(function(p1) -- Line: 348 -- upvalues: onHandleLighting (val), onHandleBlink (val), onHandleHeartbeat (val), onHandleHyperVentilation (val), onHandleHaunt (val), onHandleBlur (val), onHandleFieldOfView (val), onHandleShake (val)
        local v1 = p1 * 10
        onHandleLighting(p1, v1)
        onHandleBlink(p1, v1)
        onHandleHeartbeat(p1, v1)
        onHandleHyperVentilation(p1, v1)
        onHandleHaunt(p1, v1)
        onHandleBlur(p1, v1)
        onHandleFieldOfView(p1, v1)
        onHandleShake(p1, v1)
    end))
    u210:Add(function() -- Line: 377 -- upvalues: u18 (ref), u19 (ref), u20 (ref)
        if u18 then
            u18:Destroy()
            u18 = nil
        end
        if u19 then
            u19:Destroy()
            u19 = nil
        end
        if u20 then
            u20:Destroy()
            u20 = nil
        end
    end)
    u210:Add(DepthOfFieldEffect)
    u210:Add(ColorCorrectionEffect)
end
RunService.RenderStepped:Connect(function(p1) -- Line: 519 -- upvalues: u276 (val), u212 (ref), addClientAnxiety (val)
    if #u276.server ~= 0 then
        local v1, v2
        local v3 = 0
        local v4 = p1
        for k, v in pairs(u276) do
            for k2, i in pairs(v) do
                if not i.__total then
                    v1 = i.amount * v4
                    if not i.maximum then
                        i.__total = (i.__total or 0) + v1
                        v3 = v3 + v1
                    else
                        v2 = i.maximum - (u212 + v3)
                        if v2 > 0 then
                            v1 = math.min(v1, v2)
                        end
                    end
                elseif i.impact and i.impact <= i.__total then
                end
            end
        end
        addClientAnxiety((math.clamp(v3, 0, 100)))
        return
    elseif #u276.client == 0 then
        return
    end
end)
Signals.OnAnxietyChanged:Connect(function(p1) -- Line: 493 -- upvalues: u212 (ref), u210 (val), u211 (ref), onBeginAnxietyEffects (val)
    u212 = p1
    if p1 == 0 then
        u210:Clean()
        u211 = false
        return
    end
    if u211 then
        return
    end
    onBeginAnxietyEffects()
end)
Player.Anxiety.listen(function(p1) -- Line: 404 -- upvalues: u276 (val)
    u276.server = p1
end)
return {
    addClientAnxiety = addClientAnxiety,
    addClientAdjustment = function(p1) -- Line: 445 -- upvalues: Table (val), u276 (val), Signals (val)
        if not p1.key then
            table.insert(u276.client, p1)
        else
            local v1
            v1 = Table.find(u276.client, function(a1) -- Line: 448 -- upvalues: p1 (val)
                local v1 = a1.key == p1.key
                return v1
            end)
            if not v1 then
                table.insert(u276.client, p1)
            else
                p1.__total = u276.client[v1].__total
                u276.client[v1] = p1
            end
        end
        if p1.reason then
            task.delay(0.5, function() -- Line: 466 -- upvalues: Signals (upval), p1 (val)
                Signals.Monologue:Fire(p1.reason, "Shake")
            end)
        end
        return p1
    end,
    removeClientAdjustment = function(p1) -- Line: 479 -- upvalues: u276 (val)
        local v1 = table.find(u276.client, p1)
        if not v1 then
            return
        end
        table.remove(u276.client, v1)
    end,
    onAttemptAnxietyVerification = function(p1, ...) -- Line: 413 -- upvalues: Server (val), Constants (val), u208 (val), u0 (val)
        local v1, v2
        local v3 = Server.Store.client()
        if not v3 then
            return
        end
        if v3.event == 1 then
            v1 = u208[p1]
            if not v1 then
                v2 = require(u0.Parent.Verifiable:FindFirstChild(p1, true))
                u208[p1] = {verify = v2.verify}
            end
            v1.verify(...)
            return
        end
        if game.PlaceId ~= Constants.Places.Development then
            return
        end
        v1 = u208[p1]
        if not v1 then
            v2 = require(u0.Parent.Verifiable:FindFirstChild(p1, true))
            u208[p1] = {verify = v2.verify}
        end
        v1.verify(...)
    end,
}