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
--      File: ReplicatedStorage.Client.User.Editor.Universal.UserDestructionHandler
--                              Dumped in 0.000654 seconds
--                          Bytecode version 9  |  7 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local CollectionService = game:GetService("CollectionService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Signal = require(Utilities:WaitForChild("Signal"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_2:WaitForChild("Packages")
local u67 = require(Packages:WaitForChild("trove")).new()
return {
    onBeginModelDestruction = function() -- Line: 30 -- upvalues: u67 (val), Signal (val), CollectionService (val), RunService (val), UserInputService (val), Players (val)
        local getDestroyableModelRoot, v1
        local CurrentCamera = workspace.CurrentCamera
        u67:Clean()
        local SelectionBox = Instance.new("SelectionBox")
        SelectionBox.Color3 = Color3.fromRGB(255, 0, 0)
        SelectionBox.LineThickness = 0.025
        SelectionBox.SurfaceColor3 = Color3.fromRGB(255, 0, 0)
        SelectionBox.SurfaceTransparency = 0.9
        SelectionBox.Parent = workspace
        local u24 = Signal.new()
        function getDestroyableModelRoot(p1) -- Line: 48 -- upvalues: CollectionService (upval), getDestroyableModelRoot (val)
            if CollectionService:HasTag(p1, "Destroyable") then
                return p1
            end
            if p1.Parent then
                return getDestroyableModelRoot(p1.Parent)
            end
            return nil
        end
        local function onResetSelectionBox() -- Line: 60 -- upvalues: SelectionBox (val)
            SelectionBox.Adornee = nil
        end
        local v2 = RunService.RenderStepped:Connect(function() -- Line: 64 -- upvalues: UserInputService (upval), CurrentCamera (val), CollectionService (upval), getDestroyableModelRoot (val), onResetSelectionBox (val), SelectionBox (val)
            local MouseLocation = UserInputService:GetMouseLocation()
            local v1 = CurrentCamera:ViewportPointToRay(MouseLocation.X, MouseLocation.Y)
            local v2 = RaycastParams.new()
            v2.FilterDescendantsInstances = {CollectionService:GetTagged("Destroyable")}
            v2.FilterType = Enum.RaycastFilterType.Include
            local v3 = workspace:Raycast(v1.Origin, v1.Direction * 10000, v2)
            if not v3 then
                return onResetSelectionBox()
            end
            local v4 = getDestroyableModelRoot(v3.Instance)
            if not v4 then
                return onResetSelectionBox()
            end
            SelectionBox.Adornee = v4
        end)
        v1 = UserInputService.InputBegan:Connect(function(p1, p2) -- Line: 92 -- upvalues: SelectionBox (val), Players (upval), u24 (val)
            if p2 or not SelectionBox.Adornee then
                return
            end
            local v1 = Players.LocalPlayer.PlayerGui:GetGuiObjectsAtPosition(p1.Position.X, p1.Position.Y)
            local v2 = nil
            local v3 = nil
            for i, j in v1, v2, v3 do
                if j.Visible and j:GetAttribute("no_click") then
                    return
                end
            end
            if p1.UserInputType == Enum.UserInputType.MouseButton1 then
                u24:Fire(SelectionBox.Adornee)
            end
        end)
        u67:Add(v1)
        u67:Add(v2)
        u67:Add(SelectionBox)
        u67:Add(u24)
        return u24
    end,
    onEndModelDestruction = function() -- Line: 129 -- upvalues: u67 (val)
        u67:Clean()
    end,
}