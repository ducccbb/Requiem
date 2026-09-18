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
--                   File: ReplicatedStorage.Common.Utilities.Raycast
--                               Dumped in 0.00104 seconds
--                          Bytecode version 9  |  6 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Players = game:GetService("Players")
local Draw = require(script.Parent:WaitForChild("Draw"))
local u24 = false
local u29 = Color3.fromRGB(255, 60, 60)
local u34 = Color3.fromRGB(255, 165, 0)
local u39 = Color3.fromRGB(60, 255, 80)
local u44 = Color3.fromRGB(0, 200, 255)
local u49 = Color3.fromRGB(255, 255, 0)
local u54 = Color3.fromRGB(120, 120, 120)
local function debugDrawRay(p1, p2, p3, p4) -- Line: 48 -- upvalues: u24 (ref), Draw (val)
    if not u24 then
        return
    end
    Draw.line(p1, p1 + p2 * p3, p4, 0.05, 0)
end
local function debugDrawPoint(p1, p2) -- Line: 58 -- upvalues: u24 (ref), Draw (val)
    if not u24 then
        return
    end
    Draw.point(p1, p2)
end
local v2 = {}
function v2.checkForWallInfront(p1) -- Line: 108 -- upvalues: Players (val), debugDrawRay (val), u39 (val), debugDrawPoint (val), u34 (val), u29 (val), u24 (ref), u44 (val)
    local Position_2, Unit, v1, v2, v3, v4, v5, y
    local v6 = p1
    if not v6 then
        v6 = {
            camera = true,
            x = 2,
            y = 10,
            spacing = 1.5,
            treshold = 0.2,
            totalSuccessfulPoints = 20,
            maximumDistance = 5,
        }
    end
    local Character = Players.LocalPlayer.Character
    local HumanoidRootPart = Character.HumanoidRootPart
    local v7 = workspace.CurrentCamera.CFrame.LookVector * Vector3.new(1, 0, 1)
    local v8 = HumanoidRootPart.CFrame.LookVector * Vector3.new(1, 0, 1)
    Unit = if not v6.camera then v6.direction or v8 else ((v7 + v8) / 2).Unit
    local Position = HumanoidRootPart.Position
    local v9 = RaycastParams.new()
    v9.FilterType = Enum.RaycastFilterType.Exclude
    v9.FilterDescendantsInstances = {Character}
    local v10 = 0
    local v11 = -1
    local v12 = Vector3.new(0, 0, 0)
    local v13 = Vector3.new(0, 0, 0)
    local v14 = 0
    local v15 = 0
    local v16 = 0
    local x = v6.x
    local v17 = 1
    for i = -v6.x, x, v17 do
        y = v6.y
        v1 = 2
        for j = 0, y, v1 do
            v3 = CFrame.new(Position, Position + Unit)
            v5 = j * (v6.spacing or 1.5)
            v2 = v3 * CFrame.new(i * (v6.spacing or 1.5), v5, 0)
            Position_2 = v2.Position
            v4 = workspace:Raycast(Position_2, v2.LookVector * 15, v9)
            v14 = v14 + 1
            if not v4 then
                debugDrawRay(Position_2, v2.LookVector, 15, u29)
            elseif v4.Normal then
                v5 = v4.Normal:Dot(Vector3.yAxis)
                if v5 >= 0.2 then
                    v16 = v16 + 1
                    debugDrawRay(Position_2, v2.LookVector, v4.Distance, u34)
                    debugDrawPoint(v4.Position, u34)
                elseif -0.2 < v5 then
                    v10 = v10 + 1
                    v11 = math.max(v11, v4.Distance)
                    v12 = v12 + v4.Normal
                    v13 = v13 + v4.Position
                    v15 = v15 + 1
                    debugDrawRay(Position_2, v2.LookVector, v4.Distance, u39)
                    debugDrawPoint(v4.Position, u39)
                end
            end
        end
    end
    local v18 = v6.totalSuccessfulPoints or 20
    v17 = v6.maximumDistance or 5
    local v19 = if v18 <= v10 then v11 < v17 else false
    if u24 and v19 and 0 < v10 then
        debugDrawPoint(v13 / v10, u44)
    end
    return v19, v13 / v10, v12 / v10
end
function v2.checkForPointInfront(p1) -- Line: 66 -- upvalues: Players (val), u24 (ref), debugDrawRay (val), u39 (val), u29 (val), debugDrawPoint (val), u49 (val), u54 (val)
    local Unit
    local v1 = p1
    if not v1 then
        v1 = {distance = 10, camera = true}
    end
    local Character = Players.LocalPlayer.Character
    local HumanoidRootPart = Character.HumanoidRootPart
    local v2 = workspace.CurrentCamera.CFrame.LookVector * Vector3.new(1, 0, 1)
    local v3 = HumanoidRootPart.CFrame.LookVector * Vector3.new(1, 0, 1)
    Unit = if not v1.camera then v3 else ((v2 + v3) / 2).Unit
    local Position = HumanoidRootPart.Position
    local v4 = RaycastParams.new()
    v4.FilterType = Enum.RaycastFilterType.Exclude
    v4.FilterDescendantsInstances = {Character}
    local v5 = workspace:Raycast(Position, Unit * v1.distance, v4)
    if u24 then
        local v6
        local distance = v1.distance
        if not v5 then
            v6 = u29
        else
            v6 = u39
        end
        debugDrawRay(Position, Unit, distance, v6)
        if not v5 then
            debugDrawPoint(Position + Unit * v1.distance, u54)
        else
            debugDrawPoint(v5.Position, u49)
        end
    end
    local Position_2 = v5
    if Position_2 then
        Position_2 = v5.Position
    end
    local Normal = v5
    if Normal then
        Normal = v5.Normal
    end
    return v5 and true, Position_2, Normal
end
function v2.setDebug(p1) -- Line: 216 -- upvalues: u24 (ref)
    u24 = p1
end
return v2