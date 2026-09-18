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
--      File: ReplicatedStorage.Client.Interfaces.Components.Menu.SidebarSelection
--                              Dumped in 0.000484 seconds
--                          Bytecode version 9  |  3 functions

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
local SidebarButton = require(v1.Parent:WaitForChild("SidebarButton"))
local Primitives = v1.Parent.Parent:WaitForChild("Primitives")
local VerticalListLayout = require(Primitives:WaitForChild("VerticalListLayout"))
local Hooks = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useRem = require(Hooks:WaitForChild("useRem"))
local Hooks_2 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useTheme = require(Hooks_2:WaitForChild("useTheme"))
return function(p1) -- Line: 33 -- upvalues: useRem (val), useTheme (val), react (val), SidebarButton (val), VerticalListLayout (val)
    local v1, v2
    local v3 = useRem()
    local v4 = useTheme()
    local v5 = {}
    local u87 = p1
    for k, v in pairs(p1.Pages) do
        local u74 = v[1]
        v1 = {Label = u74, Icon = v[2], LayoutOrder = k}
        v2 = u87.Selected == u74
        v1.Selected = v2
        function v1.Clicked() -- Line: 48 -- upvalues: u87 (val), u74 (val)
            u87.Clicked(u74)
        end
        v5[u74] = react.createElement(SidebarButton, v1)
    end
    local v6 = {
        BackgroundTransparency = 0.55,
        BorderSizePixel = 0,
        ZIndex = 2,
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundColor3 = v4.BackgroundSecondary,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0, 0.5),
    }
    local v7 = UDim2.fromScale(0, 1)
    local v8 = v3(140)
    local v9 = math.min(v8, 140)
    v6.Size = v7 + UDim2.fromOffset(v9, 0)
    return react.createElement("Frame", v6, {Container = react.createElement("Frame", {BackgroundTransparency = 1, ZIndex = 2, Size = UDim2.new(1, 0, 1, 0)}, {Layout = react.createElement(VerticalListLayout, {Spacing = 4, VerticalAlignment = Enum.VerticalAlignment.Center})}, v5)})
end