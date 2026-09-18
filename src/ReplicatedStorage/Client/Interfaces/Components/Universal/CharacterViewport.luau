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
--   File: ReplicatedStorage.Client.Interfaces.Components.Universal.CharacterViewport
--                               Dumped in 0.00183 seconds
--                          Bytecode version 9  |  13 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_2:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local Utilities = script.Parent.Parent:WaitForChild("Utilities")
local FillProps = require(Utilities:WaitForChild("FillProps"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_3:WaitForChild("Common")
local Utilities_2 = Common:WaitForChild("Utilities")
local Customization = require(Utilities_2:WaitForChild("Customization"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_4:WaitForChild("Common")
local Utilities_3 = Common_2:WaitForChild("Utilities")
local R15DirectionTracker = require(Utilities_3:WaitForChild("R15DirectionTracker"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_5:WaitForChild("Common")
local Utilities_4 = Common_3:WaitForChild("Utilities")
local R6DirectionTracker = require(Utilities_4:WaitForChild("R6DirectionTracker"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_6:WaitForChild("Common")
local Animations = Common_4:WaitForChild("Animations")
local Default = require(Animations:WaitForChild("Default"))
local function pruneCharacterForViewport(p1) -- Line: 51
    local v1 = {}
    for i, j in p1:GetChildren() do
        if not (j:IsA("Folder")) then
            if j:IsA("Model") then
                table.insert(v1, j)
            end
        elseif j:GetAttribute("CustomizationAccessory") ~= true then
            table.insert(v1, j)
        end
    end
    local v2 = v1
    local v3 = nil
    local v4 = nil
    for k, n in v2, v3, v4 do
        n:Destroy()
    end
    local Animate = p1:FindFirstChild("Animate")
    if Animate then
        Animate:Destroy()
    end
end
local function getCharacterModel() -- Line: 72 -- upvalues: RunService (val), ReplicatedStorage (val)
    local Character, Common, ReplicatedStorage_2, Utilities, v1
    if not (RunService:IsStudio()) then
        ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
        Common = ReplicatedStorage_2:WaitForChild("Common")
        Utilities = Common:WaitForChild("Utilities")
        Character = require(Utilities:WaitForChild("Character"))
        _, v1 = Character.getCharacterAsync():await()
        Character.waitForCharacterLoaded(v1)
        return v1
    end
    if not (RunService:IsRunning()) then
        local Assets = ReplicatedStorage:WaitForChild("Assets")
        local Objects = Assets:WaitForChild("Objects")
        return (Objects:WaitForChild("Requiem_PlayerCamera"))
    end
    ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
    Common = ReplicatedStorage_2:WaitForChild("Common")
    Utilities = Common:WaitForChild("Utilities")
    Character = require(Utilities:WaitForChild("Character"))
    _, v1 = Character.getCharacterAsync():await()
    Character.waitForCharacterLoaded(v1)
    return v1
end
local function getLookAtTarget(p1, p2, p3) -- Line: 87 -- upvalues: UserInputService (val)
    local MouseLocation = UserInputService:GetMouseLocation()
    local AbsolutePosition = p1.AbsolutePosition
    local AbsoluteSize = p1.AbsoluteSize
    local v1 = math.clamp(MouseLocation.X - AbsolutePosition.X, 0, (math.max(AbsoluteSize.X, 1)))
    local v2 = math.clamp(MouseLocation.Y - AbsolutePosition.Y, 0, (math.max(AbsoluteSize.Y, 1)))
    local v3 = p2:ViewportPointToRay(v1, v2)
    local Magnitude = (p3 - v3.Origin).Magnitude
    if Magnitude < 1 then
        Magnitude = 8
    end
    return v3.Origin + v3.Direction * Magnitude
end
local function faceRigToVector(p1, p2) -- Line: 104 -- upvalues: R6DirectionTracker (val), R15DirectionTracker (val)
    if not (p2:FindFirstChild("Torso")) then
        if p2:FindFirstChild("UpperTorso") then
            R15DirectionTracker.faceR15RigToVector(p1, p2)
        end
        return
    end
    if not (p2:FindFirstChild("UpperTorso")) then
        R6DirectionTracker.faceR6RigToVector(p1, p2)
        return
    end
    if p2:FindFirstChild("UpperTorso") then
        R15DirectionTracker.faceR15RigToVector(p1, p2)
    end
end
local function restoreRigC0s(p1) -- Line: 112 -- upvalues: R6DirectionTracker (val), R15DirectionTracker (val)
    if not (p1:FindFirstChild("Torso")) then
        if p1:FindFirstChild("UpperTorso") then
            R15DirectionTracker.restoreR15C0s(p1)
        end
        return
    end
    if not (p1:FindFirstChild("UpperTorso")) then
        R6DirectionTracker.restoreR6C0s(p1)
        return
    end
    if p1:FindFirstChild("UpperTorso") then
        R15DirectionTracker.restoreR15C0s(p1)
    end
end
local function supportsLookAtMouse(p1) -- Line: 120
    local v1 = if p1:FindFirstChild("Torso") == nil then p1:FindFirstChild("UpperTorso") ~= nil else true
    return v1
end
local function anchorCharacter(p1, p2) -- Line: 124
    for i, j in p1:GetDescendants() do
        if j:IsA("BasePart") then
            j.Anchored = p2
        end
    end
end
return react.memo(function(p1) -- Line: 132 -- upvalues: react (val), getCharacterModel (val), pruneCharacterForViewport (val), Customization (val), supportsLookAtMouse (val), anchorCharacter (val), R6DirectionTracker (val), Default (val), RunService (val), getLookAtTarget (val), faceRigToVector (val), restoreRigC0s (val), FillProps (val)
    local u8, u9
    local u4 = react.useRef(nil)
    u8, u9 = react.useState(false)
    local v1 = react.useCallback(function(p1) -- Line: 136 -- upvalues: u4 (val), u9 (val)
        u4.current = p1
        local v1 = p1 ~= nil
        u9(v1)
    end, {})
    local v2 = {}
    local Outfit = p1.Outfit
    if Outfit then
        Outfit = p1.Outfit.Shirt.Category
    end
    local Outfit_2 = p1.Outfit
    if Outfit_2 then
        Outfit_2 = p1.Outfit.Shirt.Name
    end
    local Outfit_3 = p1.Outfit
    if Outfit_3 then
        Outfit_3 = p1.Outfit.Shirt.Custom
    end
    local Outfit_4 = p1.Outfit
    if Outfit_4 then
        Outfit_4 = p1.Outfit.Pants.Category
    end
    local Outfit_5 = p1.Outfit
    if Outfit_5 then
        Outfit_5 = p1.Outfit.Pants.Name
    end
    local Outfit_6 = p1.Outfit
    if Outfit_6 then
        Outfit_6 = p1.Outfit.Pants.Custom
    end
    v2[1] = u8
    v2[2] = p1.LookAtMouse
    v2[3] = p1.Enabled
    v2[4] = Outfit
    v2[5] = Outfit_2
    v2[6] = Outfit_3
    v2[7] = Outfit_4
    v2[8] = Outfit_5
    v2[9] = Outfit_6
    react.useEffect(function() -- Line: 141 -- upvalues: p1 (val), u4 (val), u8 (val), getCharacterModel (upval), pruneCharacterForViewport (upval), Customization (upval), supportsLookAtMouse (upval), anchorCharacter (upval), R6DirectionTracker (upval), Default (upval), RunService (upval), getLookAtTarget (upval), faceRigToVector (upval), restoreRigC0s (upval)
        if p1.Enabled == false then
            return
        end
        local current = u4.current
        if not u8 or not current then
            return
        end
        local Camera = Instance.new("Camera")
        Camera.Parent = current
        local v1 = getCharacterModel()
        local WorldModel = Instance.new("WorldModel")
        v1.Archivable = true
        local u16 = v1:Clone()
        u16:RemoveTag("Alive")
        u16:RemoveTag("Character")
        u16:SetAttribute("network_id", nil)
        pruneCharacterForViewport(u16)
        u16.Parent = WorldModel
        if p1.Outfit then
            Customization.updateOutfit(u16, p1.Outfit)
        end
        WorldModel.Parent = current
        current.CurrentCamera = Camera
        local HumanoidRootPart = u16:FindFirstChild("HumanoidRootPart")
        local v2 = HumanoidRootPart.CFrame * CFrame.new(0, 0, -5)
        local v3 = math.rad(180)
        Camera.CFrame = v2 * CFrame.Angles(0, v3, 0)
        local u69 = if p1.LookAtMouse == true then supportsLookAtMouse(u16) else false
        local u98 = nil
        if not u69 then
            local Animation = Instance.new("Animation")
            Animation.AnimationId = Default.Idle
            local Humanoid = u16:WaitForChild("Humanoid")
            v3 = Humanoid:WaitForChild("Animator"):LoadAnimation(Animation)
            u98 = v3
            v3:Play()
        else
            anchorCharacter(u16, true)
            R6DirectionTracker.captureR6C0s(u16)
        end
        local u117 = if u69 then RunService.RenderStepped:Connect(function() -- Line: 194 -- upvalues: u4 (upval), u16 (val), HumanoidRootPart (val), getLookAtTarget (upval), current (val), Camera (val), faceRigToVector (upval)
    local Head, Position, v4, v5, v1, v6
    if not u4.current then
        return
    end
    Head = u16:FindFirstChild("Head")
    if not Head then
        Position = HumanoidRootPart.Position
    else
        Position = Head.Position
    end
    v1 = getLookAtTarget(current, Camera, Position)
    faceRigToVector(v1, u16)
    return
end) else nil
        return function() -- Line: 207 -- upvalues: u117 (ref), u69 (val), restoreRigC0s (upval), u16 (val), u98 (ref), WorldModel (val), Camera (val)
            if u117 then
                u117:Disconnect()
            end
            if u69 then
                restoreRigC0s(u16)
            end
            if u98 then
                u98:Stop()
            end
            WorldModel:Destroy()
            Camera:Destroy()
        end
    end, v2)
    local Native = p1.Native
    if not Native then
        Native = {}
    end
    v2 = FillProps(Native, {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 1),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.4),
        ImageColor3 = Color3.fromRGB(168, 168, 168),
        Ambient = Color3.fromRGB(75, 75, 75),
        LightDirection = Vector3.new(8, 4, 3),
        LightColor = Color3.fromRGB(245, 245, 245),
        ref = v1,
    })
    local v3 = {}
    local v4 = {Rotation = 90}
    local v5 = {}
    local v6 = NumberSequenceKeypoint.new(0, 0)
    local v7 = NumberSequenceKeypoint.new(0.8, 0)
    v5[1] = v6
    v5[2] = v7
    v5[3] = NumberSequenceKeypoint.new(1, 1)
    v4.Transparency = NumberSequence.new(v5)
    v3.Gradient = react.createElement("UIGradient", v4)
    return react.createElement("ViewportFrame", v2, v3)
end)