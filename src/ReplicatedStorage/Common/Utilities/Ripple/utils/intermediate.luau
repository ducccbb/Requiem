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
--          File: ReplicatedStorage.Common.Utilities.Ripple.utils.intermediate
--                              Dumped in 0.000596 seconds
--                          Bytecode version 9  |  20 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local u12 = {
    number = {
        to = function(p1) -- Line: 12
            return {p1}
        end,
        from = function(p1) -- Line: 15
            return p1[1]
        end,
    },
    table = {
        to = function(p1) -- Line: 21
            return p1
        end,
        from = function(p1) -- Line: 24
            return p1
        end,
    },
    UDim2 = {
        to = function(p1) -- Line: 30
            return {p1.X.Scale, p1.X.Offset, p1.Y.Scale, p1.Y.Offset}
        end,
        from = function(p1) -- Line: 33
            local v1 = math.round(p1[2])
            return UDim2.new(p1[1], v1, p1[3], (math.round(p1[4])))
        end,
    },
    UDim = {
        to = function(p1) -- Line: 39
            return {p1.Scale, p1.Offset}
        end,
        from = function(p1) -- Line: 42
            return UDim.new(p1[1], (math.round(p1[2])))
        end,
    },
    Vector2 = {
        to = function(p1) -- Line: 48
            return {p1.X, p1.Y}
        end,
        from = function(p1) -- Line: 51
            return Vector2.new(table.unpack(p1, 1, 2))
        end,
    },
    Vector3 = {
        to = function(p1) -- Line: 57
            return {p1.X, p1.Y, p1.Z}
        end,
        from = function(p1) -- Line: 60
            return (Vector3.new(table.unpack(p1, 1, 3)))
        end,
    },
}
local v2 = {
    to = function(p1) -- Line: 66
        return {p1.R, p1.G, p1.B}
    end,
}
function v2.from(p1) -- Line: 69
    local v1 = math.clamp(p1[1], 0, 1)
    local v2 = math.clamp(p1[2], 0, 1)
    return Color3.new(v1, v2, (math.clamp(p1[3], 0, 1)))
end
u12.Color3 = v2
u12.CFrame = {
    to = function(p1) -- Line: 75
        return {p1:GetComponents()}
    end,
    from = function(p1) -- Line: 78
        return CFrame.new(table.unpack(p1))
    end,
}
return {
    to = function(p1) -- Line: 84 -- upvalues: u12 (val)
        local v1 = typeof(p1)
        if u12[v1] then
            return u12[v1].to(p1)
        end
        error((("Ripple received an unsupported value '%*' of type '%*'"):format(p1, v1)))
    end,
    from = function(p1, p2) -- Line: 94 -- upvalues: u12 (val)
        if u12[p2] then
            return u12[p2].from(p1)
        end
        error((("Ripple received an unsupported value '%*' of type '%*'"):format(p1, p2)))
    end,
    index = function(p1, p2) -- Line: 102
        local v1 = p1[p2]
        if not v1 then
            v1 = p1[1]
        end
        return v1
    end,
}