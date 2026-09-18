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
-- File: ReplicatedStorage.Common.Effects.Types.Enchantments.Warden Of Ymir.Warden Chain
--                              Dumped in 0.000367 seconds
--                          Bytecode version 9  |  4 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Assets = game:GetService("ReplicatedStorage"):WaitForChild("Assets")
local Particles = Assets:WaitForChild("Particles")
local Enchantments = Particles:WaitForChild("Enchantments")
local u29 = nil
local u30 = nil
local u31 = nil
return function(p1, p2, p3) -- Line: 21 -- upvalues: Enchantments (val), u30 (ref), u31 (ref), u29 (ref)
    if not p1 or not p2 then
        return
    end
    if p3.enabled then
        if u29 then
            task.cancel(u29)
        end
        u29 = task.delay(p3.duration, function() -- Line: 59 -- upvalues: u30 (upval), u31 (upval)
            if u30 then
                u30:Destroy()
            end
            if u31 then
                u31:Destroy()
            end
        end)
        return
    end
    local v1 = Enchantments:WaitForChild("Warden Of Ymir")
    u30 = v1:WaitForChild("Start"):Clone()
    u31 = v1:WaitForChild("End"):Clone()
    u30.Parent = p1
    u31.Parent = p2
    local Chain = u31:FindFirstChild("Chain")
    if not Chain then
        return
    end
    Chain.Attachment0 = u30
    Chain.Attachment1 = u31
    u29 = task.delay(p3.duration, function() -- Line: 43 -- upvalues: u30 (upval), u31 (upval)
        if u30 then
            u30:Destroy()
        end
        if u31 then
            u31:Destroy()
        end
    end)
end