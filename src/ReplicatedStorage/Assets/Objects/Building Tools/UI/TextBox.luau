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
--           File: ReplicatedStorage.Assets.Objects.Building Tools.UI.TextBox
--                              Dumped in 0.000912 seconds
--                          Bytecode version 9  |  10 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Parent = script.Parent.Parent
local Libraries = Parent:WaitForChild("Libraries")
local Vendor = Parent:WaitForChild("Vendor")
local TextService = game:GetService("TextService")
local SupportLibrary = require(Libraries:WaitForChild("SupportLibrary"))
local Roact = require(Vendor:WaitForChild("Roact"))
local createElement = Roact.createElement
local u44 = Roact.PureComponent:extend("TextBox")
u44.defaultProps = {
    BackgroundTransparency = 1,
    BorderSizePixel = 0,
    TextSize = 16,
    Font = "SourceSans",
    TextXAlignment = "Left",
    Size = UDim2.new(1, 0, 1, 0),
    TextColor3 = Color3.new(0, 0, 0),
}
local u60 = Vector2.new(math.huge, math.huge)
function u44:getSize() -- Line: 37 -- upvalues: TextService (val), u60 (val)
    local Height, Width
    if self.props.Width then
        local TextSize, Y
        Width = nil
        Height = nil
        if typeof(self.props.Width) == "UDim" then
            Width = self.props.Width
        elseif typeof(self.props.Height) == "UDim" then
            Height = self.props.Height
        end
        TextSize = if self.props.TextScaled and self.AbsoluteSize then self.AbsoluteSize.Y else self.props.TextSize
        local TextSize_2 = TextService:GetTextSize(self.props.Text, TextSize, self.props.Font, u60)
        if not Width then
            if self.props.Width == "WRAP_CONTENT" then
                Width = UDim.new(0, TextSize_2.X)
            elseif self.props.Size ~= "WRAP_CONTENT" then
            end
        end
        if not Height then
            if self.props.Height == "WRAP_CONTENT" then
                Height = UDim.new(0, TextSize_2.Y)
            elseif self.props.Size ~= "WRAP_CONTENT" then
            end
        end
        local new = UDim2.new
        local X = Width
        if not X then
            if not self.props.Size then
                X = UDim.new()
            else
                X = self.props.Size.X
            end
        end
        Y = Height
        if not Y then
            if not self.props.Size then
                Y = UDim.new()
            else
                Y = self.props.Size.Y
                if not Y then
                    Y = UDim.new()
                end
            end
        end
        return new(X, Y)
    elseif not self.props.Height and self.props.Size ~= "WRAP_CONTENT" then
        return self.props.Size
    end
end
function u44:updateSize() -- Line: 82
    local Y
    local v1 = self:getSize()
    if not self.props.TextScaled then
        Y = self.props.TextSize
    elseif self.AbsoluteSize then
        Y = self.AbsoluteSize.Y
    end
    if self.state.Size ~= v1 then
        self:setState({Size = v1, TextSize = Y})
    elseif self.state.TextSize ~= Y then
        self:setState({Size = v1, TextSize = Y})
    end
end
function u44.init(p1) -- Line: 102
    p1.Updating = true
    p1.state = {TextSize = 0, Size = UDim2.new()}
end
function u44.willUpdate(p1, p2, p3) -- Line: 110
    p1.Updating = true
end
function u44.render(p1) -- Line: 114 -- upvalues: SupportLibrary (val), Roact (val), createElement (val), u44 (val)
    local v1, v2
    local v3 = {}
    local v4 = {Size = p1.state.Size, TextSize = p1.state.TextSize, TextScaled = false}
    v4[Roact.Ref] = function(a1) -- Line: 123 -- upvalues: p1 (val)
        local AbsoluteSize
        local v1 = p1
        if not a1 then
            AbsoluteSize = p1.AbsoluteSize
        else
            AbsoluteSize = a1.AbsoluteSize
            if not AbsoluteSize then
                AbsoluteSize = p1.AbsoluteSize
            end
        end
        v1.AbsoluteSize = AbsoluteSize
    end
    v4[Roact.Change.AbsoluteSize] = function(a1) -- Line: 130 -- upvalues: p1 (val)
        p1.AbsoluteSize = a1.AbsoluteSize
        if not p1.Updating then
            p1:updateSize()
        end
    end
    v1 = SupportLibrary.Merge(v3, p1.props, v4)
    if type(v1.TextColor) == "string" then
        v3, v2, v4 = v1.TextColor:lower():match("#?(..)(..)(..)")
        local v5 = tonumber(v3, 16)
        local v6 = tonumber(v2, 16)
        v1.TextColor3 = Color3.fromRGB(v5, v6, (tonumber(v4, 16)))
    end
    v2 = {}
    v3 = SupportLibrary.Merge(v2, p1.props[Roact.Children])
    v1.Width = nil
    v1.Height = nil
    v1.Bold = nil
    v1.TextColor = nil
    v1[Roact.Children] = nil
    if p1.props.Bold then
        v2 = SupportLibrary.CloneTable(v1)
        v2.Size = UDim2.new(1, 0, 1, 0)
        v2.Position = nil
        v2.TextScaled = true
        v2.AnchorPoint = nil
        v3.Bold = createElement(u44, v2)
    end
    return createElement("TextBox", v1, v3)
end
function u44.didMount(p1) -- Line: 170
    p1.Updating = nil
    p1:updateSize()
end
function u44.didUpdate(p1, p2, p3) -- Line: 175
    p1.Updating = nil
    p1:updateSize()
end
return u44