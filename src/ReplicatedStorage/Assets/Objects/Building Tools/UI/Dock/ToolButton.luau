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
--       File: ReplicatedStorage.Assets.Objects.Building Tools.UI.Dock.ToolButton
--                              Dumped in 0.000586 seconds
--                          Bytecode version 9  |  6 functions

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
function v3.init(p1) -- Line: 19
    p1:UpdateHotkeyTextSize(p1.props.HotkeyLabel)
end
function v3.willUpdate(p1, p2) -- Line: 23
    if p1.props.HotkeyLabel ~= p2.HotkeyLabel then
        p1:UpdateHotkeyTextSize(p2.HotkeyLabel)
    end
end
function v3:UpdateHotkeyTextSize(p2) -- Line: 29 -- upvalues: TextService (val)
    self.HotkeyTextSize = TextService:GetTextSize(p2, 9, Enum.Font.Gotham, Vector2.new(math.huge, math.huge))
end
function v3.render(p1) -- Line: 38 -- upvalues: createElement (val), Roact (val)
    local v1
    local v2 = {BackgroundColor3 = p1.props.Tool.Color.Color}
    if p1.props.CurrentTool ~= p1.props.Tool then
        v1 = 1
    else
        v1 = 0
    end
    v2.BackgroundTransparency = v1
    v2.BorderSizePixel = 0
    v2.Image = p1.props.IconAssetId
    v2.AutoButtonColor = false
    v2[Roact.Event.Activated] = function() -- Line: 45 -- upvalues: p1 (val)
        p1.props.Core.EquipTool(p1.props.Tool)
    end
    return createElement("ImageButton", v2, {Corners = createElement("UICorner", {CornerRadius = UDim.new(0, 3)}), Hotkey = createElement("TextLabel", {
        BackgroundTransparency = 1,
        TextSize = 9,
        Position = UDim2.new(0, 3, 0, 3),
        Size = UDim2.fromOffset(p1.HotkeyTextSize.X, p1.HotkeyTextSize.Y),
        Font = Enum.Font.Gotham,
        Text = p1.props.HotkeyLabel,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Top,
    })})
end
return v3