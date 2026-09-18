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
--         File: ReplicatedStorage.Assets.Objects.Building Tools.UI.Dock.Tooltip
--                              Dumped in 0.000485 seconds
--                          Bytecode version 9  |  5 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local Vendor = v1:FindFirstAncestorWhichIsA("Tool"):WaitForChild("Vendor")
local TextService = game:GetService("TextService")
local Roact = require(Vendor:WaitForChild("Roact"))
local createElement = Roact.createElement
local v3 = Roact.PureComponent:extend(v1.Name)
function v3.init(p1) -- Line: 19 -- upvalues: Roact (val)
    local v1, v2
    v1, v2 = Roact.createBinding(UDim2.new())
    p1.FrameSize = v1
    p1.SetFrameSize = v2
    p1:UpdateTextBounds(p1.props.Text)
end
function v3.willUpdate(p1, p2) -- Line: 24
    if p1.props.Text ~= p2.Text then
        p1:UpdateTextBounds(p2.Text)
    end
end
function v3:UpdateTextBounds(p2) -- Line: 30 -- upvalues: TextService (val)
    local v1 = p2:gsub("<br />", "\n")
    v1 = v1:gsub("<.->", "")
    self.TextBounds = TextService:GetTextSize(v1, 10, Enum.Font.Gotham, Vector2.new(math.huge, math.huge))
end
function v3.render(p1) -- Line: 39 -- upvalues: createElement (val)
    return createElement("Frame", {
        BackgroundTransparency = 0,
        BorderSizePixel = 0,
        ZIndex = 2,
        AnchorPoint = Vector2.new(0.5, 0),
        BackgroundColor3 = Color3.fromRGB(58, 58, 58),
        Position = UDim2.new(0.5, 0, 1, 2),
        Size = UDim2.fromOffset(p1.TextBounds.X + 20, p1.TextBounds.Y + 8),
        Visible = p1.props.IsVisible,
    }, {Corners = createElement("UICorner", {CornerRadius = UDim.new(0, 3)}), Arrow = createElement("Frame", {
        BackgroundTransparency = 0,
        BorderSizePixel = 0,
        ZIndex = 2,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(58, 58, 58),
        Position = UDim2.new(0.5, 0, 0, 0),
        Size = UDim2.new(0, 6, 0, 6),
    }), Text = createElement("TextLabel", {
        BackgroundTransparency = 1,
        ZIndex = 2,
        RichText = true,
        TextSize = 10,
        Size = UDim2.new(1, 0, 1, 0),
        Font = Enum.Font.Gotham,
        Text = p1.props.Text,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextXAlignment = Enum.TextXAlignment.Center,
        TextYAlignment = Enum.TextYAlignment.Center,
    })})
end
return v3