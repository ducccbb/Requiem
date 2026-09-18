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
--           File: ReplicatedStorage.Common.Effects.Types.Enchantments.Manhunt
--                              Dumped in 0.000675 seconds
--                          Bytecode version 9  |  6 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Character = require(Utilities:WaitForChild("Character"))
local u31 = {}
local function clearMarkEntry(p1) -- Line: 23 -- upvalues: u31 (val)
    local v1 = u31[p1]
    if not v1 then
        return
    end
    if v1.connection then
        v1.connection:Disconnect()
    end
    if v1.highlight then
        v1.highlight:Destroy()
    end
    u31[p1] = nil
end
local function applyHighlight(p1) -- Line: 40 -- upvalues: u31 (val), Character (val)
    local v1 = u31[p1]
    if not v1 then
        return
    end
    if v1.highlight then
        v1.highlight:Destroy()
        v1.highlight = nil
    end
    local v2 = Character.getCharacter(p1)
    if not v2 then
        return
    end
    local Highlight = Instance.new("Highlight")
    Highlight.Name = "Manhunt"
    Highlight.FillTransparency = 1
    Highlight.OutlineColor = Color3.fromRGB(255, 45, 45)
    Highlight.OutlineTransparency = 0
    Highlight.DepthMode = Enum.HighlightDepthMode.Occluded
    Highlight.Adornee = v2
    Highlight.Parent = v2
    v1.highlight = Highlight
end
local function setMarked(p1, p2) -- Line: 67 -- upvalues: clearMarkEntry (val), u31 (val), applyHighlight (val)
    if not p2 then
        clearMarkEntry(p1)
        return
    end
    if u31[p1] then
        applyHighlight(p1)
        return
    end
    local v1 = p1.CharacterAdded:Connect(function() -- Line: 78 -- upvalues: applyHighlight (upval), p1 (val)
        applyHighlight(p1)
    end)
    u31[p1] = {connection = v1}
    applyHighlight(p1)
end
return function(p1, p2) -- Line: 92 -- upvalues: setMarked (val)
    if typeof(p1) ~= "Instance" or not (p1:IsA("Player")) then
        return
    end
    setMarked(p1, p2)
end