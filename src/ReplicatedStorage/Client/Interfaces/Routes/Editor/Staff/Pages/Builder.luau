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
--      File: ReplicatedStorage.Client.Interfaces.Routes.Editor.Staff.Pages.Builder
--                              Dumped in 0.000339 seconds
--                          Bytecode version 9  |  3 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Signals = require(Common:WaitForChild("Signals"))
local Hooks = script.Parent.Parent.Parent:WaitForChild("Hooks")
local useEditorTools = require(Hooks:WaitForChild("useEditorTools"))
return react.memo(function() -- Line: 19 -- upvalues: useEditorTools (val), react (val), Signals (val)
    local u1 = useEditorTools()
    local u5 = react.useRef(u1)
    react.useEffect(function() -- Line: 24 -- upvalues: u1 (val), u5 (val), Signals (upval)
        if u1 == "Builder" then
            if u1 == "Builder" and u5.current ~= "Builder" then
                Signals.Editor.Building.UpdateEnabled:Fire(true)
                u5.current = u1
            end
            return
        end
        if u5.current == "Builder" then
            Signals.Editor.Building.UpdateEnabled:Fire(false)
            u5.current = u1
            return
        end
        if u1 == "Builder" and u5.current ~= "Builder" then
            Signals.Editor.Building.UpdateEnabled:Fire(true)
            u5.current = u1
        end
    end, {u1})
    return react.createElement(react.Fragment)
end)