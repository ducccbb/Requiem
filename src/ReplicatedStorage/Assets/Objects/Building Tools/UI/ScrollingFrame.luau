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
--        File: ReplicatedStorage.Assets.Objects.Building Tools.UI.ScrollingFrame
--                              Dumped in 0.000798 seconds
--                          Bytecode version 9  |  7 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Parent = script.Parent.Parent
local Libraries = Parent:WaitForChild("Libraries")
local Vendor = Parent:WaitForChild("Vendor")
local SupportLibrary = require(Libraries:WaitForChild("SupportLibrary"))
local Roact = require(Vendor:WaitForChild("Roact"))
local createElement = Roact.createElement
local v2 = Roact.PureComponent:extend("ScrollingFrame")
v2.defaultProps = {BackgroundTransparency = 1, BorderSizePixel = 0, Size = UDim2.new(1, 0, 1, 0), CanvasSize = UDim2.new(1, 0, 1, 0)}
function v2.render(p1) -- Line: 30 -- upvalues: SupportLibrary (val), createElement (val), Roact (val)
    local v1, v2
    local v3 = SupportLibrary.CloneTable(p1.props)
    if v3.AspectRatio then
        v1 = createElement("UIAspectRatioConstraint", {AspectRatio = v3.AspectRatio})
        v2 = v3[Roact.Children]
        if not v2 then
            v2 = {}
        end
        v3[Roact.Children] = SupportLibrary.Merge({AspectRatio = v1}, v2)
    end
    if v3.Layout == "List" then
        local v4 = {
            FillDirection = v3.LayoutDirection,
            Padding = v3.LayoutPadding,
            HorizontalAlignment = v3.HorizontalAlignment,
            VerticalAlignment = v3.VerticalAlignment,
            SortOrder = v3.SortOrder or "LayoutOrder",
        }
        v4[Roact.Ref] = function(a1) -- Line: 55 -- upvalues: p1 (val)
            p1:UpdateContentSize(a1)
        end
        v4[Roact.Change.AbsoluteContentSize] = function(a1) -- Line: 58 -- upvalues: p1 (val)
            p1:UpdateContentSize(a1)
        end
        v1 = createElement("UIListLayout", v4)
        v3.Size = p1:GetSize()
        v3.CanvasSize = p1:GetCanvasSize()
        v2 = v3[Roact.Children]
        if not v2 then
            v2 = {}
        end
        v3[Roact.Children] = SupportLibrary.Merge({Layout = v1}, v2)
    end
    v3.AspectRatio = nil
    v3.Layout = nil
    v3.LayoutDirection = nil
    v3.LayoutPadding = nil
    v3.HorizontalAlignment = nil
    v3.VerticalAlignment = nil
    v3.SortOrder = nil
    v3.Width = nil
    v3.Height = nil
    v3.CanvasWidth = nil
    v3.CanvasHeight = nil
    return createElement("ScrollingFrame", v3)
end
function v2:GetSize(p2) -- Line: 92
    local Height, Width
    local props = self.props
    local v1 = if props.Size ~= "WRAP_CONTENT" then props.Width == "WRAP_CONTENT" else true
    local v2 = if props.Size ~= "WRAP_CONTENT" then props.Height == "WRAP_CONTENT" else true
    local v3 = v1 or v2
    local new = UDim2.new
    if not p2 then
        if typeof(props.Width) ~= "UDim" then
            Width = props.Size.X
        else
            Width = props.Width
        end
    elseif v1 then
        Width = UDim.new(0, p2.X)
    end
    if not p2 then
        if typeof(props.Height) ~= "UDim" then
            Height = props.Size.Y
        else
            Height = props.Height
            if not Height then
                Height = props.Size.Y
            end
        end
    elseif v2 then
        Height = UDim.new(0, p2.Y)
    end
    return new(Width, Height)
end
function v2:GetCanvasSize(p2) -- Line: 111
    local CanvasHeight, CanvasWidth
    local props = self.props
    local v1 = if props.CanvasSize ~= "WRAP_CONTENT" then props.CanvasWidth == "WRAP_CONTENT" else true
    local v2 = if props.CanvasSize ~= "WRAP_CONTENT" then props.CanvasHeight == "WRAP_CONTENT" else true
    local v3 = v1 or v2
    local new = UDim2.new
    if not p2 then
        if typeof(props.CanvasWidth) ~= "UDim" then
            CanvasWidth = props.CanvasSize.X
        else
            CanvasWidth = props.CanvasWidth
        end
    elseif v1 then
        CanvasWidth = UDim.new(0, p2.X)
    end
    if not p2 then
        if typeof(props.CanvasHeight) ~= "UDim" then
            CanvasHeight = props.CanvasSize.Y
        else
            CanvasHeight = props.CanvasHeight
            if not CanvasHeight then
                CanvasHeight = props.CanvasSize.Y
            end
        end
    elseif v2 then
        CanvasHeight = UDim.new(0, p2.Y)
    end
    return new(CanvasWidth, CanvasHeight)
end
function v2:UpdateContentSize(p2) -- Line: 130
    if not p2 or not p2.Parent then
        return
    end
    p2.Parent.Size = self:GetSize(p2.AbsoluteContentSize)
    p2.Parent.CanvasSize = self:GetCanvasSize(p2.AbsoluteContentSize)
end
return v2