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
--File: ReplicatedStorage.Client.Progression.Proficiencies.Proficiencies.Peacekeeper.Guillotine
--                              Dumped in 0.000906 seconds
--                          Bytecode version 9  |  4 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Character = require(Utilities:WaitForChild("Character"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_2:WaitForChild("Client")
local User = Client:WaitForChild("User")
local Equipment = User:WaitForChild("Equipment")
local Gear = Equipment:WaitForChild("Gear")
local ClientGearHandler = require(Gear:WaitForChild("ClientGearHandler"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_3:WaitForChild("Client")
local User_2 = Client_2:WaitForChild("User")
local State = User_2:WaitForChild("State")
local ClientStateHandler = require(State:WaitForChild("ClientStateHandler"))
local States = ClientStateHandler.States
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_4:WaitForChild("Common")
local Utilities_2 = Common_2:WaitForChild("Utilities")
local useNumberEasing = require(Utilities_2:WaitForChild("useNumberEasing"))
local v2 = {
    settings = {
        blades = true,
        blocked_states = {
            States.GEAR_SWING,
            States.CLASHING,
            States.STUNNED,
            States.PARRYING,
            States.WALL_HANGING,
        },
    },
}
function v2.requested(p1, p2) -- Line: 48 -- upvalues: Character (val), useNumberEasing (val), ClientGearHandler (val), ClientStateHandler (val), States (val), RunService (val)
    local u7, u8, v1
    local u4 = Character.getCharacter()
    if not u4 then
        return
    end
    u7, u8, v1 = useNumberEasing(1)
    local u12 = ClientGearHandler.getGearState()
    if not u12 then
        return
    end
    local u18 = 1.5 - (workspace:GetServerTimeNow() - p1)
    ClientStateHandler.updateState(States.GEAR_SWING, true)
    local UpVector = u4.HumanoidRootPart.CFrame.UpVector
    local AssemblyLinearVelocity = u4.HumanoidRootPart.AssemblyLinearVelocity
    if 100 < AssemblyLinearVelocity.Magnitude then
        AssemblyLinearVelocity = AssemblyLinearVelocity.Unit * 100
    end
    local u34 = 0
    local u35 = false
    local u36 = nil
    task.delay(u18, function() -- Line: 82 -- upvalues: u8 (val)
        u8(8, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out))
    end)
    u12.signals.clearMomentum:Fire()
    local v2 = RunService.RenderStepped:Connect(function(p1) -- Line: 91 -- upvalues: u34 (ref), u18 (val), u12 (val), u36 (ref), UpVector (ref), u4 (val), u35 (ref), AssemblyLinearVelocity (ref), u7 (val)
        u34 = u34 + p1
        if u18 <= u34 then
            local left = u12.grapples.left
            local right = u12.grapples.right
            local active = left
            if active then
                active = left.active
            end
            local active_2 = right
            if active_2 then
                active_2 = right.active
            end
            if active then
                local WorldPosition, WorldPosition_2, v1
                if not left.attachment then
                    WorldPosition = left.goal
                else
                    WorldPosition = left.attachment.WorldPosition
                end
                if not right.attachment then
                    WorldPosition_2 = right.goal
                else
                    WorldPosition_2 = right.attachment.WorldPosition
                end
                local goal = active
                if goal then
                    goal = not left.busy
                    if goal then
                        goal = left.goal
                    end
                end
                local goal_2 = active_2
                if goal_2 then
                    goal_2 = not right.busy
                    if goal_2 then
                        goal_2 = right.goal
                    end
                end
                if not goal then
                    if goal then
                        v1 = WorldPosition
                    elseif not goal_2 then
                        v1 = nil
                    else
                        v1 = WorldPosition_2
                    end
                elseif goal_2 then
                    v1 = (WorldPosition + WorldPosition_2) / 2
                end
                if not v1 then
                    u36 = nil
                    UpVector = workspace.CurrentCamera.CFrame.lookVector
                else
                    u36 = v1
                    UpVector = (v1 - u4.HumanoidRootPart.Position).Unit
                end
            elseif not active_2 then
                u36 = nil
                UpVector = workspace.CurrentCamera.CFrame.lookVector
            end
        end
        if 1.8 <= u34 and not u35 then
            u35 = true
            u12.signals.simulateBladeSwing:Fire(0.4)
        end
        local v2 = if u36 then math.clamp((u36 - u4.HumanoidRootPart.Position).Magnitude / 100, 0, 2) * 0.9 + 0.1 else 1
        u4.HumanoidRootPart.AssemblyLinearVelocity = AssemblyLinearVelocity + UpVector * 50 * u7() * v2
    end)
    task.wait(2)
    v2:Disconnect()
    v1()
    task.wait(1)
    ClientStateHandler.updateState(States.GEAR_SWING, false)
end
return v2