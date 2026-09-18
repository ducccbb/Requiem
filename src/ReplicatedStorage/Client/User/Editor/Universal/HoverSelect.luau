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
--           File: ReplicatedStorage.Client.User.Editor.Universal.HoverSelect
--                              Dumped in 0.000834 seconds
--                          Bytecode version 9  |  10 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local CollectionService = game:GetService("CollectionService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local function getTaggedAncestor(p1, p2) -- Line: 27 -- upvalues: CollectionService (val)
    local v1
    local Parent = p2
    while Parent do
        if CollectionService:HasTag(Parent, p1) then
            break
        end
        Parent = Parent.Parent
    end
    if not Parent then
        v1 = nil
    elseif not (Parent:IsA("Model")) then
        v1 = nil
    else
        v1 = Parent
        if not v1 then
            v1 = nil
        end
    end
    return v1
end
return function(p1) -- Line: 39 -- upvalues: CollectionService (val), RunService (val), UserInputService (val), getTaggedAncestor (val)
    local tag = p1.tag
    local accept = p1.accept
    local onSelectedChanged = p1.onSelectedChanged
    local u5 = p1.maxDistance or 500
    local Highlight = Instance.new("Highlight")
    Highlight.FillTransparency = 1
    Highlight.OutlineTransparency = 0
    local hoverOutlineColor = p1.hoverOutlineColor
    if not hoverOutlineColor then
        hoverOutlineColor = Color3.fromRGB(125, 197, 255)
    end
    Highlight.OutlineColor = hoverOutlineColor
    local Highlight_2 = Instance.new("Highlight")
    Highlight_2.FillTransparency = 1
    Highlight_2.OutlineTransparency = 0
    local selectOutlineColor = p1.selectOutlineColor
    if not selectOutlineColor then
        selectOutlineColor = Color3.fromRGB(25, 153, 255)
    end
    Highlight_2.OutlineColor = selectOutlineColor
    local function setHighlight(p1, p2) -- Line: 55
        p1.Parent = p2
        p1.Adornee = p2
    end
    local u35 = RaycastParams.new()
    u35.FilterType = Enum.RaycastFilterType.Include
    u35.FilterDescendantsInstances = CollectionService:GetTagged(tag)
    local u44 = nil
    local u45 = nil
    local function setSelected(p1) -- Line: 67 -- upvalues: u45 (ref), onSelectedChanged (val), setHighlight (val), Highlight_2 (val), u44 (ref), Highlight (val)
        u45 = p1
        onSelectedChanged(p1)
        setHighlight(Highlight_2, u45)
        if u44 == u45 then
            setHighlight(Highlight, nil)
        end
    end
    local function refreshFilter() -- Line: 77 -- upvalues: u35 (val), CollectionService (upval), tag (val)
        u35.FilterDescendantsInstances = CollectionService:GetTagged(tag)
    end
    local InstanceAddedSignal = CollectionService:GetInstanceAddedSignal(tag)
    local u59 = InstanceAddedSignal:Connect(refreshFilter)
    local InstanceRemovedSignal = CollectionService:GetInstanceRemovedSignal(tag)
    local u68 = InstanceRemovedSignal:Connect(function() -- Line: 83 -- upvalues: refreshFilter (val), u44 (ref), CollectionService (upval), tag (val), setHighlight (val), Highlight (val), u45 (ref), setSelected (val)
        refreshFilter()
        if u44 and not (CollectionService:HasTag(u44, tag)) then
            u44 = nil
            setHighlight(Highlight, nil)
        end
        if u45 and not (CollectionService:HasTag(u45, tag)) then
            setSelected(nil)
        end
    end)
    local u78 = RunService.RenderStepped:Connect(function() -- Line: 94 -- upvalues: u44 (ref), setHighlight (val), Highlight (val), UserInputService (upval), u5 (val), u35 (val), getTaggedAncestor (upval), tag (val), accept (val), u45 (ref)
        local v1, v2
        local CurrentCamera = workspace.CurrentCamera
        if not CurrentCamera then
            u44 = nil
            return setHighlight(Highlight, nil)
        end
        local MouseLocation = UserInputService:GetMouseLocation()
        local v3 = CurrentCamera:ViewportPointToRay(MouseLocation.X, MouseLocation.Y)
        local v4 = workspace:Raycast(v3.Origin, v3.Direction * u5, u35)
        if not v4 then
            v1 = nil
        else
            v1 = getTaggedAncestor(tag, v4.Instance)
        end
        if not v1 then
            v2 = nil
        elseif not (accept(v1)) then
            v2 = nil
        else
            v2 = v1
            if not v2 then
                v2 = nil
            end
        end
        v1 = v2
        if v1 == u44 then
            return
        end
        u44 = v1
        if not v1 then
            setHighlight(Highlight, nil)
            return
        end
        if v1 ~= u45 then
            setHighlight(Highlight, v1)
            return
        end
        setHighlight(Highlight, nil)
    end)
    local u84 = UserInputService.InputBegan:Connect(function(p1, p2) -- Line: 120 -- upvalues: setSelected (val), u44 (ref)
        if p2 or p1.UserInputType ~= Enum.UserInputType.MouseButton1 then
            return
        end
        setSelected(u44)
    end)
    return function() -- Line: 127 -- upvalues: u59 (val), u68 (val), u78 (val), u84 (val), u44 (ref), setHighlight (val), Highlight (val), setSelected (val)
        u59:Disconnect()
        u68:Disconnect()
        u78:Disconnect()
        u84:Disconnect()
        u44 = nil
        setHighlight(Highlight, nil)
        setSelected(nil)
    end
end