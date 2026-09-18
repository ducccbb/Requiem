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
--                    File: ReplicatedStorage.Common.Utilities.Emotes
--                              Dumped in 0.000357 seconds
--                          Bytecode version 9  |  3 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local u17 = {}
local function normalize(p1) -- Line: 16
    local v1 = string.lower(p1)
    return string.gsub(v1, "[%s_]", "")
end
return {
    getAnimationId = function(p1) -- Line: 24 -- upvalues: normalize (val), u17 (val), ReplicatedStorage (val)
        local AnimationId
        local v1 = normalize(p1)
        if u17[v1] then
            return u17[v1]
        end
        local Assets = ReplicatedStorage:FindFirstChild("Assets")
        local Emotes = Assets
        if Emotes then
            Emotes = Assets:FindFirstChild("Emotes")
        end
        if not Emotes then
            return nil
        end
        for i, j in Emotes:GetChildren() do
            for k, n in j:GetChildren() do
                if normalize(n.Name) == v1 then
                    AnimationId = n.AnimationId
                    if typeof(AnimationId) == "string" and AnimationId ~= "" then
                        u17[v1] = AnimationId
                        return AnimationId
                    end
                end
            end
        end
        return nil
    end,
}