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
--   File: ReplicatedStorage.Client.Interfaces.Routes.Interactions.Types.Building.Gate
--                               Dumped in 0.00164 seconds
--                          Bytecode version 9  |  22 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local CollectionService = game:GetService("CollectionService")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Interaction = require(Namespaces:WaitForChild("Interaction"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Animations = Common_2:WaitForChild("Animations")
local Default = require(Animations:WaitForChild("Default"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Observers = Common_3:WaitForChild("Observers")
local useAnimatorObserver = require(Observers:WaitForChild("useAnimatorObserver"))
local v2 = {
    header = "Gate",
    body = "Press \"%s\" to open the gate.",
    options = function(p1) -- Line: 26
        local v1
        local Attribute = p1:GetAttribute("Open")
        local v2 = {}
        local v3 = {Image = "rbxassetid://12966845909", Default = true}
        if not Attribute then
            v1 = "Open"
        else
            v1 = "Close"
        end
        v3.Name = v1
        v2[1] = v3
        return v2
    end,
}
local u85 = {"Gate1", "Gate2"}
local u88 = {}
local u89 = {}
local u90 = {}
local function forEachGatePart(p1, p2) -- Line: 49 -- upvalues: u85 (val)
    local v1
    local v2 = u85
    local v3 = nil
    local v4 = nil
    local v5 = p1
    for i, j in v2, v3, v4 do
        v1 = v5:FindFirstChild(j)
        if not v1 then
            return
        end
        for k, n in v1:GetChildren() do
            if n:IsA("BasePart") then
                v6(n)
            end
        end
    end
end
local function ensureGateRestPositions(p1) -- Line: 63 -- upvalues: forEachGatePart (val), u89 (val)
    forEachGatePart(p1, function(p1) -- Line: 64 -- upvalues: u89 (upval)
        if not (u89[p1]) then
            u89[p1] = p1.Position
        end
    end)
end
local function snapGateToState(p1, p2) -- Line: 71 -- upvalues: ensureGateRestPositions (val), forEachGatePart (val), u89 (val)
    local zero
    ensureGateRestPositions(p1)
    if not p2 then
        zero = Vector3.zero
    else
        zero = Vector3.new(0, 40, 0)
    end
    forEachGatePart(p1, function(p1) -- Line: 74 -- upvalues: u89 (upval), zero (val)
        local v1 = u89[p1]
        if v1 then
            p1.Position = v1 + zero
        end
    end)
end
local function disconnectTweenConnection(p1) -- Line: 82 -- upvalues: u88 (val)
    local v1 = u88[p1]
    if v1 then
        v1:Disconnect()
    end
    u88[p1] = nil
end
local function playGateTween(p1, p2, p3, p4) -- Line: 91 -- upvalues: ensureGateRestPositions (val), snapGateToState (val), forEachGatePart (val), u89 (val), TweenService (val), u88 (val), disconnectTweenConnection (val)
    local u12, zero
    ensureGateRestPositions(p3)
    if not p4 then
        snapGateToState(p3, p2)
        return
    end
    if not p2 then
        u12 = "Closing"
    else
        u12 = "Opening"
    end
    if not p2 then
        zero = Vector3.zero
    else
        zero = Vector3.new(0, 40, 0)
    end
    forEachGatePart(p3, function(a1) -- Line: 102 -- upvalues: u89 (upval), TweenService (upval), zero (val), p1 (val), u12 (val), u88 (upval), disconnectTweenConnection (upval)
        local v1 = u89[a1]
        if not v1 then
            return
        end
        local v2 = TweenInfo.new(10)
        local v3 = TweenService:Create(a1, v2, {Position = v1 + zero})
        v3:Play()
        p1:SetAttribute(u12, true)
        u88[a1] = v3.Completed:Connect(function() -- Line: 112 -- upvalues: p1 (upval), u12 (upval), disconnectTweenConnection (upval), a1 (val)
            p1:SetAttribute(u12, false)
            disconnectTweenConnection(a1)
        end)
    end)
end
local function getChainBeams(p1) -- Line: 121
    local ChainBeams = p1:FindFirstChild("ChainBeams")
    if not ChainBeams then
        return {}
    end
    local v1 = {}
    for i, j in ChainBeams:GetDescendants() do
        if j:IsA("Beam") then
            table.insert(v1, j)
        end
    end
    return v1
end
local function setChainBeamTextureSpeed(p1, p2) -- Line: 135 -- upvalues: getChainBeams (val)
    local v1
    local v2 = p2
    for i, j in getChainBeams(p1) do
        if v2 then
            v1 = 0
        elseif (i - 1) % 2 ~= 0 then
            v1 = -1
        else
            v1 = 1
        end
        j.TextureSpeed = v1
    end
end
local function runGatePresentation(p1, p2, p3, p4, p5) -- Line: 141 -- upvalues: useAnimatorObserver (val), Default (val), setChainBeamTextureSpeed (val), playGateTween (val)
    if p1:GetAttribute("Opening") or p1:GetAttribute("Closing") then
        return
    end
    local u18 = useAnimatorObserver.playAnimationOnRig(p3, Default.GateLever)
    task.delay(10, function() -- Line: 153 -- upvalues: u18 (val), setChainBeamTextureSpeed (upval), p3 (val)
        u18:Stop()
        setChainBeamTextureSpeed(p3, true)
    end)
    setChainBeamTextureSpeed(p3, false)
    playGateTween(p1, p4, p2, p5)
end
local function resolveGateRig(p1) -- Line: 164
    local MainGate = p1:FindFirstAncestor("MainGate")
    if not MainGate or not (MainGate:FindFirstChild("Gate1")) or not (MainGate:FindFirstChild("Gate2")) then
        return nil, nil
    end
    local GateLeverRig = MainGate:FindFirstChild("GateLeverRig")
    if not GateLeverRig then
        return nil, nil
    end
    return MainGate, GateLeverRig
end
local function onTrackGateState(p1) -- Line: 176 -- upvalues: u90 (val), resolveGateRig (val), ensureGateRestPositions (val), snapGateToState (val), runGatePresentation (val)
    local u5, u6
    if u90[p1] then
        return
    end
    u5, u6 = resolveGateRig(p1)
    if not u5 or not u6 then
        return
    end
    u90[p1] = true
    ensureGateRestPositions(u5)
    if p1:GetAttribute("Open") == true then
        snapGateToState(u5, true)
    end
    local AttributeChangedSignal = p1:GetAttributeChangedSignal("Open")
    AttributeChangedSignal:Connect(function() -- Line: 193 -- upvalues: p1 (val), runGatePresentation (upval), u5 (val), u6 (val)
        local v1 = p1:GetAttribute("Open") == true
        runGatePresentation(p1, u5, u6, v1, true)
    end)
end
local function tryTrackGate(p1) -- Line: 199 -- upvalues: onTrackGateState (val)
    if p1:GetAttribute("Type") == "Gate" then
        onTrackGateState(p1)
    end
end
local function hookInteractionPart(p1) -- Line: 205 -- upvalues: tryTrackGate (val)
    if not (p1:IsA("BasePart")) then
        return
    end
    tryTrackGate(p1)
    local AttributeChangedSignal = p1:GetAttributeChangedSignal("Type")
    AttributeChangedSignal:Connect(function() -- Line: 210 -- upvalues: tryTrackGate (upval), p1 (val)
        tryTrackGate(p1)
    end)
end
for i, j in CollectionService:GetTagged("Interaction") do
    hookInteractionPart(j)
end
local InstanceAddedSignal = CollectionService:GetInstanceAddedSignal("Interaction")
InstanceAddedSignal:Connect(hookInteractionPart)
return {
    interacted = function(p1, p2) -- Line: 223 -- upvalues: Interaction (val)
        Interaction.Event.unreliablePost(p1, p2)
    end,
    display = v2,
}