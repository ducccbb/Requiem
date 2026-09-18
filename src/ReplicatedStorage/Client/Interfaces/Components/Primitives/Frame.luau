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
--         File: ReplicatedStorage.Client.Interfaces.Components.Primitives.Frame
--                              Dumped in 0.000726 seconds
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
    local AnchorPoint, BackgroundTransparency, BorderSizePixel, Position, Size, v1
    local Reference = p1.Reference
    p1.Reference = nil
    local createElement = react.createElement
    local v2 = {}
    if not p1 then
        AnchorPoint = Vector2.new(0.5, 0.5)
    else
        AnchorPoint = p1.AnchorPoint
    end
    v2.AnchorPoint = AnchorPoint
    if not p1 then
        BackgroundTransparency = 1
    else
        BackgroundTransparency = p1.BackgroundTransparency
    end
    v2.BackgroundTransparency = BackgroundTransparency
    if not p1 then
        Position = UDim2.new(0.5, 0, 0.5, 0)
    else
        Position = p1.Position
    end
    v2.Position = Position
    if not p1 then
        Size = UDim2.new(1, 0, 1, 0)
    else
        Size = p1.Size
    end
    v2.Size = Size
    if not p1 then
        v1 = nil
    else
        v1 = Reference
    end
    v2.ref = v1
    if not p1 then
        BorderSizePixel = 0
    else
        BorderSizePixel = p1.BorderSizePixel
        if not BorderSizePixel then
            BorderSizePixel = 0
        end
    end
    v2.BorderSizePixel = BorderSizePixel
    local v3 = FillProps(p1, v2)
    return createElement("Frame", v3, p1.children)
end)