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
--         File: ReplicatedStorage.Assets.Objects.Building Tools.UI.ExportDialog
--                              Dumped in 0.000566 seconds
--                          Bytecode version 9  |  4 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Vendor = script:FindFirstAncestorWhichIsA("Tool"):WaitForChild("Vendor")
local Roact = require(Vendor:WaitForChild("Roact"))
local createElement = Roact.createElement
return function(p1) -- Line: 15 -- upvalues: createElement (val), Roact (val)
    local v1 = {}
    local v2 = {
        BackgroundTransparency = 0.6,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(31, 31, 31),
        Position = UDim2.new(0.5, 0, 0.5, 0),
        Size = UDim2.new(0, 200, 0, 0),
    }
    local v3 = {Corners = createElement("UICorner", {CornerRadius = UDim.new(0, 4)})}
    local v4 = {
        AnchorPoint = Vector2.new(0, 1),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BackgroundTransparency = 0.5,
        Modal = true,
        Position = UDim2.new(0, 0, 1, 0),
        Size = UDim2.new(1, 0, 0, 23),
        Text = "Close",
        Font = Enum.Font.GothamSemibold,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 11,
    }
    v4[Roact.Event.Activated] = function(a1) -- Line: 39 -- upvalues: p1 (val)
        p1.OnDismiss()
    end
    v3.CloseButton = createElement("TextButton", v4, {Corners = createElement("UICorner", {CornerRadius = UDim.new(0, 4)})})
    v4 = {
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 1, -23),
        Font = Enum.Font.GothamSemibold,
        RichText = true,
        Text = p1.Text,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 11,
        TextWrapped = true,
    }
    v4[Roact.Change.TextBounds] = function(p1) -- Line: 56
        p1.Parent.Size = UDim2.new(0, 200, 0, p1.TextBounds.Y + 23 + 26)
    end
    v3.Text = createElement("TextLabel", v4, {Padding = createElement("UIPadding", {PaddingLeft = UDim.new(0, 10), PaddingRight = UDim.new(0, 10)})})
    v1.Dialog = createElement("Frame", v2, v3)
    return createElement("ScreenGui", {}, v1)
end