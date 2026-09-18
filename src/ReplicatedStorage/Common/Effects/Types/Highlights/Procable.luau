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
--           File: ReplicatedStorage.Common.Effects.Types.Highlights.Procable
--                              Dumped in 0.000635 seconds
--                          Bytecode version 9  |  4 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local TweenService = game:GetService("TweenService")
local function darken(p1, p2, p3, p4) -- Line: 9
    local v1, v2, v3, v4
    if typeof(p1) ~= "table" then
        v1 = p1
    else
        v1 = p1:getValue()
        if not v1 then
            v1 = p1
        end
    end
    if p3 then
        v2 = math.clamp(v1.R * p2, p3 or 0, 1 - (p4 or 0))
        v3 = math.clamp(v1.G * p2, p3 or 0, 1 - (p4 or 0))
        v4 = v1.B * p2
        return Color3.new(v2, v3, (math.clamp(v4, p3 or 0, 1 - (p4 or 0))))
    end
    if not p4 then
        return Color3.new(v1.R * p2, v1.G * p2, v1.B * p2)
    end
    v2 = math.clamp(v1.R * p2, p3 or 0, 1 - (p4 or 0))
    v3 = math.clamp(v1.G * p2, p3 or 0, 1 - (p4 or 0))
    v4 = v1.B * p2
    return Color3.new(v2, v3, (math.clamp(v4, p3 or 0, 1 - (p4 or 0))))
end
return function(p1, p2, p3, p4) -- Line: 23 -- upvalues: darken (val), TweenService (val)
    local Highlight = Instance.new("Highlight")
    Highlight.FillColor = p2
    Highlight.OutlineColor = darken(p2, 1.3)
    Highlight.FillTransparency = 1
    Highlight.OutlineTransparency = 1
    Highlight.DepthMode = Enum.HighlightDepthMode.Occluded
    Highlight.Adornee = p1
    Highlight.Parent = p1
    task.spawn(function() -- Line: 34 -- upvalues: TweenService (upval), Highlight (val), p3 (val)
        local v1 = TweenInfo.new(0.15)
        TweenService:Create(Highlight, v1, {FillTransparency = 0.5, OutlineTransparency = 0}):Play()
        task.wait(p3 or 0.15)
        v1 = TweenInfo.new(0.3)
        TweenService:Create(Highlight, v1, {FillTransparency = 1, OutlineTransparency = 1}):Play()
        task.wait(0.3)
        Highlight:Destroy()
    end)
end