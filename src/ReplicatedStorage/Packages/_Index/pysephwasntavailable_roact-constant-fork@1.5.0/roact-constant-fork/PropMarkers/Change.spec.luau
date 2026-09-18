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
--File: ReplicatedStorage.Packages._Index.pysephwasntavailable_roact-constant-fork@1.5.0.roact-constant-fork.PropMarkers.Change.spec
--                              Dumped in 0.000219 seconds
--                          Bytecode version 9  |  4 functions

return function() -- Line: 1
    local Type = require(script.Parent.Parent.Type)
    local Change = require(script.Parent.Change)
    it("should yield change listener objects when indexed", function() -- Line: 6 -- upvalues: Type (val), Change (val)
        expect(Type.of(Change.Text)).to.equal(Type.HostChangeEvent)
        expect(Type.of(Change.Selected)).to.equal(Type.HostChangeEvent)
    end)
    it("should yield the same object when indexed again", function() -- Line: 11 -- upvalues: Change (val)
        local Text = Change.Text
        expect(Text).to.equal(Change.Text)
        expect(Text).never.to.equal(Change.Selected)
    end)
end