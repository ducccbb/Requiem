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
--    File: ReplicatedStorage.Assets.Objects.Building Tools.Tools.Move.HandleDragging
--                              Dumped in 0.000802 seconds
--                          Bytecode version 9  |  8 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local Parent = v1.Parent.Parent.Parent
local Core = require(Parent.Core)
local Selection = Core.Selection
local Security = Core.Security
local BoundingBox = require(Parent.Core.BoundingBox)
local Libraries = Parent:WaitForChild("Libraries")
local Util = require(v1.Parent:WaitForChild("Util"))
local u35 = {}
u35.__index = u35
local u36 = {}
u36[Enum.NormalId.Top] = Vector3.new(0, 1, 0)
u36[Enum.NormalId.Bottom] = Vector3.new(0, -1, 0)
u36[Enum.NormalId.Front] = Vector3.new(0, 0, -1)
u36[Enum.NormalId.Back] = Vector3.new(0, 0, 1)
u36[Enum.NormalId.Left] = Vector3.new(-1, 0, 0)
u36[Enum.NormalId.Right] = Vector3.new(1, 0, 0)
function u35.new(p1) -- Line: 34 -- upvalues: u35 (val)
    local v1 = {IsHandleDragging = false, Tool = p1}
    return (setmetatable(v1, u35))
end
function u35:AttachHandles(p2, p3) -- Line: 52 -- upvalues: Selection (val), BoundingBox (val), Core (val), Security (val), Util (val), u36 (val), Libraries (val)
    local Handles, Maid
    if not p3 then
        if not p3 and self.Tool.Maid.AutofocusHandle then
            self.Tool.Maid.AutofocusHandle = nil
        end
    elseif not self.Tool.Maid.AutofocusHandle then
        Maid = self.Tool.Maid
        Maid.AutofocusHandle = Selection.FocusChanged:Connect(function() -- Line: 57 -- upvalues: self (val), Selection (upval)
            self:AttachHandles(Selection.Focus, true)
        end)
    end
    if self.Handles then
        self.Handles:BlacklistObstacle(BoundingBox.GetBoundingBox())
        self.Handles:SetAdornee(p2)
        return
    end
    local u38 = nil
    self.Handles = require(Libraries:WaitForChild("Handles")).new({
        Color = self.Tool.Color.Color,
        Parent = Core.UIContainer,
        Adornee = p2,
        ObstacleBlacklist = {BoundingBox.GetBoundingBox()},
        OnDragStart = function() -- Line: 74 -- upvalues: Core (upval), self (val), BoundingBox (upval), Selection (upval), u38 (ref), Security (upval)
            local v1, v2, v3
            Core.Targeting.CancelSelecting()
            self.IsHandleDragging = true
            if BoundingBox.GetBoundingBox() then
                v1, v2 = BoundingBox.CalculateExtents(Selection.Parts, BoundingBox.StaticExtents)
                self.InitialExtentsSize = v1
                self.InitialExtentsCFrame = v2
                BoundingBox.PauseMonitoring()
            end
            v1, v2, v3 = self.Tool:PrepareSelectionForDragging()
            self.InitialPartStates = v1
            self.InitialModelStates = v2
            self.InitialFocusCFrame = v3
            self.Tool:TrackChange()
            if Core.Mode == "Tool" then
                local v4 = Security.GetSelectionAreas(Selection.Parts)
                u38 = Security.GetPermissions(v4, Core.Player)
            end
        end,
        OnDrag = function(p1, p2) -- Line: 108 -- upvalues: self (val), Util (upval), Core (upval), Security (upval), Selection (upval), u38 (ref), BoundingBox (upval), u36 (upval)
            if not self.IsHandleDragging then
                return
            end
            local v1 = Util.GetIncrementMultiple(p2, self.Tool.Increment)
            self.Tool:MovePartsAlongAxesByFace(p1, v1, self.InitialPartStates, self.InitialModelStates, self.InitialFocusCFrame)
            if Core.Mode == "Tool" and Security.ArePartsViolatingAreas(Selection.Parts, Core.Player, false, u38) then
                local v2, v3
                v2, v3 = next(self.InitialPartStates)
                v2.CFrame = v3.CFrame
                Util.TranslatePartsRelativeToPart(v2, self.InitialPartStates, self.InitialModelStates)
                v1 = 0
            end
            self.Tool.DragChanged:Fire(v1)
            if self.Tool.Axes == "Global" and BoundingBox.GetBoundingBox() then
                BoundingBox.GetBoundingBox().CFrame = self.InitialExtentsCFrame + u36[p1] * v1
            end
        end,
        OnDragEnd = function() -- Line: 140 -- upvalues: self (val), Core (upval), BoundingBox (upval)
            if not self.IsHandleDragging then
                return
            end
            self.IsHandleDragging = false
            for k, v in pairs(self.InitialPartStates) do
                k:MakeJoints()
                Core.RestoreJoints(v.Joints)
                k.CanCollide = v.CanCollide
                k.Anchored = v.Anchored
            end
            self.Tool:RegisterChange()
            BoundingBox.RecalculateStaticExtents()
            BoundingBox.ResumeMonitoring()
        end,
    })
end
function u35.HideHandles(p1) -- Line: 178
    if not p1.Handles then
        return
    end
    p1.Handles = p1.Handles:Destroy()
    p1.Tool.Maid.AutofocusHandle = nil
end
return u35