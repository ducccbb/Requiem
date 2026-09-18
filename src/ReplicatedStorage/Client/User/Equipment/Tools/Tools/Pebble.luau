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
--           File: ReplicatedStorage.Client.User.Equipment.Tools.Tools.Pebble
--                              Dumped in 0.000892 seconds
--                          Bytecode version 9  |  8 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Animations = Common:WaitForChild("Animations")
local Default = require(Animations:WaitForChild("Default"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Observers = Common_2:WaitForChild("Observers")
local useAnimatorObserver = require(Observers:WaitForChild("useAnimatorObserver"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Utilities = Common_3:WaitForChild("Utilities")
local Character = require(Utilities:WaitForChild("Character"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_4:WaitForChild("Common")
local Effects_2 = Common_4:WaitForChild("Effects")
local Effects = require(Effects_2:WaitForChild("Effects"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_5:WaitForChild("Common")
local Types = Common_5:WaitForChild("Types")
local v2 = {
    description = "A pebble meant for throwing.",
    attributes = {"Throwable"},
    category = require(Types:WaitForChild("Item")).CATEGORIES.Tool,
}
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_6:WaitForChild("Common")
local Pebble = require(Common_6:WaitForChild("Logger"))("Pebble")
local u145 = false
local function getThrowTrajectory() -- Line: 47 -- upvalues: Character (val), Players (val), Workspace (val)
    local Position
    local v1 = Character.getCharacter()
    local HumanoidRootPart = v1
    if HumanoidRootPart then
        HumanoidRootPart = v1:FindFirstChild("HumanoidRootPart")
    end
    if not HumanoidRootPart then
        return nil
    end
    local Mouse = Players.LocalPlayer:GetMouse()
    local v2 = HumanoidRootPart.CFrame * Vector3.new(0, 1.2, -1.5)
    local Unit = (Mouse.Hit.Position - v2).Unit
    local v3 = -Workspace.Gravity * 0.4
    local v4 = Vector3.new(0, v3, 0)
    local v5 = RaycastParams.new()
    v5.FilterType = Enum.RaycastFilterType.Exclude
    if not v1 then
        v3 = {}
    else
        v3 = {v1}
    end
    v5.FilterDescendantsInstances = v3
    v3 = Workspace:Raycast(v2, Unit * 250, v5)
    if not v3 then
        Position = v2 + Unit * 250
    else
        Position = v3.Position
    end
    return {startPos = v2, endPos = Position, velocity = Unit * 220, gravity = v4}
end
local u147 = nil
local u148 = nil
local function onThrow(p1) -- Line: 80 -- upvalues: useAnimatorObserver (val), Default (val), Pebble (val), u148 (ref), getThrowTrajectory (val), Players (val), u145 (ref), Effects (val)
    local v1 = useAnimatorObserver.play(Default.Throw, 0.1)
    if not v1 then
        Pebble.warn("No track found while equipped")
        return
    end
    if u148 and u148.Connected then
        u148:Disconnect()
        u148 = nil
    end
    u148 = v1.KeyframeReached:Connect(function(a1) -- Line: 94 -- upvalues: u148 (upval), getThrowTrajectory (upval), p1 (val), Players (upval), u145 (upval), Effects (upval)
        if a1 ~= "Throw" then
            return
        end
        if u148 and u148.Connected then
            u148:Disconnect()
            u148 = nil
        end
        local v1 = getThrowTrajectory()
        if not v1 then
            p1()
            return
        end
        local v2 = {
            skip = true,
            startPos = v1.startPos,
            endPos = v1.endPos,
            velocity = v1.velocity,
            gravity = v1.gravity,
            userId = Players.LocalPlayer.UserId,
        }
        task.delay(0.3, function() -- Line: 119 -- upvalues: u145 (upval)
            u145 = false
        end)
        Effects.emitClientEffect("Pebble", v2)
        v2.skip = false
        p1({data = v2})
    end)
end
return {
    equipped = function(p1) -- Line: 132 -- upvalues: Character (val), Pebble (val), u147 (ref), UserInputService (val), u145 (ref), onThrow (val)
        if not (Character.getCharacter()) then
            Pebble.warn("No character found while equipped")
            return
        end
        u147 = UserInputService.InputBegan:Connect(function(a1) -- Line: 139 -- upvalues: u145 (upval), onThrow (upval), p1 (val)
            if a1.UserInputType ~= Enum.UserInputType.MouseButton1 or u145 then
                return
            end
            u145 = true
            onThrow(p1)
        end)
    end,
    unequipped = function() -- Line: 157 -- upvalues: u147 (ref), u148 (ref)
        if u147 then
            u147:Disconnect()
            u147 = nil
        end
        if u148 and u148.Connected then
            u148:Disconnect()
            u148 = nil
        end
    end,
    data = v2,
}