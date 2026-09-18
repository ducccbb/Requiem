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
--            File: ReplicatedStorage.Client.Interfaces.Routes.Screen.Loading
--                               Dumped in 0.00179 seconds
--                          Bytecode version 9  |  15 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local ContentProvider = game:GetService("ContentProvider")
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Promise = require(Common:WaitForChild("Promise"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_2:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Sounds = Common_2:WaitForChild("Sounds")
local Universal = require(Sounds:WaitForChild("Universal"))
local Hooks = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useInterfaceState = require(Hooks:WaitForChild("useInterfaceState"))
local Hooks_2 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useMotion = require(Hooks_2:WaitForChild("useMotion"))
local function preloadUniversalSounds() -- Line: 29 -- upvalues: Universal (val), ContentProvider (val)
    task.spawn(function() -- Line: 30 -- upvalues: Universal (upval), ContentProvider (upval)
        local collect, v1, v2
        local u0 = {}
        function collect(p1) -- Line: 33 -- upvalues: u0 (val), collect (val)
            local Sound
            local v1 = p1
            local v2 = nil
            local v3 = nil
            for i, j in v1, v2, v3 do
                if typeof(j) == "string" then
                    Sound = Instance.new("Sound")
                    Sound.SoundId = j
                    table.insert(u0, Sound)
                elseif typeof(j) == "table" then
                    collect(j)
                end
            end
        end
        collect(Universal)
        ContentProvider:PreloadAsync(u0)
        v1 = u0
        v2 = nil
        local v3 = nil
        for i, j in v1, v2, v3 do
            j:Destroy()
        end
    end)
end
local u103 = {"rbxassetid://127999577981138", "rbxassetid://85251174800525", "rbxassetid://119581788403550"}
local function preloadSkillcheckAssets() -- Line: 62 -- upvalues: u103 (val), ContentProvider (val)
    task.spawn(function() -- Line: 63 -- upvalues: u103 (upval), ContentProvider (upval)
        local ImageLabel
        local v1 = {}
        local v2 = u103
        local v3 = nil
        local v4 = nil
        for i, j in v2, v3, v4 do
            ImageLabel = Instance.new("ImageLabel")
            ImageLabel.Image = j
            table.insert(v1, ImageLabel)
        end
        ContentProvider:PreloadAsync(v1)
        v2 = v1
        v3 = nil
        v4 = nil
        for k, n in v2, v3, v4 do
            n:Destroy()
        end
    end)
end
return function() -- Line: 82 -- upvalues: useInterfaceState (val), react (val), useMotion (val), Players (val), preloadUniversalSounds (val), preloadSkillcheckAssets (val), Promise (val), StarterGui (val)
    local loading, loading_2, teleporting, u12, u16, u20, v1, v2, v3
    loading, loading_2 = useInterfaceState("loading")
    _, teleporting = useInterfaceState("teleporting")
    v1, u12 = react.useState(true)
    v2, u16 = useMotion(0)
    v3, u20 = useMotion(1)
    react.useEffect(function() -- Line: 91 -- upvalues: loading (val), u12 (val), Players (upval)
        loading(true)
        u12(true)
        local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
        PlayerGui:WaitForChild("Loading"):Destroy()
    end, {})
    react.useEffect(function() -- Line: 100 -- upvalues: teleporting (val), u12 (val), u16 (val)
        if teleporting then
            u12(true)
            u16:immediate(0)
        end
    end, {teleporting})
    react.useEffect(function() -- Line: 107 -- upvalues: loading_2 (val), preloadUniversalSounds (upval), preloadSkillcheckAssets (upval), Promise (upval), u16 (val), loading (val), u20 (val), StarterGui (upval), u12 (val)
        if loading_2 ~= true then
            return nil
        end
        preloadUniversalSounds()
        preloadSkillcheckAssets()
        local v1 = {}
        local v2 = Promise.delay(0):andThen(function() -- Line: 116 -- upvalues: u16 (upval)
            u16:tween(1, {time = 2, style = Enum.EasingStyle.Linear, direction = Enum.EasingDirection.In})
        end)
        local v3 = Promise.delay(2):andThen(function() -- Line: 124 -- upvalues: loading (upval), u20 (upval)
            loading(false)
            u20:tween(0, {time = 0.5, style = Enum.EasingStyle.Linear, direction = Enum.EasingDirection.In})
            workspace:SetAttribute("IS_CUTSCENE_READY", true)
        end)
        v1[1] = v2
        v1[2] = v3
        v1[3] = Promise.delay(2.8):andThen(function() -- Line: 136 -- upvalues: u20 (upval), StarterGui (upval), u12 (upval)
            u20:tween(1, {time = 1, style = Enum.EasingStyle.Linear, direction = Enum.EasingDirection.In})
            StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, true)
            u12(false)
            workspace:SetAttribute("IS_LOADING_OVER", true)
        end)
        Promise.all(v1)
        return nil
    end, {loading_2})
    return react.createElement(react.Fragment, {}, {Transition = react.createElement("Frame", {
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BackgroundTransparency = v3,
        Size = UDim2.fromScale(1, 1),
        Position = UDim2.fromScale(0.5, 0.5),
        Visible = v3:map(function(p1) -- Line: 160
            local v1 = p1 == 1
            return not v1
        end),
    }), Loading = react.createElement("Frame", {
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(1, 2, 11),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1.5, 1.5),
        Visible = v1,
    }, {
        Loading = react.createElement("Frame", {
            BackgroundTransparency = 0.75,
            BorderSizePixel = 0,
            ZIndex = 7,
            AnchorPoint = Vector2.new(0.5, 1),
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.fromScale(0.5, 0.744),
            Size = UDim2.fromScale(0.303, 0.00865),
        }, {Bar = react.createElement("Frame", {
            BackgroundTransparency = 0.7,
            BorderSizePixel = 0,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(189, 189, 189),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.fromScale(0.499, 0.5),
            Size = UDim2.fromScale(1, 1),
        }, {Fill = react.createElement("Frame", {
            BorderSizePixel = 0,
            AnchorPoint = Vector2.new(0, 0.5),
            BackgroundColor3 = Color3.fromRGB(10, 31, 76),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.fromScale(0, 0.5),
            Size = v2:map(function(p1) -- Line: 199
                return UDim2.fromScale(p1, 1)
            end),
        })}), Padding = react.createElement("UIPadding", {PaddingBottom = UDim.new(0, 6), PaddingLeft = UDim.new(0, 6), PaddingRight = UDim.new(0, 6), PaddingTop = UDim.new(0, 6)}), Stroke = react.createElement("UIStroke", {Transparency = 0.7, Color = Color3.fromRGB(255, 255, 255)}), Border = react.createElement("Frame", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.fromScale(0.499, 0.5),
            Size = UDim2.new(1, 20, 1, 20),
        }, {Stroke = react.createElement("UIStroke", {Transparency = 0.8, Color = Color3.fromRGB(255, 255, 255)})})}),
        Assets = react.createElement("TextLabel", {
            Text = "Loading Assets",
            TextScaled = true,
            TextSize = 14,
            TextTransparency = 0.18,
            TextWrapped = true,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ZIndex = 8,
            FontFace = Font.new("rbxasset://fonts/families/Fondamento.json"),
            TextColor3 = Color3.fromRGB(229, 229, 229),
            TextXAlignment = Enum.TextXAlignment.Left,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.fromScale(0.5, 0.721),
            Size = UDim2.fromScale(0.303, 0.0127),
        }),
        Backdrop = react.createElement("ImageLabel", {
            Image = "rbxassetid://135024828537951",
            ImageTransparency = 0.95,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Visible = false,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.fromScale(0.481, 0.5),
            Size = UDim2.fromScale(0.8, 0.8),
        }, {Ratio = react.createElement("UIAspectRatioConstraint", {AspectRatio = 1.78})}),
        Vignette = react.createElement("ImageLabel", {
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
        }),
        Vignette2 = react.createElement("ImageLabel", {
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
        }),
        Glow = react.createElement("ImageLabel", {
            Image = "rbxassetid://70767138808432",
            ImageTransparency = 0.97,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ZIndex = 2,
            ImageColor3 = Color3.fromRGB(35, 95, 173),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromOffset(3000, 3000),
        }),
    })})
end