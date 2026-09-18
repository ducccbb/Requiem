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
--     File: ReplicatedStorage.Client.Interfaces.Routes.Customization.Customization
--                               Dumped in 0.00354 seconds
--                          Bytecode version 9  |  35 functions

local PlayLightningStrikeEffect
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
local Signals = require(Common_3:WaitForChild("Signals"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_5:WaitForChild("Common")
local Utilities = Common_4:WaitForChild("Utilities")
local Animation = require(Utilities:WaitForChild("Animation"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_6:WaitForChild("Common")
local Animations = Common_5:WaitForChild("Animations")
local Customization_2 = require(Animations:WaitForChild("Customization"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_7:WaitForChild("Common")
local Effects = Common_6:WaitForChild("Effects")
local Types = Effects:WaitForChild("Types")
local Cutscenes = Types:WaitForChild("Cutscenes")
local Intro = require(Cutscenes:WaitForChild("Intro"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Common_7 = ReplicatedStorage_8:WaitForChild("Common")
local Utilities_2 = Common_7:WaitForChild("Utilities")
local Table = require(Utilities_2:WaitForChild("Table"))
local Hooks = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useAlertPopup = require(Hooks:WaitForChild("useAlertPopup"))
local Hooks_2 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useAsyncEffect = require(Hooks_2:WaitForChild("useAsyncEffect"))
local Hooks_3 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useInterfaceState = require(Hooks_3:WaitForChild("useInterfaceState"))
local Hooks_4 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useMotion = require(Hooks_4:WaitForChild("useMotion"))
local Hooks_5 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useRem = require(Hooks_5:WaitForChild("useRem"))
local Hooks_6 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useStore = require(Hooks_6:WaitForChild("useStore"))
local Hooks_7 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useTheme = require(Hooks_7:WaitForChild("useTheme"))
local Hooks_8 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useToast = require(Hooks_8:WaitForChild("useToast"))
local Components = v1.Parent.Parent.Parent:WaitForChild("Components")
local Primitives = Components:WaitForChild("Primitives")
local Frame = require(Primitives:WaitForChild("Frame"))
local Components_2 = v1.Parent.Parent.Parent:WaitForChild("Components")
local Primitives_2 = Components_2:WaitForChild("Primitives")
local Ratio = require(Primitives_2:WaitForChild("Ratio"))
local Components_3 = v1.Parent.Parent.Parent:WaitForChild("Components")
local Menu = Components_3:WaitForChild("Menu")
local Header = Menu:WaitForChild("Header")
local PageHeader = require(Header:WaitForChild("PageHeader"))
local Components_4 = v1.Parent.Parent.Parent:WaitForChild("Components")
local Utilities_3 = Components_4:WaitForChild("Utilities")
local TransparencyGroup = require(Utilities_3:WaitForChild("TransparencyGroup"))
local Components_5 = v1.Parent.Parent.Parent:WaitForChild("Components")
local Menu_2 = Components_5:WaitForChild("Menu")
local PageLayout = require(Menu_2:WaitForChild("PageLayout"))
local Components_6 = v1.Parent.Parent.Parent:WaitForChild("Components")
local Menu_3 = Components_6:WaitForChild("Menu")
local Tabs = Menu_3:WaitForChild("Tabs")
local TabLayout = require(Tabs:WaitForChild("TabLayout"))
local Components_7 = v1.Parent.Parent.Parent:WaitForChild("Components")
local Menu_4 = Components_7:WaitForChild("Menu")
local Tabs_2 = Menu_4:WaitForChild("Tabs")
local Tablet = require(Tabs_2:WaitForChild("Tablet"))
local Components_8 = v1.Parent.Parent.Parent:WaitForChild("Components")
local Screen = Components_8:WaitForChild("Screen")
local Vignette = require(Screen:WaitForChild("Vignette"))
local Subpages = v1.Parent:WaitForChild("Subpages")
local ComplexionPage = require(Subpages:WaitForChild("ComplexionPage"))
local Subpages_2 = v1.Parent:WaitForChild("Subpages")
local FacePage = require(Subpages_2:WaitForChild("FacePage"))
local Subpages_3 = v1.Parent:WaitForChild("Subpages")
local HairPage = require(Subpages_3:WaitForChild("HairPage"))
local Subpages_4 = v1.Parent:WaitForChild("Subpages")
local OutfitPage = require(Subpages_4:WaitForChild("OutfitPage"))
local Subpages_5 = v1.Parent:WaitForChild("Subpages")
local ConversationPage = require(Subpages_5:WaitForChild("ConversationPage"))
local u486 = false
local u487 = false
local u488 = {message = "The character you are attempting to create is invalid.", type = "error"}
function PlayLightningStrikeEffect(p1) -- Line: 119 -- upvalues: Lighting (val), TweenService (val), u486 (ref), PlayLightningStrikeEffect (val)
    local ColorCorrectionEffect = Instance.new("ColorCorrectionEffect")
    ColorCorrectionEffect.Parent = Lighting
    local u9 = math.random(80, 110) / 100
    local v1 = 0.15 + (1 - u9)
    task.delay(v1, function() -- Line: 130 -- upvalues: p1 (val), u9 (val)
        p1.Audio.Lightning:Play()
        p1.Audio.Lightning.Volume = 0.4 * u9
    end)
    local v2 = TweenInfo.new(0.07)
    TweenService:Create(ColorCorrectionEffect, v2, {Contrast = 0.8, Brightness = 1.3 * u9, Saturation = 1 * u9, TintColor = Color3.fromRGB(190, 210, 255)}):Play()
    v2 = TweenInfo.new(0.07)
    TweenService:Create(p1.Lights.Lightning.A, v2, {Brightness = 6.18 * u9}):Play()
    v2 = TweenInfo.new(0.07)
    TweenService:Create(p1.Lights.Lightning.B, v2, {Brightness = 8.06 * u9}):Play()
    task.delay(0.07, function() -- Line: 152 -- upvalues: TweenService (upval), ColorCorrectionEffect (val), p1 (val)
        local v1 = TweenInfo.new(0.275)
        TweenService:Create(ColorCorrectionEffect, v1, {Brightness = 0, Contrast = 0, Saturation = 0, TintColor = Color3.fromRGB(255, 255, 255)}):Play()
        v1 = TweenInfo.new(0.275)
        TweenService:Create(p1.Lights.Lightning.A, v1, {Brightness = 0}):Play()
        v1 = TweenInfo.new(0.275)
        TweenService:Create(p1.Lights.Lightning.B, v1, {Brightness = 0}):Play()
    end)
    if not u486 then
        return
    end
    task.wait(math.random(15, 35))
    if not u486 then
        return
    end
    PlayLightningStrikeEffect(p1)
end
return function(p1) -- Line: 180 -- upvalues: useRem (val), useToast (val), useInterfaceState (val), useTheme (val), useStore (val), Customization (val), react (val), Table (val), Animation (val), Customization_2 (val), useMotion (val), useAlertPopup (val), u488 (val), Promise (val), Signals (val), useAsyncEffect (val), u486 (ref), TweenService (val), PlayLightningStrikeEffect (val), u487 (ref), Intro (val), Frame (val), Vignette (val), ConversationPage (val), Players (val), Ratio (val), TransparencyGroup (val), PageLayout (val), PageHeader (val), TabLayout (val), Tablet (val), FacePage (val), ComplexionPage (val), OutfitPage (val), HairPage (val)
    local None, None_2, loading, u107, u108, u120, u121, u122, u131, u22, u23, u27, u28, u33, u43, u47, u48, u52, u57, u62, u63, u67, u68, u72, u73, u77, u78, v1, v2, v3, v4, v5, v6
    local v7 = useRem()
    local u4 = useToast()
    local created = useInterfaceState("created")
    local v8 = useTheme()
    local u18 = useStore(Customization.Store, function(p1) -- Line: 188
        return p1.customizing
    end)
    if typeof(u18) == "table" then
        u18 = false
    end
    u22, u23 = react.useState(false)
    u27, u28 = react.useState(false)
    v1, u33 = react.useState(false)
    None, None_2 = react.useState("None")
    v2, u43 = react.useState(false)
    u47, u48 = react.useState(false)
    u52, v3 = react.useState({})
    u57, v4 = react.useState({
        complexion = 0.85,
        face_height = 0.5,
        burns = 1,
        freckles = 1,
        moles = 1,
        scars = 1,
    })
    u62, u63 = react.useState({})
    u67, u68 = react.useState(false)
    u72, u73 = react.useState({shirt = "Rolled White Shirt", pants = "Black Slacks"})
    u77, u78 = react.useState({})
    react.useEffect(function() -- Line: 228 -- upvalues: u52 (val), u62 (val), Table (upval), u72 (val), u57 (val), u78 (val)
        if not u52.eyes or not u62.hair then
            return
        end
        local v1 = Table.merge(u52, u57)
        local v2 = Table.merge(u72, Table.merge(v1, u62))
        u78(v2)
    end, {u52, u57, u62, u72})
    react.useEffect(function() -- Line: 237 -- upvalues: u18 (ref), created (val), None_2 (val), u33 (val), u48 (val)
        if u18 then
            return
        end
        created(true)
        None_2("None")
        u33(false)
        u48(false)
    end, {u18})
    _, loading = useInterfaceState("loading")
    local black = useInterfaceState("black")
    u107, u108 = react.useMemo(function() -- Line: 255
        return workspace.CurrentCamera, (workspace:WaitForChild("CustomizationModel"))
    end, {})
    v5, v6 = react.useMemo(function() -- Line: 260
        local Requiem_CreateCharacter_Ymir = workspace:WaitForChild("Requiem_CreateCharacter_Ymir")
        return Requiem_CreateCharacter_Ymir, workspace:WaitForChild("Requiem_CreateCharacter_Player")
    end, {})
    u120, u121, u122 = react.useMemo(function() -- Line: 266 -- upvalues: u108 (val), Animation (upval), Customization_2 (upval)
        local Animator = u108.Character.Humanoid.Animator
        local v1 = {}
        local v2 = Animation.load(Animator, Customization_2.Sitting)
        local v3 = Animation.load(Animator, Customization_2.GettingUp)
        v1[1] = v2
        v1[2] = v3
        v1[3] = Animation.load(Animator, Customization_2.Idle)
        return unpack(v1)
    end, {u108})
    _, u131 = useMotion(u108.Cameras:WaitForChild("Start").CFrame)
    local u135 = useAlertPopup(function(p1) -- Line: 279 -- upvalues: u67 (val), u22 (val), u4 (val), u488 (upval), u68 (val), black (val), Customization (upval), u77 (val), Promise (upval), None_2 (val), u33 (val), u48 (val), Signals (upval)
        if not p1 or u67 then
            return
        end
        if not u22 then
            return u4(u488)
        end
        u68(true)
        black({enabled = true, tween = TweenInfo.new(1)})
        Customization.Submit.post(u77)
        Promise.delay(1):andThen(function() -- Line: 293 -- upvalues: None_2 (upval), u33 (upval), u48 (upval), Signals (upval)
            None_2("None")
            u33(false)
            u48(true)
            Signals.Bars:Fire(0.3, -2)
        end)
    end)
    react.useEffect(function() -- Line: 304 -- upvalues: u18 (ref), u120 (val), u122 (val), u131 (val), u108 (val), u107 (val)
        if not u18 then
            return
        end
        u120:Play()
        u122:Play()
        u131:immediate(u108.Cameras.Start.CFrame)
        u107.CameraType = Enum.CameraType.Scriptable
        local u23 = u131:onStep(function(p1) -- Line: 318 -- upvalues: u107 (upval)
            u107.CFrame = p1
        end)
        return function() -- Line: 323 -- upvalues: u23 (val), u107 (upval)
            u23()
            u107.CameraType = Enum.CameraType.Custom
        end
    end, {u18})
    local function setCustomizationType(p1) -- Line: 329 -- upvalues: None (val), None_2 (val), u131 (val), u108 (val)
        if None == p1 then
            None_2("None")
            u131:spring(u108.Cameras.Second.CFrame, {frequency = 3})
            return
        end
        None_2(p1)
        u131:spring(u108.Cameras:WaitForChild(p1).CFrame, {frequency = 3})
    end
    react.useEffect(function() -- Line: 341 -- upvalues: u108 (val), u27 (val)
        local Descendants = u108.Lights:WaitForChild("Spotlights"):GetDescendants()
        for k, v in pairs(Descendants) do
            if v:IsA("SpotLight") then
                v.Enabled = u27
            end
        end
    end, {u27})
    useAsyncEffect(function() -- Line: 351 -- upvalues: u18 (ref), loading (val), u486 (upval), u108 (val), TweenService (upval), Promise (upval), u131 (val), u121 (val), u120 (val), PlayLightningStrikeEffect (upval), u33 (val)
        if not u18 or loading or loading == nil then
            u486 = false
            return
        end
        u108.Audio.Rain:Play()
        u108.Audio.Rain.Volume = 0
        local v1 = TweenInfo.new(0.5)
        TweenService:Create(u108.Audio.Rain, v1, {Volume = 1}):Play()
        u108.Audio.Piano:Play()
        local v2 = {}
        local v3 = Promise.delay(0):andThen(function() -- Line: 369 -- upvalues: u131 (upval), u108 (upval)
            u131:spring(u108.Cameras.Second.CFrame, {frequency = 9})
        end)
        v1 = Promise.delay(2):andThen(function() -- Line: 376 -- upvalues: u121 (upval), u120 (upval)
            u121:Play(0.1)
            u120:Stop(0.1)
        end)
        local v4 = Promise.delay(3):andThen(function() -- Line: 382 -- upvalues: u486 (upval), PlayLightningStrikeEffect (upval), u108 (upval)
            u486 = true
            PlayLightningStrikeEffect(u108)
        end)
        v2[1] = v3
        v2[2] = v1
        v2[3] = v4
        v2[4] = Promise.delay(4.5):andThen(function() -- Line: 387 -- upvalues: u33 (upval)
            u33(true)
        end)
        return Promise.all(v2)
    end, {u18, loading})
    react.useEffect(function() -- Line: 393 -- upvalues: u47 (val), u487 (upval), u486 (upval), Intro (upval), u108 (val), black (val), u43 (val)
        if not u47 or u487 then
            return
        end
        u487 = true
        u486 = false
        Intro(u108, black, function() -- Line: 403 -- upvalues: u43 (upval)
            u43(true)
        end)
    end, {u47, v5, v6})
    local createElement = react.createElement
    local v9 = {Vignette = react.createElement(Vignette, {Enabled = true})}
    local v10 = v2
    if v10 then
        v10 = react.createElement(ConversationPage, {
            Enabled = true,
            Completed = function() -- Line: 413 -- upvalues: u43 (val)
                u43(false)
            end,
        })
    end
    v9.Conversation = v10
    local v11 = {}
    local v12 = UDim2.fromScale(1, 1)
    v11.Position = v12 + UDim2.fromOffset(-40, -40)
    v11.AnchorPoint = Vector2.new(1, 1)
    v11.Size = UDim2.fromOffset(50, 50)
    v11.BackgroundColor3 = v8.PageBackground
    local v13 = {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(1, 0)})}
    local v14 = {
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Size = UDim2.fromOffset(30, 30),
        Image = "rbxassetid://12974383854",
        BackgroundTransparency = 1,
    }
    v14[react.Event.MouseButton1Click] = function() -- Line: 435 -- upvalues: u28 (val), u27 (val)
        u28(not u27)
    end
    v13.Lights = react.createElement("ImageButton", v14)
    v9.Spotlight = react.createElement("Frame", v11, v13)
    v11 = {Visible = false}
    v12 = UDim2.fromScale(1, 1)
    v11.Position = v12 + UDim2.fromOffset(-110, -40)
    v11.AnchorPoint = Vector2.new(1, 1)
    v11.Size = UDim2.fromOffset(50, 50)
    v11.BackgroundColor3 = v8.PageBackground
    v13 = {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(1, 0)})}
    v14 = {
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Size = UDim2.fromOffset(30, 30),
        Image = "rbxassetid://12967712847",
        BackgroundTransparency = 1,
    }
    v14[react.Event.MouseButton1Click] = function() -- Line: 459 -- upvalues: Players (upval)
        local TeleportService = game:GetService("TeleportService")
        TeleportService:Teleport(74749613936308, Players.LocalPlayer)
    end
    v13.Development = react.createElement("ImageButton", v14)
    v9.Development = react.createElement("Frame", v11, v13)
    local createElement_2 = react.createElement
    v11 = {Position = UDim2.fromScale(0.5, 0.5), Size = UDim2.fromScale(0.83, 0.865)}
    v13 = {Ratio = react.createElement(Ratio, {Ratio = 1.241})}
    local createElement_3 = react.createElement
    v14 = {Enabled = v1, Tween = TweenInfo.new(0.5)}
    local v15 = {Layout = react.createElement(PageLayout, {AlignTop = true}), Header = react.createElement(PageHeader, {
        Header = "Customization",
        Body = "Modify your character's facial structure and hair color.",
        Icon = "rbxassetid://12967618029",
        Clicked = function() -- Line: 484 -- upvalues: u135 (val)
            u135("Submit Character", "Would you like to finalize and submit this character? You will not be able to change facial features beyond this point.", Color3.fromRGB(6, 101, 255))
        end,
    })}
    local createElement_4 = react.createElement
    local v16 = {LayoutOrder = 2, ZIndex = 2, Subtabs = true}
    local v17 = UDim2.fromScale(1, 0)
    v16.Size = v17 + UDim2.fromOffset(0, v7(30))
    local v18 = u18
    if v18 then
        v17 = None == "Conversating"
        v18 = not v17
    end
    v16.Visible = v18
    v18 = {}
    local v19 = {Text = "Customize Hair"}
    local v20 = None == "Hair"
    v19.Selected = v20
    function v19.Clicked() -- Line: 503 -- upvalues: setCustomizationType (val)
        setCustomizationType("Hair")
    end
    v18.Hair = react.createElement(Tablet, v19)
    v19 = {Text = "Customize Face"}
    v20 = None == "Face"
    v19.Selected = v20
    function v19.Clicked() -- Line: 511 -- upvalues: setCustomizationType (val)
        setCustomizationType("Face")
    end
    v18.Face = react.createElement(Tablet, v19)
    v19 = {Text = "Customize Complexion"}
    v20 = None == "Complexion"
    v19.Selected = v20
    function v19.Clicked() -- Line: 519 -- upvalues: setCustomizationType (val)
        setCustomizationType("Complexion")
    end
    v18.Complexion = react.createElement(Tablet, v19)
    v19 = {Text = "Customize Outfit"}
    v20 = None == "Outfit"
    v19.Selected = v20
    function v19.Clicked() -- Line: 527 -- upvalues: setCustomizationType (val)
        setCustomizationType("Outfit")
    end
    v18.Outfit = react.createElement(Tablet, v19)
    v15.Tabs = createElement_4(TabLayout, v16, v18)
    v16 = {ZIndex = 3, LayoutOrder = 3, Size = UDim2.fromScale(1, 0.823)}
    v18 = {}
    v19 = {}
    v20 = None == "Face"
    v19.Enabled = v20
    v19.Character = u108.Character
    v19.Updated = v3
    v18.Face = react.createElement(FacePage, v19)
    v19 = {}
    v20 = None == "Complexion"
    v19.Enabled = v20
    v19.Character = u108.Character
    v19.Updated = v4
    v18.Complexion = react.createElement(ComplexionPage, v19)
    v19 = {}
    v20 = None == "Outfit"
    v19.Enabled = v20
    v19.Character = u108.Character
    v19.Default = u72
    function v19.Updated(p1, p2) -- Line: 558 -- upvalues: u73 (val)
        u73({shirt = p1, pants = p2})
    end
    v18.Outfit = react.createElement(OutfitPage, v19)
    v19 = {}
    v20 = None == "Hair"
    v19.Enabled = v20
    v19.Character = u108.Character
    function v19.Updated(p1, p2) -- Line: 570 -- upvalues: u23 (val), u63 (val)
        u23(not p1)
        u63({
            hair = {r = math.floor(p2.R * 255), g = math.floor(p2.G * 255), b = math.floor(p2.B * 255)},
        })
    end
    v18.Hair = react.createElement(HairPage, v19)
    v15.Content = react.createElement(Frame, v16, v18)
    v13.TransparencyGroup = createElement_3(TransparencyGroup, v14, v15)
    v9.Content = createElement_2(Frame, v11, v13)
    return createElement(Frame, {}, v9)
end