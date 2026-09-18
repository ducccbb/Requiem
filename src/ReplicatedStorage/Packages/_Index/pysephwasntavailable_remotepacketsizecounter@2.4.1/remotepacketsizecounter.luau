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
--File: ReplicatedStorage.Packages._Index.pysephwasntavailable_remotepacketsizecounter@2.4.1.remotepacketsizecounter
--                               Dumped in 0.00102 seconds
--                          Bytecode version 9  |  5 functions

local GetDataByteSize, v1
local u0 = {}
u0["nil"] = 0
u0.EnumItem = 4
u0.boolean = 1
u0.number = 8
u0.UDim = 8
u0.UDim2 = 16
u0.Ray = 24
u0.Faces = 6
u0.Axes = 6
u0.BrickColor = 4
u0.Color3 = 12
u0.Vector2 = 8
u0.Vector3 = 12
u0.Instance = 4
u0.Vector2int16 = 4
u0.Vector3int16 = 6
u0.NumberSequenceKeypoint = 12
u0.ColorSequenceKeypoint = 16
u0.NumberRange = 8
u0.Rect = 16
u0.PhysicalProperties = 20
u0.Color3uint8 = 3
local u23 = {}
local v2 = CFrame.Angles(0, 0, 0)
u23[v2] = true
v2 = CFrame.Angles(0, 3.141592653589793, 0)
u23[v2] = true
v2 = CFrame.Angles(1.5707963267948966, 0, 0)
u23[v2] = true
v2 = CFrame.Angles(-1.5707963267948966, -3.141592653589793, 0)
u23[v2] = true
v2 = CFrame.Angles(0, 3.141592653589793, 3.141592653589793)
u23[v2] = true
v2 = CFrame.Angles(0, 0, 3.141592653589793)
u23[v2] = true
v2 = CFrame.Angles(-1.5707963267948966, 0, 0)
u23[v2] = true
v2 = CFrame.Angles(1.5707963267948966, 3.141592653589793, 0)
u23[v2] = true
v2 = CFrame.Angles(0, 3.141592653589793, 1.5707963267948966)
u23[v2] = true
v2 = CFrame.Angles(0, 0, -1.5707963267948966)
u23[v2] = true
v2 = CFrame.Angles(0, 1.5707963267948966, 1.5707963267948966)
u23[v2] = true
v2 = CFrame.Angles(0, -1.5707963267948966, -1.5707963267948966)
u23[v2] = true
v2 = CFrame.Angles(0, 0, 1.5707963267948966)
u23[v2] = true
v2 = CFrame.Angles(0, -3.141592653589793, -1.5707963267948966)
u23[v2] = true
v2 = CFrame.Angles(0, -1.5707963267948966, 1.5707963267948966)
u23[v2] = true
v2 = CFrame.Angles(0, 1.5707963267948966, -1.5707963267948966)
u23[v2] = true
v2 = CFrame.Angles(-1.5707963267948966, -1.5707963267948966, 0)
u23[v2] = true
v2 = CFrame.Angles(1.5707963267948966, 1.5707963267948966, 0)
u23[v2] = true
v2 = CFrame.Angles(0, -1.5707963267948966, 0)
u23[v2] = true
v2 = CFrame.Angles(0, 1.5707963267948966, 0)
u23[v2] = true
v2 = CFrame.Angles(1.5707963267948966, -1.5707963267948966, 0)
u23[v2] = true
v2 = CFrame.Angles(-1.5707963267948966, 1.5707963267948966, 0)
u23[v2] = true
v2 = CFrame.Angles(0, 1.5707963267948966, 3.141592653589793)
u23[v2] = true
v2 = CFrame.Angles(0, -1.5707963267948966, 3.141592653589793)
u23[v2] = true
local function GetVLQSize(p1, p2) -- Line: 74
    local v1 = math.ceil((math.log(p2 + p1, 128)))
    return (math.max(v1, p1))
end
function GetDataByteSize(p1, p2) -- Line: 78 -- upvalues: u0 (val), GetDataByteSize (val), u23 (val)
    local v1, v2
    local v3 = typeof(p1)
    if u0[v3] then
        return u0[v3]
    end
    if v3 == "string" then
        if v3 ~= "string" then
            v1 = buffer.len(p1)
        else
            v1 = #p1
            if not v1 then
                v1 = buffer.len(p1)
            end
        end
        v2 = math.ceil((math.log(v1 + 1, 128)))
        return math.max(v2, 1) + v1
    elseif v3 ~= "buffer" then
        local v4, v5
        if v3 == "table" then
            if p2[p1] then
                return 0
            end
            p2[p1] = true
            v1 = 0
            v4 = 0
            v5 = 1
            v2 = p1[1] ~= nil
            local v6 = next
            local v7 = p1
            local v8 = nil
            local v9 = p2
            for k3, i in v6, v7, v8 do
                v5 = v5 + 1
                if not v2 then
                    v1 = v1 + (GetDataByteSize(k3, v9) + 1)
                end
                v4 = v4 + (GetDataByteSize(i, v9) + 1)
            end
            if v2 then
                local v10 = math.ceil((math.log(v5 + 1, 128)))
                return math.max(v10, 1) + v4
            end
            local v11 = math.ceil((math.log(v5 + 1, 128)))
            return math.max(v11, 1) + v1 + v4
        end
        if v3 == "CFrame" then
            v1 = false
            v4 = next
            v5 = u23
            v2 = nil
            for k2 in v4, v5, v2 do
                if k2 == p1.Rotation then
                    v1 = true
                    break
                end
            end
            if v1 then
                return 13
            end
            return 19
        end
        if v3 == "NumberSequence" then
            v1 = 4
            v4 = next
            local Keypoints = p1.Keypoints
            v2 = nil
            for k, v in v4, Keypoints, v2 do
                v1 = v1 + GetDataByteSize(v, p2)
            end
            return v1
        elseif v3 ~= "ColorSequence" then
            warn("[PacketSizeCounter]: Unsupported data type: " .. v3)
            return 0
        end
    end
end
v1 = {
    BaseRemoteOverhead = 9,
    RemoteFunctionOverhead = 2,
    ClientToServerOverhead = 5,
    TypeOverhead = 1,
    GetPacketSize = function(p1) -- Line: 173 -- upvalues: GetDataByteSize (val)
        local v1 = 9
        if p1.RemoteType == "RemoteFunction" then
            v1 = v1 + 2
        end
        if p1.RunContext == "Client" then
            v1 = v1 + 5
        end
        local v2 = {}
        for i, v in ipairs(p1.PacketData) do
            v1 = v1 + (GetDataByteSize(v, v2) + 1)
        end
        return v1
    end,
    GetDataByteSize = function(p1) -- Line: 195 -- upvalues: GetDataByteSize (val)
        return GetDataByteSize(p1, {}) + 1
    end,
}
table.freeze(v1)
return v1