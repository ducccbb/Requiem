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
--File: ReplicatedStorage.Assets.Objects.Building Tools.UI.Notifications.NotificationDialog
--                              Dumped in 0.000681 seconds
--                          Bytecode version 9  |  6 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local Vendor = v1:FindFirstAncestorWhichIsA("Tool"):WaitForChild("Vendor")
local Roact = require(Vendor:WaitForChild("Roact"))
local createElement = Roact.createElement
local v3 = Roact.PureComponent:extend(v1.Name)
function v3.init(p1) -- Line: 18
    p1:setState({ShouldDisplayDetails = false})
end
function v3.render(p1) -- Line: 24 -- upvalues: createElement (val), Roact (val)
    local NoticeText, v1, v2
    local v3 = {
        BackgroundTransparency = 0.7,
        BorderSizePixel = 0,
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        Size = UDim2.new(1, 0, 0, 24),
        LayoutOrder = p1.props.LayoutOrder,
    }
    local v4 = {ColorBar = createElement("Frame", {BorderSizePixel = 0, BackgroundColor3 = p1.props.ThemeColor, Size = UDim2.new(1, 0, 0, 2)})}
    local v5 = {
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BackgroundTransparency = 0.8,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0, 1),
        Position = UDim2.new(0, 0, 1, 0),
    }
    if not p1.state.ShouldDisplayDetails then
        v2 = 0.5
    else
        v2 = 1
    end
    v5.Size = UDim2.new(v2, 0, 0, 22)
    v5.Text = "GOT IT"
    v5.Font = Enum.Font.Gotham
    v5.TextSize = 10
    v5.TextColor3 = Color3.fromRGB(255, 255, 255)
    v5[Roact.Event.Activated] = function(a1) -- Line: 48 -- upvalues: p1 (val)
        p1.props.OnDismiss()
    end
    v4.OKButton = createElement("TextButton", v5)
    if not p1.state.ShouldDisplayDetails then
        v5 = {
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
            BackgroundTransparency = 0.8,
            BorderSizePixel = 0,
            AnchorPoint = Vector2.new(0, 1),
            Position = UDim2.new(0.5, 0, 1, 0),
            Size = UDim2.new(0.5, 0, 0, 22),
            Text = "WHAT CAN I DO?",
            Font = Enum.Font.Gotham,
            TextSize = 10,
            TextColor3 = Color3.fromRGB(255, 255, 255),
        }
        v5[Roact.Event.Activated] = function(a1) -- Line: 63 -- upvalues: p1 (val)
            p1:setState({ShouldDisplayDetails = true})
        end
        v1 = createElement("TextButton", v5)
    else
        v1 = nil
    end
    v4.DetailsButton = v1
    if not p1.state.ShouldDisplayDetails then
        v1 = createElement("Frame", {
            BackgroundTransparency = 0.75,
            BorderSizePixel = 0,
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.new(0.5, 0, 1, 0),
            AnchorPoint = Vector2.new(0.5, 1),
            Size = UDim2.new(0, 1, 0, 22),
        })
    else
        v1 = nil
    end
    v4.ButtonDivider = v1
    v5 = {
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 0, 0, 2),
        Size = UDim2.new(1, 0, 1, -24),
        TextWrapped = true,
        RichText = true,
        Font = Enum.Font.GothamSemibold,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 11,
        TextStrokeTransparency = 0.9,
        LineHeight = 1,
    }
    if p1.state.ShouldDisplayDetails then
        NoticeText = p1.props.DetailText
    else
        NoticeText = p1.props.NoticeText
        if not NoticeText then
            NoticeText = p1.props.DetailText
        end
    end
    v5.Text = NoticeText
    v5[Roact.Change.TextBounds] = function(p1) -- Line: 91
        p1.Parent.Size = UDim2.new(1, 0, 0, p1.TextBounds.Y + 29 + 22 + 2)
    end
    v4.Text = createElement("TextLabel", v5)
    return createElement("Frame", v3, v4)
end
return v3