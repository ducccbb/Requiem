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
--       File: ReplicatedStorage.Client.Interfaces.Routes.Interactions.Interaction
--                               Dumped in 0.00544 seconds
--                          Bytecode version 9  |  27 functions

local u0 = script
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local CollectionService = game:GetService("CollectionService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local Components = u0.Parent.Parent.Parent:WaitForChild("Components")
local Universal = Components:WaitForChild("Universal")
local Progress = require(Universal:WaitForChild("Progress"))
local Components_2 = u0.Parent.Parent.Parent:WaitForChild("Components")
local Screen = Components_2:WaitForChild("Screen")
local Radial = require(Screen:WaitForChild("Radial"))
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local v2 = require(Packages:WaitForChild("octo-tree"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Packages_2 = ReplicatedStorage_2:WaitForChild("Packages")
local react = require(Packages_2:WaitForChild("react"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_3:WaitForChild("Client")
local User = Client:WaitForChild("User")
local State = User:WaitForChild("State")
local ClientSettingsHandler = require(State:WaitForChild("ClientSettingsHandler"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_4:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
require(Utilities:WaitForChild("Signal"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_5:WaitForChild("Common")
local Network = Common_2:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Vitality = require(Namespaces:WaitForChild("Vitality"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_6:WaitForChild("Client")
local User_2 = Client_2:WaitForChild("User")
local Character = User_2:WaitForChild("Character")
local CharacterRagdollHandler = require(Character:WaitForChild("CharacterRagdollHandler"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_7:WaitForChild("Client")
local User_3 = Client_3:WaitForChild("User")
local Equipment = User_3:WaitForChild("Equipment")
local Gear = Equipment:WaitForChild("Gear")
local ClientGearHandler = require(Gear:WaitForChild("ClientGearHandler"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_8:WaitForChild("Client")
local User_4 = Client_4:WaitForChild("User")
local State_2 = User_4:WaitForChild("State")
local ClientStateHandler = require(State_2:WaitForChild("ClientStateHandler"))
local Hooks = u0.Parent.Parent.Parent:WaitForChild("Hooks")
local useEventListener = require(Hooks:WaitForChild("useEventListener"))
local Hooks_2 = u0.Parent.Parent.Parent:WaitForChild("Hooks")
local useMotion = require(Hooks_2:WaitForChild("useMotion"))
local Hooks_3 = u0.Parent.Parent.Parent:WaitForChild("Hooks")
local useThrottleCallback = require(Hooks_3:WaitForChild("useThrottleCallback"))
local Components_3 = u0.Parent.Parent.Parent:WaitForChild("Components")
local Utilities_2 = Components_3:WaitForChild("Utilities")
local TransparencyGroup = require(Utilities_2:WaitForChild("TransparencyGroup"))
local u290 = {}
local u291 = {}
local u292 = {}
local u293 = {}
local u294 = {}
local u295 = nil
local u297 = v2.new()
local function createInteractionFromPart(p1) -- Line: 88 -- upvalues: u291 (val), u0 (val), u290 (val), u293 (val), u294 (val), u297 (val), RunService (val), u292 (val)
    local Attribute = p1:GetAttribute("Type")
    if not Attribute then
        return
    end
    local v1 = u291[Attribute]
    if v1 then
        local u26 = {part = p1, name = Attribute, module = v1}
        local v2 = p1:GetAttribute("Moveable") == true
        table.insert(u290, u26)
        if v2 then
            table.insert(u293, u26)
            u294[p1] = u26
            return
        end
        local u53 = u297:CreateNode(p1.Position, u26)
        if p1:IsA("Seat") then
            local PropertyChangedSignal = p1:GetPropertyChangedSignal("Occupant")
            PropertyChangedSignal:Connect(function() -- Line: 124 -- upvalues: u297 (upval), u53 (val), p1 (val)
                u297:ChangeNodePosition(u53, p1.Position)
            end)
        end
        local AttributeChangedSignal = p1:GetAttributeChangedSignal("Busy")
        AttributeChangedSignal:Connect(function() -- Line: 129 -- upvalues: u297 (upval), u53 (val), p1 (val)
            u297:ChangeNodePosition(u53, p1.Position)
        end)
        local Parent = p1.Parent
        if Parent then
            Parent = p1.Parent:FindFirstChildWhichIsA("Humanoid")
        end
        if Parent then
            u26.tracking = RunService.RenderStepped:Connect(function() -- Line: 136 -- upvalues: p1 (val), u26 (val), u297 (upval), u53 (val)
                if not p1.Parent then
                    u26.tracking:Disconnect()
                elseif not (p1.Parent:FindFirstChildWhichIsA("Humanoid")) then
                    u26.tracking:Disconnect()
                end
                u297:ChangeNodePosition(u53, p1.Position)
            end)
        end
        local PropertyChangedSignal_2 = p1:GetPropertyChangedSignal("Parent")
        PropertyChangedSignal_2:Once(function() -- Line: 145 -- upvalues: u297 (upval), u53 (val), u26 (val)
            u297:RemoveNode(u53)
            if u26.tracking then
                u26.tracking:Disconnect()
            end
        end)
        u292[p1] = u53
        return
    else
        local v3 = u0.Parent.Types:FindFirstChild(Attribute, true)
        if not v3 then
            return warn("No interaction type found for " .. Attribute)
        end
        u291[Attribute] = require(v3)
        v1 = u291[Attribute]
    end
end
for k, v in pairs(CollectionService:GetTagged("Interaction")) do
    if v:IsDescendantOf(Workspace) then
        createInteractionFromPart(v)
    end
end
local InstanceAddedSignal = CollectionService:GetInstanceAddedSignal("Interaction")
InstanceAddedSignal:Connect(function(p1) -- Line: 167 -- upvalues: Workspace (val), createInteractionFromPart (val)
    if not (p1:IsDescendantOf(Workspace)) then
        return
    end
    createInteractionFromPart(p1)
end)
local InstanceRemovedSignal = CollectionService:GetInstanceRemovedSignal("Interaction")
InstanceRemovedSignal:Connect(function(p1) -- Line: 175 -- upvalues: u292 (val), u294 (val), u297 (val), u293 (val)
    local v1 = u292[p1]
    local v2 = u294[p1]
    if v1 then
        u297:RemoveNode(v1)
        local Object = v1.Object
        if Object.tracking then
            Object.tracking:Disconnect()
        end
        u292[p1] = nil
    end
    if v2 then
        local v3 = table.find(u293, v2)
        if v3 then
            table.remove(u293, v3)
        end
        u294[p1] = nil
    end
end)
local function getInteractionOptions(p1) -- Line: 201
    local options = p1.module.display.options
    if not options then
        return nil
    end
    if typeof(options) == "function" then
        return options(p1.part)
    end
    return options
end
local v3 = {}
function v3.Interaction() -- Line: 216 -- upvalues: react (val), useMotion (val), ClientSettingsHandler (val), CollectionService (val), Workspace (val), useThrottleCallback (val), Players (val), u297 (val), u293 (val), Vitality (val), ClientStateHandler (val), CharacterRagdollHandler (val), u295 (ref), useEventListener (val), RunService (val), getInteractionOptions (val), ClientGearHandler (val), Radial (val), TransparencyGroup (val), Progress (val)
    local body, header, u15, u19, u24, u29, u3, u34, u39, u4, u44, u9, v1, v2, v3, v4, v5, v6, v7
    u3, u4 = react.useState(nil)
    _, u9 = react.useState(0)
    v5, u15 = react.useBinding(UDim2.new())
    v6, u19 = useMotion(0.8)
    v7, u24 = react.useState(false)
    v1, u29 = react.useState(0)
    v2, u34 = react.useState(0)
    v3, u39 = react.useBinding(0)
    v4, u44 = react.useState(false)
    local Value = ClientSettingsHandler.getSettingFromName("Interact").Value
    local v8 = Enum.KeyCode:FromValue(Value)
    if not v8 then
        return
    end
    local function checkLineOfSight(p1, p2, p3) -- Line: 235 -- upvalues: CollectionService (upval), Workspace (upval)
        local Head = p2:FindFirstChild("Head")
        local UpperTorso = p2:FindFirstChild("UpperTorso")
        if not UpperTorso then
            UpperTorso = p2:FindFirstChild("Torso")
        end
        if not Head then
            return false
        else
            if not UpperTorso then
                return false
            end
            local Position = p1.Position
            local Tagged = CollectionService:GetTagged("IgnoreLineOfSight")
            local v1 = RaycastParams.new()
            v1.FilterType = Enum.RaycastFilterType.Exclude
            v1.RespectCanCollide = true
            v1.FilterDescendantsInstances = {p2, Tagged}
            local v2 = Workspace:Raycast(p3.CFrame.Position, (Position - p3.CFrame.Position).Unit * (p3.CFrame.Position - Position).Magnitude, v1)
            if not v2 then
                local v3
                local v4 = Workspace:Raycast(Head.Position, (Position - Head.Position).Unit * (Head.Position - Position).Magnitude, v1)
                if not v4 then
                    v3 = Workspace:Raycast(UpperTorso.Position, (Position - UpperTorso.Position).Unit * (UpperTorso.Position - Position).Magnitude, v1)
                    if v3 then
                        if 1.5 < (v3.Position - Position).Magnitude then
                            return false
                        end
                        return true
                    end
                    return true
                end
                if 1.5 < (v4.Position - Position).Magnitude then
                    return false
                end
                v3 = Workspace:Raycast(UpperTorso.Position, (Position - UpperTorso.Position).Unit * (UpperTorso.Position - Position).Magnitude, v1)
                if not v3 then
                    return true
                end
                if 1.5 < (v3.Position - Position).Magnitude then
                    return false
                end
                return true
            elseif 1.5 < (v2.Position - Position).Magnitude then
                return false
            end
        end
    end
    local u58 = useThrottleCallback(function() -- Line: 293 -- upvalues: Players (upval), Workspace (upval), u297 (upval), checkLineOfSight (val), u293 (upval), Vitality (upval), ClientStateHandler (upval), CharacterRagdollHandler (upval), u295 (upval), u4 (val), u19 (val)
        local Magnitude, Magnitude_2, Object, v1, v2, visible, visible_2
        local Character = Players.LocalPlayer.Character
        local PrimaryPart = Character
        if PrimaryPart then
            PrimaryPart = Character.PrimaryPart
        end
        if not PrimaryPart then
            return
        end
        local CurrentCamera = Workspace.CurrentCamera
        local huge = math.huge
        local v3 = nil
        local v4 = Workspace.Camera.ViewportSize / 2
        local v5 = u297:SearchRadius(PrimaryPart.Position, 8)
        for k, v in pairs(v5) do
            Object = v.Object
            if Object.part.Parent and not (Object.part:GetAttribute("Busy")) and (PrimaryPart.Position - Object.part.Position).Magnitude < 8 and checkLineOfSight(Object.part, Character, CurrentCamera) then
                visible_2 = Object.module.display.visible
                if not visible_2 then
                    v2 = CurrentCamera:WorldToScreenPoint(Object.part.Position)
                    Magnitude_2 = (Vector2.new(v2.X, v2.Y) - v4).Magnitude
                    if Magnitude_2 < huge and Magnitude_2 < 400 then
                        v3 = Object
                        huge = Magnitude_2
                    end
                elseif typeof(visible_2) == "function" and not (visible_2(Object.part)) then
                end
            end
        end
        for k2, i in pairs(u293) do
            if i.part.Parent and not (i.part:GetAttribute("Busy")) and not (i.part:IsDescendantOf(Character)) and (PrimaryPart.Position - i.part.Position).Magnitude < 8 and checkLineOfSight(i.part, Character, CurrentCamera) then
                visible = i.module.display.visible
                if not visible then
                    v1 = CurrentCamera:WorldToScreenPoint(i.part.Position)
                    Magnitude = (Vector2.new(v1.X, v1.Y) - v4).Magnitude
                    if Magnitude < huge and Magnitude < 400 then
                        v3 = i
                        huge = Magnitude
                    end
                elseif typeof(visible) == "function" and not (visible(i.part)) then
                end
            end
        end
        local v6 = Vitality.Store.current[Players.LocalPlayer]
        if not v3 or ClientStateHandler.isCategoryBusy(ClientStateHandler.Categories.NO_INTERACTION_USAGE) or CharacterRagdollHandler.isRagdolled() or v6.dead == 1 or v6.knocked == 1 or v6.health == 0 or Character.Humanoid.Health == 0 then
            u295 = nil
            u4(nil)
            u19:spring(0.8, {frequency = 0.3})
            return
        end
        if v3 then
            u295 = v3
            u19:spring(1, {frequency = 0.3})
            u4(v3)
        end
    end, {wait = 0.2})
    useEventListener(RunService.RenderStepped, function() -- Line: 402 -- upvalues: u58 (val)
        u58.run()
    end)
    react.useEffect(function() -- Line: 406 -- upvalues: u3 (val), RunService (upval), Workspace (upval), u15 (val), getInteractionOptions (upval), u39 (val), ClientSettingsHandler (upval), ClientStateHandler (upval), u44 (val), ClientGearHandler (upval), Players (upval), Radial (upval), u29 (val), u9 (val), u34 (val), u24 (val)
        local Attribute, Attribute_2, Parent, part, u15
        if not u3 then
            return
        end
        local u6 = RunService.RenderStepped:Connect(function() -- Line: 412 -- upvalues: Workspace (upval), u3 (upval), u15 (upval)
            local v1 = Workspace.CurrentCamera:WorldToScreenPoint(u3.part.Position)
            u15(UDim2.fromOffset(v1.X, v1.Y + 30))
        end)
        local function resolveInteractionOptions() -- Line: 418 -- upvalues: getInteractionOptions (upval), u3 (upval)
            return getInteractionOptions(u3)
        end
        local u8 = nil
        local u9 = false
        local u10 = 0
        local u11 = 0
        local u12 = nil
        local u13 = nil
        local u14 = nil
        u15 = false
        local u16 = false
        local u17 = false
        u39(0)
        local u28 = ClientSettingsHandler.onKeybindPressed("Interact"):Connect(function() -- Line: 437 -- upvalues: ClientStateHandler (upval), u14 (ref), u13 (ref), u11 (ref), u10 (ref), u17 (ref), u44 (upval), u15 (ref), u12 (ref), u3 (upval), u16 (ref), u8 (ref), resolveInteractionOptions (val), u9 (ref), u39 (upval), ClientGearHandler (upval), RunService (upval), Players (upval), Radial (upval)
            local v1
            if ClientStateHandler.isCategoryBusy(ClientStateHandler.Categories.NO_INTERACTION_USAGE) then
                return
            end
            if u14 then
                u14:Disconnect()
            end
            if u13 then
                u13:Disconnect()
            end
            u11 = 0
            u10 = tick()
            u17 = false
            u44(false)
            u15 = false
            u12 = nil
            u3.radialMenuOpen = false
            u16 = true
            u8 = resolveInteractionOptions()
            local v2 = false
            if u8 ~= nil then
                v1 = #u8
                v2 = 1 < v1
            end
            u9 = v2
            u39(0)
            v2 = ClientGearHandler.getGearState()
            if v2 then
                v2.signals.ungrapple:Fire("Left")
                v2.signals.ungrapple:Fire("Right")
            end
            if u9 then
                u13 = RunService.RenderStepped:Connect(function(p1) -- Line: 476 -- upvalues: u11 (upval), u17 (upval), Players (upval), u3 (upval), u13 (upval), u14 (upval), Radial (upval), u44 (upval), u39 (upval), u16 (upval), resolveInteractionOptions (upval), u8 (upval), u15 (upval), u12 (upval)
                    u11 = u11 + p1
                    if not u17 then
                        local v1
                        if 0.1 >= u11 then
                            u39(0)
                        else
                            v1 = (u11 - 0.1) / 0.4
                            u39((math.clamp(v1, 0, 1)))
                        end
                        if 0.5 >= u11 or u17 then
                            return
                        end
                        v1 = resolveInteractionOptions()
                        u8 = v1
                        if not v1 then
                            return
                        end
                        u14 = Radial.updateRadialMenu({enabled = true, options = v1}):Connect(function(p1) -- Line: 532 -- upvalues: u13 (upval), u15 (upval), Radial (upval), u17 (upval), u44 (upval), u12 (upval), u39 (upval), u3 (upval)
                            if u13 then
                                u13:Disconnect()
                            end
                            if u15 then
                                return
                            end
                            Radial.updateRadialMenu({enabled = false})
                            u17 = false
                            u44(false)
                            u12 = p1
                            u39(0)
                            u3.module.interacted(u3.part, u12)
                            u15 = true
                            u3.radialMenuOpen = false
                        end)
                        u3.radialMenuOpen = true
                        u17 = true
                        u44(true)
                        return
                    else
                        local Character = Players.LocalPlayer.Character
                        local PrimaryPart = Character
                        if PrimaryPart then
                            PrimaryPart = Character.PrimaryPart
                        end
                        if PrimaryPart and u3.part.Parent and 20 < (PrimaryPart.Position - u3.part.Position).Magnitude then
                            if u13 then
                                u13:Disconnect()
                            end
                            if u14 then
                                u14:Disconnect()
                                u14 = nil
                            end
                            Radial.updateRadialMenu({enabled = false})
                            u17 = false
                            u3.radialMenuOpen = false
                            u44(false)
                            u39(0)
                            u16 = false
                            u11 = 0
                            return
                        end
                    end
                end)
                return
            end
            v1 = u8
            if v1 then
                v1 = u8[1]
            end
            u3.module.interacted(u3.part, v1)
        end)
        local u36 = ClientSettingsHandler.onKeybindReleased("Interact"):Connect(function() -- Line: 570 -- upvalues: u9 (ref), u16 (ref), u11 (ref), u13 (ref), u17 (ref), Radial (upval), u3 (upval), u44 (upval), u39 (upval), u15 (ref), u10 (ref), resolveInteractionOptions (val), u8 (ref), u12 (ref)
            local v1
            if not u9 or not u16 then
                return
            end
            u11 = 0
            u16 = false
            if u13 then
                u13:Disconnect()
            end
            if u17 then
                Radial.updateRadialMenu({enabled = false})
                u17 = false
                u3.radialMenuOpen = false
                u44(false)
                u39(0)
                return
            end
            if u15 then
                return
            end
            local v2 = tick() - u10
            local v3 = resolveInteractionOptions()
            if v3 then
                u8 = v3
            end
            if v2 > 0.5 then
                if 0.5 < v2 and not u12 and u8 then
                    v1 = #u8
                    if 0 < v1 then
                        u12 = u8[1]
                    end
                end
            elseif u8 then
                v1 = #u8
                if 0 < v1 then
                    u12 = u8[1]
                end
            end
            u39(0)
            u3.module.interacted(u3.part, u12)
            u15 = true
            u3.radialMenuOpen = false
        end)
        part = u3
        if part then
            part = u3.part
        end
        Parent = part
        if Parent then
            Parent = part.Parent
        end
        if not u3 then
            if not u3 then
                Attribute_2 = false
            elseif part and Parent and Parent:GetAttribute("MaxAmount") then
                Attribute_2 = true
            end
        elseif part then
            Attribute_2 = part:GetAttribute("MaxAmount")
        end
        if not part then
            Attribute = Parent
            if Attribute then
                Attribute = Parent:GetAttribute("MaxAmount")
                if Attribute then
                    Attribute = Parent
                end
            end
        elseif part:GetAttribute("MaxAmount") then
            Attribute = part
        end
        local u84 = Attribute
        if u84 then
            local AttributeChangedSignal = Attribute:GetAttributeChangedSignal("Amount")
            u84 = AttributeChangedSignal:Connect(function() -- Line: 630 -- upvalues: u29 (upval), Attribute (val)
                u29(Attribute:GetAttribute("Amount") or 0)
            end)
        end
        local u93 = part
        if u93 then
            u93 = part.AttributeChanged:Connect(function() -- Line: 634 -- upvalues: u9 (upval)
                u9(function(p1) -- Line: 635
                    return p1 + 1
                end)
            end)
        end
        if Attribute_2 and Attribute then
            u29(Attribute:GetAttribute("Amount") or 0)
            u34(Attribute:GetAttribute("MaxAmount") or 0)
        end
        u24(Attribute_2)
        return function() -- Line: 648 -- upvalues: u6 (val), u28 (val), u36 (val), u13 (ref), u84 (val), u93 (val)
            u6:Disconnect()
            u28:Disconnect()
            u36:Disconnect()
            if u13 then
                u13:Disconnect()
            end
            if u84 then
                u84:Disconnect()
            end
            if u93 then
                u93:Disconnect()
            end
        end
    end, {u3})
    if not u3 then
        header = "???"
    elseif typeof(u3.module.display.header) == "string" then
        header = u3.module.display.header
    elseif typeof(u3.module.display.header) == "function" then
        header = u3.module.display.header(u3.part)
    end
    if not u3 then
        body = "???"
    elseif typeof(u3.module.display.body) == "string" then
        body = u3.module.display.body
    elseif typeof(u3.module.display.body) == "function" then
        body = u3.module.display.body(u3.part)
    end
    local v9 = math.clamp(v1 / v2, 0, 1)
    if v9 ~= v9 then
        v9 = 0.0001
    end
    local createElement = react.createElement
    local v10 = {}
    local v11 = if u3 ~= nil then not v4 else false
    v10.Enabled = v11
    v10.Tween = TweenInfo.new(0.2)
    v11 = {}
    local v12 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = v5,
        Size = UDim2.fromOffset(214, 61),
    }
    local v13 = {Scale = react.createElement("UIScale", {Scale = v6}), uIListLayout = react.createElement("UIListLayout", {Padding = UDim.new(0.01, 0), FillDirection = Enum.FillDirection.Horizontal, HorizontalAlignment = Enum.HorizontalAlignment.Right, SortOrder = Enum.SortOrder.LayoutOrder})}
    local v14 = {
        BackgroundTransparency = 0.15,
        BorderSizePixel = 0,
        LayoutOrder = 1,
        BackgroundColor3 = Color3.fromRGB(20, 22, 26),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Size = UDim2.fromScale(1, 1),
    }
    local v15 = {uICorner = react.createElement("UICorner"), header = react.createElement("TextLabel", {
        TextScaled = true,
        TextSize = 14,
        TextWrapped = true,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 2,
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal),
        Text = header,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextXAlignment = Enum.TextXAlignment.Left,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.498, 0.368),
        Size = UDim2.fromScale(0.85, 0.351),
    }), body = react.createElement("TextLabel", {
        TextScaled = true,
        TextSize = 14,
        TextTransparency = 0.35,
        TextWrapped = true,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 2,
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json"),
        Text = string.format(body, v8.Name),
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextXAlignment = Enum.TextXAlignment.Left,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.517, 0.664),
        Size = UDim2.fromScale(0.887, 0.244),
    })}
    local v16 = {
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0, 1),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0, 1),
        Size = v3:map(function(p1) -- Line: 771
            local v1 = math.clamp(p1, 0, 1)
            return UDim2.fromScale(v1, 0.1)
        end),
    }
    local v17 = {uICorner = react.createElement("UICorner")}
    local v18 = {Rotation = -90}
    local v19 = {}
    local v20 = NumberSequenceKeypoint.new(0, 0)
    local v21 = NumberSequenceKeypoint.new(0.5, 0)
    local v22 = NumberSequenceKeypoint.new(0.501, 1)
    v19[1] = v20
    v19[2] = v21
    v19[3] = v22
    v19[4] = NumberSequenceKeypoint.new(1, 1)
    v18.Transparency = NumberSequence.new(v19)
    v17.uIGradient = react.createElement("UIGradient", v18)
    v15.hold = react.createElement("Frame", v16, v17)
    v16 = {
        BackgroundTransparency = 0.85,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(167, 195, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.705),
        Size = UDim2.fromScale(1, 0.59),
    }
    v17 = {}
    v18 = {Rotation = -90}
    v19 = {}
    v20 = NumberSequenceKeypoint.new(0, 0)
    v21 = NumberSequenceKeypoint.new(0.493, 0.686)
    v19[1] = v20
    v19[2] = v21
    v19[3] = NumberSequenceKeypoint.new(1, 1)
    v18.Transparency = NumberSequence.new(v19)
    v17.uIGradient = react.createElement("UIGradient", v18)
    v17.uICorner1 = react.createElement("UICorner")
    v15.gradient = react.createElement("Frame", v16, v17)
    v13.label = react.createElement("Frame", v14, v15)
    v13.uIAspectRatioConstraint = react.createElement("UIAspectRatioConstraint", {AspectRatio = 3.48})
    v14 = {
        BackgroundTransparency = 0.15,
        BorderSizePixel = 0,
        BackgroundColor3 = Color3.fromRGB(20, 22, 26),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0, 0.235),
        Size = UDim2.fromOffset(61, 61),
    }
    v15 = {uIAspectRatioConstraint1 = react.createElement("UIAspectRatioConstraint"), button = react.createElement("TextLabel", {
        TextScaled = true,
        TextSize = 14,
        TextWrapped = true,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal),
        Text = v8.Name,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(0.7, 0.7),
    }), uICorner2 = react.createElement("UICorner")}
    v16 = {
        BackgroundTransparency = 0.85,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(167, 195, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.705),
        Size = UDim2.fromScale(1, 0.59),
    }
    v17 = {}
    v18 = {Rotation = -90}
    v19 = {}
    v20 = NumberSequenceKeypoint.new(0, 0)
    v21 = NumberSequenceKeypoint.new(0.493, 0.686)
    v19[1] = v20
    v19[2] = v21
    v19[3] = NumberSequenceKeypoint.new(1, 1)
    v18.Transparency = NumberSequence.new(v19)
    v17.uIGradient1 = react.createElement("UIGradient", v18)
    v17.uICorner3 = react.createElement("UICorner")
    v15.gradient1 = react.createElement("Frame", v16, v17)
    v13.keybind = react.createElement("Frame", v14, v15)
    v11.Interaction = react.createElement("Frame", v12, v13)
    local createElement_2 = react.createElement
    v12 = {
        BackgroundTransparency = 0.15,
        BorderSizePixel = 0,
        LayoutOrder = 2,
        AnchorPoint = Vector2.new(0, 0),
        Position = v5:map(function(p1) -- Line: 871
            return p1 + UDim2.fromOffset(-63, 33.5)
        end),
        Size = UDim2.fromOffset(277, 50),
    }
    v13 = v7
    if v13 then
        v13 = not v4
    end
    v12.Visible = v13
    v12.BackgroundColor3 = Color3.fromRGB(20, 22, 26)
    v12.BorderColor3 = Color3.fromRGB(0, 0, 0)
    v13 = {uICorner = react.createElement("UICorner")}
    local createElement_3 = react.createElement
    v14 = {
        Height = 50,
        RichText = true,
        Animated = false,
        Header = ("<b>Supply</b> <font transparency=\"0.4\"> [%*/%*]</font>"):format(v1, v2),
        Value = v9,
    }
    if v9 < 0.25 then
        v15 = Color3.fromRGB(255, 138, 138)
    elseif v9 >= 0.5 then
        v15 = Color3.fromRGB(138, 255, 157)
    else
        v15 = Color3.fromRGB(255, 215, 138)
        if not v15 then
            v15 = Color3.fromRGB(138, 255, 157)
        end
    end
    v14.Color = v15
    v14.Native = {BackgroundTransparency = 1, AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5)}
    v13.Supply = createElement_3(Progress, v14, {})
    v11.Supply = createElement_2("Frame", v12, v13)
    return createElement(TransparencyGroup, v10, v11)
end
v3.Octree = u297
function v3.getCurrentInteraction() -- Line: 911 -- upvalues: u295 (ref)
    return u295
end
return v3