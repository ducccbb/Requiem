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
--File: ReplicatedStorage.Client.Interfaces.Routes.Interactions.Types.Companions.Connect
--                              Dumped in 0.000990 seconds
--                          Bytecode version 9  |  5 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local CollectionService = game:GetService("CollectionService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Interaction = require(Namespaces:WaitForChild("Interaction"))
local function findCompanionAttachedToCart(p1) -- Line: 25 -- upvalues: CollectionService (val)
    local Cart
    for i, j in CollectionService:GetTagged("Companion") do
        Cart = j:FindFirstChild("Cart")
        if Cart and Cart:IsA("ObjectValue") and Cart.Value == p1 then
            return j
        end
    end
    return nil
end
local function companionHasDriver(p1) -- Line: 43
    local Seat = p1:FindFirstChildWhichIsA("Seat", true)
    if not Seat then
        return false
    end
    local v1 = Seat.Occupant ~= nil
    return v1
end
return {
    interacted = function(...) -- Line: 99 -- upvalues: Interaction (val)
        Interaction.Event.unreliablePost(...)
    end,
    display = {
        header = "Connect",
        body = "Press \"%s\" to connect to companion.",
        visible = function(p1) -- Line: 56 -- upvalues: findCompanionAttachedToCart (val), companionHasDriver (val), CollectionService (val)
            local HumanoidRootPart, v1
            local Parent = p1.Parent
            if not Parent or not (Parent:IsA("Model")) then
                return false
            end
            local v2 = findCompanionAttachedToCart(Parent)
            if v2 then
                return not companionHasDriver(v2)
            end
            for i, j in CollectionService:GetTagged("Companion") do
                if not (j:GetAttribute("Carting")) and not (companionHasDriver(j)) then
                    HumanoidRootPart = j:FindFirstChild("HumanoidRootPart")
                    if HumanoidRootPart and (HumanoidRootPart.Position - p1.Position).Magnitude < 10 then
                        v1 = HumanoidRootPart.CFrame.LookVector:Dot(p1.CFrame.LookVector)
                        if 0.8 < v1 then
                            return true
                        end
                    end
                end
            end
            return false
        end,
    },
}