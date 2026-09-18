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
--        File: ReplicatedStorage.Common.Effects.Types.Miscellaneous.VelocityTest
--                               Dumped in 0.00105 seconds
--                          Bytecode version 9  |  2 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local u29 = require(Common:WaitForChild("Logger"))("Velocity Test")
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_2:WaitForChild("Client")
local User = Client:WaitForChild("User")
local Equipment = User:WaitForChild("Equipment")
local Gear_2 = Equipment:WaitForChild("Gear")
local ClientGearHandler = require(Gear_2:WaitForChild("ClientGearHandler"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Signals = require(Common_2:WaitForChild("Signals"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_4:WaitForChild("Client")
local Progression = Client_2:WaitForChild("Progression")
local ClientAttributesHandler = require(Progression:WaitForChild("ClientAttributesHandler"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_5:WaitForChild("Client")
local User_2 = Client_3:WaitForChild("User")
local Equipment_2 = User_2:WaitForChild("Equipment")
local Gear_3 = Equipment_2:WaitForChild("Gear")
local Components = Gear_3:WaitForChild("Components")
local Ejector = Components:WaitForChild("Ejector")
local Default = require(Ejector:WaitForChild("Default"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_6:WaitForChild("Common")
local Utilities = Common_3:WaitForChild("Utilities")
local Tinkers = require(Utilities:WaitForChild("Tinkers"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_7:WaitForChild("Common")
local Utilities_2 = Common_4:WaitForChild("Utilities")
local Gear = require(Utilities_2:WaitForChild("Gear"))
return function(p1, p2, p3, p4) -- Line: 30 -- upvalues: ClientGearHandler (val), Signals (val), Gear (val), ClientAttributesHandler (val), Default (val), Tinkers (val), u29 (val)
    local v1 = ClientGearHandler.getGearState()
    if not v1 then
        return Signals.Toast:Fire({message = "You must have gear equipped to run this command.", type = "error"})
    end
    local v2 = Gear.getComponentLevel(v1, "Ejector")
    local GearSwiftnessMultiplier = ClientAttributesHandler.getAttribute("GearSwiftnessMultiplier")
    local GearMaxVelocityMultiplier = ClientAttributesHandler.getAttribute("GearMaxVelocityMultiplier")
    local v3 = Default.Constants.BASE_SPEED * Default.Constants.BASE_SPEED_MULTIPLIER
    local v4 = (Default.Constants.BASE_SPEED_MULTIPLIER + Default.Constants.BASE_GAS_BOOST) * Default.Constants.BASE_GAS_BOOST
    local v5 = Tinkers.getModifierConfig("Velocity Gain Power")
    local v6 = Gear.getTinkerModifierMultiplier(v1, "Velocity Gain Power", v5, v2)
    local v7 = v6 * Default.Constants.MAXIMUM_VELOCITY_MULTIPLIER * 1
    local v8 = v6 * Default.Constants.MAXIMUM_VELOCITY_MULTIPLIER * GearMaxVelocityMultiplier
    local v9 = math.clamp(8 / p1, 0, 1) * p2 + 1
    local v10 = math.clamp(8 / p3, 0, 1) * p4
    local v11 = v6 * Default.Constants.MAXIMUM_VELOCITY_MULTIPLIER * (v10 + 1)
    local v12 = math.round(GearSwiftnessMultiplier * 100) / 100
    v12 = math.round(GearMaxVelocityMultiplier * 100) / 100
    v12 = math.round(v9 * 100) / 100
    local v13 = ((((((((((((((("Running Velocity Test" .. "\n\nBASE SPEEDS (No Bonuses)") .. "\n\tBase Gear without gas: " .. math.round(v3)) .. "\n\tBase Gear with gas: " .. math.round(v4)) .. "\n\tBase Gear with gas at maximum velocity: " .. math.round(v4 * v7)) .. "\n\nYOUR CURRENT SPEEDS (With Your Bonuses)") .. "\n\tYour Swiftness Multiplier: " .. v12 .. "x [" .. math.round(GearSwiftnessMultiplier * 100) .. "%]") .. "\n\tYour Max Velocity Multiplier: " .. v12 .. "x [" .. math.round(GearMaxVelocityMultiplier * 100) .. "%]") .. "\n\tGear without Gas: " .. math.round(GearSwiftnessMultiplier * v3)) .. "\n\tGear with Gas: " .. math.round(GearSwiftnessMultiplier * v4)) .. "\n\tGear with Gas at Maximum Velocity: " .. math.round(GearSwiftnessMultiplier * (v4 * v8))) .. "\n\nTHEORETICAL CELERITY LEVEL 8") .. "\n\tSwiftness Multiplier: " .. v12 .. "x [" .. math.round(v9 * 100) .. "%]") .. "\n\tMax Velocity Bonus: +" .. math.round(v10 * 100) / 100) .. "\n\tGear without Gas: " .. math.round(v9 * v3)) .. "\n\tGear with Gas: " .. math.round(v9 * v4)) .. "\n\tGear with Gas at Maximum Velocity: " .. math.round(v9 * (v4 * v11))
    local v14 = Tinkers.getModifierConfig("Gas Speed")
    local v15 = Gear.getTinkerModifierMultiplier(v1, "Gas Speed", v14, v2)
    v12 = Tinkers.getModifierConfig("Base Speed")
    local v16 = Gear.getTinkerModifierMultiplier(v1, "Base Speed", v12, v2)
    local v17 = Default.Constants.BASE_SPEED * Default.Constants.BASE_SPEED_MULTIPLIER * v16
    local v18 = (Default.Constants.BASE_SPEED_MULTIPLIER * v16 + Default.Constants.BASE_GAS_BOOST * v15) * Default.Constants.BASE_GAS_BOOST
    v13 = (((((((((((v13 .. "\n\nUPGRADED GEAR SPEEDS (No Bonuses)") .. "\n\tUpgraded Gear without Gas: " .. math.round(v17)) .. "\n\tUpgraded Gear with Gas: " .. math.round(v18)) .. "\n\tUpgraded Gear with Gas at Maximum Velocity: " .. math.round(v18 * v7)) .. "\n\nYOUR UPGRADED GEAR (With Your Bonuses)") .. "\n\tGear without Gas: " .. math.round(GearSwiftnessMultiplier * v17)) .. "\n\tGear with Gas: " .. math.round(GearSwiftnessMultiplier * v18)) .. "\n\tGear with Gas at Maximum Velocity: " .. math.round(GearSwiftnessMultiplier * (v18 * v8))) .. "\n\nTHEORETICAL UPGRADED GEAR + CELERITY LEVEL 8") .. "\n\tGear without Gas: " .. math.round(v9 * v17)) .. "\n\tGear with Gas: " .. math.round(v9 * v18)) .. "\n\tGear with Gas at Maximum Velocity: " .. math.round(v9 * (v18 * v11))
    u29.debug(v13)
end