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
--                    File: ReplicatedStorage.Common.Utilities.Camera
--                              Dumped in 0.000349 seconds
--                          Bytecode version 9  |  2 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local CollectionService = game:GetService("CollectionService")
local Character = require(script.Parent:WaitForChild("Character"))
return {
    isVectorWithinView = function(p1, p2, p3) -- Line: 18 -- upvalues: Character (val), CollectionService (val)
        local v1, v2
        local v3 = Character.getCharacter()
        if not v3 then
            return false
        end
        local HumanoidRootPart = v3:FindFirstChild("HumanoidRootPart")
        if not HumanoidRootPart or not (p3 or 600 >= (HumanoidRootPart.Position - p1).Magnitude) then
            return false
        end
        local CurrentCamera = workspace.CurrentCamera
        local v4 = Vector2.new(CurrentCamera.ViewportSize.X / 2, CurrentCamera.ViewportSize.Y / 2)
        v1, v2 = CurrentCamera:WorldToScreenPoint(p1)
        if not v2 or not (p2 or 600 >= (Vector2.new(v1.X, v1.Y) - v4).Magnitude) then
            return false
        end
        local v5 = RaycastParams.new()
        v5.FilterType = Enum.RaycastFilterType.Exclude
        v5.FilterDescendantsInstances = {v3, CollectionService:GetTagged("Alive")}
        local v6 = workspace:Raycast(CurrentCamera.CFrame.Position, (p1 - CurrentCamera.CFrame.Position).Unit * (p3 or 600), v5)
        if not v6 or not v6.Position then
            return true
        end
        if 30 < (v6.Position - p1).Magnitude then
            return false
        end
        return true
    end,
}