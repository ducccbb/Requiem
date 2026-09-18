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
--           File: ReplicatedStorage.Client.Interfaces.Routes.Screen.Velocity
--                               Dumped in 0.00134 seconds
--                          Bytecode version 9  |  13 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_2:WaitForChild("Client")
local Progression = Client:WaitForChild("Progression")
local ClientAttributesHandler = require(Progression:WaitForChild("ClientAttributesHandler"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_3:WaitForChild("Client")
local User = Client_2:WaitForChild("User")
local State_2 = User:WaitForChild("State")
local ClientStateHandler = require(State_2:WaitForChild("ClientStateHandler"))
local States = ClientStateHandler.States
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_4:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local State = require(Utilities:WaitForChild("State"))
return function() -- Line: 28 -- upvalues: react (val), State (val), ClientAttributesHandler (val), ClientStateHandler (val), States (val), RunService (val), Players (val)
    local mount, mount_2, u19, u20, u4, u9, v1, v2
    v1, u4 = react.useBinding(0)
    v2, u9 = react.useState(false)
    _, _, mount, mount_2 = State("mount")
    u19, u20 = react.useState(function() -- Line: 36 -- upvalues: mount_2 (val)
        local enabled
        local v1 = mount_2()
        if not v1 then
            enabled = false
        else
            enabled = v1.enabled
            if not enabled then
                enabled = false
            end
        end
        return enabled
    end)
    local u24 = react.useRef(u19)
    react.useEffect(function() -- Line: 45 -- upvalues: u24 (val), u19 (val)
        u24.current = u19
    end, {u19})
    react.useEffect(function() -- Line: 50 -- upvalues: mount (val), u24 (val), u20 (val)
        local u2 = mount(function(p1) -- Line: 51 -- upvalues: u24 (upval), u20 (upval)
            local enabled
            if not p1 then
                enabled = false
            else
                enabled = p1.enabled
                if not enabled then
                    enabled = false
                end
            end
            if u24.current ~= enabled then
                u24.current = enabled
                u20(enabled)
            end
        end)
        return function() -- Line: 60 -- upvalues: u2 (val)
            u2()
        end
    end, {})
    react.useEffect(function() -- Line: 65 -- upvalues: ClientAttributesHandler (upval), ClientStateHandler (upval), States (upval), u9 (val), u19 (val), RunService (upval), mount_2 (val), u4 (val), Players (upval)
        local CanViewVelocity = ClientAttributesHandler.getAttribute("CanViewVelocity")
        local v1 = ClientStateHandler.isStateBusy(States.TRANSFORMED)
        local v2 = true
        if CanViewVelocity ~= 1 then
            v2 = u19
            if not v2 then
                v2 = v1 and false
            end
        end
        u9(v2)
        local u23 = ClientAttributesHandler.onAttributeChanged("CanViewVelocity"):Connect(function(p1) -- Line: 74 -- upvalues: u9 (upval), u19 (upval)
            local v1 = if p1 ~= 1 then u19 else true
            u9(v1)
        end)
        local u32 = ClientStateHandler.onStateChanged(States.TRANSFORMED):Connect(function(p1) -- Line: 80 -- upvalues: u9 (upval)
            if p1 then
                u9(false)
            end
        end)
        local u42 = nil
        if CanViewVelocity == 1 then
            u42 = RunService.RenderStepped:Connect(function() -- Line: 90 -- upvalues: mount_2 (upval), u4 (upval), Players (upval)
                local Character, HumanoidRootPart
                local v1 = mount_2()
                if not v1 then
                    Character = Players.LocalPlayer.Character
                    if not Character then
                        return
                    end
                    HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
                    if not HumanoidRootPart then
                        return
                    end
                    u4((math.round(HumanoidRootPart.AssemblyLinearVelocity.Magnitude)))
                    return
                end
                if v1.enabled then
                    u4((math.round(v1.speed)))
                    return
                end
                Character = Players.LocalPlayer.Character
                if not Character then
                    return
                end
                HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
                if not HumanoidRootPart then
                    return
                end
                u4((math.round(HumanoidRootPart.AssemblyLinearVelocity.Magnitude)))
            end)
        elseif u19 then
            u42 = RunService.RenderStepped:Connect(function() -- Line: 90 -- upvalues: mount_2 (upval), u4 (upval), Players (upval)
                local Character, HumanoidRootPart
                local v1 = mount_2()
                if not v1 then
                    Character = Players.LocalPlayer.Character
                    if not Character then
                        return
                    end
                    HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
                    if not HumanoidRootPart then
                        return
                    end
                    u4((math.round(HumanoidRootPart.AssemblyLinearVelocity.Magnitude)))
                    return
                end
                if v1.enabled then
                    u4((math.round(v1.speed)))
                    return
                end
                Character = Players.LocalPlayer.Character
                if not Character then
                    return
                end
                HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
                if not HumanoidRootPart then
                    return
                end
                u4((math.round(HumanoidRootPart.AssemblyLinearVelocity.Magnitude)))
            end)
        end
        return function() -- Line: 114 -- upvalues: u23 (val), u32 (val), u42 (ref)
            u23:Disconnect()
            u32:Disconnect()
            if u42 then
                u42:Disconnect()
            end
        end
    end, {u19})
    return react.createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
        Visible = v2,
    }, {Speed = react.createElement("TextLabel", {
        TextScaled = true,
        TextSize = 14,
        TextWrapped = true,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        FontFace = Font.new("rbxasset://fonts/families/Fondamento.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
        Text = v1:map(function(p1) -- Line: 141
            return (("%*"):format(p1))
        end),
        TextColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.895),
        Size = UDim2.new(1, 0, 0, 30),
        AnchorPoint = Vector2.new(0.5, 0.5),
    }, {uIStroke = react.createElement("UIStroke")})})
end