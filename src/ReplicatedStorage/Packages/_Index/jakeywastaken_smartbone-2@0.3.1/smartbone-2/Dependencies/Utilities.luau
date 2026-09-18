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
--File: ReplicatedStorage.Packages._Index.jakeywastaken_smartbone-2@0.3.1.smartbone-2.Dependencies.Utilities
--                               Dumped in 0.00191 seconds
--                          Bytecode version 9  |  20 functions

local HttpService = game:GetService("HttpService")
local Config = require(script.Parent:WaitForChild("Config"))
local DefaultObjectSettings = require(script.Parent:WaitForChild("DefaultObjectSettings"))
local u21 = {
    Block = "Box",
    Ball = "Sphere",
    Capsule = "Capsule",
    Sphere = "Sphere",
    Box = "Box",
    Cylinder = "Cylinder",
}
local function SafeUnit(p1) -- Line: 14
    if p1.Magnitude == 0 then
        return (Vector3.new(-0, -1, -0))
    end
    return p1.Unit
end
local u23 = {
    LogIndent = 0,
    GetRotationBetween = function(p1, p2) -- Line: 25
        local Unit
        local v1 = p1:Dot(p2)
        local v2 = math.atan2(p1:Cross(p2).Magnitude, v1)
        local v3 = p1:Cross(p2)
        if v3.Magnitude ~= 0 then
            Unit = v3.Unit
        else
            Unit = Vector3.new(-0, -1, -0)
        end
        return CFrame.fromAxisAngle(Unit, v2)
    end,
    GetCFrameAxis = function(p1, p2) -- Line: 34
        local v1, v2, v3
        v1, v2, v3 = p1:ToEulerAnglesXYZ()
        if p2 == "X" then
            return v1
        end
        if p2 == "Y" then
            return v2
        end
        if p2 == "Z" then
            return v3
        end
        return nil
    end,
    GatherObjectSettings = function(p1) -- Line: 46 -- upvalues: DefaultObjectSettings (val)
        local Attribute, Name, v1, v2, v3
        local v4 = {}
        local function Expect(a1, p2, p3) -- Line: 49 -- upvalues: p1 (val)
            if typeof(a1) == p2 then
                return true
            end
            warn((("[SmartBone][Object] Expected attribute %* on %* to be of type %*, got type %*"):format(p3, p1.Name, p2, (typeof(a1)))))
            return false
        end
        local v5 = DefaultObjectSettings
        local v6 = nil
        local v7 = nil
        local u60 = p1
        for i, j in v5, v6, v7 do
            Attribute = u60:GetAttribute(i)
            if Attribute ~= nil then
                v1 = Attribute
                v2 = typeof(j)
                if typeof(v1) == v2 then
                    v3 = true
                else
                    Name = u60.Name
                    warn((("[SmartBone][Object] Expected attribute %* on %* to be of type %*, got type %*"):format(i, Name, v2, (typeof(v1)))))
                    v3 = false
                end
                if not v3 then
                    Attribute = nil
                end
            end
            if Attribute ~= nil then
                v3 = Attribute
            else
                v3 = j
            end
            v4[i] = v3
        end
        return v4
    end,
    GatherBoneSettings = function(p1) -- Line: 73
        local Name
        local function Attrib(a1) -- Line: 74 -- upvalues: p1 (val)
            return p1:GetAttribute(a1)
        end
        local function Expect(a1, p2, p3) -- Line: 78 -- upvalues: p1 (val)
            if typeof(a1) ~= p2 then
                warn((("[SmartBone][Bone] Expected attribute %* on %* to be of type %*, got type %*"):format(p3, p1.Name, p2, (typeof(a1)))))
            end
        end
        local v1 = p1:GetAttribute("XAxisLocked") or false
        local v2 = p1:GetAttribute("YAxisLocked") or false
        local v3 = p1:GetAttribute("ZAxisLocked") or false
        local Attribute = p1:GetAttribute("XAxisLimits")
        if not Attribute then
            Attribute = NumberRange.new((-1 / 0), (1 / 0))
        end
        local Attribute_2 = p1:GetAttribute("YAxisLimits")
        if not Attribute_2 then
            Attribute_2 = NumberRange.new((-1 / 0), (1 / 0))
        end
        local Attribute_3 = p1:GetAttribute("ZAxisLimits")
        if not Attribute_3 then
            Attribute_3 = NumberRange.new((-1 / 0), (1 / 0))
        end
        local v4 = p1:GetAttribute("Radius") or 0.25
        local v5 = p1:GetAttribute("RotationLimit") or 180
        local v6 = p1:GetAttribute("Force") or "¬"
        local v7 = p1:GetAttribute("Gravity") or "¬"
        if typeof(v1) ~= "boolean" then
            Name = p1.Name
            warn((("[SmartBone][Bone] Expected attribute XAxisLocked on %* to be of type boolean, got type %*"):format(Name, (typeof(v1)))))
        end
        if typeof(v2) ~= "boolean" then
            local Name_2 = p1.Name
            warn((("[SmartBone][Bone] Expected attribute YAxisLocked on %* to be of type boolean, got type %*"):format(Name_2, (typeof(v2)))))
        end
        if typeof(v3) ~= "boolean" then
            local Name_3 = p1.Name
            warn((("[SmartBone][Bone] Expected attribute ZAxisLocked on %* to be of type boolean, got type %*"):format(Name_3, (typeof(v3)))))
        end
        if typeof(Attribute) ~= "NumberRange" then
            local Name_4 = p1.Name
            warn((("[SmartBone][Bone] Expected attribute XAxisLimits on %* to be of type NumberRange, got type %*"):format(Name_4, (typeof(Attribute)))))
        end
        if typeof(Attribute_2) ~= "NumberRange" then
            local Name_5 = p1.Name
            warn((("[SmartBone][Bone] Expected attribute YAxisLimits on %* to be of type NumberRange, got type %*"):format(Name_5, (typeof(Attribute_2)))))
        end
        if typeof(Attribute_3) ~= "NumberRange" then
            local Name_6 = p1.Name
            warn((("[SmartBone][Bone] Expected attribute ZAxisLimits on %* to be of type NumberRange, got type %*"):format(Name_6, (typeof(Attribute_3)))))
        end
        if typeof(v4) ~= "number" then
            local Name_7 = p1.Name
            warn((("[SmartBone][Bone] Expected attribute Radius on %* to be of type number, got type %*"):format(Name_7, (typeof(v4)))))
        end
        if typeof(v5) ~= "number" then
            local Name_8 = p1.Name
            warn((("[SmartBone][Bone] Expected attribute RotationLimit on %* to be of type number, got type %*"):format(Name_8, (typeof(v5)))))
        end
        if v6 ~= "¬" and typeof(v6) ~= "Vector3" then
            local Name_9 = p1.Name
            warn((("[SmartBone][Bone] Expected attribute Force on %* to be of type Vector3, got type %*"):format(Name_9, (typeof(v6)))))
        end
        if v6 ~= "¬" and typeof(v7) ~= "Vector3" then
            local Name_10 = p1.Name
            warn((("[SmartBone][Bone] Expected attribute Gravity on %* to be of type Vector3, got type %*"):format(Name_10, (typeof(v7)))))
        end
        return {
            AxisLocked = {v1, v2, v3},
            XAxisLimits = Attribute,
            YAxisLimits = Attribute_2,
            ZAxisLimits = Attribute_3,
            RotationLimit = v5,
            Radius = v4,
            Force = v6,
            Gravity = v7,
        }
    end,
    ClosestPointOnLine = function(p1, p2, p3, p4) -- Line: 131
        return p1 + p2 * math.clamp((p4 - p1):Dot(p2), -p3, p3)
    end,
    ClosestPointInBox = function(p1, p2, p3) -- Line: 139
        local v1
        local v2 = p1:PointToObjectSpace(p3)
        local X_2 = p2.X
        local X_3 = p2.X
        local Z = p2.Z
        local X = v2.X
        local Y = v2.Y
        local Z_2 = v2.Z
        if v2 ~= v2 or p2 ~= p2 then
            return false, p1.Position, (Vector3.new(0, 1, 0))
        end
        local v3 = math.clamp(X, -X_2 * 0.5, X_2 * 0.5)
        local v4 = -X_3 * 0.5
        local v5 = math.clamp(Y, v4, X_3 * 0.5)
        local v6 = -Z * 0.5
        local v7 = math.clamp(Z_2, v6, Z * 0.5)
        if v3 ~= X or v5 ~= Y or v7 ~= Z_2 then
            v4 = p1 * Vector3.new(v3, v5, v7)
            return false, v4, (p3 - v4).unit
        end
        v4 = X - X_2 * 0.5
        v6 = Y - X_3 * 0.5
        local v8 = Z_2 - Z * 0.5
        local v9 = -X - X_2 * 0.5
        local v10 = -Y - X_3 * 0.5
        local v11 = -Z_2 - Z * 0.5
        local v12 = math.max(v4, v6, v8, v9, v10, v11)
        if v12 == v4 then
            v1 = p1 * Vector3.new(X_2 * 0.5, Y, Z_2)
            return true, v1, p1.XVector
        end
        if v12 == v6 then
            v1 = p1 * Vector3.new(X, X_3 * 0.5, Z_2)
            return true, v1, p1.YVector
        end
        if v12 == v8 then
            v1 = p1 * Vector3.new(X, Y, Z * 0.5)
            return true, v1, p1.ZVector
        end
        if v12 == v9 then
            v1 = p1 * Vector3.new(-X_2 * 0.5, Y, Z_2)
            return true, v1, -p1.XVector
        end
        if v12 == v10 then
            v1 = p1 * Vector3.new(X, -X_3 * 0.5, Z_2)
            return true, v1, -p1.YVector
        end
        if v12 == v11 then
            v1 = p1 * Vector3.new(X, Y, -Z * 0.5)
            return true, v1, -p1.ZVector
        end
        warn("CLOSEST POINT ON BOX FAIL")
        return false, Vector3.new(0, 0, 0), (Vector3.new(0, 1, 0))
    end,
    GetCollider = function(p1) -- Line: 194 -- upvalues: HttpService (val), u21 (val)
        local Attribute, Name, u13
        local v1 = p1:FindFirstChild("self.Collider")
        local v2 = nil
        if v1 and v1:IsA("ModuleScript") then
            local u12 = require(v1)
            pcall(function() -- Line: 203 -- upvalues: u13 (ref), HttpService (upval), u12 (val)
                u13 = HttpService:JSONDecode(u12)
            end)
            v2 = nil
        end
        if v2 then
            return v2
        end
        local function GetShapeName(p1) -- Line: 216
            local Attribute = p1:GetAttribute("ColliderShape")
            if Attribute then
                return Attribute
            end
            if p1:IsA("Part") then
                return p1.Shape.Name
            end
            return "Box"
        end
        Attribute = p1:GetAttribute("ColliderShape")
        if Attribute then
            Name = Attribute
        elseif not (p1:IsA("Part")) then
            Name = "Box"
        else
            Name = p1.Shape.Name
        end
        return {
            {
                ScaleX = 1,
                ScaleY = 1,
                ScaleZ = 1,
                OffsetX = 0,
                OffsetY = 0,
                OffsetZ = 0,
                RotationX = 0,
                RotationY = 0,
                RotationZ = 0,
                Type = u21[Name] or "Box",
            },
        }
    end,
}
function u23.SB_INDENT_LOG() -- Line: 250 -- upvalues: u23 (val)
    local v1 = u23
    v1.LogIndent = v1.LogIndent + 1
end
function u23.SB_UNINDENT_LOG() -- Line: 254 -- upvalues: u23 (val)
    local v1 = u23
    v1.LogIndent = v1.LogIndent - 1
    u23.LogIndent = math.max(u23.LogIndent, 0)
end
function u23.SB_ASSERT_CB(p1, p2, ...) -- Line: 259
    if p1 == false then
        p2(...)
    elseif p1 == nil then
        p2(...)
    end
end
function u23.SB_VERBOSE_LOG(p1) -- Line: 265 -- upvalues: Config (val), u23 (val)
    if not Config.LOG_VERBOSE then
        return
    end
    local v1 = string.rep("    ", u23.LogIndent)
    print((("%*[SmartBone][Log]: %*"):format(v1, p1)))
end
function u23.SB_VERBOSE_WARN(p1) -- Line: 275 -- upvalues: Config (val), u23 (val)
    if not Config.LOG_VERBOSE then
        return
    end
    local v1 = string.rep("    ", u23.LogIndent)
    warn((("%*[SmartBone][Warn]: %*"):format(v1, p1)))
end
function u23.SB_VERBOSE_ERROR(p1) -- Line: 285 -- upvalues: Config (val), u23 (val)
    if not Config.LOG_VERBOSE then
        return
    end
    local v1 = string.rep("    ", u23.LogIndent)
    error((("%*[SmartBone][Error]: %*"):format(v1, p1)))
end
return u23