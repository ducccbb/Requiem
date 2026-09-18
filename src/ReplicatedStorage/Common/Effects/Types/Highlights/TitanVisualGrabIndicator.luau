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
--   File: ReplicatedStorage.Common.Effects.Types.Highlights.TitanVisualGrabIndicator
--                              Dumped in 0.000366 seconds
--                          Bytecode version 9  |  4 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage:WaitForChild("Client")
local Entities = Client:WaitForChild("Entities")
local Titans = Entities:WaitForChild("Titans")
local ClientTitanHandler = require(Titans:WaitForChild("ClientTitanHandler"))
return function(p1, p2) -- Line: 15 -- upvalues: ClientTitanHandler (val), TweenService (val)
    local v1 = ClientTitanHandler.getTitanById(p2)
    if not v1 then
        return
    end
    local client = v1.model.client
    if not client then
        return
    end
    local Highlight = Instance.new("Highlight")
    Highlight.FillTransparency = 1
    Highlight.FillColor = Color3.fromRGB(52, 140, 255)
    Highlight.OutlineTransparency = 1
    Highlight.Parent = client
    local v2 = TweenInfo.new(0.2)
    TweenService:Create(Highlight, v2, {FillTransparency = 0.5}):Play()
    task.delay(0.2, function() -- Line: 39 -- upvalues: TweenService (upval), Highlight (val)
        local v1 = TweenInfo.new(1)
        TweenService:Create(Highlight, v1, {FillTransparency = 1}):Play()
        task.delay(1, function() -- Line: 44 -- upvalues: Highlight (upval)
            Highlight:Destroy()
        end)
    end)
end