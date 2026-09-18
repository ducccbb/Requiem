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
--    File: ReplicatedStorage.Client.Interfaces.Routes.Screen.Messages.Styles.Default
--                               Dumped in 0.00212 seconds
--                          Bytecode version 9  |  9 functions

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
local Screen = Components:WaitForChild("Screen")
local DynamicPage = require(Screen:WaitForChild("DynamicPage"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_5:WaitForChild("Client")
local Interfaces_2 = Client_2:WaitForChild("Interfaces")
local Components_2 = Interfaces_2:WaitForChild("Components")
local Screen_2 = Components_2:WaitForChild("Screen")
local DynamicPagePopup = require(Screen_2:WaitForChild("DynamicPagePopup"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_6:WaitForChild("Client")
local Interfaces_3 = Client_3:WaitForChild("Interfaces")
local Components_3 = Interfaces_3:WaitForChild("Components")
local Primitives = Components_3:WaitForChild("Primitives")
local Frame = require(Primitives:WaitForChild("Frame"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_7:WaitForChild("Client")
local Interfaces_4 = Client_4:WaitForChild("Interfaces")
local Components_4 = Interfaces_4:WaitForChild("Components")
local Universal = Components_4:WaitForChild("Universal")
local RigViewport = require(Universal:WaitForChild("RigViewport"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Client_5 = ReplicatedStorage_8:WaitForChild("Client")
local Interfaces_5 = Client_5:WaitForChild("Interfaces")
local Components_5 = Interfaces_5:WaitForChild("Components")
local Primitives_2 = Components_5:WaitForChild("Primitives")
local Text = require(Primitives_2:WaitForChild("Text"))
local EnumItems = Enum.Font:GetEnumItems()
local u202 = Table.map(EnumItems, function(p1) -- Line: 54
    return p1.Name
end)
return function(p1) -- Line: 61 -- upvalues: u202 (val), react (val), Frame (val), RigViewport (val), Cache (val), Text (val), DynamicPage (val), DynamicPagePopup (val)
    local Center, Center_2, Center_3, characterId, customName, effect, message_2, v1, v2, v3, v4
    local message = p1.message
    local transparency = p1.transparency
    local offset = p1.offset
    local isFullScreen = p1.isFullScreen
    local scale = p1.scale
    local backgroundTransparency = p1.backgroundTransparency
    local visibleGraphemes = p1.visibleGraphemes
    if not message then
        v4 = u202[4]
    elseif message.font then
        v4 = u202[message.font]
    end
    if not message then
        characterId = nil
    else
        characterId = message.characterId
    end
    local createElement = react.createElement
    local Fragment = react.Fragment
    local v5 = {}
    local createElement_2 = react.createElement
    local v6 = {}
    if not isFullScreen then
        v1 = Vector2.new(1, 0.5)
    else
        v1 = Vector2.new(0.5, 0.5)
    end
    v6.AnchorPoint = v1
    if not isFullScreen then
        v2 = UDim2.fromScale(1, 0.5)
        v1 = v2 - UDim2.fromOffset(10, 0)
    else
        v1 = UDim2.fromScale(0.5, 0.135)
    end
    v6.Position = v1
    if not isFullScreen then
        v2 = UDim2.fromScale(0, 1)
        v1 = v2 + UDim2.fromOffset(180, 0)
    else
        v1 = UDim2.fromOffset(140, 140)
    end
    v6.Size = v1
    if not characterId then
        v1 = false
    else
        v1 = true
        if characterId ~= "" then end
    end
    v6.Visible = v1
    v1 = {Ratio = react.createElement("UIAspectRatioConstraint", {})}
    local createElement_3 = react.createElement
    local v7 = RigViewport
    local v8 = {}
    if not characterId then
        v3 = nil
    else
        v3 = Cache:FindFirstChild(characterId)
    end
    v8.Model = v3
    v8.ImageTransparency = transparency:map(function(p1) -- Line: 94
        return p1 * 0.75 + 0.25
    end)
    v1.Viewport = createElement_3(v7, v8)
    v5.Viewport = createElement_2(Frame, v6, v1)
    local createElement_4 = react.createElement
    v6 = {
        RichText = true,
        TextScaled = true,
        TextSize = 14,
        TextWrapped = true,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
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
    v6.Text = customName
    v6.TextColor3 = Color3.fromRGB(255, 255, 255)
    v6.TextTransparency = transparency:map(function(p1) -- Line: 114 -- upvalues: isFullScreen (val)
        local v1
        if not isFullScreen then
            v1 = 0.39
        else
            v1 = 0.24
        end
        return v1 + (1 - v1) * p1
    end)
    v6.AnchorPoint = Vector2.new(0.5, 0.5)
    if not isFullScreen then
        Center = Enum.TextXAlignment.Left
    else
        Center = Enum.TextXAlignment.Center
    end
    v6.TextXAlignment = Center
    if not isFullScreen then
        v1 = UDim2.fromScale(0.331, 0.776)
    else
        v1 = offset:map(function(p1) -- Line: 125
            local v1 = UDim2.fromScale(0.5, 0.135)
            return v1 + UDim2.fromOffset(0, p1 * 95)
        end)
    end
    v6.Position = v1
    if not isFullScreen then
        v1 = UDim2.fromScale(0.605, 0.096)
    else
        v1 = UDim2.fromScale(0.562, 0.0286)
    end
    v6.Size = v1
    v5.Title = createElement_4("TextLabel", v6)
    local createElement_5 = react.createElement
    v6 = {
        RichText = true,
        TextScaled = true,
        TextSize = 14,
        TextWrapped = true,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json"),
    }
    if not message then
        if not message then
            if not message then
                v1 = "System Administration"
            elseif message.isCustomName then
                v1 = "Lore Character"
            end
        elseif message.isPrivate then
            v1 = "System Administration"
        end
    elseif message.yell then
        v1 = ""
    end
    v6.Text = v1
    v6.TextColor3 = Color3.fromRGB(255, 255, 255)
    v6.TextTransparency = transparency:map(function(p1) -- Line: 143 -- upvalues: isFullScreen (val)
        local v1
        if not isFullScreen then
            v1 = 0.55
        else
            v1 = 0.44
        end
        return v1 + (1 - v1) * p1
    end)
    v6.AnchorPoint = Vector2.new(0.5, 0.5)
    v6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    v6.BorderColor3 = Color3.fromRGB(0, 0, 0)
    if not isFullScreen then
        Center_2 = Enum.TextXAlignment.Left
    else
        Center_2 = Enum.TextXAlignment.Center
    end
    v6.TextXAlignment = Center_2
    if not isFullScreen then
        v1 = UDim2.fromScale(0.471, 0.886)
    else
        v1 = offset:map(function(p1) -- Line: 154
            local v1 = UDim2.fromScale(0.5, 0.166)
            return v1 + UDim2.fromOffset(0, p1 * 95)
        end)
    end
    v6.Position = v1
    if not isFullScreen then
        v1 = UDim2.fromScale(0.882, 0.075)
    else
        v1 = UDim2.fromScale(0.562, 0.02)
    end
    v6.Size = v1
    v5.Subheader = createElement_5("TextLabel", v6)
    local createElement_6 = react.createElement
    local v9 = Text
    v6 = {
        TextSize = 24,
        TextWrapped = true,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Font = v4,
    }
    if not message then
        message_2 = ""
    else
        message_2 = message.message
    end
    v6.Text = message_2
    v6.TextColor3 = Color3.fromRGB(255, 255, 255)
    v6.TextTransparency = transparency:map(function(p1) -- Line: 165
        return p1 * 0.88 + 0.12
    end)
    v6.TextYAlignment = Enum.TextYAlignment.Top
    v6.AnchorPoint = Vector2.new(0.5, 0.5)
    v6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    if not isFullScreen then
        v1 = UDim2.fromScale(0.499, 0.373)
    else
        v1 = UDim2.fromScale(0.5, 0.584)
    end
    v6.Position = v1
    if not isFullScreen then
        Center_3 = Enum.TextXAlignment.Left
    else
        Center_3 = Enum.TextXAlignment.Center
    end
    v6.TextXAlignment = Center_3
    if not isFullScreen then
        v1 = UDim2.fromScale(0.941, 0.592)
    else
        v1 = UDim2.fromScale(0.562, 0.202)
    end
    v6.Size = v1
    v6.MaxVisibleGraphemes = visibleGraphemes
    if not message then
        effect = nil
    elseif message.effect and message.effect ~= "None" then
        effect = message.effect
    end
    v6.Effect = effect
    v1 = {}
    v8 = {Thickness = 2, Transparency = 0.32}
    v3 = {}
    local v10 = {Rotation = -90}
    local v11 = {}
    local v12 = NumberSequenceKeypoint.new(0, 0.478)
    local v13 = NumberSequenceKeypoint.new(0.501, 1)
    v11[1] = v12
    v11[2] = v13
    v11[3] = NumberSequenceKeypoint.new(1, 1)
    v10.Transparency = NumberSequence.new(v11)
    v3.Gradient = react.createElement("UIGradient", v10)
    v1.Stroke = react.createElement("UIStroke", v8, v3)
    v5.Message = createElement_6(v9, v6, v1)
    local v14 = createElement(Fragment, {}, v5)
    if isFullScreen then
        backgroundTransparency = math.clamp(backgroundTransparency - 0.075, 0, 1)
    end
    local createElement_7 = react.createElement
    local v15 = {}
    local createElement_8 = react.createElement
    if not isFullScreen then
        v6 = DynamicPagePopup
    else
        v6 = DynamicPage
    end
    v1 = {}
    if not message then
        v2 = false
    elseif message.message then
        v2 = true
        if message.message ~= "" then end
    end
    v1.Enabled = v2
    v1.BackgroundTransparency = backgroundTransparency
    v2 = {}
    if isFullScreen then
        v7 = nil
    else
        v7 = react.createElement("UIScale", {Scale = scale})
    end
    v2.Scale = v7
    v7 = {}
    if isFullScreen then
        v8 = nil
    else
        v8 = v14
    end
    v7[1] = v8
    v15.Background = createElement_8(v6, v1, v2, v7)
    if not isFullScreen then
        v9 = nil
    else
        v9 = v14
        if not v9 then
            v9 = nil
        end
    end
    return createElement_7(Frame, {}, v15, v9)
end