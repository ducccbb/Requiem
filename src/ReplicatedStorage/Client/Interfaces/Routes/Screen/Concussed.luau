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
--           File: ReplicatedStorage.Client.Interfaces.Routes.Screen.Concussed
--                               Dumped in 0.00101 seconds
--                          Bytecode version 9  |  7 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Lighting = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_2:WaitForChild("Client")
local User = Client:WaitForChild("User")
local State = User:WaitForChild("State")
local ClientStatusHandler = require(State:WaitForChild("ClientStatusHandler"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_3:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Sounds = require(Utilities:WaitForChild("Sounds"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_4:WaitForChild("Common")
local Sounds_2 = Common_2:WaitForChild("Sounds")
local Universal = require(Sounds_2:WaitForChild("Universal"))
local Components = script.Parent.Parent.Parent:WaitForChild("Components")
local Utilities_2 = Components:WaitForChild("Utilities")
local TransparencyGroup = require(Utilities_2:WaitForChild("TransparencyGroup"))
return function() -- Line: 30 -- upvalues: react (val), ClientStatusHandler (val), Sounds (val), Universal (val), Lighting (val), TweenService (val), TransparencyGroup (val)
    local u3, u4
    u3, u4 = react.useState(false)
    local u10 = react.useRef(Instance.new("BlurEffect"))
    local u16 = react.useRef(Instance.new("ColorCorrectionEffect"))
    react.useEffect(function() -- Line: 36 -- upvalues: ClientStatusHandler (upval), u4 (val), Sounds (upval), Universal (upval)
        local u7 = ClientStatusHandler.getStatusAddedSignal("Concussed"):Connect(function(p1) -- Line: 37 -- upvalues: u4 (upval), Sounds (upval), Universal (upval)
            local v1
            u4(true)
            local v2 = NumberRange.new(0.7, 1)
            if not p1 then
                v1 = 10
            else
                v1 = math.clamp(p1 - 1, 1, 10)
                if not v1 then
                    v1 = 10
                end
            end
            if v1 then
                Sounds.playGlobalSoundEffect(Universal.Tinnitus, 0.3, 0.3, v1, v2, 3)
            end
        end)
        local u15 = ClientStatusHandler.getStatusRemovedSignal("Concussed"):Connect(function() -- Line: 49 -- upvalues: u4 (upval)
            u4(false)
        end)
        return function() -- Line: 53 -- upvalues: u7 (val), u15 (val)
            u7:Disconnect()
            u15:Disconnect()
        end
    end, {})
    local v1 = {u3, u10}
    react.useEffect(function() -- Line: 59 -- upvalues: u10 (val), u16 (val), Lighting (upval), TweenService (upval), u3 (val)
        local v1, v2
        local current = u10.current
        local current_2 = u16.current
        if not current or not current_2 then
            return
        end
        if current.Parent == nil then
            current.Size = 0
            current.Parent = Lighting
        end
        if current_2.Parent == nil then
            current_2.Parent = Lighting
        end
        if not u3 then
            v1 = 2
        else
            v1 = 0.5
        end
        local v3 = TweenInfo.new(v1)
        v1 = {}
        if not u3 then
            v2 = 0
        else
            v2 = 50
        end
        v1.Size = v2
        TweenService:Create(current, v3, v1):Play()
        if not u3 then
            v1 = 2
        else
            v1 = 0.5
        end
        v3 = TweenInfo.new(v1)
        v1 = {}
        if not u3 then
            v2 = 0
        else
            v2 = -1
        end
        v1.Saturation = v2
        if not u3 then
            v2 = 0
        else
            v2 = -0.2
        end
        v1.Brightness = v2
        TweenService:Create(current_2, v3, v1):Play()
    end, v1)
    return react.createElement(TransparencyGroup, {Enabled = u3, Tween = TweenInfo.new(2)}, {Vignette = react.createElement("ImageLabel", {
        Image = "rbxassetid://135589412519765",
        ImageTransparency = 0.2,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ImageColor3 = Color3.fromRGB(12, 17, 18),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(12, 17, 18),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1.2, 1),
    })})
end