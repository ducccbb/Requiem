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
--       File: ReplicatedStorage.Client.User.Character.Actions.ClientActionHandler
--                              Dumped in 0.000439 seconds
--                          Bytecode version 9  |  4 functions

local u0 = script
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local State = u0.Parent.Parent.Parent:WaitForChild("State")
local ClientSettingsHandler = require(State:WaitForChild("ClientSettingsHandler"))
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Player = require(Namespaces:WaitForChild("Player"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_2:WaitForChild("Packages")
local trove = require(Packages:WaitForChild("trove"))
local u63 = nil
local u64 = {}
ClientSettingsHandler.onKeybindPressed("Cancel Action"):Connect(function() -- Line: 28 -- upvalues: u63 (ref), Player (val)
    if u63 then
        Player.Action.post(nil)
        u63.Trove:Destroy()
        u63 = nil
    end
end)
Player.Action.listen(function(p1) -- Line: 36 -- upvalues: u63 (ref), u64 (val), u0 (val), trove (val)
    if u63 then
        u63.Trove:Destroy()
        u63 = nil
    end
    if not p1 then
        return
    end
    local v1 = u64[p1.action]
    if v1 then
        u63 = {Action = p1.action, Trove = trove.new()}
        if v1 then
            v1.execute(u63.Trove)
        end
        u63.Trove:Add(function() -- Line: 69 -- upvalues: u63 (upval)
            u63 = nil
        end)
        return
    end
    local v2 = require(u0.Parent.Types:FindFirstChild("Client" .. p1.action .. "Action"))
    if not v2 then
        return
    end
    u64[p1.action] = v2
    v1 = v2
    u63 = {Action = p1.action, Trove = trove.new()}
    if v1 then
        v1.execute(u63.Trove)
    end
    u63.Trove:Add(function() -- Line: 69 -- upvalues: u63 (upval)
        u63 = nil
    end)
end)
return {}