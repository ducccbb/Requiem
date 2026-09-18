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
--               File: ReplicatedStorage.Client.Interfaces.Hooks.useCamera
--                              Dumped in 0.000228 seconds
--                          Bytecode version 9  |  3 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local useEventListener = require(script.Parent:WaitForChild("useEventListener"))
return function() -- Line: 22 -- upvalues: react (val), Workspace (val), useEventListener (val)
    local u5, v1
    v1, u5 = react.useState(Workspace.CurrentCamera)
    local PropertyChangedSignal = Workspace:GetPropertyChangedSignal("CurrentCamera")
    useEventListener(PropertyChangedSignal, function() -- Line: 25 -- upvalues: Workspace (upval), u5 (val)
        if Workspace.CurrentCamera then
            u5(Workspace.CurrentCamera)
        end
    end)
    return v1
end