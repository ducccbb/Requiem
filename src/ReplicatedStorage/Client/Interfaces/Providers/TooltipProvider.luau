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
--          File: ReplicatedStorage.Client.Interfaces.Providers.TooltipProvider
--                              Dumped in 0.000400 seconds
--                          Bytecode version 9  |  5 functions

local TooltipContext
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
if not _G.TooltipContext then
    _G.TooltipContext = react.createContext(nil)
end
TooltipContext = _G.TooltipContext
return {
    TooltipProvider = function(p1) -- Line: 46 -- upvalues: react (val), TooltipContext (ref)
        local u10, u14, u15, u23, u24, u28, u29, u4, u5, u9
        u4, u5 = react.useState(false)
        u9, u10 = react.useState("")
        u14, u15 = react.useState("")
        u23, u24 = react.useState(Color3.fromRGB(255, 255, 255))
        u28, u29 = react.useState(nil)
        local function show(p1, p2, p3, p4) -- Line: 55 -- upvalues: u5 (val), u10 (val), u15 (val), u29 (val), u24 (val)
            u5(true)
            u10(p1)
            u15(p2)
            u29(p3)
            local v1 = p4
            if not v1 then
                v1 = Color3.fromRGB(255, 255, 255)
            end
            u24(v1)
        end
        local function hide() -- Line: 65 -- upvalues: u5 (val)
            u5(false)
        end
        local v1 = react.useMemo(function() -- Line: 69 -- upvalues: show (val), hide (val), u4 (val), u9 (val), u14 (val), u23 (val), u28 (val)
            return {
                show = show,
                hide = hide,
                visible = u4,
                header = u9,
                body = u14,
                color = u23,
                position = u28,
            }
        end, {
            show,
            u4,
            u9,
            u14,
            u23,
            u28,
        })
        return react.createElement(TooltipContext.Provider, {value = v1}, p1.children)
    end,
    TooltipContext = TooltipContext,
}