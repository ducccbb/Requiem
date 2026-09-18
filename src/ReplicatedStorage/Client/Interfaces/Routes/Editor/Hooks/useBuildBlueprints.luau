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
--   File: ReplicatedStorage.Client.Interfaces.Routes.Editor.Hooks.useBuildBlueprints
--                              Dumped in 0.000354 seconds
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
local Types = Common:WaitForChild("Types")
local Building = Types:WaitForChild("Building")
local Entries = Building:WaitForChild("Entries")
local Blueprints = require(Entries:WaitForChild("Blueprints"))
local Providers = script.Parent.Parent:WaitForChild("Providers")
local BuilderProvider = require(Providers:WaitForChild("BuilderProvider"))
return function() -- Line: 22 -- upvalues: react (val), BuilderProvider (val), Blueprints (val)
    local u10, v1, v2
    local u4 = react.useContext(BuilderProvider.BuilderContext)
    v1, u10 = react.useState(u4.server.blueprints)
    local v3 = react.useState(u4.isSandboxMode)
    react.useEffect(function() -- Line: 28 -- upvalues: u10 (val), u4 (val)
        u10(u4.server.blueprints)
    end, {u4.server.blueprints})
    if v3 then
        v2 = Blueprints.createSandboxBlueprints()
    else
        v2 = v1
        if not v2 then
            v2 = Blueprints.createSandboxBlueprints()
        end
    end
    return v2
end