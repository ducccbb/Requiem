--!nocheck
-- =========================================================================
-- ⚔️ REQUIEM PVP COMBAT CORE MODULE
-- Tác giả: Luna Interface Suite x Antigravity
-- Tính năng:
--   1. Auto Parry Melee (Sabre, Knife, Baton, Axe)
--   2. Auto Parry Blades (Song kiếm ODMG Ground/Air/Stances)
--   3. Auto Counter-Attack (Phản kích tức thời sau khi đỡ đòn)
--   4. Auto Evade Firearms (Pre-emptive Aim Dodge + On-Fire Reaction)
--   5. Multi-Threat Crossfire Escape (Bẻ gãy góc kẹp đạn của nhiều xạ thủ)
--   6. Sprint + Crouch Slide / Dive Native Simulation (Shift + C)
--   7. Attribute Spoofing (Blade Reach & Damage Multipliers)
-- =========================================================================

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualInputManager = game:GetService("VirtualInputManager")
local StarterGui = game:GetService("StarterGui")

local LocalPlayer = Players.LocalPlayer

-- Khởi tạo Handler game Requiem
local ClientStateHandler = nil
local CharacterCombatHandler = nil
local CombatNamespace = nil
local GearNamespace = nil
local ClientAttributesHandler = nil

pcall(function()
    local Common = ReplicatedStorage:WaitForChild("Common", 3)
    if Common then
        local Handlers = Common:WaitForChild("Handlers", 3)
        if Handlers then
            pcall(function() ClientStateHandler = require(Handlers:WaitForChild("ClientStateHandler", 2)) end)
            pcall(function() CharacterCombatHandler = require(Handlers:WaitForChild("CharacterCombatHandler", 2)) end)
            pcall(function() ClientAttributesHandler = require(Handlers:WaitForChild("ClientAttributesHandler", 2)) end)
        end
        local Signals = Common:WaitForChild("Signals", 3)
        if Signals then
            pcall(function()
                local sig = require(Signals)
                if sig and sig.Combat then CombatNamespace = sig.Combat end
                if sig and sig.Gear then GearNamespace = sig.Gear end
            end)
        end
    end
end)

-- =========================================================================
-- DANH MỤC ANIMATION ID THỰC TẾ TRONG REQUIEM
-- =========================================================================

-- Cận chiến (Sabre, Dao găm, Dùi cui, Rìu)
local MELEE_SWING_ANIM_IDS = {
    -- Sabre Swings (src/ReplicatedStorage/Common/Animations/Tools/Sabre.luau)
    ["rbxassetid://112666168396669"] = "Sabre Swing 1",
    ["rbxassetid://86140055867484"] = "Sabre Swing 2",
    ["rbxassetid://124361532701064"] = "Sabre Swing 3",
    ["rbxassetid://136621055776523"] = "Sabre Swing 4",
    -- Combat Knife Swings (src/ReplicatedStorage/Common/Animations/Tools/Knife.luau)
    ["rbxassetid://82666636655771"] = "Knife Swing 1",
    ["rbxassetid://75659520618730"] = "Knife Swing 2",
    ["rbxassetid://89635808450635"] = "Knife Swing 3",
    -- Baton Swings (src/ReplicatedStorage/Common/Animations/Tools/Baton.luau)
    ["rbxassetid://89952731061301"] = "Baton Swing 1",
    ["rbxassetid://72424831808735"] = "Baton Swing 2",
    ["rbxassetid://96007934412115"] = "Baton Swing 3",
    ["rbxassetid://114963164495687"] = "Baton Swing 4",
    -- Axe Swings (src/ReplicatedStorage/Common/Animations/Tools/Axe.luau)
    ["rbxassetid://96286170637753"] = "Axe Downward",
    ["rbxassetid://80382949163849"] = "Axe Sideways",
}

-- Song kiếm cơ động ODMG (Ground, Air, Stances)
local BLADE_SWING_ANIM_IDS = {
    ["rbxassetid://96150550684216"] = "Blades Ground 1",
    ["rbxassetid://107395560572172"] = "Blades Ground 2",
    ["rbxassetid://94107418581065"] = "Blades Ground 3",
    ["rbxassetid://78407720926422"] = "Blades Air 1",
    ["rbxassetid://106676784817648"] = "Blades Air 2",
    ["rbxassetid://86336690808665"] = "Crossguard Air 1",
    ["rbxassetid://85287366164918"] = "Crossguard Air 2",
    ["rbxassetid://102346761719959"] = "Tempo Air 1",
    ["rbxassetid://135697384008415"] = "Tempo Air 2",
    ["rbxassetid://128445066928907"] = "Burst Air 1",
    ["rbxassetid://73922915237760"] = "Burst Air 2",
}

-- Giương súng ngắm (Aiming)
local GUN_AIM_ANIM_IDS = {
    ["rbxassetid://97871336898783"] = "Flintlock Aim",
    ["rbxassetid://134827944008278"] = "Musket Aim",
    ["rbxassetid://113263750905381"] = "TrenchShotgun Aim",
    ["rbxassetid://106523320041949"] = "Kar98k Aim",
    ["rbxassetid://100078911142396"] = "Kar98k ScopedAim",
}

-- Bóp cò nổ súng thực tế (Firing / Shooting)
local GUN_FIRE_ANIM_IDS = {
    ["rbxassetid://126266861355878"] = "Flintlock Fire",
    ["rbxassetid://88894587224509"] = "Musket Fire",
    ["rbxassetid://136794592761260"] = "Kar98k Fire",
    ["rbxassetid://116789596474693"] = "Kar98k ScopedShoot",
    ["rbxassetid://121770912239110"] = "TrenchShotgun Shoot",
    ["rbxassetid://72186563260680"] = "BlunderBuss Fire",
    ["rbxassetid://108943463905425"] = "Bow Fire",
}

-- =========================================================================
-- HÀM NHẬN DIỆN HOẠT ẢNH
-- =========================================================================

local function isMeleeSwingTrack(track)
    if not track or not track.IsPlaying then return false end
    local anim = track.Animation
    local animId = anim and anim.AnimationId
    if animId and MELEE_SWING_ANIM_IDS[animId] then
        return true, MELEE_SWING_ANIM_IDS[animId]
    end
    if animId then
        for knownId, name in pairs(MELEE_SWING_ANIM_IDS) do
            local num = knownId:match("%d+")
            if num and animId:find(num) then
                return true, name
            end
        end
    end
    local name = track.Name:lower()
    if name:find("swing") or name:find("slash") or name:find("sabre") or name:find("knife") or name:find("baton") or name:find("downward") or name:find("sideways") then
        return true, track.Name
    end
    return false
end

local function isBladeSwingTrack(track)
    if not track or not track.IsPlaying then return false end
    local anim = track.Animation
    local animId = anim and anim.AnimationId
    if animId and BLADE_SWING_ANIM_IDS[animId] then
        return true, BLADE_SWING_ANIM_IDS[animId]
    end
    if animId then
        for knownId, name in pairs(BLADE_SWING_ANIM_IDS) do
            local num = knownId:match("%d+")
            if num and animId:find(num) then
                return true, name
            end
        end
    end
    return false
end

local function isGunAimTrack(track)
    if not track or not track.IsPlaying then return false end
    local anim = track.Animation
    local animId = anim and anim.AnimationId
    if animId and GUN_AIM_ANIM_IDS[animId] then
        return true, GUN_AIM_ANIM_IDS[animId]
    end
    if animId then
        for knownId, name in pairs(GUN_AIM_ANIM_IDS) do
            local num = knownId:match("%d+")
            if num and animId:find(num) then
                return true, name
            end
        end
    end
    local name = track.Name:lower()
    if name:find("aim") or name:find("scoped") or name:find("ready") then
        return true, track.Name
    end
    return false
end

local function isGunFireTrack(track)
    if not track or not track.IsPlaying then return false end
    local anim = track.Animation
    local animId = anim and anim.AnimationId
    if animId and GUN_FIRE_ANIM_IDS[animId] then
        return true, GUN_FIRE_ANIM_IDS[animId]
    end
    if animId then
        for knownId, name in pairs(GUN_FIRE_ANIM_IDS) do
            local num = knownId:match("%d+")
            if num and animId:find(num) then
                return true, name
            end
        end
    end
    local name = track.Name:lower()
    if name:find("fire") or name:find("shoot") then
        return true, track.Name
    end
    return false
end

-- =========================================================================
-- MODULE STRUCTURE & CONFIGURATION
-- =========================================================================

local PVP = {}

PVP.Config = {
    AutoParry = true,
    ParryMelee = true,
    ParryBlades = true,
    ParryDistance = 14,
    AutoCounter = true,
    CounterDelay = 0.08,
    AutoEvadeGuns = true,
    EvadeDistance = 80,
    BladeReachExtender = false,
    ExtendedBladeReach = 16,
    DamageBooster = false,
    VisualEffects = true,
    NotifyCallback = nil, -- function(title, content, icon)
}

local lastParryTick = 0
local lastEvadeTick = 0
local isCurrentlyBlocking = false
local heartbeatConnection = nil

local function sendNotification(title, content, icon)
    if not PVP.Config.VisualEffects then return end
    if typeof(PVP.Config.NotifyCallback) == "function" then
        pcall(PVP.Config.NotifyCallback, title, content, icon)
    else
        pcall(function()
            StarterGui:SetCore("SendNotification", {
                Title = title,
                Text = content,
                Duration = 3,
            })
        end)
    end
end

-- =========================================================================
-- THỰC THI PHẢN KÍCH (AUTO COUNTER)
-- =========================================================================
function PVP.ExecuteCounter(holdingMelee, holdingBlades, targetName)
    local char = LocalPlayer.Character
    if not char then return end

    if holdingMelee and CombatNamespace and CombatNamespace.Swing then
        pcall(function() CombatNamespace.Swing.post() end)
    elseif holdingBlades and GearNamespace and GearNamespace.Swing then
        pcall(function() GearNamespace.Swing.post(0) end)
    else
        if CombatNamespace and CombatNamespace.Swing then pcall(function() CombatNamespace.Swing.post() end) end
        if GearNamespace and GearNamespace.Swing then pcall(function() GearNamespace.Swing.post(0) end) end
    end

    sendNotification("⚡ AUTO COUNTER!", string.format("Phản kích chớp nhoáng trừng phạt: %s", targetName or "Kẻ địch"), "flash_on")
end

-- =========================================================================
-- THỰC THI ĐỠ ĐÒN (AUTO PARRY)
-- =========================================================================
function PVP.ExecuteParry(threatType, attackerName)
    local now = tick()
    if now - lastParryTick < 0.28 then return end
    lastParryTick = now

    local char = LocalPlayer.Character
    if not char then return end

    local holdingMelee = false
    local holdingBlades = false

    local tool = char:FindFirstChildOfClass("Tool")
    if tool then
        local toolName = tool.Name
        if toolName == "Sabre" or toolName == "Combat Knife" or toolName == "Baton" or toolName == "Axe" or toolName:find("Sword") or toolName:find("Blade") then
            holdingMelee = true
        end
    end

    if CharacterCombatHandler and typeof(CharacterCombatHandler.isCombatLoaded) == "function" then
        local loaded, weapon = CharacterCombatHandler.isCombatLoaded()
        if loaded then holdingMelee = true end
    end

    if ClientStateHandler and typeof(ClientStateHandler.isStateBusy) == "function" then
        if ClientStateHandler.isStateBusy(ClientStateHandler.States.COMBATTING) then holdingMelee = true end
        if ClientStateHandler.isStateBusy(ClientStateHandler.States.GEAR_EQUIPPED) then holdingBlades = true end
    end

    -- 1. Block (Cận chiến Melee)
    if holdingMelee or (not holdingBlades and CombatNamespace) then
        if CombatNamespace and CombatNamespace.Block then
            pcall(function()
                CombatNamespace.Block.post(true)
                isCurrentlyBlocking = true
            end)
            task.delay(0.32, function()
                if isCurrentlyBlocking and CombatNamespace and CombatNamespace.Block then
                    pcall(function() CombatNamespace.Block.post(false) end)
                    isCurrentlyBlocking = false
                end
            end)
        end
    end

    -- 2. Parry (Song kiếm ODMG)
    if holdingBlades or (not holdingMelee and GearNamespace) then
        if GearNamespace and GearNamespace.Parry then
            pcall(function()
                GearNamespace.Parry.post(1)
                if ClientStateHandler and ClientStateHandler.States then
                    ClientStateHandler.updateState(ClientStateHandler.States.PARRYING, true)
                end
            end)
            task.delay(0.35, function()
                pcall(function()
                    if ClientStateHandler and ClientStateHandler.States then
                        ClientStateHandler.updateState(ClientStateHandler.States.PARRYING, false)
                    end
                end)
            end)
        end
    end

    sendNotification("🛡️ PARRY THÀNH CÔNG!", string.format("Hóa giải đòn [%s] từ: %s", threatType or "Cận chiến", attackerName or "Kẻ địch"), "security")

    if PVP.Config.AutoCounter then
        task.delay(PVP.Config.CounterDelay or 0.08, function()
            PVP.ExecuteCounter(holdingMelee, holdingBlades, attackerName)
        end)
    end
end

-- =========================================================================
-- THỰC THI NÉ SÚNG ĐA MỤC TIÊU & BẮN THẬT (MULTI-EVADE & ON-FIRE)
-- =========================================================================
function PVP.ExecuteEvadeMulti(shooters)
    if not shooters or #shooters == 0 then return end

    local char = LocalPlayer.Character
    if not char then return end
    local myHrp = char:FindFirstChild("HumanoidRootPart")
    local myHum = char:FindFirstChildOfClass("Humanoid")
    if not myHrp or not myHum then return end

    local myPos = myHrp.Position
    local sumThreatVector = Vector3.zero
    local hasFiringShooter = false
    local firingShooterNames = {}
    local allShooterNames = {}

    for _, s in ipairs(shooters) do
        local name = s.player.DisplayName or s.player.Name
        table.insert(allShooterNames, name)
        local toMe = (myPos - s.pos).Unit
        sumThreatVector = sumThreatVector + toMe

        if s.isFiring then
            hasFiringShooter = true
            table.insert(firingShooterNames, name)
        end
    end

    local now = tick()
    -- Rút ngắn hồi chiêu còn 0.35s nếu phát hiện súng nổ thật
    local minCooldown = hasFiringShooter and 0.35 or 0.85
    if now - lastEvadeTick < minCooldown then return end
    lastEvadeTick = now

    -- 1. Tính toán vector thoát hiểm
    local escapeVector
    if #shooters == 1 then
        local diff = (myPos - shooters[1].pos).Unit
        escapeVector = Vector3.new(-diff.Z, 0, diff.X).Unit
        if math.random() > 0.5 then escapeVector = -escapeVector end
    else
        -- Thoát hiểm khỏi góc kẹp đạn (Crossfire Escape)
        local avgThreat = sumThreatVector.Unit
        local perp = Vector3.new(-avgThreat.Z, 0, avgThreat.X).Unit
        if math.random() > 0.5 then perp = -perp end
        escapeVector = (perp * 0.75 + avgThreat * 0.5).Unit
    end

    -- 2. Mô phỏng Sprint + Crouch (Shift + C)
    pcall(function()
        if VirtualInputManager then
            VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.LeftShift, false, game)
            VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.C, false, game)
            task.delay(0.25, function()
                pcall(function()
                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.C, false, game)
                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.LeftShift, false, game)
                end)
            end)
        end
    end)

    -- 3. Kích hoạt State & Hoạt ảnh Slide/Dive
    local animator = myHum:FindFirstChildOfClass("Animator")
    local hasGear = false
    if ClientStateHandler and typeof(ClientStateHandler.isStateBusy) == "function" then
        hasGear = ClientStateHandler.isStateBusy(ClientStateHandler.States.GEAR_EQUIPPED)
    end

    if hasGear then
        pcall(function()
            if ClientStateHandler and ClientStateHandler.States then
                ClientStateHandler.updateState(ClientStateHandler.States.SLIDING, true)
            end
            if animator then
                local anim = Instance.new("Animation")
                anim.AnimationId = "rbxassetid://132423694185606" -- Gear.Slide
                local track = animator:LoadAnimation(anim)
                track.Priority = Enum.AnimationPriority.Action
                track:Play(0.15)
                task.delay(0.5, function()
                    pcall(function()
                        track:Stop(0.2)
                        anim:Destroy()
                        if ClientStateHandler and ClientStateHandler.States then
                            ClientStateHandler.updateState(ClientStateHandler.States.SLIDING, false)
                        end
                    end)
                end)
            end
        end)
    else
        pcall(function()
            if ClientStateHandler and ClientStateHandler.States then
                ClientStateHandler.updateState(ClientStateHandler.States.CROUCHING, true)
            end
            if animator then
                local anim = Instance.new("Animation")
                anim.AnimationId = "rbxassetid://107696393831240" -- Default.Crouch.Dive
                local track = animator:LoadAnimation(anim)
                track.Priority = Enum.AnimationPriority.Action
                track:Play(0.1)
                task.delay(0.45, function()
                    pcall(function()
                        track:Stop(0.2)
                        anim:Destroy()
                        if ClientStateHandler and ClientStateHandler.States then
                            ClientStateHandler.updateState(ClientStateHandler.States.CROUCHING, false)
                        end
                    end)
                end)
            end
        end)
    end

    -- 4. Âm thanh cuộn né đòn (Universal.RollingSFX)
    pcall(function()
        local sfx = Instance.new("Sound")
        sfx.SoundId = "rbxassetid://129996792442762"
        sfx.Volume = 0.85
        sfx.RollOffMaxDistance = 60
        sfx.Parent = myHrp
        sfx:Play()
        sfx.Ended:Connect(function() sfx:Destroy() end)
    end)

    -- 5. Lực trượt lướt bám đất (90 khi nổ súng thật, 80 khi ngắm)
    local slideSpeed = hasFiringShooter and 90 or 80
    myHrp.AssemblyLinearVelocity = escapeVector * slideSpeed + Vector3.new(0, 3, 0)

    -- 6. Thông báo
    if hasFiringShooter then
        sendNotification("💥 NÉ ĐẠN TỨC THÌ (ON FIRE)!", string.format("Phát hiện %s vừa bóp cò bắn! Đã lướt né đạn khẩn cấp.", table.concat(firingShooterNames, ", ")), "warning")
    elseif #shooters >= 2 then
        sendNotification("🚨 BÁO ĐỘNG KẸP ĐẠN!", string.format("[%d] xạ thủ (%s) đang nhắm cùng lúc! Đã trượt né góc thoát hiểm.", #shooters, table.concat(allShooterNames, ", ")), "crisis_alert")
    else
        sendNotification("💨 SLIDE NÉ ĐẠN!", string.format("%s đang ngắm bắn bạn! Đã trượt đất thoát tâm ngắm.", allShooterNames[1] or "Xạ thủ"), "directions_run")
    end
end

-- =========================================================================
-- HOOK THUỘC TÍNH (ATTRIBUTE SPOOFING)
-- =========================================================================
local hookInitialized = false
function PVP.InitAttributeHook()
    if hookInitialized then return end
    if ClientAttributesHandler and typeof(ClientAttributesHandler.getAttribute) == "function" then
        local origGet = ClientAttributesHandler.getAttribute
        local isHandling = false
        ClientAttributesHandler.getAttribute = function(attrName, ...)
            if isHandling then return origGet(attrName, ...) end
            isHandling = true
            local res = nil
            if PVP.Config.BladeReachExtender and attrName == "BladeRange" then
                res = PVP.Config.ExtendedBladeReach or 16
            elseif PVP.Config.DamageBooster and attrName == "PlayerDamageMultiplier" then
                res = 2.5
            elseif PVP.Config.DamageBooster and attrName == "BaseBladePlayerDamage" then
                res = 45
            elseif PVP.Config.DamageBooster and attrName == "BladeResistanceMultiplier" then
                res = 2.0
            elseif PVP.Config.DamageBooster and attrName == "GearCounterWindowLength" then
                res = 3.5
            end
            isHandling = false
            if res ~= nil then return res end
            return origGet(attrName, ...)
        end
        hookInitialized = true
    end
end

-- =========================================================================
-- VÒNG LẶP QUÉT TRẬN ĐẤU (SCAN LOOP)
-- =========================================================================
function PVP.ScanTick()
    if not PVP.Config.AutoParry and not PVP.Config.AutoEvadeGuns then return end

    local myChar = LocalPlayer.Character
    if not myChar then return end
    local myHrp = myChar:FindFirstChild("HumanoidRootPart")
    if not myHrp then return end

    local myPos = myHrp.Position
    local activeShooters = {}

    for _, enemy in ipairs(Players:GetPlayers()) do
        if enemy == LocalPlayer then continue end
        local eChar = enemy.Character
        if not eChar then continue end
        local eHrp = eChar:FindFirstChild("HumanoidRootPart")
        local eHum = eChar:FindFirstChildOfClass("Humanoid")
        if not eHrp or not eHum or eHum.Health <= 0 then continue end

        local dist = (eHrp.Position - myPos).Magnitude

        -- 1. Quét Cận chiến & Song kiếm
        if PVP.Config.AutoParry and dist <= (PVP.Config.ParryDistance or 14) then
            local animator = eHum:FindFirstChildOfClass("Animator")
            if animator then
                for _, track in ipairs(animator:GetPlayingAnimationTracks()) do
                    local detected = false
                    local threatName = nil
                    if PVP.Config.ParryMelee then
                        local isMelee, mName = isMeleeSwingTrack(track)
                        if isMelee then detected = true; threatName = mName end
                    end
                    if not detected and PVP.Config.ParryBlades then
                        local isBlade, bName = isBladeSwingTrack(track)
                        if isBlade then detected = true; threatName = bName end
                    end

                    if detected then
                        local toMe = (myPos - eHrp.Position).Unit
                        local dot = eHrp.CFrame.LookVector:Dot(toMe)
                        if dot > -0.35 then
                            PVP.ExecuteParry(threatName or "Swing", enemy.DisplayName or enemy.Name)
                            break
                        end
                    end
                end
            end
        end

        -- 2. Quét Súng ống (Ngắm bắn & Nổ súng thật)
        if PVP.Config.AutoEvadeGuns and dist <= (PVP.Config.EvadeDistance or 80) then
            local animator = eHum:FindFirstChildOfClass("Animator")
            if animator then
                local playingTracks = animator:GetPlayingAnimationTracks()
                local isFiringAtMe = false
                local isAimingAtMe = false
                local gunType = nil

                for _, track in ipairs(playingTracks) do
                    local isFire, fName = isGunFireTrack(track)
                    if isFire then
                        local toMe = (myPos - eHrp.Position).Unit
                        local dot = eHrp.CFrame.LookVector:Dot(toMe)
                        if dot > 0.70 then
                            isFiringAtMe = true
                            gunType = fName or "Súng nổ"
                            break
                        end
                    end
                    local isAim, aName = isGunAimTrack(track)
                    if isAim then
                        local toMe = (myPos - eHrp.Position).Unit
                        local dot = eHrp.CFrame.LookVector:Dot(toMe)
                        if dot > 0.82 then
                            isAimingAtMe = true
                            gunType = aName or "Súng ngắm"
                        end
                    end
                end

                if isFiringAtMe or isAimingAtMe then
                    table.insert(activeShooters, {
                        player = enemy,
                        hrp = eHrp,
                        isFiring = isFiringAtMe,
                        gunType = gunType or "Súng",
                        pos = eHrp.Position,
                    })
                end
            end
        end
    end

    if #activeShooters > 0 then
        PVP.ExecuteEvadeMulti(activeShooters)
    end
end

-- =========================================================================
-- KHỞI TẠO & ĐIỀU KHIỂN
-- =========================================================================
function PVP.Start(customConfig)
    if customConfig then
        for k, v in pairs(customConfig) do
            PVP.Config[k] = v
        end
    end

    PVP.InitAttributeHook()

    if not heartbeatConnection then
        heartbeatConnection = RunService.Heartbeat:Connect(function()
            PVP.ScanTick()
        end)
    end

    sendNotification("⚔️ PVP CORE ACTIVE", "Hệ thống Auto Parry, Counter & Evade đã hoạt động!", "security")
end

function PVP.Stop()
    if heartbeatConnection then
        heartbeatConnection:Disconnect()
        heartbeatConnection = nil
    end
end

function PVP.UpdateConfig(newConfig)
    if not newConfig then return end
    for k, v in pairs(newConfig) do
        PVP.Config[k] = v
    end
end

return PVP
