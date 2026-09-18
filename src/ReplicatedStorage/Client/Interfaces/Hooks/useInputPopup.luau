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
--             File: ReplicatedStorage.Client.Interfaces.Hooks.useInputPopup
--                              Dumped in 0.000357 seconds
--                          Bytecode version 9  |  7 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local Providers = script.Parent.Parent:WaitForChild("Providers")
local InputPopupProvider = require(Providers:WaitForChild("InputPopupProvider"))
return function(p1) -- Line: 18 -- upvalues: react (val), InputPopupProvider (val)
    local v1, v2, v3
    local u5 = react.useContext(InputPopupProvider.InputContext)
    v1, v2, v3 = react.useMemo(function() -- Line: 21 -- upvalues: u5 (val), p1 (val)
        return function(a1, p2, p3, p4, p5) -- Line: 22 -- upvalues: u5 (upval), p1 (upval)
            if not u5 then
                warn("useInputPopup must be used within a PopupProvider")
                return
            end
            if p5 then
                u5.setColor(p5)
            end
            local v1 = p1
            if not v1 then
                v1 = p4
                if not v1 then
                    function v1() -- Line: 38
                        warn("No callback provided for useInputPopup")
                    end
                end
            end
            u5.setInput(a1, p2, p3, v1)
            u5.setVisible(true)
        end, function() -- Line: 45 -- upvalues: u5 (upval)
            if not u5 then
                warn("useInputPopup must be used within a PopupProvider")
                return
            end
            u5.setVisible(false)
        end, function(p1) -- Line: 54 -- upvalues: u5 (upval)
            if not u5 then
                warn("useInputPopup must be used within a PopupProvider")
                return
            end
            u5.setColor(p1)
        end
    end)
    return v1, v2, v3
end