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
--               File: ReplicatedStorage.Client.World.Training.TitanDummy
--                              Dumped in 0.000763 seconds
--                          Bytecode version 9  |  9 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local CollectionService = game:GetService("CollectionService")
local TweenService = game:GetService("TweenService")
local function onDummyInitialized(p1) -- Line: 21 -- upvalues: TweenService (val)
    local onRotateDummy180Degrees
    local NumberValue = Instance.new("NumberValue")
    local NumberValue_2 = Instance.new("NumberValue")
    local u7 = nil
    local u8 = nil
    local u9 = 1
    function onRotateDummy180Degrees(p1) -- Line: 29 -- upvalues: u9 (ref), u7 (ref), TweenService (upval), NumberValue (val), NumberValue_2 (val), u8 (ref), onRotateDummy180Degrees (val)
        u9 = p1
        local v1 = TweenInfo.new(5, Enum.EasingStyle.Linear)
        u7 = TweenService:Create(NumberValue, v1, {Value = NumberValue.Value + p1 * 180})
        if NumberValue_2.Value ~= 0 then
            return
        end
        u7:Play()
        u8 = u7.Completed:Connect(function() -- Line: 41 -- upvalues: p1 (ref), u8 (upval), onRotateDummy180Degrees (upval)
            if math.random(1, 4) == 1 then
                p1 = p1 * -1
            end
            u8:Disconnect()
            onRotateDummy180Degrees(p1)
        end)
    end
    local Pivot = p1:GetPivot()
    local Dummy = p1.Dummy
    local Pivot_2 = Dummy:GetPivot()
    local PropertyChangedSignal = NumberValue:GetPropertyChangedSignal("Value")
    PropertyChangedSignal:Connect(function() -- Line: 56 -- upvalues: p1 (val), Pivot (val), NumberValue (val)
        local v1 = math.rad(NumberValue.Value)
        p1:PivotTo(Pivot * CFrame.Angles(0, v1, 0))
    end)
    local PropertyChangedSignal_2 = NumberValue_2:GetPropertyChangedSignal("Value")
    PropertyChangedSignal_2:Connect(function() -- Line: 60 -- upvalues: Dummy (val), Pivot_2 (val), NumberValue (val), NumberValue_2 (val)
        local v1 = math.rad(NumberValue.Value)
        Dummy:PivotTo(Pivot_2 * CFrame.Angles(0, v1, (math.rad(NumberValue_2.Value))))
    end)
    local AttributeChangedSignal = p1:GetAttributeChangedSignal("Knocked")
    AttributeChangedSignal:Connect(function() -- Line: 64 -- upvalues: p1 (val), u7 (ref), u8 (ref), TweenService (upval), NumberValue (val), u9 (ref), NumberValue_2 (val), Dummy (val), onRotateDummy180Degrees (val)
        local v1
        if not (p1:GetAttribute("Knocked")) or not u7 then
            if u7 then
                v1 = TweenInfo.new(7)
                TweenService:Create(NumberValue_2, v1, {Value = 0}):Play()
                task.delay(7, function() -- Line: 87 -- upvalues: Dummy (upval), p1 (upval), onRotateDummy180Degrees (upval)
                    Dummy.Parent = p1
                    onRotateDummy180Degrees(1)
                end)
            end
            return
        end
        if u8 then
            u8:Disconnect()
        end
        v1 = TweenInfo.new(0.2, Enum.EasingStyle.Sine)
        TweenService:Create(NumberValue, v1, {Value = NumberValue.Value + u9 * 5}):Play()
        task.wait(0.215)
        v1 = TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
        TweenService:Create(NumberValue_2, v1, {Value = -80}):Play()
    end)
    task.spawn(function() -- Line: 94 -- upvalues: onRotateDummy180Degrees (val)
        onRotateDummy180Degrees(1)
    end)
end
for k, v in pairs(CollectionService:GetTagged("Titan Dummy")) do
    onDummyInitialized(v)
end
local InstanceAddedSignal = CollectionService:GetInstanceAddedSignal("Titan Dummy")
InstanceAddedSignal:Connect(onDummyInitialized)
return {}