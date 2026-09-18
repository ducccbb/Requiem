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
--  File: ReplicatedStorage.Client.Entities.Titans.Utilities.NapeProtectionTitanClient
--                              Dumped in 0.000387 seconds
--                          Bytecode version 9  |  6 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local u12 = {}
local function getLayerPart(p1) -- Line: 21
    local Hardening = p1:FindFirstChild("Hardening", true)
    if not Hardening then
        return nil
    end
    if Hardening:IsA("BasePart") then
        return Hardening
    end
    return nil
end
local function getBaseSize(p1) -- Line: 34 -- upvalues: u12 (val)
    local v1 = u12[p1]
    if v1 then
        return v1
    end
    local Size = p1.Size
    u12[p1] = Size
    p1.Destroying:Once(function() -- Line: 43 -- upvalues: u12 (upval), p1 (val)
        u12[p1] = nil
    end)
    return Size
end
local function applyLayerVisual(p1, p2, p3, p4) -- Line: 58 -- upvalues: getLayerPart (val), getBaseSize (val)
    local v1 = getLayerPart(p1)
    if not v1 then
        return
    end
    if p4 then
        v1.Transparency = 1
        v1.CanQuery = false
        v1.CanTouch = false
        return
    end
    local v2 = p2 / math.max(p3, 1)
    local v3 = math.clamp(v2, 0, 1)
    v2 = getBaseSize(v1)
    v1.Size = v2 * (1 - v3 * 0.28)
end
return {
    applyLayerVisual = applyLayerVisual,
    applyFromServerRoot = function(p1, p2) -- Line: 85 -- upvalues: applyLayerVisual (val)
        debug.profilebegin("NapeProtectionTitanClient.applyFromServerRoot")
        if p2:GetAttribute("NapeProtectionLayer") ~= "ice" then
            debug.profileend()
            return
        end
        local v1 = p2:GetAttribute("NapeProtectionBroken") == true
        applyLayerVisual(p1, p2:GetAttribute("NapeProtectionHits") or 0, p2:GetAttribute("NapeProtectionRequired") or 1, v1)
        debug.profileend()
    end,
}