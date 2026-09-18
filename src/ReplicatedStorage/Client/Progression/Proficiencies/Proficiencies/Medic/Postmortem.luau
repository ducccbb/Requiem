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
--File: ReplicatedStorage.Client.Progression.Proficiencies.Proficiencies.Medic.Postmortem
--                              Dumped in 0.000971 seconds
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
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Server = require(Namespaces:WaitForChild("Server"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Signals = require(Common_2:WaitForChild("Signals"))
local u85 = Color3.fromRGB(255, 255, 255)
local u90 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local u91 = nil
local u92 = nil
local u93 = nil
local u94 = nil
local u95 = nil
local u96 = false
local function fadeHighlight(p1, p2) -- Line: 57 -- upvalues: u95 (ref), TweenService (val), u90 (val)
    local v1
    if u95 then
        u95:Cancel()
        u95 = nil
    end
    if not p2 then
        v1 = {OutlineTransparency = 1, FillTransparency = 1}
    else
        v1 = {OutlineTransparency = 0.1, FillTransparency = 0.5}
    end
    local v2 = TweenService:Create(p1, u90, v1)
    u95 = v2
    v2:Play()
    return v2
end
local function teardownHover() -- Line: 84 -- upvalues: u94 (ref), u93 (ref), u91 (ref), u96 (ref), u95 (ref), TweenService (val), u90 (val)
    if u94 then
        u94:Disconnect()
        u94 = nil
    end
    local u6 = u93
    u93 = nil
    u91 = nil
    u96 = false
    if u6 then
        if u95 then
            u95:Cancel()
            u95 = nil
        end
        local v1 = TweenService:Create(u6, u90, {OutlineTransparency = 1, FillTransparency = 1})
        v1:Play()
        v1.Completed:Once(function() -- Line: 108 -- upvalues: u6 (val)
            u6:Destroy()
        end)
    end
end
local function resolveHoverTarget(p1) -- Line: 119 -- upvalues: Workspace (val), UserInputService (val), GuiService (val)
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
local function updateHoverHighlight(p1) -- Line: 152 -- upvalues: u93 (ref), resolveHoverTarget (val), u91 (ref), u96 (ref), fadeHighlight (val)
    local v1 = u93
    if not v1 then
        return
    end
    local v2 = resolveHoverTarget(p1)
    if not v2 then
        u91 = nil
        if u96 then
            u96 = false
            fadeHighlight(v1, false)
        end
        return
    end
    u91 = v2
    if v1.Adornee ~= v2 then
        v1.Adornee = v2
        v1.Parent = v2
    end
    if not u96 then
        u96 = true
        fadeHighlight(v1, true)
    end
end
return {
    verify = function() -- Line: 265 -- upvalues: Server (val), Signals (val)
        if Server.Store.client().event ~= 0 then
            return true
        end
        Signals.Toast:Fire({message = "You cannot do this unless an event is active.", type = "error"})
        return false
    end,
    unlocked = function() -- Line: 187 -- upvalues: teardownHover (val), u92 (ref)
        return function() -- Line: 188 -- upvalues: teardownHover (upval), u92 (upval)
            teardownHover()
            u92 = nil
        end
    end,
    activated = function(p1) -- Line: 250 -- upvalues: u92 (ref)
        local v1 = u92
        u92 = nil
        if not v1 then
            return
        end
        p1(v1)
    end,
    started = function() -- Line: 199 -- upvalues: teardownHover (val), u85 (val), u93 (ref), u96 (ref), CollectionService (val), u94 (ref), RunService (val), updateHoverHighlight (val)
        teardownHover()
        local Highlight = Instance.new("Highlight")
        Highlight.FillTransparency = 1
        Highlight.OutlineTransparency = 1
        Highlight.OutlineColor = u85
        Highlight.FillColor = u85
        Highlight.DepthMode = Enum.HighlightDepthMode.Occluded
        u93 = Highlight
        u96 = false
        local u12 = RaycastParams.new()
        u12.FilterType = Enum.RaycastFilterType.Include
        local v1 = {}
        local Tagged = CollectionService:GetTagged("Character")
        v1[1] = Tagged
        v1[2] = CollectionService:GetTagged("Ragdolled")
        u12.FilterDescendantsInstances = v1
        u94 = RunService.RenderStepped:Connect(function() -- Line: 216 -- upvalues: updateHoverHighlight (upval), u12 (val)
            updateHoverHighlight(u12)
        end)
        return true
    end,
    finished = function() -- Line: 228 -- upvalues: u91 (ref), teardownHover (val), u92 (ref), Signals (val)
        local v1 = u91
        teardownHover()
        if v1 then
            u92 = v1
            return true
        end
        u92 = nil
        Signals.Toast:Fire({message = "You must be hovering a ragdolled body to check for signs of life.", type = "error"})
        return false
    end,
    settings = {},
}