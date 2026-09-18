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
--     File: ReplicatedStorage.Client.User.Equipment.Gear.Components.Winches.Default
--                               Dumped in 0.00121 seconds
--                          Bytecode version 9  |  12 functions

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
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Types = Common_2:WaitForChild("Types")
require(Types:WaitForChild("Gear"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_3:WaitForChild("Client")
local User = Client:WaitForChild("User")
local State = User:WaitForChild("State")
local ClientSettingsHandler = require(State:WaitForChild("ClientSettingsHandler"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Utilities_2 = Common_3:WaitForChild("Utilities")
require(Utilities_2:WaitForChild("Signal"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_5:WaitForChild("Common")
local Gear = require(Common_4:WaitForChild("Logger"))("Gear")
return {
    initialized = function(p1, p2) -- Line: 29 -- upvalues: Character (val), Gear (val), RunService (val), ClientSettingsHandler (val)
        local trove = p2.trove
        local u3 = nil
        local u4 = nil
        local Attachment = Instance.new("Attachment")
        local Attachment_2 = Instance.new("Attachment")
        trove:Add(Attachment)
        trove:Add(Attachment_2)
        local u19 = nil
        local RodConstraint = Instance.new("RodConstraint")
        RodConstraint.Visible = false
        trove:Add(RodConstraint)
        local function getRopeGoal() -- Line: 47 -- upvalues: p2 (val)
            local WorldPosition, WorldPosition_2, v1
            local left = p2.grapples.left
            local right = p2.grapples.right
            local goal = left.active
            if goal then
                goal = not left.busy
                if goal then
                    goal = left.goal
                end
            end
            local goal_2 = right.active
            if goal_2 then
                goal_2 = not right.busy
                if goal_2 then
                    goal_2 = right.goal
                end
            end
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
            if not goal then
                if goal then
                    v1 = WorldPosition
                elseif not goal_2 then
                    v1 = nil
                else
                    v1 = WorldPosition_2
                    if not v1 then
                        v1 = nil
                    end
                end
            elseif goal_2 then
                v1 = (WorldPosition + WorldPosition_2) / 2
            end
            if not v1 then
                return
            end
            return v1
        end
        local function updateSlackingRope() -- Line: 71 -- upvalues: Character (upval), Gear (upval), getRopeGoal (val), RodConstraint (val), Attachment_2 (val)
            local v1 = Character.getCharacter()
            if not v1 then
                Gear.warn("No character found while on update slacking rope")
                return
            end
            local v2 = getRopeGoal()
            if not v2 then
                return
            end
            RodConstraint.Length = (v1.HumanoidRootPart.Position - v2).Magnitude / 2
            Attachment_2.Position = v2
            return RodConstraint
        end
        local function onSlackingAttempt() -- Line: 91 -- upvalues: Character (upval), trove (val), Gear (upval), p2 (val), RodConstraint (val), Attachment (val), Attachment_2 (val), getRopeGoal (val), u19 (ref), RunService (upval)
            local v1 = Character.getCharacter()
            if not v1 or trove._cleaning or not (Character.isActive()) then
                Gear.warn("No character found while on slacking attempt")
                return
            end
            if p2.slacking then
                return RodConstraint
            end
            Attachment.Parent = v1.HumanoidRootPart
            Attachment_2.Parent = workspace.Terrain
            local v2 = getRopeGoal()
            if not v2 then
                return
            end
            Attachment_2.Position = v2
            local u23 = (v1.HumanoidRootPart.Position - v2).Magnitude * 0.9
            RodConstraint.Length = u23
            RodConstraint.Attachment0 = Attachment
            RodConstraint.Attachment1 = Attachment_2
            RodConstraint.Parent = v1.HumanoidRootPart
            p2.slacking = true
            local u33 = 0
            if u19 then
                u19:Disconnect()
                u19 = nil
            end
            u19 = RunService.RenderStepped:Connect(function(p1) -- Line: 140 -- upvalues: u33 (ref), getRopeGoal (upval), u19 (upval), u23 (val), RodConstraint (upval), Attachment_2 (upval)
                u33 = u33 + p1
                local v1 = getRopeGoal()
                if v1 then
                    RodConstraint.Length = u23 + (15 - u23) * (u33 / 30)
                    Attachment_2.Position = v1
                    return
                end
                if u19 then
                    u19:Disconnect()
                    u19 = nil
                end
            end)
            trove:Add(u19)
            return RodConstraint
        end
        local function onSlackingReleased() -- Line: 165 -- upvalues: p2 (val), u19 (ref), RodConstraint (val)
            p2.slacking = false
            if u19 then
                u19:Disconnect()
                u19 = nil
            end
            RodConstraint.Parent = nil
        end
        local function disconnectKeybinds() -- Line: 176 -- upvalues: u3 (ref), u4 (ref)
            if u3 then
                u3:Disconnect()
                u3 = nil
            end
            if u4 then
                u4:Disconnect()
                u4 = nil
            end
        end
        local function connectKeybinds() -- Line: 188 -- upvalues: disconnectKeybinds (val), ClientSettingsHandler (upval), u3 (ref), p2 (val), onSlackingAttempt (val), onSlackingReleased (val), u4 (ref), trove (val)
            disconnectKeybinds()
            local u5 = ClientSettingsHandler.getSettingFromName("Toggle Slacking")
            u3 = ClientSettingsHandler.onKeybindPressed("Enable Slacking"):Connect(function() -- Line: 194 -- upvalues: u5 (val), p2 (upval), onSlackingAttempt (upval), onSlackingReleased (upval)
                if not u5 then
                    if not u5 then
                        if not u5 then
                            onSlackingAttempt()
                        end
                        return
                    end
                    if p2.slacking then
                        onSlackingReleased()
                        return
                    end
                    if not u5 then
                        onSlackingAttempt()
                    end
                    return
                elseif not p2.slacking then
                    onSlackingAttempt()
                    return
                end
            end)
            u4 = ClientSettingsHandler.onKeybindReleased("Enable Slacking"):Connect(function() -- Line: 204 -- upvalues: u5 (val), onSlackingReleased (upval)
                if u5 then
                    return
                end
                onSlackingReleased()
            end)
            trove:Add(u3)
            trove:Add(u4)
        end
        trove:Add(p2.signals.grapple:Connect(function(p1, a2) -- Line: 216 -- upvalues: trove (val), p2 (val), updateSlackingRope (val), disconnectKeybinds (val), onSlackingReleased (val), u3 (ref), connectKeybinds (val)
            local v1
            if trove._cleaning then
                return
            end
            if a2 ~= "Left" then
                v1 = "Left"
            else
                v1 = "Right"
            end
            if p2.slacking then
                updateSlackingRope()
            end
            if p1.active then
                if not u3 then
                    connectKeybinds()
                end
                return
            end
            if not (p2.grapples[string.lower(v1)].active) then
                disconnectKeybinds()
                onSlackingReleased()
                return
            end
            if not u3 then
                connectKeybinds()
            end
        end))
    end,
}