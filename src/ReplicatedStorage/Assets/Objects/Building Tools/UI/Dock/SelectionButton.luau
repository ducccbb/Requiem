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
--     File: ReplicatedStorage.Assets.Objects.Building Tools.UI.Dock.SelectionButton
--                              Dumped in 0.000391 seconds
--                          Bytecode version 9  |  5 functions

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
local Tooltip = require(v1.Parent:WaitForChild("Tooltip"))
local v3 = Roact.PureComponent:extend(v1.Name)
function v3.init(p1) -- Line: 21
    p1:setState({IsHovering = false})
end
function v3.render(p1) -- Line: 27 -- upvalues: createElement (val), Roact (val), Tooltip (val)
    local v1
    local v2 = {BackgroundTransparency = 1, Image = p1.props.IconAssetId, LayoutOrder = p1.props.LayoutOrder}
    if not p1.props.IsActive then
        v1 = 0.5
    else
        v1 = 0
    end
    v2.ImageTransparency = v1
    v2[Roact.Event.Activated] = p1.props.OnActivated
    v2[Roact.Event.InputBegan] = function(a1, p2) -- Line: 34 -- upvalues: p1 (val)
        if p2.UserInputType.Name == "MouseMovement" then
            p1:setState({IsHovering = true})
        end
    end
    v2[Roact.Event.InputEnded] = function(a1, p2) -- Line: 41 -- upvalues: p1 (val)
        if p2.UserInputType.Name == "MouseMovement" then
            p1:setState({IsHovering = false})
        end
    end
    return createElement("ImageButton", v2, {Tooltip = createElement(Tooltip, {IsVisible = p1.state.IsHovering, Text = p1.props.TooltipText or ""})})
end
return v3