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
--       File: ReplicatedStorage.Common.Effects.Types.Enchantments.Tracer Bullets
--                              Dumped in 0.000223 seconds
--                          Bytecode version 9  |  3 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
return function(p1, p2) -- Line: 8
    if not p1 or not p1.Parent or not (p1:FindFirstChildWhichIsA("Humanoid")) then
        return
    end
    local Highlight = Instance.new("Highlight")
    Highlight.FillColor = Color3.fromRGB(165, 165, 165)
    Highlight.OutlineTransparency = 0.8
    Highlight.Adornee = p1
    Highlight.Parent = p1
    task.delay(p2 or 3, function() -- Line: 23 -- upvalues: Highlight (val)
        if Highlight.Parent then
            Highlight:Destroy()
        end
    end)
end