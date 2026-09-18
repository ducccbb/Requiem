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
--          File: ReplicatedStorage.Client.User.Equipment.Tools.Tools.Flare Gun
--                               Dumped in 0.00136 seconds
--                          Bytecode version 9  |  10 functions

local flare, flare_2
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Effects_2 = Common:WaitForChild("Effects")
local Effects = require(Effects_2:WaitForChild("Effects"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Signals = require(Common_2:WaitForChild("Signals"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_3:WaitForChild("Packages")
local trove = require(Packages:WaitForChild("trove"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Animations = Common_3:WaitForChild("Animations")
local Tools = Animations:WaitForChild("Tools")
local u98 = require(Tools:WaitForChild("Flare Gun"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_5:WaitForChild("Common")
local Observers = Common_4:WaitForChild("Observers")
local useAnimatorObserver = require(Observers:WaitForChild("useAnimatorObserver"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_6:WaitForChild("Client")
local Progression = Client:WaitForChild("Progression")
local ClientAttributesHandler = require(Progression:WaitForChild("ClientAttributesHandler"))
local ClientInventoryHandler = require(script.Parent.Parent:WaitForChild("ClientInventoryHandler"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_7:WaitForChild("Common")
local Types = Common_5:WaitForChild("Types")
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_8:WaitForChild("Common")
local Utilities = Common_6:WaitForChild("Utilities")
flare, _, _, flare_2 = require(Utilities:WaitForChild("State"))("flare")
local v2 = {description = "A flare gun, used for signaling for help.", category = require(Types:WaitForChild("Item")).CATEGORIES.Tool}
local u193 = trove.new()
local u194 = nil
local u195 = 0
local u196 = {
    red = Color3.fromRGB(255, 0, 4),
    green = Color3.fromRGB(0, 255, 17),
    blue = Color3.fromRGB(56, 68, 230),
    yellow = Color3.fromRGB(255, 226, 59),
    purple = Color3.fromRGB(175, 12, 190),
    black = Color3.fromRGB(0, 0, 0),
}
local function Point_C0_To_Mouse(p1, p2) -- Line: 74
    local Part1 = p1.Part1
    if not Part1 then
        return p1.C0
    end
    local C1 = p1.C1
    local C0 = p1.C0
    local v1 = C0 * C1:Inverse()
    local v2 = v1 * Part1.CFrame:Inverse() * p2 * C1
    return v2 - v2.Position + C0.Position
end
local function getFlareMultipliers() -- Line: 98 -- upvalues: ClientAttributesHandler (val)
    return {scaleMultiplier = ClientAttributesHandler.getAttribute("FlareScaleMultiplier"), durationMultiplier = ClientAttributesHandler.getAttribute("FlareDurationMultiplier"), brightnessMultiplier = ClientAttributesHandler.getAttribute("FlareBrightnessMultiplier")}
end
local function onFlareGunShoot(p1, p2) -- Line: 109 -- upvalues: Players (val), u196 (val), flare_2 (val), getFlareMultipliers (val), Effects (val)
    local Hit = Players.LocalPlayer:GetMouse().Hit
    local v1 = u196[flare_2().color]
    local v2 = getFlareMultipliers()
    Effects.emitClientEffect("Flare", {
        targetPos = Hit,
        startPos = p1,
        userId = Players.LocalPlayer.UserId,
        color = v1,
        scaleMultiplier = v2.scaleMultiplier,
        durationMultiplier = v2.durationMultiplier,
        brightnessMultiplier = v2.brightnessMultiplier,
    })
    p2({
        key = 2,
        data = {
            targetPos = Hit,
            startPos = p1,
            userId = Players.LocalPlayer.UserId,
            color = v1,
            colorName = flare_2().color,
        },
    })
end
return {
    equipped = function(p1) -- Line: 147 -- upvalues: Players (val), u194 (ref), useAnimatorObserver (val), u98 (val), RunService (val), Point_C0_To_Mouse (val), u193 (val), UserInputService (val), ClientAttributesHandler (val), u195 (ref), Signals (val), ClientInventoryHandler (val), onFlareGunShoot (val), flare_2 (val), flare (val)
        local LocalPlayer = Players.LocalPlayer
        local Character = LocalPlayer.Character
        if not Character then
            return
        end
        local Torso = Character:FindFirstChild("Torso")
        if not Torso then
            Torso = Character:FindFirstChild("UpperTorso")
        end
        if not Torso then
            return
        end
        local v1 = Torso:FindFirstChild("Right Shoulder")
        local RightUpperArm = Character:FindFirstChild("Right Arm")
        if not RightUpperArm then
            RightUpperArm = Character:FindFirstChild("RightUpperArm")
        end
        if not v1 or not RightUpperArm then
            return
        end
        u194 = v1.C0
        local u36 = useAnimatorObserver.bind(Character.Humanoid.Animator, u98, 2)
        local Mouse = LocalPlayer:GetMouse()
        local v2 = RunService.RenderStepped:Connect(function() -- Line: 178 -- upvalues: Character (val), Torso (val), Mouse (val), Point_C0_To_Mouse (upval), p1 (val)
            if not Character or not Character.Parent or not Torso or not Torso.Parent then
                return
            end
            local v1 = Torso:FindFirstChild("Right Shoulder")
            local RightUpperArm = Character:FindFirstChild("Right Arm")
            if not RightUpperArm then
                RightUpperArm = Character:FindFirstChild("RightUpperArm")
            end
            if not v1 or not RightUpperArm then
                return
            end
            local v2 = CFrame.lookAt(RightUpperArm.Position, Mouse.Hit.Position)
            local v3 = Point_C0_To_Mouse(v1, v2)
            v1.C0 = v3 * CFrame.Angles(0, 0, (math.deg(-90)))
            p1({key = 1, data = v1.C0})
        end)
        u193:Add(v2)
        local v3 = UserInputService.InputBegan:Connect(function(a1, p2) -- Line: 210 -- upvalues: UserInputService (upval), ClientAttributesHandler (upval), u195 (upval), Signals (upval), LocalPlayer (val), ClientInventoryHandler (upval), onFlareGunShoot (upval), p1 (val)
            if a1.UserInputType ~= Enum.UserInputType.MouseButton1 or UserInputService:GetFocusedTextBox() or p2 or ClientAttributesHandler.getAttribute("IsSilenced") == 1 then
                return
            end
            local v1 = tick()
            local v2 = v1 - u195
            if v2 < 3 then
                Signals.Monologue:Fire("My flare gun isn't quite ready yet.")
                return
            end
            local Character = LocalPlayer.Character
            if not Character then
                return
            end
            local v3 = Character:FindFirstChild("Flare Exit", true)
            if not v3 then
                return
            end
            u195 = v1
            ClientInventoryHandler.addItemEquipCooldown(1)
            onFlareGunShoot(v3.WorldCFrame, p1)
        end)
        if not (flare_2()) then
            flare({visible = true, color = "red"})
        end
        flare({visible = true, color = flare_2().color})
        u193:Add(v3)
        u193:Add(function() -- Line: 267 -- upvalues: u36 (val)
            if not u36 then
                return
            end
            u36()
        end)
        u193:Add(function() -- Line: 275 -- upvalues: flare (upval), flare_2 (upval)
            flare({visible = false, color = flare_2().color})
        end)
    end,
    unequipped = function() -- Line: 283 -- upvalues: Players (val), u194 (ref), u193 (val)
        local Character = Players.LocalPlayer.Character
        if Character and u194 then
            local Torso = Character:FindFirstChild("Torso")
            if not Torso then
                Torso = Character:FindFirstChild("UpperTorso")
            end
            local v1 = Torso
            if v1 then
                v1 = Torso:FindFirstChild("Right Shoulder")
            end
            if v1 then
                v1.C0 = u194
            end
        end
        u194 = nil
        u193:Clean()
    end,
    data = v2,
}