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
--       File: ReplicatedStorage.Client.User.Equipment.Tools.Administration.Titan
--                              Dumped in 0.000511 seconds
--                          Bytecode version 9  |  6 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Types = Common:WaitForChild("Types")
local u52 = nil
local u53 = nil
local u54 = nil
local v2 = {
    description = "An administration tool, which can be used to create a titan.",
    attributes = {"Administration", "Soul Bound", "Entity Spawner"},
    category = require(Types:WaitForChild("Item")).CATEGORIES.Administration,
}
local function onTitanPlaced(p1) -- Line: 42 -- upvalues: u54 (ref)
    p1(u54:GetPivot().Position)
end
return {
    equipped = function(p1) -- Line: 49 -- upvalues: u54 (ref), ReplicatedStorage (val), Players (val), u52 (ref), UserInputService (val), onTitanPlaced (val), u53 (ref), RunService (val)
        u54 = ReplicatedStorage.Assets.Objects.Spawner:Clone()
        u54.Parent = workspace
        local Mouse = Players.LocalPlayer:GetMouse()
        Mouse.TargetFilter = u54
        u52 = UserInputService.InputBegan:Connect(function(a1) -- Line: 56 -- upvalues: onTitanPlaced (upval), p1 (val)
            if a1.UserInputType ~= Enum.UserInputType.MouseButton1 then
                return
            end
            onTitanPlaced(p1)
        end)
        u53 = RunService.RenderStepped:Connect(function() -- Line: 64 -- upvalues: Mouse (val), u54 (upval)
            local Hit = Mouse.Hit
            if not Hit then
                return
            end
            u54:PivotTo(CFrame.new(Hit.Position))
        end)
    end,
    unequipped = function() -- Line: 78 -- upvalues: u52 (ref), u53 (ref), u54 (ref)
        if not u52 or not u53 then
            return
        end
        u54:Destroy()
        u53:Disconnect()
        u52:Disconnect()
        u52 = nil
        u53 = nil
    end,
    data = v2,
}