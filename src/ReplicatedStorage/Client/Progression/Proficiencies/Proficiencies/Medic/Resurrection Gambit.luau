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
--File: ReplicatedStorage.Client.Progression.Proficiencies.Proficiencies.Medic.Resurrection Gambit
--                               Dumped in 0.00102 seconds
--                          Bytecode version 9  |  13 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local CollectionService = game:GetService("CollectionService")
local GuiService = game:GetService("GuiService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local ClientAttributesHandler = require(script.Parent.Parent.Parent.Parent:WaitForChild("ClientAttributesHandler"))
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Server = require(Namespaces:WaitForChild("Server"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Signals = require(Common_2:WaitForChild("Signals"))
local u95 = Color3.fromRGB(255, 255, 255)
local u100 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local u101 = nil
local u102 = nil
local u103 = nil
local u104 = nil
local u105 = nil
local u106 = false
local function fadeHighlight(p1, p2) -- Line: 59 -- upvalues: u105 (ref), TweenService (val), u100 (val)
    local v1
    if u105 then
        u105:Cancel()
        u105 = nil
    end
    if not p2 then
        v1 = {OutlineTransparency = 1, FillTransparency = 1}
    else
        v1 = {OutlineTransparency = 0.1, FillTransparency = 0.5}
    end
    local v2 = TweenService:Create(p1, u100, v1)
    u105 = v2
    v2:Play()
    return v2
end
local function teardownHover() -- Line: 86 -- upvalues: u104 (ref), u103 (ref), u101 (ref), u106 (ref), u105 (ref), TweenService (val), u100 (val)
    if u104 then
        u104:Disconnect()
        u104 = nil
    end
    local u6 = u103
    u103 = nil
    u101 = nil
    u106 = false
    if u6 then
        if u105 then
            u105:Cancel()
            u105 = nil
        end
        local v1 = TweenService:Create(u6, u100, {OutlineTransparency = 1, FillTransparency = 1})
        v1:Play()
        v1.Completed:Once(function() -- Line: 110 -- upvalues: u6 (val)
            u6:Destroy()
        end)
    end
end
local function resolveHoverTarget(p1) -- Line: 121 -- upvalues: Workspace (val), UserInputService (val), GuiService (val)
    local CurrentCamera = Workspace.CurrentCamera
    if not CurrentCamera then
        return nil, nil
    end
    local MouseLocation = UserInputService:GetMouseLocation()
    local v1 = CurrentCamera:ScreenPointToRay(MouseLocation.X, MouseLocation.Y - GuiService:GetGuiInset().Y)
    local v2 = Workspace:Raycast(v1.Origin, v1.Direction * 20, p1)
    if not v2 or not v2.Instance then
        return nil, nil
    end
    local v3 = v2.Instance:FindFirstAncestorOfClass("Model")
    if not v3 or not (v3:FindFirstChildWhichIsA("Humanoid")) or not (v3:GetAttribute("Ragdolled")) then
        return nil, nil
    end
    return v3
end
local function updateHoverHighlight(p1) -- Line: 154 -- upvalues: u103 (ref), resolveHoverTarget (val), u101 (ref), u106 (ref), fadeHighlight (val)
    local v1 = u103
    if not v1 then
        return
    end
    local v2 = resolveHoverTarget(p1)
    if not v2 then
        u101 = nil
        if u106 then
            u106 = false
            fadeHighlight(v1, false)
        end
        return
    end
    u101 = v2
    if v1.Adornee ~= v2 then
        v1.Adornee = v2
        v1.Parent = v2
    end
    if not u106 then
        u106 = true
        fadeHighlight(v1, true)
    end
end
return {
    verify = function() -- Line: 267 -- upvalues: Server (val), Signals (val), ClientAttributesHandler (val)
        if Server.Store.client().event == 0 then
            Signals.Toast:Fire({message = "You cannot do this unless an event is active.", type = "error"})
            return false
        end
        local v1 = ClientAttributesHandler.getAttribute("HasGraceOfYmir") == 1
        if not v1 then
            return true
        end
        Signals.Toast:Fire({message = "You cannot use this proficiency if you have Grace of Ymir.", type = "error"})
        return false
    end,
    unlocked = function() -- Line: 189 -- upvalues: teardownHover (val), u102 (ref)
        return function() -- Line: 190 -- upvalues: teardownHover (upval), u102 (upval)
            teardownHover()
            u102 = nil
        end
    end,
    activated = function(p1) -- Line: 252 -- upvalues: u102 (ref)
        local v1 = u102
        u102 = nil
        if not v1 then
            return
        end
        p1(v1)
    end,
    started = function() -- Line: 201 -- upvalues: teardownHover (val), u95 (val), u103 (ref), u106 (ref), CollectionService (val), u104 (ref), RunService (val), updateHoverHighlight (val)
        teardownHover()
        local Highlight = Instance.new("Highlight")
        Highlight.FillTransparency = 1
        Highlight.OutlineTransparency = 1
        Highlight.OutlineColor = u95
        Highlight.FillColor = u95
        Highlight.DepthMode = Enum.HighlightDepthMode.Occluded
        u103 = Highlight
        u106 = false
        local u12 = RaycastParams.new()
        u12.FilterType = Enum.RaycastFilterType.Include
        local v1 = {}
        local Tagged = CollectionService:GetTagged("Character")
        v1[1] = Tagged
        v1[2] = CollectionService:GetTagged("Ragdolled")
        u12.FilterDescendantsInstances = v1
        u104 = RunService.RenderStepped:Connect(function() -- Line: 218 -- upvalues: updateHoverHighlight (upval), u12 (val)
            updateHoverHighlight(u12)
        end)
        return true
    end,
    finished = function() -- Line: 230 -- upvalues: u101 (ref), teardownHover (val), u102 (ref), Signals (val)
        local v1 = u101
        teardownHover()
        if v1 then
            u102 = v1
            return true
        end
        u102 = nil
        Signals.Toast:Fire({message = "You must be hovering a ragdolled body to attempt resurrection.", type = "error"})
        return false
    end,
    settings = {},
}