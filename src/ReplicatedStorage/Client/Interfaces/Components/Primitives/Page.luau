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
--         File: ReplicatedStorage.Client.Interfaces.Components.Primitives.Page
--                              Dumped in 0.000896 seconds
--                          Bytecode version 9  |  5 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Packages_2 = ReplicatedStorage_2:WaitForChild("Packages")
local u51 = require(Packages_2:WaitForChild("react-roblox"))
local Error = require(script.Parent.Parent.Parent:WaitForChild("Error"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_3:WaitForChild("Common")
local Logger = require(Common:WaitForChild("Logger"))
local function isStoryPreview() -- Line: 31 -- upvalues: RunService (val), Players (val)
    local LocalPlayer, v1
    if not (RunService:IsStudio()) then
        LocalPlayer = Players.LocalPlayer
        if not LocalPlayer then
            return true
        end
        v1 = LocalPlayer:FindFirstChild("PlayerGui") == nil
        return v1
    end
    if not (RunService:IsRunning()) then
        return true
    end
    LocalPlayer = Players.LocalPlayer
    if not LocalPlayer then
        return true
    end
    v1 = LocalPlayer:FindFirstChild("PlayerGui") == nil
    return v1
end
local function getPlayerGui() -- Line: 44 -- upvalues: Players (val)
    local LocalPlayer = Players.LocalPlayer
    if not LocalPlayer then
        return nil
    end
    return (LocalPlayer:FindFirstChild("PlayerGui"))
end
local function ScreenGuiLayer(p1) -- Line: 55 -- upvalues: isStoryPreview (val), Logger (val), react (val), Error (val)
    if p1.Name and not (isStoryPreview()) then
        Logger("Interfaces").info((("Loading Interface Page: %*"):format(p1.Name))).color("blue")
    end
    return react.createElement("ScreenGui", {
        IgnoreGuiInset = true,
        ResetOnSpawn = false,
        DisplayOrder = 4,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        Name = p1.Name or "Layer",
    }, {Page = react.createElement(Error.Boundary, {}, p1.children)})
end
return function(p1) -- Line: 71 -- upvalues: react (val), ScreenGuiLayer (val), isStoryPreview (val), getPlayerGui (val), u51 (val)
    local v1 = react.createElement(ScreenGuiLayer, {Name = p1.Name}, p1.children)
    if isStoryPreview() then
        return v1
    end
    local v2 = getPlayerGui()
    assert(v2)
    return u51.createPortal(v1, v2)
end