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
--             File: ReplicatedStorage.Client.User.State.ClientCursorHandler
--                              Dumped in 0.000605 seconds
--                          Bytecode version 9  |  6 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Signals = require(Common:WaitForChild("Signals"))
local ClientSettingsHandler = require(script.Parent:WaitForChild("ClientSettingsHandler"))
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local Mouse = Players.LocalPlayer:GetMouse()
local u48 = false
local u49 = ""
local function onHandleCustomCursor() -- Line: 32 -- upvalues: u48 (ref), ClientSettingsHandler (val), UserInputService (val), Mouse (val), u49 (ref)
    if u48 then
        return
    end
    local v1 = ClientSettingsHandler.getSettingFromName("Custom Cursor")
    if not v1 or v1 == 0 then
        UserInputService.MouseIcon = ""
        Mouse.Icon = ""
        u49 = ""
        return
    end
    local v2 = "rbxassetid://" .. tostring(v1)
    UserInputService.MouseIcon = v2
    Mouse.Icon = v2
    u49 = v2
end
ClientSettingsHandler.onSettingChanged:Connect(function(p1, p2) -- Line: 55 -- upvalues: onHandleCustomCursor (val)
    if p1 == "Custom Cursor" then
        onHandleCustomCursor()
    end
end)
Signals.OnSettingsLoaded:Connect(function() -- Line: 62 -- upvalues: onHandleCustomCursor (val)
    onHandleCustomCursor()
end)
return {
    onHandleCustomCursor = onHandleCustomCursor,
    setCursorIcon = function(p1) -- Line: 72 -- upvalues: u48 (ref), UserInputService (val), Mouse (val)
        u48 = true
        UserInputService.MouseIcon = p1
        Mouse.Icon = p1
    end,
    restoreCursorIcon = function() -- Line: 82 -- upvalues: u48 (ref), UserInputService (val), u49 (ref), Mouse (val)
        u48 = false
        UserInputService.MouseIcon = u49
        Mouse.Icon = u49
    end,
}