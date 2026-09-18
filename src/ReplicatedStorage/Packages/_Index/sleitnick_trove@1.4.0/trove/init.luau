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
--          File: ReplicatedStorage.Packages._Index.sleitnick_trove@1.4.0.trove
--                               Dumped in 0.00112 seconds
--                          Bytecode version 9  |  22 functions

local RunService = game:GetService("RunService")
local u6 = newproxy()
local u8 = newproxy()
local v1 = {"Destroy", "Disconnect", "destroy", "disconnect"}
local u15 = table.freeze(v1)
local function GetObjectCleanupFunction(p1, p2) -- Line: 124 -- upvalues: u6 (val), u8 (val), u15 (val)
    local v1
    local v2 = typeof(p1)
    if v2 == "function" then
        return u6
    end
    if v2 == "thread" then
        return u8
    end
    if p2 then
        return p2
    end
    if v2 == "Instance" then
        return "Destroy"
    end
    if v2 == "RBXScriptConnection" then
        return "Disconnect"
    end
    if v2 ~= "table" then
        v1 = ("failed to get cleanup function for object %*: %*"):format(v2, p1)
        error(v1, 3)
        return
    end
    local v3 = u15
    v1 = nil
    local v4 = nil
    for i, j in v3, v1, v4 do
        if typeof(p1[j]) == "function" then
            return j
        end
    end
    v1 = ("failed to get cleanup function for object %*: %*"):format(v2, p1)
    error(v1, 3)
end
local function AssertPromiseLike(p1) -- Line: 152
    if typeof(p1) ~= "table" then
        error("did not receive a promise as an argument", 3)
    elseif typeof(p1.getStatus) ~= "function" then
        error("did not receive a promise as an argument", 3)
    elseif typeof(p1.finally) ~= "function" then
        error("did not receive a promise as an argument", 3)
    elseif typeof(p1.cancel) ~= "function" then
        error("did not receive a promise as an argument", 3)
    end
end
local u18 = {}
u18.__index = u18
function u18.new() -- Line: 179 -- upvalues: u18 (val)
    local v1 = setmetatable({}, u18)
    v1._objects = {}
    v1._cleaning = false
    return v1
end
function u18:Add(p2, p3) -- Line: 238 -- upvalues: GetObjectCleanupFunction (val)
    if self._cleaning then
        error("cannot call trove:Add() while cleaning", 2)
    end
    local v1 = GetObjectCleanupFunction(p2, p3)
    table.insert(self._objects, {p2, v1})
    return p2
end
function u18:Clone(p2) -- Line: 260
    if self._cleaning then
        error("cannot call trove:Clone() while cleaning", 2)
    end
    return self:Add(p2:Clone())
end
function u18:Construct(p2, ...) -- Line: 303
    if self._cleaning then
        error("Cannot call trove:Construct() while cleaning", 2)
    end
    local v1 = nil
    local v2 = type(p2)
    if v2 == "table" then
        v1 = p2.new(...)
    elseif v2 == "function" then
        v1 = p2(...)
    end
    return self:Add(v1)
end
function u18:Connect(p2, p3) -- Line: 336
    if self._cleaning then
        error("Cannot call trove:Connect() while cleaning", 2)
    end
    return self:Add(p2:Connect(p3))
end
function u18:BindToRenderStep(p2, p3, p4) -- Line: 359 -- upvalues: RunService (val)
    if self._cleaning then
        error("cannot call trove:BindToRenderStep() while cleaning", 2)
    end
    RunService:BindToRenderStep(p2, p3, p4)
    self:Add(function() -- Line: 366 -- upvalues: RunService (upval), p2 (val)
        RunService:UnbindFromRenderStep(p2)
    end)
end
function u18.AddPromise(p1, p2) -- Line: 396
    if p1._cleaning then
        error("cannot call trove:AddPromise() while cleaning", 2)
    end
    if typeof(p2) ~= "table" then
        error("did not receive a promise as an argument", 3)
    elseif typeof(p2.getStatus) ~= "function" then
        error("did not receive a promise as an argument", 3)
    elseif typeof(p2.finally) ~= "function" then
        error("did not receive a promise as an argument", 3)
    elseif typeof(p2.cancel) ~= "function" then
        error("did not receive a promise as an argument", 3)
    end
    if p2:getStatus() == "Started" then
        p2:finally(function() -- Line: 403 -- upvalues: p1 (val), p2 (val)
            if p1._cleaning then
                return
            end
            p1:_findAndRemoveFromObjects(p2, false)
        end)
        p1:Add(p2, "cancel")
    end
    return p2
end
function u18.Remove(p1, p2) -- Line: 428
    if p1._cleaning then
        error("cannot call trove:Remove() while cleaning", 2)
    end
    return p1:_findAndRemoveFromObjects(p2, true)
end
function u18.Extend(p1) -- Line: 457 -- upvalues: u18 (val)
    if p1._cleaning then
        error("cannot call trove:Extend() while cleaning", 2)
    end
    return p1:Construct(u18)
end
function u18:Clean() -- Line: 477
    if self._cleaning then
        return
    end
    self._cleaning = true
    local _objects = self._objects
    local v1 = nil
    local v2 = nil
    for i, j in _objects, v1, v2 do
        self:_cleanupObject(j[1], j[2])
    end
    table.clear(self._objects)
    self._cleaning = false
end
function u18.WrapClean(p1) -- Line: 519
    return function() -- Line: 520 -- upvalues: p1 (val)
        p1:Clean()
    end
end
function u18:_findAndRemoveFromObjects(p2, p3) -- Line: 525
    local v1
    local _objects = self._objects
    local v2 = _objects
    local v3 = nil
    local v4 = nil
    for i, j in v2, v3, v4 do
        if j[1] == p2 then
            v1 = #_objects
            _objects[i] = _objects[v1]
            _objects[v1] = nil
            if p3 then
                self:_cleanupObject(j[1], j[2])
            end
            return true
        end
    end
    return false
end
function u18._cleanupObject(p1, p2, p3) -- Line: 545 -- upvalues: u6 (val), u8 (val)
    if p3 == u6 then
        p2()
        return
    end
    if p3 == u8 then
        pcall(task.cancel, p2)
        return
    end
    p2[p3](p2)
end
function u18.AttachToInstance(p1, p2) -- Line: 585
    if p1._cleaning then
        error("cannot call trove:AttachToInstance() while cleaning", 2)
    elseif not (p2:IsDescendantOf(game)) then
        error("instance is not a descendant of the game hierarchy", 2)
    end
    return p1:Connect(p2.Destroying, function() -- Line: 592 -- upvalues: p1 (val)
        p1:Destroy()
    end)
end
function u18:Destroy() -- Line: 606
    self:Clean()
end
return {new = u18.new}