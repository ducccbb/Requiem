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
--File: ReplicatedStorage.Packages._Index.pysephwasntavailable_roact-constant-fork@1.5.0.roact-constant-fork.createElement
--                              Dumped in 0.000302 seconds
--                          Bytecode version 9  |  2 functions

local Children = require(script.Parent.PropMarkers.Children)
local ElementKind = require(script.Parent.ElementKind)
local Logging = require(script.Parent.Logging)
local Type = require(script.Parent.Type)
local u27 = require(script.Parent.GlobalConfig).get()
return function(p1, p2, p3) -- Line: 37 -- upvalues: u27 (val), Children (val), Logging (val), ElementKind (val), Type (val)
    local v1, v2
    if u27.typeChecks then
        v2 = p1 ~= nil
        assert(v2, "`component` is required")
        v2 = if typeof(p2) ~= "table" then p2 == nil else true
        assert(v2, "`props` must be a table or nil")
        v2 = if typeof(p3) ~= "table" then p3 == nil else true
        assert(v2, "`children` must be a table or nil")
    end
    if p2 ~= nil then
        v1 = p2
    else
        v1 = {}
    end
    if p3 ~= nil then
        if v1[Children] ~= nil then
            Logging.warnOnce("The prop `Roact.Children` was defined but was overridden by the third parameter to createElement!\nThis can happen when a component passes props through to a child element but also uses the `children` argument:\n\n\tRoact.createElement(\"Frame\", passedProps, {\n\t\tchild = ...\n\t})\n\nInstead, consider using a utility function to merge tables of children together:\n\n\tlocal children = mergeTables(passedProps[Roact.Children], {\n\t\tchild = ...\n\t})\n\n\tlocal fullProps = mergeTables(passedProps, {\n\t\t[Roact.Children] = children\n\t})\n\n\tRoact.createElement(\"Frame\", fullProps)")
        end
        v1[Children] = p3
    end
    local v3 = ElementKind.fromComponent(p1)
    v2 = {}
    v2[Type] = Type.Element
    v2[ElementKind] = v3
    v2.component = p1
    v2.props = v1
    if u27.elementTracing then
        local v4 = debug.traceback("", 2)
        v2.source = v4:sub(2)
    end
    return v2
end