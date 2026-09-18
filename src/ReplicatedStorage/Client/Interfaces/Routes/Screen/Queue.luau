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
--             File: ReplicatedStorage.Client.Interfaces.Routes.Screen.Queue
--                               Dumped in 0.00106 seconds
--                          Bytecode version 9  |  6 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
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
local Servers = require(Namespaces:WaitForChild("Servers"))
local Hooks = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useInterfaceState = require(Hooks:WaitForChild("useInterfaceState"))
local Hooks_2 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useStore = require(Hooks_2:WaitForChild("useStore"))
local Components = v1.Parent.Parent.Parent:WaitForChild("Components")
local Inputs = Components:WaitForChild("Inputs")
local Button = require(Inputs:WaitForChild("Button"))
local Components_2 = v1.Parent.Parent.Parent:WaitForChild("Components")
local Primitives = Components_2:WaitForChild("Primitives")
local Frame = require(Primitives:WaitForChild("Frame"))
local Components_3 = v1.Parent.Parent.Parent:WaitForChild("Components")
local Utilities = Components_3:WaitForChild("Utilities")
local TransparencyGroup = require(Utilities:WaitForChild("TransparencyGroup"))
return function(p1) -- Line: 30 -- upvalues: useInterfaceState (val), react (val), useStore (val), Servers (val), Promise (val), Frame (val), TransparencyGroup (val), Button (val)
    local u11, u16, u21, v1, v2, v3
    local teleporting = useInterfaceState("teleporting")
    local black = useInterfaceState("black")
    v1, u11 = react.useState(false)
    v2, u16 = react.useState("Position 1")
    v3, u21 = react.useState("")
    local u25 = react.useRef(false)
    local u29 = react.useRef(false)
    local u34 = useStore(Servers.Queue, function(p1) -- Line: 40
        return p1
    end)
    local v4 = {}
    local active = u34
    if active then
        active = u34.active
    end
    local position = u34
    if position then
        position = u34.position
    end
    local total = u34
    if total then
        total = u34.total
    end
    local serverName = u34
    if serverName then
        serverName = u34.serverName
    end
    v4[1] = active
    v4[2] = position
    v4[3] = total
    v4[4] = serverName
    react.useEffect(function() -- Line: 44 -- upvalues: u34 (val), u11 (val), u25 (val), u29 (val), black (val), Promise (upval), teleporting (val), u21 (val), u16 (val)
        local v1 = u34
        if v1 then
            v1 = u34.active == 1
        end
        u11(v1)
        if u25.current and not v1 and u34 and not u29.current then
            black({enabled = true, tween = TweenInfo.new(0.5)})
            Promise.delay(0.5):andThen(function() -- Line: 51 -- upvalues: teleporting (upval)
                teleporting(true)
            end)
        end
        if not v1 then
            u29.current = false
        end
        u25.current = v1
        if not v1 then
            u21("")
            return
        end
        local v2 = tonumber(u34.position) or 1
        local v3 = tonumber(u34.total) or v2
        local v4 = math.max(v3, v2)
        if v4 ~= 1 then
            v3 = "people"
        else
            v3 = "person"
        end
        local serverName = false
        if type(u34.serverName) == "string" then
            serverName = false
            if u34.serverName ~= "" then
                serverName = u34.serverName
            end
        end
        u16((("Position %*"):format(v2)))
        if serverName then
            u21((("There are currently %* %* queued for %*."):format(v4, v3, serverName)))
            return
        end
        u21((("There are currently %* %* queued."):format(v4, v3)))
    end, v4)
    return react.createElement(Frame, {}, {Queue = react.createElement(TransparencyGroup, {ZIndex = 100, Enabled = v1, Tween = TweenInfo.new(0.5)}, {Background = react.createElement("Frame", {
        BackgroundTransparency = 0,
        ZIndex = 100,
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        Size = UDim2.fromScale(1, 1),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
    }), View = react.createElement("ImageLabel", {
        Image = "rbxassetid://135589412519765",
        ImageTransparency = 0.85,
        BackgroundTransparency = 0,
        ZIndex = 101,
        ImageColor3 = Color3.fromRGB(82, 134, 255),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BorderColor3 = Color3.fromRGB(27, 42, 53),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(2, 2),
    }), Body = react.createElement(TransparencyGroup, {ZIndex = 102, Enabled = v1, Tween = TweenInfo.new(0.5, Enum.EasingStyle.Linear)}, {Header = react.createElement("TextLabel", {
        TextSize = 50,
        BackgroundTransparency = 1,
        Font = Enum.Font.SourceSansBold,
        Text = v2,
        TextColor3 = Color3.fromRGB(196, 196, 196),
        Size = UDim2.fromScale(1, 0.05),
        Position = UDim2.fromScale(0.5, 0.495),
        AnchorPoint = Vector2.new(0.5, 1),
    }), Body = react.createElement("TextLabel", {
        TextSize = 20,
        BackgroundTransparency = 1,
        TextTransparency = 0.5,
        Font = Enum.Font.SourceSans,
        Text = v3,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        Size = UDim2.fromScale(1, 0.015),
        Position = UDim2.fromScale(0.5, 0.495),
        AnchorPoint = Vector2.new(0.5, 0),
    }), Actions = react.createElement(TransparencyGroup, {ZIndex = 2, Enabled = v1, Tween = TweenInfo.new(0.5, Enum.EasingStyle.Linear)}, {Button = react.createElement(Button, {
        Text = "Leave Queue",
        Color = Color3.fromRGB(24, 59, 136),
        Native = {AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.55)},
        Clicked = function() -- Line: 150 -- upvalues: u29 (val), Servers (upval)
            u29.current = true
            Servers.Leave.post()
        end,
    })})})})})
end