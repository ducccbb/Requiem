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
--   File: ReplicatedStorage.Client.Interfaces.Routes.Interactions.Types.Building.Door
--                              Dumped in 0.000885 seconds
--                          Bytecode version 9  |  6 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local CollectionService = game:GetService("CollectionService")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Interaction = require(Namespaces:WaitForChild("Interaction"))
local v2 = {header = "Door", body = "Press \"%s\" to open or close door."}
local v3 = {}
local v4 = {Image = "rbxassetid://12974393059", Name = "Knock", Default = false}
local v5 = {Image = "rbxassetid://12974393059", Name = "Lock", Default = false}
v3[1] = {Image = "rbxassetid://11295285778", Name = "Open", Default = true}
v3[2] = {Image = "rbxassetid://12966845909", Name = "Kick", Default = false}
v3[3] = v4
v3[4] = v5
v2.options = v3
local u51 = {}
local function onUpdateDoorState(p1, p2, p3) -- Line: 37 -- upvalues: u51 (val), TweenService (val)
    local v1
    local v2 = u51[p1]
    if not v2 then
        u51[p1] = p1.CFrame
        v2 = u51[p1]
    end
    local Parent = p1.Parent
    if Parent then
        Parent = p1.Parent:FindFirstChild("Door")
    end
    if Parent then
        for i, j in Parent:GetChildren() do
            if j:IsA("BasePart") then
                j.Anchored = false
            end
        end
    end
    local v3 = math.rad(100)
    if p3 then
        v3 = -v3
    end
    local v4 = TweenInfo.new(1)
    local v5 = {}
    local Angles = CFrame.Angles
    if not p2 then
        v1 = 0
    else
        v1 = v3
        if not v1 then
            v1 = 0
        end
    end
    v5.CFrame = v2 * Angles(0, v1, 0)
    TweenService:Create(p1, v4, v5):Play()
end
local function onTrackDoorState(p1) -- Line: 67 -- upvalues: u51 (val), onUpdateDoorState (val)
    local Parent = p1.Parent
    if not Parent then
        return
    end
    local Hinge1 = Parent:FindFirstChild("Hinge1")
    local Hinge2 = Parent:FindFirstChild("Hinge2")
    if not Hinge1 then
        local v1
        local Hinge = Parent:FindFirstChild("Hinge")
        if not Hinge then
            Hinge = Parent.PrimaryPart
        end
        if not Hinge then
            return
        end
        u51[Hinge] = Hinge.CFrame
        local Attribute_2 = p1:GetAttribute("Open")
        if Attribute_2 == nil then
            v1 = false
        else
            v1 = Attribute_2
        end
        onUpdateDoorState(Hinge, v1)
        local AttributeChangedSignal_2 = p1:GetAttributeChangedSignal("Open")
        AttributeChangedSignal_2:Connect(function() -- Line: 107 -- upvalues: onUpdateDoorState (upval), Hinge (val), p1 (val)
            onUpdateDoorState(Hinge, (p1:GetAttribute("Open")))
        end)
        return
    elseif Hinge2 then
        local v2
        u51[Hinge1] = Hinge1.CFrame
        u51[Hinge2] = Hinge2.CFrame
        local Attribute = p1:GetAttribute("Open")
        if Attribute == nil then
            v2 = false
        else
            v2 = Attribute
        end
        onUpdateDoorState(Hinge1, v2)
        onUpdateDoorState(Hinge2, v2, true)
        local AttributeChangedSignal = p1:GetAttributeChangedSignal("Open")
        AttributeChangedSignal:Connect(function() -- Line: 89 -- upvalues: p1 (val), onUpdateDoorState (upval), Hinge1 (val), Hinge2 (val)
            local Attribute = p1:GetAttribute("Open")
            onUpdateDoorState(Hinge1, Attribute)
            onUpdateDoorState(Hinge2, Attribute, true)
        end)
        return
    end
end
local InstanceAddedSignal = CollectionService:GetInstanceAddedSignal("Door")
InstanceAddedSignal:Connect(onTrackDoorState)
for i, v in ipairs(CollectionService:GetTagged("Door")) do
    onTrackDoorState(v)
end
return {
    interacted = function(...) -- Line: 115 -- upvalues: Interaction (val)
        Interaction.Event.unreliablePost(...)
    end,
    display = v2,
}