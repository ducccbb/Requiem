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
--     File: ReplicatedStorage.Client.User.Equipment.Gear.Components.Handles.Default
--                               Dumped in 0.00396 seconds
--                          Bytecode version 9  |  28 functions

local u369, u372
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Config = require(Common:WaitForChild("Config"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Utilities = Common_2:WaitForChild("Utilities")
local Table = require(Utilities:WaitForChild("Table"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Network = Common_3:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Inventory = require(Namespaces:WaitForChild("Inventory"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_4:WaitForChild("Common")
local Network_2 = Common_4:WaitForChild("Network")
local Namespaces_2 = Network_2:WaitForChild("Namespaces")
local Gear = require(Namespaces_2:WaitForChild("Gear"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_5:WaitForChild("Common")
local Animations = Common_5:WaitForChild("Animations")
local Gear_2 = require(Animations:WaitForChild("Gear"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_6:WaitForChild("Common")
local Observers = Common_6:WaitForChild("Observers")
local useAnimatorObserver = require(Observers:WaitForChild("useAnimatorObserver"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_7 = ReplicatedStorage_7:WaitForChild("Common")
local Utilities_2 = Common_7:WaitForChild("Utilities")
local Character = require(Utilities_2:WaitForChild("Character"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Common_8 = ReplicatedStorage_8:WaitForChild("Common")
local Types = Common_8:WaitForChild("Types")
require(Types:WaitForChild("Gear"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Common_9 = ReplicatedStorage_9:WaitForChild("Common")
local Signals = require(Common_9:WaitForChild("Signals"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_10:WaitForChild("Client")
local Progression = Client:WaitForChild("Progression")
local ClientAttributesHandler = require(Progression:WaitForChild("ClientAttributesHandler"))
local Tools = script.Parent.Parent.Parent.Parent:WaitForChild("Tools")
local ClientInventoryHandler = require(Tools:WaitForChild("ClientInventoryHandler"))
local ReplicatedStorage_11 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_11:WaitForChild("Client")
local User = Client_2:WaitForChild("User")
local State = User:WaitForChild("State")
local ClientStateHandler = require(State:WaitForChild("ClientStateHandler"))
local States = ClientStateHandler.States
local ReplicatedStorage_12 = game:GetService("ReplicatedStorage")
local Common_10 = ReplicatedStorage_12:WaitForChild("Common")
local Utilities_3 = Common_10:WaitForChild("Utilities")
local QuickAccessItems = require(Utilities_3:WaitForChild("QuickAccessItems"))
local ReplicatedStorage_13 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_13:WaitForChild("Client")
local User_2 = Client_3:WaitForChild("User")
local State_2 = User_2:WaitForChild("State")
local ClientSettingsHandler = require(State_2:WaitForChild("ClientSettingsHandler"))
local ReplicatedStorage_14 = game:GetService("ReplicatedStorage")
local Common_11 = ReplicatedStorage_14:WaitForChild("Common")
local Effects_2 = Common_11:WaitForChild("Effects")
local Effects = require(Effects_2:WaitForChild("Effects"))
local ReplicatedStorage_15 = game:GetService("ReplicatedStorage")
local Common_12 = ReplicatedStorage_15:WaitForChild("Common")
local Handles = require(Common_12:WaitForChild("Logger"))("Handles")
local ReplicatedStorage_16 = game:GetService("ReplicatedStorage")
local Common_13 = ReplicatedStorage_16:WaitForChild("Common")
local Statistics = Common_13:WaitForChild("Statistics")
local useJumpPower = require(Statistics:WaitForChild("useJumpPower"))
local ReplicatedStorage_17 = game:GetService("ReplicatedStorage")
local Common_14 = ReplicatedStorage_17:WaitForChild("Common")
local Statistics_2 = Common_14:WaitForChild("Statistics")
_, u369 = require(Statistics_2:WaitForChild("useWalkSpeed"))()
_, u372 = useJumpPower()
local u375 = Config.define({
    DASHING_DRAW_COOLDOWN = 300,
    DASHING_DRAW_HOLD_TIME = 0.3,
    DASHING_DRAW_BOOST_SPEED = 250,
    DASHING_DRAW_BOOST_DURATION = 0.3,
    DASHING_DRAW_CHARGE_WALK_SPEED = 5,
    DASHING_DRAW_CHARGE_JUMP_POWER = 0,
    DASHING_DRAW_CHARGE_PRIORITY = 100,
    BLADE_UNSHEATHE_LOCKOUT = 1.5,
    DROPPED_BLADE_LIFETIME = 3,
})
local u376 = 0
return {
    initialized = function(p1, p2) -- Line: 85 -- upvalues: Character (val), Handles (val), Gear_2 (val), Table (val), useAnimatorObserver (val), Gear (val), Players (val), Signals (val), ClientStateHandler (val), ClientAttributesHandler (val), u375 (val), States (val), Inventory (val), ClientInventoryHandler (val), QuickAccessItems (val), u369 (val), u372 (val), Effects (val), RunService (val), u376 (ref), ClientSettingsHandler (val)
        local trove = p2.trove
        local u3 = nil
        local u4 = false
        local function onHandleAnimationBinding(p1, p2) -- Line: 90 -- upvalues: u3 (ref), Character (upval), Handles (upval), Gear_2 (upval), Table (upval), useAnimatorObserver (upval), trove (val)
            if not p1 then
                if u3 then
                    u3()
                    u3 = nil
                end
                return
            end
            local v1 = Character.getCharacter()
            if not v1 then
                Handles.warn("No character found while on handle holster")
                return
            end
            local v2 = Gear_2
            if p2 and p2 ~= "Default" then
                local v3 = Table.copy(v2)
                v2 = Table.deepMerge(v3, Gear_2.Stances[p2])
            end
            if u3 then
                u3()
            end
            u3 = useAnimatorObserver.bind(v1.Humanoid.Animator, v2, 2)
            local u40 = u3
            trove:Add(function() -- Line: 123 -- upvalues: u40 (ref)
                if u40 then
                    u40()
                    u40 = nil
                end
            end)
        end
        local function onSuccessfullyUpdateHandles(p1) -- Line: 132 -- upvalues: Gear (upval), Handles (upval), trove (val), Character (upval), onHandleAnimationBinding (val), p2 (val)
            local v1, v2
            if not p1 then
                v1 = 0
            else
                v1 = 1
            end
            Gear.Holster.post(v1)
            if not p1 then
                v2 = "disabled"
            else
                v2 = "enabled"
            end
            Handles.info((("Successfully updated handles to %*"):format(v2)))
            if not p1 then
                onHandleAnimationBinding(p1)
                p2.handles = false
                return
            end
            if trove._cleaning or not (Character.isActive()) then
                Handles.warn("No character found while on handle holster")
                return
            end
            onHandleAnimationBinding(p1, p2.stance)
            p2.handles = true
        end
        local function onBladeHolster(p1) -- Line: 202 -- upvalues: Handles (upval), trove (val), p2 (val), u4 (ref), Signals (upval), ClientStateHandler (upval), Gear (upval), Players (upval), useAnimatorObserver (upval), Gear_2 (upval), ClientAttributesHandler (upval), u375 (upval)
            local v1
            if not p1 then
                v1 = "false"
            else
                v1 = "true"
            end
            Handles.info((("Blade holster called @ restocking=%*"):format(v1)))
            if trove._cleaning then
                return
            end
            if not p2.handles then
                if p2.handles then
                    v1 = "unsheathing"
                else
                    v1 = "handles not out"
                end
                Handles.warn((("Cannot equip blades at this time @ reason=%*"):format(v1)))
                return Signals.Toast:Fire({message = "You cannot equip blades at this time.", type = "error"})
            else
                local v2, v3
                if u4 then
                    if p2.handles then
                        v1 = "unsheathing"
                    else
                        v1 = "handles not out"
                    end
                    Handles.warn((("Cannot equip blades at this time @ reason=%*"):format(v1)))
                    return Signals.Toast:Fire({message = "You cannot equip blades at this time.", type = "error"})
                end
                v2, v3 = ClientStateHandler.isCategoryBusy(ClientStateHandler.Categories.NO_GEAR_HANDLE_USAGE)
                if v2 then
                    Handles.warn((("Cannot equip blades at this time @ blocked=%*"):format(v3)))
                    return Signals.Toast:Fire({message = "You cannot equip blades at this time.", type = "error"})
                end
                local u44 = Gear.Gear.get(Players.LocalPlayer)
                v1 = u44.blades == 1
                if p1 and v1 then
                    v1 = not v1
                end
                if u44.durability ~= 0 then
                    local Sheathe
                    if p2.animation then
                        p2.animation:Stop(0.3)
                    end
                    local play = useAnimatorObserver.play
                    if not v1 then
                        Sheathe = Gear_2.Blades.Unsheathe
                    else
                        Sheathe = Gear_2.Blades.Sheathe
                        if not Sheathe then
                            Sheathe = Gear_2.Blades.Unsheathe
                        end
                    end
                    local v4 = play(Sheathe)
                    if not v4 then
                        return
                    end
                    u4 = true
                    v4:AdjustSpeed(ClientAttributesHandler.getAttribute("GearBladeDrawMultiplier") or 0)
                    trove:Add(v4.KeyframeReached:Once(function() -- Line: 261 -- upvalues: u44 (val), Gear (upval), p1 (val), Handles (upval)
                        local v1, v2, v3
                        if u44.blades ~= 0 then
                            v1 = 0
                        else
                            v1 = 1
                        end
                        if not p1 then
                            v2 = v1
                        else
                            v2 = 1
                        end
                        Gear.Blades.unreliablePost(v2)
                        if p1 then
                            v3 = "restock"
                        elseif not v1 then
                            v3 = "unsheathe"
                        else
                            v3 = "sheathe"
                        end
                        Handles.info((("Sent request to the server to %* @ blades=%*"):format(v3, u44.blades)))
                    end))
                    if not p1 then
                        p2.blades = not p2.blades
                    end
                    task.wait(u375.BLADE_UNSHEATHE_LOCKOUT)
                    u4 = false
                    return
                elseif u44.stock == 0 then
                    return
                end
            end
        end
        local function onHandleHolster() -- Line: 282 -- upvalues: ClientStateHandler (upval), p2 (val), States (upval)
            if ClientStateHandler.isCategoryBusy(ClientStateHandler.Categories.NO_GEAR_HANDLE_USAGE) or p2.slacking or p2.wall_sliding or p2.grapples.left.active or p2.grapples.right.active then
                return false
            end
            p2.handles = not p2.handles
            p2.signals.handles:Fire(p2.handles)
            if not p2.handles then
                ClientStateHandler.updateState(States.HANDLES, false)
            else
                ClientStateHandler.updateState(States.HANDLES, true)
            end
            return true
        end
        local function onDropBlades() -- Line: 312 -- upvalues: p2 (val), Handles (upval), Signals (upval), Gear (upval), Players (upval), u375 (upval)
            local LocalPlayer
            if p2.busy() or not p2.enabled then
                Handles.warn((("Cannot drop blades at this time @ state.busy()=%*, state.enabled=%*"):format(p2.busy(), p2.enabled)))
                return Signals.Toast:Fire({message = "You cannot drop blades at this time.", type = "error"})
            end
            if Gear.Gear.get(Players.LocalPlayer).durability <= 0 then
                return
            end
            LocalPlayer = Players.LocalPlayer
            if LocalPlayer then
                LocalPlayer = Players.LocalPlayer.Character
            end
            local LeftGearHandle = LocalPlayer:FindFirstChild("LeftGearHandle")
            local RightGearHandle = LocalPlayer:FindFirstChild("RightGearHandle")
            local v1 = {LeftGearHandle, RightGearHandle}
            local v2 = nil
            local v3 = nil
            for i, j in v1, v2, v3 do
                local u55 = j:FindFirstChild("Handle"):FindFirstChild("Blade"):Clone()
                u55.Parent = workspace
                for k, n in u55:GetChildren() do
                    if n:IsA("BasePart") then
                        n.CanCollide = true
                        n.Anchored = false
                    end
                end
                task.delay(u375.DROPPED_BLADE_LIFETIME, function() -- Line: 348 -- upvalues: u55 (val)
                    u55:Destroy()
                end)
            end
            Gear.Blades.unreliablePost(0, 1)
        end
        trove:Add(p2.signals.handles:Connect(function(p1) -- Line: 171 -- upvalues: trove (val), p2 (val), Gear (upval), Players (upval), useAnimatorObserver (upval), Gear_2 (upval), Handles (upval), onSuccessfullyUpdateHandles (val)
            local v1, v2
            if trove._cleaning then
                return
            end
            p2.addTimeout(1)
            local v3 = Gear.Gear.get(Players.LocalPlayer)
            if not v3 then
                local Default
                local play_2 = useAnimatorObserver.play
                if not p1 then
                    Default = Gear_2.Holster.Default
                else
                    Default = Gear_2.Unholster.Default
                    if not Default then
                        Default = Gear_2.Holster.Default
                    end
                end
                v1 = play_2(Default)
            elseif v3.blades == 1 then
                local Blades
                local play = useAnimatorObserver.play
                if not p1 then
                    Blades = Gear_2.Holster.Blades
                else
                    Blades = Gear_2.Unholster.Blades
                    if not Blades then
                        Blades = Gear_2.Holster.Blades
                    end
                end
                v1 = play(Blades)
            end
            if not v1 then
                return
            end
            if not p1 then
                v2 = "holster"
            else
                v2 = "unholster"
            end
            Handles.info((("Playing handle animation %*"):format(v2)))
            trove:Add(v1.KeyframeReached:Once(function() -- Line: 195 -- upvalues: onSuccessfullyUpdateHandles (upval), p1 (val)
                onSuccessfullyUpdateHandles(p1)
            end))
        end))
        local function onVerifyHandleAttempt() -- Line: 361 -- upvalues: p2 (val), Inventory (upval), Players (upval), ClientInventoryHandler (upval), ClientAttributesHandler (upval), QuickAccessItems (upval), ClientStateHandler (upval), Handles (upval), Signals (upval)
            if p2.busy() then
                return false
            else
                if not p2.enabled then
                    return false
                end
                local v1 = Inventory.Tool.get(Players.LocalPlayer)
                local v2 = v1
                if v2 then
                    v2 = ClientInventoryHandler.getItemNameFromHash(v1.hash)
                end
                local v3 = ClientAttributesHandler.getAttribute("HasQuickAccess") == 1
                local v4 = v2
                if v4 then
                    v4 = QuickAccessItems[v2]
                end
                if not (ClientStateHandler.isStateBusy(ClientStateHandler.States.TOOL)) then
                    if not (ClientStateHandler.isCategoryBusy(ClientStateHandler.Categories.NO_GEAR_HANDLE_USAGE)) then
                        if ClientStateHandler.isCategoryBusy(ClientStateHandler.Categories.NO_GEAR_HANDLE_USAGE) then
                            return false
                        end
                        if not p2.slacking then
                            if p2.wall_sliding or p2.grapples.left.active or p2.grapples.right.active then
                                return false
                            end
                            return true
                        end
                        return false
                    end
                    if not v3 or not v4 or ClientStateHandler.isCategoryBusy(ClientStateHandler.Categories.NO_GEAR_HANDLE_USAGE) or p2.slacking or p2.wall_sliding or p2.grapples.left.active or p2.grapples.right.active then
                        return false
                    end
                    return true
                elseif not v3 then
                    Handles.warn("Cannot equip handles while holding a tool")
                    Signals.Toast:Fire({message = "You cannot equip handles while holding a tool.", type = "error"})
                    return false
                elseif not v4 then
                    Handles.warn("Cannot equip handles while holding a tool")
                    Signals.Toast:Fire({message = "You cannot equip handles while holding a tool.", type = "error"})
                    return false
                end
            end
        end
        local function onEquipHandleAttempt() -- Line: 414 -- upvalues: onVerifyHandleAttempt (val), ClientInventoryHandler (upval), onHandleHolster (val)
            if not (onVerifyHandleAttempt()) then
                return false
            end
            ClientInventoryHandler.addItemEquipCooldown(0.8)
            return onHandleHolster()
        end
        local u23 = false
        local u24 = false
        local u25 = nil
        local u26 = nil
        local u27 = nil
        local function onBeginDashingDraw() -- Line: 434 -- upvalues: u24 (ref), ClientStateHandler (upval), States (upval), useAnimatorObserver (upval), Gear_2 (upval), u26 (ref), u369 (upval), u375 (upval), u27 (ref), u372 (upval)
            u24 = true
            ClientStateHandler.updateState(States.HANDLES, true)
            useAnimatorObserver.play(Gear_2.Draw.Charge, 0.1, Enum.AnimationPriority.Action4)
            u26 = u369("dashing_draw", u375.DASHING_DRAW_CHARGE_WALK_SPEED, "set", u375.DASHING_DRAW_CHARGE_PRIORITY)
            u27 = u372("dashing_draw", u375.DASHING_DRAW_CHARGE_JUMP_POWER, "set", u375.DASHING_DRAW_CHARGE_PRIORITY)
        end
        local function onReleaseDashingDraw() -- Line: 455 -- upvalues: u24 (ref), useAnimatorObserver (upval), Gear_2 (upval), u26 (ref), u27 (ref), trove (val), p2 (val), Effects (upval), onSuccessfullyUpdateHandles (val), Gear (upval), Players (upval), Character (upval), RunService (upval), u375 (upval), u376 (upval), ClientStateHandler (upval), States (upval)
            if not u24 then
                return
            end
            u24 = false
            useAnimatorObserver.stop(Gear_2.Draw.Charge)
            if u26 and u27 then
                u26()
                u27()
            end
            if trove._cleaning or not p2.enabled then
                return
            end
            if p2.stance == "Crossguard" then
                Effects.sendReplicatedEffect("Dashing Draw")
            end
            p2.signals.handles:Fire(true)
            onSuccessfullyUpdateHandles(true)
            local v1 = Gear.Gear.get(Players.LocalPlayer)
            if v1 and v1.blades == 0 and p2.blades == false then
                Gear.Blades.unreliablePost(1)
                p2.blades = true
            end
            p2.signals.simulateBladeSwing:Fire(0.5)
            local u59 = Character.getCharacter()
            if not u59 then
                return
            end
            p2.signals.boosting:Fire(true)
            local LookVector = u59.HumanoidRootPart.CFrame.LookVector
            local u75 = RunService.RenderStepped:Connect(function(p1) -- Line: 503 -- upvalues: u59 (val), LookVector (val), u375 (upval)
                u59.HumanoidRootPart.AssemblyLinearVelocity = LookVector * u375.DASHING_DRAW_BOOST_SPEED
            end)
            trove:Add(u75)
            task.delay(u375.DASHING_DRAW_BOOST_DURATION, function() -- Line: 511 -- upvalues: u75 (val), p2 (upval)
                u75:Disconnect()
                p2.signals.boosting:Fire(false)
            end)
            useAnimatorObserver.play(Gear_2.Draw.Slash, 0.1, Enum.AnimationPriority.Action3)
            u376 = tick()
            ClientStateHandler.updateState(States.HANDLES, true)
        end
        trove:Add(onReleaseDashingDraw)
        trove:Add(ClientSettingsHandler.onKeybindPressed("Equip Handles"):Connect(function() -- Line: 526 -- upvalues: onVerifyHandleAttempt (val), Gear (upval), Players (upval), ClientAttributesHandler (upval), p2 (val), u23 (ref), u25 (ref), u375 (upval), u376 (upval), Signals (upval), onBeginDashingDraw (val), onEquipHandleAttempt (val)
            if not (onVerifyHandleAttempt()) then
                return
            end
            local v1 = Gear.Gear.get(Players.LocalPlayer)
            local v2 = ClientAttributesHandler.getAttribute("HasDashingDraw") == 1
            local v3 = v1
            if v3 then
                v3 = if 0 >= v1.stock then 0 < v1.durability else true
            end
            if not v2 or p2.handles or not v3 then
                return onEquipHandleAttempt()
            end
            u23 = true
            u25 = task.delay(u375.DASHING_DRAW_HOLD_TIME, function() -- Line: 542 -- upvalues: u23 (upval), u376 (upval), u375 (upval), Signals (upval), onBeginDashingDraw (upval)
                if not u23 then
                    return
                end
                local v1 = tick() - u376
                if v1 < u375.DASHING_DRAW_COOLDOWN then
                    Signals.Toast:Fire({message = "You cannot use dashing draw again so soon.", type = "error"})
                    return
                end
                onBeginDashingDraw()
            end)
        end))
        trove:Add(ClientSettingsHandler.onKeybindReleased("Equip Handles"):Connect(function() -- Line: 566 -- upvalues: ClientAttributesHandler (upval), u23 (ref), u25 (ref), u24 (ref), onReleaseDashingDraw (val), onEquipHandleAttempt (val)
            if ClientAttributesHandler.getAttribute("HasDashingDraw") == 0 or not u23 then
                return
            end
            if u25 then
                pcall(task.cancel, u25)
                u25 = nil
            end
            u23 = false
            if not u24 then
                return onEquipHandleAttempt()
            end
            onReleaseDashingDraw()
        end))
        local u56 = false
        trove:Add(ClientSettingsHandler.onKeybindPressed("Equip Blades"):Connect(function() -- Line: 593 -- upvalues: p2 (val), Handles (upval), Signals (upval), ClientStateHandler (upval), Gear (upval), Players (upval), ClientInventoryHandler (upval), u56 (ref), onBladeHolster (val), onDropBlades (val)
            if p2.busy() then
                Handles.warn((("Cannot equip blades at this time @ state.busy()=%*, state.enabled=%*"):format(p2.busy(), p2.enabled)))
                return Signals.Toast:Fire({message = "You cannot equip blades at this time.", type = "error"})
            else
                if not p2.enabled then
                    Handles.warn((("Cannot equip blades at this time @ state.busy()=%*, state.enabled=%*"):format(p2.busy(), p2.enabled)))
                    return Signals.Toast:Fire({message = "You cannot equip blades at this time.", type = "error"})
                end
                if ClientStateHandler.isStateBusy(ClientStateHandler.States.TOOL) then
                    return
                else
                    if not p2.handles then
                        return
                    end
                    local v1 = Gear.Gear.get(Players.LocalPlayer)
                    if v1.durability ~= 0 then
                        ClientInventoryHandler.addItemEquipCooldown(1.2)
                        local v2 = 0
                        u56 = true
                        while true do
                            task.wait(0.1)
                            v2 = v2 + 1
                            if u56 then
                                if 10 <= v2 then
                                    u56 = false
                                    return onDropBlades()
                                end
                                if not u56 then
                                    return
                                end
                            elseif v2 < 10 then
                                break
                            end
                        end
                        v1 = Gear.Gear.get(Players.LocalPlayer)
                        if v1.durability ~= 0 then
                            return onBladeHolster()
                        end
                        if v1.blades == 1 then
                            return onBladeHolster(true)
                        end
                        return onBladeHolster()
                    elseif v1.stock == 0 and v1.blades == 0 then
                        Signals.Monologue:Fire("I am completely out of blades, I need to restock.")
                        return
                    end
                end
            end
        end))
        trove:Add(p2.signals.cycle:Connect(function() -- Line: 642 -- upvalues: p2 (val), ClientStateHandler (upval), onBladeHolster (val)
            local onAttemptToDrawBlades
            local u1 = tick()
            function onAttemptToDrawBlades() -- Line: 645 -- upvalues: p2 (upval), u1 (val), ClientStateHandler (upval), onAttemptToDrawBlades (val), onBladeHolster (upval)
                if not p2.enabled then
                    return
                end
                local v1 = tick() - u1
                if 2 < v1 then
                    return
                end
                if p2.busy() then
                    task.wait(0.1)
                    return onAttemptToDrawBlades()
                end
                if not (ClientStateHandler.isCategoryBusy(ClientStateHandler.Categories.NO_GEAR_HANDLE_USAGE)) then
                    return onBladeHolster(true)
                end
                task.wait(0.1)
                return onAttemptToDrawBlades()
            end
            return onAttemptToDrawBlades()
        end))
        trove:Add(ClientSettingsHandler.onKeybindReleased("Equip Blades"):Connect(function() -- Line: 668 -- upvalues: p2 (val), u56 (ref)
            if p2.busy() or not p2.enabled then
                return
            end
            u56 = false
        end))
        trove:Add(p2.signals.onDropBlades:Connect(onDropBlades))
        trove:Add(p2.signals.stance:Connect(function(p1) -- Line: 153 -- upvalues: Handles (upval), onHandleAnimationBinding (val), p2 (val)
            Handles.info((("Stance changed to: %*"):format(p1)))
            onHandleAnimationBinding(false)
            if not p2.handles then
                return
            end
            if p1 == "Default" then
                onHandleAnimationBinding(true)
                return
            end
            onHandleAnimationBinding(true, p1)
        end))
        trove:Add(ClientSettingsHandler.onKeybindPressed("Remove Gear"):Connect(function() -- Line: 681 -- upvalues: p2 (val), Gear (upval)
            if p2.busy() or not p2.enabled then
                return
            end
            Gear.Remove.post(1)
        end))
    end,
    destroyed = function() end,
}