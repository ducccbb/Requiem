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
--         File: ReplicatedStorage.Client.Interfaces.Components.Primitives.Label
--                              Dumped in 0.000858 seconds
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
local Hooks = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useRem = require(Hooks:WaitForChild("useRem"))
local Hooks_2 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useTheme = require(Hooks_2:WaitForChild("useTheme"))
local Utilities = v1.Parent.Parent:WaitForChild("Utilities")
local FillProps = require(Utilities:WaitForChild("FillProps"))
return react.memo(function(p1) -- Line: 33 -- upvalues: useRem (val), useTheme (val), react (val), FillProps (val)
    local Font
    local v1 = useRem()
    local createElement = react.createElement
    local v2 = {BackgroundTransparency = 1, Text = p1.Text}
    local TextColor3 = p1.TextColor3
    if not TextColor3 then
        TextColor3 = useTheme().Text.Primary
    end
    v2.TextColor3 = TextColor3
    local Size = p1.Size
    if not Size then
        local v3 = UDim2.fromScale(1, 0)
        Size = v3 + UDim2.fromOffset(0, v1(p1.TextSize or 14))
    end
    v2.Size = Size
    v2.TextScaled = p1.TextScaled or true
    if p1.FontFace then
        Font = nil
    else
        Font = p1.Font
        if not Font then
            Font = Enum.Font.SourceSans
            if not Font then
                Font = nil
            end
        end
    end
    v2.Font = Font
    v2.FontFace = p1.FontFace or nil
    return createElement("TextLabel", FillProps(p1, v2))
end)