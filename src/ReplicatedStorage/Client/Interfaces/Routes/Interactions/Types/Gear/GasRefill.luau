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
--  File: ReplicatedStorage.Client.Interfaces.Routes.Interactions.Types.Gear.GasRefill
--                               Dumped in 0.00467 seconds
--                          Bytecode version 9  |  17 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Character = require(Utilities:WaitForChild("Character"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Network = Common_2:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Gear = require(Namespaces:WaitForChild("Gear"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Network_2 = Common_3:WaitForChild("Network")
local Namespaces_2 = Network_2:WaitForChild("Namespaces")
local Interaction = require(Namespaces_2:WaitForChild("Interaction"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_4:WaitForChild("Common")
local Utilities_2 = Common_4:WaitForChild("Utilities")
local Shake = require(Utilities_2:WaitForChild("Shake"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_5:WaitForChild("Packages")
local trove = require(Packages:WaitForChild("trove"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_6:WaitForChild("Client")
local Progression = Client:WaitForChild("Progression")
local ClientAttributesHandler = require(Progression:WaitForChild("ClientAttributesHandler"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_7:WaitForChild("Client")
local User = Client_2:WaitForChild("User")
local Equipment = User:WaitForChild("Equipment")
local Gear_3 = Equipment:WaitForChild("Gear")
local ClientGearHandler = require(Gear_3:WaitForChild("ClientGearHandler"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_8:WaitForChild("Client")
local User_2 = Client_3:WaitForChild("User")
local State = User_2:WaitForChild("State")
local ClientStatusHandler = require(State:WaitForChild("ClientStatusHandler"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_9:WaitForChild("Client")
local User_3 = Client_4:WaitForChild("User")
local State_2 = User_3:WaitForChild("State")
local ClientSettingsHandler = require(State_2:WaitForChild("ClientSettingsHandler"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Client_5 = ReplicatedStorage_10:WaitForChild("Client")
local User_4 = Client_5:WaitForChild("User")
local Character_2 = User_4:WaitForChild("Character")
local CharacterRagdollHandler = require(Character_2:WaitForChild("CharacterRagdollHandler"))
local ReplicatedStorage_11 = game:GetService("ReplicatedStorage")
local Client_6 = ReplicatedStorage_11:WaitForChild("Client")
local Progression_2 = Client_6:WaitForChild("Progression")
local Enchantments = Progression_2:WaitForChild("Enchantments")
local ClientEnchantmentsHandler = require(Enchantments:WaitForChild("ClientEnchantmentsHandler"))
local ReplicatedStorage_12 = game:GetService("ReplicatedStorage")
local Client_7 = ReplicatedStorage_12:WaitForChild("Client")
local User_5 = Client_7:WaitForChild("User")
local State_3 = User_5:WaitForChild("State")
local ClientStateHandler = require(State_3:WaitForChild("ClientStateHandler"))
local Categories = ClientStateHandler.Categories
local ReplicatedStorage_13 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_13:WaitForChild("Common")
local Utilities_3 = Common_5:WaitForChild("Utilities")
local Sounds = require(Utilities_3:WaitForChild("Sounds"))
local ReplicatedStorage_14 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_14:WaitForChild("Common")
local Sounds_2 = Common_6:WaitForChild("Sounds")
local Gear_2 = require(Sounds_2:WaitForChild("Gear"))
local ReplicatedStorage_15 = game:GetService("ReplicatedStorage")
local Common_7 = ReplicatedStorage_15:WaitForChild("Common")
local Statistics = Common_7:WaitForChild("Statistics")
local useJumpPower = require(Statistics:WaitForChild("useJumpPower"))
local ReplicatedStorage_16 = game:GetService("ReplicatedStorage")
local Common_8 = ReplicatedStorage_16:WaitForChild("Common")
local Statistics_2 = Common_8:WaitForChild("Statistics")
local useWalkSpeed = require(Statistics_2:WaitForChild("useWalkSpeed"))
local ReplicatedStorage_17 = game:GetService("ReplicatedStorage")
local Common_9 = ReplicatedStorage_17:WaitForChild("Common")
local Utilities_4 = Common_9:WaitForChild("Utilities")
local Timeout = Utilities_4:WaitForChild("Timeout")
local throttle = require(Timeout:WaitForChild("throttle"))
local ReplicatedStorage_18 = game:GetService("ReplicatedStorage")
local Common_10 = ReplicatedStorage_18:WaitForChild("Common")
local Utilities_5 = Common_10:WaitForChild("Utilities")
local useNumberEasing = require(Utilities_5:WaitForChild("useNumberEasing"))
local u406 = {}
local u407 = nil
local u409 = trove.new()
local u410 = nil
local u411 = nil
local u412 = nil
local function onExplodeClientRefilling() -- Line: 78 -- upvalues: Character (val), CharacterRagdollHandler (val), ClientStatusHandler (val), Workspace (val), Shake (val)
    local v1 = Character.getCharacter()
    if not v1 then
        return
    end
    local HumanoidRootPart = v1.HumanoidRootPart
    local v2 = -HumanoidRootPart.CFrame.LookVector
    local v3 = v2 * Vector3.new(1, 0, 0) * 300
    HumanoidRootPart.AssemblyLinearVelocity = v3 + Vector3.new(0, 100, 0)
    CharacterRagdollHandler.ragdoll(5)
    ClientStatusHandler.addPlayerStatus("Concussed", 4)
    ClientStatusHandler.addPlayerStatus("Blood", 2)
    local CurrentCamera = Workspace.CurrentCamera
    local v4 = Shake.new()
    v4.FadeInTime = 0.3
    v4.FadeOutTime = 0.3
    v4.Frequency = 0.5
    v4.Amplitude = 5
    v4.RotationInfluence = Vector3.new(0.2, 0.2, 0.2)
    v4:Start()
    v4:BindToRenderStep(Shake.NextRenderName(), Enum.RenderPriority.Last.Value, function(p1, p2) -- Line: 106 -- upvalues: CurrentCamera (val)
        local v1 = CurrentCamera
        local v2 = CFrame.new(p1)
        v1.CFrame = v1.CFrame * (v2 * CFrame.Angles(p2.X, p2.Y, p2.Z))
    end)
end
local function onBeginClientRefilling() -- Line: 115 -- upvalues: ClientGearHandler (val), ClientSettingsHandler (val), u410 (ref), Gear (val), ClientStateHandler (val), Categories (val), u406 (val), u409 (val), useWalkSpeed (val), useJumpPower (val), u411 (ref), u412 (ref), ClientEnchantmentsHandler (val), useNumberEasing (val), throttle (val), ClientAttributesHandler (val), RunService (val), u407 (ref), onExplodeClientRefilling (val), Sounds (val), Gear_2 (val), TweenService (val)
    local u37, v1, v2
    local u2 = ClientGearHandler.getGearState()
    local u3 = 0
    if not (ClientSettingsHandler.isKeyPressed("Interact")) or not u410 then
        return Gear.Refill.post(1)
    end
    if not u2 then
        if u2 then
            if ClientStateHandler.isCategoryBusy(Categories.NO_GEAR_HANDLE_USAGE) then
                return Gear.Refill.post(1)
            end
            if not (u406[u410.Dial]) then
                u406[u410.Dial] = u410.Dial.CFrame
            end
            u409:Clean()
            _, v1 = useWalkSpeed()
            _, v2 = useJumpPower()
            u37 = {}
            u411 = v1("refill", 0, "set", 500)
            u412 = v2("refill", 0, "set", 500)
            ClientStateHandler.updateState(ClientStateHandler.States.REFILLING, true)
            ClientStateHandler.updateState(ClientStateHandler.States.LOCKED, true)
            u409:Add(task.delay(1, function() -- Line: 151 -- upvalues: u2 (val), ClientEnchantmentsHandler (upval), u410 (upval), useNumberEasing (upval), Gear (upval), throttle (upval), u409 (upval), ClientAttributesHandler (upval), RunService (upval), u407 (upval), u3 (ref), onExplodeClientRefilling (upval), Sounds (upval), Gear_2 (upval), TweenService (upval), u37 (val), u406 (upval)
                local u27, u28, v1
                local gas = u2.gas
                local maxGas = u2.maxGas
                local u6 = false
                local u7 = false
                local u8 = false
                local u12 = ClientEnchantmentsHandler.hasEnchantment("Trial and Error")
                local u16 = ClientEnchantmentsHandler.hasEnchantment("Gas Technician")
                local u17 = false
                local Attribute = u410.Interaction:GetAttribute("Amount")
                if not Attribute then
                    Attribute = math.huge
                end
                u27, u28, v1 = useNumberEasing(0)
                u28(-(gas / maxGas * 355), TweenInfo.new(0.3))
                local u37 = nil
                local function onInformServer() -- Line: 177 -- upvalues: u37 (ref), u2 (upval), Gear (upval), gas (val)
                    if not u37 then
                        u37 = u2.gas
                        return
                    end
                    local gas_2 = u2.gas
                    local v1 = gas_2 - u37
                    u37 = gas_2
                    Gear.Refilling.post({difference = v1, total = math.abs(u2.gas - gas), client = u2.gas})
                end
                local u44 = throttle(onInformServer, 1.5, {leading = true})
                u409:Add(function() -- Line: 197 -- upvalues: u44 (val), u12 (val), u17 (ref), u2 (upval), maxGas (val), onInformServer (val)
                    u44.cancel()
                    if u12 and u17 then
                        u2.gas = maxGas
                    end
                    onInformServer()
                end)
                u409:Add(task.delay(0.3, function() -- Line: 207 -- upvalues: ClientAttributesHandler (upval), u16 (val), maxGas (val), gas (val), u28 (val), u37 (ref), u2 (upval)
                    local ResupplyMultiplier = ClientAttributesHandler.getAttribute("ResupplyMultiplier")
                    if u16 then
                        ResupplyMultiplier = ResupplyMultiplier + 0.3
                    end
                    u28(-355, TweenInfo.new(7 / ResupplyMultiplier * ((maxGas - gas) / maxGas), Enum.EasingStyle.Linear))
                    task.wait()
                    u37 = u2.gas
                end))
                u409:Add(RunService.RenderStepped:Connect(function(p1) -- Line: 227 -- upvalues: u407 (upval), u27 (val), maxGas (val), u2 (upval), u410 (upval), gas (val), Attribute (val), Gear (upval), u44 (val), u8 (ref), u3 (upval), onExplodeClientRefilling (upval), u6 (ref), Sounds (upval), Gear_2 (upval), TweenService (upval), u37 (upval), u12 (val), u17 (ref), u409 (upval), u7 (ref), u406 (upval)
                    local v1, v2, v3
                    u407 = u27()
                    local v4 = u27() / -320
                    local v5 = math.clamp(v4, 0, 1)
                    u2.gas = v5 * maxGas
                    local Attribute_2 = u410.Interaction:GetAttribute("Amount")
                    if not Attribute_2 then
                        Attribute_2 = math.huge
                    end
                    local v6 = math.abs(u2.gas - gas)
                    if Attribute < v6 or Attribute_2 <= 0 then
                        return Gear.Refill.post(1)
                    end
                    u44()
                    if 1.1 > v4 then
                        if 1.1 <= v4 and not u8 then
                            u3 = u3 + p1 * 2.5
                        end
                    elseif not u8 and math.random() < u3 then
                        u8 = true
                        Gear.Refill.post(2)
                        onExplodeClientRefilling()
                    end
                    if 0.8 <= v4 and not u6 then
                        u6 = true
                        v2 = Sounds.playRangedSoundEffect(Gear_2.RefillRisk, u410.Dial, 400, 0, {min = 1.1, max = 1.3})
                        v1 = TweenInfo.new(2)
                        TweenService:Create(v2, v1, {Volume = 6}):Play()
                        v1 = TweenInfo.new(4)
                        TweenService:Create(v2, v1, {Pitch = 5}):Play()
                        table.insert(u37, v2)
                    end
                    if 1 > v5 or not u6 then
                        if 0.95 <= v4 and u6 and not u7 and not u12 then
                            u7 = true
                            v2 = Sounds.playRangedSoundEffect(Gear_2.RefillDanger, u410.Dial, 400, 0, {min = 1.1, max = 1.3})
                            v1 = TweenInfo.new(1)
                            TweenService:Create(v2, v1, {Volume = 10}):Play()
                            v1 = TweenInfo.new(1)
                            TweenService:Create(v2, v1, {Pitch = 5}):Play()
                            table.insert(u37, v2)
                        end
                        v3 = u406[u410.Dial]
                        v1 = math.rad((u27()))
                        u410.Dial.CFrame = v3 * CFrame.Angles(v1, 0, 0)
                        return
                    end
                    if u12 then
                        u17 = true
                        u409:Clean()
                        return Gear.Refill.post(1)
                    end
                    if 0.95 <= v4 and u6 and not u7 and not u12 then
                        u7 = true
                        v2 = Sounds.playRangedSoundEffect(Gear_2.RefillDanger, u410.Dial, 400, 0, {min = 1.1, max = 1.3})
                        v1 = TweenInfo.new(1)
                        TweenService:Create(v2, v1, {Volume = 10}):Play()
                        v1 = TweenInfo.new(1)
                        TweenService:Create(v2, v1, {Pitch = 5}):Play()
                        table.insert(u37, v2)
                    end
                    v3 = u406[u410.Dial]
                    v1 = math.rad((u27()))
                    u410.Dial.CFrame = v3 * CFrame.Angles(v1, 0, 0)
                end))
                u409:Add(v1)
            end))
            u409:Add(function() -- Line: 302 -- upvalues: u37 (val), TweenService (upval)
                local v1
                if not u37 then
                    return
                end
                local v2 = u37
                local v3 = nil
                local v4 = nil
                for i, j in v2, v3, v4 do
                    v1 = TweenInfo.new(0.5)
                    TweenService:Create(j, v1, {Volume = 0}):Play()
                    task.delay(0.5, function() -- Line: 311 -- upvalues: j (val)
                        j:Stop()
                        j:Destroy()
                    end)
                end
            end)
            u409:Add(ClientSettingsHandler.onKeybindReleased("Interact"):Connect(function() -- Line: 319 -- upvalues: u409 (upval), Gear (upval)
                u409:Clean()
                return Gear.Refill.post(1)
            end))
            return
        end
        return Gear.Refill.post(1)
    end
    if u2.gas == u2.maxGas or not u2 or ClientStateHandler.isCategoryBusy(Categories.NO_GEAR_HANDLE_USAGE) then
        return Gear.Refill.post(1)
    end
    if not (u406[u410.Dial]) then
        u406[u410.Dial] = u410.Dial.CFrame
    end
    u409:Clean()
    _, v1 = useWalkSpeed()
    _, v2 = useJumpPower()
    u37 = {}
    u411 = v1("refill", 0, "set", 500)
    u412 = v2("refill", 0, "set", 500)
    ClientStateHandler.updateState(ClientStateHandler.States.REFILLING, true)
    ClientStateHandler.updateState(ClientStateHandler.States.LOCKED, true)
    u409:Add(task.delay(1, function() -- Line: 151 -- upvalues: u2 (val), ClientEnchantmentsHandler (upval), u410 (upval), useNumberEasing (upval), Gear (upval), throttle (upval), u409 (upval), ClientAttributesHandler (upval), RunService (upval), u407 (upval), u3 (ref), onExplodeClientRefilling (upval), Sounds (upval), Gear_2 (upval), TweenService (upval), u37 (val), u406 (upval)
        local u27, u28, v1
        local gas = u2.gas
        local maxGas = u2.maxGas
        local u6 = false
        local u7 = false
        local u8 = false
        local u12 = ClientEnchantmentsHandler.hasEnchantment("Trial and Error")
        local u16 = ClientEnchantmentsHandler.hasEnchantment("Gas Technician")
        local u17 = false
        local Attribute = u410.Interaction:GetAttribute("Amount")
        if not Attribute then
            Attribute = math.huge
        end
        u27, u28, v1 = useNumberEasing(0)
        u28(-(gas / maxGas * 355), TweenInfo.new(0.3))
        local u37 = nil
        local function onInformServer() -- Line: 177 -- upvalues: u37 (ref), u2 (upval), Gear (upval), gas (val)
            if not u37 then
                u37 = u2.gas
                return
            end
            local gas_2 = u2.gas
            local v1 = gas_2 - u37
            u37 = gas_2
            Gear.Refilling.post({difference = v1, total = math.abs(u2.gas - gas), client = u2.gas})
        end
        local u44 = throttle(onInformServer, 1.5, {leading = true})
        u409:Add(function() -- Line: 197 -- upvalues: u44 (val), u12 (val), u17 (ref), u2 (upval), maxGas (val), onInformServer (val)
            u44.cancel()
            if u12 and u17 then
                u2.gas = maxGas
            end
            onInformServer()
        end)
        u409:Add(task.delay(0.3, function() -- Line: 207 -- upvalues: ClientAttributesHandler (upval), u16 (val), maxGas (val), gas (val), u28 (val), u37 (ref), u2 (upval)
            local ResupplyMultiplier = ClientAttributesHandler.getAttribute("ResupplyMultiplier")
            if u16 then
                ResupplyMultiplier = ResupplyMultiplier + 0.3
            end
            u28(-355, TweenInfo.new(7 / ResupplyMultiplier * ((maxGas - gas) / maxGas), Enum.EasingStyle.Linear))
            task.wait()
            u37 = u2.gas
        end))
        u409:Add(RunService.RenderStepped:Connect(function(p1) -- Line: 227 -- upvalues: u407 (upval), u27 (val), maxGas (val), u2 (upval), u410 (upval), gas (val), Attribute (val), Gear (upval), u44 (val), u8 (ref), u3 (upval), onExplodeClientRefilling (upval), u6 (ref), Sounds (upval), Gear_2 (upval), TweenService (upval), u37 (upval), u12 (val), u17 (ref), u409 (upval), u7 (ref), u406 (upval)
            local v1, v2, v3
            u407 = u27()
            local v4 = u27() / -320
            local v5 = math.clamp(v4, 0, 1)
            u2.gas = v5 * maxGas
            local Attribute_2 = u410.Interaction:GetAttribute("Amount")
            if not Attribute_2 then
                Attribute_2 = math.huge
            end
            local v6 = math.abs(u2.gas - gas)
            if Attribute < v6 or Attribute_2 <= 0 then
                return Gear.Refill.post(1)
            end
            u44()
            if 1.1 > v4 then
                if 1.1 <= v4 and not u8 then
                    u3 = u3 + p1 * 2.5
                end
            elseif not u8 and math.random() < u3 then
                u8 = true
                Gear.Refill.post(2)
                onExplodeClientRefilling()
            end
            if 0.8 <= v4 and not u6 then
                u6 = true
                v2 = Sounds.playRangedSoundEffect(Gear_2.RefillRisk, u410.Dial, 400, 0, {min = 1.1, max = 1.3})
                v1 = TweenInfo.new(2)
                TweenService:Create(v2, v1, {Volume = 6}):Play()
                v1 = TweenInfo.new(4)
                TweenService:Create(v2, v1, {Pitch = 5}):Play()
                table.insert(u37, v2)
            end
            if 1 > v5 or not u6 then
                if 0.95 <= v4 and u6 and not u7 and not u12 then
                    u7 = true
                    v2 = Sounds.playRangedSoundEffect(Gear_2.RefillDanger, u410.Dial, 400, 0, {min = 1.1, max = 1.3})
                    v1 = TweenInfo.new(1)
                    TweenService:Create(v2, v1, {Volume = 10}):Play()
                    v1 = TweenInfo.new(1)
                    TweenService:Create(v2, v1, {Pitch = 5}):Play()
                    table.insert(u37, v2)
                end
                v3 = u406[u410.Dial]
                v1 = math.rad((u27()))
                u410.Dial.CFrame = v3 * CFrame.Angles(v1, 0, 0)
                return
            end
            if u12 then
                u17 = true
                u409:Clean()
                return Gear.Refill.post(1)
            end
            if 0.95 <= v4 and u6 and not u7 and not u12 then
                u7 = true
                v2 = Sounds.playRangedSoundEffect(Gear_2.RefillDanger, u410.Dial, 400, 0, {min = 1.1, max = 1.3})
                v1 = TweenInfo.new(1)
                TweenService:Create(v2, v1, {Volume = 10}):Play()
                v1 = TweenInfo.new(1)
                TweenService:Create(v2, v1, {Pitch = 5}):Play()
                table.insert(u37, v2)
            end
            v3 = u406[u410.Dial]
            v1 = math.rad((u27()))
            u410.Dial.CFrame = v3 * CFrame.Angles(v1, 0, 0)
        end))
        u409:Add(v1)
    end))
    u409:Add(function() -- Line: 302 -- upvalues: u37 (val), TweenService (upval)
        local v1
        if not u37 then
            return
        end
        local v2 = u37
        local v3 = nil
        local v4 = nil
        for i, j in v2, v3, v4 do
            v1 = TweenInfo.new(0.5)
            TweenService:Create(j, v1, {Volume = 0}):Play()
            task.delay(0.5, function() -- Line: 311 -- upvalues: j (val)
                j:Stop()
                j:Destroy()
            end)
        end
    end)
    u409:Add(ClientSettingsHandler.onKeybindReleased("Interact"):Connect(function() -- Line: 319 -- upvalues: u409 (upval), Gear (upval)
        u409:Clean()
        return Gear.Refill.post(1)
    end))
end
local function onEndClientRefilling() -- Line: 331 -- upvalues: u409 (val), u411 (ref), u412 (ref), u410 (ref), u406 (val), useNumberEasing (val), u407 (ref), RunService (val), ClientStateHandler (val)
    u409:Clean()
    if u411 then
        u411()
        u411 = nil
    end
    if u412 then
        u412()
        u412 = nil
    end
    if u410 and u406[u410.Dial] then
        local u20, u22, v1
        u20, v1, u22 = useNumberEasing(u407 or 0)
        v1(0, TweenInfo.new(0.5))
        local u34 = RunService.RenderStepped:Connect(function() -- Line: 351 -- upvalues: u410 (upval), u406 (upval), u20 (val)
            local v1 = u406[u410.Dial]
            local v2 = math.rad((u20()))
            u410.Dial.CFrame = v1 * CFrame.Angles(v2, 0, 0)
        end)
        u409:Add(u34)
        u409:Add(task.delay(0.5, function() -- Line: 356 -- upvalues: u34 (val), u22 (val)
            u34:Disconnect()
            u22()
        end))
        u409:Add(u22)
    end
    ClientStateHandler.updateState(ClientStateHandler.States.REFILLING, false)
    ClientStateHandler.updateState(ClientStateHandler.States.LOCKED, false)
end
Gear.Refill.listen(function(p1) -- Line: 374 -- upvalues: onBeginClientRefilling (val), onEndClientRefilling (val)
    if p1 == 0 then
        onBeginClientRefilling()
        return
    end
    if p1 == 1 then
        onEndClientRefilling()
    end
end)
return {
    interacted = function(...) -- Line: 387 -- upvalues: ClientGearHandler (val), ClientStateHandler (val), u410 (ref), Interaction (val)
        local v1 = ClientGearHandler.getGearState()
        if not v1 or not v1.enabled or ClientStateHandler.isCategoryBusy(ClientStateHandler.Categories.NO_GEAR_HANDLE_USAGE) then
            return
        end
        local v2 = {...}
        u410 = v2[1].Parent
        Interaction.Event.unreliablePost(unpack(v2))
    end,
    display = {header = "Gas Refill", body = "Press \"%s\" to take gas from the gas cannister."},
}