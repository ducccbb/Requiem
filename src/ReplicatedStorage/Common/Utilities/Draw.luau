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
--                     File: ReplicatedStorage.Common.Utilities.Draw
--                               Dumped in 0.00238 seconds
--                          Bytecode version 9  |  13 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Workspace = game:GetService("Workspace")
local function Line(p1, p2, p3, p4, p5) -- Line: 94 -- upvalues: Workspace (val)
    local v1, v2
    if typeof(p1) ~= "Vector3" then
        v1 = p1
    else
        v1 = Instance.new("Attachment")
        v1.WorldPosition = p1
        v1.Parent = Workspace.Terrain
    end
    if typeof(p2) ~= "Vector3" then
        v2 = p2
    else
        v2 = Instance.new("Attachment")
        v2.WorldPosition = p2
        v2.Parent = Workspace.Terrain
    end
    local Beam = Instance.new("Beam")
    Beam.Attachment0 = v1
    Beam.Attachment1 = v2
    Beam.FaceCamera = true
    local v3 = p3
    if not v3 then
        v3 = Color3.fromRGB(255, 0, 0)
    end
    Beam.Color = ColorSequence.new(v3)
    Beam.Width0 = p4 or 0.1
    Beam.Width1 = p4 or 0.1
    Beam.Segments = 20
    Beam.Transparency = NumberSequence.new(p5 or 0)
    Beam.Parent = Workspace
    return Beam
end
local v2 = {
    line = Line,
    point = function(p1, p2) -- Line: 51 -- upvalues: Workspace (val)
        local Part = Instance.new("Part")
        Part.Size = Vector3.new(1, 1, 1)
        Part.Position = p1
        Part.Anchored = true
        Part.CanCollide = false
        Part.Transparency = 0.5
        local v1 = p2
        if not v1 then
            v1 = Color3.fromRGB(255, 0, 0)
        end
        Part.BrickColor = BrickColor.new(v1)
        Part.CanQuery = false
        Part.CanTouch = false
        Part.Shape = Enum.PartType.Ball
        Part.Parent = Workspace
        task.delay(1, function() -- Line: 65 -- upvalues: Part (val)
            Part:Destroy()
        end)
        return Part
    end,
}
function v2.circle(p1, p2, p3, p4, p5) -- Line: 213 -- upvalues: Workspace (val), Line (val)
    local Position, v1, v2, v3, v4, v5, v6, v7
    local Folder = Instance.new("Folder")
    Folder.Name = "__CircleFolder"
    Folder.Parent = Workspace
    local v8 = RaycastParams.new()
    v8.FilterDescendantsInstances = {Workspace}
    v8.IgnoreWater = true
    local v9 = {}
    local v10 = 35
    local v11 = 1
    v2, v1 = p2, p1
    for i = 0, v10, v11 do
        v3 = i / 36 * math.pi * 2
        v6 = v2 * math.cos(v3)
        v4 = v1 + Vector3.new(v6, 30, v2 * math.sin(v3))
        v7 = Vector3.new(0, -1000, 0)
        v5 = Workspace:Raycast(v4, v7, v8)
        if not v5 then
            v7 = v2 * math.cos(v3)
            Position = v1 + Vector3.new(v7, 0, v2 * math.sin(v3))
        else
            Position = v5.Position
        end
        v9[i + 1] = Position
    end
    v10 = 36
    v11 = 1
    for j = 1, v10, v11 do
        Line(v9[j], v9[j % 36 + 1], v12, v13, v14).Parent = Folder
    end
    return Folder
end
function v2.bezier(p1) -- Line: 256 -- upvalues: Workspace (val), Line (val)
    local v1, v2
    local PathBySegmentLength = p1:GetPathBySegmentLength(10)
    local Folder = Instance.new("Folder")
    Folder.Name = "__BezierFolder"
    Folder.Parent = Workspace
    local v3 = #PathBySegmentLength
    local v4 = 1
    for i = 1, v3, v4 do
        v2 = PathBySegmentLength[i + 1]
        if v2 then
            v1 = Color3.fromRGB(255, 0, 0)
            Line(PathBySegmentLength[i], v2, v1, 0.5, 0.5).Parent = Folder
        end
    end
end
function v2.sphere(p1) -- Line: 73
    local v1 = p1.diameter or 1
    local Part = Instance.new("Part")
    Part.Name = p1.name or "DebugSphere"
    Part.Shape = Enum.PartType.Ball
    Part.Size = Vector3.one * v1
    Part.Anchored = true
    Part.CanCollide = false
    Part.CanQuery = false
    Part.CanTouch = false
    Part.CastShadow = p1.castShadow or false
    local material = p1.material
    if not material then
        material = Enum.Material.Neon
    end
    Part.Material = material
    local color = p1.color
    if not color then
        color = Color3.fromRGB(255, 60, 40)
    end
    Part.Color = color
    Part.Transparency = p1.transparency or 0.15
    if p1.position then
        Part.CFrame = CFrame.new(p1.position)
    end
    Part.Parent = p1.parent
    return Part
end
function v2.segmentBeam(p1) -- Line: 131
    local faceCamera, u10, u14, v1, v2
    local Folder = Instance.new("Folder")
    Folder.Name = p1.name or "SegmentBeam"
    Folder.Parent = p1.parent
    local function endpointAt(p1) -- Line: 136 -- upvalues: Folder (val)
        local Part = Instance.new("Part")
        Part.Name = "BeamEnd"
        Part.Size = Vector3.one * 0.05
        Part.Anchored = true
        Part.CanCollide = false
        Part.CanQuery = false
        Part.CanTouch = false
        Part.CastShadow = false
        Part.Transparency = 1
        Part.CFrame = CFrame.new(p1)
        Part.Parent = Folder
        local Attachment = Instance.new("Attachment")
        Attachment.Parent = Part
        return Part, Attachment
    end
    u10, v1 = endpointAt(Vector3.zero)
    u14, v2 = endpointAt(Vector3.xAxis)
    local Beam = Instance.new("Beam")
    Beam.Name = "Beam"
    Beam.Attachment0 = v1
    Beam.Attachment1 = v2
    if p1.faceCamera ~= nil then
        faceCamera = p1.faceCamera
    else
        faceCamera = true
    end
    Beam.FaceCamera = faceCamera
    Beam.Width0 = p1.width or 0.12
    Beam.Width1 = p1.width or 0.12
    local color = p1.color
    if not color then
        color = Color3.fromRGB(255, 90, 40)
    end
    Beam.Color = ColorSequence.new(color)
    Beam.Transparency = NumberSequence.new(p1.transparency or 0.3)
    Beam.Parent = Folder
    return {
        folder = Folder,
        setEndpoints = function(p1, p2) -- Line: 172 -- upvalues: u10 (val), u14 (val)
            u10.CFrame = CFrame.new(p1)
            u14.CFrame = CFrame.new(p2)
        end,
        destroy = function() -- Line: 166 -- upvalues: Folder (val)
            Folder:Destroy()
        end,
    }
end
function v2.directionBar(p1) -- Line: 181
    local u2 = p1.thickness or 0.1
    local Part = Instance.new("Part")
    Part.Name = p1.name or "DirectionBar"
    Part.Anchored = true
    Part.CanCollide = false
    Part.CanQuery = false
    Part.CanTouch = false
    Part.CastShadow = false
    local material = p1.material
    if not material then
        material = Enum.Material.Neon
    end
    Part.Material = material
    local color = p1.color
    if not color then
        color = Color3.fromRGB(120, 255, 140)
    end
    Part.Color = color
    Part.Transparency = p1.transparency or 0.15
    Part.Size = Vector3.new(u2, u2, p1.length or 2)
    Part.Parent = p1.parent
    return {
        part = Part,
        setFromOriginAlong = function(p1, p2, p3) -- Line: 199 -- upvalues: Part (val), u2 (val)
            if p3 < 0.0001 then
                return
            end
            local Unit = p2.Unit
            Part.Size = Vector3.new(u2, u2, p3)
            local v1 = CFrame.new(p1 + Unit * (p3 * 0.5))
            Part.CFrame = v1 * CFrame.lookAt(Vector3.zero, Unit)
        end,
    }
end
return v2