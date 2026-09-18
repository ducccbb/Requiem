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
--File: ReplicatedStorage.Packages._Index.jsdotlua_scheduler@17.2.1.scheduler.SchedulerMinHeap
--                              Dumped in 0.000443 seconds
--                          Bytecode version 9  |  7 functions

local v1 = {}
local u1 = nil
local u2 = nil
local u3 = nil
function v1.push(p1, p2) -- Line: 22 -- upvalues: u2 (ref)
    local v1 = #p1 + 1
    p1[v1] = p2
    u2(p1, p2, v1)
end
function v1.peek(p1) -- Line: 29
    return p1[1]
end
function v1.pop(p1) -- Line: 33 -- upvalues: u3 (ref)
    local v1 = p1[1]
    if v1 == nil then
        return nil
    end
    local v2 = p1[#p1]
    p1[#p1] = nil
    if v2 ~= v1 then
        p1[1] = v2
        u3(p1, v2, 1)
    end
    return v1
end
function u2(p1, p2, p3) -- Line: 49 -- upvalues: u1 (ref)
    local v1, v2, v3
    while true do
        v1 = math.floor(p3 / 2)
        v2 = p1[v1]
        if v2 == nil then
            break
        end
        v3 = u1(v2, p2)
        if 0 >= v3 then
            break
        end
        p1[v1] = p2
        p1[p3] = v2
    end
end
function u3(p1, p2, p3) -- Line: 65 -- upvalues: u1 (ref)
    local v1, v2, v3, v4, v5, v6, v7, v8
    local v9 = #p1
    v3, v1, v2 = p3, p1, p2
    while v3 < v9 do
        v4 = v3 * 2
        v5 = v1[v4]
        v6 = v4 + 1
        v7 = v1[v6]
        if v5 ~= nil then
            v8 = u1(v5, v2)
            if v8 < 0 then
                if v7 == nil then
                    v1[v3] = v5
                    v1[v4] = v2
                    v3 = v4
                else
                    v8 = u1(v7, v5)
                    if v8 < 0 then
                        v1[v3] = v7
                        v1[v6] = v2
                        v3 = v6
                    end
                end
                continue
            end
        end
        if v7 ~= nil then
            v8 = u1(v7, v2)
            if v8 < 0 then
                v1[v3] = v7
                v1[v6] = v2
                v3 = v6
            end
        end
        return
    end
end
function u1(p1, p2) -- Line: 95
    local v1 = p1.sortIndex - p2.sortIndex
    if v1 == 0 then
        return p1.id - p2.id
    end
    return v1
end
return v1