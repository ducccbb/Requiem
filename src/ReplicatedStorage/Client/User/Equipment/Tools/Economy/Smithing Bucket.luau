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
--      File: ReplicatedStorage.Client.User.Equipment.Tools.Economy.Smithing Bucket
--                              Dumped in 0.000674 seconds
--                          Bytecode version 9  |  5 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local CollectionService = game:GetService("CollectionService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Types = Common:WaitForChild("Types")
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Utilities = Common_2:WaitForChild("Utilities")
local Character = require(Utilities:WaitForChild("Character"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Signals = require(Common_3:WaitForChild("Signals"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_4:WaitForChild("Common")
local Animations = Common_4:WaitForChild("Animations")
local Tools = Animations:WaitForChild("Tools")
local u103 = require(Tools:WaitForChild("Smithing Bucket"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_5:WaitForChild("Common")
local Observers = Common_5:WaitForChild("Observers")
local useAnimatorObserver = require(Observers:WaitForChild("useAnimatorObserver"))
local u123 = nil
local u124 = nil
return {
    equipped = function(p1) -- Line: 50 -- upvalues: Character (val), u123 (ref), useAnimatorObserver (val), u103 (val), CollectionService (val), u124 (ref), UserInputService (val), Workspace (val), Signals (val)
        Character.getCharacterAsync():andThen(function(p1) -- Line: 51 -- upvalues: u123 (upval), useAnimatorObserver (upval), u103 (upval)
            u123 = useAnimatorObserver.bind(p1.Humanoid.Animator, u103, 4)
        end)
        local u9 = RaycastParams.new()
        u9.FilterDescendantsInstances = {CollectionService:GetTagged("Character")}
        u9.FilterType = Enum.RaycastFilterType.Exclude
        u124 = UserInputService.InputBegan:Connect(function(a1, p2) -- Line: 62 -- upvalues: Workspace (upval), UserInputService (upval), u9 (val), Signals (upval), p1 (val)
            if a1.UserInputType ~= Enum.UserInputType.MouseButton1 or p2 then
                return
            end
            local MouseLocation = UserInputService:GetMouseLocation()
            local v1 = Workspace.CurrentCamera:ScreenPointToRay(MouseLocation.X, MouseLocation.Y - game:GetService("GuiService"):GetGuiInset().Y)
            local v2 = Workspace:Raycast(v1.Origin, v1.Direction * 20, u9)
            if not v2 then
                Signals.Toast:Fire({message = "Could not find a place to put the bucket.", type = "error"})
                return
            end
            if not v2 then
                p1(v2.Position)
                return
            end
            local v3 = v2.Normal:Dot((Vector3.new(0, 1, 0)))
            if v3 < 0.9 then
                Signals.Toast:Fire({message = "Could not find a place to put the bucket.", type = "error"})
                return
            end
            p1(v2.Position)
        end)
    end,
    unequipped = function() -- Line: 90 -- upvalues: u123 (ref), u124 (ref)
        if u123 then
            u123()
            u123 = nil
        end
        if u124 then
            u124:Disconnect()
            u124 = nil
        end
    end,
    data = {
        description = "A smithing bucket, which can be used to smelt ore.",
        attributes = {"Blacksmithing"},
        category = require(Types:WaitForChild("Item")).CATEGORIES.Tool,
    },
}