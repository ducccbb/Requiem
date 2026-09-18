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
--             File: ReplicatedStorage.Client.User.Equipment.Tools.Tools.Axe
--                              Dumped in 0.000867 seconds
--                          Bytecode version 9  |  9 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Types = Common:WaitForChild("Types")
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Utilities = Common_2:WaitForChild("Utilities")
local Character = require(Utilities:WaitForChild("Character"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Statistics = Common_3:WaitForChild("Statistics")
local useWalkSpeed = require(Statistics:WaitForChild("useWalkSpeed"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_4:WaitForChild("Client")
local Progression = Client:WaitForChild("Progression")
local ClientAttributesHandler = require(Progression:WaitForChild("ClientAttributesHandler"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_5:WaitForChild("Common")
local Animations = Common_4:WaitForChild("Animations")
local Tools = Animations:WaitForChild("Tools")
local Axe = require(Tools:WaitForChild("Axe"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_6:WaitForChild("Common")
local Observers = Common_5:WaitForChild("Observers")
local useAnimatorObserver = require(Observers:WaitForChild("useAnimatorObserver"))
local u141 = nil
local u142 = nil
local u143 = false
local u144 = nil
local v2 = {
    description = "A standard axe, used for chopping down trees.",
    attributes = {"Resource Gathering"},
    category = require(Types:WaitForChild("Item")).CATEGORIES.Tool,
}
local function onAxeSwing(p1) -- Line: 53 -- upvalues: useWalkSpeed (val), u144 (ref), Character (val), Workspace (val), Axe (val), useAnimatorObserver (val), ClientAttributesHandler (val), u143 (ref)
    local v1, v2
    _, v1 = useWalkSpeed()
    u144 = v1("axe", 5, "set", 20)
    _, v2 = Character.getCharacterAsync():await()
    local u18 = RaycastParams.new()
    u18.FilterType = Enum.RaycastFilterType.Exclude
    local v3 = {v2}
    u18.FilterDescendantsInstances = v3
    local PrimaryPart = v2
    if PrimaryPart then
        PrimaryPart = v2.PrimaryPart
    end
    local function getForwardResults(p1) -- Line: 65 -- upvalues: Workspace (upval), u18 (val)
        local v1 = p1 * CFrame.new(0, 0, 2)
        local v2 = p1.LookVector * 7
        return (Workspace:Spherecast(v1.Position, 2, v2, u18))
    end
    local v4 = useAnimatorObserver.play((function() -- Line: 72 -- upvalues: PrimaryPart (val), Axe (upval), getForwardResults (val)
        if not PrimaryPart then
            return Axe.Downward
        end
        local v1 = getForwardResults(PrimaryPart.CFrame * CFrame.new(0, -1.5, 0))
        local v2 = getForwardResults(PrimaryPart.CFrame * CFrame.new(0, 5, 0))
        if not v2 or not v2.Instance or not v1 then
            return Axe.Downward
        end
        if v1.Instance == v2.Instance then
            return Axe.Sideways
        end
        return Axe.Downward
    end)(), 0.1)
    if v4 then
        v4:AdjustSpeed((ClientAttributesHandler.getAttribute("ToolSwingSpeedMultiplier")))
    end
    u143 = true
    task.delay(0.3, function() -- Line: 99 -- upvalues: PrimaryPart (val), getForwardResults (val), p1 (val)
        if not PrimaryPart then
            return
        end
        local v1 = getForwardResults(PrimaryPart.CFrame * CFrame.new(0, -1.5, 0))
        if v1 and v1.Instance then
            p1(v1.Instance)
        end
    end)
    task.wait(0.95)
    if u144 then
        u144()
    end
    u143 = false
end
return {
    equipped = function(p1) -- Line: 122 -- upvalues: Character (val), u141 (ref), useAnimatorObserver (val), Axe (val), u142 (ref), UserInputService (val), u143 (ref), onAxeSwing (val)
        Character.getCharacterAsync():andThen(function(p1) -- Line: 123 -- upvalues: u141 (upval), useAnimatorObserver (upval), Axe (upval)
            u141 = useAnimatorObserver.bind(p1.Humanoid.Animator, Axe, 2)
        end)
        u142 = UserInputService.InputBegan:Connect(function(a1) -- Line: 127 -- upvalues: u141 (upval), u143 (upval), onAxeSwing (upval), p1 (val)
            if not u141 or a1.UserInputType ~= Enum.UserInputType.MouseButton1 or u143 then
                return
            end
            onAxeSwing(p1)
        end)
    end,
    unequipped = function() -- Line: 139 -- upvalues: u141 (ref), u142 (ref), u144 (ref)
        if u141 then
            u141()
            u141 = nil
        end
        if u142 then
            u142:Disconnect()
            u142 = nil
        end
        if u144 then
            u144()
            u144 = nil
        end
    end,
    data = v2,
}