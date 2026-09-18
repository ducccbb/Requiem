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
--              File: ReplicatedStorage.Client.World.Development.Focusable
--                              Dumped in 0.000345 seconds
--                          Bytecode version 9  |  5 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local CollectionService = game:GetService("CollectionService")
local TweenService = game:GetService("TweenService")
local function onFocusableObjectAdded(p1) -- Line: 11 -- upvalues: TweenService (val)
    local move
    local CFrame = p1.CFrame
    local u7 = CFrame * CFrame.new(-50, 0, 0)
    local u13 = CFrame * CFrame.new(50, 0, 0)
    function move(a1) -- Line: 18 -- upvalues: TweenService (upval), p1 (val), move (val), u7 (val), u13 (val)
        local v1 = TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
        TweenService:Create(p1, v1, {CFrame = a1}):Play()
        task.delay(3, function() -- Line: 23 -- upvalues: move (upval), a1 (val), u7 (upval), u13 (upval)
            local v1
            if a1 ~= u7 then
                v1 = u7
            else
                v1 = u13
                if not v1 then
                    v1 = u7
                end
            end
            move(v1)
        end)
    end
    move(u7)
end
local Tagged = CollectionService:GetTagged("Movement")
for i, v in ipairs(Tagged) do
    onFocusableObjectAdded(v)
end
local InstanceAddedSignal = CollectionService:GetInstanceAddedSignal("Movement")
InstanceAddedSignal:Connect(function(...) -- Line: 36 -- upvalues: onFocusableObjectAdded (val)
    onFocusableObjectAdded(...)
end)
return {}