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
--            File: ReplicatedStorage.Client.User.Editor.Builder.Tools.Select
--                              Dumped in 0.000947 seconds
--                          Bytecode version 9  |  7 functions

local getRootFromInstance
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Building = require(Namespaces:WaitForChild("Building"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Utilities = Common_2:WaitForChild("Utilities")
local Signal = require(Utilities:WaitForChild("Signal"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_3:WaitForChild("Packages")
local trove = require(Packages:WaitForChild("trove"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Chunk = Common_3:WaitForChild("Chunk")
local Zone = require(Chunk:WaitForChild("Zone"))
local u99 = Signal.new()
local World = workspace:WaitForChild("World")
local u106 = trove.new()
local u108 = RaycastParams.new()
u108.FilterDescendantsInstances = {World}
u108.FilterType = Enum.RaycastFilterType.Include
local u112 = nil
local u113 = nil
local Highlight = Instance.new("Highlight")
Highlight.FillTransparency = 1
Highlight.OutlineTransparency = 0
Highlight.OutlineColor = Color3.fromRGB(125, 197, 255)
local Highlight_2 = Instance.new("Highlight")
Highlight_2.FillTransparency = 1
Highlight_2.OutlineTransparency = 0
Highlight_2.OutlineColor = Color3.fromRGB(25, 153, 255)
function getRootFromInstance(p1) -- Line: 62 -- upvalues: getRootFromInstance (val)
    if p1:GetAttribute("root") then
        return p1
    end
    if not p1.Parent then
        return nil
    end
    return getRootFromInstance(p1.Parent)
end
return {
    onToolSelected = function(p1) -- Line: 135 -- upvalues: u106 (val), UserInputService (val), u113 (ref), Building (val), Highlight_2 (val), u112 (ref), u99 (val), Highlight (val)
        u106:Clean()
        u106:Add(UserInputService.InputBegan:Connect(function(p1, p2) -- Line: 138 -- upvalues: UserInputService (upval), u113 (upval), Building (upval), Highlight_2 (upval), u112 (upval), u99 (upval), Highlight (upval)
            if p2 then
                return
            end
            local v1 = if p1.KeyCode ~= Enum.KeyCode.Backspace then if p1.KeyCode ~= Enum.KeyCode.Delete then if p1.KeyCode == Enum.KeyCode.X then UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) else false else true else true
            if not v1 then
                if p1.UserInputType ~= Enum.UserInputType.MouseButton1 then
                    return
                end
                if u113 then
                    Highlight_2.Parent = nil
                    Highlight_2.Adornee = nil
                end
                if not u112 then
                    u113 = nil
                    u99:Fire(nil)
                    return
                end
                u113 = u112
                Highlight_2.Parent = u113
                Highlight_2.Adornee = u113
                u99:Fire(u113)
                if Highlight.Adornee ~= u113 then
                    return
                end
                Highlight.Parent = nil
                Highlight.Adornee = nil
                return
            elseif u113 then
                Building.Delete.post(u113:GetAttribute("id") or 0)
                return
            end
        end))
        return u106
    end,
    onToolStepped = function(p1, p2) -- Line: 79 -- upvalues: Players (val), UserInputService (val), u108 (val), getRootFromInstance (val), Zone (val), u112 (ref), u113 (ref), Highlight (val)
        local Mouse = Players.LocalPlayer:GetMouse()
        local MouseLocation = UserInputService:GetMouseLocation()
        local v1 = workspace.CurrentCamera:ViewportPointToRay(MouseLocation.X, MouseLocation.Y)
        local v2 = v1.Direction * 500
        local v3 = workspace:Raycast(v1.Origin, v2, u108)
        local v4 = v3
        if v4 then
            v4 = getRootFromInstance(v3.Instance)
        end
        local Attribute = v4
        if Attribute then
            Attribute = v4:GetAttribute("zone")
        end
        if not Attribute then
            if v4 ~= u112 then
                if u112 and u112 ~= u113 then
                    Highlight.Parent = nil
                    Highlight.Adornee = nil
                end
                u112 = v4
                if u112 and u112 ~= u113 then
                    Highlight.Parent = u112
                    Highlight.Adornee = u112
                end
            end
            if u112 then
                Mouse.Icon = "rbxasset://textures/Cursors/KeyboardMouse/ArrowCursor.png"
                return
            end
            Mouse.Icon = ""
            return
        elseif not p2 then
            v2 = Zone.getZoneFromId(Attribute)
            if not v2 or not (Zone.canAccessZone(v2)) then
                return
            end
        end
    end,
    onResetTool = function() -- Line: 200 -- upvalues: Players (val), u99 (val), u113 (ref), u112 (ref), Highlight (val), Highlight_2 (val)
        local Mouse = Players.LocalPlayer:GetMouse()
        u99:Fire(nil)
        u113 = nil
        u112 = nil
        Highlight.Parent = nil
        Highlight.Adornee = nil
        Highlight_2.Parent = nil
        Highlight_2.Adornee = nil
        Mouse.Icon = ""
    end,
    onSelectedModelUpdated = u99,
    getSelectedModel = function() -- Line: 192 -- upvalues: u113 (ref)
        return u113
    end,
}