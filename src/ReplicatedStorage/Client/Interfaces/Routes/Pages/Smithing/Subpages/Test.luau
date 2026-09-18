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
--     File: ReplicatedStorage.Client.Interfaces.Routes.Pages.Smithing.Subpages.Test
--                              Dumped in 0.000738 seconds
--                          Bytecode version 9  |  2 functions

local Magnitude, Position, Position_2, Position_3, huge, v1, v2, v3, v4, v5, v6, v7
script = nil
local v8 = getfenv(0)
v8.script = nil
_G.script = nil
v8 = getfenv(0)
v8.getfenv = nil
local AssetService = game:GetService("AssetService")
local u194 = AssetService:CreateEditableMeshAsync(Content.fromAssetId(134575419415916))
local v9 = AssetService:CreateEditableMeshAsync(Content.fromAssetId(92523533879481))
local v10 = AssetService:CreateMeshPartAsync(Content.fromObject(u194))
local MeshPart = Instance.new("MeshPart")
MeshPart.Anchored = true
MeshPart.Material = Enum.Material.Metal
MeshPart.Color = Color3.fromRGB(161, 157, 148)
MeshPart.Position = Vector3.new(0, 10, 0)
MeshPart.Size = Vector3.new(0.406, 0.125, 3.257)
MeshPart.Parent = workspace
local Vertices = v9:GetVertices()
local Vertices_2 = u194:GetVertices()
local v11 = Vector3.new(math.huge, math.huge, math.huge)
local v12 = Vector3.new(-math.huge, -math.huge, -math.huge)
local v13 = Vertices
local v14 = nil
local v15 = nil
for i, j in v13, v14, v15 do
    Position_3 = v9:GetPosition(j)
    v1 = math.min(v11.X, Position_3.X)
    v2 = math.min(v11.Y, Position_3.Y)
    v11 = Vector3.new(v1, v2, (math.min(v11.Z, Position_3.Z)))
    v1 = math.max(v12.X, Position_3.X)
    v2 = math.max(v12.Y, Position_3.Y)
    v12 = Vector3.new(v1, v2, (math.max(v12.Z, Position_3.Z)))
end
v13 = {}
local u207 = {}
local u208 = {}
local v16 = Vertices_2
local v17 = nil
local v18 = nil
for k, n in v16, v17, v18 do
    Position = u194:GetPosition(n)
    u208[n] = Position
    v3 = Vector3.new((Position.X - v11.X) / (v12.X - v11.X), (Position.Y - v11.Y) / (v12.Y - v11.Y), (Position.Z - v11.Z) / (v12.Z - v11.Z))
    huge = math.huge
    v4 = nil
    v5 = Vertices
    v6 = nil
    v7 = nil
    for m, i5 in v5, v6, v7 do
        Position_2 = v9:GetPosition(i5)
        Magnitude = (v3 - Vector3.new((Position_2.X - v11.X) / (v12.X - v11.X), (Position_2.Y - v11.Y) / (v12.Y - v11.Y), (Position_2.Z - v11.Z) / (v12.Z - v11.Z))).Magnitude
        if Magnitude < huge then
            huge = Magnitude
            v4 = i5
        end
    end
    v13[n] = v4
end
v16 = v13
v17 = nil
v18 = nil
for i6, i7 in v16, v17, v18 do
    u207[i6] = v9:GetPosition(i7)
    u194:SetPosition(i6, u207[i6])
end
MeshPart:ApplyMesh(v10)
task.wait(1)
local u121 = tick()
game["Run Service"].Heartbeat:Connect(function() -- Line: 80 -- upvalues: u121 (val), u207 (val), u208 (val), u194 (val)
    local v1 = tick() - u121
    local v2 = math.clamp(v1, 0, 1)
    v1 = u207
    local v3 = nil
    local v4 = nil
    for i, j in v1, v3, v4 do
        u194:SetPosition(i, j:Lerp(u208[i], v2))
    end
end)