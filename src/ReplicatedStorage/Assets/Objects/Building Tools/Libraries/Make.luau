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
--         File: ReplicatedStorage.Assets.Objects.Building Tools.Libraries.Make
--                              Dumped in 0.000303 seconds
--                          Bytecode version 9  |  3 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
return function(p1) -- Line: 12
    return function(a1, ...) -- Line: 13 -- upvalues: p1 (val)
        local v1, v2, v3, v4
        local v5 = Instance.new(p1)
        local Parent = a1.Parent
        if Parent then
            a1.Parent = nil
        end
        local v6 = next
        local v7 = a1
        local v8 = nil
        for i, j in v6, v7, v8 do
            if type(i) ~= "number" then
                v5[i] = j
            else
                j.Parent = v5
            end
        end
        if Parent then
            v5.Parent = Parent
        end
        if not (...) then
            return v5
        end
        v6 = {...}
        v7 = #v6
        v8 = 1
        for k = 1, v7, v8 do
            v2 = v5:Clone()
            v3 = next
            v4 = v6[k]
            v1 = nil
            for n, m in v3, v4, v1 do
                if type(n) ~= "number" then
                    v2[n] = m
                else
                    m.Parent = v2
                end
            end
            v2.Parent = not v2.Parent and Parent
            v6[k] = v2
        end
        return v5, unpack(v6)
    end
end