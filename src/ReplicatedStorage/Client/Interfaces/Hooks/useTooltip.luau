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
--              File: ReplicatedStorage.Client.Interfaces.Hooks.useTooltip
--                              Dumped in 0.000333 seconds
--                          Bytecode version 9  |  5 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local Providers = script.Parent.Parent:WaitForChild("Providers")
local TooltipProvider = require(Providers:WaitForChild("TooltipProvider"))
return function() -- Line: 18 -- upvalues: react (val), TooltipProvider (val)
    local u8, u9, v1, v2
    local u4 = react.useContext(TooltipProvider.TooltipContext)
    u8, u9 = react.useState("")
    v1, v2 = react.useMemo(function() -- Line: 23 -- upvalues: u4 (val), u9 (val), u8 (val)
        return function(p1, p2, p3) -- Line: 24 -- upvalues: u4 (upval), u9 (upval)
            if not u4 then
                warn("useTooltip must be used within a TooltipProvider")
                return
            end
            local v1 = p3.AbsolutePosition + Vector2.new(p3.AbsoluteSize.X / 2, 51)
            u9(p2 .. p1)
            u4.show(p1, p2, {x = v1.X, y = v1.Y})
        end, function() -- Line: 36 -- upvalues: u4 (upval), u8 (upval)
            if not u4 then
                warn("useTooltip must be used within a TooltipProvider")
                return
            end
            if u8 == u4.body .. u4.header then
                u4.hide()
            end
        end
    end, {u8})
    return v1, v2
end