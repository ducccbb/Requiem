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
--                         File: ReplicatedStorage.Common.Chrono
--                              Dumped in 0.000660 seconds
--                          Bytecode version 9  |  7 functions

local u0 = script
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local RunService = game:GetService("RunService")
local NpcRegistry = require(u0.Shared.NpcRegistry)
local u21 = nil
local u22 = nil
local u23 = nil
local u24 = nil
local u25 = nil
local u26 = nil
require(u0.Shared.Snapshots)
local function LoadFolder(p1) -- Line: 23
    local FullName
    for i, j in p1:GetDescendants() do
        if j:IsA("ModuleScript") then
            local u17 = true
            local u18 = nil
            local u19 = nil
            task.spawn(function() -- Line: 29 -- upvalues: u18 (ref), u19 (ref), j (val), u17 (ref)
                local v1, v2
                v1, v2 = pcall(require, j)
                u18 = v1
                u19 = v2
                u17 = false
            end)
            if not u18 then
                FullName = j:GetFullName()
                error((("%*: %*"):format(FullName, u19)))
            end
            if u17 then
                warn("Yielded while requiring" .. j:GetFullName())
            end
        end
    end
end
local u32 = {
    ChronoClient = true,
    ChronoServer = true,
    NpcRegistry = true,
    Snapshots = true,
    InterpolationBuffer = true,
    RenderCache = true,
    TogglePlayerReplication = true,
    Character = true,
}
local u33 = {}
local u34 = false
function u33.Start() -- Line: 60 -- upvalues: u34 (ref), LoadFolder (val), RunService (val), u0 (val), u21 (ref), u25 (ref), u22 (ref), u23 (ref), u24 (ref), u26 (ref), u33 (val), NpcRegistry (val)
    local Server
    if u34 then
        return
    end
    u34 = true
    if not (RunService:IsServer()) then
        Server = u0.Client
    else
        Server = u0.Server
    end
    LoadFolder(Server)
    LoadFolder(u0.Shared)
    if not (RunService:IsServer()) then
        u22 = require(u0.Client.Replicate)
        u23 = require(u0.Client.InterpolationBuffer)
        u24 = require(u0.Client.RenderCache)
    else
        u21 = require(u0.Server.Replicate)
        u25 = u21.TogglePlayerReplication
    end
    u26 = require(u0.Shared.Character)
    u33.Character = u26
    u33.ChronoClient = u22
    u33.ChronoServer = u21
    u33.NpcRegistry = NpcRegistry
    u33.Snapshots = require(u0.Shared.Snapshots)
    u33.InterpolationBuffer = u23
    u33.RenderCache = u24
    u33.TogglePlayerReplication = u25
    setmetatable(u33, nil)
    local Config = require(u0.Shared.Config)
    if Config.DISABLE_DEFAULT_REPLICATION and Config.ENABLE_CUSTOM_CHARACTERS then
        warn("DISABLE_DEFAULT_REPLICATION and ENABLE_CUSTOM_CHARACTERS are both enabled. Disabling DISABLE_DEFAULT_REPLICATION since its not needed.")
        Config.DISABLE_DEFAULT_REPLICATION = false
    end
    local v1 = {
        __index = function(p1, p2) -- Line: 96 -- upvalues: Config (val)
            return Config[p2]
        end,
    }
    function v1.__newindex(p1, p2, p3) -- Line: 99
        local v1 = ("Attempt to modify Config.%* after Chrono.Start()"):format(p2)
        error(v1, 2)
    end
    u33.Config = setmetatable({}, v1)
end
u33.Config = require(u0.Shared.Config)
local v2 = {
    __index = function(p1, p2) -- Line: 108 -- upvalues: u32 (val)
        if u32[p2] then
            local v1 = ("Attempt to access Chrono.%* before calling Chrono.Start()"):format(p2)
            error(v1, 2)
        end
    end,
}
return (setmetatable(u33, v2))