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
--             File: ReplicatedStorage.Common.Chrono.Shared.MakeNetworkable
--                              Dumped in 0.000603 seconds
--                          Bytecode version 9  |  9 functions

local u0 = script
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ServerTimeNow = workspace:GetServerTimeNow()
if not (game:GetService("RunService"):IsClient()) then
    u0:SetAttribute("ServerTime", ServerTimeNow)
else
    local AttributeChangedSignal = u0:GetAttributeChangedSignal("ServerTime")
    AttributeChangedSignal:Connect(function() -- Line: 21 -- upvalues: ServerTimeNow (ref), u0 (val)
        local Attribute = u0:GetAttribute("ServerTime")
        if not Attribute then
            Attribute = workspace:GetServerTimeNow()
        end
        ServerTimeNow = Attribute
    end)
    ServerTimeNow = u0:GetAttribute("ServerTime") or ServerTimeNow
end
local function MakeNetworkable(p1) -- Line: 29
    local v1, v2
    local Position = p1.Position
    v1, v2 = p1:ToAxisAngle()
    local v3 = math.sin(v2 * 0.5)
    return {
        Position = Position,
        Rotation = {x = v1.X * v3, y = v1.Y * v3, z = v1.Z * v3},
    }
end
local function MakeYawNetworkable(p1) -- Line: 48
    local v1
    _, v1 = p1:ToEulerAnglesYXZ()
    return {Position = p1.Position, RotationY = v1}
end
return {
    MakeNetworkable = MakeNetworkable,
    NetworkableCFrameTable = function(p1) -- Line: 56 -- upvalues: MakeNetworkable (val)
        local v1 = {}
        local v2 = p1
        local v3 = nil
        local v4 = nil
        for i, j in v2, v3, v4 do
            v1[i] = MakeNetworkable(j)
        end
        return v1
    end,
    DecodeCFrame = function(p1) -- Line: 72
        local Position = p1.Position
        local Rotation = p1.Rotation
        local x = Rotation.x
        local y = Rotation.y
        local z = Rotation.z
        local v1 = 1 - x * x - y * y
        local v2 = v1 - z * z
        if 0 >= v2 then
            v1 = 0
        else
            v1 = math.sqrt(v2)
        end
        return CFrame.new(Position.X, Position.Y, Position.Z, x, y, z, v1)
    end,
    NetworkableYawCFrameTable = function(p1) -- Line: 64 -- upvalues: MakeYawNetworkable (val)
        local v1 = {}
        local v2 = p1
        local v3 = nil
        local v4 = nil
        for i, j in v2, v3, v4 do
            v1[i] = MakeYawNetworkable(j)
        end
        return v1
    end,
    MakeYawNetworkable = MakeYawNetworkable,
    DecodeYawCFrame = function(p1) -- Line: 83
        local RotationY = p1.RotationY
        local v1 = math.cos(RotationY)
        local v2 = math.sin(RotationY)
        local v3 = Vector3.new(v1, 0, -v2)
        return CFrame.fromMatrix(p1.Position, v3, (Vector3.new(0, 1, 0)))
    end,
    EncodeTime = function(p1) -- Line: 92
        return p1
    end,
}