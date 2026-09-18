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
--        File: ReplicatedStorage.Client.Interfaces.Components.Menu.Servers.List
--                               Dumped in 0.00203 seconds
--                          Bytecode version 9  |  8 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Constants = require(Common:WaitForChild("Constants"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Types = Common_2:WaitForChild("Types")
local Locations = require(Types:WaitForChild("Locations"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_3:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Network = Common_3:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Administration = require(Namespaces:WaitForChild("Administration"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_5:WaitForChild("Common")
local Network_2 = Common_4:WaitForChild("Network")
local Namespaces_2 = Network_2:WaitForChild("Namespaces")
require(Namespaces_2:WaitForChild("Servers"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_6:WaitForChild("Common")
local Administration_2 = Common_5:WaitForChild("Administration")
local Permissions = require(Administration_2:WaitForChild("Permissions"))
local Create = require(v1.Parent:WaitForChild("Create"))
local Server = require(v1.Parent:WaitForChild("Server"))
local Utilities = v1.Parent.Parent.Parent:WaitForChild("Utilities")
local TransparencyGroup = require(Utilities:WaitForChild("TransparencyGroup"))
local Hooks = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useMotion = require(Hooks:WaitForChild("useMotion"))
local Hooks_2 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useStore = require(Hooks_2:WaitForChild("useStore"))
local Hooks_3 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useToast = require(Hooks_3:WaitForChild("useToast"))
local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
return function(p1) -- Line: 56 -- upvalues: useToast (val), useMotion (val), useStore (val), Administration (val), Permissions (val), Constants (val), react (val), Server (val), Locations (val), Create (val), TransparencyGroup (val), UserInputService (val), PlayerGui (val)
    local createElement_2, name, u30, u517, v1, v2, v3, v4
    local u2 = useToast()
    local v5 = {}
    v4, u517 = useMotion(-100)
    local v6 = useStore(Administration.Store, function(p1) -- Line: 63
        return p1
    end)
    if not v6 then
        u30 = if p1.Place ~= Constants.Places.Supporter then p1.Place == Constants.Places.Testing else true
    elseif v6.permission then
        u30 = true
        if Permissions.Accessability.Events <= v6.permission then end
    end
    local v7 = 0
    local u490 = p1
    for k, v in pairs(p1.Servers) do
        if v.place == u490.Place then
            v7 = v7 + 1
            name = v.name
            createElement_2 = react.createElement
            v1 = {Players = v.players, Name = v.name, Queue = v.queue, Queued = v.queued}
            if not v.event.host then
                v2 = nil
            else
                v2 = {Host = v.event.host}
                v3 = v.event.host == "Unknown"
                v2.Visible = not v3
            end
            v1.Event = v2
            function v1.Clicked() -- Line: 95 -- upvalues: v (val), u30 (val), u2 (val), u490 (val)
                if v.maximum > v.players or v.queue == 1 then
                    u490.Clicked(v)
                    return
                end
                if not u30 then
                    return u2({type = "error", message = ("This server is full. (%*/%*)"):format(v.players, v.maximum)})
                end
                u490.Clicked(v)
            end
            v5[name] = createElement_2(Server, v1)
        end
    end
    react.useEffect(function() -- Line: 110 -- upvalues: u517 (val), u490 (val)
        local v1
        if not u490.Visible then
            v1 = -100
        else
            v1 = 0
        end
        u517:spring(v1)
    end, {u490.Visible})
    if u30 then
        v5.create = react.createElement(Create, {
            Clicked = function() -- Line: 131 -- upvalues: u490 (val)
                u490.Create()
            end,
        })
    elseif v7 == 0 and u490.Place ~= Locations.Places[Locations.Locations.TUNDRA] and u490.Place ~= Locations.Places[Locations.Locations.ROYAL_PALACE] and u490.Place ~= Locations.Places[Locations.Locations.SOUTHERN_WILDERNESS_1] and u490.Place ~= Locations.Places[Locations.Locations.WALL_MARIA_WILDERNESS_1] and u490.Place ~= Locations.Places[Locations.Locations.WALL_ROSE_WILDERNESS_1] and u490.Place ~= Locations.Places[Locations.Locations.KROLVA] and u490.Place ~= Locations.Places[Locations.Locations.WALL_SINA_SEGMENT_1] then
        v5.create = react.createElement(Create, {
            Clicked = function() -- Line: 131 -- upvalues: u490 (val)
                u490.Create()
            end,
        })
    end
    local v8 = {Enabled = u490.Visible, Tween = TweenInfo.new(0.2)}
    local v9 = {}
    local createElement = react.createElement
    local v10 = {
        BackgroundTransparency = 0.35,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(10, 10, 16),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = v4:map(function(p1) -- Line: 147
            local v1 = UDim2.fromScale(0.5, 0.5)
            return v1 + UDim2.fromOffset(0, p1)
        end),
        Size = UDim2.fromScale(1, 1),
    }
    local v11 = {}
    local v12 = {BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1), Text = ""}
    v12[react.Event.MouseButton1Click] = function(p1, ...) -- Line: 157 -- upvalues: UserInputService (upval), PlayerGui (upval), u490 (val)
        local MouseLocation = UserInputService:GetMouseLocation()
        local GuiObjectsAtPosition = PlayerGui:GetGuiObjectsAtPosition(MouseLocation.X, MouseLocation.Y)
        if table.find(GuiObjectsAtPosition, p1.Parent.Holder) then
            return
        end
        u490.Closed()
    end
    v12.ZIndex = -2
    v11.Close = react.createElement("TextButton", v12)
    v11.Info = react.createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = -1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(8, 9, 13),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
    }, {Vignette = react.createElement("ImageLabel", {
        Image = "rbxassetid://135589412519765",
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ImageColor3 = Color3.fromRGB(0, 0, 0),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(12, 17, 18),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.504, 0.5),
        Size = UDim2.fromScale(1.5, 1),
    })})
    v11.Holder = react.createElement("Frame", {
        BorderSizePixel = 0,
        BackgroundColor3 = Color3.fromRGB(31, 33, 39),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(0.305, 0.491),
        AnchorPoint = Vector2.new(0.5, 0.5),
    }, {
        Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 10)}),
        Padding = react.createElement("UIPadding", {PaddingBottom = UDim.new(0, 15), PaddingLeft = UDim.new(0, 15), PaddingRight = UDim.new(0, 15), PaddingTop = UDim.new(0, 15)}),
        Stroke = react.createElement("UIStroke", {Thickness = 2, Transparency = 0.76}),
        List = react.createElement("ScrollingFrame", {
            ScrollBarThickness = 4,
            Active = true,
            BackgroundTransparency = 0.95,
            BorderSizePixel = 0,
            ZIndex = 2,
            AutomaticCanvasSize = Enum.AutomaticSize.Y,
            CanvasSize = UDim2.new(),
            ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(1, 1),
        }, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 10)}), Stroke = react.createElement("UIStroke", {Color = Color3.fromRGB(21, 22, 26)}), Padding = react.createElement("UIPadding", {PaddingBottom = UDim.new(0, 3), PaddingLeft = UDim.new(0, 3), PaddingRight = UDim.new(0, 3), PaddingTop = UDim.new(0, 3)}), List = react.createElement("UIListLayout", {Padding = UDim.new(0, 5), HorizontalAlignment = Enum.HorizontalAlignment.Center, SortOrder = Enum.SortOrder.LayoutOrder})}, v5),
        Image = react.createElement("ImageLabel", {
            Image = "rbxassetid://116197358975616",
            ImageTransparency = 0.985,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.new(1, 15, 1, 15),
        }),
        Ratio = react.createElement("UIAspectRatioConstraint"),
    })
    v11.Background = react.createElement("ImageLabel", {
        Image = "rbxassetid://116197358975616",
        ImageTransparency = 0.87,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = -1,
        ImageColor3 = Color3.fromRGB(20, 21, 25),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromOffset(1000, 1000),
    })
    v9.Container = createElement("Frame", v10, v11)
    return react.createElement(TransparencyGroup, v8, v9)
end