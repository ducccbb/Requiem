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
--            File: ReplicatedStorage.Client.Interfaces.Routes.Screen.Shifter
--                               Dumped in 0.00241 seconds
--                          Bytecode version 9  |  11 functions

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
local useInterfaceState = require(Hooks:WaitForChild("useInterfaceState"))
local Hooks_2 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useMotion = require(Hooks_2:WaitForChild("useMotion"))
local function getRatio(p1, p2) -- Line: 19
    if p2 <= 0 then
        return 0
    end
    return (math.clamp(p1 / p2, 0, 1))
end
return function() -- Line: 29 -- upvalues: useInterfaceState (val), useMotion (val), getRatio (val), react (val)
    local shifter_2, u23, u34, u45, u56, u65, u76, u87, v1, v2, v3, v4, v5, v6
    _, shifter_2 = useInterfaceState("shifter")
    local v7 = shifter_2
    if not v7 then
        v7 = {
            visible = false,
            health = {
                nape = 0,
                maxNape = 0,
                eyes = 0,
                maxEyes = 0,
                arms = {left = 0, right = 0, max = 0},
                legs = {left = 0, right = 0, max = 0},
                stamina = {max = 0, current = 0},
                sprinting = {max = 0, current = 0},
            },
        }
    end
    local u12 = v7
    v7, u23 = useMotion(getRatio(u12.health.arms.right, u12.health.arms.max))
    v4, u34 = useMotion(getRatio(u12.health.arms.left, u12.health.arms.max))
    v5, u45 = useMotion(getRatio(u12.health.legs.right, u12.health.legs.max))
    v6, u56 = useMotion(getRatio(u12.health.legs.left, u12.health.legs.max))
    v1, u65 = useMotion(getRatio(u12.health.nape, u12.health.maxNape))
    v2, u76 = useMotion(getRatio(u12.health.stamina.current, u12.health.stamina.max))
    v3, u87 = useMotion(getRatio(u12.health.sprinting.current, u12.health.sprinting.max))
    react.useEffect(function() -- Line: 59 -- upvalues: u23 (val), getRatio (upval), u12 (ref), u34 (val), u45 (val), u56 (val), u65 (val), u76 (val), u87 (val)
        u23:immediate(getRatio(u12.health.arms.right, u12.health.arms.max))
        u34:immediate(getRatio(u12.health.arms.left, u12.health.arms.max))
        u45:immediate(getRatio(u12.health.legs.right, u12.health.legs.max))
        u56:immediate(getRatio(u12.health.legs.left, u12.health.legs.max))
        u65:immediate(getRatio(u12.health.nape, u12.health.maxNape))
        u76:immediate(getRatio(u12.health.stamina.current, u12.health.stamina.max))
        u87:immediate(getRatio(u12.health.sprinting.current, u12.health.sprinting.max))
    end, {
        u12.health.arms.right,
        u12.health.arms.left,
        u12.health.arms.max,
        u12.health.legs.right,
        u12.health.legs.left,
        u12.health.legs.max,
        u12.health.nape,
        u12.health.maxNape,
        u12.health.stamina.current,
        u12.health.stamina.max,
        u12.health.sprinting.current,
        u12.health.sprinting.max,
    })
    local v8 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(1, 1),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.new(1, -10, 1, -10),
        Size = UDim2.fromOffset(294, 842),
        Visible = u12.visible,
    }
    local v9 = {UIListLayout = react.createElement("UIListLayout", {Padding = UDim.new(0, 15), SortOrder = Enum.SortOrder.LayoutOrder, VerticalAlignment = Enum.VerticalAlignment.Bottom})}
    local v10 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        LayoutOrder = 2,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0, 0.846),
        Size = UDim2.fromOffset(294, 65),
    }
    local v11 = {}
    local v12 = {
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0, 1),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0, 1),
        Size = UDim2.fromScale(1, 1),
    }
    local v13 = {}
    local v14 = {}
    local v15 = {}
    local v16 = NumberSequenceKeypoint.new(0, 1)
    v15[1] = v16
    v15[2] = NumberSequenceKeypoint.new(1, 0.107)
    v14.Transparency = NumberSequence.new(v15)
    v13.UIGradient = react.createElement("UIGradient", v14)
    v13.Label = react.createElement("TextLabel", {
        Text = "Arm Health",
        TextScaled = true,
        TextSize = 14,
        TextWrapped = true,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        FontFace = Font.new("rbxasset://fonts/families/AccanthisADFStd.json"),
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextXAlignment = Enum.TextXAlignment.Right,
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.new(-0.0202, 6, 0.238, 0),
        Size = UDim2.fromScale(0.956, 0.291),
    })
    v13.Sidebar = react.createElement("Frame", {
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(1, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(1, 0.5),
        Size = UDim2.new(0, 3, 1, 0),
    })
    v13.RightArm = react.createElement("Frame", {
        BackgroundTransparency = 0.35,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(1, 0.5),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.956, 0.57),
        Size = UDim2.new(0.781, 3, 0.172, 0),
    }, {UIStroke = react.createElement("UIStroke", {Color = Color3.fromRGB(163, 163, 163)}), Fill = react.createElement("Frame", {
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(1, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(1, 0.5),
        Size = v7:map(function(p1) -- Line: 167
            return UDim2.fromScale(p1, 1)
        end),
    }), UIPadding = react.createElement("UIPadding", {PaddingBottom = UDim.new(0, 2), PaddingLeft = UDim.new(0, 2), PaddingRight = UDim.new(0, 2), PaddingTop = UDim.new(0, 2)})})
    v13.LeftArm = react.createElement("Frame", {
        BackgroundTransparency = 0.35,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(1, 0.5),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.956, 0.792),
        Size = UDim2.new(0.781, 3, 0.172, 0),
    }, {UIStroke1 = react.createElement("UIStroke", {Color = Color3.fromRGB(163, 163, 163)}), Fill = react.createElement("Frame", {
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(1, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(1, 0.5),
        Size = v4:map(function(p1) -- Line: 199
            return UDim2.fromScale(p1, 1)
        end),
    }), UIPadding1 = react.createElement("UIPadding", {PaddingBottom = UDim.new(0, 2), PaddingLeft = UDim.new(0, 2), PaddingRight = UDim.new(0, 2), PaddingTop = UDim.new(0, 2)})})
    v11.Content = react.createElement("Frame", v12, v13)
    v9.Arm = react.createElement("Frame", v10, v11)
    v10 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        LayoutOrder = 3,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0, 0.941),
        Size = UDim2.fromOffset(294, 104),
    }
    v11 = {}
    v12 = {
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0, 1),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(-0.337, 1),
        Size = UDim2.fromScale(1.35, 1),
    }
    v13 = {}
    v14 = {}
    v15 = {}
    v16 = NumberSequenceKeypoint.new(0, 1)
    v15[1] = v16
    v15[2] = NumberSequenceKeypoint.new(1, 0.107)
    v14.Transparency = NumberSequence.new(v15)
    v13.UIGradient1 = react.createElement("UIGradient", v14)
    v13.Label1 = react.createElement("TextLabel", {
        Text = "Nape Health",
        TextScaled = true,
        TextSize = 14,
        TextWrapped = true,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        FontFace = Font.new("rbxasset://fonts/families/AccanthisADFStd.json"),
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextXAlignment = Enum.TextXAlignment.Right,
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.new(-0.0202, 6, 0.2, 0),
        Size = UDim2.fromScale(0.967, 0.18),
    })
    v13.Sidebar1 = react.createElement("Frame", {
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(1, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(1, 0.5),
        Size = UDim2.new(0, 3, 1, 0),
    })
    v13.Nape = react.createElement("Frame", {
        BackgroundTransparency = 0.35,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(1, 0.5),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.955, 0.45),
        Size = UDim2.new(0.78, 3, 0.117, 0),
    }, {UIStroke2 = react.createElement("UIStroke", {Color = Color3.fromRGB(163, 163, 163)}), Fill = react.createElement("Frame", {
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(1, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 82, 82),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(1, 0.5),
        Size = v1:map(function(p1) -- Line: 283
            return UDim2.fromScale(p1, 1)
        end),
    }), UIPadding2 = react.createElement("UIPadding", {PaddingBottom = UDim.new(0, 2), PaddingLeft = UDim.new(0, 2), PaddingRight = UDim.new(0, 2), PaddingTop = UDim.new(0, 2)})})
    v13.Stamina = react.createElement("Frame", {
        BackgroundTransparency = 0.35,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(1, 0.5),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.955, 0.65),
        Size = UDim2.new(0.78, 3, 0.117, 0),
    }, {UIStroke2 = react.createElement("UIStroke", {Color = Color3.fromRGB(163, 163, 163)}), Fill = react.createElement("Frame", {
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(1, 0.5),
        BackgroundColor3 = Color3.fromRGB(135, 235, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(1, 0.5),
        Size = v2:map(function(p1) -- Line: 315
            return UDim2.fromScale(p1, 1)
        end),
    }), UIPadding2 = react.createElement("UIPadding", {PaddingBottom = UDim.new(0, 2), PaddingLeft = UDim.new(0, 2), PaddingRight = UDim.new(0, 2), PaddingTop = UDim.new(0, 2)})})
    v13.Sprinting = react.createElement("Frame", {
        BackgroundTransparency = 0.35,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(1, 0.5),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.955, 0.86),
        Size = UDim2.new(0.78, 3, 0.117, 0),
    }, {UIStroke2 = react.createElement("UIStroke", {Color = Color3.fromRGB(163, 163, 163)}), Fill = react.createElement("Frame", {
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(1, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 165, 55),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(1, 0.5),
        Size = v3:map(function(p1) -- Line: 347
            return UDim2.fromScale(p1, 1)
        end),
    }), UIPadding2 = react.createElement("UIPadding", {PaddingBottom = UDim.new(0, 2), PaddingLeft = UDim.new(0, 2), PaddingRight = UDim.new(0, 2), PaddingTop = UDim.new(0, 2)})})
    v11.Content1 = react.createElement("Frame", v12, v13)
    v9.Health = react.createElement("Frame", v10, v11)
    v10 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        LayoutOrder = 1,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0, 0.846),
        Size = UDim2.fromOffset(294, 65),
    }
    v11 = {}
    v12 = {
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0, 1),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0, 1),
        Size = UDim2.fromScale(1, 1),
    }
    v13 = {}
    v14 = {}
    v15 = {}
    v16 = NumberSequenceKeypoint.new(0, 1)
    v15[1] = v16
    v15[2] = NumberSequenceKeypoint.new(1, 0.107)
    v14.Transparency = NumberSequence.new(v15)
    v13.UIGradient2 = react.createElement("UIGradient", v14)
    v13.Label2 = react.createElement("TextLabel", {
        Text = "Leg Health",
        TextScaled = true,
        TextSize = 14,
        TextWrapped = true,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        FontFace = Font.new("rbxasset://fonts/families/AccanthisADFStd.json"),
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextXAlignment = Enum.TextXAlignment.Right,
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.new(-0.0202, 6, 0.238, 0),
        Size = UDim2.fromScale(0.956, 0.291),
    })
    v13.Sidebar2 = react.createElement("Frame", {
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(1, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(1, 0.5),
        Size = UDim2.new(0, 3, 1, 0),
    })
    v13.RightLeg = react.createElement("Frame", {
        BackgroundTransparency = 0.35,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(1, 0.5),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.956, 0.57),
        Size = UDim2.new(0.781, 3, 0.172, 0),
    }, {UIStroke3 = react.createElement("UIStroke", {Color = Color3.fromRGB(163, 163, 163)}), Fill = react.createElement("Frame", {
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(1, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(1, 0.5),
        Size = v5:map(function(p1) -- Line: 431
            return UDim2.fromScale(p1, 1)
        end),
    }), UIPadding3 = react.createElement("UIPadding", {PaddingBottom = UDim.new(0, 2), PaddingLeft = UDim.new(0, 2), PaddingRight = UDim.new(0, 2), PaddingTop = UDim.new(0, 2)})})
    v13.LeftLeg = react.createElement("Frame", {
        BackgroundTransparency = 0.35,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(1, 0.5),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.956, 0.792),
        Size = UDim2.new(0.781, 3, 0.172, 0),
    }, {UIStroke4 = react.createElement("UIStroke", {Color = Color3.fromRGB(163, 163, 163)}), Fill = react.createElement("Frame", {
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(1, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(1, 0.5),
        Size = v6:map(function(p1) -- Line: 463
            return UDim2.fromScale(p1, 1)
        end),
    }), UIPadding4 = react.createElement("UIPadding", {PaddingBottom = UDim.new(0, 2), PaddingLeft = UDim.new(0, 2), PaddingRight = UDim.new(0, 2), PaddingTop = UDim.new(0, 2)})})
    v11.Content2 = react.createElement("Frame", v12, v13)
    v9.Legs = react.createElement("Frame", v10, v11)
    return react.createElement("Frame", v8, v9)
end