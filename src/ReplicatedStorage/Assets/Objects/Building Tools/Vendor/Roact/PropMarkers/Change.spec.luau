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
--File: ReplicatedStorage.Assets.Objects.Building Tools.Vendor.Roact.PropMarkers.Change.spec
--                              Dumped in 0.000232 seconds
--                          Bytecode version 9  |  4 functions

local u0 = script
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
return function() -- Line: 8 -- upvalues: u0 (val)
    local Type = require(u0.Parent.Parent.Type)
    local Change = require(u0.Parent.Change)
    it("should yield change listener objects when indexed", function() -- Line: 13 -- upvalues: Type (val), Change (val)
        expect(Type.of(Change.Text)).to.equal(Type.HostChangeEvent)
        expect(Type.of(Change.Selected)).to.equal(Type.HostChangeEvent)
    end)
    it("should yield the same object when indexed again", function() -- Line: 18 -- upvalues: Change (val)
        local Text = Change.Text
        expect(Text).to.equal(Change.Text)
        expect(Text).never.to.equal(Change.Selected)
    end)
end