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
--      File: ReplicatedStorage.Client.Interfaces.Components.Editor.Universal.Text
--                              Dumped in 0.000401 seconds
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
local Utilities = v1.Parent.Parent.Parent:WaitForChild("Utilities")
local FillProps = require(Utilities:WaitForChild("FillProps"))
local Hooks = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useRem = require(Hooks:WaitForChild("useRem"))
local Hooks_2 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useTextScale = require(Hooks_2:WaitForChild("useTextScale"))
return react.memo(function(p1) -- Line: 35 -- upvalues: useTextScale (val), useRem (val), react (val), FillProps (val)
    local Bold
    local v1 = useTextScale()
    local v2 = useRem()
    local v3 = p1.Upscale or 1
    local v4 = p1.FontSize or 14
    local createElement = react.createElement
    local Native = p1.Native
    if not Native then
        Native = {}
    end
    local v5 = {TextTransparency = 0.32, BackgroundTransparency = 1, ZIndex = 3}
    local new = Font.new
    if not p1.Bold then
        Bold = Enum.FontWeight.Regular
    else
        Bold = Enum.FontWeight.Bold
        if not Bold then
            Bold = Enum.FontWeight.Regular
        end
    end
    v5.FontFace = new("rbxasset://fonts/families/SourceSansPro.json", Bold)
    v5.Text = p1.Text
    v5.TextColor3 = Color3.fromRGB(255, 255, 255)
    v5.TextSize = v1(v4 * v3)
    v5.TextXAlignment = Enum.TextXAlignment.Left
    v5.AnchorPoint = Vector2.new(0, 0.5)
    v5.Size = UDim2.fromOffset(0, v2(14 * v3))
    v5.AutomaticSize = Enum.AutomaticSize.X
    v5.Position = UDim2.fromScale(0, 0.5)
    local v6 = FillProps(Native, v5)
    return createElement("TextLabel", v6, p1.children)
end)