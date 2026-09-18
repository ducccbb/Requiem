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
--         File: ReplicatedStorage.Client.Interfaces.Components.Primitives.Layer
--                              Dumped in 0.000421 seconds
--                          Bytecode version 9  |  3 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Packages_2 = ReplicatedStorage_2:WaitForChild("Packages")
local u46 = require(Packages_2:WaitForChild("react-roblox"))
local Error = require(script.Parent.Parent.Parent:WaitForChild("Error"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_3:WaitForChild("Common")
local Interfaces = require(Common:WaitForChild("Logger"))("Interfaces")
local function ScreenGuiLayer(p1) -- Line: 34 -- upvalues: Interfaces (val), react (val), Error (val)
    if p1.settings.Name then
        Interfaces.info((("Loading Interface Layer: %*"):format(p1.settings.Name))).color("blue")
    end
    return react.createElement("ScreenGui", {
        IgnoreGuiInset = true,
        ResetOnSpawn = false,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        Name = p1.settings.Name or "Layer",
        DisplayOrder = p1.settings.DisplayOrder or 0,
    }, react.createElement(Error.Boundary, {}, react.createElement(p1.children)))
end
return function(p1, p2, p3, p4) -- Line: 48 -- upvalues: Players (val), u46 (val), react (val), ScreenGuiLayer (val)
    local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
    p2.Name = p1
    local v1 = react.createElement(ScreenGuiLayer, {children = p4, settings = p2})
    return u46.createPortal(v1, PlayerGui)
end