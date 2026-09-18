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
--                     File: ReplicatedStorage.Common.Types.Firearms
--                              Dumped in 0.000543 seconds
--                          Bytecode version 9  |  8 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local Utilities = v1.Parent.Parent:WaitForChild("Utilities")
local Character = require(Utilities:WaitForChild("Character"))
local Signals = require(v1.Parent.Parent:WaitForChild("Signals"))
local u32 = {RELOAD = "reload", CANCEL = "cancel_reload", FINISH = "finish_reload"}
local function setReloading(p1, p2) -- Line: 77 -- upvalues: Character (val)
    local v1 = Character.getCharacter(p1)
    if not v1 then
        return
    end
    v1:SetAttribute("FirearmReloading", p2)
end
return {
    RELOADING_ATTRIBUTE = "FirearmReloading",
    RELOAD_SOUNDS = u32,
    cancelReload = function(p1) -- Line: 34
        local reload
        if not p1.state.reloading then
            return
        end
        if p1.connections.reload then
            p1.connections.reload:Disconnect()
            p1.connections.reload = nil
        end
        if p1.connections.reload_velocity then
            p1.connections.reload_velocity:Disconnect()
            p1.connections.reload_velocity = nil
        end
        reload = p1.tracks.reload
        if reload then
            reload:Stop(0.2)
            p1.tracks.reload = nil
        end
        p1.state.reloading = false
        if p1.onCancel then
            p1.onCancel()
        end
    end,
    connectDamageCancelReload = function(p1) -- Line: 66 -- upvalues: Signals (val)
        return Signals.OnHealthChanged:Connect(function() end)
    end,
    setReloading = setReloading,
    clearReloading = function(p1) -- Line: 90 -- upvalues: setReloading (val)
        setReloading(p1, false)
    end,
    isReloading = function(p1) -- Line: 98 -- upvalues: Character (val)
        local v1 = Character.getCharacter(p1)
        if not v1 then
            return false
        end
        local v2 = v1:GetAttribute("FirearmReloading") == true
        return v2
    end,
    onReloadSoundRequest = function(p1, p2) -- Line: 112 -- upvalues: u32 (val), setReloading (val)
        if p2 == u32.RELOAD then
            setReloading(p1, true)
            return
        end
        if p2 == u32.CANCEL then
            setReloading(p1, false)
        elseif p2 == u32.FINISH then
            setReloading(p1, false)
        end
    end,
}