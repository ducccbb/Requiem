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
--             File: ReplicatedStorage.Client.Interfaces.Routes.Screen.Horse
--                              Dumped in 0.000708 seconds
--                          Bytecode version 9  |  8 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local Components = script.Parent.Parent.Parent:WaitForChild("Components")
local Utilities = Components:WaitForChild("Utilities")
local TransparencyGroup = require(Utilities:WaitForChild("TransparencyGroup"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Utilities_2 = Common:WaitForChild("Utilities")
local State = require(Utilities_2:WaitForChild("State"))
return function() -- Line: 22 -- upvalues: State (val), react (val), TransparencyGroup (val)
    local mount, mount_2, u10, u15, v1, v2
    _, _, mount, mount_2 = State("mount")
    v1, u10 = react.useBinding(0)
    v2, u15 = react.useState(function() -- Line: 30 -- upvalues: mount_2 (val)
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
    react.useEffect(function() -- Line: 36 -- upvalues: mount (val), u10 (val), u15 (val)
        local u2 = mount(function(p1) -- Line: 37 -- upvalues: u10 (upval), u15 (upval)
            local enabled, stamina
            if not p1 then
                enabled = false
            else
                enabled = p1.enabled
            end
            if not p1 then
                stamina = 0
            else
                stamina = p1.stamina
                if not stamina then
                    stamina = 0
                end
            end
            u10(stamina)
            u15(function(p1) -- Line: 45 -- upvalues: enabled (val)
                if p1 ~= enabled then
                    return enabled
                end
                return p1
            end)
        end)
        return function() -- Line: 53 -- upvalues: u2 (val)
            u2()
        end
    end, {})
    return react.createElement(TransparencyGroup, {Enabled = v2, Tween = TweenInfo.new(0.3)}, {Frame = react.createElement("Frame", {
        BackgroundTransparency = 0.7,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.85),
        Size = UDim2.fromOffset(638, 11),
    }, {Container = react.createElement("Frame", {
        BackgroundTransparency = 0.7,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(189, 189, 189),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
    }, {Value = react.createElement("Frame", {
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundColor3 = Color3.fromRGB(84, 138, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0, 0.5),
        Size = v1:map(function(p1) -- Line: 86
            return UDim2.fromScale(p1 / 100, 1)
        end),
    })}), Padding = react.createElement("UIPadding", {PaddingBottom = UDim.new(0, 2), PaddingLeft = UDim.new(0, 2), PaddingRight = UDim.new(0, 2), PaddingTop = UDim.new(0, 2)}), Stroke = react.createElement("UIStroke", {Transparency = 0.8, BorderOffset = UDim.new(0, 3), Color = Color3.fromRGB(255, 255, 255)})})})
end