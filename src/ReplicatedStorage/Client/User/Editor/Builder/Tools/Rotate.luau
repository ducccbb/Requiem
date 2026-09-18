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
--            File: ReplicatedStorage.Client.User.Editor.Builder.Tools.Rotate
--                              Dumped in 0.000906 seconds
--                          Bytecode version 9  |  9 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Building = require(Namespaces:WaitForChild("Building"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Signals = require(Common_2:WaitForChild("Signals"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_3:WaitForChild("Packages")
local trove = require(Packages:WaitForChild("trove"))
local Select = require(script.Parent:WaitForChild("Select"))
local u83 = trove.new()
local u85 = trove.new()
local function createModelBoundingBox(p1) -- Line: 47 -- upvalues: Workspace (val)
    local BoundingBox_2
    _, BoundingBox_2 = p1:GetBoundingBox()
    local Part = Instance.new("Part")
    Part.Size = BoundingBox_2 * Vector3.new(1.2, 1.2, 1.2)
    Part.Anchored = true
    Part.CanCollide = false
    Part.CanTouch = false
    Part.CanQuery = false
    Part.Transparency = 1
    Part.CFrame = p1:GetPivot()
    Part.Parent = Workspace:WaitForChild("Terrain")
    return Part
end
local function onShowRotateGizmos(p1, p2) -- Line: 68 -- upvalues: Signals (val), createModelBoundingBox (val), Players (val), u85 (val), Building (val), u83 (val)
    local ArcHandles, Pivot, PlayerGui, u15, v1, v2, v3
    if p2 then
        u15 = createModelBoundingBox(p1)
        PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
        Pivot = p1:GetPivot()
        ArcHandles = Instance.new("ArcHandles")
        ArcHandles.Visible = true
        ArcHandles.Adornee = u15
        ArcHandles.Color3 = Color3.fromRGB(9, 227, 18)
        ArcHandles.Axes = Axes.new(Enum.Axis.Y)
        ArcHandles.Parent = PlayerGui
        u85:Add(u15)
        u85:Add(ArcHandles)
        v1 = ArcHandles.MouseButton1Down:Connect(function() -- Line: 96 -- upvalues: Pivot (ref), p1 (val)
            Pivot = p1:GetPivot()
        end)
        v2 = ArcHandles.MouseDrag:Connect(function(a1, p2) -- Line: 100 -- upvalues: p1 (val), Pivot (ref), u15 (val)
            p1:PivotTo(Pivot * CFrame.Angles(0, p2, 0))
            u15.CFrame = p1:GetPivot()
        end)
        v3 = ArcHandles.MouseButton1Up:Connect(function() -- Line: 105 -- upvalues: Pivot (ref), p1 (val), Building (upval)
            local v1
            Pivot = p1:GetPivot()
            _, v1 = p1:GetPivot():ToOrientation()
            local v2 = math.deg(v1)
            Building.Rotate.post({id = p1:GetAttribute("id"), rotation = v2})
        end)
        u83:Add(v1)
        u83:Add(v2)
        u83:Add(v3)
        return
    end
    if p1:GetAttribute("category") == "Blueprints" then
        return Signals.Toast:Fire({message = "You cannot rotate blueprints, you must destroy and replace them.", type = "error"})
    end
    u15 = createModelBoundingBox(p1)
    PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
    Pivot = p1:GetPivot()
    ArcHandles = Instance.new("ArcHandles")
    ArcHandles.Visible = true
    ArcHandles.Adornee = u15
    ArcHandles.Color3 = Color3.fromRGB(9, 227, 18)
    ArcHandles.Axes = Axes.new(Enum.Axis.Y)
    ArcHandles.Parent = PlayerGui
    u85:Add(u15)
    u85:Add(ArcHandles)
    v1 = ArcHandles.MouseButton1Down:Connect(function() -- Line: 96 -- upvalues: Pivot (ref), p1 (val)
        Pivot = p1:GetPivot()
    end)
    v2 = ArcHandles.MouseDrag:Connect(function(a1, p2) -- Line: 100 -- upvalues: p1 (val), Pivot (ref), u15 (val)
        p1:PivotTo(Pivot * CFrame.Angles(0, p2, 0))
        u15.CFrame = p1:GetPivot()
    end)
    v3 = ArcHandles.MouseButton1Up:Connect(function() -- Line: 105 -- upvalues: Pivot (ref), p1 (val), Building (upval)
        local v1
        Pivot = p1:GetPivot()
        _, v1 = p1:GetPivot():ToOrientation()
        local v2 = math.deg(v1)
        Building.Rotate.post({id = p1:GetAttribute("id"), rotation = v2})
    end)
    u83:Add(v1)
    u83:Add(v2)
    u83:Add(v3)
end
return {
    onToolSelected = function(p1, p2) -- Line: 125 -- upvalues: u83 (val), u85 (val), Select (val), onShowRotateGizmos (val)
        u83:Clean()
        u85:Clean()
        local v1 = Select.getSelectedModel()
        if v1 then
            onShowRotateGizmos(v1, p2)
        end
        u83:Add(Select.onSelectedModelUpdated:Connect(function(p1) -- Line: 135 -- upvalues: u85 (upval), onShowRotateGizmos (upval), p2 (val)
            if not p1 then
                u85:Clean()
                return
            end
            onShowRotateGizmos(p1, p2)
        end))
        local v2 = Select.onToolSelected(p1)
        u83:Add(v2)
        u83:Add(u85)
        return u83
    end,
    onToolStepped = function(p1, p2) -- Line: 38 -- upvalues: Select (val)
        Select.onToolStepped(p1, p2)
    end,
}