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
--          File: ReplicatedStorage.Client.User.Miscellaneous.ClientChatHandler
--                              Dumped in 0.000789 seconds
--                          Bytecode version 9  |  6 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Players = game:GetService("Players")
local TextChatService = game:GetService("TextChatService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Administration = require(Namespaces:WaitForChild("Administration"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Administration_2 = Common_2:WaitForChild("Administration")
local Permissions = require(Administration_2:WaitForChild("Permissions"))
local State = script.Parent.Parent:WaitForChild("State")
local ClientSettingsHandler = require(State:WaitForChild("ClientSettingsHandler"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Network_2 = Common_3:WaitForChild("Network")
local Namespaces_2 = Network_2:WaitForChild("Namespaces")
local Language = require(Namespaces_2:WaitForChild("Language"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_4:WaitForChild("Common")
local Utilities = Common_4:WaitForChild("Utilities")
local State_2 = require(Utilities:WaitForChild("State"))
local language = State_2("language")
local hasMoreThanOneLanguage = State_2("hasMoreThanOneLanguage")
local isCurrentLanguageEthnic = State_2("isCurrentLanguageEthnic")
Language.Language.listen(function(p1, p2, p3) -- Line: 27 -- upvalues: language (val), hasMoreThanOneLanguage (val), isCurrentLanguageEthnic (val)
    language(p1)
    local v1 = 1 < p2
    hasMoreThanOneLanguage(v1)
    v1 = p3 == true
    isCurrentLanguageEthnic(v1)
end)
;(function() -- Line: 35 -- upvalues: Language (val), ClientSettingsHandler (val), TextChatService (val), Administration (val), Permissions (val), Players (val)
    Language.Language.unreliablePost("sync")
    task.delay(1, function() -- Line: 39 -- upvalues: Language (upval)
        Language.Language.unreliablePost("sync")
    end)
    ClientSettingsHandler.onKeybindPressed("Change Language"):Connect(function() -- Line: 43 -- upvalues: Language (upval)
        Language.Language.unreliablePost()
    end)
    function TextChatService.OnBubbleAdded(p1) -- Line: 47 -- upvalues: Administration (upval), Permissions (upval), Players (upval)
        local v1
        if not p1.TextSource then
            return nil
        end
        local Text = p1.Text
        local v2 = false
        local v3 = Text
        if Text:match("^%s*%*.*%*%s*$") then
            v2 = true
            v1 = Text:gsub("^%s*[%*%-]", "")
            v1 = v1:gsub("[%*%-]%s*$", "")
            v1 = v1:gsub("^%s+", "")
            v3 = v1:gsub("%s+$", "")
        elseif Text:match("^%s*%-.*%-%s*$") then
            v2 = true
            v1 = Text:gsub("^%s*[%*%-]", "")
            v1 = v1:gsub("[%*%-]%s*$", "")
            v1 = v1:gsub("^%s+", "")
            v3 = v1:gsub("%s+$", "")
        end
        local BubbleChatMessageProperties = Instance.new("BubbleChatMessageProperties")
        if not (p1.Text:match("^/t")) then
            if v2 then
                BubbleChatMessageProperties.FontFace = Font.new("rbxassetid://16658221428", Enum.FontWeight.Medium, Enum.FontStyle.Italic)
                BubbleChatMessageProperties.Text = v3
                return BubbleChatMessageProperties
            end
            BubbleChatMessageProperties.FontFace = Font.new("rbxassetid://16658221428", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
            return BubbleChatMessageProperties
        end
        local v4 = Administration.Store.client()
        if v4.permission >= Permissions.Accessability.Events or v4.staffSlot ~= 1 then
            v3 = "[T] " .. string.sub(v3, 4)
            BubbleChatMessageProperties.FontFace = Font.new("rbxassetid://16658221428", Enum.FontWeight.Medium)
            BubbleChatMessageProperties.TextColor3 = Color3.fromRGB(67, 67, 67)
            BubbleChatMessageProperties.Text = v3
            return BubbleChatMessageProperties
        end
        if p1.TextSource.UserId ~= Players.LocalPlayer.UserId then
            BubbleChatMessageProperties.TextSize = 0
            BubbleChatMessageProperties.BackgroundTransparency = 1
            return BubbleChatMessageProperties
        end
        v3 = "[T] " .. string.sub(v3, 4)
        BubbleChatMessageProperties.FontFace = Font.new("rbxassetid://16658221428", Enum.FontWeight.Medium)
        BubbleChatMessageProperties.TextColor3 = Color3.fromRGB(67, 67, 67)
        BubbleChatMessageProperties.Text = v3
        return BubbleChatMessageProperties
    end
end)()
return {}