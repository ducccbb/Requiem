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
--                        File: ReplicatedStorage.Common.Signals
--                              Dumped in 0.000249 seconds
--                          Bytecode version 9  |  1 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Utilities = script.Parent:WaitForChild("Utilities")
local Signal = require(Utilities:WaitForChild("Signal"))
return {
    PlayerGrappledClient = Signal.new(),
    PlayerDashBoosted = Signal.new(),
    SettingsChanged = Signal.new(),
    OnSettingsLoaded = Signal.new(),
    ActivateEnchantment = Signal.new(),
    ActivateProficiency = Signal.new(),
    Bars = Signal.new(),
    Captions = Signal.new(),
    Monologue = Signal.new(),
    Objective = Signal.new(),
    Indicator = Signal.new(),
    Damage = Signal.new(),
    Calculator = Signal.new(),
    Console = Signal.new(),
    Toast = Signal.new(),
    Notify = Signal.new(),
    Eyecatcher = Signal.new(),
    Flashback = Signal.new(),
    Limping = Signal.new(),
    Anxiety = Signal.new(),
    OnAnxietyChanged = Signal.new(),
    OnHealthChanged = Signal.new(),
    Deadzone = Signal.new(),
    Bullet = Signal.new(),
    Arrow = Signal.new(),
    Buff = Signal.new(),
    Emote = Signal.new(),
    ProficiencyCooldownAdjusted = Signal.new(),
    EnchantmentCooldownAdjusted = Signal.new(),
    OnGearExploded = Signal.new(),
    OnGasDepleted = Signal.new(),
    GasReservesRefilled = Signal.new(),
    Editor = {
        Building = {
            OnEnabledUpdated = Signal.new(),
            UpdateEnabled = Signal.new(),
            OnSandboxModeUpdated = Signal.new(),
            UpdateSandboxMode = Signal.new(),
            OnSelectionUpdated = Signal.new(),
            UpdateSelection = Signal.new(),
            OnZoneInformationUpdated = Signal.new(),
            UpdateZoneInformation = Signal.new(),
            UpdateZonePermissionPage = Signal.new(),
            OnToolUpdated = Signal.new(),
            UpdateTool = Signal.new(),
            OnTreasuryUpdated = Signal.new(),
            Place = Signal.new(),
        },
    },
    GiveMarcs = Signal.new(),
}