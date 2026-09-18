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
--    File: ReplicatedStorage.Assets.Objects.Building Tools.UI.ScopeHUD.HotkeyTooltip
--                              Dumped in 0.000365 seconds
--                          Bytecode version 9  |  2 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local Vendor = v1.Parent.Parent.Parent:WaitForChild("Vendor")
local Roact = require(Vendor:WaitForChild("Roact"))
local ScopeOutTooltip = require(v1:WaitForChild("ScopeOutTooltip"))
local ScopeLockTooltip = require(v1:WaitForChild("ScopeLockTooltip"))
local ScopeInTooltip = require(v1:WaitForChild("ScopeInTooltip"))
local AltTooltip = require(v1:WaitForChild("AltTooltip"))
return function(p1) -- Line: 18 -- upvalues: Roact (val), ScopeOutTooltip (val), ScopeLockTooltip (val), ScopeInTooltip (val), AltTooltip (val)
    local v1 = nil
    if not p1.IsAltDown then
        if p1.DisplayAltHotkey then
            v1 = Roact.createElement(AltTooltip, p1)
        end
    elseif p1.IsScopeParent then
        v1 = Roact.createElement(ScopeOutTooltip, p1)
    elseif not p1.IsScope then
        if p1.IsScopable then
            v1 = Roact.createElement(ScopeInTooltip, p1)
        end
    elseif not p1.IsScopeLocked then
        v1 = Roact.createElement(ScopeLockTooltip, p1)
    end
    local createFragment = Roact.createFragment
    local v2 = {Tooltip = v1}
    local v3 = v1
    if v3 then
        local v4
        local createElement = Roact.createElement
        local v5 = {BackgroundTransparency = 1, Size = UDim2.new(0, 0, 1, 0)}
        if not p1.LayoutOrder then
            v4 = 2
        else
            v4 = p1.LayoutOrder - 1
            if not v4 then
                v4 = 2
            end
        end
        v5.LayoutOrder = v4
        v3 = createElement("Frame", v5)
    end
    v2.Spacer = v3
    return createFragment(v2)
end