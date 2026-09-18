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
--                   File: ReplicatedStorage.Common.Types.Reputations
--                              Dumped in 0.000305 seconds
--                          Bytecode version 9  |  2 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
return {
    getReputationString = function(p1) -- Line: 52
        if 0 > p1 then
            if 21 > p1 then
                if 41 > p1 then
                    if 61 > p1 then
                        if 81 <= p1 then
                            if p1 <= 100 then
                                return "The civilians are ecstatic about the %s."
                            end
                            return "The civilians are indifferent about the %s."
                        end
                        return "The civilians are indifferent about the %s."
                    end
                    if p1 <= 80 then
                        return "The civilians actively enjoy the %s."
                    end
                    if 81 > p1 then
                        return "The civilians are indifferent about the %s."
                    end
                    if p1 <= 100 then
                        return "The civilians are ecstatic about the %s."
                    end
                    return "The civilians are indifferent about the %s."
                elseif p1 <= 60 then
                    return "The civilians are neutral about the %s."
                end
            elseif p1 <= 40 then
                return "The civilians currently dislike the %s."
            end
        elseif p1 <= 20 then
            return "The civilians currently hate the %s."
        end
    end,
}