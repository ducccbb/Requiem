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
--           File: ReplicatedStorage.Client.Interfaces.Routes.Screen.Language
--                               Dumped in 0.00117 seconds
--                          Bytecode version 9  |  15 functions

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
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local State = require(Utilities:WaitForChild("State"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Network = Common_2:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Player = require(Namespaces:WaitForChild("Player"))
local LocalPlayer = Players.LocalPlayer
local u75 = nil
return react.memo(function() -- Line: 31 -- upvalues: react (val), State (val), LocalPlayer (val), u75 (ref), Player (val)
    local hasMoreThanOneLanguage, hasMoreThanOneLanguage_2, isCurrentLanguageEthnic, isCurrentLanguageEthnic_2, language, language_2, u13, u14, u19, u24, u3, u37, u4, u50, u63, u8, u9, v1, v2, v3, v4, v5, v6, v7
    u3, u4 = react.useState(false)
    u8, u9 = react.useState(nil)
    u13, u14 = react.useState("")
    v6, u19 = react.useState(nil)
    v7, u24 = react.useState(nil)
    _, _, hasMoreThanOneLanguage, hasMoreThanOneLanguage_2 = State("hasMoreThanOneLanguage")
    v1, u37 = react.useState(hasMoreThanOneLanguage_2() or false)
    _, _, language, language_2 = State("language")
    v2, u50 = react.useState(language_2() or "Eldian")
    _, _, isCurrentLanguageEthnic, isCurrentLanguageEthnic_2 = State("isCurrentLanguageEthnic")
    v3, u63 = react.useState(isCurrentLanguageEthnic_2() or false)
    react.useEffect(function() -- Line: 47 -- upvalues: language (val), u50 (val), hasMoreThanOneLanguage (val), u37 (val), isCurrentLanguageEthnic (val), u63 (val)
        local u2 = language(u50)
        local u5 = hasMoreThanOneLanguage(u37)
        local u8 = isCurrentLanguageEthnic(u63)
        return function() -- Line: 51 -- upvalues: u2 (val), u5 (val), u8 (val)
            if u2 and u5 and u2 then
                u2()
                u5()
                u8()
            end
        end
    end, {})
    react.useEffect(function() -- Line: 62 -- upvalues: LocalPlayer (upval), u19 (val), u24 (val), u4 (val), u75 (upval), u14 (val), u9 (val)
        local ExperienceChat = LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("ExperienceChat")
        local function onResolveWaitForChild(p1) -- Line: 67 -- upvalues: ExperienceChat (val)
            local v1 = string.split(p1, ".")
            local v2 = ExperienceChat
            local v3 = v1
            local v4 = nil
            local v5 = nil
            for i, j in v3, v4, v5 do
                v2 = v2:WaitForChild(j)
            end
            return v2
        end
        local u12 = onResolveWaitForChild("appLayout.chatInputBar.Background.Container.TextContainer.TextBoxContainer.TextBox")
        local u15 = onResolveWaitForChild("appLayout.chatInputBar.Background")
        u19(u15.AbsolutePosition)
        u24(u15.AbsoluteSize)
        local PropertyChangedSignal = u15:GetPropertyChangedSignal("AbsolutePosition")
        local u29 = PropertyChangedSignal:Connect(function() -- Line: 86 -- upvalues: u19 (upval), u15 (val)
            u19(u15.AbsolutePosition)
        end)
        local PropertyChangedSignal_2 = u15:GetPropertyChangedSignal("AbsoluteSize")
        local u37 = PropertyChangedSignal_2:Connect(function() -- Line: 90 -- upvalues: u24 (upval), u15 (val)
            u24(u15.AbsoluteSize)
        end)
        local u42 = u12.Focused:Connect(function() -- Line: 95 -- upvalues: u4 (upval), u75 (upval), u12 (val), u14 (upval), u9 (upval)
            u4(true)
            local PropertyChangedSignal = u12:GetPropertyChangedSignal("Text")
            u75 = PropertyChangedSignal:Connect(function() -- Line: 98 -- upvalues: u14 (upval), u12 (upval)
                u14(u12.Text)
            end)
            u9(u12)
        end)
        local u47 = u12.FocusLost:Connect(function() -- Line: 105 -- upvalues: u4 (upval), u9 (upval), u75 (upval)
            u4(false)
            u9(nil)
            if u75 then
                u75:Disconnect()
                u75 = nil
            end
        end)
        return function() -- Line: 115 -- upvalues: u42 (val), u47 (val), u29 (val), u37 (val)
            u42:Disconnect()
            u47:Disconnect()
            u29:Disconnect()
            u37:Disconnect()
        end
    end, {})
    local v8 = {u3, u8, u13}
    react.useEffect(function() -- Line: 123 -- upvalues: Player (upval), u3 (val), u8 (val), u13 (val), u14 (val)
        local u4 = Player.ChatDamage.listen(function() -- Line: 124 -- upvalues: u3 (upval), u8 (upval), u13 (upval), Player (upval), u14 (upval)
            if not u3 or not u8 or u13 == "" then
                return
            end
            local v1 = {
                "-Ugh!",
                "-GAH!",
                "-Guhh!",
                "-Ack!",
                "-Aaargh!",
            }
            local v2 = v1[math.random(1, #v1)]
            Player.Chat.post(u13 .. v2)
            u8.Text = ""
            u8:ReleaseFocus()
            u14("")
        end)
        return function() -- Line: 157 -- upvalues: u4 (val)
            if u4 then
                u4()
            end
        end
    end, v8)
    local v9 = v6 and v7
    if not v6 then
        v4 = UDim2.fromScale(0.02, 0.15)
    elseif v7 then
        v4 = UDim2.fromOffset(v6.X, v6.Y + v7.Y + 68)
    end
    if not v7 then
        v8 = UDim2.fromScale(0.2, 0.05)
    else
        v8 = UDim2.fromOffset(v7.X, 25)
    end
    local createElement = react.createElement
    local v10 = {BackgroundTransparency = 1, Size = v8, Position = v4}
    if not u3 then
        v5 = false
    elseif not v9 then
        v5 = false
    elseif v1 then
        v5 = not v3
    else
        v5 = false
    end
    v10.Visible = v5
    return createElement("Frame", v10, {TextBox = react.createElement("TextLabel", {
        BackgroundTransparency = 1,
        TextSize = 25,
        Size = UDim2.fromScale(1, 1),
        Text = "Currently Speaking: " .. (v2 or "Eldian"),
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextXAlignment = Enum.TextXAlignment.Left,
        Font = Enum.Font.Garamond,
    })})
end)