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
--File: ReplicatedStorage.Client.User.Miscellaneous.Anxiety.Verifiable.NearbyFirearmAnxiety
--                               Dumped in 0.00152 seconds
--                          Bytecode version 9  |  9 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Player = require(Namespaces:WaitForChild("Player"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Utilities = Common_2:WaitForChild("Utilities")
local Camera = require(Utilities:WaitForChild("Camera"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Utilities_2 = Common_3:WaitForChild("Utilities")
local Character = require(Utilities_2:WaitForChild("Character"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_4:WaitForChild("Common")
local Signals = require(Common_4:WaitForChild("Signals"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_5:WaitForChild("Packages")
local trove = require(Packages:WaitForChild("trove"))
local ClientAnxietyHandler = require(script.Parent.Parent:WaitForChild("ClientAnxietyHandler"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_6:WaitForChild("Client")
local Progression = Client:WaitForChild("Progression")
local ClientAttributesHandler = require(Progression:WaitForChild("ClientAttributesHandler"))
local u135 = {"Musket", "Flintlock"}
local u138 = {}
local function calculateBaseMultiplier(p1) -- Line: 44
    return (math.clamp(math.exp(math.clamp(p1 / 100, 0, 1) * -10) * 0.8 + 0.2, 0.2, 1))
end
return {
    verify = function(p1) -- Line: 66 -- upvalues: u138 (val), Character (val), u135 (val), trove (val), ClientAttributesHandler (val), calculateBaseMultiplier (val), RunService (val), Camera (val), ClientAnxietyHandler (val), Signals (val), Player (val)
        local v1
        if u138[p1] then
            return false
        end
        local u6 = Character.getCharacter()
        if not u6 or p1 == u6 then
            return false
        end
        local function getFirearmModel() -- Line: 84 -- upvalues: u135 (upval), p1 (val)
            local v1
            local v2 = u135
            local v3 = nil
            local v4 = nil
            for i, j in v2, v3, v4 do
                v1 = p1:FindFirstChild(j)
                if v1 then
                    return v1
                end
            end
            return nil
        end
        local u10 = 0
        local u11 = false
        local u12 = 0
        local u13 = false
        local u16 = trove.new()
        local u17 = nil
        local u18 = nil
        local BaseAnxietyData = ClientAttributesHandler.getAttribute("BaseAnxietyData")
        if typeof(BaseAnxietyData) ~= "number" then
            v1 = 0
        else
            v1 = BaseAnxietyData
            if not v1 then
                v1 = 0
            end
        end
        local u32 = calculateBaseMultiplier(v1) * 60
        u16:Add((RunService.RenderStepped:Connect(function(a1) -- Line: 118 -- upvalues: u10 (ref), u11 (ref), p1 (val), u6 (val), u16 (val), getFirearmModel (val), Camera (upval), u12 (ref), u17 (ref), ClientAnxietyHandler (upval), u32 (val), u13 (ref), u18 (ref), Signals (upval), Player (upval)
    local HumanoidRootPart, HumanoidRootPart_2, Magnitude, u84, v2, v3, v4, v5, v6, v7, v8, v9
    u10 = u10 + a1
    if 30 >= u10 then
        if not p1 then
            return u16:Clean()
        elseif not p1.Parent then
            return u16:Clean()
        elseif not u6 then
            return u16:Clean()
        elseif u6.Parent then
            if getFirearmModel() then
                if p1:GetAttribute("Aiming") then
                    HumanoidRootPart = p1.HumanoidRootPart
                    HumanoidRootPart_2 = u6.HumanoidRootPart
                    Magnitude = (HumanoidRootPart.Position - HumanoidRootPart_2.Position).Magnitude
                    if 50 >= Magnitude then
                        if 300 >= Magnitude then
                            if not u11 then
                                u11 = Camera.isVectorWithinView(HumanoidRootPart.Position, 800, 300)
                            end
                            if u11 then
                                v7 = (HumanoidRootPart_2.Position - HumanoidRootPart.Position).Unit:Dot(HumanoidRootPart.CFrame.LookVector)
                                if 0.7 < v7 then
                                    if u17 then
                                        task.cancel(u17)
                                        u17 = nil
                                    end
                                    v9 = {amount = 5, key = "NearbyFirearmAnxiety"}
                                    v9.impact = u32
                                    v9.maximum = u32
                                    u84 = ClientAnxietyHandler.addClientAdjustment(v9)
                                    if not u13 then
                                        u13 = true
                                        u18 = task.delay(1.9, function() -- Line: 190 -- upvalues: Signals (upval), Player (upval)
                                            local v10, v2, v3
                                            v3 = {}
                                            v3[1] = "One wrong move, and I'm a dead man."
                                            Signals.Monologue:Fire(v3, "Shake")
                                            Player.Anxiety.post()
                                            return
                                        end)
                                    end
                                    u17 = task.delay(2.2, function() -- Line: 197 -- upvalues: ClientAnxietyHandler (upval), u84 (val)
                                        local v10
                                        ClientAnxietyHandler.removeClientAdjustment(u84)
                                        return
                                    end)
                                    u12 = tick()
                                elseif v7 ~= v7 then
                                    v8 = tick() - u12
                                    if 2 < v8 then
                                        if not (p1:GetAttribute("Aiming")) then end
                                    end
                                end
                                return
                            else
                                return
                            end
                        else
                            return u16:Clean()
                        end
                    elseif not u11 then
                        return
                    end
                else
                    return u16:Clean()
                end
            elseif 0.5 < u10 then
                return u16:Clean()
            end
        else
            return u16:Clean()
        end
    elseif not u11 then
        return u16:Clean()
    end
end)))
        u16:Add(function() -- Line: 207 -- upvalues: u138 (upval), p1 (val)
            u138[p1] = nil
        end)
        u16:Add(function() -- Line: 211 -- upvalues: u18 (ref)
            if u18 then
                task.cancel(u18)
                u18 = nil
            end
        end)
        u138[p1] = u16
        return false
    end,
}