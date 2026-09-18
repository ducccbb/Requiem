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
--              File: ReplicatedStorage.Common.Effects.Types.Universal.ESP
--                              Dumped in 0.000995 seconds
--                          Bytecode version 9  |  9 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Assets = game:GetService("ReplicatedStorage"):FindFirstChild("Assets")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Alive = require(Common:WaitForChild("Alive"))
local u36 = {}
u36[0] = "<font color=\"rgb(200,200,200)\">CIV</font>"
u36[1] = "<font color=\"rgb(66,120,245)\">SL</font>"
u36[2] = "<font color=\"rgb(9,125,47)\">MP</font>"
u36[3] = "<font color=\"rgb(166,17,31)\">SG</font>"
u36[4] = "<font color=\"rgb(125,68,35)\">TC</font>"
u36[6] = "<font color=\"rgb(107,50,124)\">GOV</font>"
local u44 = {}
local u45 = nil
local u46 = nil
local u47 = {}
local u48 = {}
local function updateESPText(p1, p2, p3) -- Line: 36 -- upvalues: u36 (val)
    local Data = p1.Frame:FindFirstChild("Data")
    if not Data or not Data.Parent then
        return
    end
    local v1 = tonumber(p2:GetAttribute("Health") or 100)
    local v2 = tonumber(p2:GetAttribute("MaxHealth") or 100)
    local v3 = u36[tonumber(p2:GetAttribute("Branch")) or 0]
    if not v3 then
        v3 = u36[0]
    end
    local v4 = tostring(v1)
    local v5 = v4 .. " / " .. tostring(v2)
    Data.Text = "[" .. v3 .. "]" .. " " .. p3 .. " " .. "(" .. v5 .. ")"
end
local function cleanupPlayerESP(p1) -- Line: 48 -- upvalues: u48 (val), u44 (ref), u47 (val)
    if u48[p1] then
        u48[p1]:Disconnect()
        u48[p1] = nil
    end
    if u44[p1] then
        u44[p1]:Destroy()
        u44[p1] = nil
    end
    if u47[p1] then
        local v1 = u47[p1]
        local v2 = nil
        local v3 = nil
        for i, j in v1, v2, v3 do
            j:Disconnect()
        end
        u47[p1] = nil
    end
end
local function createESP(p1, p2) -- Line: 65 -- upvalues: u47 (val), u48 (val), Alive (val), u44 (ref), Assets (val), updateESPText (val), cleanupPlayerESP (val)
    local AttributeChangedSignal, v1
    if u47[p1] then
        local v2 = u47[p1]
        v1 = nil
        local v3 = nil
        for i, j in v2, v1, v3 do
            j:Disconnect()
        end
        u47[p1] = nil
    end
    if u48[p1] then
        u48[p1]:Disconnect()
        u48[p1] = nil
    end
    local Name = p1.Name
    v1 = p2
    if not v1 then
        v1 = Alive.getAliveCharacter(p1)
    end
    local u42 = v1
    if not u42 or not u42.Parent then
        return
    end
    local Head = u42:FindFirstChild("Head")
    if not Head then
        Head = u42:WaitForChild("Head", 3)
    end
    if not Head then
        return
    end
    local v4 = u44[p1]
    if not v4 then
        v4 = Assets.Particles.UI.ESP:Clone()
        u44[p1] = v4
    elseif v4.Parent then
    end
    updateESPText(v4, p1, Name)
    v4.Parent = Head
    u48[p1] = u42.AncestryChanged:Connect(function() -- Line: 103 -- upvalues: u42 (ref), cleanupPlayerESP (upval), p1 (val)
        if not (u42:IsDescendantOf(workspace)) then
            cleanupPlayerESP(p1)
        end
    end)
    local v5 = {}
    local v6 = {"Health", "MaxHealth", "Branch"}
    local v7 = nil
    local v8 = nil
    for k, n in v6, v7, v8 do
        AttributeChangedSignal = p1:GetAttributeChangedSignal(n)
        table.insert(v5, AttributeChangedSignal:Connect(function() -- Line: 113 -- upvalues: u44 (upval), p1 (val), updateESPText (upval), Name (val)
            local v1 = u44[p1]
            if v1 then
                updateESPText(v1, p1, Name)
            end
        end))
    end
    u47[p1] = v5
end
return function(...) -- Line: 124 -- upvalues: Alive (val), createESP (val), u45 (ref), u46 (ref), cleanupPlayerESP (val), u44 (ref), u47 (val), u48 (val)
    local v1, v2, v3
    if ....state then
        for i6, i7 in Alive.getAllAliveCharacters() do
            v1 = Alive.getPlayerFromCharacter(i7)
            if v1 then
                createESP(v1, i7)
            end
        end
        u45 = Alive.CharacterAdded:Connect(function(p1) -- Line: 140 -- upvalues: Alive (upval), createESP (upval)
            local v1 = Alive.getPlayerFromCharacter(p1)
            if v1 then
                createESP(v1, p1)
            end
        end)
        u46 = Alive.PlayerRemoving:Connect(function(p1) -- Line: 147 -- upvalues: cleanupPlayerESP (upval)
            cleanupPlayerESP(p1)
        end)
        return
    end
    for k, v in pairs(u44) do
        v:Destroy()
    end
    u44 = {}
    local v4 = u47
    local v5 = nil
    local v6 = nil
    for i, j in v4, v5, v6 do
        if j then
            v1 = j
            v2 = nil
            v3 = nil
            for k2, n in v1, v2, v3 do
                n:Disconnect()
            end
            u47[i] = nil
        end
    end
    v4 = u48
    v5 = nil
    v6 = nil
    for m, i5 in v4, v5, v6 do
        if i5 then
            i5:Disconnect()
            u48[m] = nil
        end
    end
    if u45 then
        u45:Disconnect()
        u45 = nil
    end
    if u46 then
        u46:Disconnect()
        u46 = nil
    end
end