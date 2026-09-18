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
--                File: ReplicatedStorage.Common.Chrono.Shared.Character
--                               Dumped in 0.00116 seconds
--                          Bytecode version 9  |  6 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local Alive = require(v1.Parent.Parent.Parent:WaitForChild("Alive"))
local Config = require(v1.Parent.Config)
local Signal = require(v1.Parent.Signal)
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v3 = RunService:IsServer()
local u49 = RunService:IsClient()
local u51 = Signal.new()
local u53 = Signal.new()
local u57 = Instance.new("Camera", workspace)
u57.Name = "PlayerCharacterStorage"
local u70 = nil
if v3 then
    u70 = Instance.new("Folder", ReplicatedStorage)
    u70.Name = "PLAYER_MODEL_CACHE"
elseif u49 then
    u70 = ReplicatedStorage:WaitForChild("PLAYER_MODEL_CACHE")
end
local PLAYER_MODELS = Config.PLAYER_MODELS
local u73 = {}
local u74 = {}
function u73.GetCharacter(p1) -- Line: 40 -- upvalues: u74 (val)
    return u74[p1]
end
function u73.SetCharacter(p1, p2, p3) -- Line: 44 -- upvalues: u74 (val), PLAYER_MODELS (val), u57 (val), u53 (val), u49 (val), u70 (ref), HttpService (val), u51 (val)
    local v1
    if u74[p1] == p2 then
        return
    end
    if typeof(p2) ~= "string" then
        v1 = p2
    else
        local v2 = PLAYER_MODELS[p2]
        if not v2 then
            error((("No model found for character: %*, player: %*"):format(p2, p1.Name)))
        end
        v1 = v2:Clone()
    end
    v1.Parent = u57
    if not v1.PrimaryPart then
        warn("Model does not have a PrimaryPart set:", p2)
    end
    if u74[p1] then
        u53:Fire(p1, u74[p1])
        pcall(workspace.Destroy, u74[p1])
    end
    if not u49 then
        u74[p1] = v1
        v1.Archivable = true
        local v3 = v1:Clone()
        v3.Name = tostring(p1.UserId)
        v3.Parent = u70
        if p3 then
            v3:SetAttribute("_chronoInitData", HttpService:JSONEncode({p3}))
        end
    else
        u74[p1] = v1
    end
    u51:Fire(p1, v1, p3)
end
if u49 then
    local function handleChild(p1) -- Line: 89 -- upvalues: HttpService (val), Alive (val), u73 (val)
        local Value
        local v1 = tonumber(p1.Name)
        local Attribute = p1:GetAttribute("_chronoInitData")
        local v2 = Attribute
        if v2 then
            v2 = HttpService:JSONDecode(Attribute)[1]
        end
        p1:SetAttribute("_chronoInitData", nil)
        if not v1 then
            p1:Destroy()
            return
        end
        v2 = Alive.getAlivePlayerById(v1)
        if not v2 then
            p1:Destroy()
            return
        end
        if not (p1:IsA("StringValue")) then
            Value = p1
        else
            p1.Value:Destroy()
        end
        u73.SetCharacter(v2, Value, v2)
    end
    u70.ChildAdded:Connect(function(p1) -- Line: 114 -- upvalues: handleChild (val)
        task.defer(handleChild, p1)
    end)
    for i, j in u70:GetChildren() do
        task.defer(handleChild, j)
    end
end
Alive.PlayerRemoving:Connect(function(p1) -- Line: 123 -- upvalues: u74 (val), u53 (val)
    local v1 = u74[p1]
    if v1 then
        u53:Fire(p1, v1)
        u74[p1] = nil
        pcall(workspace.Destroy, v1)
    end
end)
u73.CharacterAdded = u51.Event
u73.CharacterRemoved = u53.Event
return u73