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
--              File: ReplicatedStorage.Client.Interfaces.Hooks.useMenuPage
--                              Dumped in 0.000277 seconds
--                          Bytecode version 9  |  4 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local State = require(Utilities:WaitForChild("State"))
return function(p1) -- Line: 24 -- upvalues: react (val), State (val)
    local u5, v1
    v1, u5 = react.useState(false)
    react.useEffect(function() -- Line: 27 -- upvalues: State (upval), p1 (val), u5 (val)
        local isMenuOpen
        _, _, isMenuOpen = State("isMenuOpen")
        isMenuOpen(function(a1) -- Line: 30 -- upvalues: p1 (upval), u5 (upval)
            if not a1 or a1.page ~= p1 then
                u5(false)
                return
            end
            if a1.open then
                u5(true)
                return
            end
            u5(false)
        end)
    end, {})
    return v1
end