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
--             File: ReplicatedStorage.Common.Customization.ShifterMarkings
--                              Dumped in 0.000413 seconds
--                          Bytecode version 9  |  5 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Workspace = game:GetService("Workspace")
local u17 = {
    marking10 = "rbxassetid://77369471859998",
    marking9 = "rbxassetid://129167443958279",
    marking8 = "rbxassetid://113151277206910",
    marking7 = "rbxassetid://95962494539143",
    marking6 = "rbxassetid://98943447540684",
    marking5 = "rbxassetid://94147423505988",
    marking4 = "rbxassetid://124967218596555",
    marking3 = "rbxassetid://112130033171188",
    marking2 = "rbxassetid://128735253825788",
    marking1 = "rbxassetid://118900464844178",
}
local function assignRandomMarking() -- Line: 32
    return math.random(1, 10)
end
return {
    COUNT = 10,
    MARKING_DURATION = 28800,
    MARKINGS = u17,
    assignRandomMarking = assignRandomMarking,
    getMarkingTexture = function(p1) -- Line: 36 -- upvalues: u17 (val)
        local v1 = math.floor(p1)
        local v2 = math.clamp(v1, 1, 10)
        return u17[("marking%*"):format(v2)]
    end,
    ensureMarkingAssigned = function(p1) -- Line: 41 -- upvalues: assignRandomMarking (val)
        local ShifterMarking = p1.ShifterMarking
        if typeof(ShifterMarking) ~= "number" then
            ShifterMarking = assignRandomMarking()
            p1.ShifterMarking = ShifterMarking
        elseif ShifterMarking <= 0 then
            ShifterMarking = assignRandomMarking()
            p1.ShifterMarking = ShifterMarking
        elseif 10 < ShifterMarking then
            ShifterMarking = assignRandomMarking()
            p1.ShifterMarking = ShifterMarking
        end
        return ShifterMarking
    end,
    getMarkingTransparency = function(p1) -- Line: 51 -- upvalues: Workspace (val)
        if not p1 then
            return nil
        end
        local v1 = math.max(0, Workspace:GetServerTimeNow() - p1)
        if 28800 <= v1 then
            return nil
        end
        local v2 = v1 / 28800 * 0.8 + 0.2
        return (math.clamp(v2, 0.2, 1))
    end,
}