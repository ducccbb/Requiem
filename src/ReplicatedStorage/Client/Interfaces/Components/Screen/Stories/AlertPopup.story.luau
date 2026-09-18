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
-- File: ReplicatedStorage.Client.Interfaces.Components.Screen.Stories.AlertPopup.story
--                              Dumped in 0.000962 seconds
--                          Bytecode version 9  |  8 functions

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
local Alert = v1.Parent.Parent:WaitForChild("Alert")
local AlertPopupPage = require(Alert:WaitForChild("AlertPopupPage"))
local Inputs = v1.Parent.Parent.Parent:WaitForChild("Inputs")
local Button = require(Inputs:WaitForChild("Button"))
local Utilities = v1.Parent.Parent.Parent:WaitForChild("Utilities")
local QuickStory = require(Utilities:WaitForChild("QuickStory"))
local Hooks = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useAlertPopup = require(Hooks:WaitForChild("useAlertPopup"))
local function DangerPopup(p1) -- Line: 37 -- upvalues: useAlertPopup (val), react (val), Button (val)
    local u3 = useAlertPopup(function(p1) -- Line: 38
        print("Callback Called!", p1)
    end)
    return react.createElement(Button, {
        Text = "Open Danger",
        Clicked = function() -- Line: 45 -- upvalues: u3 (val)
            u3("Are you absolutely sure?", "This is a testing body alert. This is a context body alert, only one can be provided at a time.", Color3.fromRGB(255, 0, 0))
        end,
        Native = {Position = UDim2.fromScale(0.5, 0.5), AnchorPoint = Vector2.new(0.5, 0.5)},
    })
end
local function SuccessPopup(p1) -- Line: 56 -- upvalues: useAlertPopup (val), react (val), Button (val)
    local u3 = useAlertPopup(function(p1) -- Line: 57
        print("Callback Called!", p1)
    end)
    return react.createElement(Button, {
        Text = "Open Success",
        Clicked = function() -- Line: 64 -- upvalues: u3 (val)
            u3("This is a different popup!", "We can provide whatever text or information we need, and get a response accordingly.", Color3.fromRGB(9, 255, 0))
        end,
        Native = {Position = UDim2.fromScale(0.5, 0.55), AnchorPoint = Vector2.new(0.5, 0.5)},
    })
end
return QuickStory({}, function(p1) -- Line: 75 -- upvalues: react (val), AlertPopupPage (val), DangerPopup (val), SuccessPopup (val)
    return react.createElement(react.Fragment, {}, {Page = react.createElement(AlertPopupPage), Danger = react.createElement(DangerPopup), Success = react.createElement(SuccessPopup)})
end)