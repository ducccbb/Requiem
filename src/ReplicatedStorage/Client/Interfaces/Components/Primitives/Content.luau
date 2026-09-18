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
--        File: ReplicatedStorage.Client.Interfaces.Components.Primitives.Content
--                              Dumped in 0.000416 seconds
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
local Utilities = v1.Parent.Parent:WaitForChild("Utilities")
local Theme = require(Utilities:WaitForChild("Theme"))
return function(p1) -- Line: 22 -- upvalues: useRem (val), Theme (val), react (val)
    local v1
    local v2 = useRem()
    local v3 = Theme.getContentLayout(v2)
    local v4 = {BackgroundTransparency = 1}
    local Size = p1.Size
    if not Size then
        v1 = UDim2.fromScale(1, 1)
        Size = v1 + UDim2.fromOffset(v3.widthOffset, -v2(300))
    end
    v4.Size = Size
    local AnchorPoint = p1.AnchorPoint
    if not AnchorPoint then
        AnchorPoint = Vector2.new(0.5, 0.5)
    end
    v4.AnchorPoint = AnchorPoint
    local Position = p1.Position
    if not Position then
        v1 = UDim2.fromScale(0.5, 0.5)
        Position = v1 + UDim2.fromOffset(v3.centerOffsetX, 0)
    end
    v4.Position = Position
    return react.createElement("Frame", v4, {Constraint = react.createElement("UISizeConstraint", {MaxSize = Vector2.new(Theme.MAX_WIDTH, math.huge)})}, p1.children)
end