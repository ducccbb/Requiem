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
--            File: ReplicatedStorage.Common.Utilities.Ripple.utils.snapshot
--                              Dumped in 0.000345 seconds
--                          Bytecode version 9  |  3 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local HttpService = game:GetService("HttpService")
require(v1.Parent.Parent.types)
local createMotion = require(v1.Parent.Parent.createMotion)
local function createSnapshot(p1, p2) -- Line: 16 -- upvalues: createMotion (val), HttpService (val)
    local v1
    local v2 = {}
    local v3 = createMotion(0)
    v3:to(p1)
    local v4 = p2 or 20
    local v5 = 1
    for i = 1, v4, v5 do
        v1 = v3:step(0.1)
        if v1 < 1 then
            v1 = math.floor(v1 * 100) / 100
        elseif 1 < v1 then
            v1 = math.ceil(v1 * 100) / 100
        end
        table.insert(v2, v1)
        if v1 == 1 then
            break
        end
    end
    v4 = HttpService:JSONEncode(v2)
    return v4, v3
end
local v3 = {createSnapshot = createSnapshot}
function v3.testSnapshot(p1, p2) -- Line: 40 -- upvalues: createSnapshot (val)
    local v1, v2
    local v3 = select(2, string.gsub(p2, ",", ",")) + 1
    v1, v2 = createSnapshot(p1, v3)
    if v1 ~= p2 then
        local v4 = ("Snapshot does not match expected value.\n\nExpected:\n%*\n\nActual:\n%*"):format(p2, v1)
        error(v4, 2)
    end
    return v2
end
return v3