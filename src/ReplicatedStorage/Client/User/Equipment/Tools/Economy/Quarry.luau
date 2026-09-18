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
--          File: ReplicatedStorage.Client.User.Equipment.Tools.Economy.Quarry
--                              Dumped in 0.000521 seconds
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
local u32 = nil
local u33 = nil
local u34 = nil
local u36 = tick()
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Types = Common:WaitForChild("Types")
local v2 = {
    description = "An administration tool, which can be used to create a quarry.",
    attributes = {"Administration", "Soul Bound"},
    category = require(Types:WaitForChild("Item")).CATEGORIES.Administration,
}
local function onQuarryPlaced(p1) -- Line: 44 -- upvalues: u36 (ref), u34 (ref)
    local v1 = tick() - u36
    if v1 < 1 then
        return
    end
    u36 = tick()
    p1(u34:GetPivot().Position)
end
return {
    equipped = function(p1) -- Line: 56 -- upvalues: u34 (ref), ReplicatedStorage (val), Players (val), u32 (ref), UserInputService (val), onQuarryPlaced (val), u33 (ref), RunService (val)
        u34 = ReplicatedStorage.Assets.Objects.Quarry:Clone()
        u34.Parent = workspace
        local Mouse = Players.LocalPlayer:GetMouse()
        Mouse.TargetFilter = u34
        u32 = UserInputService.InputBegan:Connect(function(a1) -- Line: 63 -- upvalues: onQuarryPlaced (upval), p1 (val)
            if a1.UserInputType ~= Enum.UserInputType.MouseButton1 then
                return
            end
            onQuarryPlaced(p1)
        end)
        u33 = RunService.RenderStepped:Connect(function() -- Line: 71 -- upvalues: Mouse (val), u34 (upval)
            local Hit = Mouse.Hit
            if not Hit then
                return
            end
            u34:PivotTo(CFrame.new(Hit.Position))
        end)
    end,
    unequipped = function() -- Line: 85 -- upvalues: u32 (ref), u33 (ref), u34 (ref)
        if not u32 or not u33 then
            return
        end
        u34:Destroy()
        u33:Disconnect()
        u32:Disconnect()
        u32 = nil
        u33 = nil
    end,
    data = v2,
}