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
--             File: ReplicatedStorage.Client.World.Building.WindowLighting
--                              Dumped in 0.000956 seconds
--                          Bytecode version 9  |  9 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local CollectionService = game:GetService("CollectionService")
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")
local User = script.Parent.Parent.Parent:WaitForChild("User")
local State = User:WaitForChild("State")
local ClientSettingsHandler = require(State:WaitForChild("ClientSettingsHandler"))
local u44 = {}
local v2 = Color3.fromRGB(241, 196, 153)
local v3 = Color3.fromRGB(248, 200, 160)
u44[1] = v2
u44[2] = v3
u44[3] = Color3.fromRGB(255, 211, 162)
local Neon = Enum.Material.Neon
local u61 = {}
local u62 = {}
local u63 = false
local function getHouseLightsOverride() -- Line: 48 -- upvalues: Workspace (val)
    return Workspace:GetAttribute("OverRideHouseLights")
end
local function isNight(p1) -- Line: 57
    local v1 = if p1 >= 7 then 19 < p1 else true
    return v1
end
local function cleanUpWindowLighting(p1) -- Line: 63 -- upvalues: u61 (val), u62 (val)
    if not (p1:IsA("BasePart")) then
        return
    end
    local v1 = u61[p1]
    if v1 then
        p1.Material = v1.Material
        p1.Transparency = v1.Transparency
        p1.Color = v1.Color
        u61[p1] = nil
    end
    local v2 = u62[p1]
    if v2 then
        v2:Destroy()
        u62[p1] = nil
    end
end
local function applyWindowLighting(p1, p2) -- Line: 86 -- upvalues: u44 (val), u61 (val), Neon (val), u62 (val)
    if not (p1:IsA("BasePart")) or 0.2 < math.random() then
        return
    end
    local v1 = u44[math.random(1, #u44)]
    u61[p1] = {Material = p1.Material, Transparency = p1.Transparency, Color = p1.Color}
    p1.Material = Neon
    p1.Transparency = 0.2
    p1.Color = v1
    local PointLight = Instance.new("PointLight")
    PointLight.Range = 60
    PointLight.Brightness = 0.1
    PointLight.Color = v1
    PointLight.Parent = p1
    PointLight:AddTag("Window Light")
    PointLight.Enabled = not p2
    u62[p1] = PointLight
end
local function refreshAllWindows() -- Line: 144 -- upvalues: CollectionService (val), getHouseLightsOverride (val), cleanUpWindowLighting (val), u63 (ref), ClientSettingsHandler (val), applyWindowLighting (val)
    local v1, v2, v3, v4
    local Tagged = CollectionService:GetTagged("Window")
    local v5 = getHouseLightsOverride()
    if v5 == false then
        v1 = Tagged
        v2 = nil
        v3 = nil
        for m, i5 in v1, v2, v3 do
            cleanUpWindowLighting(i5)
        end
        return
    end
    v1 = if v5 ~= true then u63 else true
    if not v1 then
        v2 = Tagged
        v3 = nil
        v4 = nil
        for k, n in v2, v3, v4 do
            cleanUpWindowLighting(n)
        end
        return
    end
    v2 = ClientSettingsHandler.getSettingFromName("Light Sources") == true
    v3 = Tagged
    v4 = nil
    local v6 = nil
    for i, j in v3, v4, v6 do
        cleanUpWindowLighting(j)
        applyWindowLighting(j, v2)
    end
end
local InstanceAddedSignal = CollectionService:GetInstanceAddedSignal("Window")
InstanceAddedSignal:Connect(function(p1) -- Line: 123 -- upvalues: getHouseLightsOverride (val), u63 (ref), cleanUpWindowLighting (val), applyWindowLighting (val), ClientSettingsHandler (val)
    local v1
    if not (p1:IsA("BasePart")) then
        return
    end
    local v2 = getHouseLightsOverride()
    if v2 == false then
        return
    end
    if v2 == true then
        cleanUpWindowLighting(p1)
        v1 = ClientSettingsHandler.getSettingFromName("Light Sources") == true
        applyWindowLighting(p1, v1)
        return
    end
    if not u63 then
        return
    end
    cleanUpWindowLighting(p1)
    v1 = ClientSettingsHandler.getSettingFromName("Light Sources") == true
    applyWindowLighting(p1, v1)
end)
local InstanceRemovedSignal = CollectionService:GetInstanceRemovedSignal("Window")
InstanceRemovedSignal:Connect(cleanUpWindowLighting)
local AttributeChangedSignal = Workspace:GetAttributeChangedSignal("OverRideHouseLights")
AttributeChangedSignal:Connect(function() -- Line: 189 -- upvalues: refreshAllWindows (val)
    refreshAllWindows()
end)
u63 = isNight(Lighting.ClockTime)
if u63 then
    refreshAllWindows()
end
local PropertyChangedSignal = Lighting:GetPropertyChangedSignal("ClockTime")
PropertyChangedSignal:Connect(function() -- Line: 172 -- upvalues: isNight (val), Lighting (val), u63 (ref), getHouseLightsOverride (val), refreshAllWindows (val)
    local v1 = isNight(Lighting.ClockTime)
    if v1 == u63 then
        return
    end
    u63 = v1
    if getHouseLightsOverride() == nil then
        refreshAllWindows()
    end
end)
return {}