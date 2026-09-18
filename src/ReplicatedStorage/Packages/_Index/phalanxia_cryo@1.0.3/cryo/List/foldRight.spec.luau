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
-- File: ReplicatedStorage.Packages._Index.phalanxia_cryo@1.0.3.cryo.List.foldRight.spec
--                              Dumped in 0.000427 seconds
--                          Bytecode version 9  |  12 functions

return function() -- Line: 1
    local foldRight = require(script.Parent.foldRight)
    it("should call the callback", function() -- Line: 4 -- upvalues: foldRight (val)
        local u4 = 0
        foldRight({1, 2, 3}, function() -- Line: 8 -- upvalues: u4 (ref)
            u4 = u4 + 1
        end, 0)
        expect(u4).to.equal(3)
    end)
    it("should not call the callback when the list is empty", function() -- Line: 15 -- upvalues: foldRight (val)
        local u0
        foldRight({}, function() -- Line: 18 -- upvalues: u0 (ref)
            u0 = true
        end, 0)
        expect(false).to.equal(false)
    end)
    it("should call the callback for each element", function() -- Line: 25 -- upvalues: foldRight (val)
        local v1 = {4, 5, 6}
        local u4 = {}
        foldRight(v1, function(p1, p2, p3) -- Line: 29 -- upvalues: u4 (val)
            u4[p3] = p2
            return p1
        end, 0)
        expect(#u4).to.equal(#v1)
        for k, v in pairs(v1) do
            expect(v).to.equal(u4[k])
        end
    end)
    it("should pass the same modified initial value to the callback", function() -- Line: 41 -- upvalues: foldRight (val)
        local u4 = {}
        foldRight({5, 4, 3}, function(p1) -- Line: 45 -- upvalues: u4 (val)
            expect(p1).to.equal(u4)
            return p1
        end, u4)
    end)
    it("should call the callback in the correct order", function() -- Line: 51 -- upvalues: foldRight (val)
        local u0 = {5, 4, 3}
        local u4 = 3
        foldRight(u0, function(p1, p2) -- Line: 55 -- upvalues: u0 (val), u4 (ref)
            expect(p2).to.equal(u0[u4])
            u4 = u4 - 1
            return p1
        end, 0)
    end)
end