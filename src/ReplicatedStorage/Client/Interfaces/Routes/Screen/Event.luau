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
--             File: ReplicatedStorage.Client.Interfaces.Routes.Screen.Event
--                               Dumped in 0.00178 seconds
--                          Bytecode version 9  |  11 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Server = require(Namespaces:WaitForChild("Server"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_2:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Alive = require(Common_2:WaitForChild("Alive"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Utilities = Common_3:WaitForChild("Utilities")
local Sounds = require(Utilities:WaitForChild("Sounds"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_5:WaitForChild("Common")
local Sounds_2 = Common_4:WaitForChild("Sounds")
local Universal = require(Sounds_2:WaitForChild("Universal"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_6:WaitForChild("Client")
local User = Client:WaitForChild("User")
local State = User:WaitForChild("State")
local ClientStateHandler = require(State:WaitForChild("ClientStateHandler"))
local Components = v1.Parent.Parent.Parent:WaitForChild("Components")
local Primitives = Components:WaitForChild("Primitives")
local Image = require(Primitives:WaitForChild("Image"))
local Components_2 = v1.Parent.Parent.Parent:WaitForChild("Components")
local Utilities_2 = Components_2:WaitForChild("Utilities")
local TransparencyGroup = require(Utilities_2:WaitForChild("TransparencyGroup"))
local Hooks = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useRem = require(Hooks:WaitForChild("useRem"))
local Hooks_2 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useStore = require(Hooks_2:WaitForChild("useStore"))
return function() -- Line: 34 -- upvalues: useRem (val), react (val), useStore (val), Server (val), ClientStateHandler (val), Sounds (val), Universal (val), Alive (val), TransparencyGroup (val), Image (val)
    local u6, v1, v2
    local v3 = useRem()
    v1, u6 = react.useState(false)
    local u10 = react.useRef({})
    local u15 = useStore(Server.Store, function(p1) -- Line: 41
        return p1
    end)
    react.useEffect(function() -- Line: 45 -- upvalues: ClientStateHandler (upval), u6 (val)
        local u9 = ClientStateHandler.onServerStateChanged(ClientStateHandler.Server.COMBAT_TAGGED):Connect(function(p1) -- Line: 47 -- upvalues: u6 (upval)
            u6(p1)
        end)
        return function() -- Line: 51 -- upvalues: u9 (val)
            u9:Disconnect()
        end
    end, {})
    react.useEffect(function() -- Line: 163 -- upvalues: u15 (val), Sounds (upval), Universal (upval)
        if u15.event == 1 then
            Sounds.playGlobalSoundEffect(Universal.Event, 0.1, 1.5)
            return
        end
        if u15.event ~= 2 then
            return
        end
        Sounds.playGlobalSoundEffect(Universal.Event, 0.1, 1.5)
    end, {u15.event})
    react.useEffect(function() -- Line: 171 -- upvalues: u15 (val), u10 (val), Alive (upval)
        if workspace:GetAttribute("Optimize") then
            return
        end
        local u33 = nil
        if u15.event ~= 0 then
            u10.current = {}
            u33 = Alive.PlayerAdded:Connect(function(p1) -- Line: 193 -- upvalues: Alive (upval), u10 (upval)
                if p1 == Alive.LocalPlayer then
                    return
                end
                p1.CharacterAdded:Wait()
                p1.Parent = nil
                table.insert(u10.current, p1)
            end)
            for i, j in Alive.getPlayers() do
                if j ~= Alive.LocalPlayer then
                    task.spawn(function() -- Line: 212 -- upvalues: j (val), u10 (upval)
                        if not j.Character then
                            j.CharacterAdded:Wait()
                        end
                        j.Parent = nil
                        table.insert(u10.current, j)
                    end)
                end
            end
        else
            for i2, v in ipairs(u10.current) do
                v.Parent = Alive.Service
            end
            u10.current = {}
        end
        return function() -- Line: 223 -- upvalues: u33 (ref)
            if u33 then
                u33:Disconnect()
            end
        end
    end, {u15.event})
    local createElement = react.createElement
    local Fragment = react.Fragment
    local v4 = {}
    local createElement_2 = react.createElement
    local v5 = {}
    local v6 = u15
    if v6 then
        v6 = if u15.event ~= 1 then u15.event == 2 else true
    end
    v5.Enabled = v6
    v5.Tween = TweenInfo.new(0.5)
    v6 = {}
    local createElement_3 = react.createElement
    local v7 = {Image = "rbxassetid://11963364026"}
    local v8 = v3(40)
    v7.Size = UDim2.fromOffset(v8, v3(40))
    v7.AnchorPoint = Vector2.new(1, 0)
    v8 = UDim2.fromScale(1, 0)
    local v9 = -v3(10)
    v7.Position = v8 + UDim2.fromOffset(v9, v3(10))
    if u15.event == 1 then
        v2 = Color3.fromRGB(126, 22, 22)
    elseif u15.event ~= 2 then
        v2 = Color3.fromRGB(255, 163, 70)
    else
        v2 = Color3.fromRGB(22, 22, 126)
        if not v2 then
            v2 = Color3.fromRGB(255, 163, 70)
        end
    end
    v7.ImageColor3 = v2
    v6.Image = createElement_3(Image, v7)
    v4.Event = createElement_2(TransparencyGroup, v5, v6)
    v4.Combat = react.createElement(TransparencyGroup, {Enabled = v1, Tween = TweenInfo.new(0.5)}, {Container = react.createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 1),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.013, 0.995),
        Size = UDim2.fromScale(0.0193, 0.0317),
    }, {Image = react.createElement("ImageLabel", {
        Image = "rbxassetid://12967641870",
        ImageTransparency = 0.41,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ImageColor3 = Color3.fromRGB(80, 14, 14),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
    }), Ratio = react.createElement("UIAspectRatioConstraint")})})
    return createElement(Fragment, {}, v4)
end