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
--          File: ReplicatedStorage.Client.Interfaces.Components.Screen.Request
--                               Dumped in 0.00205 seconds
--                          Bytecode version 9  |  7 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local Hooks = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useMotion = require(Hooks:WaitForChild("useMotion"))
local Hooks_2 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useRem = require(Hooks_2:WaitForChild("useRem"))
return function(p1) -- Line: 16 -- upvalues: useRem (val), react (val), useMotion (val)
    local u19, u26, v1, v2
    local v3 = useRem()
    local u4 = p1.duration or 3
    local u8 = react.useRef(false)
    local u12 = react.useRef(p1)
    u12.current = p1
    v1, u19 = useMotion(UDim2.fromScale(1, 0))
    v2, u26 = useMotion(UDim2.fromScale(2, 0.5))
    local u31 = react.useCallback(function() -- Line: 33 -- upvalues: u8 (val), u26 (val), u12 (val)
        local current
        if u8.current then
            return
        end
        u8.current = true
        u26:spring(UDim2.fromScale(2.5, 0.5))
        current = u12.current
        if current.onExpire then
            current.onExpire()
            return
        end
        if current.onDeny then
            current.onDeny()
        end
    end, {})
    local v4 = react.useCallback(function() -- Line: 49 -- upvalues: u8 (val), u26 (val), u12 (val)
        if u8.current then
            return
        end
        u8.current = true
        u26:spring(UDim2.fromScale(2.5, 0.5))
        u12.current.onAllow()
    end, {})
    local v5 = react.useCallback(function() -- Line: 59 -- upvalues: u8 (val), u26 (val), u12 (val)
        if u8.current then
            return
        end
        u8.current = true
        u26:spring(UDim2.fromScale(2.5, 0.5))
        u12.current.onDeny()
    end, {})
    react.useEffect(function() -- Line: 69 -- upvalues: u8 (val), u26 (val), u19 (val), u4 (val), u31 (val)
        u8.current = false
        u26:spring(UDim2.fromScale(1, 0.5))
        local v1 = UDim2.fromScale(0.997, 0.664)
        u19:spring(v1, {frequency = 0.3})
        local u22 = task.delay(u4, u31)
        return function() -- Line: 78 -- upvalues: u22 (val)
            task.cancel(u22)
        end
    end, {u4, u31})
    local v6 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Size = v1,
    }
    local v7 = {}
    local v8 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(1, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = v2,
    }
    local v9 = v3(315)
    v8.Size = UDim2.fromOffset(v9, v3(101))
    local v10 = {}
    local v11 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        LayoutOrder = 1,
        BackgroundColor3 = Color3.fromRGB(14, 14, 17),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0, 0.614),
        Size = UDim2.fromScale(1, 0.327),
    }
    local v12 = {}
    local v13 = {
        BackgroundTransparency = 0,
        BorderSizePixel = 0,
        LayoutOrder = 1,
        BackgroundColor3 = Color3.fromRGB(14, 14, 17),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0, 0),
    }
    local v14 = UDim2.fromScale(0.5, 1)
    v13.Size = v14 + UDim2.fromOffset(-1, 0)
    local v15 = {uICorner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 4)}), header = react.createElement("TextLabel", {
        Text = "Allow",
        TextScaled = true,
        TextSize = 14,
        TextWrapped = true,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 2,
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal),
        TextColor3 = Color3.fromRGB(255, 255, 255),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.487),
        Size = UDim2.fromScale(0.88, 0.48),
    })}
    local v16 = {
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Size = UDim2.fromScale(1, 1),
        Text = "",
    }
    v16[react.Event.MouseButton1Click] = v4
    v15.hitbox = react.createElement("TextButton", v16)
    v12.yes = react.createElement("Frame", v13, v15)
    v13 = {
        BackgroundTransparency = 0,
        BorderSizePixel = 0,
        LayoutOrder = 1,
        BackgroundColor3 = Color3.fromRGB(14, 14, 17),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0),
    }
    v14 = UDim2.fromScale(0.5, 1)
    v13.Size = v14 + UDim2.fromOffset(-1, 0)
    v15 = {uICorner1 = react.createElement("UICorner", {CornerRadius = UDim.new(0, 4)}), header1 = react.createElement("TextLabel", {
        Text = "Deny",
        TextScaled = true,
        TextSize = 14,
        TextWrapped = true,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 2,
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal),
        TextColor3 = Color3.fromRGB(255, 255, 255),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.487),
        Size = UDim2.fromScale(0.88, 0.48),
    })}
    v16 = {
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Size = UDim2.fromScale(1, 1),
        Text = "",
    }
    v16[react.Event.MouseButton1Click] = v5
    v15.hitbox = react.createElement("TextButton", v16)
    v12.no = react.createElement("Frame", v13, v15)
    v10.options = react.createElement("Frame", v11, v12)
    v10.label = react.createElement("Frame", {
        BackgroundTransparency = 0,
        BorderSizePixel = 0,
        BackgroundColor3 = Color3.fromRGB(14, 14, 17),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Size = UDim2.fromScale(1, 0.604),
    }, {uICorner2 = react.createElement("UICorner", {CornerRadius = UDim.new(0, 4)}), header2 = react.createElement("TextLabel", {
        TextScaled = true,
        TextSize = 14,
        TextWrapped = true,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 2,
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal),
        Text = p1.header,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextXAlignment = Enum.TextXAlignment.Left,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.481, 0.368),
        Size = UDim2.fromScale(0.88, 0.3),
    }), body = react.createElement("TextLabel", {
        TextScaled = true,
        TextSize = 14,
        TextTransparency = 0.35,
        TextWrapped = true,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 2,
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json"),
        Text = p1.description,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextXAlignment = Enum.TextXAlignment.Left,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.501, 0.664),
        Size = UDim2.fromScale(0.919, 0.244),
    })})
    v10.uIListLayout1 = react.createElement("UIListLayout", {Padding = UDim.new(0, 1), HorizontalAlignment = Enum.HorizontalAlignment.Right, SortOrder = Enum.SortOrder.LayoutOrder})
    v7.animation = react.createElement("Frame", v8, v10)
    return react.createElement("Frame", v6, v7)
end