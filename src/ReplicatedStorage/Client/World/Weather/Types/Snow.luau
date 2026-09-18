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
--                File: ReplicatedStorage.Client.World.Weather.Types.Snow
--                              Dumped in 0.000671 seconds
--                          Bytecode version 9  |  5 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Snow = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Objects"):WaitForChild("Snow")
local u37 = (function(p1) -- Line: 23
    local Components_10, Components_2, Components_3, Components_4, Components_5, Components_6, Components_7, Components_8, Components_9
    _, _, _, Components_2, Components_3, Components_4, Components_5, Components_6, Components_7, Components_8, Components_9, Components_10 = p1:GetComponents()
    return CFrame.new(0, 0, 0, Components_2, Components_3, Components_4, Components_5, Components_6, Components_7, Components_8, Components_9, Components_10)
end)(Snow.CFrame)
local u38 = nil
return {
    begin = function() -- Line: 39 -- upvalues: u38 (ref), Snow (val), RunService (val), u37 (val)
        if u38 then
            return
        end
        Snow.Parent = workspace
        u38 = RunService.RenderStepped:Connect(function() -- Line: 46 -- upvalues: Snow (upval), u37 (upval)
            local CurrentCamera = workspace.CurrentCamera
            if not CurrentCamera then
                return
            end
            Snow.CFrame = u37 + (CurrentCamera.CFrame.Position + CurrentCamera.CFrame.UpVector * 15)
        end)
    end,
    stop = function() -- Line: 60 -- upvalues: u38 (ref), Snow (val)
        if u38 then
            u38:Disconnect()
            u38 = nil
        end
        Snow.Parent = nil
    end,
}