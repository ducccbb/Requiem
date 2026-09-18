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
--            File: ReplicatedStorage.Common.Effects.Types.Universal.Speaking
--                              Dumped in 0.000395 seconds
--                          Bytecode version 9  |  2 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Customization = Common:WaitForChild("Customization")
local Mouths = require(Customization:WaitForChild("Mouths"))
local u31 = {}
local u32 = {}
local u33 = 0
return function(p1, p2, p3) -- Line: 20 -- upvalues: u31 (val), u32 (val), u33 (ref), Mouths (val)
    local a, v1, v2, v3, v4
    local Parent = p2.Parent
    if Parent then
        Parent = p2.Parent:FindFirstChild("FacePanel")
    end
    if not Parent then
        return
    end
    local Mouth = Parent:FindFirstChild("Mouth")
    if not Mouth then
        return
    end
    if not (u31[p2]) and not (u32[p2]) then
        u32[p2] = Mouth.Texture
    end
    if 3 <= u33 then
        return
    end
    if u31[p2] then
        v3 = u31[p2]
        v3.cancelled = true
    end
    v3 = {cancelled = false}
    u31[p2] = v3
    u33 = u33 + 1
    local v5 = #p3
    local v6 = 1
    v2, v1 = p3, p2
    for i = 1, v5, v6 do
        if v3.cancelled then
            break
        end
        v4 = v2:sub(i, i)
        a = Mouths.Vocabulary[string.lower(v4)]
        if not a then
            a = Mouths.Vocabulary.a
        end
        Mouth.Texture = a
        task.wait(0.08)
    end
    if u32[v1] then
        Mouth.Texture = u32[v1]
    end
    if u31[v1] == v3 then
        u31[v1] = nil
    end
    u33 = u33 - 1
end