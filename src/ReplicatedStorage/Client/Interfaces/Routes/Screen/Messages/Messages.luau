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
--       File: ReplicatedStorage.Client.Interfaces.Routes.Screen.Messages.Messages
--                               Dumped in 0.00105 seconds
--                          Bytecode version 9  |  7 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Administration = require(Namespaces:WaitForChild("Administration"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_2:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Utilities = Common_2:WaitForChild("Utilities")
local Sounds = require(Utilities:WaitForChild("Sounds"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Sounds_2 = Common_3:WaitForChild("Sounds")
local Universal = require(Sounds_2:WaitForChild("Universal"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_5:WaitForChild("Client")
local User = Client:WaitForChild("User")
local State = User:WaitForChild("State")
local ClientSettingsHandler = require(State:WaitForChild("ClientSettingsHandler"))
local u111 = {}
local Styles = v1.Parent:WaitForChild("Styles")
u111[1] = require(Styles:WaitForChild("Default"))
local Styles_2 = v1.Parent:WaitForChild("Styles")
u111[2] = require(Styles_2:WaitForChild("Simplified"))
local Hooks = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useMotion = require(Hooks:WaitForChild("useMotion"))
return function() -- Line: 68 -- upvalues: useMotion (val), react (val), ClientSettingsHandler (val), Administration (val), Sounds (val), Universal (val), u111 (val)
    local u11, u16, u21, u26, u3, u31, u36, u7, v1, v2, v3, v4, v5, v6, v7, v8
    v1, u3 = useMotion(1)
    v5, u7 = useMotion(0)
    v6, u11 = useMotion(0)
    v7, u16 = react.useState(nil)
    v8, u21 = react.useState(true)
    v2, u26 = react.useState(1)
    v3, u31 = react.useState(1)
    v4, u36 = react.useState(0)
    react.useEffect(function() -- Line: 80 -- upvalues: ClientSettingsHandler (upval), u31 (val), u26 (val), u21 (val), u36 (val)
        local v1 = ClientSettingsHandler.getSettingFromName("Use Fullscreen Messages")
        local v2 = ClientSettingsHandler.getSettingFromName("Message Scale")
        local v3 = ClientSettingsHandler.getSettingFromName("Message Transparency")
        local v4 = ClientSettingsHandler.getSettingFromName("Message Styling")
        u31(v4)
        u26(v2)
        u21(v1)
        u36(v3)
        ClientSettingsHandler.onSettingChanged:Connect(function(p1, p2) -- Line: 91 -- upvalues: u21 (upval), u26 (upval), u36 (upval), u31 (upval)
            if p1 == "Use Fullscreen Messages" then
                u21(p2)
                return
            end
            if p1 == "Message Scale" then
                u26(p2)
                return
            end
            if p1 == "Message Transparency" then
                u36(p2)
                return
            end
            if p1 == "Message Styling" then
                u31(p2)
            end
        end)
    end, {ClientSettingsHandler})
    react.useEffect(function() -- Line: 104 -- upvalues: Administration (upval), u11 (val), u16 (val), Sounds (upval), Universal (upval), u7 (val), u3 (val)
        local u0 = nil
        local u1 = nil
        Administration.Message.listen(function(p1) -- Line: 109 -- upvalues: u1 (ref), u11 (upval), u16 (upval), Sounds (upval), Universal (upval), u7 (upval), u3 (upval), u0 (ref)
            local v1
            local u3 = (u1 or 0) + 1
            u1 = u3
            local v2 = p1[1]
            local length = v2.length
            local ServerTimeNow = workspace:GetServerTimeNow()
            if length < ServerTimeNow then
                return
            end
            local u10 = length - ServerTimeNow
            local message = v2.message
            local v3 = {message = message}
            local v4 = v2.isDelayed == 1
            v3.isDelayed = v4
            v3.delayed = v2.delayed
            v4 = v2.isCustomName == 1
            v3.isCustomName = v4
            v3.customName = v2.customName
            v4 = v2.isMonologue == 1
            v3.isMonologue = v4
            v3.font = v2.font
            v3.characterId = v2.characterId
            v4 = v2.isPrivate == 1
            v3.isPrivate = v4
            v3.private = v2.private
            v3.effect = v2.effect
            v3.yell = v2.yell
            if not v3.characterId then
                v1 = 0
            else
                v1 = 1
            end
            u11:immediate(v1)
            u16(v3)
            Sounds.stopGlobalSoundEffect(Universal.ZalgoMessage, 0.1)
            if v2.effect == "Radio" then
                Sounds.playGlobalSoundEffect(Universal.SystemMessage, 0.1, 1)
            elseif v2.effect == "Zalgo" then
                v4 = Sounds.playGlobalSoundEffect(Universal.ZalgoMessage, 0.1, 1, u10, nil, 0.2)
                v4.Looped = true
            end
            u7:immediate(0)
            u7:tween(#message, {time = #message * 0.02, style = Enum.EasingStyle.Linear, direction = Enum.EasingDirection.Out})
            u3:spring(0)
            if u0 then
                pcall(task.cancel, u0)
            end
            u0 = task.spawn(function() -- Line: 185 -- upvalues: u10 (val), u1 (upval), u3 (ref), u3 (upval), u16 (upval)
                task.wait(u10 - 0.05)
                if u1 ~= u3 then
                    return
                end
                u3:spring(1)
                task.wait(0.05)
                if u1 ~= u3 then
                    return
                end
                task.wait(0.2)
                if u1 ~= u3 then
                    return
                end
                u16(nil)
            end)
        end)
    end, {})
    return react.createElement(u111[v3], {
        message = v7,
        transparency = v1,
        offset = v6,
        isFullScreen = v8,
        scale = v2,
        backgroundTransparency = v4,
        visibleGraphemes = v5,
    })
end