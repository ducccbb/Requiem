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
--              File: ReplicatedStorage.Client.Interfaces.Hooks.useKeyPress
--                              Dumped in 0.000304 seconds
--                          Bytecode version 9  |  4 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local useEventListener = require(script.Parent:WaitForChild("useEventListener"))
return function(p1, p2) -- Line: 22 -- upvalues: react (val), useEventListener (val), UserInputService (val)
    local u6, v1
    v1, u6 = react.useState(false)
    useEventListener(UserInputService.InputBegan, function(a1, a2) -- Line: 25 -- upvalues: p2 (val), p1 (val), u6 (val)
        if not a2 then
            if a1.KeyCode == Enum.KeyCode.Unknown then
                return
            end
            if a1.KeyCode == p1 then
                u6(true)
            end
            return
        end
        if not p2 or a1.KeyCode == Enum.KeyCode.Unknown then
            return
        end
        if a1.KeyCode == p1 then
            u6(true)
        end
    end)
    useEventListener(UserInputService.InputEnded, function(a1, p2) -- Line: 35 -- upvalues: p1 (val), u6 (val)
        if a1.KeyCode == p1 then
            u6(false)
        elseif a1.KeyCode == Enum.KeyCode.Unknown then
            u6(false)
        end
    end)
    return v1
end