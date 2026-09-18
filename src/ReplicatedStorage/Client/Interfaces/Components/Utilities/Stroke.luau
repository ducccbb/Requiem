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
--         File: ReplicatedStorage.Client.Interfaces.Components.Utilities.Stroke
--                              Dumped in 0.000384 seconds
--                          Bytecode version 9  |  2 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local Color = require(v1.Parent:WaitForChild("Color"))
local FillProps = require(v1.Parent:WaitForChild("FillProps"))
local Hooks = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useTheme = require(Hooks:WaitForChild("useTheme"))
return function(p1) -- Line: 40 -- upvalues: useTheme (val), Color (val), react (val), FillProps (val)
    local v1
    local Color_2 = p1.Color
    if not Color_2 then
        Color_2 = useTheme().PageBackground
    end
    local Range = p1.Range
    if not Range then
        Range = {Min = -1, Max = 1}
    end
    local v2 = Color.GetDarkness(Color_2)
    if not (Color.IsLight(Color_2)) then
        v1 = math.pow(v2, p1.Power or 8)
    else
        v1 = -math.pow(1 - v2, p1.Power or 8)
        if not v1 then
            v1 = math.pow(v2, p1.Power or 8)
        end
    end
    local Native = p1.Native
    if not Native then
        Native = {}
    end
    local v3 = FillProps(Native, {Thickness = 1, Color = Color.Brighten(Color_2, (math.clamp(v1, Range.Min, Range.Max))), Transparency = p1.Transparency or 0, ApplyStrokeMode = Enum.ApplyStrokeMode.Border})
    return react.createElement("UIStroke", v3, p1.children)
end