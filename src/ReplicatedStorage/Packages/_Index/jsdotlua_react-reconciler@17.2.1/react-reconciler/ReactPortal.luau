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
--File: ReplicatedStorage.Packages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactPortal
--                              Dumped in 0.000168 seconds
--                          Bytecode version 9  |  2 functions

local REACT_PORTAL_TYPE = require(script.Parent.Parent:WaitForChild("shared")).ReactSymbols.REACT_PORTAL_TYPE
require(script.Parent.Parent:WaitForChild("shared"))
local v1 = {}
function v1.createPortal(p1, p2, p3, p4) -- Line: 17 -- upvalues: REACT_PORTAL_TYPE (val)
    local v1
    if p4 == nil then
        v1 = p4
    else
        v1 = tostring(p4)
    end
    local v2 = {}
    v2["$$typeof"] = REACT_PORTAL_TYPE
    v2.key = v1
    v2.children = p1
    v2.containerInfo = p2
    v2.implementation = p3
    return v2
end
return v1