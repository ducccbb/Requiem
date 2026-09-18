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
--     File: ReplicatedStorage.Client.Interfaces.Components.Utilities.Space3D.Screen
--                              Dumped in 0.000419 seconds
--                          Bytecode version 9  |  9 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local GuiService = game:GetService("GuiService")
local Component = require(v1.Parent.Component)
require(v1.Parent.Types)
local u25 = {}
u25.__index = u25
function u25.new(p1, p2) -- Line: 18 -- upvalues: u25 (val), Component (val)
    local u2 = {}
    local u8 = setmetatable({partIndex = u2, rootGui = p1, displayDistance = p2, rootOffset = CFrame.new()}, u25)
    for i, j in p1:GetDescendants() do
        if j:IsA("GuiObject") then
            u2[j] = Component.new(j, u8)
        end
    end
    p1.DescendantAdded:Connect(function(p1) -- Line: 34 -- upvalues: u2 (val), Component (upval), u8 (val)
        if p1:IsA("GuiObject") then
            u2[p1] = Component.new(p1, u8)
        end
    end)
    p1.DescendantRemoving:Connect(function(p1) -- Line: 40 -- upvalues: u2 (val)
        if p1:IsA("GuiObject") then
            local v1 = u2[p1]
            if v1 then
                v1:Disable()
                u2[p1] = nil
            end
        end
    end)
    return u8
end
function u25.GetRealCanvasSize(p1) -- Line: 53
    return workspace.CurrentCamera.ViewportSize
end
function u25.GetInset(p1) -- Line: 57 -- upvalues: GuiService (val)
    return GuiService:GetGuiInset()
end
function u25:GetInsetCanvasSize() -- Line: 61
    local RealCanvasSize = self:GetRealCanvasSize()
    return RealCanvasSize - self:GetInset()
end
function u25.GetIntendedCanvasSize(p1) -- Line: 65
    if p1.rootGui.IgnoreGuiInset then
        return p1:GetRealCanvasSize()
    end
    return p1:GetInsetCanvasSize()
end
function u25.GetComponent(p1, p2) -- Line: 73
    return p1.partIndex[p2]
end
return u25