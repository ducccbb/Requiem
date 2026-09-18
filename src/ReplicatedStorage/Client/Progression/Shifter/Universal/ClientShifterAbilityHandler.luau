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
--File: ReplicatedStorage.Client.Progression.Shifter.Universal.ClientShifterAbilityHandler
--                              Dumped in 0.000568 seconds
--                          Bytecode version 9  |  3 functions

local u0 = script
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Players = game:GetService("Players")
local ClientShifterHealthHandler = require(u0.Parent:WaitForChild("ClientShifterHealthHandler"))
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Player = require(Namespaces:WaitForChild("Player"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Types = Common_2:WaitForChild("Types")
local Shifter = require(Types:WaitForChild("Shifter"))
local u66 = {}
task.spawn(function() -- Line: 81 -- upvalues: u0 (val), u66 (val)
    local v1
    for i, j in u0.Parent.Parent.Types:GetChildren() do
        u66[j.Name] = {}
        for k, n in j:GetChildren() do
            if n:IsA("ModuleScript") then
                v1 = u66[j.Name]
                v1[n.Name] = require(n)
            end
        end
    end
end)
return {
    onHandleShifterAbilityRequest = function(p1, p2, p3, ...) -- Line: 39 -- upvalues: Players (val), u66 (val), ClientShifterHealthHandler (val), Player (val), Shifter (val)
        local Stamina
        local v1 = p1.owner == Players.LocalPlayer.UserId
        local v2 = u66[p1.variant]
        local v3 = v2
        if v3 then
            v3 = v2[p2]
        end
        if not v3 then
            return
        end
        if not v1 then
            if v3.onAbilityReplicated then
                local v4 = {v3.onAbilityReplicated(p1, p3, ...)}
                if v4[1] then
                    table.remove(v4, 1)
                    Player.Shifter.post(Shifter.Effects.Respond, p3, table.unpack(v4))
                end
            end
            return
        end
        if v3.onAbilityRequested(p1, ...) == false then
            return
        end
        local v5 = p1.abilities[p2]
        if not v5 then
            Stamina = 0
        else
            Stamina = v5.Stamina
            if not Stamina then
                Stamina = 0
            end
        end
        if 0 >= Stamina then
            return
        end
        ClientShifterHealthHandler.onReduceStamina(p1, Stamina)
    end,
}