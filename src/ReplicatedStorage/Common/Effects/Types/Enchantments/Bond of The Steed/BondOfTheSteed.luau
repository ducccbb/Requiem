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
--File: ReplicatedStorage.Common.Effects.Types.Enchantments.Bond of The Steed.BondOfTheSteed
--                              Dumped in 0.000267 seconds
--                          Bytecode version 9  |  4 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local TweenService = game:GetService("TweenService")
return function(p1) -- Line: 13 -- upvalues: TweenService (val)
    local Highlight = Instance.new("Highlight")
    Highlight.FillColor = Color3.fromRGB(255, 255, 255)
    Highlight.FillTransparency = 1
    Highlight.OutlineTransparency = 1
    Highlight.Adornee = p1
    Highlight.Parent = p1
    local v1 = TweenInfo.new(0.1)
    TweenService:Create(Highlight, v1, {FillTransparency = 0.3}):Play()
    task.delay(5, function() -- Line: 27 -- upvalues: TweenService (upval), Highlight (val)
        local v1 = TweenInfo.new(0.3)
        TweenService:Create(Highlight, v1, {FillTransparency = 1}):Play()
        task.delay(0.3, function() -- Line: 32 -- upvalues: Highlight (upval)
            Highlight:Destroy()
        end)
    end)
end