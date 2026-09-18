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
--       File: ReplicatedStorage.Common.Utilities.RaycastHitboxV4.VisualizerCache
--                              Dumped in 0.000379 seconds
--                          Bytecode version 9  |  5 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local u16 = Color3.fromRGB(255, 0, 0)
local u21 = CFrame.new(0, math.huge, 0)
local u22 = {}
u22.__index = u22
u22.__type = "RaycastHitboxVisualizerCache"
u22._AdornmentInUse = {}
u22._AdornmentInReserve = {}
function u22._CreateAdornment(p1) -- Line: 32 -- upvalues: u16 (val), u21 (val)
    local LineHandleAdornment = Instance.new("LineHandleAdornment")
    LineHandleAdornment.Name = "_RaycastHitboxDebugLine"
    LineHandleAdornment.Color3 = u16
    LineHandleAdornment.Thickness = 4
    LineHandleAdornment.Length = 0
    LineHandleAdornment.CFrame = u21
    LineHandleAdornment.Adornee = workspace.Terrain
    LineHandleAdornment.Parent = workspace.Terrain
    return {LastUse = 0, Adornment = LineHandleAdornment}
end
function u22.GetAdornment(p1) -- Line: 51 -- upvalues: u22 (val)
    local v1 = #u22._AdornmentInReserve
    if v1 <= 0 then
        table.insert(u22._AdornmentInReserve, (u22:_CreateAdornment()))
    end
    v1 = table.remove(u22._AdornmentInReserve, 1)
    if v1 then
        v1.Adornment.Visible = true
        v1.LastUse = os.clock()
        table.insert(u22._AdornmentInUse, v1)
    end
    return v1
end
function u22.ReturnAdornment(p1, p2) -- Line: 71 -- upvalues: u21 (val), u22 (val)
    p2.Adornment.Length = 0
    p2.Adornment.Visible = false
    p2.Adornment.CFrame = u21
    table.insert(u22._AdornmentInReserve, p2)
end
function u22.Clear(p1) -- Line: 81 -- upvalues: u22 (val)
    local v1 = 1
    local v2 = -1
    for i = #u22._AdornmentInReserve, v1, v2 do
        if u22._AdornmentInReserve[i].Adornment then
            u22._AdornmentInReserve[i].Adornment:Destroy()
        end
        table.remove(u22._AdornmentInReserve, i)
    end
end
return u22