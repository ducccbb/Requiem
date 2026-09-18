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
--File: ReplicatedStorage.Common.Effects.Types.Enchantments.Teamwork makes the Dreamwork
--                              Dumped in 0.000358 seconds
--                          Bytecode version 9  |  4 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local TweenService = game:GetService("TweenService")
local u21 = Color3.fromRGB(40, 180, 70)
return function(p1, p2) -- Line: 19 -- upvalues: u21 (val), TweenService (val)
    if not p1 or not p1.Parent or not (p1:FindFirstChildWhichIsA("Humanoid")) then
        return
    end
    local Highlight = Instance.new("Highlight")
    Highlight.Name = "Teamwork makes the Dreamwork"
    Highlight.FillColor = u21
    Highlight.OutlineColor = u21
    Highlight.FillTransparency = 1
    Highlight.OutlineTransparency = 1
    Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    Highlight.Adornee = p1
    Highlight.Parent = p1
    local v1 = TweenInfo.new(0.15)
    TweenService:Create(Highlight, v1, {FillTransparency = 0.65, OutlineTransparency = 0}):Play()
    task.delay(p2 or 3, function() -- Line: 45 -- upvalues: Highlight (val), TweenService (upval)
        if not Highlight.Parent then
            return
        end
        local v1 = TweenInfo.new(0.3)
        TweenService:Create(Highlight, v1, {FillTransparency = 1, OutlineTransparency = 1}):Play()
        task.delay(0.3, function() -- Line: 55 -- upvalues: Highlight (upval)
            Highlight:Destroy()
        end)
    end)
end