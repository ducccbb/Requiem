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
--         File: ReplicatedStorage.Client.Interfaces.Routes.Screen.GrappleRange
--                               Dumped in 0.00180 seconds
--                          Bytecode version 9  |  13 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local CollectionService = game:GetService("CollectionService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_2:WaitForChild("Client")
local Progression = Client:WaitForChild("Progression")
local ClientAttributesHandler = require(Progression:WaitForChild("ClientAttributesHandler"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_3:WaitForChild("Client")
local User = Client_2:WaitForChild("User")
local Equipment = User:WaitForChild("Equipment")
local Gear_2 = Equipment:WaitForChild("Gear")
local ClientGearHandler = require(Gear_2:WaitForChild("ClientGearHandler"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_4:WaitForChild("Client")
local User_2 = Client_3:WaitForChild("User")
local State = User_2:WaitForChild("State")
local ClientSettingsHandler = require(State:WaitForChild("ClientSettingsHandler"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_5:WaitForChild("Client")
local User_3 = Client_4:WaitForChild("User")
local State_2 = User_3:WaitForChild("State")
local ClientStateHandler = require(State_2:WaitForChild("ClientStateHandler"))
local States = ClientStateHandler.States
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_6:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Tinkers = require(Utilities:WaitForChild("Tinkers"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_7:WaitForChild("Common")
local Utilities_2 = Common_2:WaitForChild("Utilities")
local Gear = require(Utilities_2:WaitForChild("Gear"))
local u187 = Color3.fromRGB(255, 255, 255)
local u192 = Color3.fromRGB(255, 70, 70)
local function getFullGrappleLength(p1) -- Line: 44 -- upvalues: ClientGearHandler (val), ClientAttributesHandler (val), Tinkers (val), Gear (val)
    local v1, v2
    local PrimaryPart = p1.PrimaryPart
    if not PrimaryPart then
        return 0
    end
    local v3 = ClientGearHandler.getGearState()
    if ClientAttributesHandler.getAttribute("GrappleLengthScaleVelocity") ~= 1 then
        v1 = 0
    else
        v1 = math.clamp(PrimaryPart.AssemblyLinearVelocity.Magnitude / 2 / 400, 0, 1)
    end
    local v4 = Tinkers.getModifierConfig("Grapple Range")
    if not v3 then
        v2 = 1
    else
        v2 = Gear.getTinkerModifierMultiplier(v3, "Grapple Range", v4)
        if not v2 then
            v2 = 1
        end
    end
    local GearGrappleRangeMultiplier = ClientAttributesHandler.getAttribute("GearGrappleRangeMultiplier")
    return (ClientAttributesHandler.getAttribute("GearAdditionalGrappleRange") + 400 + 0) * v2 * (1 + v1) * GearGrappleRangeMultiplier
end
local function getAimDistance(p1, p2) -- Line: 71 -- upvalues: Players (val), CollectionService (val), Workspace (val)
    local Mouse = Players.LocalPlayer:GetMouse()
    local v1 = CollectionService:GetTagged("Focused")[1]
    if v1 then
        local CFrame
        if not v1.PrimaryPart then
            CFrame = v1:GetPivot()
        else
            CFrame = v1.PrimaryPart.CFrame
            if not CFrame then
                CFrame = v1:GetPivot()
            end
        end
        return (CFrame.Position - p1.CFrame.Position).Magnitude
    end
    local v2 = RaycastParams.new()
    v2.FilterType = Enum.RaycastFilterType.Exclude
    v2.CollisionGroup = "Blades"
    v2.FilterDescendantsInstances = {p2}
    local v3 = Workspace:Raycast(p1.CFrame.Position, (Mouse.Hit.Position - p1.CFrame.Position).Unit * 9999, v2)
    if not v3 then
        return nil
    end
    return (v3.Position - p1.CFrame.Position).Magnitude
end
local function canDisplayGrappleRange() -- Line: 94 -- upvalues: ClientGearHandler (val), ClientAttributesHandler (val), ClientSettingsHandler (val), ClientStateHandler (val), States (val)
    local v1 = ClientGearHandler.getGearState()
    local handles = false
    if ClientAttributesHandler.getAttribute("CanViewGrappleRange") == 1 then
        handles = false
        if ClientSettingsHandler.getSettingFromName("Grapple Range Display") ~= false then
            handles = false
            if v1 ~= nil then
                handles = v1.handles
                if handles then
                    handles = v1.enabled
                    if handles then
                        handles = not ClientStateHandler.isStateBusy(States.TRANSFORMED)
                    end
                end
            end
        end
    end
    return handles
end
return function() -- Line: 107 -- upvalues: react (val), u187 (val), RunService (val), canDisplayGrappleRange (val), Players (val), Workspace (val), getAimDistance (val), UserInputService (val), u192 (val), getFullGrappleLength (val), ClientGearHandler (val), ClientAttributesHandler (val), ClientStateHandler (val), States (val), ClientSettingsHandler (val)
    local u12, u17, u22, u7, v1, v2, v3, v4
    v1, u7 = react.useBinding(UDim2.fromOffset(0, 0))
    v2, u12 = react.useBinding("")
    v3, u17 = react.useBinding(u187)
    v4, u22 = react.useState(false)
    react.useEffect(function() -- Line: 113 -- upvalues: RunService (upval), canDisplayGrappleRange (upval), u22 (val), Players (upval), Workspace (upval), getAimDistance (upval), UserInputService (upval), u7 (val), u12 (val), u17 (val), u192 (upval), getFullGrappleLength (upval), u187 (upval), ClientGearHandler (upval), ClientAttributesHandler (upval), ClientStateHandler (upval), States (upval), ClientSettingsHandler (upval)
        local refresh, u22
        local u0 = nil
        local u1 = nil
        local u2 = nil
        local function stopTracking() -- Line: 118 -- upvalues: u0 (ref)
            if u0 then
                u0:Disconnect()
                u0 = nil
            end
        end
        local function disconnectGearSignals() -- Line: 125 -- upvalues: u1 (ref), u2 (ref)
            if u1 then
                u1:Disconnect()
                u1 = nil
            end
            if u2 then
                u2:Disconnect()
                u2 = nil
            end
        end
        local function startTracking() -- Line: 137 -- upvalues: u0 (ref), RunService (upval), canDisplayGrappleRange (upval), u22 (upval), Players (upval), Workspace (upval), getAimDistance (upval), UserInputService (upval), u7 (upval), u12 (upval), u17 (upval), u192 (upval), getFullGrappleLength (upval), u187 (upval)
            if u0 then
                return
            end
            u0 = RunService.RenderStepped:Connect(function() -- Line: 142 -- upvalues: canDisplayGrappleRange (upval), u22 (upval), Players (upval), Workspace (upval), getAimDistance (upval), UserInputService (upval), u7 (upval), u12 (upval), u17 (upval), u192 (upval), getFullGrappleLength (upval), u187 (upval)
                local v1
                if not (canDisplayGrappleRange()) then
                    u22(false)
                    return
                end
                u22(true)
                local Character = Players.LocalPlayer.Character
                local CurrentCamera = Workspace.CurrentCamera
                if not Character or not CurrentCamera then
                    return
                end
                local v2 = getAimDistance(CurrentCamera, Character)
                local MouseLocation = UserInputService:GetMouseLocation()
                local v3 = MouseLocation.X + 8
                u7(UDim2.fromOffset(v3, MouseLocation.Y - 8))
                if not v2 then
                    u12("0")
                    u17(u192)
                    return
                end
                local v4 = getFullGrappleLength(Character)
                local v5 = math.round(v2)
                v3 = v2 <= v4
                u12((("%*"):format(v5)))
                if not v3 then
                    v1 = u192
                else
                    v1 = u187
                end
                u17(v1)
            end)
        end
        function refresh() -- Line: 176 -- upvalues: disconnectGearSignals (val), ClientGearHandler (upval), u1 (ref), refresh (val), u2 (ref), canDisplayGrappleRange (upval), startTracking (val), stopTracking (val), u22 (upval)
            disconnectGearSignals()
            local v1 = ClientGearHandler.getGearState()
            if v1 then
                u1 = v1.signals.handles:Connect(refresh)
                u2 = v1.signals.enabled:Connect(refresh)
            end
            if canDisplayGrappleRange() then
                startTracking()
                return
            end
            stopTracking()
            u22(false)
        end
        refresh()
        local u16 = ClientAttributesHandler.onAttributeChanged("CanViewGrappleRange"):Connect(refresh)
        u22 = ClientGearHandler.onGearAdded:Connect(refresh)
        local u31 = ClientStateHandler.onStateChanged(States.TRANSFORMED):Connect(refresh)
        local u37 = ClientSettingsHandler.onSettingChanged:Connect(function(p1) -- Line: 198 -- upvalues: refresh (val)
            if p1 == "Grapple Range Display" then
                refresh()
            end
        end)
        return function() -- Line: 204 -- upvalues: u16 (val), u22 (val), u31 (val), u37 (val), disconnectGearSignals (val), stopTracking (val)
            u16:Disconnect()
            u22:Disconnect()
            u31:Disconnect()
            u37:Disconnect()
            disconnectGearSignals()
            stopTracking()
        end
    end, {})
    return react.createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 10,
        AnchorPoint = Vector2.new(0, 1),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Position = v1,
        Size = UDim2.fromOffset(44, 16),
        Visible = v4,
    }, {Range = react.createElement("TextLabel", {
        BackgroundTransparency = 1,
        TextSize = 15,
        TextWrapped = false,
        AnchorPoint = Vector2.new(0, 1),
        FontFace = Font.new("rbxasset://fonts/families/Fondamento.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
        Position = UDim2.fromScale(0, 1),
        Size = UDim2.fromScale(1, 1),
        Text = v2,
        TextColor3 = v3,
    }, {uIStroke = react.createElement("UIStroke", {Thickness = 1})})})
end