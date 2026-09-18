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
-- File: ReplicatedStorage.Assets.Objects.Building Tools.UI.ScopeHUD.ModeToggle.Tooltip
--                               Dumped in 0.00117 seconds
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
local v2 = Vector2.new(math.huge, math.huge)
local TextSize = TextService:GetTextSize("Selection mode", 12, Enum.Font.SourceSans, v2)
local TextSize_2 = TextService:GetTextSize("SHIFT-T", 12, Enum.Font.SourceSans, v2)
local TextSize_3 = TextService:GetTextSize("Groups and parts", 12.5, Enum.Font.SourceSans, v2)
local TextSize_4 = TextService:GetTextSize("Parts only", 12.5, Enum.Font.SourceSans, v2)
return function(p1) -- Line: 23 -- upvalues: createElement (val), TextSize (val), TextSize_2 (val), TextSize_3 (val), TextSize_4 (val)
    local v1
    local v2 = {BackgroundTransparency = 1, Image = "rbxassetid://4445959523"}
    if not p1.IsToolModeEnabled then
        v1 = Vector2.new(0, 0)
    else
        v1 = Vector2.new(0, 1)
    end
    v2.AnchorPoint = v1
    if not p1.IsToolModeEnabled then
        v1 = UDim2.new(0, 0, 1, 6)
    else
        v1 = UDim2.new(0, 0, 0, -6)
    end
    v2.Position = v1
    v2.ScaleType = Enum.ScaleType.Slice
    v2.SliceCenter = Rect.new(4, 4, 12, 12)
    v2.ImageColor3 = Color3.fromRGB(67, 67, 67)
    local v3 = TextSize.X + 7.5
    v2.Size = UDim2.new(0, v3 + TextSize_2.X + 11, 0, 47)
    v2.Visible = p1.Visible
    v1 = {}
    local v4 = {BorderSizePixel = 0, Rotation = 45, BackgroundColor3 = Color3.fromRGB(67, 67, 67), AnchorPoint = Vector2.new(0.5, 0.5)}
    if not p1.IsToolModeEnabled then
        v3 = UDim2.new(0, 9, 0, 0)
    else
        v3 = UDim2.new(0, 9, 1, 0)
        if not v3 then
            v3 = UDim2.new(0, 9, 0, 0)
        end
    end
    v4.Position = v3
    v4.Size = UDim2.new(0, 5, 0, 5)
    v1.Arrow = createElement("Frame", v4)
    v1.Title = createElement("TextLabel", {
        BackgroundTransparency = 1,
        TextSize = 12,
        TextTransparency = 0.4,
        Text = "Selection mode",
        Font = Enum.Font.SourceSans,
        TextColor3 = Color3.new(1, 1, 1),
        Size = UDim2.new(0, TextSize.X, 0, TextSize.Y),
        Position = UDim2.new(0, 4, 0, 4.5),
    })
    v1.Hotkey = createElement("TextLabel", {
        BackgroundTransparency = 1,
        TextSize = 10,
        TextTransparency = 0,
        Text = "SHIFT-T",
        Font = Enum.Font.SourceSansSemibold,
        TextColor3 = Color3.new(1, 1, 1),
        Size = UDim2.new(0, TextSize_2.X, 0, TextSize_2.Y),
        Position = UDim2.new(0, 4 + TextSize.X + 7.5, 0, 4.5),
    })
    v1.ScopedIcon = createElement("ImageLabel", {
        BackgroundTransparency = 1,
        Image = "rbxassetid://4463020853",
        ImageTransparency = 0.6,
        Position = UDim2.fromOffset(4, 2.5 + TextSize.Y + 2),
        Size = UDim2.new(0, 14, 0, 14),
        ImageRectOffset = Vector2.new(0, 0),
        ImageRectSize = Vector2.new(14, 14),
    })
    v1.ScopedLabel = createElement("TextLabel", {
        BackgroundTransparency = 1,
        TextSize = 12.5,
        Text = "Groups and parts",
        Font = Enum.Font.SourceSans,
        TextColor3 = Color3.new(1, 1, 1),
        Size = UDim2.new(0, TextSize_3.X, 0, TextSize_3.Y),
        Position = UDim2.fromOffset(21, 2.5 + TextSize.Y + 2),
        TextXAlignment = Enum.TextXAlignment.Left,
    })
    v1.DirectIcon = createElement("ImageLabel", {
        BackgroundTransparency = 1,
        Image = "rbxassetid://4463020853",
        ImageTransparency = 0.6,
        Position = UDim2.fromOffset(4, 2.5 + TextSize.Y + 2 + TextSize_3.Y + 1),
        Size = UDim2.new(0, 14, 0, 14),
        ImageRectOffset = Vector2.new(14, 0),
        ImageRectSize = Vector2.new(14, 14),
    })
    v1.DirectLabel = createElement("TextLabel", {
        BackgroundTransparency = 1,
        TextSize = 12.5,
        Text = "Parts only",
        Font = Enum.Font.SourceSans,
        TextColor3 = Color3.new(1, 1, 1),
        Size = UDim2.new(0, TextSize_4.X, 0, TextSize_4.Y),
        Position = UDim2.fromOffset(21, 2.5 + TextSize.Y + 2 + TextSize_3.Y + 1),
        TextXAlignment = Enum.TextXAlignment.Left,
    })
    return createElement("ImageLabel", v2, v1)
end