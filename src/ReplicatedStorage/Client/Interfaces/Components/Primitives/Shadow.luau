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
--        File: ReplicatedStorage.Client.Interfaces.Components.Primitives.Shadow
--                              Dumped in 0.000491 seconds
--                          Bytecode version 9  |  4 functions

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
local Utilities = v1.Parent.Parent:WaitForChild("Utilities")
local Bindings = require(Utilities:WaitForChild("Bindings"))
local Hooks = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useRem = require(Hooks:WaitForChild("useRem"))
local u55 = Vector2.new(512, 512)
return react.memo(function(p1) -- Line: 31 -- upvalues: useRem (val), react (val), Bindings (val), u55 (val)
    local u2 = useRem()
    local Position = p1.Position
    if not Position then
        Position = u2(1)
    end
    p1.Position = Position
    p1.Size = p1.Size or 1
    local v1 = {Image = "rbxassetid://14120516187", BackgroundTransparency = 1, ImageTransparency = p1.Transparency or 0.5, AnchorPoint = Vector2.new(0.5, 0.5)}
    local Color = p1.Color
    if not Color then
        Color = Color3.new()
    end
    v1.ImageColor3 = Color
    v1.Size = Bindings.composeBindings(p1.Size, function(a1) -- Line: 43 -- upvalues: u2 (val), p1 (val)
        local v1 = u2(80 * (p1.Blur or 1), "pixel")
        if typeof(a1) == "UDim2" then
            return UDim2.new(1, v1, 1, v1) + a1
        end
        return UDim2.new(1, a1 + v1, 1, a1 + v1)
    end)
    v1.Position = Bindings.composeBindings(p1.Position, function(p1) -- Line: 52
        return UDim2.new(0.5, 0, 0.5, p1)
    end)
    v1.ScaleType = Enum.ScaleType.Slice
    v1.SliceCenter = Rect.new(u55 / 2, u55 / 2)
    v1.SliceScale = u2(p1.Blur or 1, "pixel")
    v1.ZIndex = p1.ZIndex or -1
    return react.createElement("ImageLabel", v1)
end)