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
--  File: ReplicatedStorage.Client.Interfaces.Routes.Screen.Messages.Styles.Simplified
--                               Dumped in 0.00336 seconds
--                          Bytecode version 9  |  12 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Table = require(Utilities:WaitForChild("Table"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Cache = require(Common_2:WaitForChild("Cache"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_4:WaitForChild("Client")
local Interfaces = Client:WaitForChild("Interfaces")
local Components = Interfaces:WaitForChild("Components")
local Primitives = Components:WaitForChild("Primitives")
local Frame = require(Primitives:WaitForChild("Frame"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_5:WaitForChild("Client")
local Interfaces_2 = Client_2:WaitForChild("Interfaces")
local Components_2 = Interfaces_2:WaitForChild("Components")
local Universal = Components_2:WaitForChild("Universal")
local RigViewport = require(Universal:WaitForChild("RigViewport"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_6:WaitForChild("Client")
local Interfaces_3 = Client_3:WaitForChild("Interfaces")
local Components_3 = Interfaces_3:WaitForChild("Components")
local Primitives_2 = Components_3:WaitForChild("Primitives")
local Text = require(Primitives_2:WaitForChild("Text"))
local EnumItems = Enum.Font:GetEnumItems()
local u148 = Table.map(EnumItems, function(p1) -- Line: 53
    return p1.Name
end)
return function(p1) -- Line: 60 -- upvalues: u148 (val), react (val), Frame (val), RigViewport (val), Cache (val), Text (val)
    local Name, characterId, customName, effect, message_2, v1, v2, v3, v4
    local message = p1.message
    local transparency = p1.transparency
    local offset = p1.offset
    local backgroundTransparency = p1.backgroundTransparency
    local visibleGraphemes = p1.visibleGraphemes
    if not message then
        v4 = u148[4]
    elseif message.font then
        v4 = u148[message.font]
    end
    if not message then
        characterId = nil
    else
        characterId = message.characterId
    end
    local u21 = p1.scale or 1
    local v5 = v4 == u148[4]
    if not v5 then
        Name = v4
    else
        Name = Enum.Font.Merriweather.Name
    end
    local createElement = react.createElement
    local Fragment = react.Fragment
    local v6 = {}
    local createElement_2 = react.createElement
    local v7 = {AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.135), Size = UDim2.fromOffset(140, 140)}
    if not characterId then
        v2 = false
    else
        v2 = true
        if characterId ~= "" then end
    end
    v7.Visible = v2
    v2 = {}
    local createElement_3 = react.createElement
    local v8 = {}
    if not characterId then
        v3 = nil
    else
        v3 = Cache:FindFirstChild(characterId)
    end
    v8.Model = v3
    v8.ImageTransparency = transparency:map(function(p1) -- Line: 94
        return p1 * 1 + 0
    end)
    v2.Viewport = createElement_3(RigViewport, v8)
    v6.Viewport = createElement_2(Frame, v7, v2)
    local createElement_4 = react.createElement
    v7 = {
        TextScaled = true,
        TextSize = 14,
        TextWrapped = true,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        RichText = true,
        FontFace = Font.new("rbxasset://fonts/families/Fondamento.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
    }
    if not message then
        if not message then
            customName = "SERVER MESSAGE"
        elseif message.isCustomName then
            customName = message.customName
        end
    elseif message.isPrivate then
        customName = "Private Message"
    end
    v7.Text = customName
    v7.TextColor3 = Color3.fromRGB(255, 255, 255)
    v7.TextTransparency = transparency:map(function(p1) -- Line: 113
        return p1 * 0.76 + 0.24
    end)
    v7.AnchorPoint = Vector2.new(0.5, 0.5)
    v7.TextXAlignment = Enum.TextXAlignment.Center
    v7.Position = react.joinBindings({offset = offset, transparency = transparency}):map(function(p1) -- Line: 126
        local v1 = UDim2.fromScale(0.5, 0.135)
        return v1 + UDim2.fromOffset(0, p1.offset * 95 + p1.transparency * -40)
    end)
    v7.Size = UDim2.fromScale(0.562 * u21, 0.035 * u21)
    v6.Title = createElement_4(Text, v7)
    local createElement_5 = react.createElement
    v7 = {
        TextScaled = true,
        TextSize = 14,
        TextWrapped = true,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        FontFace = Font.new("rbxasset://fonts/families/Guru.json"),
    }
    if not message then
        if not message then
            if not message then
                v2 = ""
            elseif message.isCustomName then
                v2 = "Lore Character"
            end
        elseif message.isPrivate then
            v2 = "System Administration"
        end
    elseif message.yell then
        v2 = ""
    end
    v7.Text = v2
    v7.TextColor3 = Color3.fromRGB(255, 255, 255)
    v7.TextTransparency = transparency:map(function(p1) -- Line: 144
        return p1 * 0.56 + 0.44
    end)
    v7.AnchorPoint = Vector2.new(0.5, 0.5)
    v7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    v7.BorderColor3 = Color3.fromRGB(0, 0, 0)
    v7.TextXAlignment = Enum.TextXAlignment.Center
    v7.Position = react.joinBindings({offset = offset, transparency = transparency}):map(function(p1) -- Line: 156 -- upvalues: u21 (val)
        local v1 = UDim2.fromScale(0.5, 0.166)
        local v2 = v1 + UDim2.fromOffset(0, u21 * 10)
        return v2 + UDim2.fromOffset(0, p1.offset * 95 + p1.transparency * -40)
    end)
    v7.Size = UDim2.fromScale(0.562 * u21, 0.02 * u21)
    v6.Subheader = createElement_5(Text, v7)
    local createElement_6 = react.createElement
    v7 = {TextWrapped = true, BackgroundTransparency = 1, BorderSizePixel = 0, Font = Name}
    if not message then
        message_2 = ""
    else
        message_2 = message.message
    end
    v7.Text = message_2
    v7.TextColor3 = Color3.fromRGB(255, 255, 255)
    v7.TextSize = 30 * u21
    v7.TextTransparency = transparency:map(function(p1) -- Line: 169
        return p1 * 0.88 + 0.12
    end)
    v7.TextYAlignment = Enum.TextYAlignment.Top
    v7.AnchorPoint = Vector2.new(0.5, 0.5)
    v7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    v7.Position = transparency:map(function(p1) -- Line: 178
        local v1 = UDim2.fromScale(0.5, 0.75)
        return v1 + UDim2.fromOffset(0, p1 * 40)
    end)
    v7.TextXAlignment = Enum.TextXAlignment.Center
    v7.Size = UDim2.fromScale(0.562 * u21, 0.202 * u21)
    v7.MaxVisibleGraphemes = visibleGraphemes
    if not message then
        effect = nil
    elseif message.effect and message.effect ~= "None" then
        effect = message.effect
    end
    v7.Effect = effect
    v2 = {}
    v8 = {Thickness = 2, Transparency = transparency:map(function(p1) -- Line: 192
        return p1 * 0.6799999999999999 + 0.32
    end)}
    v3 = {}
    local v9 = {Rotation = -90}
    local v10 = {}
    local v11 = NumberSequenceKeypoint.new(0, 0.478)
    local v12 = NumberSequenceKeypoint.new(0.501, 1)
    v10[1] = v11
    v10[2] = v12
    v10[3] = NumberSequenceKeypoint.new(1, 1)
    v9.Transparency = NumberSequence.new(v10)
    v3.Gradient = react.createElement("UIGradient", v9)
    v2.Stroke = react.createElement("UIStroke", v8, v3)
    v6.Message = createElement_6(Text, v7, v2)
    local v13 = createElement(Fragment, {}, v6)
    local createElement_7 = react.createElement
    v6 = {BackgroundTransparency = transparency:map(function(p1) -- Line: 209 -- upvalues: backgroundTransparency (val)
        return backgroundTransparency + (1 - backgroundTransparency) * p1
    end), BackgroundColor3 = Color3.fromRGB(0, 0, 0)}
    if not message then
        v1 = false
    elseif not message.message then
        v1 = false
    else
        v1 = not (message.message == "")
    end
    v6.Visible = v1
    return createElement_7(Frame, v6, {}, v13)
end