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
--               File: ReplicatedStorage.Common.Administration.Permissions
--                              Dumped in 0.000519 seconds
--                          Bytecode version 9  |  21 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local RunService = game:GetService("RunService")
local v2 = {}
local v3 = {}
local u19 = {
    Developer = 9,
    Writer = 8,
    Management = 7,
    Senior = 6,
    Moderator = 5,
    Trial = 4,
    Actor = 3,
    Trainer = 2,
    Officer = 1,
    Player = 0,
}
v2[u19.Developer] = function(p1) -- Line: 76 -- upvalues: RunService (val)
    local v1 = if p1.UserId ~= 361092508 then if p1.UserId ~= 59888460 then if p1.UserId ~= 106013056 then if p1.UserId ~= 127624582 then RunService:IsStudio() else true else true else true else true
    return v1
end
v2[u19.Writer] = function(p1) -- Line: 85
    return false
end
v2[u19.Management] = function(p1) -- Line: 89
    return false
end
v2[u19.Senior] = function(p1) -- Line: 93
    return false
end
v2[u19.Moderator] = function(p1) -- Line: 97
    return false
end
v2[u19.Trial] = function(p1) -- Line: 101
    return false
end
v2[u19.Actor] = function(p1) -- Line: 105
    return false
end
v2[u19.Trainer] = function(p1) -- Line: 109
    return false
end
v2[u19.Officer] = function(p1) -- Line: 113
    return false
end
v2[u19.Player] = function(p1) -- Line: 117
    return true
end
v3[u19.Developer] = function() -- Line: 123
    return true
end
v3[u19.Writer] = function(p1) -- Line: 127 -- upvalues: u19 (val)
    local v1 = p1 <= u19.Writer
    return v1
end
v3[u19.Management] = function(p1) -- Line: 131 -- upvalues: u19 (val)
    local v1 = p1 <= u19.Management
    return v1
end
v3[u19.Senior] = function(p1) -- Line: 135 -- upvalues: u19 (val)
    local v1 = p1 <= u19.Senior
    return v1
end
v3[u19.Moderator] = function(p1) -- Line: 139 -- upvalues: u19 (val)
    local v1 = p1 <= u19.Moderator
    return v1
end
v3[u19.Trial] = function(p1) -- Line: 143 -- upvalues: u19 (val)
    local v1 = p1 <= u19.Trial
    return v1
end
v3[u19.Actor] = function(p1) -- Line: 147 -- upvalues: u19 (val)
    local v1 = p1 <= u19.Actor
    return v1
end
v3[u19.Trainer] = function(p1) -- Line: 151 -- upvalues: u19 (val)
    local v1 = p1 == u19.Trainer
    return v1
end
v3[u19.Officer] = function(p1) -- Line: 155 -- upvalues: u19 (val)
    local v1 = p1 == u19.Officer
    return v1
end
v3[u19.Player] = function(p1) -- Line: 159 -- upvalues: u19 (val)
    local v1 = p1 == u19.Player
    return v1
end
return {
    Permissions = v2,
    Roles = u19,
    Guards = v3,
    Accessability = {Editor = 3, Sandbox = 6, Events = 5, Debug = 9},
    Editor = {
        Builder = 6,
        Titan = 5,
        Animal = 5,
        Prop = 5,
        Destruction = 5,
        Logs = 5,
        Lighting = 5,
        Messages = 4,
        Freecam = 4,
        Teleport = 4,
        Visibility = 4,
        Pings = 4,
        Character = 3,
        Slots = 3,
    },
}