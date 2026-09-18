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
--                    File: ReplicatedStorage.Common.Utilities.Packet
--                               Dumped in 0.00287 seconds
--                          Bytecode version 9  |  27 functions

local u109
local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local Signal = require(v1.Signal)
local Task = require(v1.Task)
local Types = require(v1.Types)
local ParametersToFunctions = nil
local TableToFunctions = nil
local ReadParameters = nil
local WriteParameters = nil
local Timeout = nil
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Reads = Types.Reads
local Writes = Types.Writes
local Import = Types.Import
local Export = Types.Export
local Truncate = Types.Truncate
local Ended = Types.Ended
local NumberU8 = Reads.NumberU8
local NumberU8_2 = Writes.NumberU8
local NumberU16 = Reads.NumberU16
local NumberU16_2 = Writes.NumberU16
local u46 = {}
local u47 = {}
local u48 = nil
local u49 = nil
local u50 = nil
local u51 = nil
local u52 = nil
local u53 = {
    BufferLength = 128,
    BufferOffset = 0,
    InstancesOffset = 0,
    Buffer = buffer.create(128),
    Instances = {},
}
u46.__index = u46
u46.Type = "Packet"
function u46.Response(p1, ...) -- Line: 84 -- upvalues: ParametersToFunctions (ref)
    local v1, v2
    p1.ResponseTimeout = p1.ResponseTimeout or 10
    v1, v2 = ParametersToFunctions(table.pack(...))
    p1.ResponseReads = v1
    p1.ResponseWrites = v2
    return p1
end
function u46:Fire(, ...) -- Line: 90 -- upvalues: RunService (val), u50 (ref), Import (val), u53 (ref), NumberU8_2 (val), Task (val), Timeout (ref), WriteParameters (ref), Export (val)
    local v1
    if not self.ResponseReads then
        Import(u53)
        NumberU8_2(self.Id)
        WriteParameters(self.Writes, {...})
        u53 = Export()
        return
    end
    if RunService:IsServer() then
        error("You must use FireClient(player)", 2)
    end
    local v2 = nil
    local v3 = 128
    local v4 = 1
    for i = 1, v3, v4 do
        v2 = u50[u50.Index]
        if not v2 then
            v1 = self
            break
        end
        u50.Index = (u50.Index + 1) % 128
    end
    if v2 then
        error("Cannot have more than 128 yielded threads", 2)
    end
    Import(u53)
    NumberU8_2(v1.Id)
    NumberU8_2(u50.Index)
    u50[u50.Index] = {Yielded = coroutine.running(), Timeout = Task:Delay(v1.ResponseTimeout, Timeout, u50, u50.Index, v1.ResponseTimeoutValue)}
    u50.Index = (u50.Index + 1) % 128
    WriteParameters(v1.Writes, {...})
    u53 = Export()
    return coroutine.yield()
end
function u46:FireClient(p2, ...) -- Line: 126 -- upvalues: u49 (ref), Import (val), u48 (ref), NumberU8_2 (val), Task (val), Timeout (ref), WriteParameters (ref), Export (val)
    local v1, v2, v3
    if p2.Parent == nil then
        return
    end
    if not self.ResponseReads then
        v3 = u48[p2]
        if not v3 then
            v3 = {
                BufferLength = 128,
                BufferOffset = 0,
                InstancesOffset = 0,
                Buffer = buffer.create(128),
                Instances = {},
            }
        end
        Import(v3)
        NumberU8_2(self.Id)
        WriteParameters(self.Writes, {...})
        u48[p2] = Export()
        return
    end
    local v4 = u49[p2]
    if v4 == nil then
        u49[p2] = {Index = 0}
    end
    v3 = nil
    local v5 = 128
    local v6 = 1
    for i = 1, v5, v6 do
        v3 = v4[v4.Index]
        if not v3 then
            v2, v1 = p2, self
            break
        end
        v4.Index = (v4.Index + 1) % 128
    end
    if v3 then
        error("Cannot have more than 128 yielded threads", 2)
        return
    end
    v6 = u48[v2]
    if not v6 then
        v6 = {
            BufferLength = 128,
            BufferOffset = 0,
            InstancesOffset = 0,
            Buffer = buffer.create(128),
            Instances = {},
        }
    end
    Import(v6)
    NumberU8_2(v1.Id)
    NumberU8_2(v4.Index)
    v4[v4.Index] = {Yielded = coroutine.running(), Timeout = Task:Delay(v1.ResponseTimeout, Timeout, v4, v4.Index, v1.ResponseTimeoutValue)}
    v4.Index = (v4.Index + 1) % 128
    WriteParameters(v1.Writes, {...})
    u48[v2] = Export()
    return coroutine.yield()
end
function u46.Serialize(p1, ...) -- Line: 180 -- upvalues: Import (val), WriteParameters (ref), Truncate (val)
    Import({
        BufferLength = 128,
        BufferOffset = 0,
        InstancesOffset = 0,
        Buffer = buffer.create(128),
        Instances = {},
    })
    WriteParameters(p1.Writes, {...})
    return Truncate()
end
function u46.Deserialize(p1, p2, p3) -- Line: 186 -- upvalues: Import (val), ReadParameters (ref)
    local v1 = {BufferOffset = 0, InstancesOffset = 0, Buffer = p2, BufferLength = buffer.len(p2)}
    local v2 = p3
    if not v2 then
        v2 = {}
    end
    v1.Instances = v2
    Import(v1)
    return ReadParameters(p1.Reads)
end
function ParametersToFunctions(p1) -- Line: 198 -- upvalues: TableToFunctions (ref), Reads (val), Writes (val)
    local v1, v2
    local v3 = table.create(#p1)
    local v4 = table.create(#p1)
    for i, v in ipairs(p1) do
        if type(v) ~= "table" then
            v3[i] = Reads[v]
            v4[i] = Writes[v]
        else
            v1, v2 = TableToFunctions(v)
            v3[i] = v1
            v4[i] = v2
        end
    end
    return v3, v4
end
function TableToFunctions(p1) -- Line: 210 -- upvalues: TableToFunctions (ref), Reads (val), Writes (val), NumberU16 (val), NumberU16_2 (val)
    local create, sort, v1, v2, v3, v4, v5, v6, v7
    if #p1 == 1 then
        v2 = p1[1]
        if type(v2) ~= "table" then
            sort = Reads[v2]
            create = Writes[v2]
        else
            v5, v6 = TableToFunctions(v2)
            sort = v5
            create = v6
        end
        return function() -- Line: 219 -- upvalues: NumberU16 (upval), sort (ref)
            local v1 = NumberU16()
            local v2 = table.create(v1)
            local v3 = v1
            local v4 = 1
            for i = 1, v3, v4 do
                v2[i] = sort()
            end
            return v2
        end, function(p1) -- Line: 227 -- upvalues: NumberU16_2 (upval), create (ref)
            NumberU16_2(#p1)
            local v1 = p1
            local v2 = nil
            local v3 = nil
            for i, j in v1, v2, v3 do
                create(j)
            end
        end
    end
    v1 = p1
    local u22 = {}
    sort = v1
    create = nil
    v5 = nil
    for i, j in sort, create, v5 do
        table.insert(u22, i)
    end
    table.sort(u22)
    sort = table.create(#u22)
    create = table.create(#u22)
    v5 = u22
    v6 = nil
    local v8 = nil
    for k, n in v5, v6, v8 do
        v7 = v1[n]
        if type(v7) ~= "table" then
            sort[k] = Reads[v7]
            create[k] = Writes[v7]
        else
            v3, v4 = TableToFunctions(v7)
            sort[k] = v3
            create[k] = v4
        end
    end
    return function() -- Line: 249 -- upvalues: sort (val), u22 (val)
        local v1 = {}
        local v2 = sort
        local v3 = nil
        local v4 = nil
        for i, j in v2, v3, v4 do
            v1[u22[i]] = j()
        end
        return v1
    end, function(p1) -- Line: 256 -- upvalues: create (val), u22 (val)
        local v1 = create
        local v2 = nil
        local v3 = nil
        for i, j in v1, v2, v3 do
            j(p1[u22[i]])
        end
    end
end
function ReadParameters(p1) -- Line: 265
    local v1 = table.create(#p1)
    local v2 = p1
    local v3 = nil
    local v4 = nil
    for i, j in v2, v3, v4 do
        v1[i] = j()
    end
    return table.unpack(v1)
end
function WriteParameters(p1, p2) -- Line: 273
    local v1 = p1
    local v2 = nil
    local v3 = nil
    for i, j in v1, v2, v3 do
        j(p2[i])
    end
end
function Timeout(p1, p2, p3) -- Line: 279
    task.defer(p1[p2].Yielded, p3)
    p1[p2] = nil
end
if not (RunService:IsServer()) then
    u50 = {Index = 0}
    u51 = v1:WaitForChild("RemoteEvent")
    u109 = 0
    local u112 = task.spawn(function() -- Line: 418 -- upvalues: u53 (ref), u51 (ref)
        local v1
        while true do
            coroutine.yield()
            if 0 < u53.BufferOffset then
                v1 = buffer.create(u53.BufferOffset)
                buffer.copy(v1, 0, u53.Buffer, 0, u53.BufferOffset)
                if u53.InstancesOffset ~= 0 then
                    u51:FireServer(v1, u53.Instances)
                    u53.InstancesOffset = 0
                    table.clear(u53.Instances)
                    u53.BufferOffset = 0
                else
                    u51:FireServer(v1)
                end
            end
        end
    end)
    local function u113(p1, p2, ...) -- Line: 436 -- upvalues: Import (val), u53 (ref), NumberU8_2 (val), WriteParameters (ref), Export (val)
        if p1.OnClientInvoke == nil then
            warn("OnClientInvoke not found for packet:", p1.Name, "discarding event:", ...)
            return
        end
        local v1 = {p1.OnClientInvoke(...)}
        Import(u53)
        NumberU8_2(p1.Id)
        NumberU8_2(p2 + 128)
        WriteParameters(p1.ResponseWrites, v1)
        u53 = Export()
    end
    u51.OnClientEvent:Connect(function(p1, p2) -- Line: 449 -- upvalues: Import (val), Ended (val), u47 (val), NumberU8 (val), Task (val), u113 (val), ReadParameters (ref), u50 (ref)
        local v1
        local v2 = {BufferOffset = 0, InstancesOffset = 0, Buffer = p1, BufferLength = buffer.len(p1)}
        local v3 = p2
        if not v3 then
            v3 = {}
        end
        v2.Instances = v3
        Import(v2)
        while Ended() == false do
            v1 = u47[NumberU8()]
            if not v1.ResponseReads then
                v1.OnClientEvent:Fire(ReadParameters(v1.Reads))
            else
                v2 = NumberU8()
                if v2 >= 128 then
                    v2 = v2 - 128
                    v3 = u50[v2]
                    if not v3 then
                        warn("Response thread not found for packet:", v1.Name, "discarding response:", ReadParameters(v1.ResponseReads))
                    else
                        task.cancel(v3.Timeout)
                        task.defer(v3.Yielded, ReadParameters(v1.ResponseReads))
                        u50[v2] = nil
                    end
                else
                    Task:Defer(u113, v1, v2, ReadParameters(v1.Reads))
                end
            end
        end
    end)
    u51.AttributeChanged:Connect(function(p1) -- Line: 485 -- upvalues: u47 (val), u51 (ref)
        local v1 = u47[p1]
        if v1 then
            if v1.Id then
                u47[v1.Id] = nil
            end
            v1.Id = u51:GetAttribute(p1)
            if v1.Id then
                u47[v1.Id] = v1
            end
        end
    end)
    RunService.Heartbeat:Connect(function(p1) -- Line: 498 -- upvalues: u109 (ref), u112 (val)
        u109 = u109 + p1
        if 0.016666666666666666 < u109 then
            u109 = u109 % 0.016666666666666666
            task.defer(u112)
        end
    end)
else
    u48 = {}
    u49 = {}
    u51 = Instance.new("RemoteEvent", v1)
    local u81 = {}
    local u84 = task.spawn(function() -- Line: 298 -- upvalues: u53 (ref), u51 (ref), u48 (ref), u81 (val)
        local v1, v2, v3, v4
        while true do
            coroutine.yield()
            if 0 >= u53.BufferOffset then
                v1 = u48
                v2 = nil
                v3 = nil
                for i, j in v1, v2, v3 do
                    v4 = buffer.create(j.BufferOffset)
                    buffer.copy(v4, 0, j.Buffer, 0, j.BufferOffset)
                    if j.InstancesOffset ~= 0 then
                        u51:FireClient(i, v4, j.Instances)
                    else
                        u51:FireClient(i, v4)
                    end
                end
                table.clear(u48)
                table.clear(u81)
            else
                v1 = buffer.create(u53.BufferOffset)
                buffer.copy(v1, 0, u53.Buffer, 0, u53.BufferOffset)
                if u53.InstancesOffset ~= 0 then
                    u51:FireAllClients(v1, u53.Instances)
                    u53.InstancesOffset = 0
                    table.clear(u53.Instances)
                    u53.BufferOffset = 0
                else
                    u51:FireAllClients(v1)
                end
            end
        end
    end)
    local function u85(p1, p2, p3, ...) -- Line: 327 -- upvalues: RunService (val), Import (val), u48 (ref), NumberU8_2 (val), WriteParameters (ref), Export (val)
        if p1.OnServerInvoke == nil then
            if RunService:IsStudio() then
                warn("OnServerInvoke not found for packet:", p1.Name, "discarding event:", ...)
            end
            return
        end
        local v1 = {p1.OnServerInvoke(p2, ...)}
        if p2.Parent == nil then
            return
        end
        local v2 = u48[p2]
        if not v2 then
            v2 = {
                BufferLength = 128,
                BufferOffset = 0,
                InstancesOffset = 0,
                Buffer = buffer.create(128),
                Instances = {},
            }
        end
        Import(v2)
        NumberU8_2(p1.Id)
        NumberU8_2(p3 + 128)
        WriteParameters(p1.ResponseWrites, v1)
        u48[p2] = Export()
    end
    local function u86(p1, p2, p3) -- Line: 351 -- upvalues: u81 (val), RunService (val), Import (val), Ended (val), u47 (val), NumberU8 (val), Task (val), u85 (val), ReadParameters (ref), u49 (ref)
        local v1
        local v2 = u81[p1] or 0
        local v3 = buffer.len(p2)
        local v4 = v2 + math.max(v3, 800)
        if 8000 < v4 then
            if RunService:IsStudio() then
                warn(p1.Name, "is exceeding the data/rate limit; some events may be dropped")
            end
            return
        end
        u81[p1] = v4
        local v5 = {BufferOffset = 0, InstancesOffset = 0, Buffer = p2, BufferLength = buffer.len(p2)}
        v3 = p3
        if not v3 then
            v3 = {}
        end
        v5.Instances = v3
        Import(v5)
        local v6 = p1
        while Ended() == false do
            v2 = u47[NumberU8()]
            if not v2.ResponseReads then
                v2.OnServerEvent:Fire(v6, ReadParameters(v2.Reads))
            else
                v5 = NumberU8()
                if v5 >= 128 then
                    v5 = v5 - 128
                    v3 = u49[v6][v5]
                    if v3 then
                        task.cancel(v3.Timeout)
                        task.defer(v3.Yielded, ReadParameters(v2.ResponseReads))
                        v1 = u49[v6]
                        v1[v5] = nil
                    elseif not (RunService:IsStudio()) then
                        ReadParameters(v2.ResponseReads)
                    else
                        warn("Response thread not found for packet:", v2.Name, "discarding response:", ReadParameters(v2.ResponseReads))
                    end
                else
                    Task:Defer(u85, v2, v6, v5, ReadParameters(v2.Reads))
                end
            end
        end
    end
    u51.OnServerEvent:Connect(function(p1, ...) -- Line: 397 -- upvalues: u86 (val), RunService (val)
        local v1
        _, v1 = pcall(u86, p1, ...)
        if v1 and RunService:IsStudio() then
            warn(p1.Name, v1)
        end
    end)
    Players.PlayerRemoving:Connect(function(p1) -- Line: 404 -- upvalues: u48 (ref), u49 (ref), u81 (val)
        u48[p1] = nil
        u49[p1] = nil
        u81[p1] = nil
    end)
    RunService.Heartbeat:Connect(function(p1) -- Line: 410 -- upvalues: u84 (val)
        task.defer(u84)
    end)
end
u109 = setmetatable(Types.Types, {
    __call = function(p1, p2, ...) -- Line: 55 -- upvalues: u47 (val), u46 (val), RunService (val), u52 (ref), Signal (val), u51 (ref), ParametersToFunctions (ref)
        local v1, v2
        local v3 = u47[p2]
        if v3 then
            return v3
        end
        local v4 = setmetatable({}, u46)
        v4.Name = p2
        if not (RunService:IsServer()) then
            v4.Id = u51:GetAttribute(p2)
            v4.OnClientEvent = Signal()
            if v4.Id then
                u47[v4.Id] = v4
            end
        else
            v4.Id = u52
            v4.OnServerEvent = Signal()
            u51:SetAttribute(p2, u52)
            u47[u52] = v4
            u52 = u52 + 1
        end
        v1, v2 = ParametersToFunctions(table.pack(...))
        v4.Reads = v1
        v4.Writes = v2
        u47[v4.Name] = v4
        return v4
    end,
})
return u109