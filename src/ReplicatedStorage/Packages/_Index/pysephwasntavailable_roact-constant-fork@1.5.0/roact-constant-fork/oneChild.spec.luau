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
--File: ReplicatedStorage.Packages._Index.pysephwasntavailable_roact-constant-fork@1.5.0.roact-constant-fork.oneChild.spec
--                              Dumped in 0.000282 seconds
--                          Bytecode version 9  |  7 functions

return function() -- Line: 1
    local createElement = require(script.Parent.createElement)
    local oneChild = require(script.Parent.oneChild)
    it("should get zero children from a table", function() -- Line: 6 -- upvalues: oneChild (val)
        expect(oneChild({})).to.equal(nil)
    end)
    it("should get exactly one child", function() -- Line: 12 -- upvalues: createElement (val), oneChild (val)
        local Frame = createElement("Frame")
        expect(oneChild({foo = Frame})).to.equal(Frame)
    end)
    it("should error with more than one child", function() -- Line: 21 -- upvalues: createElement (val), oneChild (val)
        local u0 = {a = createElement("Frame"), b = createElement("Frame")}
        expect(function() -- Line: 27 -- upvalues: oneChild (upval), u0 (val)
            oneChild(u0)
        end).to.throw()
    end)
    it("should handle being passed nil", function() -- Line: 32 -- upvalues: oneChild (val)
        expect(oneChild(nil)).to.equal(nil)
    end)
end