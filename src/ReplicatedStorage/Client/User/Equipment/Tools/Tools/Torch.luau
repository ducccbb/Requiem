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
--            File: ReplicatedStorage.Client.User.Equipment.Tools.Tools.Torch
--                              Dumped in 0.000586 seconds
--                          Bytecode version 9  |  7 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Character = require(Utilities:WaitForChild("Character"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Statistics = Common_2:WaitForChild("Statistics")
local useWalkSpeed = require(Statistics:WaitForChild("useWalkSpeed"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Types = Common_3:WaitForChild("Types")
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_4:WaitForChild("Common")
local Animations = Common_4:WaitForChild("Animations")
local Tools = Animations:WaitForChild("Tools")
local Torch = require(Tools:WaitForChild("Torch"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_5:WaitForChild("Common")
local Observers = Common_5:WaitForChild("Observers")
local useAnimatorObserver = require(Observers:WaitForChild("useAnimatorObserver"))
local u117 = nil
local u118 = nil
local u119 = false
local u120 = nil
local v2 = {description = "A standard torch, used to scare away animals.", attributes = {}, category = require(Types:WaitForChild("Item")).CATEGORIES.Tool}
local function onTorchSwing(p1) -- Line: 50 -- upvalues: useWalkSpeed (val), u120 (ref), useAnimatorObserver (val), Torch (val), u119 (ref)
    local v1
    _, v1 = useWalkSpeed()
    u120 = v1("torch", 12, "set", 20)
    useAnimatorObserver.play(Torch.Swing, 0.1)
    u119 = true
    task.delay(1.25, function() -- Line: 58 -- upvalues: p1 (val)
        p1()
    end)
    task.wait(2)
    if u120 then
        u120()
    end
    u119 = false
end
return {
    equipped = function(p1) -- Line: 76 -- upvalues: Character (val), u117 (ref), useAnimatorObserver (val), Torch (val), u118 (ref), UserInputService (val), u119 (ref), onTorchSwing (val)
        Character.getCharacterAsync():andThen(function(p1) -- Line: 77 -- upvalues: u117 (upval), useAnimatorObserver (upval), Torch (upval)
            u117 = useAnimatorObserver.bind(p1.Humanoid.Animator, Torch, 2)
        end)
        u118 = UserInputService.InputBegan:Connect(function(a1) -- Line: 81 -- upvalues: u117 (upval), u119 (upval), onTorchSwing (upval), p1 (val)
            if not u117 or a1.UserInputType ~= Enum.UserInputType.MouseButton1 or u119 then
                return
            end
            onTorchSwing(p1)
        end)
    end,
    unequipped = function() -- Line: 93 -- upvalues: u117 (ref), u118 (ref), u120 (ref)
        if u117 then
            u117()
            u117 = nil
        end
        if u118 then
            u118:Disconnect()
            u118 = nil
        end
        if u120 then
            u120()
            u120 = nil
        end
    end,
    data = v2,
}