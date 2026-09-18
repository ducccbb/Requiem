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
--             File: ReplicatedStorage.Client.Interfaces.Routes.Screen.Blood
--                               Dumped in 0.00108 seconds
--                          Bytecode version 9  |  9 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_2:WaitForChild("Client")
local User = Client:WaitForChild("User")
local State = User:WaitForChild("State")
local ClientStatusHandler = require(State:WaitForChild("ClientStatusHandler"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_3:WaitForChild("Client")
local User_2 = Client_2:WaitForChild("User")
local State_2 = User_2:WaitForChild("State")
local ClientSettingsHandler = require(State_2:WaitForChild("ClientSettingsHandler"))
local Hooks = script.Parent.Parent.Parent:WaitForChild("Hooks")
local useMotion = require(Hooks:WaitForChild("useMotion"))
return function() -- Line: 23 -- upvalues: useMotion (val), react (val), ClientSettingsHandler (val), ClientStatusHandler (val)
    local u11, u12, u3, u7, v1, v2
    v1, u3 = useMotion(1)
    v2, u7 = useMotion(1.05)
    u11, u12 = react.useState(false)
    react.useEffect(function() -- Line: 28 -- upvalues: ClientSettingsHandler (upval), u12 (val)
        local v1 = ClientSettingsHandler.getSettingFromName("Titan Blood")
        u12(v1)
        ClientSettingsHandler.onSettingChanged:Connect(function(p1, p2) -- Line: 32 -- upvalues: u12 (upval)
            if p1 ~= "Titan Blood" then
                return
            end
            local v1 = p2 == 1
            u12(v1)
        end)
    end, {})
    react.useEffect(function() -- Line: 41 -- upvalues: ClientStatusHandler (upval), u11 (val), u3 (val), u7 (val)
        local u7
        u7 = ClientStatusHandler.getStatusAddedSignal("Blood"):Connect(function() -- Line: 42 -- upvalues: u11 (upval), u3 (upval), u7 (upval)
            if not u11 then
                return
            end
            u3:spring(0.5, {frequency = 0.5})
            u7:immediate(1)
        end)
        local u15 = ClientStatusHandler.getStatusRemovedSignal("Blood"):Connect(function() -- Line: 54 -- upvalues: u3 (upval), u7 (upval)
            u3:spring(1, {frequency = 3})
            u7:spring(1.05, {frequency = 5})
        end)
        return function() -- Line: 64 -- upvalues: u7 (val), u15 (val)
            u7:Disconnect()
            u15:Disconnect()
        end
    end, {u11})
    return react.createElement("Frame", {
        BackgroundTransparency = 1,
        Visible = u11,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = v2:map(function(p1) -- Line: 75
            return UDim2.fromScale(p1, p1)
        end),
    }, {imageLabel = react.createElement("ImageLabel", {
        Image = "rbxassetid://88379460433398",
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(1, 1),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(0.5, 0.5),
        ImageTransparency = v1,
    }), imageLabel1 = react.createElement("ImageLabel", {
        Image = "rbxassetid://100991391423381",
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0, 1),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(0.5, 0.5),
        ImageTransparency = v1,
    }), imageLabel2 = react.createElement("ImageLabel", {
        Image = "rbxassetid://73584695433958",
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(1, 0),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(0.5, 0.5),
        ImageTransparency = v1,
    }), imageLabel3 = react.createElement("ImageLabel", {
        Image = "rbxassetid://125135125945688",
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(0.5, 0.5),
        ImageTransparency = v1,
    })})
end