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
-- File: ReplicatedStorage.Client.Interfaces.Components.Screen.Stories.DynamicPage.story
--                              Dumped in 0.000602 seconds
--                          Bytecode version 9  |  3 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local Lighting = game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local DynamicPage = require(v1.Parent.Parent:WaitForChild("DynamicPage"))
local Utilities = v1.Parent.Parent.Parent:WaitForChild("Utilities")
local QuickStory = require(Utilities:WaitForChild("QuickStory"))
local Utilities_2 = v1.Parent.Parent.Parent:WaitForChild("Utilities")
local v3 = require(Utilities_2:WaitForChild("Theme")).getStoryControls(nil, {Enabled = false, Instant = false, Speed = 1})
return QuickStory(v3, function(p1) -- Line: 30 -- upvalues: react (val), DynamicPage (val), Lighting (val)
    local v1 = react.createElement(DynamicPage, p1)
    return v1, function() -- Line: 33 -- upvalues: Lighting (upval)
        local __RequiemBlurEffect = Lighting:FindFirstChild("__RequiemBlurEffect")
        if __RequiemBlurEffect then
            __RequiemBlurEffect:Destroy()
        end
    end
end)