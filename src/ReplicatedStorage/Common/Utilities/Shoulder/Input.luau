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
--                File: ReplicatedStorage.Common.Utilities.Shoulder.Input
--                              Dumped in 0.000650 seconds
--                          Bytecode version 9  |  7 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
v1 = {}
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local TouchEnabled = UserInputService.TouchEnabled
local MouseEnabled = UserInputService.MouseEnabled
local GamepadEnabled = UserInputService.GamepadEnabled
local u28 = Vector2.new()
local u29 = {}
local function IsInDynamicThumbstickArea(p1) -- Line: 30 -- upvalues: LocalPlayer (val)
    local PlayerGui = LocalPlayer:FindFirstChildOfClass("PlayerGui")
    local TouchGui = PlayerGui
    if TouchGui then
        TouchGui = PlayerGui:FindFirstChild("TouchGui")
    end
    local TouchControlFrame = TouchGui
    if TouchControlFrame then
        TouchControlFrame = TouchGui:FindFirstChild("TouchControlFrame")
    end
    local DynamicThumbstickFrame = TouchControlFrame
    if DynamicThumbstickFrame then
        DynamicThumbstickFrame = TouchControlFrame:FindFirstChild("DynamicThumbstickFrame")
    end
    if not DynamicThumbstickFrame or not TouchGui.Enabled then
        return false
    end
    local AbsolutePosition = DynamicThumbstickFrame.AbsolutePosition
    local v1 = AbsolutePosition + DynamicThumbstickFrame.AbsoluteSize
    local v2 = if AbsolutePosition.X <= p1.X then if AbsolutePosition.Y <= p1.Y then if p1.X <= v1.X then p1.Y <= v1.Y else false else false else false
    return v2
end
if TouchEnabled then
    UserInputService.TouchStarted:Connect(function(p1, p2) -- Line: 51 -- upvalues: IsInDynamicThumbstickArea (val), u29 (val)
        if not p2 then
            local Position = p1.Position
            local v1 = Vector2.new(Position.X, Position.Y)
            if not (IsInDynamicThumbstickArea(v1)) then
                u29[p1] = true
            end
        end
    end)
    UserInputService.TouchMoved:Connect(function(p1, p2) -- Line: 61 -- upvalues: u29 (val), u28 (ref)
        if u29[p1] then
            local Delta = p1.Delta
            u28 = Vector2.new(Delta.X, Delta.Y)
        end
    end)
    UserInputService.TouchEnded:Connect(function(p1, p2) -- Line: 68 -- upvalues: u29 (val)
        if u29[p1] then
            u29[p1] = nil
        end
    end)
elseif GamepadEnabled then
    UserInputService.InputChanged:Connect(function(p1, p2) -- Line: 74 -- upvalues: u28 (ref)
        if not p2 and p1.KeyCode == Enum.KeyCode.Thumbstick2 then
            local v1, v2
            local Position = p1.Position
            if 0.15 >= Position.Magnitude then
                v1 = 0
                v2 = 0
            else
                v1 = Position.X * 20
                v2 = -(Position.Y * 15)
            end
            u28 = Vector2.new(v1, v2)
        end
    end)
end
function v1.GetDelta() -- Line: 93 -- upvalues: u28 (ref), TouchEnabled (val), MouseEnabled (val), UserInputService (val)
    local v1 = u28
    if TouchEnabled then
        u28 = Vector2.new(0, 0)
        return v1
    end
    if MouseEnabled then
        v1 = UserInputService:GetMouseDelta()
    end
    return v1
end
return v1