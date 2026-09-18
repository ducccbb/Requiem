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
--     File: ReplicatedStorage.Client.Interfaces.Components.Editor.Universal.Spacer
--                              Dumped in 0.000281 seconds
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
local Hooks = script.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useRem = require(Hooks:WaitForChild("useRem"))
return function(p1) -- Line: 27 -- upvalues: useRem (val), react (val)
    local v1 = useRem()
    local v2 = if p1.Hidden ~= nil then not p1.Hidden else nil
    local v3 = {BackgroundTransparency = 1}
    local v4 = v1(p1.Width or 20)
    v3.Size = UDim2.fromOffset(v4, v1(1))
    v3.LayoutOrder = p1.LayoutOrder
    v3.Visible = v2
    local v5 = {}
    local v6 = {BackgroundTransparency = 0.9, BorderSizePixel = 0}
    local v7 = UDim2.fromScale(0, 0)
    local v8 = v1(1)
    v6.Size = v7 + UDim2.fromOffset(v8, v1(p1.Height or 60))
    v6.AnchorPoint = Vector2.new(0.5, 0.5)
    v6.Position = UDim2.fromScale(0.5, 0.5)
    v6.Visible = p1.Visible
    v5.Line = react.createElement("Frame", v6)
    return react.createElement("Frame", v3, v5)
end