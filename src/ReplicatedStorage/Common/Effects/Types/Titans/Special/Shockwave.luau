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
--         File: ReplicatedStorage.Common.Effects.Types.Titans.Special.Shockwave
--                              Dumped in 0.000345 seconds
--                          Bytecode version 9  |  3 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local Special = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Particles"):WaitForChild("Titans"):WaitForChild("Special")
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Particles = require(Utilities:WaitForChild("Particles"))
return function(p1, p2) -- Line: 23 -- upvalues: Special (val), TweenService (val), Particles (val)
    local v1 = Special:WaitForChild("Shockwave"):Clone()
    v1.Position = p1
    v1.Parent = workspace
    local Highlight = Instance.new("Highlight")
    Highlight.FillColor = Color3.fromRGB(213, 52, 52)
    Highlight.OutlineColor = Color3.fromRGB(255, 0, 0)
    Highlight.FillTransparency = 1
    Highlight.OutlineTransparency = 1
    Highlight.Parent = p2
    Highlight.Adornee = p2
    local v2 = TweenInfo.new(0.1)
    TweenService:Create(Highlight, v2, {FillTransparency = 0.8}):Play()
    task.delay(0.1, function() -- Line: 40 -- upvalues: TweenService (upval), Highlight (val)
        local v1 = TweenInfo.new(0.5)
        TweenService:Create(Highlight, v1, {FillTransparency = 1}):Play()
    end)
    local Attachment = v1:WaitForChild("Attachment")
    Particles.deepEmitParticles(Attachment, true)
end