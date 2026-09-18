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
--            File: ReplicatedStorage.Assets.Objects.Building Tools.UI.Frame
--                              Dumped in 0.000839 seconds
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
local v2 = Roact.PureComponent:extend("Frame")
v2.defaultProps = {BackgroundTransparency = 1, BorderSizePixel = 0, Size = UDim2.new(1, 0, 1, 0)}
function v2.render(p1) -- Line: 29 -- upvalues: SupportLibrary (val), createElement (val), Roact (val)
    local v1, v2
    local v3 = SupportLibrary.CloneTable(p1.props)
    if v3.AspectRatio then
        v2 = {AspectRatio = v3.AspectRatio}
        v1 = createElement("UIAspectRatioConstraint", v2)
        local v4 = v3[Roact.Children]
        if not v4 then
            v4 = {}
        end
        v3[Roact.Children] = SupportLibrary.Merge({AspectRatio = v1}, v4)
        if v3.DominantAxis == "Width" then
            v3.SizeConstraint = "RelativeXX"
            if typeof(v3.Width) ~= "UDim" then
                v3.Size = UDim2.new(v3.Size.X, UDim.new(v3.Size.X.Scale / v3.AspectRatio, 0))
            else
                v3.Height = UDim.new(v3.Width.Scale / v3.AspectRatio, 0)
            end
        elseif v3.DominantAxis == "Height" then
            v3.SizeConstraint = "RelativeYY"
            if typeof(v3.Height) ~= "UDim" then
                v2 = UDim.new(v3.Size.Y.Scale * v3.AspectRatio, 0)
                v3.Size = UDim2.new(v2, v3.Size.Y)
            else
                v3.Width = UDim.new(v3.Height.Scale * v3.AspectRatio, 0)
            end
        end
    end
    if v3.Layout == "List" then
        v2 = {
            FillDirection = v3.LayoutDirection,
            Padding = v3.LayoutPadding,
            HorizontalAlignment = v3.HorizontalAlignment,
            VerticalAlignment = v3.VerticalAlignment,
            SortOrder = v3.SortOrder or "LayoutOrder",
        }
        v2[Roact.Ref] = function(a1) -- Line: 79 -- upvalues: p1 (val)
            p1:UpdateContentSize(a1)
        end
        v2[Roact.Change.AbsoluteContentSize] = function(a1) -- Line: 82 -- upvalues: p1 (val)
            p1:UpdateContentSize(a1)
        end
        v1 = createElement("UIListLayout", v2)
        v3.Size = p1:GetSize()
        v3[Roact.Children] = SupportLibrary.Merge({Layout = v1}, v3[Roact.Children])
    end
    v3.AspectRatio = nil
    v3.DominantAxis = nil
    v3.Layout = nil
    v3.LayoutDirection = nil
    v3.LayoutPadding = nil
    v3.HorizontalAlignment = nil
    v3.VerticalAlignment = nil
    v3.HorizontalPadding = nil
    v3.VerticalPadding = nil
    v3.SortOrder = nil
    v3.Width = nil
    v3.Height = nil
    v3.ResizeParent = nil
    return createElement("Frame", v3)
end
function v2:GetSize(p2) -- Line: 117
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
function v2:UpdateContentSize(p2) -- Line: 142 -- upvalues: SupportLibrary (val)
    local Parent
    if not p2 or not p2.Parent then
        return
    end
    p2.Parent.Size = self:GetSize(p2.AbsoluteContentSize)
    local ResizeParent = self.props.ResizeParent
    Parent = ResizeParent
    if Parent then
        Parent = p2.Parent.Parent
    end
    if ResizeParent and Parent then
        local X = Parent.Size.X
        local Y = Parent.Size.Y
        if SupportLibrary.IsInTable(ResizeParent, "WIDTH") then
            X = UDim.new(0, p2.Parent.AbsoluteSize.X)
        end
        if SupportLibrary.IsInTable(ResizeParent, "HEIGHT") then
            Y = UDim.new(0, p2.Parent.AbsoluteSize.Y)
        end
        Parent.Size = UDim2.new(X, Y)
    end
end
return v2