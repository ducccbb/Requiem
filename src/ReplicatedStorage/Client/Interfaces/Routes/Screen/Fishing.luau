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
--            File: ReplicatedStorage.Client.Interfaces.Routes.Screen.Fishing
--                               Dumped in 0.00174 seconds
--                          Bytecode version 9  |  16 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
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
local Miscellaneous = User:WaitForChild("Miscellaneous")
local ClientFishingMinigameHandler = require(Miscellaneous:WaitForChild("ClientFishingMinigameHandler"))
local Hooks = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useRem = require(Hooks:WaitForChild("useRem"))
local Hooks_2 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useTheme = require(Hooks_2:WaitForChild("useTheme"))
local u109 = Color3.fromRGB(157, 193, 131)
local u114 = Color3.fromRGB(235, 190, 70)
local function getMultiplier(p1) -- Line: 85 -- upvalues: ClientAttributesHandler (val)
    local v1 = ClientAttributesHandler.getAttribute(p1)
    if typeof(v1) == "number" then
        return v1
    end
    return 1
end
return function() -- Line: 92 -- upvalues: useRem (val), useTheme (val), react (val), ClientFishingMinigameHandler (val), getMultiplier (val), UserInputService (val), RunService (val), u114 (val), u109 (val)
    local u13, u18, u23, u28, u33, u7, u8, v1, v2, v3, v4, v5
    local v6 = useRem()
    local v7 = useTheme()
    u7, u8 = react.useState(false)
    v3, u13 = react.useBinding(0.5)
    v4, u18 = react.useBinding(0.5)
    v5, u23 = react.useBinding(0)
    v1, u28 = react.useBinding(0.5)
    v2, u33 = react.useBinding(0.16)
    react.useEffect(function() -- Line: 105 -- upvalues: ClientFishingMinigameHandler (upval), u8 (val)
        local u5 = ClientFishingMinigameHandler.onStart:Connect(function() -- Line: 106 -- upvalues: u8 (upval)
            u8(true)
        end)
        local u11 = ClientFishingMinigameHandler.onAbort:Connect(function() -- Line: 110 -- upvalues: u8 (upval)
            u8(false)
        end)
        return function() -- Line: 114 -- upvalues: u5 (val), u11 (val)
            u5:Disconnect()
            u11:Disconnect()
        end
    end, {})
    react.useEffect(function() -- Line: 121 -- upvalues: u7 (val), getMultiplier (upval), u13 (val), u18 (val), u23 (val), u28 (val), u33 (val), UserInputService (upval), RunService (upval), u8 (val), ClientFishingMinigameHandler (upval)
        local u7
        if not u7 then
            return
        end
        local u1 = 0.5
        local u2 = 0
        local u3 = 0.5
        local u4 = 0
        local u5 = 0.5
        local u6 = 0
        u7 = 0
        local u12 = 0.4 + math.random() * 0.19999999999999996
        local FishingControlMultiplier = getMultiplier("FishingControlMultiplier")
        local FishingCatchFillMultiplier = getMultiplier("FishingCatchFillMultiplier")
        local FishingCatchDrainMultiplier = getMultiplier("FishingCatchDrainMultiplier")
        local FishingFishSpeedMultiplier = getMultiplier("FishingFishSpeedMultiplier")
        local v1 = math.max(FishingFishSpeedMultiplier, 0.1)
        local v2 = math.clamp(FishingControlMultiplier * 0.16, 0.05, 0.6)
        local u37 = math.max(FishingCatchFillMultiplier, 0.05) * 0.22
        local u42 = math.max(FishingCatchDrainMultiplier, 0) * 0.28600000000000003
        local u43 = v1 * 12
        local u44 = v1 * 5
        local u45 = v1 * 0.7
        u13(u1)
        u18(u3)
        u23(0)
        u28(u12)
        u33(v2)
        local u61 = false
        local u62 = false
        local u68 = UserInputService.InputBegan:Connect(function(p1) -- Line: 160 -- upvalues: u61 (ref), u62 (ref)
            if p1.UserInputType == Enum.UserInputType.MouseButton1 then
                u61 = true
                return
            end
            if p1.UserInputType == Enum.UserInputType.MouseButton2 then
                u62 = true
            end
        end)
        local u74 = UserInputService.InputEnded:Connect(function(p1) -- Line: 168 -- upvalues: u61 (ref), u62 (ref)
            if p1.UserInputType == Enum.UserInputType.MouseButton1 then
                u61 = false
                return
            end
            if p1.UserInputType == Enum.UserInputType.MouseButton2 then
                u62 = false
            end
        end)
        local u75 = v2 / 2
        local u76 = nil
        u76 = RunService.RenderStepped:Connect(function(p1) -- Line: 180 -- upvalues: u7 (ref), u2 (ref), u61 (ref), u62 (ref), u1 (ref), u75 (val), u13 (upval), u6 (ref), u45 (val), u5 (ref), u3 (ref), u43 (val), u4 (ref), u44 (val), u18 (upval), u23 (upval), u12 (ref), u37 (val), u42 (val), u28 (upval), u76 (ref), u8 (upval), ClientFishingMinigameHandler (upval)
            local v1, v2
            local v3 = math.min(p1, 0.1)
            u7 = u7 + v3
            u2 = u2 - v3 * 2.1
            if u61 then
                v1 = 6.5
                if u2 < 0 then
                    v1 = v1 * 2
                end
                u2 = u2 + v1 * v3
            end
            if u62 then
                v1 = 8.5
                if 0 < u2 then
                    v1 = v1 * 2
                end
                u2 = u2 - v1 * v3
            end
            v1 = 2.4
            if not u61 and not u62 then
                v1 = v1 + 4
            end
            u2 = u2 - u2 * v1 * v3
            u2 = math.clamp(u2, -3, 3)
            u1 = u1 + u2 * v3
            if u1 <= u75 then
                u1 = u75
                if u2 < 0 then
                    u2 = 0
                end
            elseif 1 - u75 <= u1 then
                u1 = 1 - u75
                if 0 < u2 then
                    u2 = 0
                end
            end
            u13(u1)
            u6 = u6 - v3
            if u6 <= 0 then
                v2 = math.random() * 2 - 1
                u5 = math.clamp(u3 + v2 * u45, 0.04310344827586207, 0.9568965517241379)
                u6 = 0.15 + math.random() * 0.5499999999999999
            end
            v2 = (u5 - u3) * u43
            u4 = math.clamp(u4 + (v2 - u4 * 5) * v3, -u44, u44)
            u3 = math.clamp(u3 + u4 * v3, 0.04310344827586207, 0.9568965517241379)
            u18(u3)
            u23(math.sin(u7 * 5) * 7)
            local v4 = math.abs(u1 - u3)
            v2 = v4 <= u75 + 0.04310344827586207
            if not v2 then
                u12 = u12 - u42 * v3
            else
                u12 = u12 + u37 * v3
            end
            u12 = math.clamp(u12, 0, 1)
            u28(u12)
            if 1 <= u12 then
                u76:Disconnect()
                u8(false)
                ClientFishingMinigameHandler.finish(true)
                return
            end
            if u12 <= 0 then
                u76:Disconnect()
                u8(false)
                ClientFishingMinigameHandler.finish(false)
            end
        end)
        return function() -- Line: 263 -- upvalues: u68 (val), u74 (val), u76 (ref)
            u68:Disconnect()
            u74:Disconnect()
            u76:Disconnect()
        end
    end, {u7})
    local v8 = {BackgroundTransparency = 1, BorderSizePixel = 0, ZIndex = 20, AnchorPoint = Vector2.new(1, 0.5)}
    local v9 = -v6(48)
    v8.Position = UDim2.new(1, v9, 0.5, 0)
    local v10 = v6(36)
    v8.Size = UDim2.fromOffset(v10, v6(580))
    v8.Visible = u7
    local v11 = {}
    local v12 = {
        BorderSizePixel = 0,
        ClipsDescendants = true,
        ZIndex = 20,
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundColor3 = v7.PageBackground,
        BackgroundTransparency = v7.PageTransparency,
        Position = UDim2.fromScale(0, 0.5),
    }
    local v13 = v6(8)
    v12.Size = UDim2.fromOffset(v13, v6(580))
    v11.Gold = react.createElement("Frame", v12, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, v6(8))}), Stroke = react.createElement("UIStroke", {Thickness = 1, Color = v7.Stroke}), Fill = react.createElement("Frame", {
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 1),
        BackgroundColor3 = u114,
        Position = UDim2.fromScale(0.5, 1),
        Size = v1:map(function(p1) -- Line: 304
            return UDim2.new(1, 0, p1, 0)
        end),
    }, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, v6(8))})})})
    v12 = {
        BorderSizePixel = 0,
        ClipsDescendants = false,
        ZIndex = 21,
        AnchorPoint = Vector2.new(1, 0.5),
        BackgroundColor3 = v7.PageBackground,
        BackgroundTransparency = v7.PageTransparency,
        Position = UDim2.fromScale(1, 0.5),
    }
    v13 = v6(20)
    v12.Size = UDim2.fromOffset(v13, v6(580))
    local v14 = {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, v6(8))}), Stroke = react.createElement("UIStroke", {Thickness = 1, Color = v7.Stroke}), Player = react.createElement("Frame", {
        BackgroundTransparency = 0.1,
        BorderSizePixel = 0,
        ZIndex = 21,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = u109,
        Position = v3:map(function(p1) -- Line: 341
            return UDim2.fromScale(0.5, 1 - p1)
        end),
        Size = v2:map(function(p1) -- Line: 344
            return UDim2.new(1, 0, p1, 0)
        end),
    }, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, v6(6))}), Stroke = react.createElement("UIStroke", {Thickness = 1, Color = v7.Stroke})})}
    local v15 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Image = "rbxassetid://131627057171524",
        ZIndex = 22,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = v4:map(function(p1) -- Line: 365
            return UDim2.fromScale(0.5, 1 - p1)
        end),
        Rotation = v5,
    }
    local v16 = v6(50)
    v15.Size = UDim2.fromOffset(v16, v6(50))
    v14.Fish = react.createElement("ImageLabel", v15)
    v11.Track = react.createElement("Frame", v12, v14)
    return react.createElement("Frame", v8, v11)
end