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
--            File: ReplicatedStorage.Client.User.State.ClientSettingsHandler
--                               Dumped in 0.00249 seconds
--                          Bytecode version 9  |  38 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local CollectionService = game:GetService("CollectionService")
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Types = Common:WaitForChild("Types")
local Settings = require(Types:WaitForChild("Settings"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Network = require(Common_2:WaitForChild("Network"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Network_2 = Common_3:WaitForChild("Network")
local Namespaces = Network_2:WaitForChild("Namespaces")
local Settings_2 = require(Namespaces:WaitForChild("Settings"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_4:WaitForChild("Common")
local Network_3 = Common_4:WaitForChild("Network")
local Namespaces_2 = Network_3:WaitForChild("Namespaces")
local Player = require(Namespaces_2:WaitForChild("Player"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_5:WaitForChild("Common")
local Utilities = Common_5:WaitForChild("Utilities")
local Signal = require(Utilities:WaitForChild("Signal"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_6:WaitForChild("Common")
local Signals = require(Common_6:WaitForChild("Signals"))
local Progression = script.Parent.Parent.Parent:WaitForChild("Progression")
local ClientAttributesHandler = require(Progression:WaitForChild("ClientAttributesHandler"))
local u159 = {}
local u160 = {}
local u161 = {}
local u162 = {}
local u163 = false
local u164 = false
local u165 = false
local function getProperTypeOfSetting(p1, p2) -- Line: 42
    if p1 == "Keybind" then
        for k, v in pairs(Enum.KeyCode:GetEnumItems()) do
            if v.Value == p2 then
                return v
            end
        end
        return p2
    end
    if p1 == "Slider" then
        return (tonumber(p2))
    end
    if p1 == "Boolean" then
        local v1 = p2 == 1
        return v1
    end
    if p1 == "Number" then
        return (tonumber(p2))
    end
    return p2
end
local function findNameOfSettingFromUnique(p1) -- Line: 60 -- upvalues: Settings (val)
    local v1 = p1
    for k, v in pairs(Settings.Settings) do
        for k2, i in pairs(v) do
            for k3, j in pairs(i) do
                if j.Unique == v1 then
                    return j.Name, j
                end
            end
        end
    end
    return "Unknown", nil
end
local function getSettingFromName(p1) -- Line: 104 -- upvalues: u159 (val)
    return u159[p1]
end
local function updateSetting(p1, p2) -- Line: 108 -- upvalues: findNameOfSettingFromUnique (val), getProperTypeOfSetting (val), u159 (val), u160 (val), Signals (val)
    local v1, v2
    v1, v2 = findNameOfSettingFromUnique(p1.unique)
    if not v2 then
        return
    end
    local Metadata = v2.Metadata
    if Metadata then
        Metadata = v2.Metadata.Type
    end
    local v3 = getProperTypeOfSetting(Metadata, p1.value)
    u159[v1] = v3
    if typeof(v3) == "EnumItem" and v2.Metadata and v2.Metadata.Type == "Keybind" then
        u160[v1] = v3
    end
    if p2 then
        return
    end
    Signals.SettingsChanged:Fire(v1, u159[v1], p1)
end
local function observeClientSettingsChanged(p1, p2) -- Line: 128 -- upvalues: updateSetting (val)
    local v1
    for k, v in pairs(p1) do
        v1 = p2[v.unique]
        if v1 and v.value ~= v1.value then
            updateSetting(v)
        end
    end
end
local function loadClientSettings(p1) -- Line: 139 -- upvalues: updateSetting (val), UserInputService (val), Player (val), Players (val), u160 (val), u162 (val), u161 (val)
    for k, v in pairs(p1) do
        updateSetting(v, true)
    end
    UserInputService.InputBegan:Connect(function(p1, p2) -- Line: 144 -- upvalues: Player (upval), Players (upval), u160 (upval), u162 (upval)
        if p2 then
            return
        end
        local client = Player.Store.get(Players.LocalPlayer).client
        if not client then
            warn("No client state found")
        end
        if client.status == 3 then
            return
        end
        for k, v in pairs(u160) do
            if p1.KeyCode == v and u162[k] then
                u162[k]:Fire()
            end
        end
    end)
    UserInputService.InputEnded:Connect(function(p1, p2) -- Line: 166 -- upvalues: Player (upval), Players (upval), u160 (upval), u161 (upval)
        if p2 or Player.Store.get(Players.LocalPlayer).client.status == 3 then
            return
        end
        for k, v in pairs(u160) do
            if p1.KeyCode == v and u161[k] then
                u161[k]:Fire()
            end
        end
    end)
end
local function onHandleMusicVolume() -- Line: 185 -- upvalues: u164 (ref), getSettingFromName (val), Signals (val), TweenService (val), CollectionService (val)
    local AttributeChangedSignal, AttributeChangedSignal_2
    if u164 or not (getSettingFromName("Music Volume")) then
        return
    end
    u164 = true
    Signals.OnSettingsLoaded:Fire()
    local u10 = {}
    local function getEffectiveMusicVolume(p1) -- Line: 205 -- upvalues: getSettingFromName (upval)
        local v1
        local v2 = getSettingFromName("Music Volume")
        if not v2 or typeof(v2) ~= "number" then
            return nil
        end
        local Attribute = p1:GetAttribute("Volume")
        if typeof(Attribute) ~= "number" then
            v1 = 1
        elseif 0 > Attribute then
            v1 = 1
        else
            v1 = Attribute
            if not v1 then
                v1 = 1
            end
        end
        return v1 * v2
    end
    local function onUpdateMusicVolume(p1, p2) -- Line: 218 -- upvalues: getEffectiveMusicVolume (val), u10 (val), TweenService (upval)
        local v1
        local v2 = getEffectiveMusicVolume(p1)
        if v2 == nil then
            return
        end
        local Attribute = p1:GetAttribute("FadeState")
        local v3 = p2
        if not v3 then
            if typeof(Attribute) ~= "string" then
                v3 = "Playing"
            else
                v3 = Attribute
            end
        end
        local v4 = v3
        if u10[p1] then
            u10[p1]:Cancel()
            u10[p1] = nil
        end
        if v4 == "FadingIn" then
            p1.Volume = 0
            v1 = TweenInfo.new(2)
            v3 = TweenService:Create(p1, v1, {Volume = v2})
            u10[p1] = v3
            v3:Play()
            v3.Completed:Connect(function() -- Line: 242 -- upvalues: u10 (upval), p1 (val)
                u10[p1] = nil
            end)
            return
        end
        if v4 == "FadingOut" then
            v1 = TweenInfo.new(2)
            v3 = TweenService:Create(p1, v1, {Volume = 0})
            u10[p1] = v3
            v3:Play()
            v3.Completed:Connect(function() -- Line: 253 -- upvalues: u10 (upval), p1 (val)
                u10[p1] = nil
            end)
            return
        end
        if v4 ~= "Playing" then
            if v4 == "Stopped" then
                p1.Volume = 0
            end
            return
        end
        v1 = TweenInfo.new(3)
        v3 = TweenService:Create(p1, v1, {Volume = v2})
        u10[p1] = v3
        v3:Play()
        v3.Completed:Connect(function() -- Line: 263 -- upvalues: u10 (upval), p1 (val)
            u10[p1] = nil
        end)
    end
    local function onMassUpdateMusicVolume() -- Line: 272 -- upvalues: CollectionService (upval), onUpdateMusicVolume (val)
        for i, j in CollectionService:GetTagged("WorldMusicSoundEffect") do
            onUpdateMusicVolume(j)
        end
    end
    local InstanceAddedSignal = CollectionService:GetInstanceAddedSignal("WorldMusicSoundEffect")
    InstanceAddedSignal:Connect(function(p1) -- Line: 280 -- upvalues: onUpdateMusicVolume (val)
        onUpdateMusicVolume(p1)
        local AttributeChangedSignal = p1:GetAttributeChangedSignal("FadeState")
        AttributeChangedSignal:Connect(function() -- Line: 284 -- upvalues: p1 (val), onUpdateMusicVolume (upval)
            local v1
            local Attribute = p1:GetAttribute("FadeState")
            if typeof(Attribute) ~= "string" then
                v1 = nil
            else
                v1 = Attribute
            end
            onUpdateMusicVolume(p1, v1)
        end)
        local AttributeChangedSignal_2 = p1:GetAttributeChangedSignal("Volume")
        AttributeChangedSignal_2:Connect(function() -- Line: 290 -- upvalues: onUpdateMusicVolume (upval), p1 (val)
            onUpdateMusicVolume(p1)
        end)
    end)
    onMassUpdateMusicVolume()
    for i, j in CollectionService:GetTagged("WorldMusicSoundEffect") do
        AttributeChangedSignal = j:GetAttributeChangedSignal("FadeState")
        AttributeChangedSignal:Connect(function() -- Line: 299 -- upvalues: j (val), onUpdateMusicVolume (val)
            local v1
            local Attribute = j:GetAttribute("FadeState")
            if typeof(Attribute) ~= "string" then
                v1 = nil
            else
                v1 = Attribute
            end
            onUpdateMusicVolume(j, v1)
        end)
        AttributeChangedSignal_2 = j:GetAttributeChangedSignal("Volume")
        AttributeChangedSignal_2:Connect(function() -- Line: 304 -- upvalues: onUpdateMusicVolume (val), j (val)
            onUpdateMusicVolume(j)
        end)
    end
    Signals.SettingsChanged:Connect(function(p1) -- Line: 310 -- upvalues: onMassUpdateMusicVolume (val)
        if p1 ~= "Music Volume" then
            return
        end
        onMassUpdateMusicVolume()
    end)
end
local function onHandleAmbienceVolume() -- Line: 319 -- upvalues: u165 (ref), getSettingFromName (val), ClientAttributesHandler (val), CollectionService (val), Signals (val)
    local AttributeChangedSignal
    if u165 or not (getSettingFromName("Ambience Volume")) then
        return
    end
    u165 = true
    local function getEffectiveAmbienceVolume(p1) -- Line: 333 -- upvalues: getSettingFromName (upval)
        local v1
        local v2 = getSettingFromName("Ambience Volume")
        if not v2 or typeof(v2) ~= "number" then
            return nil
        end
        local Attribute = p1:GetAttribute("BaseVolume")
        if typeof(Attribute) ~= "number" then
            v1 = 1
        elseif 0 > Attribute then
            v1 = 1
        else
            v1 = Attribute
            if not v1 then
                v1 = 1
            end
        end
        return v1 * v2
    end
    local function onUpdateAmbienceVolume(p1) -- Line: 345 -- upvalues: getEffectiveAmbienceVolume (val), ClientAttributesHandler (upval)
        local v1
        local v2 = getEffectiveAmbienceVolume(p1)
        if v2 == nil then
            return
        end
        local CanHearAmbience = ClientAttributesHandler.getAttribute("CanHearAmbience")
        if typeof(CanHearAmbience) ~= "number" then
            v1 = 0
        elseif 0 >= CanHearAmbience then
            v1 = 0
        else
            v1 = 1
        end
        p1.Volume = v2 * v1
    end
    local function onMassUpdateAmbienceVolume() -- Line: 356 -- upvalues: CollectionService (upval), onUpdateAmbienceVolume (val)
        for i, j in CollectionService:GetTagged("WorldAmbienceSoundEffect") do
            onUpdateAmbienceVolume(j)
        end
    end
    local InstanceAddedSignal = CollectionService:GetInstanceAddedSignal("WorldAmbienceSoundEffect")
    InstanceAddedSignal:Connect(function(p1) -- Line: 362 -- upvalues: onUpdateAmbienceVolume (val)
        onUpdateAmbienceVolume(p1)
        local AttributeChangedSignal = p1:GetAttributeChangedSignal("BaseVolume")
        AttributeChangedSignal:Connect(function() -- Line: 365 -- upvalues: onUpdateAmbienceVolume (upval), p1 (val)
            onUpdateAmbienceVolume(p1)
        end)
    end)
    onMassUpdateAmbienceVolume()
    for i, j in CollectionService:GetTagged("WorldAmbienceSoundEffect") do
        AttributeChangedSignal = j:GetAttributeChangedSignal("BaseVolume")
        AttributeChangedSignal:Connect(function() -- Line: 373 -- upvalues: onUpdateAmbienceVolume (val), j (val)
            onUpdateAmbienceVolume(j)
        end)
    end
    Signals.SettingsChanged:Connect(function(p1) -- Line: 378 -- upvalues: onMassUpdateAmbienceVolume (val)
        if p1 ~= "Ambience Volume" then
            return
        end
        onMassUpdateAmbienceVolume()
    end)
    ClientAttributesHandler.onAttributeChanged("CanHearAmbience"):Connect(function() -- Line: 386 -- upvalues: onMassUpdateAmbienceVolume (val)
        onMassUpdateAmbienceVolume()
    end)
end
Network.loaded:andThen(function() -- Line: 391 -- upvalues: Settings_2 (val), Players (val), loadClientSettings (val), u163 (ref), onHandleMusicVolume (val), onHandleAmbienceVolume (val), observeClientSettingsChanged (val), updateSetting (val)
    local u5 = Settings_2.Store.get(Players.LocalPlayer)
    local u6 = u5
    if u5 then
        loadClientSettings(u5)
        u163 = true
        onHandleMusicVolume()
        onHandleAmbienceVolume()
    end
    Settings_2.Store.observe(Players.LocalPlayer, function() -- Line: 409 -- upvalues: u5 (ref), Settings_2 (upval), Players (upval), observeClientSettingsChanged (upval), u6 (ref), u163 (upval), onHandleMusicVolume (upval), onHandleAmbienceVolume (upval)
        u5 = Settings_2.Store.get(Players.LocalPlayer)
        observeClientSettingsChanged(u5, u6)
        u6 = u5
        u163 = true
        onHandleMusicVolume()
        onHandleAmbienceVolume()
    end)
    Settings_2.Replicate.listen(function(p1) -- Line: 424 -- upvalues: updateSetting (upval), u163 (upval), onHandleMusicVolume (upval), onHandleAmbienceVolume (upval)
        updateSetting(p1)
        u163 = true
        onHandleMusicVolume()
        onHandleAmbienceVolume()
    end)
end)
return {
    getSettingFromName = getSettingFromName,
    onSettingChanged = Signals.SettingsChanged,
    isSettingsLoaded = function() -- Line: 442 -- upvalues: u163 (ref)
        return u163
    end,
    onKeybindPressed = function(p1) -- Line: 86 -- upvalues: u162 (val), Signal (val)
        if not (u162[p1]) then
            u162[p1] = Signal.new()
        end
        return u162[p1]
    end,
    onKeybindReleased = function(p1) -- Line: 94 -- upvalues: u161 (val), Signal (val)
        if not (u161[p1]) then
            u161[p1] = Signal.new()
        end
        return u161[p1]
    end,
    isKeyPressed = function(p1) -- Line: 77 -- upvalues: u160 (val), UserInputService (val)
        local v1 = u160[p1]
        if not v1 then
            return false
        end
        return UserInputService:IsKeyDown(v1)
    end,
}