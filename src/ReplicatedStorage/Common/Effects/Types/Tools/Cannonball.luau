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
--             File: ReplicatedStorage.Common.Effects.Types.Tools.Cannonball
--                              Dumped in 0.000783 seconds
--                          Bytecode version 9  |  7 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Character = require(Utilities:WaitForChild("Character"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_3:WaitForChild("Client")
local User = Client:WaitForChild("User")
local State = User:WaitForChild("State")
local ClientStatusHandler = require(State:WaitForChild("ClientStatusHandler"))
local Cannonball = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Objects"):WaitForChild("Cannonball")
local function simulateTrajectory(p1, p2, p3, p4) -- Line: 46
    return p1 + p2 * p4, p2 + p3 * p4
end
local function checkCollision(p1, p2, p3) -- Line: 58 -- upvalues: Workspace (val)
    local v1 = p2 - p1
    if v1.Magnitude == 0 then
        return nil
    end
    return Workspace:Spherecast(p1, 0.5, v1, p3)
end
local function cleanup(p1, p2) -- Line: 74
    if p1 and p1.Connected then
        p1:Disconnect()
    end
    if p2 then
        p2:Destroy()
    end
end
return function(p1, p2) -- Line: 86 -- upvalues: Character (val), ClientStatusHandler (val), Cannonball (val), Workspace (val), Players (val), RunService (val), simulateTrajectory (val), checkCollision (val), cleanup (val)
    local v1 = Character.getDistance(p2.startPos)
    if v1 and v1 < 15 then
        ClientStatusHandler.addPlayerStatus("Concussed", 0.3)
    end
    local u12 = nil
    local u13 = nil
    local v2 = Cannonball:Clone()
    v2.Parent = Workspace
    local Root = v2:FindFirstChild("Root")
    if not Root then
        Root = v2.PrimaryPart
        if not Root then
            Root = v2:FindFirstChildWhichIsA("BasePart")
        end
    end
    if not Root then
        warn("[Cannonball] No root part found in cannonball model")
        v2:Destroy()
    else
        u12 = v2
        u13 = Root
    end
    local u44 = p2.startPos + p2.direction * 1
    local velocity = p2.velocity
    local gravity = p2.gravity
    local u47 = 0
    local PlayerByUserId = Players:GetPlayerByUserId(p2.userId)
    local Character_2 = PlayerByUserId
    if Character_2 then
        Character_2 = PlayerByUserId.Character
    end
    local u56 = RaycastParams.new()
    u56.FilterType = Enum.RaycastFilterType.Exclude
    local v3 = {}
    if u12 then
        table.insert(v3, u12)
    end
    if Character_2 then
        table.insert(v3, Character_2)
    end
    if p2.cannonModel then
        table.insert(v3, p2.cannonModel)
    end
    local Cannons = Workspace:FindFirstChild("Cannons")
    if Cannons then
        table.insert(v3, Cannons)
    end
    u56.FilterDescendantsInstances = v3
    local u97 = nil
    u97 = RunService.RenderStepped:Connect(function(p1) -- Line: 146 -- upvalues: u47 (ref), u44 (ref), velocity (ref), simulateTrajectory (upval), gravity (val), u13 (ref), checkCollision (upval), u56 (val), cleanup (upval), u97 (ref), u12 (ref)
        local v1, v2
        local v3 = math.min(p1, 0.05)
        u47 = u47 + v3
        v1, v2 = simulateTrajectory(u44, velocity, gravity, v3)
        u44 = v1
        velocity = v2
        if u13 then
            u13.CFrame = CFrame.new(u44)
        end
        if 0 > u47 then
            if 25 <= u47 then
                cleanup(u97, u12)
                return
            end
            return
        end
        if checkCollision(u44, u44, u56) then
            cleanup(u97, u12)
            return
        end
        if 25 > u47 then
            return
        end
        cleanup(u97, u12)
    end)
    task.delay(26, function() -- Line: 172 -- upvalues: cleanup (upval), u97 (ref), u12 (ref)
        cleanup(u97, u12)
    end)
end