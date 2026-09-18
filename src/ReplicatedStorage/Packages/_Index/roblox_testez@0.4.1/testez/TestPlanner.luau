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
--    File: ReplicatedStorage.Packages._Index.roblox_testez@0.4.1.testez.TestPlanner
--                              Dumped in 0.000173 seconds
--                          Bytecode version 9  |  3 functions

local TestPlan = require(script.Parent.TestPlan)
return {
    createPlan = function(p1, p2, p3) -- Line: 26 -- upvalues: TestPlan (val)
        local v1 = TestPlan.new(p2, p3)
        table.sort(p1, function(p1, p2) -- Line: 29
            local v1 = p1.pathStringForSorting < p2.pathStringForSorting
            return v1
        end)
        for i, v in ipairs(p1) do
            v1:addRoot(v.path, v.method)
        end
        return v1
    end,
}