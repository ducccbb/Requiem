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
--File: ReplicatedStorage.Client.Progression.Enchantments.Enchantments.Mythic.Warden of Ymir
--                              Dumped in 0.000770 seconds
--                          Bytecode version 9  |  4 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Character = require(Utilities:WaitForChild("Character"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Animations = Common_2:WaitForChild("Animations")
local Default = require(Animations:WaitForChild("Default"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Observers = Common_3:WaitForChild("Observers")
local useAnimatorObserver = require(Observers:WaitForChild("useAnimatorObserver"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_4:WaitForChild("Client")
local User = Client:WaitForChild("User")
local State = User:WaitForChild("State")
local ClientStateHandler = require(State:WaitForChild("ClientStateHandler"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_5:WaitForChild("Common")
local Alive = require(Common_4:WaitForChild("Alive"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_6:WaitForChild("Common")
local Signals = require(Common_5:WaitForChild("Signals"))
local u132 = nil
local u133 = {
    "The chains have found their mark.",
    "No soul escapes its sentence.",
    "The iron remembers your name.",
    "Every chain finds its burden.",
    "Your fate is bound.",
    "It was only a matter of time.",
}
return {
    verify = function() -- Line: 91 -- upvalues: Character (val), Workspace (val), UserInputService (val), Alive (val), u132 (ref), ClientStateHandler (val), Signals (val), u133 (val)
        if not (Character.getCharacter()) then
            return
        end
        local MouseLocation = UserInputService:GetMouseLocation()
        local v1 = Workspace.CurrentCamera:ScreenPointToRay(MouseLocation.X, MouseLocation.Y - game:GetService("GuiService"):GetGuiInset().Y)
        local v2 = v1.Direction * 450
        local v3 = Workspace:Raycast(v1.Origin, v2, RaycastParams.new())
        if not v3 then
            return
        end
        local Instance = v3.Instance
        if Instance then
            Instance = v3.Instance.Parent
        end
        if not Instance then
            return
        end
        local Humanoid = Instance:IsA("Model")
        if Humanoid then
            Humanoid = Instance:FindFirstChildWhichIsA("Humanoid")
        end
        if not Humanoid then
            return
        end
        v2 = Alive.getPlayerFromCharacter(Instance)
        if not v2 or v2 == Alive.LocalPlayer then
            return
        end
        print(Instance)
        u132 = Instance
        if ClientStateHandler.isStateBusy(ClientStateHandler.States.TOOL) or not u132 then
            return false
        end
        Signals.Monologue:Fire(u133[math.random(1, #u133)])
        local Highlight = Instance.new("Highlight")
        Highlight.FillTransparency = 0.5
        Highlight.OutlineTransparency = 0.5
        Highlight.FillColor = Color3.fromRGB(24, 177, 70)
        Highlight.OutlineColor = Color3.fromRGB(0, 0, 0)
        Highlight.DepthMode = Enum.HighlightDepthMode.Occluded
        Highlight.Adornee = u132
        Highlight.Parent = u132
        task.delay(90, function() -- Line: 148 -- upvalues: u132 (upval), Highlight (val)
            u132 = nil
            Highlight:Destroy()
        end)
        return true
    end,
    activated = function(p1) -- Line: 58 -- upvalues: u132 (ref), Character (val), useAnimatorObserver (val), Default (val)
        if not u132 then
            print("No hovered target")
            return
        end
        local v1 = Character.getCharacter()
        if not v1 then
            print("No character")
            return
        end
        local v2 = v1:FindFirstChild("Right Arm")
        if not v2 then
            print("No character right hand")
            return
        end
        local Torso = u132:FindFirstChild("Torso")
        if not Torso then
            print("No hovered torso")
            return
        end
        print("Playing animation")
        useAnimatorObserver.play(Default.Throw, 0.1)
        print("Posting")
        p1(u132, Torso, v2)
    end,
    settings = {
        description = "To hold a soul in chains, one must be willing to grasp the iron with their own hands.",
        passive = false,
        upgradable = false,
        art = "rbxassetid://139224741143471",
        glow = Color3.fromRGB(6, 164, 255),
        embers = Color3.fromRGB(155, 218, 255),
        pulse = true,
    },
}