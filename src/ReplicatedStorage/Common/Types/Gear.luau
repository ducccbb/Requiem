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
--                       File: ReplicatedStorage.Common.Types.Gear
--                              Dumped in 0.000912 seconds
--                          Bytecode version 9  |  11 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local Network = v1.Parent.Parent:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Gear = require(Namespaces:WaitForChild("Gear"))
local Utilities = v1.Parent.Parent:WaitForChild("Utilities")
local Signal = require(Utilities:WaitForChild("Signal"))
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
require(Packages:WaitForChild("trove"))
local v3 = require(v1.Parent.Parent:WaitForChild("Config")).define({MAX_GAS = 800})
local Animations = v1.Parent.Parent:WaitForChild("Animations")
require(Animations:WaitForChild("Gear"))
local v4 = {
    handles = Signal.new(),
    grapple = Signal.new(),
    goal = Signal.new(),
    stepped = Signal.new(),
    boosting = Signal.new(),
    impulse = Signal.new(),
    ungrapple = Signal.new(),
    force_grapple = Signal.new(),
    setBladeExpansion = Signal.new(),
    onDropBlades = Signal.new(),
    enabled = Signal.new(),
    cycle = Signal.new(),
    stance = Signal.new(),
    clearVelocity = Signal.new(),
    clearMomentum = Signal.new(),
    beginSimulatedMomentum = Signal.new(),
    setMaxVelocityGain = Signal.new(),
    simulateBladeSwing = Signal.new(),
    cancelBladeSwing = Signal.new(),
}
local u119 = {
    {
        box = "Default_old",
        handle = "Default_old2",
        modelBoxes = "ODMBoxes",
        segmentedBlades = true,
        holsterC0 = {Right = CFrame.new(1, -0.750029087, -0.249969482, 1, -0, 0, 0, -0.866025448, 0.500000119, 0, -0.50000006, -0.866025448), Left = CFrame.new(-1, -0.850031376, -0.25, 1, -0, 0, 0, -0.766044438, 0.642787576, 0, -0.642787576, -0.766044438)},
        swingTrailPositions = {
            Vector3.new(0, 0, 3.2),
            Vector3.new(0, 0, 2.6),
            Vector3.new(0, 0, 1.8),
            Vector3.new(0, 0, 1.2),
            Vector3.new(0, 0, 0.5),
        },
    },
}
local v5 = {
    box = "Default",
    handle = "Default",
    modelBoxes = "Stock",
    segmentedBlades = false,
    holsterC0 = {Right = CFrame.new(1, -0.350029087, -0.249969482, 1, -0, 0, 0, -0.866025448, 0.500000119, 0, -0.50000006, -0.866025448), Left = CFrame.new(-1, -0.450031376, -0.25, 1, -0, 0, 0, -0.766044438, 0.642787576, 0, -0.642787576, -0.766044438)},
}
local v6 = {}
v6[5] = Vector3.new(0, 0, 2)
v6[4] = Vector3.new(0, 0, 1.8)
v6[3] = Vector3.new(0, 0, 1.4)
v6[2] = Vector3.new(0, 0, 0.6)
v6[1] = Vector3.new(0, 0, 0.2)
v5.swingTrailPositions = v6
u119[2] = v5
local function resolveGeneration(p1) -- Line: 255 -- upvalues: u119 (val)
    local v1 = u119[p1]
    if not v1 then
        v1 = u119[1]
    end
    return v1
end
local function normalizeGeneration(p1) -- Line: 259
    if typeof(p1) ~= "number" then
        return 1
    end
    if 1 <= p1 then
        return (math.floor(p1))
    end
    return 1
end
return {
    Components = {
        BLADES = "Blades",
        CANISTERS = "Canisters",
        EJECTOR = "Ejector",
        GRAPPLES = "Grapples",
        GYROSCOPE = "Gyroscope",
        HANDLES = "Handles",
        HOLSTERS = "Holsters",
        HOUSING = "Housing",
        SPOOLING = "Spooling",
        TURBINE = "Turbine",
        WINCHES = "Winches",
    },
    Types = {Default = "Default"},
    Signals = v4,
    Constants = v3,
    Generation = {
        DEFAULT = 1,
        resolve = resolveGeneration,
        normalize = normalizeGeneration,
        getPlayerGeneration = function(p1, p2) -- Line: 267 -- upvalues: Gear (val), normalizeGeneration (val)
            local generation
            local v1 = Gear.Gear.get(p1)
            if not v1 then
                return normalizeGeneration(p2)
            end
            if typeof(v1.get) ~= "function" then
                generation = v1.generation
            else
                generation = v1.get("generation")
            end
            if generation ~= nil then
                return normalizeGeneration(generation)
            end
            return normalizeGeneration(p2)
        end,
        getBoxAssetName = function(p1) -- Line: 289 -- upvalues: resolveGeneration (val)
            return resolveGeneration(p1).box
        end,
        getHandleAssetName = function(p1) -- Line: 293 -- upvalues: resolveGeneration (val)
            return resolveGeneration(p1).handle
        end,
        getModelBoxesName = function(p1) -- Line: 297 -- upvalues: resolveGeneration (val)
            return resolveGeneration(p1).modelBoxes
        end,
        usesSegmentedBlades = function(p1) -- Line: 301 -- upvalues: resolveGeneration (val)
            return resolveGeneration(p1).segmentedBlades
        end,
        getHolsterC0 = function(p1, p2) -- Line: 305 -- upvalues: resolveGeneration (val)
            local v1 = resolveGeneration(p2)
            local Right = v1.holsterC0[p1]
            if not Right then
                Right = v1.holsterC0.Right
            end
            return Right
        end,
        getSwingTrailPositions = function(p1) -- Line: 310 -- upvalues: resolveGeneration (val)
            return resolveGeneration(p1).swingTrailPositions
        end,
        getSwingTrailSegment = function(p1, p2) -- Line: 314 -- upvalues: resolveGeneration (val)
            if not p1 then
                return nil
            end
            if resolveGeneration(p2).segmentedBlades then
                return (p1:FindFirstChild("5"))
            end
            return p1:FindFirstChildWhichIsA("BasePart")
        end,
    },
}