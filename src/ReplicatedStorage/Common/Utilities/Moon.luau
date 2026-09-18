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
--                     File: ReplicatedStorage.Common.Utilities.Moon
--                               Dumped in 0.00384 seconds
--                          Bytecode version 9  |  15 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local CollectionService = game:GetService("CollectionService")
local ContentProvider = game:GetService("ContentProvider")
local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Workspace = game:GetService("Workspace")
local Sounds_2 = v1.Parent.Parent:WaitForChild("Sounds")
local Impacts = require(Sounds_2:WaitForChild("Impacts"))
local Signals = require(v1.Parent.Parent:WaitForChild("Signals"))
local Sounds = require(v1.Parent:WaitForChild("Sounds"))
local State = require(v1.Parent:WaitForChild("State"))
local Cutscenes = require(v1.Parent.Parent:WaitForChild("Logger"))("Cutscenes")
local u92 = {cancelled = false, connections = {}}
local function fadeOutExistingCutsceneAudio() -- Line: 47 -- upvalues: Workspace (val), TweenService (val)
    local CUTSCENE_AUDIO = Workspace:FindFirstChild("CUTSCENE_AUDIO")
    if not CUTSCENE_AUDIO or not (CUTSCENE_AUDIO:IsA("Sound")) then
        return
    end
    local v1 = TweenInfo.new(10)
    local v2 = TweenService:Create(CUTSCENE_AUDIO, v1, {Volume = 0})
    v2:Play()
    v2.Completed:Once(function() -- Line: 55 -- upvalues: CUTSCENE_AUDIO (val)
        CUTSCENE_AUDIO:Destroy()
    end)
end
local Deep = Impacts.Boom.Deep
local function getCharacterFocus() -- Line: 75 -- upvalues: Players (val)
    local LocalPlayer = Players.LocalPlayer
    if LocalPlayer then
        LocalPlayer = Players.LocalPlayer.Character
    end
    local HumanoidRootPart = LocalPlayer
    if HumanoidRootPart then
        HumanoidRootPart = LocalPlayer:FindFirstChild("HumanoidRootPart")
    end
    if not HumanoidRootPart then
        return nil
    end
    return HumanoidRootPart.Position + Vector3.new(0, 1.5, 0)
end
local function getSkyRaycastExclude(p1) -- Line: 91 -- upvalues: Players (val), CollectionService (val)
    local v1 = {p1}
    local LocalPlayer = Players.LocalPlayer
    if LocalPlayer then
        LocalPlayer = Players.LocalPlayer.Character
    end
    if LocalPlayer then
        table.insert(v1, LocalPlayer)
    end
    for i, j in CollectionService:GetTagged("Alive") do
        table.insert(v1, j)
    end
    return v1
end
local function sampleHighestPoint(p1, p2) -- Line: 112 -- upvalues: getSkyRaycastExclude (val), Workspace (val)
    local v1, v2, v3, v4
    local v5 = RaycastParams.new()
    v5.FilterType = Enum.RaycastFilterType.Exclude
    v5.FilterDescendantsInstances = getSkyRaycastExclude(p2)
    local v6 = Vector3.new(0, -12000, 0)
    local Y = p1.Y
    local v7 = 1
    local v8 = 1
    local v9 = p1
    for i = -1, v7, v8 do
        v3 = 1
        v4 = 1
        for j = -1, v3, v4 do
            v1 = Vector3.new(v9.X + i * 48, v9.Y + 5000, v9.Z + j * 48)
            v2 = Workspace:Raycast(v1, v6, v5)
            if v2 and Y < v2.Position.Y then
                Y = v2.Position.Y
            end
        end
    end
    return Y
end
local function runSkyTransition(p1, p2) -- Line: 144 -- upvalues: Workspace (val), getCharacterFocus (val), sampleHighestPoint (val), Sounds (val), Deep (val), u92 (val)
    local v1, v2
    local CurrentCamera = Workspace.CurrentCamera
    local v3 = getCharacterFocus()
    if not CurrentCamera then
        return false
    end
    CurrentCamera.CameraType = Enum.CameraType.Scriptable
    if not v3 then
        CurrentCamera.CFrame = p1.CFrame
        return false
    end
    local v4 = v3 + Vector3.new(0, 80, 0)
    CurrentCamera.CFrame = CFrame.lookAt(v4, v3)
    local v5 = sampleHighestPoint(v3, p2)
    local v6 = Vector3.new(v3.X, v5, v3.Z)
    local v7 = 3
    local v8 = 1
    for i = 1, v7, v8 do
        v1 = v6 + Vector3.new(0, i / 3 * 1500, 0)
        CurrentCamera.CFrame = CFrame.lookAt(v1, v3)
        v2 = (i - 1) * 0.08 + 0.85
        Sounds.playGlobalSoundEffect(Deep, 0.05, ((i - 1) * 0.1 + 0.35) * 3, 4, NumberRange.new(v2, v2 + 0.1))
        task.wait(1)
        if u92.cancelled then
            return false
        end
    end
    CurrentCamera.CFrame = p1.CFrame
    return true
end
return {
    onRunMoonCutscene = function(p1, p2, p3, p4, p5, p6, p7, p8, p9) -- Line: 202 -- upvalues: u92 (val), fadeOutExistingCutsceneAudio (val), State (val), Lighting (val), ContentProvider (val), RunService (val), TweenService (val), Workspace (val), runSkyTransition (val), Signals (val)
        local Animation, AnimationController, Humanoid, u845, u863, u881, u899, v1, v2, v3, v4, v5, v6, v7, v8, v9
        local v10 = os.clock()
        u92.cancelled = false
        u92.sound = nil
        fadeOutExistingCutsceneAudio()
        local v11 = if p9 ~= nil then string.lower(p9) == "sky" else false
        local v12 = if p7 ~= nil then 0 < p7 else false
        local black = State("black")
        if not p6 and not v11 then
            black({enabled = true, tween = TweenInfo.new(0.5)})
        end
        local u944 = p1.Map:Clone()
        u944.Parent = workspace
        local u953 = {}
        local u962 = {}
        local u971 = {}
        local u978 = {}
        local u987 = {}
        local u996 = nil
        local u999 = {}
        local u1006 = {}
        local u1014 = {}
        for i, j in p1.Scripts:GetChildren() do
            v2 = tonumber(j.Name) or 0
            u962[v2] = require(j)
        end
        local FieldOfView = p1:FindFirstChild("FieldOfView")
        if FieldOfView then
            local NumberValue, Values, v13
            for k, n in FieldOfView:GetChildren() do
                Values = n:FindFirstChild("Values")
                if Values then
                    NumberValue = Values:FindFirstChildWhichIsA("NumberValue")
                    if NumberValue then
                        v13 = tonumber(n.Name) or 0
                        u978[v13] = NumberValue.Value
                    end
                end
            end
        end
        local Lighting_2 = p1:FindFirstChild("Lighting")
        if not Lighting_2 then
            u845, v1, u863, v7, u881, v9, u899 = p2, p3, p4, p5, p6, p7, p8
        else
            local NumberValue_2, Values_2, v14
            u845, v1, u863, v7, u881, v9, u899 = p2, p3, p4, p5, p6, p7, p8
            for k2, v in pairs(Lighting_2:GetChildren()) do
                u999[v.Name] = {}
                for m, i5 in v:GetChildren() do
                    v5 = u999[v.Name]
                    v5[i5.Name] = {}
                    for i6, i7 in i5:GetChildren() do
                        Values_2 = i7:FindFirstChild("Values")
                        if Values_2 then
                            NumberValue_2 = Values_2:FindFirstChildWhichIsA("NumberValue")
                            if NumberValue_2 then
                                v8 = u999[v.Name][i5.Name]
                                v14 = tonumber(i7.Name) or 0
                                v8[v14] = NumberValue_2.Value
                            end
                        end
                    end
                end
            end
        end
        for k3 in pairs(u999) do
            v3 = {}
            u1014[k3] = v3
            if k3 ~= "Lighting" then
                v3 = Instance.new(k3)
                if v3 then
                    v3.Parent = Lighting
                end
            else
                v3 = Lighting
            end
            if v3 then
                u1006[k3] = v3
                for k4, i8 in pairs(u999[k3]) do
                    u1014[k3][k4] = {}
                    if i8[0] then
                        v3[k4] = i8[0]
                    end
                end
            end
        end
        local u200 = false
        local u201 = 0
        local CamPart = u944:FindFirstChild("CamPart", true)
        local Sound = u944:FindFirstChildWhichIsA("Sound")
        if Sound then
            ContentProvider:PreloadAsync({Sound})
        end
        local u219 = false
        local u220 = 0
        local function applySkipAhead(p1, p2) -- Line: 353 -- upvalues: u962 (val), u953 (val), u944 (val), u978 (val), u987 (val), u881 (val), u999 (val), u1006 (val), u1014 (val), u971 (val), Sound (ref), u219 (ref), u201 (ref), u220 (ref), CamPart (val)
            local v1, v2, v3, v4, v5, v6, v7, v8
            local v9 = {}
            local v10 = u962
            local v11 = nil
            local v12 = nil
            for i in v10, v11, v12 do
                table.insert(v9, i)
            end
            table.sort(v9)
            v10 = v9
            v11 = nil
            v12 = nil
            for j, k in v10, v11, v12 do
                if k <= p2 and not (u953[math.floor(k)]) then
                    u962[k](u944)
                    v8 = math.floor(k)
                    u953[v8] = true
                end
            end
            v10 = u978
            v11 = nil
            v12 = nil
            for n in v10, v11, v12 do
                if n <= p2 then
                    v8 = math.floor(n)
                    u987[v8] = true
                end
            end
            v10 = nil
            v11 = nil
            v12 = nil
            local v13 = nil
            local v14 = u978
            local v15 = nil
            v8 = nil
            v2, v1 = p2, p1
            for m, i5 in v14, v15, v8 do
                if m > v2 then
                    if not v12 then
                        v12 = m
                        v13 = i5
                    elseif m >= v12 then
                    end
                elseif not v10 then
                    v10 = m
                    v11 = i5
                elseif v10 > m then
                end
            end
            if v11 then
                v14 = if v10 and v12 and v13 and v10 < v12 then v11 + (v13 - v11) * ((v2 - v10) / (v12 - v10)) else v11
                if not u881 then
                    workspace.CurrentCamera.FieldOfView = v14
                end
            end
            for k2, v in pairs(u999) do
                v3 = u1006[k2]
                if v3 then
                    for k3, i6 in pairs(v) do
                        v4 = nil
                        v5 = nil
                        for k4, i7 in pairs(i6) do
                            if k4 <= v2 then
                                if not v4 then
                                    v4 = k4
                                    v5 = i7
                                elseif v4 > k4 then
                                end
                            end
                            if k4 <= v2 then
                                if not (u1014[k2][k3]) then
                                    v6 = u1014[k2]
                                    v6[k3] = {}
                                end
                                v6 = u1014[k2][k3]
                                v7 = math.floor(k4)
                                v6[v7] = true
                            end
                        end
                        if v5 then
                            v3[k3] = v5
                        end
                    end
                end
            end
            v14 = u971
            v15 = nil
            v8 = nil
            for i8, i9 in v14, v15, v8 do
                i9.TimePosition = v1
            end
            if Sound then
                v14 = v1 * Sound.PlaybackSpeed
                if not u219 then
                    Sound.TimePosition = v14
                else
                    Sound.TimePosition = Sound.TimeLength - v14
                end
            end
            u201 = v2
            u220 = v1
            if CamPart and not u881 then
                workspace.CurrentCamera.CFrame = CamPart.CFrame
            end
        end
        local v15 = RunService.RenderStepped:Connect(function(p1) -- Line: 454 -- upvalues: u200 (ref), u220 (ref), CamPart (val), u881 (val), u219 (ref), Sound (ref), u201 (ref), u845 (val), u962 (val), u953 (val), u944 (val), u978 (val), u987 (val), u996 (ref), TweenService (upval), u999 (val), u1006 (val), u1014 (val)
            local v1, v2, v3, v4, v5, v6, v7, v8, v9
            if not u200 then
                return
            end
            u220 = u220 + p1
            if CamPart and not u881 then
                workspace.CurrentCamera.CFrame = CamPart.CFrame
            end
            if u219 and Sound then
                Sound.TimePosition = Sound.TimeLength - u220 * Sound.PlaybackSpeed
            end
            u201 = u201 + p1 * u845
            local v10 = u962
            local v11 = nil
            local v12 = nil
            for i, j in v10, v11, v12 do
                if i < u201 then
                    if not (u953[math.floor(i)]) then
                        j(u944)
                        v7 = math.floor(i)
                        u953[v7] = true
                    end
                elseif math.floor(u201) ~= i then
                end
            end
            v10 = u978
            v11 = nil
            v12 = nil
            for k, n in v10, v11, v12 do
                if k < u201 then
                    if not (u987[math.floor(k)]) then
                        if u996 then
                            u996:Cancel()
                            u996 = nil
                        end
                        v6 = nil
                        v7 = u978
                        v8 = nil
                        v9 = nil
                        for m, i5 in v7, v8, v9 do
                            if k < m then
                                if not v6 then
                                    v6 = m
                                elseif m >= v6 then
                                end
                            end
                        end
                        if not v6 then
                            v7 = 0.5
                        else
                            v7 = (v6 - k) / u845
                        end
                        v8 = TweenInfo.new(v7, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
                        v9 = TweenService:Create(workspace.CurrentCamera, v8, {FieldOfView = n})
                        v9:Play()
                        u996 = v9
                        v1 = math.floor(k)
                        u987[v1] = true
                    end
                elseif math.floor(u201) ~= k then
                end
            end
            for k2, v in pairs(u999) do
                v6 = u1006[k2]
                if v6 then
                    for k3, i6 in pairs(v) do
                        for k4, i7 in pairs(i6) do
                            v2 = u1014[k2]
                            if v2 then
                                v2 = u1014[k2][k3]
                            end
                            if not v2 then
                                v3 = false
                            else
                                v3 = v2[math.floor(k4)]
                            end
                            if k4 < u201 then
                                if not v3 then
                                    v6[k3] = i7
                                    if not (u1014[k2][k3]) then
                                        v4 = u1014[k2]
                                        v4[k3] = {}
                                    end
                                    v4 = u1014[k2][k3]
                                    v5 = math.floor(k4)
                                    v4[v5] = true
                                end
                            elseif math.floor(u201) ~= k4 then
                            end
                        end
                    end
                end
            end
        end)
        table.insert(u92.connections, v15)
        for i9, i10 in u944:GetChildren() do
            if i10:IsA("Model") and i10:FindFirstChildWhichIsA("Animation") then
                Animation = i10:FindFirstChildWhichIsA("Animation")
                ContentProvider:PreloadAsync({Animation})
                v6 = nil
                Humanoid = i10:FindFirstChildWhichIsA("Humanoid")
                AnimationController = i10:FindFirstChildWhichIsA("AnimationController")
                if not Humanoid then
                    if AnimationController and AnimationController:FindFirstChildWhichIsA("Animator") then
                        v6 = AnimationController:FindFirstChildWhichIsA("Animator")
                    end
                elseif Humanoid:FindFirstChildWhichIsA("Animator") then
                    v6 = Humanoid:FindFirstChildWhichIsA("Animator")
                end
                if v6 then
                    v8 = v6:LoadAnimation(Animation)
                    table.insert(u971, v8)
                end
            end
        end
        for i11, i12 in u944:GetDescendants() do
            if i12:IsA("ImageLabel") then
                ContentProvider:PreloadAsync({i12})
            end
        end
        task.wait(v1 - workspace:GetServerTimeNow())
        if u92.cancelled then
            return
        end
        if CamPart and not u881 then
            workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable
        end
        if Sound then
            v4 = Sound:Clone()
            v4.Name = "CUTSCENE_AUDIO"
            v4.Parent = Workspace
            Sound = v4
            if not (Sound:GetAttribute("Reverse")) then end
            Sound:Play()
            u92.sound = Sound
        end
        v4 = u971
        local v16 = nil
        v5 = nil
        for i13, i14 in v4, v16, v5 do
            i14:Play()
            table.insert(u92.connections, i14.KeyframeReached:Connect(function(p1) -- Line: 618 -- upvalues: u92 (upval), u863 (val), u944 (val)
                if u92.cancelled then
                    return
                end
                u863(p1, u944)
            end))
        end
        v4 = false
        if v12 then
            applySkipAhead(v9, v9 * u845)
        end
        if u881 then
            if u899 then
                task.spawn(function() -- Line: 646 -- upvalues: u899 (val), u944 (val)
                    u899(u944)
                end)
            end
            if not u881 then
                if not v4 then
                    black({enabled = false, tween = TweenInfo.new(0.5)})
                    Signals.Bars:Fire(0.25, 0)
                else
                    Signals.Bars:Fire(0.25, 0)
                end
            end
            local Length = 0
            v5 = u971
            local v17 = nil
            local v18 = nil
            for i15, i16 in v5, v17, v18 do
                if not i16.Length then
                    while true do
                        task.wait()
                        if 0 < i16.Length then
                            break
                        end
                    end
                end
                if Length < i16.Length then
                    Length = i16.Length
                end
            end
            task.wait((math.max(0, Length - 0.75 - (v9 or 0))))
            if u92.cancelled then
                return
            end
            if v7 then
                v7()
            end
            if not u881 then
                black({enabled = true, tween = TweenInfo.new(0.5)})
            end
            task.wait(1)
            if u92.cancelled then
                return
            end
            if u996 then
                u996:Cancel()
            end
            for k5, i17 in pairs(u1006) do
                if k5 ~= "Lighting" and i17 and i17.Parent == Lighting then
                    i17:Destroy()
                end
            end
            v15:Disconnect()
            u944:Destroy()
            task.defer(function() -- Line: 716
                workspace.CurrentCamera.FieldOfView = 70
            end)
            if not u881 then
                workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
            end
            if not u881 then
                black({enabled = false, tween = TweenInfo.new(0.5)})
                Signals.Bars:Fire(0, 0)
            end
            print(os.clock() - v10)
            return
        elseif v11 and CamPart and not v12 then
            v4 = runSkyTransition(CamPart, u944)
            if u92.cancelled then
                return
            end
        end
    end,
    onPreloadMoonCutscene = function(p1) -- Line: 741 -- upvalues: Cutscenes (val), ContentProvider (val)
        for i, j in p1:GetDescendants() do
            if j:IsA("Animation") then
                Cutscenes.info((("Preloading cutscene asset: %*"):format(j.Name)))
                ContentProvider:PreloadAsync({j})
            elseif not (j:IsA("Sound")) and not (j:IsA("ImageLabel")) then
            end
        end
        Cutscenes.info("Successfully preloaded cutscene...")
        return nil
    end,
    onCancelMoonCutscene = function() -- Line: 760 -- upvalues: u92 (val), TweenService (val)
        u92.cancelled = true
        if u92.sound then
            local v1 = TweenInfo.new(0.5)
            TweenService:Create(u92.sound, v1, {Volume = 0}):Play()
        end
        local connections = u92.connections
        local v2 = nil
        local v3 = nil
        for i, j in connections, v2, v3 do
            j:Disconnect()
        end
    end,
}