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
--            File: ReplicatedStorage.Client.Interfaces.Routes.Screen.Toasts
--                               Dumped in 0.00196 seconds
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
local Promise = require(Common:WaitForChild("Promise"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_2:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Utilities = Common_2:WaitForChild("Utilities")
local Ripple = require(Utilities:WaitForChild("Ripple"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Network = Common_3:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Notify = require(Namespaces:WaitForChild("Notify"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_5:WaitForChild("Common")
local Signals = require(Common_4:WaitForChild("Signals"))
local Hooks = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useAsyncEffect = require(Hooks:WaitForChild("useAsyncEffect"))
local Hooks_2 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useMotion = require(Hooks_2:WaitForChild("useMotion"))
local Hooks_3 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useToast = require(Hooks_3:WaitForChild("useToast"))
local Hooks_4 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useToastState = require(Hooks_4:WaitForChild("useToastState"))
local u151 = {
    info = {Icon = "rbxassetid://11422155687", ImageColor3 = Color3.fromRGB(0, 102, 255), BackgroundColor3 = Color3.fromRGB(20, 25, 44)},
    success = {Icon = "rbxassetid://11419719540", ImageColor3 = Color3.fromRGB(26, 255, 0), BackgroundColor3 = Color3.fromRGB(27, 44, 21)},
    error = {Icon = "rbxassetid://11963364026", ImageColor3 = Color3.fromRGB(255, 0, 0), BackgroundColor3 = Color3.fromRGB(42, 16, 16)},
}
local u187 = react.memo(function(p1) -- Line: 61 -- upvalues: useMotion (val), u151 (val), useAsyncEffect (val), Promise (val), Ripple (val), react (val)
    local u4, u8, v1, v2
    v1, u4 = useMotion(p1.index)
    v2, u8 = useMotion(1)
    local v3 = u151[p1.type]
    useAsyncEffect(function() -- Line: 67 -- upvalues: Promise (upval), p1 (val), u8 (val), Ripple (upval)
        local v1
        local v2 = {}
        if p1.size ~= 1 then
            v1 = 0.15
        else
            v1 = 0
        end
        local v3 = Promise.delay(v1):andThen(function() -- Line: 69 -- upvalues: u8 (upval), Ripple (upval)
            u8:spring(0, Ripple.config.spring.stiff)
        end)
        v2[1] = v3
        v2[2] = Promise.delay(3):andThen(function() -- Line: 73 -- upvalues: u8 (upval), Ripple (upval)
            u8:spring(1, Ripple.config.spring.stiff)
        end)
        return Promise.all(v2)
    end, {})
    react.useEffect(function() -- Line: 79 -- upvalues: u4 (val), p1 (val)
        u4:spring(p1.index)
    end, {p1.index})
    return react.createElement("CanvasGroup", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = v1:map(function(p1) -- Line: 89
            return UDim2.fromScale(0.5, p1 * 0.09380000000000001 + -0.0111)
        end),
        Size = UDim2.fromScale(0.424, 0.0738),
        GroupTransparency = v2,
    }, {
        Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 4)}),
        Icon = react.createElement("ImageLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Image = v3.Icon,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.fromScale(0.0526, 0.5),
            Size = UDim2.fromScale(0.0559, 0.488),
        }, {Ratio = react.createElement("UIAspectRatioConstraint")}),
        Container = react.createElement("ImageLabel", {
            Image = "rbxassetid://16255699706",
            ImageTransparency = 0.92,
            BackgroundTransparency = 0.1,
            BorderSizePixel = 0,
            ZIndex = -1,
            ImageColor3 = v3.ImageColor3,
            ScaleType = Enum.ScaleType.Crop,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = v3.BackgroundColor3,
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(1, 1),
        }, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 4)})}),
        Shadow = react.createElement("ImageLabel", {
            Image = "rbxassetid://16264499577",
            ImageTransparency = 0.8,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ZIndex = 0,
            ScaleType = Enum.ScaleType.Slice,
            SliceCenter = Rect.new(379, 379, 379, 379),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.new(1, 50, 1, 50),
        }),
        Label = react.createElement("TextLabel", {
            RichText = true,
            TextScaled = true,
            TextSize = 14,
            TextWrapped = true,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json"),
            Text = p1.message,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextXAlignment = Enum.TextXAlignment.Left,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(95, 101, 121),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.fromScale(0.534, 0.5),
            Size = UDim2.fromScale(0.878, 0.346),
        }),
    })
end)
return function() -- Line: 168 -- upvalues: useToastState (val), useToast (val), react (val), Notify (val), Signals (val), u187 (val)
    local id, v1
    local v2 = useToastState()
    local u3 = useToast()
    react.useEffect(function() -- Line: 175 -- upvalues: Notify (upval), u3 (val), Signals (upval)
        Notify.Notify.listen(function(p1) -- Line: 176 -- upvalues: u3 (upval)
            u3(p1)
        end)
        Signals.Toast:Connect(function(p1) -- Line: 180 -- upvalues: u3 (upval)
            u3(p1)
        end)
    end, {})
    local v3 = {}
    local v4 = 0
    local v5 = #v2
    for i, v in ipairs(v2) do
        v1 = tick() - (v.created or 0)
        if 5 >= v1 then
            v4 = v4 + 1
            v1 = {
                id = v.id,
                message = v.message,
                type = v.type,
                created = v.created,
                index = v5 - v4,
                size = v5,
            }
            id = v.id
            if not id then
                id = tostring(i) .. v.message .. v.type
            end
            v3[id] = react.createElement(u187, v1)
        else
            v5 = v5 - 1
        end
    end
    return react.createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 300,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
    }, {Holder = react.createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.064),
        Size = UDim2.fromScale(0.9, 0.8),
    }, {Ratio = react.createElement("UIAspectRatioConstraint", {AspectRatio = 1.98})}, v3)})
end