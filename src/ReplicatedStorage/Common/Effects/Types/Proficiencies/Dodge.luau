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
--           File: ReplicatedStorage.Common.Effects.Types.Proficiencies.Dodge
--                              Dumped in 0.000293 seconds
--                          Bytecode version 9  |  3 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local TweenService = game:GetService("TweenService")
local u17 = {}
return function(p1, p2, p3) -- Line: 11 -- upvalues: u17 (val), TweenService (val)
    if p2 then
        if u17[p1] then
            u17[p1]:Destroy()
            u17[p1] = nil
        end
        local Highlight = Instance.new("Highlight")
        Highlight.Parent = p1
        Highlight.Adornee = p1
        Highlight.FillColor = Color3.fromRGB(255, 255, 255)
        Highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
        Highlight.FillTransparency = 1
        Highlight.OutlineTransparency = 1
        Highlight.DepthMode = Enum.HighlightDepthMode.Occluded
        local v1 = TweenInfo.new(0.15)
        TweenService:Create(Highlight, v1, {FillTransparency = 0.5, OutlineTransparency = 0}):Play()
        task.delay((p3 or 0.3) - 0.15, function() -- Line: 34 -- upvalues: TweenService (upval), Highlight (val)
            local v1 = TweenInfo.new(0.3)
            TweenService:Create(Highlight, v1, {FillTransparency = 1, OutlineTransparency = 1}):Play()
            task.wait(0.3)
            Highlight:Destroy()
        end)
    end
end