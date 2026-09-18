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
--        File: ReplicatedStorage.Client.Interfaces.Routes.Pages.Trainer.Balancer
--                               Dumped in 0.00186 seconds
--                          Bytecode version 9  |  8 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Constants = require(Common:WaitForChild("Constants"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Network = Common_2:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Gear = require(Namespaces:WaitForChild("Gear"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_3:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_4:WaitForChild("Client")
local User = Client:WaitForChild("User")
local Character = User:WaitForChild("Character")
local CharacterRagdollHandler = require(Character:WaitForChild("CharacterRagdollHandler"))
local Components = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Universal = Components:WaitForChild("Universal")
local Badge = require(Universal:WaitForChild("Badge"))
local Components_2 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Inputs = Components_2:WaitForChild("Inputs")
local Button = require(Inputs:WaitForChild("Button"))
local Components_3 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Screen = Components_3:WaitForChild("Screen")
local DynamicPage = require(Screen:WaitForChild("DynamicPage"))
local Components_4 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Universal_2 = Components_4:WaitForChild("Universal")
local Form = require(Universal_2:WaitForChild("Form"))
local Components_5 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Primitives = Components_5:WaitForChild("Primitives")
local Frame = require(Primitives:WaitForChild("Frame"))
local Components_6 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Universal_3 = Components_6:WaitForChild("Universal")
local HeaderBodyComponent = require(Universal_3:WaitForChild("HeaderBodyComponent"))
local Components_7 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Menu = Components_7:WaitForChild("Menu")
local PageLayout = require(Menu:WaitForChild("PageLayout"))
local Components_8 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Primitives_2 = Components_8:WaitForChild("Primitives")
local Ratio = require(Primitives_2:WaitForChild("Ratio"))
local Components_9 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Utilities = Components_9:WaitForChild("Utilities")
local Scaler = require(Utilities:WaitForChild("Scaler"))
local Components_10 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Utilities_2 = Components_10:WaitForChild("Utilities")
local TransparencyGroup = require(Utilities_2:WaitForChild("TransparencyGroup"))
local Components_11 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Primitives_3 = Components_11:WaitForChild("Primitives")
local VerticalListLayout = require(Primitives_3:WaitForChild("VerticalListLayout"))
local Components_12 = v1.Parent:WaitForChild("Components")
local BalancerMinigameHard = require(Components_12:WaitForChild("BalancerMinigameHard"))
local Components_13 = v1.Parent:WaitForChild("Components")
local BalancerMinigameMedium = require(Components_13:WaitForChild("BalancerMinigameMedium"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_5:WaitForChild("Common")
local Statistics = Common_3:WaitForChild("Statistics")
local useJumpPower = require(Statistics:WaitForChild("useJumpPower"))
local Hooks = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useInterfaceState = require(Hooks:WaitForChild("useInterfaceState"))
local Hooks_2 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useOrder = require(Hooks_2:WaitForChild("useOrder"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_6:WaitForChild("Common")
local GEAR_TRAINER = require(Common_4:WaitForChild("Debugger")).useDebugger("GEAR_TRAINER")
local u383 = {
    {Name = "Drumming Game", Difficulty = "Easy", Description = "Become a certified user of omni-directional movement gear."},
    {Name = "Rhythm Game", Difficulty = "Hard", Description = "Unlock the rhythmatic enchantment, alongside gear experience."},
}
local u386 = nil
return function() -- Line: 81 -- upvalues: useInterfaceState (val), useOrder (val), react (val), u386 (ref), Constants (val), GEAR_TRAINER (val), Players (val), CharacterRagdollHandler (val), Workspace (val), Gear (val), u383 (val), Form (val), Badge (val), HeaderBodyComponent (val), Button (val), useJumpPower (val), Frame (val), DynamicPage (val), TransparencyGroup (val), Scaler (val), Ratio (val), PageLayout (val), VerticalListLayout (val), BalancerMinigameHard (val), BalancerMinigameMedium (val)
    local None, None_2, trainer, trainer_2, u19, v1
    trainer, trainer_2 = useInterfaceState("trainer")
    local v2 = trainer_2
    if not v2 then
        v2 = {visible = false}
    end
    local u7 = v2
    v2 = useOrder()
    None, None_2 = react.useState("None")
    v1, u19 = react.useState(u7.visible)
    react.useEffect(function() -- Line: 90 -- upvalues: u19 (val), u7 (ref)
        u19(u7.visible)
    end, {u7.visible})
    local v3 = {}
    local function onGearTrainerCompleted(p1, p2) -- Line: 96 -- upvalues: u386 (upval), Constants (upval), GEAR_TRAINER (upval), Players (upval), CharacterRagdollHandler (upval), Workspace (upval), trainer (val), Gear (upval), None_2 (val)
        if u386 then
            u386()
        end
        local v1 = Constants.Places.Exam == game.PlaceId
        GEAR_TRAINER("User completed gear trainer minigame :", p1, p2)
        local Character = Players.LocalPlayer.Character
        local Humanoid = Character
        if Humanoid then
            Humanoid = Character:FindFirstChildWhichIsA("Humanoid")
        end
        if Humanoid then
            GEAR_TRAINER("Ragdolling character for gear trainer minigame.")
            Humanoid.JumpPower = 50
            Humanoid.Sit = false
            Humanoid.Jump = true
            if v1 then
                Workspace:SetAttribute("Balancer", p1)
            else
                task.delay(0.1, function() -- Line: 115 -- upvalues: CharacterRagdollHandler (upval)
                    CharacterRagdollHandler.ragdoll(2)
                end)
            end
        end
        trainer({visible = false})
        Gear.Score.post({score = p1, type = p2})
        None_2("None")
    end
    for i, v in ipairs(u383) do
        table.insert(v3, react.createElement(Form.Form, {Height = "P_30"}, {Left = react.createElement(Form.Divider, {Side = "Left"}, {Badge = react.createElement(Badge, {
            Padding = "Large",
            Text = v.Difficulty,
            Native = {LayoutOrder = v2()},
        }), Label = react.createElement(HeaderBodyComponent, {
            Wrap = true,
            Header = v.Name,
            Body = v.Description,
            Native = {LayoutOrder = v2()},
        })}), Right = react.createElement(Form.Divider, {Side = "Right"}, {Button = react.createElement(Button, {
            Text = "Begin",
            Clicked = function() -- Line: 164 -- upvalues: GEAR_TRAINER (upval), v (val), None_2 (val), useJumpPower (upval), u386 (upval)
                local v1
                GEAR_TRAINER("User started gear trainer minigame :", v.Name)
                None_2(v.Name)
                _, v1 = useJumpPower()
                u386 = v1("trainer", 0, "set", 500)
            end,
        })})}))
    end
    local v4 = {Page = react.createElement(DynamicPage, {Enabled = v1})}
    local v5 = {ZIndex = 3}
    local v6 = v1
    if v6 then
        v6 = None == "None"
    end
    v5.Enabled = v6
    v5.Tween = TweenInfo.new(0.3)
    v5.Delays = {Enabled = 0.2, Disabled = 0}
    v4.Group = react.createElement(TransparencyGroup, v5, {Content = react.createElement("Frame", {
        BackgroundTransparency = 1,
        ZIndex = 2,
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(0.75, 0.865),
        AnchorPoint = Vector2.new(0.5, 0.5),
    }, {Scaler = react.createElement(Scaler, {
        Enabled = v1,
        Delay = {Enabled = 0.2, Disabled = 0},
    }, {Ratio = react.createElement(Ratio, {Ratio = 1.241}), Layout = react.createElement(PageLayout), Content = react.createElement(Frame, {Size = UDim2.fromScale(1, 0.823)}, {Layout = react.createElement(VerticalListLayout, {Spacing = 7, VerticalAlignment = Enum.VerticalAlignment.Top})}, v3)})})})
    v5 = {}
    v6 = v1
    if v6 then
        v6 = None == "Rhythm Game"
    end
    v5.Enabled = v6
    function v5.Completed(p1) -- Line: 214 -- upvalues: onGearTrainerCompleted (val), None (val)
        onGearTrainerCompleted(p1, None)
    end
    v4.RhythmMinigame = react.createElement(BalancerMinigameHard.BalancerMinigameHard, v5)
    v5 = {}
    v6 = v1
    if v6 then
        v6 = None == "Drumming Game"
    end
    v5.Enabled = v6
    function v5.Completed(p1) -- Line: 222 -- upvalues: onGearTrainerCompleted (val), None (val)
        onGearTrainerCompleted(p1, None)
    end
    v4.DrummingMinigame = react.createElement(BalancerMinigameMedium, v5)
    return react.createElement(Frame, {}, v4)
end