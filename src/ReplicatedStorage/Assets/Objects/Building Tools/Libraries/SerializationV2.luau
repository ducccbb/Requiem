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
--    File: ReplicatedStorage.Assets.Objects.Building Tools.Libraries.SerializationV2
--                               Dumped in 0.00200 seconds
--                          Bytecode version 9  |  3 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
v1 = {}
Serialization = v1
local SupportLibrary = require(script.Parent.Parent.Libraries.SupportLibrary)
SupportLibrary.ImportServices()
local u21 = {
    Part = 0,
    WedgePart = 1,
    CornerWedgePart = 2,
    VehicleSeat = 3,
    Seat = 4,
    TrussPart = 5,
    SpecialMesh = 6,
    Texture = 7,
    Decal = 8,
    PointLight = 9,
    SpotLight = 10,
    SurfaceLight = 11,
    Smoke = 12,
    Fire = 13,
    Sparkles = 14,
    Model = 15,
}
local u22 = {
    Part = "Part",
    WedgePart = "Wedge",
    CornerWedgePart = "CornerWedge",
    VehicleSeat = "VehicleSeat",
    Seat = "Seat",
    TrussPart = "Truss",
    SpecialMesh = "Mesh",
    Texture = "Texture",
    Decal = "Decal",
    PointLight = "PointLight",
    SpotLight = "SpotLight",
    SurfaceLight = "SurfaceLight",
    Smoke = "Smoke",
    Fire = "Fire",
    Sparkles = "Sparkles",
    Model = "Model",
}
function Serialization.SerializeModel(p1) -- Line: 53 -- upvalues: u21 (val), SupportLibrary (val), u22 (val)
    local Name, Name_2, Name_3, Name_4, Name_5, Name_6, Name_7, Name_8, v1, v2
    local v3 = {}
    for i, v in ipairs(p1) do
        if not (u21[v.ClassName]) then
            v2 = nil
        else
            v2 = v
        end
        table.insert(v3, v2)
    end
    local v4 = v3
    local v5 = SupportLibrary.FlipTable(v4)
    local v6 = {Version = 2, Items = {}}
    for k, i2 in pairs(v4) do
        if i2:IsA("BasePart") then
            v2 = {u21[i2.ClassName], v5[i2.Parent] or 0}
            if i2.Name ~= u22[i2.ClassName] then
                Name = i2.Name
            else
                Name = ""
            end
            v2[3] = Name
            v2[4] = i2.Size.X
            v2[5] = i2.Size.Y
            v2[6] = i2.Size.Z
            SupportLibrary.ConcatTable(v2, {i2.CFrame:components()})
            v2[19] = i2.BrickColor.Number
            v2[20] = i2.Material.Value
            if not i2.Anchored then
                v1 = 0
            else
                v1 = 1
            end
            v2[21] = v1
            if not i2.CanCollide then
                v1 = 0
            else
                v1 = 1
            end
            v2[22] = v1
            v2[23] = i2.Reflectance
            v2[24] = i2.Transparency
            v2[25] = i2.TopSurface.Value
            v2[26] = i2.BottomSurface.Value
            v2[27] = i2.FrontSurface.Value
            v2[28] = i2.BackSurface.Value
            v2[29] = i2.LeftSurface.Value
            v2[30] = i2.RightSurface.Value
            v6.Items[k] = v2
        end
        if i2.ClassName == "Part" then
            v2 = v6.Items[k]
            v2[31] = i2.Shape.Value
        end
        if i2.ClassName == "VehicleSeat" then
            v2 = v6.Items[k]
            v2[31] = i2.MaxSpeed
            v2[32] = i2.Torque
            v2[33] = i2.TurnSpeed
        end
        if i2.ClassName == "TrussPart" then
            v2 = v6.Items[k]
            v2[31] = i2.Style.Value
        end
        if i2.ClassName == "SpecialMesh" then
            v2 = {u21[i2.ClassName], v5[i2.Parent] or 0}
            if i2.Name ~= u22[i2.ClassName] then
                Name_2 = i2.Name
            else
                Name_2 = ""
            end
            v2[3] = Name_2
            v2[4] = i2.MeshType.Value
            v2[5] = i2.MeshId
            v2[6] = i2.TextureId
            v2[7] = i2.Offset.X
            v2[8] = i2.Offset.Y
            v2[9] = i2.Offset.Z
            v2[10] = i2.Scale.X
            v2[11] = i2.Scale.Y
            v2[12] = i2.Scale.Z
            v2[13] = i2.VertexColor.X
            v2[14] = i2.VertexColor.Y
            v2[15] = i2.VertexColor.Z
            v6.Items[k] = v2
        end
        if i2:IsA("Decal") then
            v2 = {u21[i2.ClassName], v5[i2.Parent] or 0}
            if i2.Name ~= u22[i2.ClassName] then
                Name_3 = i2.Name
            else
                Name_3 = ""
            end
            v2[3] = Name_3
            v2[4] = i2.Texture
            v2[5] = i2.Transparency
            v2[6] = i2.Face.Value
            v6.Items[k] = v2
        end
        if i2.ClassName == "Texture" then
            v2 = v6.Items[k]
            v2[7] = i2.StudsPerTileU
            v2[8] = i2.StudsPerTileV
        end
        if i2:IsA("Light") then
            v2 = {u21[i2.ClassName], v5[i2.Parent] or 0}
            if i2.Name ~= u22[i2.ClassName] then
                Name_4 = i2.Name
            else
                Name_4 = ""
            end
            v2[3] = Name_4
            v2[4] = i2.Brightness
            v2[5] = i2.Color.r
            v2[6] = i2.Color.g
            v2[7] = i2.Color.b
            if not i2.Enabled then
                v1 = 0
            else
                v1 = 1
            end
            v2[8] = v1
            if not i2.Shadows then
                v1 = 0
            else
                v1 = 1
            end
            v2[9] = v1
            v6.Items[k] = v2
        end
        if i2.ClassName == "PointLight" then
            v2 = v6.Items[k]
            v2[10] = i2.Range
        end
        if i2.ClassName == "SpotLight" then
            v2 = v6.Items[k]
            v2[10] = i2.Range
            v2[11] = i2.Angle
            v2[12] = i2.Face.Value
        end
        if i2.ClassName == "SurfaceLight" then
            v2 = v6.Items[k]
            v2[10] = i2.Range
            v2[11] = i2.Angle
            v2[12] = i2.Face.Value
        end
        if i2.ClassName == "Smoke" then
            v2 = {u21[i2.ClassName], v5[i2.Parent] or 0}
            if i2.Name ~= u22[i2.ClassName] then
                Name_5 = i2.Name
            else
                Name_5 = ""
            end
            v2[3] = Name_5
            if not i2.Enabled then
                v1 = 0
            else
                v1 = 1
            end
            v2[4] = v1
            v2[5] = i2.Color.r
            v2[6] = i2.Color.g
            v2[7] = i2.Color.b
            v2[8] = i2.Size
            v2[9] = i2.RiseVelocity
            v2[10] = i2.Opacity
            v6.Items[k] = v2
        end
        if i2.ClassName == "Fire" then
            v2 = {u21[i2.ClassName], v5[i2.Parent] or 0}
            if i2.Name ~= u22[i2.ClassName] then
                Name_6 = i2.Name
            else
                Name_6 = ""
            end
            v2[3] = Name_6
            if not i2.Enabled then
                v1 = 0
            else
                v1 = 1
            end
            v2[4] = v1
            v2[5] = i2.Color.r
            v2[6] = i2.Color.g
            v2[7] = i2.Color.b
            v2[8] = i2.SecondaryColor.r
            v2[9] = i2.SecondaryColor.g
            v2[10] = i2.SecondaryColor.b
            v2[11] = i2.Heat
            v2[12] = i2.Size
            v6.Items[k] = v2
        end
        if i2.ClassName == "Sparkles" then
            v2 = {u21[i2.ClassName], v5[i2.Parent] or 0}
            if i2.Name ~= u22[i2.ClassName] then
                Name_7 = i2.Name
            else
                Name_7 = ""
            end
            v2[3] = Name_7
            if not i2.Enabled then
                v1 = 0
            else
                v1 = 1
            end
            v2[4] = v1
            v2[5] = i2.SparkleColor.r
            v2[6] = i2.SparkleColor.g
            v2[7] = i2.SparkleColor.b
            v6.Items[k] = v2
        end
        if i2.ClassName == "Model" then
            v2 = {u21[i2.ClassName], v5[i2.Parent] or 0}
            if i2.Name ~= u22[i2.ClassName] then
                Name_8 = i2.Name
            else
                Name_8 = ""
            end
            v2[3] = Name_8
            if not i2.PrimaryPart then
                v1 = 0
            else
                v1 = v5[i2.PrimaryPart]
            end
            v2[4] = v1
            v6.Items[k] = v2
        end
        if k % 100 == 0 then
            wait(0.01)
        end
    end
    return HttpService:JSONEncode(v6)
end
function Serialization.InflateBuildData(p1) -- Line: 249 -- upvalues: u21 (val), SupportLibrary (val), u22 (val)
    local Fire, Smoke, Sparkles, SpecialMesh, v1, v2
    local v3 = {}
    local v4 = {}
    local v5 = p1
    for i, v in ipairs(p1.Items) do
        if v[1] == u21.Part then
            v1 = Instance.new(SupportLibrary.FindTableOccurrence(u21, v[1]))
            v1.Size = Vector3.new(unpack(SupportLibrary.Slice(v, 4, 6)))
            v1.CFrame = CFrame.new(unpack(SupportLibrary.Slice(v, 7, 18)))
            v1.BrickColor = BrickColor.new(v[19])
            v1.Material = v[20]
            v2 = v[21] == 1
            v1.Anchored = v2
            v2 = v[22] == 1
            v1.CanCollide = v2
            v1.Reflectance = v[23]
            v1.Transparency = v[24]
            v1.TopSurface = v[25]
            v1.BottomSurface = v[26]
            v1.FrontSurface = v[27]
            v1.BackSurface = v[28]
            v1.LeftSurface = v[29]
            v1.RightSurface = v[30]
            v4[i] = v1
        elseif v[1] ~= u21.WedgePart and v[1] ~= u21.CornerWedgePart and v[1] ~= u21.VehicleSeat and v[1] ~= u21.Seat and v[1] ~= u21.TrussPart then
        end
        if v[1] == u21.Part then
            v4[i].Shape = v[31]
        end
        if v[1] == u21.VehicleSeat then
            v1 = v4[i]
            v1.MaxSpeed = v[31]
            v1.Torque = v[32]
            v1.TurnSpeed = v[33]
        end
        if v[1] == u21.TrussPart then
            v4[i].Style = v[31]
        end
        if v[1] == u21.SpecialMesh then
            SpecialMesh = Instance.new("SpecialMesh")
            SpecialMesh.MeshType = v[4]
            SpecialMesh.MeshId = v[5]
            SpecialMesh.TextureId = v[6]
            SpecialMesh.Offset = Vector3.new(unpack(SupportLibrary.Slice(v, 7, 9)))
            SpecialMesh.Scale = Vector3.new(unpack(SupportLibrary.Slice(v, 10, 12)))
            SpecialMesh.VertexColor = Vector3.new(unpack(SupportLibrary.Slice(v, 13, 15)))
            v4[i] = SpecialMesh
        end
        if v[1] == u21.Decal then
            v1 = Instance.new(SupportLibrary.FindTableOccurrence(u21, v[1]))
            v1.Texture = v[4]
            v1.Transparency = v[5]
            v1.Face = v[6]
            v4[i] = v1
        elseif v[1] ~= u21.Texture then
        end
        if v[1] == u21.Texture then
            v1 = v4[i]
            v1.StudsPerTileU = v[7]
            v1.StudsPerTileV = v[8]
        end
        if v[1] == u21.PointLight then
            v1 = Instance.new(SupportLibrary.FindTableOccurrence(u21, v[1]))
            v1.Brightness = v[4]
            v1.Color = Color3.new(unpack(SupportLibrary.Slice(v, 5, 7)))
            v2 = v[8] == 1
            v1.Enabled = v2
            v2 = v[9] == 1
            v1.Shadows = v2
            v4[i] = v1
        elseif v[1] ~= u21.SpotLight and v[1] ~= u21.SurfaceLight then
        end
        if v[1] == u21.PointLight then
            v4[i].Range = v[10]
        end
        if v[1] == u21.SpotLight then
            v1 = v4[i]
            v1.Range = v[10]
            v1.Angle = v[11]
            v1.Face = v[12]
        end
        if v[1] == u21.SurfaceLight then
            v1 = v4[i]
            v1.Range = v[10]
            v1.Angle = v[11]
            v1.Face = v[12]
        end
        if v[1] == u21.Smoke then
            Smoke = Instance.new("Smoke")
            v2 = v[4] == 1
            Smoke.Enabled = v2
            Smoke.Color = Color3.new(unpack(SupportLibrary.Slice(v, 5, 7)))
            Smoke.Size = v[8]
            Smoke.RiseVelocity = v[9]
            Smoke.Opacity = v[10]
            v4[i] = Smoke
        end
        if v[1] == u21.Fire then
            Fire = Instance.new("Fire")
            v2 = v[4] == 1
            Fire.Enabled = v2
            Fire.Color = Color3.new(unpack(SupportLibrary.Slice(v, 5, 7)))
            Fire.SecondaryColor = Color3.new(unpack(SupportLibrary.Slice(v, 8, 10)))
            Fire.Heat = v[11]
            Fire.Size = v[12]
            v4[i] = Fire
        end
        if v[1] == u21.Sparkles then
            Sparkles = Instance.new("Sparkles")
            v2 = v[4] == 1
            Sparkles.Enabled = v2
            Sparkles.SparkleColor = Color3.new(unpack(SupportLibrary.Slice(v, 5, 7)))
            v4[i] = Sparkles
        end
        if v[1] == u21.Model then
            v4[i] = Instance.new("Model")
        end
    end
    for k, i2 in pairs(v5.Items) do
        v1 = v4[k]
        if v1 and i2[1] <= 15 then
            if i2[3] ~= "" then
                v2 = i2[3]
            else
                v2 = u22[v1.ClassName]
            end
            v1.Name = v2
            if i2[2] ~= 0 then
                v1.Parent = v4[i2[2]]
            else
                table.insert(v3, v1)
            end
        end
        if v1 and i2[1] == 15 then
            if i2[4] == 0 then
                v2 = nil
            else
                v2 = v4[i2[4]]
            end
            v1.PrimaryPart = v2
        end
    end
    return v3
end
return Serialization