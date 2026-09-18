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
--File: ReplicatedStorage.Packages._Index.jakeywastaken_smartbone-2@0.3.1.smartbone-2.Dependencies.DebugUi
--                               Dumped in 0.00196 seconds
--                          Bytecode version 9  |  6 functions

local u0 = {}
local u1 = {}
local function infoText(p1, p2) -- Line: 4
    p1.PushConfig({TextColor = p1._config.TextDisabledColor})
    p1.Text({p2})
    p1.PopConfig()
end
local function helpMarker(p1, p2) -- Line: 10
    p1.PushConfig({TextColor = p1._config.TextDisabledColor})
    local v1 = p1.Text({"(?)"})
    p1.PopConfig()
    p1.PushConfig({ContentWidth = UDim.new(0, 350)})
    if v1.hovered() then
        p1.Tooltip({p2})
    end
    p1.PopConfig()
end
local function BoneEditor(p1, p2) -- Line: 22 -- upvalues: u0 (val)
    local v1 = p1.Window({(("Editing bone: %*"):format(p2.Bone.Name))})
    v1.isOpened.value = true
    p2.Radius = p1.InputNum({
        "Radius",
        0.1,
        0,
        (1 / 0),
        "%.3f",
    }, {number = p2.Radius}).number.value
    p2.RotationLimit = p1.InputNum({
        "Rotation Limit",
        0.1,
        0,
        180,
        "%.3f",
    }, {number = p2.RotationLimit}).number.value
    p2.Anchored = p1.Checkbox({"Anchored"}, {isChecked = p2.Anchored}).isChecked.value
    p1.Text("Axis Lock")
    p1.Indent()
    p1.SameLine()
    p1.Text("X: ")
    local v2 = p1.Checkbox({""}, {isChecked = p2.AxisLocked[1]})
    p1.Text("Y: ")
    local v3 = p1.Checkbox({""}, {isChecked = p2.AxisLocked[2]})
    p1.Text("Z: ")
    local v4 = p1.Checkbox({""}, {isChecked = p2.AxisLocked[3]})
    p1.End()
    p1.End()
    local v5 = p1.State(Vector2.new(p2.XAxisLimits.Min, p2.XAxisLimits.Max))
    local v6 = p1.State(Vector2.new(p2.YAxisLimits.Min, p2.YAxisLimits.Max))
    local v7 = p1.State(Vector2.new(p2.ZAxisLimits.Min, p2.ZAxisLimits.Max))
    p1.Text("Axis Limits")
    p1.Indent()
    p1.DragVector2({
        "X Axis Limit",
        0.05,
        nil,
        nil,
        {"Min: %.2f", "Max: %.2f"},
    }, {number = v5})
    p1.DragVector2({
        "Y Axis Limit",
        0.05,
        nil,
        nil,
        {"Min: %.2f", "Max: %.2f"},
    }, {number = v6})
    p1.DragVector2({
        "Z Axis Limit",
        0.05,
        nil,
        nil,
        {"Min: %.2f", "Max: %.2f"},
    }, {number = v7})
    p1.End()
    p1.End()
    p2.AxisLocked[1] = v2.isChecked.value
    p2.AxisLocked[2] = v3.isChecked.value
    p2.AxisLocked[3] = v4.isChecked.value
    p2.XAxisLimits = NumberRange.new(v5:get().X, v5:get().Y)
    p2.YAxisLimits = NumberRange.new(v6:get().X, v6:get().Y)
    p2.ZAxisLimits = NumberRange.new(v7:get().X, v7:get().Y)
    if v1.closed() then
        u0[p2] = nil
    end
end
local function ColliderEditor(p1, p2) -- Line: 77 -- upvalues: u1 (val)
    local v1 = p1.Window({(("Editing collider of type: %*"):format(p2.Type))})
    v1.isOpened.value = true
    local v2 = p1.State(p2.Type)
    local v3 = p1.State(p2.Scale)
    local v4 = p1.State(p2.Offset)
    local v5 = p1.State(p2.Rotation)
    p1.Combo({"Collider Type"}, {index = v2})
    p1.Selectable({"Box", "Box"}, {index = v2})
    p1.Selectable({"Sphere", "Sphere"}, {index = v2})
    p1.Selectable({"Capsule", "Capsule"}, {index = v2})
    p1.End()
    p1.DragVector3({"Scale", 0.1, 0, nil}, {number = v3})
    p1.DragVector3({"Offset", 0.1, nil, nil}, {number = v4})
    p1.DragVector3({"Rotation", 0.5, -180, 180}, {number = v5})
    p2.Type = v2:get()
    p2.Scale = v3:get()
    p2.Offset = v4:get()
    p2.Rotation = v5:get()
    p1.End()
    if v1.closed() then
        u1[p2] = nil
    end
end
return function(p1, p2, p3) -- Line: 108 -- upvalues: u0 (val), BoneEditor (val), u1 (val), ColliderEditor (val), helpMarker (val), infoText (val)
    local Bones, Colliders, Offset, RootPart, Rotation, Scale, Type, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17
    local v18 = {}
    local BoneTrees = p2.BoneTrees
    local v19 = nil
    local v20 = nil
    for i, j in BoneTrees, v19, v20 do
        RootPart = j.RootPart
        v3 = v18[RootPart]
        if not v3 then
            v18[RootPart] = {}
            v3 = v18[RootPart]
        end
        table.insert(v3, j)
    end
    local v21 = u0
    v19 = nil
    v20 = nil
    for k, n in v21, v19, v20 do
        v17 = ("%* - %*"):format(v2.ID, k.ParentIndex + 1)
        v1.PushId(v17)
        BoneEditor(v1, k)
        v1.PopId()
    end
    v21 = u1
    v19 = nil
    v20 = nil
    for m, i5 in v21, v19, v20 do
        v1.PushId(m.GUID)
        ColliderEditor(v1, m)
        v1.PopId()
    end
    v21 = #v2.BoneTrees
    v19 = #v2.ColliderObjects
    if v21 ~= 1 then
        v17 = "s"
    else
        v17 = ""
    end
    v20 = ("%* BoneTree%*"):format(v21, v17)
    if v19 ~= 1 then
        v3 = "s"
    else
        v3 = ""
    end
    local v22 = ("%* Collider%*"):format(v19, v3)
    v17 = {(("SmartBone Runtime Editor. %*, %*"):format(v20, v22))}
    v17[v1.Args.Window.NoClose] = true
    v1.Window(v17)
    v1.Tree({"Debug Gizmos", true}, {isUncollapsed = true})
    v1.SameLine()
    v1.Checkbox({"Draw Internal Bone"}, {isChecked = v23.DRAW_BONE})
    helpMarker(v1, "Draws a sphere with the specified radius of the bone around where SmartBone believes the bone is.")
    v1.End()
    v1.SameLine()
    v1.Checkbox({"Draw Physical Bone"}, {isChecked = v23.DRAW_PHYSICAL_BONE})
    helpMarker(v1, "Draws the actual bone objects CFrame with axis arrows.")
    v1.End()
    v1.SameLine()
    v1.Checkbox({"Draw Root Part"}, {isChecked = v23.DRAW_ROOT_PART})
    helpMarker(v1, "Draws a bounding box and fills in the root part.")
    v1.End()
    v1.SameLine()
    v1.Checkbox({"Draw Bounding Box"}, {isChecked = v23.DRAW_BOUNDING_BOX})
    helpMarker(v1, "Draws the bounding box used for frustum culling")
    v1.End()
    v1.SameLine()
    v1.Checkbox({"Draw Axis Limits"}, {isChecked = v23.DRAW_AXIS_LIMITS})
    helpMarker(v1, "Draws the axis limits for each bone.")
    v1.End()
    v1.SameLine()
    v1.Checkbox({"Draw Rotation Limits"}, {isChecked = v23.DRAW_ROTATION_LIMITS})
    helpMarker(v1, "Draws the rotation limits for each bone.")
    v1.End()
    v1.SameLine()
    v1.Checkbox({"Draw Acceleration Info"}, {isChecked = v23.DRAW_ACCELERATION_INFO})
    helpMarker(v1, "Draws the acceleration and the required values to derive it.")
    v1.End()
    v1.SameLine()
    v1.Checkbox({"Draw Colliders"}, {isChecked = v23.DRAW_COLLIDERS})
    helpMarker(v1, "Draws all the colliders this root object can collide with.")
    v1.End()
    v1.SameLine()
    v1.Checkbox({"Draw Collider Influence"}, {isChecked = v23.DRAW_COLLIDER_INFLUENCE})
    helpMarker(v1, "Shows the sphere of influence around each collider.")
    v1.End()
    v1.SameLine()
    v1.Checkbox({"Draw Collider Awake"}, {isChecked = v23.DRAW_COLLIDER_AWAKE})
    helpMarker(v1, "Shows if a collider is awake or asleep.")
    v1.End()
    v1.SameLine()
    v1.Checkbox({"Draw Collider Broadphase"}, {isChecked = v23.DRAW_COLLIDER_BROADPHASE})
    helpMarker(v1, "Shows if a collider isn't reaching narrowphase.")
    v1.End()
    v1.SameLine()
    v1.Checkbox({"Draw Fill Colliders"}, {isChecked = v23.DRAW_FILL_COLLIDERS})
    helpMarker(v1, "Fills all colliders this root object can collide with.")
    v1.End()
    v1.SameLine()
    v1.Checkbox({"Draw Contacts"}, {isChecked = v23.DRAW_CONTACTS})
    helpMarker(v1, "Draws the position and normal of the points which bones collide with colliders.")
    v1.End()
    v1.End()
    v1.Separator()
    infoText(v1, "Simulated Objects")
    local v24 = v18
    v17 = nil
    v3 = nil
    for i6, i7 in v24, v17, v3 do
        v1.Tree((("%* - Root Part"):format(i6.Name)))
        v4 = i7
        v5 = nil
        v6 = nil
        for i8, i9 in v4, v5, v6 do
            v1.Tree((("BoneTree #%*"):format(i8)))
            v7 = string.format("%.1f", i9.UpdateRate)
            v8 = string.format("%.1f", i9.Settings.UpdateRate)
            infoText(v1, (("Throttled Update Rate: %* / %* fps"):format(v7, v8)))
            infoText(v1, (("In View: %*"):format(i9.InView)))
            v9 = v1.State(i9.Settings.Constraint)
            v10 = v1.State(i9.Settings.WindType)
            v11 = v1.State(i9.Settings.UpdateRate)
            v12 = v1.State(i9.Settings.ActivationDistance)
            v13 = v1.State(i9.Settings.ThrottleDistance)
            v1.SameLine()
            helpMarker(v1, "The constraint used, distance is more flowy while spring is more rigid.")
            v1.Combo({"Constraint Type"}, {index = v9})
            v1.Selectable({"Distance", "Distance"}, {index = v9})
            v1.Selectable({"Spring", "Spring"}, {index = v9})
            v1.End()
            v1.End()
            v1.SameLine()
            helpMarker(v1, "The wind solver used, sine is a smoother wind, noise is more chaotic and hybrid is a mix of the two.")
            v1.Combo({"Wind Type"}, {index = v10})
            v1.Selectable({"Sine", "Sine"}, {index = v10})
            v1.Selectable({"Noise", "Noise"}, {index = v10})
            v1.Selectable({"Hybrid", "Hybrid"}, {index = v10})
            v1.End()
            v1.End()
            v1.SameLine()
            helpMarker(v1, "The target update rate for the bone tree")
            v1.SliderNum({"Update Rate", 5, 0, 120}, {number = v11})
            v1.End()
            v1.SameLine()
            helpMarker(v1, "The distance at which the bone tree stops updating")
            v1.SliderNum({"Activation Distance", 1, 0, 500}, {number = v12})
            v1.End()
            v1.SameLine()
            helpMarker(v1, "The distance at which the bone tree starts throttling its update rate")
            v1.SliderNum({"Throttle Distance", 1, 0, 500}, {number = v13})
            v1.End()
            i9.Settings.Constraint = v9:get()
            i9.Settings.WindType = v10:get()
            i9.Settings.UpdateRate = v11:get()
            i9.Settings.ActivationDistance = v12:get()
            i9.Settings.ThrottleDistance = v13:get()
            v1.Table({4, false, false, false})
            v1.NextColumn()
            v1.Text("Bone #")
            v1.NextColumn()
            v1.Text("Bone Name")
            v1.NextColumn()
            v1.Text("Parent #")
            v1.NextColumn()
            v1.Text("Edit")
            v1.End()
            v1.Table({4})
            Bones = i9.Bones
            v14 = nil
            v15 = nil
            for i10, i11 in Bones, v14, v15 do
                v1.NextColumn()
                v1.Text((tostring(i10)))
                v1.NextColumn()
                v1.Text(i11.Bone.Name)
                v1.NextColumn()
                v1.Text((tostring(i11.ParentIndex)))
                v1.NextColumn()
                v1.SameLine()
                v1.Text("")
                v16 = {"Edit"}
                if v1.SmallButton(v16).clicked() then
                    u0[i11] = true
                end
                v1.End()
            end
            v1.End()
            v1.End()
        end
        v1.End()
    end
    infoText(v1, "Active Colliders")
    local ColliderObjects = v2.ColliderObjects
    v17 = nil
    v3 = nil
    for i12, i13 in ColliderObjects, v17, v3 do
        v1.Tree({i13.m_Object.Name})
        infoText(v1, "Colliders adorned to this object")
        v1.Table({5, false, false, false})
        v1.NextColumn()
        v1.Text("Type")
        v1.NextColumn()
        v1.Text("Scale")
        v1.NextColumn()
        v1.Text("Offset")
        v1.NextColumn()
        v1.Text("Rotation")
        v1.NextColumn()
        v1.Text("Edit")
        v1.End()
        v1.Table({5})
        Colliders = i13.Colliders
        v5 = nil
        v6 = nil
        for i14, i15 in Colliders, v5, v6 do
            v1.NextColumn()
            v1.Text((tostring(i15.Type)))
            v1.NextColumn()
            v1.Text((tostring(i15.Scale)))
            v1.NextColumn()
            v1.Text((tostring(i15.Offset)))
            v1.NextColumn()
            v1.Text((tostring(i15.Rotation)))
            v1.NextColumn()
            v1.SameLine()
            v1.Text("")
            v8 = {"Edit"}
            if v1.SmallButton(v8).clicked() then
                u1[i15] = true
            end
            v1.End()
        end
        v1.End()
        v1.End()
    end
    v1.End()
end