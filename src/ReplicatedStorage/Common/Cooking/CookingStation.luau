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
--                 File: ReplicatedStorage.Common.Cooking.CookingStation
--                              Dumped in 0.000223 seconds
--                          Bytecode version 9  |  3 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local function getSpawnWorldCFrame(p1, p2) -- Line: 8
    local v1 = p1:FindFirstChild(p2)
    if not v1 then
        return nil
    end
    local Spawn = v1:FindFirstChild("Spawn")
    if not Spawn then
        return nil
    end
    if Spawn:IsA("Model") then
        return Spawn:GetPivot()
    end
    if Spawn:IsA("BasePart") then
        return Spawn.CFrame
    end
    return nil
end
return {
    getSpawnWorldCFrame = getSpawnWorldCFrame,
    getObservePosition = function(p1, p2) -- Line: 28 -- upvalues: getSpawnWorldCFrame (val)
        local v1 = getSpawnWorldCFrame(p1, p2)
        if v1 then
            return v1.Position
        end
        if p1:IsA("Model") then
            return p1:GetPivot().Position
        end
        return nil
    end,
}