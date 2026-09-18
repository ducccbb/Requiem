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
--         File: ReplicatedStorage.Client.User.Equipment.Tools.Consumables.Soup
--                              Dumped in 0.000678 seconds
--                          Bytecode version 9  |  5 functions

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
local Types = Common:WaitForChild("Types")
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Cooking_2 = Common_2:WaitForChild("Cooking")
local Cooking = require(Cooking_2:WaitForChild("Cooking"))
local Utilities = script.Parent.Parent:WaitForChild("Utilities")
local FoodClient = require(Utilities:WaitForChild("FoodClient"))
local v2 = {description = "A soup which can be used to eat.", category = require(Types:WaitForChild("Item")).CATEGORIES.Consumables}
local u75 = nil
local u76 = nil
local function onSoupUse(p1) -- Line: 37 -- upvalues: FoodClient (val)
    FoodClient.eat(p1, {liquid = true})
end
return {
    equipped = function(p1, p2) -- Line: 44 -- upvalues: u76 (ref), FoodClient (val), Players (val), Cooking (val), u75 (ref), UserInputService (val), onSoupUse (val)
        local u112
        u76 = FoodClient.bindAnimations()
        local Character = Players.LocalPlayer.Character
        local Soup = Character
        if Soup then
            Soup = Character:FindFirstChild("Soup")
        end
        local Folder = Soup
        if Folder then
            Folder = Soup:FindFirstChild("Folder")
        end
        local Vegetables = Folder
        if Vegetables then
            Vegetables = Folder:FindFirstChild("Vegetables")
        end
        local meta = p2
        if meta then
            meta = p2.meta
        end
        if not Vegetables then
            u112 = p1
        elseif not meta then
            u112 = p1
        else
            local Name, v1, v2, v3
            local SoupColor = Folder:FindFirstChild("SoupColor")
            local color = meta.color
            if SoupColor and color and color[1] and color[2] and color[3] then
                SoupColor.Color = Color3.fromRGB(color[1], color[2], color[3])
            end
            local buffs = meta.buffs
            u112 = p1
            for i, j in Vegetables:GetChildren() do
                if j:IsA("BasePart") then
                    v1 = tonumber(j.Name)
                    v2 = v1
                    if v2 then
                        v2 = buffs
                        if v2 then
                            v2 = buffs[v1]
                        end
                    end
                    Name = v2
                    if Name then
                        Name = v2.Name
                    end
                    v3 = Name
                    if v3 then
                        v3 = Cooking.Colors[Name]
                    end
                    if not v3 then
                        j.Transparency = 1
                    else
                        j.Color = v3
                        j.Transparency = 0
                    end
                end
            end
        end
        u75 = UserInputService.InputBegan:Connect(function(p1) -- Line: 77 -- upvalues: onSoupUse (upval), u112 (val)
            if p1.UserInputType ~= Enum.UserInputType.MouseButton1 then
                return
            end
            onSoupUse(u112)
        end)
    end,
    unequipped = function() -- Line: 89 -- upvalues: u76 (ref), u75 (ref)
        if u76 then
            u76()
            u76 = nil
        end
        if u75 then
            u75:Disconnect()
            u75 = nil
        end
    end,
    data = v2,
}