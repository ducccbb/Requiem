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
--File: ReplicatedStorage.Packages._Index.pysephwasntavailable_roact-constant-fork@1.5.0.roact-constant-fork.PropMarkers.Event.spec
--                              Dumped in 0.000195 seconds
--                          Bytecode version 9  |  4 functions

return function() -- Line: 1
    local Type = require(script.Parent.Parent.Type)
    local Event = require(script.Parent.Event)
    it("should yield event objects when indexed", function() -- Line: 6 -- upvalues: Type (val), Event (val)
        expect(Type.of(Event.MouseButton1Click)).to.equal(Type.HostEvent)
        expect(Type.of(Event.Touched)).to.equal(Type.HostEvent)
    end)
    it("should yield the same object when indexed again", function() -- Line: 11 -- upvalues: Event (val)
        local MouseButton1Click = Event.MouseButton1Click
        expect(MouseButton1Click).to.equal(Event.MouseButton1Click)
        expect(MouseButton1Click).never.to.equal(Event.Touched)
    end)
end