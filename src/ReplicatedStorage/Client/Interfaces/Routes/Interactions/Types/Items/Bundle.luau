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
--   File: ReplicatedStorage.Client.Interfaces.Routes.Interactions.Types.Items.Bundle
--                              Dumped in 0.000226 seconds
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
local v2 = {body = "Press \"%s\" to take bundle from box."}
function v2.header(p1) -- Line: 15
    local v1
    local Attribute = p1:GetAttribute("Item")
    if not Attribute then
        v1 = "Item Bundle"
    else
        v1 = Attribute .. "Bundle"
        if not v1 then
            v1 = "Item Bundle"
        end
    end
    return v1
end
return {
    interacted = function(...) -- Line: 25 -- upvalues: Interaction (val)
        Interaction.Event.unreliablePost(...)
    end,
    display = v2,
}