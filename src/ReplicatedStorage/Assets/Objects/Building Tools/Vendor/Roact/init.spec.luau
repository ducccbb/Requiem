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
--     File: ReplicatedStorage.Assets.Objects.Building Tools.Vendor.Roact.init.spec
--                              Dumped in 0.000337 seconds
--                          Bytecode version 9  |  3 functions

local u0 = script
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
return function() -- Line: 8 -- upvalues: u0 (val)
    local Parent = require(u0.Parent)
    it("should load with all public APIs", function() -- Line: 11 -- upvalues: Parent (val)
        local v1, v2, v3, v4
        local v5 = {
            createElement = "function",
            createFragment = "function",
            createRef = "function",
            createBinding = "function",
            joinBindings = "function",
            mount = "function",
            unmount = "function",
            update = "function",
            oneChild = "function",
            setGlobalConfig = "function",
            createContext = "function",
            reify = "function",
            teardown = "function",
            reconcile = "function",
            Component = true,
            PureComponent = true,
            Portal = true,
            Children = true,
            Event = true,
            Change = true,
            Ref = true,
            None = true,
            UNSTABLE = true,
        }
        expect(Parent).to.be.ok()
        for k, v in pairs(v5) do
            if typeof(v) ~= "string" then
                v2 = Parent[k] ~= nil
            else
                v2 = typeof(Parent[k]) == v
            end
            if not v2 then
                if typeof(v) ~= "boolean" then
                    v3 = "of type " .. v
                else
                    v3 = "present"
                end
                v1 = tostring(k)
                v4 = ("Expected public API member %q to be %s, but instead it was of type %s"):format(v1, v3, (typeof(Parent[k])))
                error(v4)
            end
        end
        for k2 in pairs(Parent) do
            if v5[k2] == nil then
                v2 = ("Found unknown public API key %q!"):format((tostring(k2)))
                error(v2)
            end
        end
    end)
end