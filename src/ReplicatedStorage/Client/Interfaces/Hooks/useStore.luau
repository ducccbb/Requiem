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
--               File: ReplicatedStorage.Client.Interfaces.Hooks.useStore
--                              Dumped in 0.000883 seconds
--                          Bytecode version 9  |  10 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local useMemo = react.useMemo
local useRef = react.useRef
local useCallback = react.useCallback
local useEffect = react.useEffect
local useState = react.useState
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
require(Common:WaitForChild("Network"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Utilities = Common_2:WaitForChild("Utilities")
local Table = require(Utilities:WaitForChild("Table"))
local u76 = {}
local u77 = {}
local function isStoreRenderDebugEnabled() -- Line: 34 -- upvalues: RunService (val)
    local v1
    local __STORE_RENDER_DEBUG__ = _G.__STORE_RENDER_DEBUG__
    if __STORE_RENDER_DEBUG__ ~= nil then
        v1 = __STORE_RENDER_DEBUG__ == true
        return v1
    end
    v1 = if _G.__STORE_OBSERVER_DEBUG__ ~= true then RunService:IsStudio() else true
    return v1
end
local function recordStoreRender(p1, p2, p3, p4) -- Line: 42 -- upvalues: u77 (val), u76 (val)
    local v1 = u77[p1]
    if not v1 then
        u77[p1] = {reRenders = 0, skipped = 0, totalMs = 0, maxMs = 0}
    end
    if not p2 then
        v1.skipped = v1.skipped + 1
    else
        v1.reRenders = v1.reRenders + 1
    end
    v1.totalMs = v1.totalMs + p3
    v1.maxMs = math.max(v1.maxMs, p3)
    if p2 then
        local v2 = ("%*:%*"):format(p1, p4)
        local v3 = os.clock()
        local v4 = u76[v2]
        if not v4 then
            u76[v2] = v3
            if p2 then
                print((("[useStore] re-render store:%* from %* (%*ms)"):format(p1, p4, (string.format("%.2f", p3)))))
                return
            end
            print((("[useStore] skipped (unchanged) store:%* from %*"):format(p1, p4)))
            return
        end
        if v3 - v4 < 1 then
            return
        end
        u76[v2] = v3
        if p2 then
            print((("[useStore] re-render store:%* from %* (%*ms)"):format(p1, p4, (string.format("%.2f", p3)))))
            return
        end
        print((("[useStore] skipped (unchanged) store:%* from %*"):format(p1, p4)))
        return
    elseif not _G.__STORE_RENDER_DEBUG_VERBOSE__ then
        return
    end
end
local function areEqual(p1, p2) -- Line: 79 -- upvalues: Table (val)
    return Table.equals(p1, p2)
end
return function(p1, p2) -- Line: 83 -- upvalues: useMemo (val), Players (val), useState (val), useRef (val), useEffect (val), useCallback (val), isStoreRenderDebugEnabled (val), areEqual (val), recordStoreRender (val)
    local u9, v1, v2
    local v3 = {}
    local v4 = useMemo(function() -- Line: 85 -- upvalues: p2 (val), p1 (val), Players (upval)
        if not p2 then
            return p1.current[Players.LocalPlayer].value
        end
        return p2(p1.current[Players.LocalPlayer])
    end, v3)
    v1, u9 = useState(v4)
    local u12 = useRef(p2)
    useEffect(function() -- Line: 97 -- upvalues: u12 (val), p2 (val)
        u12.current = p2
    end)
    local u18 = useRef(v1)
    local u23 = useCallback(function() -- Line: 105 -- upvalues: isStoreRenderDebugEnabled (upval), p1 (val), Players (upval), u12 (val), areEqual (upval), u18 (val), u9 (val), recordStoreRender (upval)
        local v1
        if not (isStoreRenderDebugEnabled()) then
            v1 = nil
        else
            v1 = os.clock()
        end
        local current = u12.current
        if not current then
            function current(p1) -- Line: 108
                local value = p1.value
                if not value then
                    value = {}
                end
                return value
            end
        end
        local v2 = current(p1.current[Players.LocalPlayer])
        local v3 = not areEqual(v2, u18.current)
        if v3 then
            u9(v2)
            u18.current = v2
        end
        if isStoreRenderDebugEnabled() then
            local v4 = (os.clock() - v1) * 1000
            local v5 = debug.info(3, "sl") or "unknown"
            local v6 = tostring(p1.seed)
            recordStoreRender(v6, v3, v4, v5)
        end
    end, {p1})
    useEffect(function() -- Line: 129 -- upvalues: u23 (val), p1 (val), Players (upval)
        u23()
        return p1.observe(Players.LocalPlayer, u23)
    end, {p1, u23})
    v2 = v1
    if not v2 then
        v2 = {}
    end
    return v2
end