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
--      File: ReplicatedStorage.Client.Interfaces.Routes.Customization.Introduction
--                               Dumped in 0.00381 seconds
--                          Bytecode version 9  |  32 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local GuiService = game:GetService("GuiService")
local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Promise = require(Common:WaitForChild("Promise"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_2:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Network = Common_2:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Administration = require(Namespaces:WaitForChild("Administration"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Constants = require(Common_3:WaitForChild("Constants"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_5:WaitForChild("Common")
local Types = Common_4:WaitForChild("Types")
local Locations = require(Types:WaitForChild("Locations"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_6:WaitForChild("Common")
local Network_2 = Common_5:WaitForChild("Network")
local Namespaces_2 = Network_2:WaitForChild("Namespaces")
local Player = require(Namespaces_2:WaitForChild("Player"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_7:WaitForChild("Common")
local Administration_2 = Common_6:WaitForChild("Administration")
local Permissions = require(Administration_2:WaitForChild("Permissions"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Common_7 = ReplicatedStorage_8:WaitForChild("Common")
local Network_3 = Common_7:WaitForChild("Network")
local Namespaces_3 = Network_3:WaitForChild("Namespaces")
local Servers = require(Namespaces_3:WaitForChild("Servers"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Common_8 = ReplicatedStorage_9:WaitForChild("Common")
local Signals = require(Common_8:WaitForChild("Signals"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Common_9 = ReplicatedStorage_10:WaitForChild("Common")
local Network_4 = Common_9:WaitForChild("Network")
local Namespaces_4 = Network_4:WaitForChild("Namespaces")
local Vitality = require(Namespaces_4:WaitForChild("Vitality"))
local Screens_2 = v1.Parent:WaitForChild("Screens")
local Screens = require(Screens_2:WaitForChild("Screens"))
local Hooks = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useAsyncEffect = require(Hooks:WaitForChild("useAsyncEffect"))
local Hooks_2 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useInterfaceState = require(Hooks_2:WaitForChild("useInterfaceState"))
local Hooks_3 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useMotion = require(Hooks_3:WaitForChild("useMotion"))
local Hooks_4 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useStore = require(Hooks_4:WaitForChild("useStore"))
local Hooks_5 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useToast = require(Hooks_5:WaitForChild("useToast"))
return function() -- Line: 60 -- upvalues: useInterfaceState (val), useToast (val), react (val), useMotion (val), Workspace (val), useStore (val), Servers (val), Player (val), Vitality (val), Administration (val), Players (val), Permissions (val), useAsyncEffect (val), Promise (val), Screens (val), UserInputService (val), RunService (val), Constants (val), Signals (val), Lighting (val), Locations (val), GuiService (val)
    local created, mia, u20, u21, u25, u29, u30, u34, u35, u39, u40, u44, u45, u49, u50, u54, u55, u59, u60, u64, u65, u73, u77, u9, v1, v2, v3, v4, v5
    _, created = useInterfaceState("created")
    local black = useInterfaceState("black")
    u9, v3 = useInterfaceState("server-selecting")
    local v6 = v3
    if not v6 then
        v6 = {visible = false, place = 0}
    end
    v3 = v6
    local u16 = useToast()
    u20, u21 = react.useBinding(nil)
    v5, u25 = useMotion(0)
    u29, u30 = react.useState(false)
    u34, u35 = react.useState(true)
    u39, u40 = react.useState(false)
    u44, u45 = react.useState(false)
    u49, u50 = react.useState(false)
    u54, u55 = react.useState(nil)
    u59, u60 = react.useState(0)
    u64, u65 = react.useState(false)
    v1, u73 = react.useBinding(Vector2.new(0, 0))
    v2, u77 = useMotion(0)
    local u82 = react.useMemo(function() -- Line: 86 -- upvalues: Workspace (upval)
        return Workspace:WaitForChild("World")
    end, {})
    local u87 = useStore(Servers.Store, function(p1) -- Line: 90
        local v1 = p1
        if not v1 then
            v1 = {}
        end
        return v1
    end)
    local u92 = useStore(Player.Store, function(p1) -- Line: 95
        return p1
    end)
    local u97 = useStore(Vitality.Store, function(p1) -- Line: 99
        return p1
    end)
    local v7 = useStore(Administration.Store, function(p1) -- Line: 103
        return p1
    end)
    react.useEffect(function() -- Line: 107 -- upvalues: u82 (val), Players (upval), u40 (val)
        local v1, v2
        if not u82 then
            return
        end
        v1, v2 = pcall(function() -- Line: 112 -- upvalues: Players (upval)
            return Players.LocalPlayer:GetRankInGroupAsync(34035348)
        end)
        if v1 then
            local v3 = 40 <= v2
            u40(v3)
            return
        end
        if not v1 then
            u82.Locations:WaitForChild("Tester"):Destroy()
        elseif not v2 then
            u82.Locations:WaitForChild("Tester"):Destroy()
        end
    end, {u82})
    local v8 = v7
    if v8 then
        v8 = Permissions.Roles.Actor <= v7.permission
    end
    react.useEffect(function() -- Line: 125 -- upvalues: Players (upval), u45 (val)
        local v1, v2
        v1, v2 = pcall(function() -- Line: 126 -- upvalues: Players (upval)
            return Players.LocalPlayer:GetRankInGroupAsync(34035348)
        end)
        if v1 then
            local v3 = v2 == 20
            u45(v3)
        end
    end, {})
    local u127 = u92
    if u127 then
        u127 = u92.client.supporter == 1
    end
    local u133 = u92
    if u133 then
        u133 = u92.client.tester == 1
    end
    local u139 = u92
    if u139 then
        u139 = u92.client.mia ~= 0
    end
    local v9 = react.useMemo(function() -- Line: 140 -- upvalues: u87 (val)
        local v1
        local v2 = {}
        for k, v in pairs(u87) do
            v1 = tostring(v.place)
            v2[v1] = v.players
        end
        return v2
    end, {u87})
    useAsyncEffect(function() -- Line: 150 -- upvalues: created (val), u29 (val), u34 (val), Promise (upval), u25 (val)
        local createPulseAnimation
        if not created then
            return
        end
        if u29 or not u34 then
            return Promise.resolve():andThen(function() -- Line: 157 -- upvalues: u25 (upval)
                u25:spring(1)
            end)
        end
        function createPulseAnimation() -- Line: 162 -- upvalues: u25 (upval), Promise (upval), createPulseAnimation (val)
            u25:tween(0.5, {time = 1.5})
            return Promise.delay(1.5):andThen(function() -- Line: 166 -- upvalues: u25 (upval), Promise (upval), createPulseAnimation (upval)
                u25:tween(0, {time = 1.5})
                return Promise.delay(1.5):andThen(function() -- Line: 170 -- upvalues: createPulseAnimation (upval)
                    return createPulseAnimation()
                end)
            end)
        end
        return createPulseAnimation()
    end, {created, u29, u34})
    local v10 = {}
    mia = u92
    if mia then
        mia = u92.client.mia
    end
    v10[1] = created
    v10[2] = u82
    v10[3] = u139
    v10[4] = mia
    react.useEffect(function() -- Line: 180 -- upvalues: created (val), u82 (val), Players (upval), Screens (upval), black (val), u35 (val), u30 (val), UserInputService (upval), RunService (upval), u20 (val), u73 (val), u77 (val), u55 (val), u60 (val), u65 (val), u44 (val), Constants (upval), u50 (val), u139 (val), u92 (val), Signals (upval)
        if not created or not u82 then
            return
        end
        local Mouse = Players.LocalPlayer:GetMouse()
        Screens.onPreloadCustomLoadingScreen("Arcane")
        local u11 = nil
        local function onCancelCutscene() -- Line: 197 -- upvalues: u11 (ref), black (upval), u35 (upval), Screens (upval), u82 (upval), u30 (upval)
            u11:Disconnect()
            black({enabled = true, tween = TweenInfo.new(0.75)})
            u35(false)
            task.delay(0.75, function() -- Line: 204 -- upvalues: Screens (upval), u82 (upval), u30 (upval)
                workspace.CurrentCamera.FieldOfView = 70
                Screens.onCancelCustomLoadingScreen()
                u82.Audio.Music:Play()
                u30(true)
            end)
        end
        local function onLoadCutscene() -- Line: 217 -- upvalues: Screens (upval), onCancelCutscene (val)
            Screens.onLoadCustomLoadingScreen("Arcane", onCancelCutscene)
        end
        local u14 = nil
        if workspace:GetAttribute("IS_CUTSCENE_READY") then
            onLoadCutscene()
        else
            local AttributeChangedSignal = workspace:GetAttributeChangedSignal("IS_CUTSCENE_READY")
            u14 = AttributeChangedSignal:Connect(function() -- Line: 227 -- upvalues: onLoadCutscene (val)
                if workspace:GetAttribute("IS_CUTSCENE_READY") then
                    onLoadCutscene()
                end
            end)
        end
        black({enabled = false, tween = TweenInfo.new(0.75)})
        local CurrentCamera = workspace.CurrentCamera
        local function getMouseVector() -- Line: 248 -- upvalues: UserInputService (upval), u82 (upval), CurrentCamera (val)
            local MouseLocation = UserInputService:GetMouseLocation()
            local v1 = RaycastParams.new()
            v1.FilterType = Enum.RaycastFilterType.Include
            v1.FilterDescendantsInstances = {u82.Locations}
            local v2 = CurrentCamera:ViewportPointToRay(MouseLocation.X, MouseLocation.Y)
            local v3 = workspace:Raycast(v2.Origin, v2.Direction * 5000, v1)
            if not v3 then
                return
            end
            return v3.Position, v3.Instance
        end
        local u47 = RunService.RenderStepped:Connect(function(p1) -- Line: 267 -- upvalues: u20 (upval), Mouse (val), CurrentCamera (val), u73 (upval), u77 (upval), getMouseVector (val), u55 (upval), u60 (upval), u65 (upval), u44 (upval), Constants (upval), u50 (upval), u139 (upval), u92 (upval)
            local CFrame
            if not u20 or not (u20:getValue()) then
                return
            end
            if not u20 then
                CFrame = CFrame.new(0, 0, 0)
            elseif u20:getValue() then
                CFrame = u20:getValue().CFrame
            end
            local v1 = math.rad((Mouse.Y - Mouse.ViewSizeY / 2) / Mouse.ViewSizeY * -6)
            local v2 = Mouse.X - Mouse.ViewSizeX / 2
            local v3 = math.rad(v2 / Mouse.ViewSizeX * -6)
            local v4 = CFrame.Angles(v1, v3, 0)
            CurrentCamera.CameraType = Enum.CameraType.Scriptable
            CurrentCamera.CFrame = CFrame * v4
            u73(Vector2.new(Mouse.X, Mouse.Y))
            u77:spring(-1)
            _, v3 = getMouseVector()
            if not v3 then
                Mouse.Icon = ""
                return u55(nil)
            end
            local Attribute = v3:GetAttribute("Place")
            u60(Attribute)
            local Attribute_2 = v3:GetAttribute("Locked")
            if not Attribute_2 then
                if not u44 then
                    Attribute_2 = false
                else
                    Attribute_2 = true
                    if Attribute ~= Constants.Places.Supporter then end
                end
            end
            u65(Attribute_2)
            v2 = u139
            if v2 then
                v2 = u92
                if v2 then
                    v2 = if u92.client.mia ~= Attribute then Attribute ~= Constants.Places.Supporter else false
                end
            end
            u50(v2)
            u55(v3.Name)
            u77:spring(0)
            Mouse.Icon = "rbxasset://textures/Cursors/KeyboardMouse/ArrowCursor.png"
        end)
        u11 = UserInputService.InputBegan:Connect(function(p1) -- Line: 317 -- upvalues: u11 (ref), onCancelCutscene (val)
            if not (workspace:GetAttribute("IS_LOADING_OVER")) then
                return
            end
            if p1.UserInputType == Enum.UserInputType.Keyboard then
                u11:Disconnect()
                onCancelCutscene()
                return
            end
            if p1.UserInputType ~= Enum.UserInputType.MouseButton1 then
                return
            end
            u11:Disconnect()
            onCancelCutscene()
        end)
        Signals.Bars:Fire(0.3, 0)
        return function() -- Line: 336 -- upvalues: u11 (ref), u47 (val), u14 (ref)
            u11:Disconnect()
            u47:Disconnect()
            if u14 then
                u14:Disconnect()
            end
        end
    end, v10)
    react.useEffect(function() -- Line: 346 -- upvalues: u29 (val), Lighting (upval), u21 (val), u82 (val), Signals (upval), black (val)
        if not u29 then
            return
        end
        local BloomEffect = Lighting:FindFirstChildWhichIsA("BloomEffect")
        if BloomEffect then
            BloomEffect.Enabled = false
        end
        local DepthOfFieldEffect = Lighting:FindFirstChildWhichIsA("DepthOfFieldEffect")
        if DepthOfFieldEffect then
            DepthOfFieldEffect.Enabled = false
        end
        u21(u82.Cameras.World)
        Signals.Bars:Fire(0.15, 0)
        task.wait(0.2)
        black({enabled = false, tween = TweenInfo.new(1.5)})
    end, {u29})
    react.useEffect(function() -- Line: 374 -- upvalues: u54 (val), UserInputService (upval), u97 (val), u49 (val), u16 (val), u127 (val), u44 (val), u133 (val), u59 (val), Constants (upval), u64 (val), u39 (val), Locations (upval), u9 (val)
        if not u54 then
            return
        end
        local u6 = UserInputService.InputBegan:Connect(function(p1) -- Line: 379 -- upvalues: u97 (upval), u49 (upval), u16 (upval), u127 (upval), u44 (upval), u133 (upval), u59 (upval), Constants (upval), u64 (upval), u39 (upval), Locations (upval), u9 (upval)
            if p1.UserInputType ~= Enum.UserInputType.MouseButton1 or u97.wiped == 1 then
                return
            end
            if u49 then
                u16({message = "You are missing in action.", type = "error"})
                return
            end
            if u127 or u44 or u133 then
                if u64 then
                    u16({message = "This map cannot be accessed at this time.", type = "error"})
                    return
                end
                if not u39 then
                    if u59 == Locations.Places[Locations.Locations.TESTING] then
                        u16({message = "You are not allowed to access this map.", type = "error"})
                        return
                    end
                    u9({visible = true, place = u59})
                    return
                end
                u9({visible = true, place = u59})
                return
            end
            if u59 == Constants.Places.Supporter then
                u16({message = "You are not allowed to access this place.", type = "error"})
                return
            end
            if u64 then
                u16({message = "This map cannot be accessed at this time.", type = "error"})
                return
            end
            if u39 then
                u9({visible = true, place = u59})
                return
            end
            if u59 == Locations.Places[Locations.Locations.TESTING] then
                u16({message = "You are not allowed to access this map.", type = "error"})
                return
            end
            u9({visible = true, place = u59})
        end)
        return function() -- Line: 414 -- upvalues: u6 (val)
            u6:Disconnect()
        end
    end, {
        u54,
        u59,
        u64,
        u127,
        u139,
        u49,
        u97.wiped,
        v8,
        u39,
    })
    local createElement = react.createElement
    v10 = {BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1)}
    if created == nil then
        v4 = false
    else
        v4 = created
        if not v4 then
            v4 = false
        end
    end
    v10.Visible = v4
    v4 = {Text = react.createElement("TextLabel", {
        Text = "Press any key to continue...",
        TextScaled = true,
        TextSize = 14,
        TextWrapped = true,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        FontFace = Font.new("rbxasset://fonts/families/AccanthisADFStd.json"),
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextTransparency = v5,
        AnchorPoint = Vector2.new(0.5, 1),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.95),
        Size = UDim2.fromOffset(700, 22),
    })}
    local v11 = {
        BackgroundTransparency = 1,
        ClipsDescendants = true,
        AnchorPoint = Vector2.new(0, 0.5),
        Position = v1:map(function(p1) -- Line: 456 -- upvalues: GuiService (upval)
            return UDim2.fromOffset(p1.X + 10, p1.Y + GuiService:GetGuiInset().Y)
        end),
        Size = UDim2.fromScale(0.126, 0.0443),
    }
    local v12 = if u54 ~= nil then not v3.visible else false
    v11.Visible = v12
    v12 = {Ratio = react.createElement("UIAspectRatioConstraint", {AspectRatio = 4.65})}
    local v13 = {
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(4, 4, 4),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = v2:map(function(p1) -- Line: 472
            return UDim2.fromScale(0.5, p1 + 0.5)
        end),
    }
    local v14 = UDim2.fromScale(1, 1)
    v13.Size = v14 + UDim2.fromOffset(-3, -3)
    v12.Toast = react.createElement("Frame", v13, {
        Corner = react.createElement("UICorner"),
        Stroke1 = react.createElement("UIStroke", {Transparency = 0.77}),
        Stroke2 = react.createElement("UIStroke", {Transparency = 0.88, BorderOffset = UDim.new(0, 1)}),
        Header = react.createElement("TextLabel", {
            TextScaled = true,
            TextSize = 14,
            TextWrapped = true,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            FontFace = Font.new("rbxasset://fonts/families/Guru.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
            Text = u54,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextXAlignment = Enum.TextXAlignment.Left,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.fromScale(0.06, 0.159),
            Size = UDim2.fromScale(0.969, 0.388),
        }, {uIAspectRatioConstraint = react.createElement("UIAspectRatioConstraint", {AspectRatio = 11.6})}),
        Count = react.createElement("TextLabel", {
            TextScaled = true,
            TextSize = 14,
            TextTransparency = 0.26,
            TextWrapped = true,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json"),
            Text = ("Currently %* active players."):format(v9[tostring(u59)] or 0),
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextXAlignment = Enum.TextXAlignment.Left,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.fromScale(0.06, 0.503),
            Size = UDim2.fromScale(0.746, 0.286),
        }, {Ratio = react.createElement("UIAspectRatioConstraint", {AspectRatio = 12.1})}),
        Stroke3 = react.createElement("UIStroke", {Color = Color3.fromRGB(17, 17, 22)}),
    })
    v4.Toast = react.createElement("Frame", v11, v12)
    return createElement("Frame", v10, v4)
end