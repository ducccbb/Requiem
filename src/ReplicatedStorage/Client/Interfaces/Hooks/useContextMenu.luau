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
--            File: ReplicatedStorage.Client.Interfaces.Hooks.useContextMenu
--                              Dumped in 0.000255 seconds
--                          Bytecode version 9  |  5 functions

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
local ContextMenuProvider = require(Providers:WaitForChild("ContextMenuProvider"))
return function() -- Line: 18 -- upvalues: react (val), ContextMenuProvider (val)
    local v1, v2
    local u4 = react.useContext(ContextMenuProvider.ContextMenuContext)
    v1, v2 = react.useMemo(function() -- Line: 21 -- upvalues: u4 (val)
        return function(p1, p2) -- Line: 22 -- upvalues: u4 (upval)
            if not u4 then
                warn("useContextMenu must be used within a ContextProvider")
                return
            end
            u4.setContexts(p1, p2)
            u4.setVisible(true)
        end, function() -- Line: 32 -- upvalues: u4 (upval)
            if not u4 then
                warn("useContextMenu must be used within a ContextProvider")
                return
            end
            u4.setVisible(false)
        end
    end)
    return v1, v2
end