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
--File: ReplicatedStorage.Client.Interfaces.Routes.Customization.Subpages.ConversationPage
--                               Dumped in 0.00343 seconds
--                          Bytecode version 9  |  15 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Customization = require(Namespaces:WaitForChild("Customization"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Promise = require(Common_2:WaitForChild("Promise"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_3:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Effects = Common_3:WaitForChild("Effects")
local Types = Effects:WaitForChild("Types")
local Cutscenes = Types:WaitForChild("Cutscenes")
local Outro = require(Cutscenes:WaitForChild("Outro"))
local Components = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Primitives = Components:WaitForChild("Primitives")
local Frame = require(Primitives:WaitForChild("Frame"))
local Hooks = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useAsyncEffect = require(Hooks:WaitForChild("useAsyncEffect"))
local Hooks_2 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useInputPopup = require(Hooks_2:WaitForChild("useInputPopup"))
local Hooks_3 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useInterfaceState = require(Hooks_3:WaitForChild("useInterfaceState"))
local Hooks_4 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useMotion = require(Hooks_4:WaitForChild("useMotion"))
local Hooks_5 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useStore = require(Hooks_5:WaitForChild("useStore"))
local Hooks_6 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useToast = require(Hooks_6:WaitForChild("useToast"))
local u209 = {
    "nigger",
    "nigga",
    "faggot",
    "chink",
    "retard",
    "spick",
    "cracker",
    "honky",
    "whore",
    "slut",
    "bitch",
    "whore",
    "fuck",
    "shit",
    "pussy",
    "cock",
    "dick",
    "vagina",
    "anus",
    "asshole",
    "bastard",
    "bitch",
    "boob",
    "breast",
    "butt",
    "clit",
    "cock",
    "cunt",
    "damn",
    "dick",
    "fag",
    "fucking",
    "hell",
    "homo",
    "lesbian",
}
local u245 = {
    Apathy = Color3.fromRGB(69, 255, 45),
    Curiosity = Color3.fromRGB(118, 255, 255),
    Envy = Color3.fromRGB(0, 128, 0),
    Fearfulness = Color3.fromRGB(255, 0, 0),
    Greed = Color3.fromRGB(255, 215, 0),
    Honor = Color3.fromRGB(48, 64, 186),
    Loyalty = Color3.fromRGB(0, 0, 139),
    Selfishness = Color3.fromRGB(255, 201, 38),
    Strength = Color3.fromRGB(255, 69, 0),
    Stubbornness = Color3.fromRGB(128, 0, 128),
}
local function ConversationMessage(p1) -- Line: 103 -- upvalues: useMotion (val), react (val)
    local u13, u4, v1, v2
    v1, u4 = useMotion(1)
    local u9 = utf8.len(p1.Body)
    if not u9 then
        u9 = #p1.Body
    end
    v2, u13 = useMotion(0)
    react.useEffect(function() -- Line: 109 -- upvalues: u4 (val), u13 (val), u9 (val)
        u4:spring(0)
        u13:tween(u9, {time = u9 / 45, style = Enum.EasingStyle.Linear, direction = Enum.EasingDirection.Out})
    end, {})
    local v3 = math.ceil(u9 / 17)
    local createElement = react.createElement
    local v4 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0, 0.957),
    }
    local v5 = UDim2.fromScale(1, 0)
    v4.Size = v5 + UDim2.fromOffset(0, 35)
    local v6 = {}
    local v7 = {
        TextSize = 17,
        TextWrapped = true,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json"),
        Text = p1.Body,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextXAlignment = Enum.TextXAlignment.Left,
        BackgroundColor3 = Color3.fromRGB(48, 53, 72),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.0978, 0.0952),
    }
    local v8 = UDim2.fromScale(0.9, 0)
    v7.Size = v8 + UDim2.fromOffset(0, v3 * 35)
    v7.MaxVisibleGraphemes = v2
    local v9 = {Padding = react.createElement("UIPadding", {PaddingLeft = UDim.new(0, 15), PaddingRight = UDim.new(0, 15)})}
    v6.Body = react.createElement("TextLabel", v7, v9)
    v6.Layout = react.createElement("UIListLayout", {Padding = UDim.new(0, 5), FillDirection = Enum.FillDirection.Horizontal, SortOrder = Enum.SortOrder.LayoutOrder, VerticalAlignment = Enum.VerticalAlignment.Center})
    local createElement_2 = react.createElement
    v7 = {
        TextSize = 17,
        BorderSizePixel = 0,
        LayoutOrder = -1,
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
        Text = p1.Sender,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        AutomaticSize = Enum.AutomaticSize.X,
    }
    if p1.Sender ~= "???" then
        v9 = Color3.fromRGB(72, 48, 48)
    else
        v9 = Color3.fromRGB(48, 53, 72)
        if not v9 then
            v9 = Color3.fromRGB(72, 48, 48)
        end
    end
    v7.BackgroundColor3 = v9
    v7.BorderColor3 = Color3.fromRGB(0, 0, 0)
    v7.Size = UDim2.new(0.09, 0, 0, 21)
    v7.BackgroundTransparency = v1
    v7.TextTransparency = v1
    v6.Pill = createElement_2("TextLabel", v7, {Padding = react.createElement("UIPadding", {PaddingLeft = UDim.new(0, 15), PaddingRight = UDim.new(0, 15)}), Corner = react.createElement("UICorner", {CornerRadius = UDim.new(1, 0)})})
    v6.Padding = react.createElement("UIPadding", {PaddingBottom = UDim.new(0, 5), PaddingTop = UDim.new(0, 5)})
    return createElement("Frame", v4, v6)
end
return function(p1) -- Line: 192 -- upvalues: useStore (val), Customization (val), useToast (val), useInterfaceState (val), useMotion (val), useInputPopup (val), react (val), Players (val), ConversationMessage (val), useAsyncEffect (val), Promise (val), u209 (val), u245 (val), Outro (val), Lighting (val), TweenService (val), Frame (val)
    local DisplayName, u506, u512, u516, v1, v2, v3, v4
    local u496 = useStore(Customization.Store, function(p1) -- Line: 193
        return p1.conversation
    end)
    local u498 = useToast()
    local black = useInterfaceState("black")
    local created = useInterfaceState("created")
    v3, u506 = useMotion(1)
    local u508 = useInputPopup()
    v4, u512 = useMotion(Color3.fromRGB(35, 95, 173))
    local v5 = {}
    v1, u516 = react.useState(false)
    local u494 = p1
    for i, v in ipairs(u496) do
        if i <= 2 then
            DisplayName = "???"
        elseif (i - 1) % 2 ~= 0 then
            DisplayName = "???"
        else
            DisplayName = Players.LocalPlayer.DisplayName
        end
        v2 = tostring(i) .. "_" .. v
        v5[v2] = react.createElement(ConversationMessage, {Sender = DisplayName, Body = v})
    end
    useAsyncEffect(function() -- Line: 223 -- upvalues: u516 (val), u496 (val), Players (upval), Promise (upval), u209 (upval), u498 (val), u508 (val), Customization (upval)
        local DisplayName
        u516(false)
        local v1 = #u496
        if v1 <= 2 then
            DisplayName = "???"
        elseif (v1 - 1) % 2 ~= 0 then
            DisplayName = "???"
        else
            DisplayName = Players.LocalPlayer.DisplayName
            if not DisplayName then
                DisplayName = "???"
            end
        end
        if DisplayName ~= "???" then
            return
        end
        local v2 = #u496
        if v2 < 2 then
            return
        end
        return Promise.delay(3):andThen(function() -- Line: 237 -- upvalues: u516 (upval), u496 (upval), u209 (upval), u498 (upval), u508 (upval), Customization (upval)
            u516(true)
            if #u496 == 2 then
                local onInput
                function onInput(p1) -- Line: 241 -- upvalues: u209 (upval), u498 (upval), u508 (upval), onInput (val), Customization (upval), u516 (upval)
                    local v1
                    local v2 = true
                    if not p1 then
                        v2 = false
                    elseif 20 > #p1 then
                    end
                    if p1 and string.find(p1, " ") then
                        v2 = false
                    end
                    if p1 and not (p1:match("^[%a]+$")) then
                        v2 = false
                    end
                    local v3 = u209
                    local v4 = nil
                    local v5 = nil
                    for i, j in v3, v4, v5 do
                        if p1 and string.find(p1, j) then
                            v2 = false
                            break
                        end
                    end
                    if not v2 or not p1 then
                        u498({message = "Unable to use name, please try again.", type = "error"})
                        u508("Please type your first name.", "Please type your first name.", "First Name", onInput)
                        return
                    end
                    if not p1 then
                        v1 = p1
                    else
                        v3 = p1:sub(1, 1):lower()
                        if v3 ~= p1:sub(1, 1) then
                            v1 = p1
                        else
                            v3 = p1:sub(1, 1):upper()
                            v1 = v3 .. p1:sub(2)
                        end
                    end
                    Customization.Converse.post({message = "My name is " .. v1 .. ".", username = v1})
                    u516(false)
                end
                u508("Please type your first name.", "Please type your first name.", "First Name", onInput, Color3.fromRGB(35, 81, 156))
            end
        end)
    end, {u496})
    react.useEffect(function() -- Line: 295 -- upvalues: Customization (upval), Players (upval), u512 (val), u245 (upval), u516 (val), black (val), Outro (upval), created (val), u494 (val)
        Customization.Converse.post({message = "__init"})
        local LocalPlayer = Players.LocalPlayer
        local AttributeChangedSignal = LocalPlayer:GetAttributeChangedSignal("HighestTrait")
        AttributeChangedSignal:Connect(function() -- Line: 300 -- upvalues: LocalPlayer (val), u512 (upval), u245 (upval)
            local Attribute = LocalPlayer:GetAttribute("HighestTrait")
            local v1 = u245[Attribute]
            if not v1 then
                v1 = Color3.fromRGB(35, 95, 173)
            end
            u512:tween(v1, {time = 1.5, style = Enum.EasingStyle.Linear, direction = Enum.EasingDirection.Out})
        end)
        local AttributeChangedSignal_2 = LocalPlayer:GetAttributeChangedSignal("Finished")
        AttributeChangedSignal_2:Connect(function() -- Line: 309 -- upvalues: LocalPlayer (val), u516 (upval), black (upval), Outro (upval), Players (upval), created (upval), u494 (upval)
            if not (LocalPlayer:GetAttribute("Finished")) then
                return
            end
            u516(false)
            task.delay(3, function() -- Line: 318 -- upvalues: u516 (upval), black (upval), Outro (upval), Players (upval), created (upval), u494 (upval)
                u516(false)
                black({enabled = true, tween = TweenInfo.new(2.5)})
                task.wait(2.5)
                Outro(function() -- Line: 325 -- upvalues: black (upval), Players (upval), created (upval)
                    black({enabled = true, tween = TweenInfo.new(2.5)})
                    task.wait(2)
                    Players.LocalPlayer:SetAttribute("Created", true)
                    created(true)
                end)
                u494.Completed()
                task.wait(1)
                black({enabled = false, tween = TweenInfo.new(1.5)})
            end)
        end)
    end, {u494.Enabled})
    react.useEffect(function() -- Line: 351 -- upvalues: u494 (val), Lighting (upval), TweenService (upval), u506 (val), Customization (upval)
        if not u494.Enabled then
            return
        end
        local BlurEffect = Instance.new("BlurEffect")
        BlurEffect.Size = 0
        BlurEffect.Parent = Lighting
        BlurEffect.Name = "CUTSCENE_BLUR_2"
        local v1 = TweenInfo.new(5)
        TweenService:Create(BlurEffect, v1, {Size = 10}):Play()
        u506:tween(0.6, {time = 5})
        Customization.Converse.post({message = "__init"})
    end, {u494.Enabled})
    local v6 = {ZIndex = 10, Visible = u494.Enabled, BackgroundTransparency = v3, BackgroundColor3 = Color3.fromRGB(0, 0, 0)}
    local v7 = {Vignette = react.createElement("ImageLabel", {
        Image = "rbxassetid://135589412519765",
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 3,
        ImageColor3 = Color3.fromRGB(0, 0, 0),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(12, 17, 18),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1.5, 1),
    }), Vignette2 = react.createElement("ImageLabel", {
        Image = "rbxassetid://135589412519765",
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 3,
        ImageColor3 = Color3.fromRGB(0, 0, 0),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(12, 17, 18),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1.5, 1),
    }), Glow = react.createElement("ImageLabel", {
        Image = "rbxassetid://70767138808432",
        ImageTransparency = 0.8,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 2,
        Visible = false,
        ImageColor3 = v4,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromOffset(3000, 3000),
    })}
    v2 = {ZIndex = 5, Size = UDim2.fromScale(1.8, 1.5)}
    local v8 = {}
    local v9 = {}
    local v10 = UDim2.fromScale(0, 0.7)
    v9.Size = v10 + UDim2.fromOffset(900, 0)
    v9.AnchorPoint = Vector2.new(0.5, 1)
    v9.Position = UDim2.fromScale(0.5, 0.715)
    v8.History = react.createElement(Frame, v9, {Content = react.createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0, 0),
        Size = UDim2.fromScale(1, 1),
    }, {Layout = react.createElement("UIListLayout", {Padding = UDim.new(0, 5), SortOrder = Enum.SortOrder.LayoutOrder, VerticalAlignment = Enum.VerticalAlignment.Bottom})}, v5)})
    v9 = {
        BackgroundTransparency = 0.75,
        BorderSizePixel = 0,
        ZIndex = 7,
        AnchorPoint = Vector2.new(0.5, 1),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.744),
    }
    v10 = UDim2.fromScale(0, 0.02)
    v9.Size = v10 + UDim2.fromOffset(900, 0)
    local v11 = {}
    local v12 = {
        BackgroundTransparency = 0.95,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(189, 189, 189),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.499, 0.5),
        Size = UDim2.fromScale(1, 1),
    }
    local v13 = {}
    local v14 = {
        CursorPosition = -1,
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Italic),
        Text = "Please type your response here.",
        TextColor3 = Color3.fromRGB(166, 166, 166),
        TextSize = 14,
        TextXAlignment = Enum.TextXAlignment.Left,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Position = UDim2.fromScale(0.504, 0.5),
        Size = UDim2.fromScale(0.991, 1),
        Visible = v1,
    }
    v14[react.Event.FocusLost] = function(p1, p2) -- Line: 487 -- upvalues: Customization (upval), u516 (val)
        if not p2 then
            return
        end
        Customization.Converse.post({message = p1.Text})
        u516(false)
        p1.Text = "Please type your response here."
    end
    v13.Input = react.createElement("TextBox", v14)
    v13.Blocked = react.createElement("TextLabel", {
        Text = "Please wait before responding...",
        TextSize = 14,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Italic),
        TextColor3 = Color3.fromRGB(116, 116, 116),
        TextXAlignment = Enum.TextXAlignment.Left,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.504, 0.5),
        Size = UDim2.fromScale(0.991, 1),
        Visible = not v1,
    })
    v11.Bar = react.createElement("Frame", v12, v13)
    v11.Padding = react.createElement("UIPadding", {PaddingBottom = UDim.new(0, 6), PaddingLeft = UDim.new(0, 6), PaddingRight = UDim.new(0, 6), PaddingTop = UDim.new(0, 6)})
    v11.Stroke = react.createElement("UIStroke", {Transparency = 0.7, Color = Color3.fromRGB(255, 255, 255)})
    v11.Border = react.createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.499, 0.5),
        Size = UDim2.new(1, 20, 1, 20),
    }, {Stroke = react.createElement("UIStroke", {Transparency = 0.8, Color = Color3.fromRGB(255, 255, 255)})})
    v8.Response = react.createElement("Frame", v9, v11)
    v7.Content = react.createElement(Frame, v2, v8)
    return react.createElement(Frame, v6, v7)
end