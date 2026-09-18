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
--                   File: ReplicatedStorage.Assets.Chat.Modules.Util
--                              Dumped in 0.000315 seconds
--                          Bytecode version 9  |  4 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
return {
    WaitForChildWhichIsA = function(p1, p2, p3) -- Line: 10
        local v1
        local u6 = p1:FindFirstChildWhichIsA(p2)
        if u6 ~= nil then
            return u6
        end
        local u10 = Instance.new("BindableEvent")
        local v2 = nil
        local v3 = p1.Destroying:Connect(function() -- Line: 15 -- upvalues: u10 (val)
            u10:Fire()
        end)
        local v4 = p1.ChildAdded:Connect(function(p1) -- Line: 16 -- upvalues: p2 (val), u6 (ref), u10 (val)
            if p1:IsA(p2) then
                u6 = p1
                u10:Fire()
            end
        end)
        if p3 == math.huge then
            v1 = nil
        elseif tostring(p3) ~= "nan" then
            v1 = p3
        end
        if v1 ~= nil then
            v2 = task.delay(v1, u10.Fire, u10)
        end
        u10.Event:Wait()
        u10:Destroy()
        v3:Disconnect()
        v4:Disconnect()
        if v2 ~= nil then
            task.cancel(v2)
        end
        return u6
    end,
}