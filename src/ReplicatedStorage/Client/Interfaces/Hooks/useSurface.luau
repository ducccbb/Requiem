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
--              File: ReplicatedStorage.Client.Interfaces.Hooks.useSurface
--                              Dumped in 0.000494 seconds
--                          Bytecode version 9  |  5 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local Components = v1.Parent.Parent:WaitForChild("Components")
local Utilities = Components:WaitForChild("Utilities")
local Space3D = Utilities:WaitForChild("Space3D")
require(Space3D:WaitForChild("Types"))
local useSpace3D = require(v1.Parent:WaitForChild("useSpace3D"))
return function(p1, p2) -- Line: 23 -- upvalues: useSpace3D (val), react (val)
    local Offset, u10, u16
    local u3 = useSpace3D()
    local u7 = react.useRef(nil)
    if not p2 then
        u10 = true
    else
        u10 = p2.Enabled ~= false
    end
    if not p2 then
        u16 = true
    else
        u16 = p2.Compat ~= false
    end
    if not p2 then
        Offset = nil
    else
        Offset = p2.Offset
    end
    react.useEffect(function() -- Line: 31 -- upvalues: p1 (val), u3 (val), u7 (val), Offset (val), u10 (val), u16 (val)
        if not p1 then
            return
        end
        local u4 = u3.getComponent(p1)
        if not u4 then
            return
        end
        u7.current = u4
        local v1 = Offset
        if not v1 then
            v1 = CFrame.new()
        end
        u4.offset = v1
        if not u10 then
            u4:Disable()
        elseif not u16 then
            u4:Enable()
        else
            u4:EnableCompatibility()
        end
        return function() -- Line: 54 -- upvalues: u4 (val), u7 (upval)
            u4:Disable()
            u7.current = nil
        end
    end, {u3, p1, u10, u16})
    react.useEffect(function() -- Line: 60 -- upvalues: u7 (val), Offset (val)
        local current = u7.current
        if not current then
            return
        end
        local v1 = Offset
        if not v1 then
            v1 = CFrame.new()
        end
        current.offset = v1
    end, {Offset})
    return u7
end