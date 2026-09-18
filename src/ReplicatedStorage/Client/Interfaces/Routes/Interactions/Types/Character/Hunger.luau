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
-- File: ReplicatedStorage.Client.Interfaces.Routes.Interactions.Types.Character.Hunger
--                              Dumped in 0.000263 seconds
--                          Bytecode version 9  |  3 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Interaction = require(Namespaces:WaitForChild("Interaction"))
return {
    interacted = function(...) -- Line: 35 -- upvalues: Interaction (val)
        Interaction.Event.unreliablePost(...)
    end,
    display = {
        header = "Hunger",
        body = function(p1) -- Line: 14
            local Attribute = p1:GetAttribute("Amount")
            if typeof(Attribute) ~= "number" or Attribute == 0 then
                return "Press \"%s\" to interact."
            end
            if 0 < Attribute then
                return (("Press \"%%s\" to restore %* hunger."):format(Attribute))
            end
            return (("Press \"%%s\" to reduce %* hunger."):format((math.abs(Attribute))))
        end,
    },
}