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
--   File: ReplicatedStorage.Assets.Objects.Building Tools.Vendor.Roact.oneChild.spec
--                              Dumped in 0.000278 seconds
--                          Bytecode version 9  |  7 functions

local u0 = script
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
return function() -- Line: 8 -- upvalues: u0 (val)
    local createElement = require(u0.Parent.createElement)
    local oneChild = require(u0.Parent.oneChild)
    it("should get zero children from a table", function() -- Line: 13 -- upvalues: oneChild (val)
        expect(oneChild({})).to.equal(nil)
    end)
    it("should get exactly one child", function() -- Line: 19 -- upvalues: createElement (val), oneChild (val)
        local Frame = createElement("Frame")
        expect(oneChild({foo = Frame})).to.equal(Frame)
    end)
    it("should error with more than one child", function() -- Line: 28 -- upvalues: createElement (val), oneChild (val)
        local u0 = {a = createElement("Frame"), b = createElement("Frame")}
        expect(function() -- Line: 34 -- upvalues: oneChild (upval), u0 (val)
            oneChild(u0)
        end).to.throw()
    end)
    it("should handle being passed nil", function() -- Line: 39 -- upvalues: oneChild (val)
        expect(oneChild(nil)).to.equal(nil)
    end)
end