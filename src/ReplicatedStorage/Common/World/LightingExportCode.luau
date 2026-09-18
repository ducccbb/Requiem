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
--                File: ReplicatedStorage.Common.World.LightingExportCode
--                               Dumped in 0.00181 seconds
--                          Bytecode version 9  |  6 functions

local v1
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local LightingFogBubbleConfig = require(script.Parent:WaitForChild("LightingFogBubbleConfig"))
local function base64Encode(p1) -- Line: 50
    local v1, v2, v3, v4, v5, v6, v7, v8
    local v9 = {string.byte(p1, 1, #p1)}
    local v10 = {}
    local v11 = #v9
    local v12 = 3
    for i = 1, v11, v12 do
        v6 = v9[i + 1]
        v7 = v9[i + 2]
        v1 = (v9[i] or 0) * 65536 + (v6 or 0) * 256
        v8 = v1 + (v7 or 0)
        if v7 then
            v1 = 4
        elseif not v6 then
            v1 = 2
        else
            v1 = 3
        end
        v2 = 4
        v3 = 1
        for j = 1, v2, v3 do
            v4 = math.floor(v8 / 2 ^ ((4 - j) * 6)) % 64 + 1
            if j > v1 then
                v5 = "="
            else
                v5 = string.sub("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/", v4, v4)
            end
            table.insert(v10, v5)
        end
    end
    return table.concat(v10)
end
local function base64Decode(p1) -- Line: 65
    local v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11
    local v12 = 0
    local v13 = 1
    local v14 = -1
    for i = #p1, v13, v14 do
        if string.sub(p1, i, i) ~= "=" then
            v1 = p1
            break
        end
        v12 = v12 + 1
    end
    v13 = {}
    v14 = #v1 - v12
    local v15 = v14
    local v16 = 4
    for j = 1, v15, v16 do
        v11 = string.sub(v1, j, j)
        v9 = string.find("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/", v11, 1, true)
        v2 = string.sub(v1, j + 1, j + 1)
        v10 = string.find("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/", v2, 1, true)
        v3 = string.sub(v1, j + 2, j + 2)
        v11 = string.find("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/", v3, 1, true)
        v4 = string.sub(v1, j + 3, j + 3)
        v2 = string.find("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/", v4, 1, true)
        if v9 and v10 then
            if not v11 then
                v5 = 0
            else
                v5 = v11 - 1
            end
            if not v2 then
                v6 = 0
            else
                v6 = v2 - 1
            end
            v7 = (v9 - 1) * 262144 + (v10 - 1) * 4096 + v5 * 64 + v6
            v8 = if v14 < j + 3 then 3 - v12 else 3
            if 1 <= v8 then
                table.insert(v13, (string.char(math.floor(v7 / 65536) % 256)))
            end
            if 2 <= v8 then
                table.insert(v13, (string.char(math.floor(v7 / 256) % 256)))
            end
            if 3 <= v8 then
                table.insert(v13, (string.char(v7 % 256)))
            end
            continue
        end
        return nil, "invalid base64"
    end
    return table.concat(v13)
end
v1 = {}
function v1.buildExportText(p1, p2) -- Line: 110 -- upvalues: LightingFogBubbleConfig (val), base64Encode (val)
    local InstanceName, Key, v1, v2, v3, v4
    local v5 = {}
    local current = p2.current
    local WorldAtmosphere = current.WorldAtmosphere
    local Atmosphere = current.Atmosphere
    if WorldAtmosphere and Atmosphere then
        local v6 = {LightingFogBubbleConfig.PROPERTY_ENABLED, LightingFogBubbleConfig.PROPERTY_SIZE}
        for i, v in ipairs(v6) do
            if WorldAtmosphere[v] ~= nil and Atmosphere[v] == nil then
                Atmosphere[v] = WorldAtmosphere[v]
            end
        end
    end
    for i2, i3 in ipairs(p1.Instances) do
        InstanceName = i3.InstanceName
        v1 = current[InstanceName]
        if v1 then
            for i4, j in ipairs(i3.Properties) do
                Key = j.Key
                v2 = v1[Key]
                if j.Type ~= "Color3" then
                    if j.Type ~= "number" then
                        if j.Type ~= "string" then
                            if j.Type ~= "boolean" then
                                if j.Type ~= "Color3" then
                                    v4 = "0"
                                else
                                    v4 = "0,0,0"
                                end
                                v3 = v4
                            elseif typeof(v2) == "boolean" then
                                if not v2 then
                                    v3 = "0"
                                else
                                    v3 = "1"
                                end
                            end
                        elseif typeof(v2) == "string" then
                            v3 = base64Encode(v2)
                        end
                    elseif typeof(v2) == "number" then
                        v3 = tostring(math.floor(v2 * 1000 + 0.5) / 1000)
                    end
                elseif typeof(v2) == "table" and v2.R and v2.G and v2.B then
                    v3 = string.format("%d,%d,%d", v2.R, v2.G, v2.B)
                end
                table.insert(v5, InstanceName .. "." .. Key .. "=" .. v3)
            end
        end
    end
    local v7 = table.concat(v5, "|")
    return base64Encode(v7)
end
function v1.applyExportText(p1, p2, p3) -- Line: 162 -- upvalues: base64Decode (val)
    local Type, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11
    local v12 = string.match(p2, "^%s*(.-)%s*$") or p2
    local v13 = base64Decode(v12)
    if v13 and 0 < #v13 and string.find(v13, "=") then
        v12 = v13
    end
    local v14 = {}
    for i in string.gmatch(v12, "[^\r\n|]+") do
        v11 = string.match(i, "^%s*(.-)%s*$") or i
        if v11 ~= "" then
            table.insert(v14, v11)
        end
    end
    v1, v10 = p1, p3
    for i2, v in ipairs(v14) do
        if v ~= "" then
            v2 = string.find(v, "=", 1, true)
            if v2 then
                v5 = string.sub(v, 1, v2 - 1)
                v3 = string.match(v5, "^%s*(.-)%s*$") or ""
                v6 = string.sub(v, v2 + 1)
                v4 = string.match(v6, "^%s*(.-)%s*$") or ""
                v5 = string.find(v3, ".", 1, true)
                if v5 then
                    v6 = string.sub(v3, 1, v5 - 1)
                    v7 = string.sub(v3, v5 + 1)
                    Type = "number"
                    for i3, j in ipairs(v1.Instances) do
                        if j.InstanceName == v6 then
                            for i4, k in ipairs(j.Properties) do
                                if k.Key == v7 then
                                    Type = k.Type
                                    if not (v10.current[v6]) then
                                        v10.current[v6] = {}
                                    end
                                    if Type == "Color3" then
                                        v8 = {}
                                        for n in string.gmatch(v4, "[^,]+") do
                                            table.insert(v8, (tonumber(string.match(n, "^%s*(.-)%s*$") or n)))
                                        end
                                        if 3 <= #v8 and v8[1] and v8[2] and v8[3] then
                                            v9 = v10.current[v6]
                                            v9[v7] = {R = math.clamp(v8[1], 0, 255), G = math.clamp(v8[2], 0, 255), B = math.clamp(v8[3], 0, 255)}
                                        end
                                    elseif Type == "string" then
                                        v10.current[v6][v7] = base64Decode(v4) or ""
                                    elseif Type ~= "boolean" then
                                        v8 = tonumber(v4)
                                        if v8 then
                                            v10.current[v6][v7] = v8
                                        end
                                    else
                                        v9 = if v4 ~= "1" then string.lower(v4) == "true" else true
                                        v10.current[v6][v7] = v9
                                    end
                                    -- <loop back-edge to L41>
                                end
                            end
                            break
                        end
                    end
                end
            end
        end
    end
end
function v1.applyStateRefToInstances(p1, p2) -- Line: 246 -- upvalues: LightingFogBubbleConfig (val)
    local Instance, Key, v1, v2, v3
    local current = p2.current
    for i, v in ipairs(p1.Instances) do
        Instance = v.Instance
        if not Instance then
            Instance = v.GetInstance
            if Instance then
                Instance = v.GetInstance()
            end
        end
        if Instance then
            v3 = current[v.InstanceName]
            if v3 then
                for i2, i3 in ipairs(v.Properties) do
                    Key = i3.Key
                    v1 = v3[Key]
                    if v1 ~= nil then
                        if i3.Type ~= "Color3" then
                            if i3.Type ~= "string" then
                                if i3.Type ~= "number" then
                                    if i3.Type == "boolean" and typeof(v1) == "boolean" then
                                        if not (LightingFogBubbleConfig.isAttributeOnlyKey(Key)) then
                                            Instance[Key] = v1
                                        else
                                            v2 = LightingFogBubbleConfig.getAttributeName(Key)
                                            Instance:SetAttribute(v2, v1)
                                        end
                                    end
                                elseif typeof(v1) == "number" then
                                    if not (LightingFogBubbleConfig.isAttributeOnlyKey(Key)) then
                                        Instance[Key] = v1
                                    else
                                        v2 = LightingFogBubbleConfig.getAttributeName(Key)
                                        Instance:SetAttribute(v2, v1)
                                    end
                                end
                            elseif typeof(v1) == "string" then
                                Instance[Key] = v1
                            end
                        elseif typeof(v1) == "table" and v1.R and v1.G and v1.B then
                            Instance[Key] = Color3.fromRGB(v1.R, v1.G, v1.B)
                        end
                    end
                end
            end
        end
    end
end
return v1