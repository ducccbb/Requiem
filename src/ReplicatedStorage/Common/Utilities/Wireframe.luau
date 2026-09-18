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
--                  File: ReplicatedStorage.Common.Utilities.Wireframe
--                               Dumped in 0.00188 seconds
--                          Bytecode version 9  |  9 functions

local v1
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local function getModelCorners(p1) -- Line: 12
    local CFrame, Size
    if not (p1:IsA("Model")) then
        CFrame = p1.CFrame
        Size = p1.Size
    else
        local BoundingBox, BoundingBox_2
        BoundingBox, BoundingBox_2 = p1:GetBoundingBox()
        CFrame = BoundingBox
        Size = BoundingBox_2
    end
    local v1 = CFrame * CFrame.new(-Size.X / 2, Size.Y / 2, Size.Z / 2)
    local v2 = CFrame * CFrame.new(Size.X / 2, Size.Y / 2, Size.Z / 2)
    local v3 = CFrame * CFrame.new(-Size.X / 2, Size.Y / 2, -Size.Z / 2)
    local v4 = CFrame * CFrame.new(Size.X / 2, Size.Y / 2, -Size.Z / 2)
    local v5 = CFrame * CFrame.new(-Size.X / 2, -Size.Y / 2, Size.Z / 2)
    local v6 = CFrame * CFrame.new(Size.X / 2, -Size.Y / 2, Size.Z / 2)
    local v7 = CFrame * CFrame.new(-Size.X / 2, -Size.Y / 2, -Size.Z / 2)
    local v8 = CFrame * CFrame.new(Size.X / 2, -Size.Y / 2, -Size.Z / 2)
    return {
        v1,
        v2,
        v3,
        v4,
        v5,
        v6,
        v7,
        v8,
    }
end
local function getModelEdges(p1) -- Line: 47 -- upvalues: getModelCorners (val)
    local v1 = getModelCorners(p1)
    local v2 = {}
    local v3 = {v1[2], v1[4]}
    local v4 = {v1[4], v1[3]}
    local v5 = {v1[3], v1[1]}
    local v6 = {v1[5], v1[6]}
    local v7 = {v1[6], v1[8]}
    local v8 = {v1[8], v1[7]}
    local v9 = {v1[7], v1[5]}
    local v10 = {v1[1], v1[5]}
    local v11 = {v1[2], v1[6]}
    local v12 = {v1[3], v1[7]}
    local v13 = {v1[4], v1[8]}
    v2[1] = {v1[1], v1[2]}
    v2[2] = v3
    v2[3] = v4
    v2[4] = v5
    v2[5] = v6
    v2[6] = v7
    v2[7] = v8
    v2[8] = v9
    v2[9] = v10
    v2[10] = v11
    v2[11] = v12
    v2[12] = v13
    return v2
end
v1 = {}
function v1.createWireframeModelFromReference(p1, p2, p3) -- Line: 77 -- upvalues: getModelEdges (val), getModelCorners (val)
    local BoundingBox, BoundingBox_2
    local Model = Instance.new("Model")
    BoundingBox, BoundingBox_2 = p1:GetBoundingBox()
    local Part = Instance.new("Part")
    Part.Anchored = true
    Part.CanCollide = false
    Part.Massless = true
    Part.Transparency = 1
    Part.CFrame = BoundingBox
    Part.Size = BoundingBox_2
    Part.Parent = Model
    local u17 = {}
    local u18 = {}
    local function createAttachmentAtCFrame(p1) -- Line: 103 -- upvalues: Part (val), u18 (val)
        local Attachment = Instance.new("Attachment")
        Attachment.Parent = Part
        Attachment.CFrame = Part.CFrame:Inverse() * p1
        u18[#u18 + 1] = Attachment
        return Attachment
    end
    local function createConnectingBeam(p1, p2, p3) -- Line: 114 -- upvalues: Part (val), u17 (val)
        local Beam = Instance.new("Beam")
        Beam.Attachment0 = p1
        Beam.Attachment1 = p2
        local v1 = p3
        if not v1 then
            v1 = Color3.fromRGB(255, 255, 255)
        end
        Beam:SetAttribute("color", v1)
        Beam.FaceCamera = true
        local v2 = p3
        if not v2 then
            v2 = Color3.fromRGB(255, 255, 255)
        end
        Beam.Color = ColorSequence.new(v2)
        Beam.Transparency = NumberSequence.new(0)
        Beam.LightInfluence = 0
        Beam.Width0 = 0.05
        Beam.Width1 = 0.05
        Beam.Segments = 1
        Beam.Parent = Part
        u17[#u17 + 1] = Beam
        return Beam
    end
    if p2 == "Box" then
        (function() -- Line: 138 -- upvalues: getModelEdges (upval), p1 (val), getModelCorners (upval), createAttachmentAtCFrame (val), createConnectingBeam (val), BoundingBox_2 (val), BoundingBox (val), p3 (val)
            local v1, v2, v3, v4
            local v5 = getModelEdges(p1)
            local v6 = getModelCorners(p1)
            local v7 = v5
            local v8 = nil
            local v9 = nil
            for i, j in v7, v8, v9 do
                v2, v3 = table.unpack(j)
                v4 = createAttachmentAtCFrame(v2)
                v1 = createAttachmentAtCFrame(v3)
                createConnectingBeam(v4, v1)
            end
            v7 = createAttachmentAtCFrame(v6[5])
            v8 = createAttachmentAtCFrame(v6[8])
            createConnectingBeam(v7, v8, Color3.fromRGB(255, 0, 0))
            v9 = createAttachmentAtCFrame(v6[6])
            local v10 = createAttachmentAtCFrame(v6[7])
            createConnectingBeam(v9, v10, Color3.fromRGB(255, 0, 0))
            local v11 = -BoundingBox_2.Y / 2
            v2 = CFrame.new(0, v11, 0)
            v3 = CFrame.new(0, v11 + 1, 0)
            v4 = createAttachmentAtCFrame(BoundingBox * v2)
            v1 = createAttachmentAtCFrame(BoundingBox * v3)
            createConnectingBeam(v4, v1, Color3.fromRGB(255, 255, 0))
            if p3 then
                local v12 = -BoundingBox_2.Z / 2
                local v13 = math.max(BoundingBox_2.X, BoundingBox_2.Y, BoundingBox_2.Z) * 0.5
                local v14 = CFrame.new(0, 0, v12)
                local v15 = CFrame.new(0, 0, v12 - v13)
                local v16 = createAttachmentAtCFrame(BoundingBox * v14)
                local v17 = createAttachmentAtCFrame(BoundingBox * v15)
                createConnectingBeam(v16, v17, Color3.fromRGB(255, 255, 0))
            end
        end)()
    elseif p2 == "Cylinder" then
        (function() -- Line: 191 -- upvalues: BoundingBox_2 (val), createAttachmentAtCFrame (val), BoundingBox (val), createConnectingBeam (val)
            local v1, v2, v3, v4, v5, v6
            if BoundingBox_2.Z >= BoundingBox_2.X then
                v1 = BoundingBox_2.Z / 2
            else
                v1 = BoundingBox_2.X / 2
            end
            local v7 = -BoundingBox_2.Y / 2 + 0.1
            local v8 = nil
            local v9 = nil
            local v10 = 17
            local v11 = 1
            for i = 0, v10, v11 do
                v4 = i / 18 * math.pi * 2
                v5 = math.cos(v4) * v1
                v6 = math.sin(v4) * v1
                v2 = CFrame.new(v5, v7, v6)
                v3 = createAttachmentAtCFrame(BoundingBox * v2)
                if i == 0 then
                    v9 = v3
                end
                if v8 then
                    createConnectingBeam(v8, v3)
                end
                v8 = v3
            end
            if v8 and v9 then
                createConnectingBeam(v8, v9)
            end
            v10 = CFrame.new(-v1, v7, 0)
            v11 = CFrame.new(v1, v7, 0)
            local v12 = createAttachmentAtCFrame(BoundingBox * v10)
            v4 = createAttachmentAtCFrame(BoundingBox * v11)
            createConnectingBeam(v12, v4, Color3.fromRGB(255, 0, 0))
            v5 = CFrame.new(0, v7, v1)
            v6 = CFrame.new(0, v7, -v1)
            v2 = createAttachmentAtCFrame(BoundingBox * v5)
            v3 = createAttachmentAtCFrame(BoundingBox * v6)
            createConnectingBeam(v2, v3, Color3.fromRGB(255, 0, 0))
            local v13 = CFrame.new(0, v7, 0)
            local v14 = CFrame.new(0, v7 + 1, 0)
            local v15 = createAttachmentAtCFrame(BoundingBox * v13)
            local v16 = createAttachmentAtCFrame(BoundingBox * v14)
            createConnectingBeam(v15, v16, Color3.fromRGB(255, 255, 0))
        end)()
    elseif p2 == "Sphere" then
        (function() -- Line: 252 -- upvalues: BoundingBox_2 (val), createAttachmentAtCFrame (val), BoundingBox (val), createConnectingBeam (val)
            local v1, v2, v3, v4, v5, v6, v7, v8, v9
            local v10 = math.max(BoundingBox_2.X, BoundingBox_2.Y, BoundingBox_2.Z) / 2
            local v11 = -BoundingBox_2.Y / 2 + 0.1
            local v12 = nil
            local v13 = nil
            local v14 = 17
            local v15 = 1
            for i = 0, v14, v15 do
                v7 = i / 18 * math.pi * 2
                v8 = math.cos(v7) * v10
                v9 = math.sin(v7) * v10
                v1 = CFrame.new(v8, v11, v9)
                v2 = createAttachmentAtCFrame(BoundingBox * v1)
                if i == 0 then
                    v13 = v2
                end
                if v12 then
                    createConnectingBeam(v12, v2)
                end
                v12 = v2
            end
            if v12 and v13 then
                createConnectingBeam(v12, v13)
            end
            v14 = nil
            v15 = nil
            local v16 = 18
            v7 = 1
            for j = 0, v16, v7 do
                v9 = j / 18 * math.pi
                v1 = math.cos(v9) * v10
                v2 = v11 + math.sin(v9) * v10
                v3 = CFrame.new(v1, v2, 0)
                v4 = createAttachmentAtCFrame(BoundingBox * v3)
                if not v15 then
                    v15 = v4
                end
                if v14 then
                    createConnectingBeam(v14, v4)
                end
                v14 = v4
            end
            v16 = nil
            v7 = nil
            v8 = 18
            v9 = 1
            for k = 0, v8, v9 do
                v2 = k / 18 * math.pi
                v3 = v11 + math.sin(v2) * v10
                v4 = math.cos(v2) * v10
                v5 = CFrame.new(0, v3, v4)
                v6 = createAttachmentAtCFrame(BoundingBox * v5)
                if not v7 then
                    v7 = v6
                end
                if v16 then
                    createConnectingBeam(v16, v6)
                end
                v16 = v6
            end
            v8 = CFrame.new(-v10, v11, 0)
            v9 = CFrame.new(v10, v11, 0)
            v1 = createAttachmentAtCFrame(BoundingBox * v8)
            v2 = createAttachmentAtCFrame(BoundingBox * v9)
            createConnectingBeam(v1, v2, Color3.fromRGB(255, 0, 0))
            v3 = CFrame.new(0, v11, v10)
            v4 = CFrame.new(0, v11, -v10)
            v5 = createAttachmentAtCFrame(BoundingBox * v3)
            v6 = createAttachmentAtCFrame(BoundingBox * v4)
            createConnectingBeam(v5, v6, Color3.fromRGB(255, 0, 0))
            local v17 = CFrame.new(0, v11, 0)
            local v18 = CFrame.new(0, v11 + 1, 0)
            local v19 = createAttachmentAtCFrame(BoundingBox * v17)
            local v20 = createAttachmentAtCFrame(BoundingBox * v18)
            createConnectingBeam(v19, v20, Color3.fromRGB(255, 255, 0))
        end)()
    end
    Model.Parent = workspace
    return Model, u17, u18
end
v1.getModelCorners = getModelCorners
v1.getModelEdges = getModelEdges
return v1