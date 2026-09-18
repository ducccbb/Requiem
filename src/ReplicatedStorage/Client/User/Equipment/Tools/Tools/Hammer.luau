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
--           File: ReplicatedStorage.Client.User.Equipment.Tools.Tools.Hammer
--                               Dumped in 0.00117 seconds
--                          Bytecode version 9  |  12 functions

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
local Utilities = Common:WaitForChild("Utilities")
local Character = require(Utilities:WaitForChild("Character"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Statistics = Common_2:WaitForChild("Statistics")
local useWalkSpeed = require(Statistics:WaitForChild("useWalkSpeed"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Network = Common_3:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Building = require(Namespaces:WaitForChild("Building"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_4:WaitForChild("Common")
local Network_2 = Common_4:WaitForChild("Network")
local Namespaces_2 = Network_2:WaitForChild("Namespaces")
local Player = require(Namespaces_2:WaitForChild("Player"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_5:WaitForChild("Common")
local Animations = Common_5:WaitForChild("Animations")
local Tools = Animations:WaitForChild("Tools")
local Pickaxe = require(Tools:WaitForChild("Pickaxe"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_6:WaitForChild("Common")
local Observers = Common_6:WaitForChild("Observers")
local useAnimatorObserver = require(Observers:WaitForChild("useAnimatorObserver"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_7 = ReplicatedStorage_7:WaitForChild("Common")
local Animations_2 = Common_7:WaitForChild("Animations")
local Tools_2 = Animations_2:WaitForChild("Tools")
local Hammer = require(Tools_2:WaitForChild("Hammer"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_8:WaitForChild("Client")
local Progression = Client:WaitForChild("Progression")
local ClientAttributesHandler = require(Progression:WaitForChild("ClientAttributesHandler"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Common_8 = ReplicatedStorage_9:WaitForChild("Common")
local Types = Common_8:WaitForChild("Types")
local u210 = nil
local u211 = nil
local u212 = false
local u213 = nil
local u214 = nil
local u215 = nil
local u216 = false
local v2 = {
    description = "A hammer, used for constructing certain blueprints.",
    attributes = {"Building"},
    category = require(Types:WaitForChild("Item")).CATEGORIES.Tool,
}
local function stopBuildAnimation() -- Line: 62 -- upvalues: u214 (ref), u215 (ref), useAnimatorObserver (val), Hammer (val), u216 (ref)
    if u214 then
        u214:Disconnect()
        u214 = nil
    end
    if u215 and u215.IsPlaying then
        u215:Stop(0.1)
    end
    useAnimatorObserver.stop(Hammer.HammerHitSlow, 0.1)
    u215 = nil
    u216 = false
end
local function onHammerSwing(p1) -- Line: 122 -- upvalues: u216 (ref), useWalkSpeed (val), u213 (ref), useAnimatorObserver (val), Pickaxe (val), u212 (ref), Character (val), Workspace (val), UserInputService (val), Building (val)
    local v1
    if u216 then
        return
    end
    _, v1 = useWalkSpeed()
    u213 = v1("hammer", 5, "set", 20)
    useAnimatorObserver.play(Pickaxe.Swing, 0.1)
    u212 = true
    task.delay(0.3, function() -- Line: 133 -- upvalues: p1 (val)
        p1()
    end)
    task.delay(0.7, function() -- Line: 137 -- upvalues: u213 (upval), u212 (upval)
        if u213 then
            u213()
        end
        u212 = false
    end)
    local v2 = Character.getCharacter()
    if not v2 or not v2.HumanoidRootPart then
        return
    end
    local v3 = RaycastParams.new()
    v3.FilterType = Enum.RaycastFilterType.Exclude
    v3.FilterDescendantsInstances = {v2}
    local CurrentCamera = Workspace.CurrentCamera
    if not CurrentCamera then
        return
    end
    local MouseLocation = UserInputService:GetMouseLocation()
    local v4 = CurrentCamera:ViewportPointToRay(MouseLocation.X, MouseLocation.Y)
    local v5 = Workspace:Raycast(v4.Origin, v4.Direction * 50, v3)
    local Instance = v5
    if Instance then
        Instance = v5.Instance
    end
    if Instance and not u216 then
        Building.BuildSchematic.post(Instance)
    end
end
Building.BuildSchematic.listen(function(p1) -- Line: 77 -- upvalues: stopBuildAnimation (val), u216 (ref), u215 (ref), useAnimatorObserver (val), Pickaxe (val), Hammer (val), ClientAttributesHandler (val), u214 (ref), Building (val)
    local MarkerReachedSignal, v1
    if not p1 then
        stopBuildAnimation()
        return
    end
    u216 = true
    local v2 = u215
    if not v2 then
        useAnimatorObserver.stop(Pickaxe.Swing, 0.1)
        v2 = useAnimatorObserver.play(Hammer.HammerHitSlow, 0.1, Enum.AnimationPriority.Action2)
        if not v2 then
            return
        end
        local SchematicBuildingSpeedMultiplier = ClientAttributesHandler.getAttribute("SchematicBuildingSpeedMultiplier")
        if SchematicBuildingSpeedMultiplier then
            v2:AdjustSpeed(SchematicBuildingSpeedMultiplier)
        end
        v2.Looped = true
        u215 = v2
        if u214 then
            return
        end
        v1 = u215
        if not v1 then
            return
        end
        MarkerReachedSignal = v1:GetMarkerReachedSignal("Hit")
        u214 = MarkerReachedSignal:Connect(function() -- Line: 114 -- upvalues: Building (upval)
            Building.BuildSchematic.post(nil, true)
        end)
        return
    elseif v2.IsPlaying then
        if u214 then
            return
        end
        v1 = u215
        if not v1 then
            return
        end
        MarkerReachedSignal = v1:GetMarkerReachedSignal("Hit")
        u214 = MarkerReachedSignal:Connect(function() -- Line: 114 -- upvalues: Building (upval)
            Building.BuildSchematic.post(nil, true)
        end)
        return
    end
end)
Player.Action.listen(function(p1) -- Line: 210 -- upvalues: stopBuildAnimation (val)
    if p1 == nil then
        stopBuildAnimation()
    end
end)
return {
    equipped = function(p1) -- Line: 171 -- upvalues: Character (val), u210 (ref), useAnimatorObserver (val), Pickaxe (val), u211 (ref), UserInputService (val), u212 (ref), onHammerSwing (val)
        Character.getCharacterAsync():andThen(function(p1) -- Line: 172 -- upvalues: u210 (upval), useAnimatorObserver (upval), Pickaxe (upval)
            u210 = useAnimatorObserver.bind(p1.Humanoid.Animator, Pickaxe, 2)
        end)
        u211 = UserInputService.InputBegan:Connect(function(a1) -- Line: 176 -- upvalues: u210 (upval), u212 (upval), onHammerSwing (upval), p1 (val)
            if not u210 or a1.UserInputType ~= Enum.UserInputType.MouseButton1 or u212 then
                return
            end
            onHammerSwing(p1)
        end)
    end,
    unequipped = function() -- Line: 188 -- upvalues: u210 (ref), u211 (ref), u213 (ref), stopBuildAnimation (val)
        if u210 then
            u210()
            u210 = nil
        end
        if u211 then
            u211:Disconnect()
            u211 = nil
        end
        if u213 then
            u213()
            u213 = nil
        end
        stopBuildAnimation()
    end,
    data = v2,
}