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
--                    File: ReplicatedStorage.Common.Utilities.Atomic
--                               Dumped in 0.00212 seconds
--                          Bytecode version 9  |  13 functions

local unbindNodeDescend
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local function parsePath(p1) -- Line: 10
    local v1 = string.split(p1, "/")
    local v2 = 1
    local v3 = -1
    for i = #v1, v2, v3 do
        if v1[i] == "" then
            table.remove(v1, i)
        end
    end
    return v1
end
local function isManifestResolved(p1, p2) -- Line: 20
    local v1 = 0
    for k in pairs(p1) do
        v1 = v1 + 1
    end
    local v2 = v1 <= p2
    assert(v2, v1)
    local v3 = v1 == p2
    return v3
end
function unbindNodeDescend(p1, p2) -- Line: 30 -- upvalues: unbindNodeDescend (val)
    if p1.instance == nil then
        return
    end
    p1.instance = nil
    local connections = p1.connections
    if connections then
        for i, v in ipairs(connections) do
            v:Disconnect()
        end
        table.clear(connections)
    end
    if p2 and p1.alias then
        p2[p1.alias] = nil
    end
    local children = p1.children
    if children then
        for k, i2 in pairs(children) do
            unbindNodeDescend(i2, p2)
        end
    end
end
local u15 = {}
u15.__index = u15
function u15.new(p1, p2) -- Line: 60 -- upvalues: parsePath (val), u15 (val)
    local v1 = {}
    local v2 = 1
    for k, v in pairs(p1) do
        v1[k] = parsePath(v)
        v2 = v2 + 1
    end
    local v3 = {
        _boundFn = p2,
        _parsedManifest = v1,
        _manifestSizeTarget = v2,
        _dtorMap = {},
        _connections = {},
        _rootInstToRootNode = {},
        _rootInstToManifest = {},
    }
    return (setmetatable(v3, u15))
end
function u15:_startBoundFn(p2, p3) -- Line: 86
    local _dtorMap = self._dtorMap
    local v1 = _dtorMap[p2]
    if v1 then
        v1()
        _dtorMap[p2] = nil
    end
    local v2 = self._boundFn(p3)
    if v2 then
        _dtorMap[p2] = v2
    end
end
function u15:_stopBoundFn(p2) -- Line: 102
    local _dtorMap = self._dtorMap
    local v1 = _dtorMap[p2]
    if v1 then
        v1()
        _dtorMap[p2] = nil
    end
end
function u15.bindRoot(p1, p2) -- Line: 112 -- upvalues: unbindNodeDescend (val), isManifestResolved (val)
    local children, connections, processNode, u138, u144, v1, v2, v3
    debug.profilebegin("AtomicBinding:BindRoot")
    local _parsedManifest = p1._parsedManifest
    local _rootInstToManifest = p1._rootInstToManifest
    local _manifestSizeTarget = p1._manifestSizeTarget
    local v4 = _rootInstToManifest[p2] == nil
    assert(v4)
    local u156 = {}
    _rootInstToManifest[p2] = u156
    debug.profilebegin("BuildTree")
    v4 = {alias = "root", instance = p2}
    if next(_parsedManifest) then
        v4.children = {}
        v4.connections = {}
    end
    p1._rootInstToRootNode[p2] = v4
    u138, u144 = p1, p2
    for k, v in pairs(_parsedManifest) do
        v1 = v4
        for i, i2 in ipairs(v) do
            v2 = i == #v
            v3 = v1.children[i2]
            if not v3 then
                v3 = {}
            end
            if not v2 then
                children = v3.children
                if not children then
                    children = {}
                end
                v3.children = children
                connections = v3.connections
                if not connections then
                    connections = {}
                end
                v3.connections = connections
            else
                if v3.alias ~= nil then
                    error("Multiple aliases assigned to one instance")
                end
                v3.alias = k
            end
            v1.children[i2] = v3
            v1 = v3
        end
    end
    debug.profileend()
    function processNode(p1) -- Line: 165 -- upvalues: u156 (val), processNode (val), u138 (val), u144 (val), unbindNodeDescend (upval), isManifestResolved (upval), _manifestSizeTarget (val)
        local u3 = assert(p1.instance)
        local children = p1.children
        local alias = p1.alias
        local v1 = not children
        if alias then
            u156[alias] = u3
        end
        if not v1 then
            local function processAddChild(p1) -- Line: 177 -- upvalues: children (val), processNode (upval)
                local v1 = children[p1.Name]
                if not v1 or v1.instance ~= nil then
                    return
                end
                v1.instance = p1
                processNode(v1)
            end
            for i, v in ipairs(u3:GetChildren()) do
                processAddChild(v)
            end
            table.insert(p1.connections, u3.ChildAdded:Connect(processAddChild))
            table.insert(p1.connections, u3.ChildRemoved:Connect(function(p1) -- Line: 188 -- upvalues: children (val), u138 (upval), u144 (upval), unbindNodeDescend (upval), u156 (upval), u3 (val), processAddChild (val)
                local Name = p1.Name
                local v1 = children[Name]
                if not v1 or v1.instance ~= p1 then
                    return
                end
                u138:_stopBoundFn(u144)
                unbindNodeDescend(v1, u156)
                local v2 = v1.instance == nil
                assert(v2)
                local v3 = u3:FindFirstChild(Name)
                if v3 then
                    processAddChild(v3)
                end
            end))
        end
        if v1 and isManifestResolved(u156, _manifestSizeTarget) then
            u138:_startBoundFn(u144, u156)
        end
    end
    debug.profilebegin("ResolveTree")
    processNode(v4)
    debug.profileend()
    debug.profileend()
end
function u15.unbindRoot(p1, p2) -- Line: 241 -- upvalues: unbindNodeDescend (val)
    local _rootInstToRootNode = p1._rootInstToRootNode
    local _rootInstToManifest = p1._rootInstToManifest
    p1:_stopBoundFn(p2)
    local v1 = _rootInstToRootNode[p2]
    if v1 then
        local v2 = assert(_rootInstToManifest[p2])
        unbindNodeDescend(v1, v2)
        _rootInstToRootNode[p2] = nil
    end
    _rootInstToManifest[p2] = nil
end
function u15:destroy() -- Line: 257 -- upvalues: unbindNodeDescend (val)
    local v1
    debug.profilebegin("AtomicBinding:destroy")
    for k, v in pairs(self._dtorMap) do
        v:destroy()
    end
    table.clear(self._dtorMap)
    for i, i2 in ipairs(self._connections) do
        i2:Disconnect()
    end
    table.clear(self._connections)
    for k2, j in pairs(self._rootInstToRootNode) do
        v1 = assert(self._rootInstToManifest[k2])
        unbindNodeDescend(j, v1)
    end
    table.clear(self._rootInstToManifest)
    table.clear(self._rootInstToRootNode)
    debug.profileend()
end
return u15