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
--        File: ReplicatedStorage.Client.User.Equipment.Tools.Tools.Farming Tool
--                              Dumped in 0.000857 seconds
--                          Bytecode version 9  |  8 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local CollectionService = game:GetService("CollectionService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
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
local u107 = require(Tools:WaitForChild("Farming Tool"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_5:WaitForChild("Common")
local Observers = Common_5:WaitForChild("Observers")
local useAnimatorObserver = require(Observers:WaitForChild("useAnimatorObserver"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_6:WaitForChild("Client")
local Progression = Client:WaitForChild("Progression")
local ClientAttributesHandler = require(Progression:WaitForChild("ClientAttributesHandler"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_7:WaitForChild("Common")
local Types_2 = Common_6:WaitForChild("Types")
local Ingots = require(Types_2:WaitForChild("Ingots"))
local u165 = nil
local u166 = nil
local u167 = false
local u168 = nil
local v2 = {
    description = "A farming tool for working soil and crops.",
    attributes = {"Farming"},
    category = require(Types:WaitForChild("Item")).CATEGORIES.Tool,
}
local function onFarmingSwing(p1) -- Line: 47 -- upvalues: useWalkSpeed (val), u168 (ref), useAnimatorObserver (val), u107 (val), ClientAttributesHandler (val), u167 (ref), CollectionService (val), Character (val), Workspace (val)
    local v1
    _, v1 = useWalkSpeed()
    u168 = v1("farming_tool", 5, "set", 20)
    local v2 = useAnimatorObserver.play(u107.Swing, 0.1)
    if v2 then
        v2:AdjustSpeed((ClientAttributesHandler.getAttribute("ToolSwingSpeedMultiplier")))
    end
    u167 = true
    task.delay(0.3, function() -- Line: 58 -- upvalues: CollectionService (upval), Character (upval), Workspace (upval), p1 (val)
        local v1
        local Tagged = CollectionService:GetTagged("Farmland")
        local v2 = RaycastParams.new()
        v2.FilterType = Enum.RaycastFilterType.Include
        v2.FilterDescendantsInstances = Tagged
        _, v1 = Character.getCharacterAsync():await()
        local PrimaryPart = v1.PrimaryPart
        local LookVector = PrimaryPart
        if LookVector then
            LookVector = PrimaryPart.CFrame.LookVector
        end
        if not LookVector or not PrimaryPart then
            return
        end
        local v3 = PrimaryPart.CFrame * CFrame.new(0, 0, 2)
        local v4 = Workspace:Spherecast(v3.Position, 2, LookVector * 10, v2)
        if v4 and v4.Instance then
            p1(v4.Instance)
        end
    end)
    task.wait(0.7)
    if u168 then
        u168()
    end
    u167 = false
end
return {
    equipped = function(p1) -- Line: 89 -- upvalues: Character (val), u165 (ref), useAnimatorObserver (val), u107 (val), u166 (ref), UserInputService (val), u167 (ref), onFarmingSwing (val)
        Character.getCharacterAsync():andThen(function(p1) -- Line: 90 -- upvalues: u165 (upval), useAnimatorObserver (upval), u107 (upval)
            u165 = useAnimatorObserver.bind(p1.Humanoid.Animator, u107, 2)
        end)
        u166 = UserInputService.InputBegan:Connect(function(a1) -- Line: 94 -- upvalues: u165 (upval), u167 (upval), onFarmingSwing (upval), p1 (val)
            if not u165 or a1.UserInputType ~= Enum.UserInputType.MouseButton1 or u167 then
                return
            end
            onFarmingSwing(p1)
        end)
    end,
    unequipped = function() -- Line: 103 -- upvalues: u165 (ref), u166 (ref), u168 (ref)
        if u165 then
            u165()
            u165 = nil
        end
        if u166 then
            u166:Disconnect()
            u166 = nil
        end
        if u168 then
            u168()
            u168 = nil
        end
    end,
    render = function(p1, p2) -- Line: 120 -- upvalues: Ingots (val)
        local Folder = p2:FindFirstChild("Folder")
        local Tip = Folder
        if Tip then
            Tip = Folder:FindFirstChild("Tip")
        end
        if Tip then
            Ingots.colorObjectFromTags(Tip, Ingots.INGOT_COLORS, p1.tags)
        end
    end,
    data = v2,
}