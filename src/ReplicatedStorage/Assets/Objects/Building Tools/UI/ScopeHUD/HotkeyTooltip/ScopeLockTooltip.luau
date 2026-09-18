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
--File: ReplicatedStorage.Assets.Objects.Building Tools.UI.ScopeHUD.HotkeyTooltip.ScopeLockTooltip
--                              Dumped in 0.000372 seconds
--                          Bytecode version 9  |  2 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Vendor = script.Parent.Parent.Parent.Parent:WaitForChild("Vendor")
local TextService = game:GetService("TextService")
local createElement = require(Vendor:WaitForChild("Roact")).createElement
local X = TextService:GetTextSize("F", 12, Enum.Font.SourceSans, Vector2.new(math.huge, math.huge)).X
return function(p1) -- Line: 22 -- upvalues: createElement (val), X (val)
    return createElement("ImageLabel", {
        BackgroundTransparency = 1,
        ImageTransparency = 0.86,
        Image = "rbxassetid://4445959523",
        ScaleType = Enum.ScaleType.Slice,
        SliceCenter = Rect.new(4, 4, 12, 12),
        ImageColor3 = Color3.fromRGB(0, 0, 0),
        Size = UDim2.new(0, X + 15, 0, 15),
        LayoutOrder = p1.LayoutOrder or 3,
    }, {IconWrapper = createElement("Frame", {
        BackgroundTransparency = 1,
        LayoutOrder = 0,
        Size = UDim2.new(0, 9, 0, 9),
        Position = UDim2.new(0, 2, 0.5, 0),
        AnchorPoint = Vector2.new(0, 0.5),
    }, {Icon = createElement("ImageLabel", {
        BackgroundTransparency = 1,
        ImageTransparency = 0.5,
        Image = "rbxassetid://2244452978",
        Size = UDim2.new(1, 0, 1, 0),
        ImageRectOffset = Vector2.new(28, 0) * 2,
        ImageRectSize = Vector2.new(14, 14) * 2,
    })}), Label = createElement("TextLabel", {
        BackgroundTransparency = 1,
        TextSize = 12,
        Text = "F",
        TextTransparency = 0.5,
        LayoutOrder = 1,
        Size = UDim2.new(0, X, 1, 0),
        Position = UDim2.new(0, 12, 0.5, 0),
        AnchorPoint = Vector2.new(0, 0.5),
        Font = Enum.Font.SourceSans,
        TextYAlignment = Enum.TextYAlignment.Center,
        TextColor3 = Color3.fromRGB(255, 255, 255),
    })})
end