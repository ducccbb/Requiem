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
--     File: ReplicatedStorage.Assets.Objects.Building Tools.UI.ScopeHUD.ModeToggle
--                               Dumped in 0.00139 seconds
--                          Bytecode version 9  |  9 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local Parent = v1.Parent.Parent.Parent
local Vendor = Parent:WaitForChild("Vendor")
local Libraries = Parent:WaitForChild("Libraries")
local Roact = require(Vendor:WaitForChild("Roact"))
local Maid = require(Libraries:WaitForChild("Maid"))
local createElement = Roact.createElement
local Tooltip = require(v1:WaitForChild("Tooltip"))
local v3 = Roact.PureComponent:extend("ModeToggle")
function v3.init(p1) -- Line: 22 -- upvalues: Maid (val)
    p1.Maid = Maid.new()
    function p1.OnInputBegin(a1, p2, p3) -- Line: 26 -- upvalues: p1 (val)
        if p3 then
            return
        end
        if p2.UserInputType.Name == "MouseMovement" then
            p1:setState({IsHovering = true})
        end
    end
    function p1.OnInputEnd(a1, p2, p3) -- Line: 40 -- upvalues: p1 (val)
        if p2.UserInputType.Name == "MouseMovement" then
            p1:setState({IsHovering = false})
        end
    end
    function p1.OnActivated() -- Line: 49 -- upvalues: p1 (val)
        p1.props.Core.Targeting:ToggleTargetingMode()
    end
    p1:setState({IsHovering = false, TargetingMode = p1.props.Core.Targeting.TargetingMode})
end
function v3.didMount(p1) -- Line: 60
    local Maid = p1.Maid
    Maid.ModeListener = p1.props.Core.Targeting.TargetingModeChanged:Connect(function(a1) -- Line: 62 -- upvalues: p1 (val)
        p1:setState({TargetingMode = a1})
    end)
end
function v3.willUnmount(p1) -- Line: 69
    p1.Maid:Destroy()
end
function v3.render(p1) -- Line: 73 -- upvalues: Roact (val), createElement (val), Tooltip (val)
    local v1, v2, v3
    if p1.state.TargetingMode ~= "Scoped" then
        v1 = if p1.state.TargetingMode == "Direct" then 14 else false
    else
        v1 = 0
    end
    local v4 = {}
    local v5 = {BackgroundTransparency = 1, Image = "rbxassetid://4445959523"}
    if not p1.state.IsHovering then
        v3 = 0.2
    else
        v3 = 0.5
    end
    v5.ImageTransparency = 1 - v3
    v5.ScaleType = Enum.ScaleType.Slice
    v5.SliceCenter = Rect.new(4, 4, 12, 12)
    v5.ImageColor3 = Color3.fromRGB(131, 131, 131)
    v5.Size = UDim2.new(0, 18, 0, 18)
    v5.LayoutOrder = 0
    v5[Roact.Event.Activated] = p1.OnActivated
    v5[Roact.Event.InputBegan] = p1.OnInputBegin
    v5[Roact.Event.InputEnded] = p1.OnInputEnd
    local v6 = {}
    local v7 = {BackgroundTransparency = 1, Image = "rbxassetid://4463020853"}
    if not p1.state.IsHovering then
        v2 = 0.5
    else
        v2 = 1
    end
    v7.ImageTransparency = 1 - v2
    v7.AnchorPoint = Vector2.new(0.5, 0.5)
    v7.Position = UDim2.new(0.5, 0, 0.5, 0)
    v7.Size = UDim2.new(0, 14, 0, 14)
    v7.ImageRectOffset = Vector2.new(v1, 0)
    v7.ImageRectSize = Vector2.new(14, 14)
    v6.Icon = createElement("ImageLabel", v7)
    v6.Tooltip = createElement(Tooltip, {Visible = p1.state.IsHovering, IsToolModeEnabled = p1.props.IsToolModeEnabled})
    v4.ModeToggle = createElement("ImageButton", v5, v6)
    v4.ModeToggleSpacer = createElement("Frame", {BackgroundTransparency = 1, LayoutOrder = 1, Size = UDim2.new(0, 0, 1, 0)})
    return Roact.createFragment(v4)
end
return v3