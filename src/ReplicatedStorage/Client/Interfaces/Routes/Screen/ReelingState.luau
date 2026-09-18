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
--         File: ReplicatedStorage.Client.Interfaces.Routes.Screen.ReelingState
--                              Dumped in 0.000975 seconds
--                          Bytecode version 9  |  11 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_2:WaitForChild("Client")
local User = Client:WaitForChild("User")
local Equipment = User:WaitForChild("Equipment")
local Gear = Equipment:WaitForChild("Gear")
local ClientGearHandler = require(Gear:WaitForChild("ClientGearHandler"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_3:WaitForChild("Client")
local User_2 = Client_2:WaitForChild("User")
local State = User_2:WaitForChild("State")
local ClientSettingsHandler = require(State:WaitForChild("ClientSettingsHandler"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_4:WaitForChild("Client")
local User_3 = Client_3:WaitForChild("User")
local State_2 = User_3:WaitForChild("State")
local ClientStateHandler = require(State_2:WaitForChild("ClientStateHandler"))
local States = ClientStateHandler.States
local Hooks = script.Parent.Parent.Parent:WaitForChild("Hooks")
local useRem = require(Hooks:WaitForChild("useRem"))
local u123 = Color3.fromRGB(255, 255, 255)
local function canDisplayReelingState() -- Line: 35 -- upvalues: ClientGearHandler (val), ClientSettingsHandler (val), ClientStateHandler (val), States (val)
    local v1 = ClientGearHandler.getGearState()
    local handles = false
    if ClientSettingsHandler.getSettingFromName("Show Reeling State") == true then
        handles = false
        if v1 ~= nil then
            handles = v1.handles
            if handles then
                handles = v1.enabled
                if handles then
                    handles = not ClientStateHandler.isStateBusy(States.TRANSFORMED)
                end
            end
        end
    end
    return handles
end
return function() -- Line: 47 -- upvalues: useRem (val), react (val), RunService (val), canDisplayReelingState (val), ClientGearHandler (val), ClientStateHandler (val), States (val), ClientSettingsHandler (val), u123 (val)
    local u11, u6, v1, v2
    v1, u6 = react.useBinding("[ REELING - OFF ]")
    v2, u11 = react.useState(false)
    react.useEffect(function() -- Line: 53 -- upvalues: RunService (upval), canDisplayReelingState (upval), u11 (val), ClientGearHandler (upval), u6 (val), ClientStateHandler (upval), States (upval), ClientSettingsHandler (upval)
        local refresh
        local u0 = nil
        local u1 = nil
        local u2 = nil
        local function stopTracking() -- Line: 58 -- upvalues: u0 (ref)
            if u0 then
                u0:Disconnect()
                u0 = nil
            end
        end
        local function disconnectGearSignals() -- Line: 65 -- upvalues: u1 (ref), u2 (ref)
            if u1 then
                u1:Disconnect()
                u1 = nil
            end
            if u2 then
                u2:Disconnect()
                u2 = nil
            end
        end
        local function startTracking() -- Line: 77 -- upvalues: u0 (ref), RunService (upval), canDisplayReelingState (upval), u11 (upval), ClientGearHandler (upval), u6 (upval)
            if u0 then
                return
            end
            u0 = RunService.RenderStepped:Connect(function() -- Line: 82 -- upvalues: canDisplayReelingState (upval), u11 (upval), ClientGearHandler (upval), u6 (upval)
                local v1
                if not (canDisplayReelingState()) then
                    u11(false)
                    return
                end
                u11(true)
                local v2 = ClientGearHandler.getGearState()
                if not v2 then
                    return
                end
                local v3 = v2.reeling == true
                if not v3 then
                    v1 = "[ REELING - OFF ]"
                else
                    v1 = "[ REELING - ON ]"
                end
                u6(v1)
            end)
        end
        function refresh() -- Line: 101 -- upvalues: disconnectGearSignals (val), ClientGearHandler (upval), u1 (ref), refresh (val), u2 (ref), canDisplayReelingState (upval), startTracking (val), stopTracking (val), u11 (upval)
            disconnectGearSignals()
            local v1 = ClientGearHandler.getGearState()
            if v1 then
                u1 = v1.signals.handles:Connect(refresh)
                u2 = v1.signals.enabled:Connect(refresh)
            end
            if canDisplayReelingState() then
                startTracking()
                return
            end
            stopTracking()
            u11(false)
        end
        refresh()
        local u14 = ClientGearHandler.onGearAdded:Connect(refresh)
        local u23 = ClientStateHandler.onStateChanged(States.TRANSFORMED):Connect(refresh)
        local u29 = ClientSettingsHandler.onSettingChanged:Connect(function(p1) -- Line: 122 -- upvalues: refresh (val)
            if p1 == "Show Reeling State" then
                refresh()
            end
        end)
        return function() -- Line: 128 -- upvalues: u14 (val), u23 (val), u29 (val), disconnectGearSignals (val), stopTracking (val)
            u14:Disconnect()
            u23:Disconnect()
            u29:Disconnect()
            disconnectGearSignals()
            stopTracking()
        end
    end, {})
    return react.createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 10,
        AnchorPoint = Vector2.new(0.5, 1),
        Position = UDim2.new(0.5, 0, 1, -useRem()(138)),
        Size = UDim2.fromOffset(180, 18),
        Visible = v2,
    }, {Label = react.createElement("TextLabel", {
        BackgroundTransparency = 1,
        TextSize = 15,
        AnchorPoint = Vector2.new(0.5, 1),
        FontFace = Font.new("rbxasset://fonts/families/Fondamento.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
        Position = UDim2.fromScale(0.5, 1),
        Size = UDim2.fromScale(1, 1),
        Text = v1,
        TextColor3 = u123,
    }, {uIStroke = react.createElement("UIStroke", {Thickness = 1})})})
end