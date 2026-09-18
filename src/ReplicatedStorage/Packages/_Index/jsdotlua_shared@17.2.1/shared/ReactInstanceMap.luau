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
--File: ReplicatedStorage.Packages._Index.jsdotlua_shared@17.2.1.shared.ReactInstanceMap
--                              Dumped in 0.000667 seconds
--                          Bytecode version 9  |  6 functions

local v1 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local Error = v1.Error
local inspect = v1.util.inspect
local getComponentName = require(script.Parent:WaitForChild("getComponentName"))
local v2 = {}
local function isValidFiber(p1) -- Line: 33
    local v1 = if p1.tag ~= nil then if p1.subtreeFlags ~= nil then if p1.lanes ~= nil then p1.childLanes ~= nil else false else false else false
    return v1
end
function v2.remove(p1) -- Line: 40
    p1._reactInternals = nil
end
function v2.get(p1) -- Line: 44 -- upvalues: Error (val), getComponentName (val), inspect (val)
    local alternate, v1
    local _reactInternals = p1._reactInternals
    local v2 = if _reactInternals.tag ~= nil then if _reactInternals.subtreeFlags ~= nil then if _reactInternals.lanes ~= nil then _reactInternals.childLanes ~= nil else false else false else false
    if not v2 then
        v1 = getComponentName(p1) or "UNNAMED Component"
        error(Error.new("invalid fiber in " .. v1 .. " during get from ReactInstanceMap! " .. inspect(_reactInternals)))
        return _reactInternals
    end
    if _reactInternals.alternate ~= nil then
        alternate = _reactInternals.alternate
        v2 = if alternate.tag ~= nil then if alternate.subtreeFlags ~= nil then if alternate.lanes ~= nil then alternate.childLanes ~= nil else false else false else false
        if not v2 then
            v1 = getComponentName(p1) or "UNNAMED alternate"
            local v3 = getComponentName(p1) or "UNNAMED Component"
            error(Error.new("invalid alternate fiber (" .. v1 .. ") in " .. v3 .. " during get from ReactInstanceMap! " .. inspect(_reactInternals.alternate)))
        end
    end
    return _reactInternals
end
function v2.has(p1) -- Line: 74
    local v1 = p1._reactInternals ~= nil
    return v1
end
function v2.set(p1, p2) -- Line: 78 -- upvalues: getComponentName (val), inspect (val), Error (val)
    local alternate, v1, v2, v3, v4, v5, v6
    local return_ = p2
    v1, v2 = p1, p2
    while return_ ~= nil do
        v5 = return_
        v4 = if v5.tag ~= nil then if v5.subtreeFlags ~= nil then if v5.lanes ~= nil then v5.childLanes ~= nil else false else false else false
        if not v4 then
            v5 = getComponentName(v1) or "UNNAMED Component"
            v3 = "invalid fiber in " .. v5 .. " being set in ReactInstanceMap! " .. inspect(return_) .. "\n"
            if v2 ~= return_ then
                v3 = v3 .. " (from original fiber " .. (getComponentName(v1) or "UNNAMED Component") .. ")"
            end
            error(Error.new(v3))
        elseif return_.alternate ~= nil then
            alternate = return_.alternate
            v4 = if alternate.tag ~= nil then if alternate.subtreeFlags ~= nil then if alternate.lanes ~= nil then alternate.childLanes ~= nil else false else false else false
            if not v4 then
                v5 = getComponentName(v1) or "UNNAMED alternate"
                v6 = getComponentName(v1) or "UNNAMED Component"
                v3 = "invalid alternate fiber (" .. v5 .. ") in " .. v6 .. " being set in ReactInstanceMap! " .. inspect(return_.alternate) .. "\n"
                if v2 ~= return_ then
                    v3 = v3 .. " (from original fiber " .. (getComponentName(v1) or "UNNAMED Component") .. ")"
                end
                error(Error.new(v3))
            end
        end
        return_ = return_.return_
    end
    v1._reactInternals = v2
end
return v2