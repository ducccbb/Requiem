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
--         File: ReplicatedStorage.Client.Interfaces.Components.Primitives.Image
--                              Dumped in 0.000370 seconds
--                          Bytecode version 9  |  2 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local Utilities = script.Parent.Parent:WaitForChild("Utilities")
local FillProps = require(Utilities:WaitForChild("FillProps"))
return react.memo(function(p1) -- Line: 18 -- upvalues: react (val), FillProps (val)
    local AnchorPoint, BackgroundTransparency, Image, Position, Size
    local createElement = react.createElement
    local v1 = {}
    if not p1 then
        AnchorPoint = Vector2.new(0.5, 0.5)
    else
        AnchorPoint = p1.AnchorPoint
    end
    v1.AnchorPoint = AnchorPoint
    if not p1 then
        BackgroundTransparency = 1
    else
        BackgroundTransparency = p1.BackgroundTransparency
    end
    v1.BackgroundTransparency = BackgroundTransparency
    if not p1 then
        Position = UDim2.new(0.5, 0, 0.5, 0)
    else
        Position = p1.Position
    end
    v1.Position = Position
    if not p1 then
        Size = UDim2.new(1, 0, 1, 0)
    else
        Size = p1.Size
    end
    v1.Size = Size
    if not p1 then
        Image = ""
    else
        Image = p1.Image
        if not Image then
            Image = ""
        end
    end
    v1.Image = Image
    local v2 = FillProps(p1, v1)
    return createElement("ImageLabel", v2, p1.children)
end)