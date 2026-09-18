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
--         File: ReplicatedStorage.Assets.Objects.Building Tools.UI.ImageButton
--                              Dumped in 0.000815 seconds
--                          Bytecode version 9  |  6 functions

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
local v2 = Roact.PureComponent:extend("ImageButton")
v2.defaultProps = {BackgroundTransparency = 1, BorderSizePixel = 0, Image = "", Size = UDim2.new(1, 0, 1, 0)}
function v2.render(p1) -- Line: 30 -- upvalues: SupportLibrary (val), createElement (val), Roact (val)
    local v1, v2, v3
    local v4 = SupportLibrary.CloneTable(p1.props)
    if v4.AspectRatio then
        v2 = {AspectRatio = v4.AspectRatio}
        v1 = createElement("UIAspectRatioConstraint", v2)
        v3 = v4[Roact.Children]
        if not v3 then
            v3 = {}
        end
        v4[Roact.Children] = SupportLibrary.Merge({AspectRatio = v1}, v3)
        if v4.DominantAxis == "Width" then
            v4.SizeConstraint = "RelativeXX"
            if typeof(v4.Width) ~= "UDim" then
                v4.Size = UDim2.new(v4.Size.X, UDim.new(v4.Size.X.Scale / v4.AspectRatio, 0))
            else
                v4.Height = UDim.new(v4.Width.Scale / v4.AspectRatio, 0)
            end
        elseif v4.DominantAxis == "Height" then
            v4.SizeConstraint = "RelativeYY"
            if typeof(v4.Height) ~= "UDim" then
                v2 = UDim.new(v4.Size.Y.Scale * v4.AspectRatio, 0)
                v4.Size = UDim2.new(v2, v4.Size.Y)
            else
                v4.Width = UDim.new(v4.Height.Scale * v4.AspectRatio, 0)
            end
        end
    end
    if v4.Layout == "List" then
        v2 = {
            FillDirection = v4.LayoutDirection,
            Padding = v4.LayoutPadding,
            HorizontalAlignment = v4.HorizontalAlignment,
            VerticalAlignment = v4.VerticalAlignment,
            SortOrder = v4.SortOrder or "LayoutOrder",
        }
        v2[Roact.Ref] = function(a1) -- Line: 80 -- upvalues: p1 (val)
            p1:UpdateContentSize(a1)
        end
        v2[Roact.Change.AbsoluteContentSize] = function(a1) -- Line: 83 -- upvalues: p1 (val)
            p1:UpdateContentSize(a1)
        end
        v1 = createElement("UIListLayout", v2)
        v4.Size = p1:GetSize()
        v4[Roact.Children] = SupportLibrary.Merge({Layout = v1}, v4[Roact.Children])
    end
    if type(v4.ImageColor) == "string" then
        local v5
        v1, v5, v2 = v4.ImageColor:lower():match("#?(..)(..)(..)")
        v3 = tonumber(v1, 16)
        local v6 = tonumber(v5, 16)
        v4.ImageColor3 = Color3.fromRGB(v3, v6, (tonumber(v2, 16)))
    end
    v4.AspectRatio = nil
    v4.DominantAxis = nil
    v4.Layout = nil
    v4.LayoutDirection = nil
    v4.LayoutPadding = nil
    v4.HorizontalAlignment = nil
    v4.VerticalAlignment = nil
    v4.HorizontalPadding = nil
    v4.VerticalPadding = nil
    v4.SortOrder = nil
    v4.Width = nil
    v4.Height = nil
    v4.ImageColor = nil
    return createElement("ImageButton", v4)
end
function v2:GetSize(p2) -- Line: 124
    local Height, Width
    local props = self.props
    local v1 = if props.Size ~= "WRAP_CONTENT" then props.Width == "WRAP_CONTENT" else true
    local v2 = if props.Size ~= "WRAP_CONTENT" then props.Height == "WRAP_CONTENT" else true
    local v3 = v1 or v2
    local v4 = UDim2.new(0, props.HorizontalPadding or 0, 0, props.VerticalPadding or 0)
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
    return v4 + new(Width, Height)
end
function v2:UpdateContentSize(p2) -- Line: 149
    if not p2 or not p2.Parent then
        return
    end
    p2.Parent.Size = self:GetSize(p2.AbsoluteContentSize)
end
return v2