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
--   File: ReplicatedStorage.Client.Interfaces.Components.Utilities.TransparencyGroup
--                               Dumped in 0.00102 seconds
--                          Bytecode version 9  |  11 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Packages_2 = ReplicatedStorage_2:WaitForChild("Packages")
local u41 = require(Packages_2:WaitForChild("react-roblox"))
local Providers = v1.Parent.Parent.Parent:WaitForChild("Providers")
local SettingProvider = require(Providers:WaitForChild("SettingProvider"))
local Hooks = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useMotion = require(Hooks:WaitForChild("useMotion"))
return function(p1) -- Line: 53 -- upvalues: react (val), SettingProvider (val), useMotion (val), u41 (val)
    local u19, u20, u34, u4, u9, v1, v2, v3, v4
    u4, v1 = react.useState(nil)
    u9, v2 = react.useState(nil)
    local u15 = react.useContext(SettingProvider.SettingContext)
    u19, u20 = react.useState(false)
    react.useEffect(function() -- Line: 61 -- upvalues: u15 (val), u20 (val)
        local settings
        if not u15 then
            settings = {}
        else
            settings = u15.settings
            if not settings then
                settings = {}
            end
        end
        local v1 = settings
        if v1 then
            v1 = settings.Interface.Performance[1].Value == 1
        end
        u20(v1)
    end, {u15})
    if not p1.Enabled then
        v4 = 1
    else
        v4 = 0
    end
    v3, u34 = useMotion(v4)
    local u39 = react.useMemo(function() -- Line: 69
        local Frame = Instance.new("Frame")
        Frame.Size = UDim2.fromScale(1, 1)
        Frame.BackgroundTransparency = 1
        Frame.AnchorPoint = Vector2.new(0.5, 0.5)
        Frame.Position = UDim2.fromScale(0.5, 0.5)
        return Frame
    end, {})
    react.useEffect(function() -- Line: 79 -- upvalues: u4 (val), u9 (val), u39 (val), u19 (val), u34 (val), p1 (val)
        local Enabled, v1
        if not u4 or not u9 or not u39 then
            return
        end
        if u19 then
            local v2
            if not p1.Enabled then
                v2 = 1
            else
                v2 = 0
            end
            u34:immediate(v2)
            return
        end
        if not p1.Delays then
            Enabled = 0
        elseif not p1.Enabled then
            Enabled = p1.Delays.Disabled
            if not Enabled then
                Enabled = 0
            end
        else
            Enabled = p1.Delays.Enabled
        end
        if not p1.Enabled then
            v1 = 1
        else
            v1 = 0
        end
        u34:tween(v1, {time = p1.Tween.Time * 0.6, style = p1.Tween.EasingStyle, direction = p1.Tween.EasingDirection, delayTime = Enabled * 0.6})
        u39.Parent = u9
    end, {p1.Enabled, u4, u9, u19})
    react.useEffect(function() -- Line: 101 -- upvalues: u34 (val), u4 (val), u19 (val), u39 (val)
        if not u34 or not u4 then
            return
        end
        if u19 then
            u39.Parent = u4
            return
        end
        local u6 = nil
        local u13 = u34.onTargetChanged:Connect(function() -- Line: 115 -- upvalues: u6 (ref), u34 (upval), u39 (upval), u4 (upval)
            if u6 then
                u6()
            end
            u6 = u34:onComplete(function() -- Line: 120 -- upvalues: u39 (upval), u4 (upval), u6 (upval)
                u39.Parent = u4
                if u6 then
                    u6()
                end
            end)
        end)
        return function() -- Line: 129 -- upvalues: u13 (ref), u6 (ref)
            u13:Disconnect()
            if u6 then
                u6()
            end
        end
    end, {u34, u4, u19})
    react.useEffect(function() -- Line: 138 -- upvalues: u39 (val), u4 (val)
        if not u39 or not u4 then
            return
        end
        u39.Parent = u4
    end, {u39, u4, u19})
    local v5 = {
        BackgroundTransparency = 1,
        Visible = v3:map(function(p1) -- Line: 147
            local v1 = p1 == 1
            return not v1
        end),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.new(1, 0, 1, 0),
        ZIndex = p1.ZIndex or -1,
    }
    local v6 = {Frame = react.createElement("Frame", {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 1),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        ref = v1,
    }), Canvas = react.createElement("CanvasGroup", {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 1),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        GroupTransparency = v3,
        ref = v2,
    })}
    local v7 = react.createElement(react.Fragment, {}, p1.children)
    return react.createElement("Frame", v5, v6, u41.createPortal(v7, u39))
end