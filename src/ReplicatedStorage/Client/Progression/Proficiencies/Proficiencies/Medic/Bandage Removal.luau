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
--File: ReplicatedStorage.Client.Progression.Proficiencies.Proficiencies.Medic.Bandage Removal
--                               Dumped in 0.00114 seconds
--                          Bytecode version 9  |  13 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local CollectionService = game:GetService("CollectionService")
local GuiService = game:GetService("GuiService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Alive = require(Common:WaitForChild("Alive"))
local ClientAttributesHandler = require(script.Parent.Parent.Parent.Parent:WaitForChild("ClientAttributesHandler"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Signals = require(Common_2:WaitForChild("Signals"))
local u92 = Color3.fromRGB(255, 255, 255)
local u97 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local LocalPlayer = Players.LocalPlayer
local u99 = nil
local u100 = nil
local u101 = nil
local u102 = nil
local u103 = nil
local u104 = false
local function fadeHighlight(p1, p2) -- Line: 61 -- upvalues: u103 (ref), TweenService (val), u97 (val)
    local v1
    if u103 then
        u103:Cancel()
        u103 = nil
    end
    if not p2 then
        v1 = {OutlineTransparency = 1, FillTransparency = 1}
    else
        v1 = {OutlineTransparency = 0.1, FillTransparency = 0.5}
    end
    local v2 = TweenService:Create(p1, u97, v1)
    u103 = v2
    v2:Play()
    return v2
end
local function teardownHover() -- Line: 88 -- upvalues: u102 (ref), u101 (ref), u99 (ref), u104 (ref), u103 (ref), TweenService (val), u97 (val)
    if u102 then
        u102:Disconnect()
        u102 = nil
    end
    local u6 = u101
    u101 = nil
    u99 = nil
    u104 = false
    if u6 then
        if u103 then
            u103:Cancel()
            u103 = nil
        end
        local v1 = TweenService:Create(u6, u97, {OutlineTransparency = 1, FillTransparency = 1})
        v1:Play()
        v1.Completed:Once(function() -- Line: 112 -- upvalues: u6 (val)
            u6:Destroy()
        end)
    end
end
local function hasAnyBandage(p1) -- Line: 125
    for i, j in p1:GetChildren() do
        if j.Name == "Bandage" and j:IsA("BasePart") then
            return true
        end
    end
    return false
end
local function resolveHoverTarget(p1) -- Line: 140 -- upvalues: Workspace (val), UserInputService (val), GuiService (val), Alive (val), ClientAttributesHandler (val), LocalPlayer (val), hasAnyBandage (val)
    local CurrentCamera = Workspace.CurrentCamera
    if not CurrentCamera then
        return nil, nil
    end
    local MouseLocation = UserInputService:GetMouseLocation()
    local v1 = CurrentCamera:ScreenPointToRay(MouseLocation.X, MouseLocation.Y - GuiService:GetGuiInset().Y)
    local v2 = v1.Direction * 20
    local v3 = Workspace:Raycast(v1.Origin, v2, p1)
    if not v3 or not v3.Instance then
        return nil, nil
    end
    local v4 = v3.Instance:FindFirstAncestorOfClass("Model")
    if not v4 or not (v4:FindFirstChildWhichIsA("Humanoid")) then
        return nil, nil
    end
    local v5 = Alive.getPlayerFromCharacter(v4)
    if not v5 then
        return nil, nil
    end
    v2 = ClientAttributesHandler.getAttribute("CanSelfBandageRemoval") == 1
    if v5 == LocalPlayer then
        if not v2 or not (hasAnyBandage(v4)) then
            return nil, nil
        end
        return v5, v4
    end
    if v5:GetAttribute("Health") == nil or not (hasAnyBandage(v4)) then
        return nil, nil
    end
    return v5, v4
end
local function updateHoverHighlight(p1) -- Line: 193 -- upvalues: u101 (ref), resolveHoverTarget (val), u99 (ref), u104 (ref), fadeHighlight (val)
    local v1, v2
    local v3 = u101
    if not v3 then
        return
    end
    v1, v2 = resolveHoverTarget(p1)
    if not v1 or not v2 then
        u99 = nil
        if u104 then
            u104 = false
            fadeHighlight(v3, false)
        end
        return
    end
    u99 = v1
    if v3.Adornee ~= v2 then
        v3.Adornee = v2
        v3.Parent = v2
    end
    if not u104 then
        u104 = true
        fadeHighlight(v3, true)
    end
end
return {
    unlocked = function() -- Line: 228 -- upvalues: teardownHover (val), u100 (ref)
        return function() -- Line: 229 -- upvalues: teardownHover (upval), u100 (upval)
            teardownHover()
            u100 = nil
        end
    end,
    activated = function(p1) -- Line: 294 -- upvalues: u100 (ref)
        local v1 = u100
        u100 = nil
        if not v1 then
            return
        end
        p1(v1)
    end,
    started = function() -- Line: 240 -- upvalues: teardownHover (val), u92 (val), u101 (ref), u104 (ref), CollectionService (val), u102 (ref), RunService (val), updateHoverHighlight (val)
        teardownHover()
        local Highlight = Instance.new("Highlight")
        Highlight.FillTransparency = 1
        Highlight.OutlineTransparency = 1
        Highlight.OutlineColor = u92
        Highlight.FillColor = u92
        Highlight.DepthMode = Enum.HighlightDepthMode.Occluded
        u101 = Highlight
        u104 = false
        local u12 = RaycastParams.new()
        u12.FilterType = Enum.RaycastFilterType.Include
        u12.FilterDescendantsInstances = {CollectionService:GetTagged("Character")}
        u102 = RunService.RenderStepped:Connect(function() -- Line: 256 -- upvalues: updateHoverHighlight (upval), u12 (val)
            updateHoverHighlight(u12)
        end)
        return true
    end,
    finished = function() -- Line: 268 -- upvalues: u99 (ref), teardownHover (val), u100 (ref), ClientAttributesHandler (val), Signals (val)
        local v1
        local v2 = u99
        teardownHover()
        if v2 then
            u100 = v2
            return true
        end
        u100 = nil
        local v3 = ClientAttributesHandler.getAttribute("CanSelfBandageRemoval") == 1
        if not v3 then
            v1 = "You must be hovering a bandaged player to remove their bandages."
        else
            v1 = "You must be hovering a bandaged player — or yourself — to remove bandages."
        end
        Signals.Toast:Fire({type = "error", message = v1})
        return false
    end,
    settings = {},
}