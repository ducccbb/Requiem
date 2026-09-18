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
--      File: ReplicatedStorage.Common.Effects.Types.Miscellaneous.InvisiblePlayer
--                              Dumped in 0.000653 seconds
--                          Bytecode version 9  |  3 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Alive = require(Common:WaitForChild("Alive"))
local u32 = {}
local u33 = {}
local u34 = nil
return function(p1, p2) -- Line: 17 -- upvalues: Alive (val), u32 (val), u33 (val), u34 (ref), ReplicatedStorage (val)
    local v1
    local v2 = Alive.getAliveCharacter(p1)
    if not v2 then
        return
    end
    if not p2 then
        local v3 = u32[p1]
        if not v3 then
            return
        end
        local v4 = v3
        v1 = nil
        local v5 = nil
        for k, n in v4, v1, v5 do
            k.Transparency = n
        end
        u33[p1].Parent = v2
        u32[p1] = nil
        u33[p1] = nil
        if u34 then
            u34:Disconnect()
            u34 = nil
        end
        return
    end
    local u88 = u32[p1]
    if not u88 then
        u88 = {}
    end
    u32[p1] = u88
    local v6 = p1
    for i, j in v2:GetDescendants() do
        if j:IsA("BasePart") then
            if u88[j] == nil then
                u88[j] = j.Transparency
            end
            j.Transparency = 1
        elseif j:IsA("Decal") then
            if u88[j] == nil then
                u88[j] = j.Transparency
            end
            j.Transparency = 1
        end
    end
    u34 = v2.DescendantAdded:Connect(function(p1) -- Line: 63 -- upvalues: u88 (val)
        if p1:IsA("BasePart") then
            if not (u88[p1]) then
                u88[p1] = p1.Transparency
            end
            p1.Transparency = 1
        elseif not (p1:IsA("Decal")) then
        end
    end)
    local Head = v2:FindFirstChild("Head")
    if not Head then
        return
    end
    u33[v6] = Head
    v1 = u33[v6]
    v1.Parent = ReplicatedStorage
end