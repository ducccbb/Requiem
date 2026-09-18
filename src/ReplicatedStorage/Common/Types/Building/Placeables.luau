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
--               File: ReplicatedStorage.Common.Types.Building.Placeables
--                               Dumped in 0.00159 seconds
--                          Bytecode version 9  |  14 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Builder = game:GetService("ReplicatedStorage"):WaitForChild("Assets"):WaitForChild("Builder")
local u26 = {}
local v2 = {}
function v2.createPlaceableSystem(p1, p2) -- Line: 58 -- upvalues: Builder (val)
    local v1
    local u2 = {}
    local u3 = {}
    local u8 = Builder:WaitForChild(p1)
    local function getItem(p1) -- Line: 67 -- upvalues: u2 (val), p2 (val)
        if u2[p1] then
            return u2[p1]
        end
        local v1 = p2
        local v2 = nil
        local v3 = nil
        for i, j in v1, v2, v3 do
            if j.id == p1 then
                u2[p1] = j
                return j
            end
        end
        return u2[p1]
    end
    local function convertItemsToCategorical(a1) -- Line: 163 -- upvalues: getItem (val), p1 (val)
        local content, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11
        local v12 = {}
        local v13 = a1
        local v14 = nil
        local v15 = nil
        for i, j in v13, v14, v15 do
            v10 = getItem(j)
            if v10 then
                v11 = string.split(v10.model, "/")
                content = v12
                v1 = p1
                v2 = v11
                v3 = nil
                v4 = nil
                for k, n in v2, v3, v4 do
                    if v1 ~= "" then
                        v1 = v1 .. "/" .. n
                    else
                        v1 = n
                    end
                    v5 = k == #v11
                    if not v5 then
                        v6 = nil
                        v7 = content
                        v8 = nil
                        v9 = nil
                        for m, i5 in v7, v8, v9 do
                            if type(i5) == "table" and i5.name == n then
                                v6 = i5
                                break
                            end
                        end
                        if not v6 then
                            v8 = {folder = true, path = v1 .. "/*", name = n, content = {}}
                            table.insert(content, v8)
                            content = v8.content
                        else
                            content = v6.content
                        end
                    else
                        table.insert(content, {
                            folder = false,
                            id = v10.id,
                            name = v10.name,
                            model = v10.model,
                            path = v1,
                            price = v10.price,
                        })
                    end
                end
            end
        end
        return v12
    end
    v1 = {
        items = p2,
        getItem = getItem,
        getItemModel = function(p1) -- Line: 86 -- upvalues: getItem (val), u3 (val), u8 (val)
            local v1
            if type(p1) ~= "number" then
                v1 = p1
            else
                v1 = getItem(p1)
            end
            if u3[v1.id] then
                return u3[v1.id]
            end
            local v2 = string.split(v1.model, "/")
            local v3 = u8
            local v4 = v2
            local v5 = nil
            local v6 = nil
            for i, j in v4, v5, v6 do
                v3 = v3:WaitForChild(j)
            end
            u3[v1.id] = v3
            return v3
        end,
    }
    function v1.getItemDirectoryFromPath(a1, p2) -- Line: 117 -- upvalues: p1 (val)
        local v1, v2, v3, v4
        if a1 == p1 .. "/*" then
            return p2
        end
        local v5 = string.gsub(a1, "/%*$", "")
        local v6 = string.split(v5, "/")
        local content = p2
        local v7 = #v6
        local v8 = 1
        for i = 2, v7, v8 do
            v4 = false
            v1 = content
            v2 = nil
            v3 = nil
            for j, k in v1, v2, v3 do
                if k.folder and k.name == v6[i] then
                    content = k.content
                    v4 = true
                    break
                end
            end
            if not v4 then
                return {}
            end
        end
        return content
    end
    v1.convertItemsToCategorical = convertItemsToCategorical
    function v1.createCategorical() -- Line: 238 -- upvalues: p2 (val), convertItemsToCategorical (val)
        local v1 = {}
        local v2 = p2
        local v3 = nil
        local v4 = nil
        for i, j in v2, v3, v4 do
            table.insert(v1, j.id)
        end
        return convertItemsToCategorical(v1)
    end
    function v1.getItemFromPath(p1) -- Line: 249 -- upvalues: p2 (val)
        local v1 = string.split(p1, "/")
        table.remove(v1, 1)
        local v2 = table.concat(v1, "/")
        local v3 = p2
        local v4 = nil
        local v5 = nil
        for i, j in v3, v4, v5 do
            if j.model == v2 then
                return j
            end
        end
        return nil
    end
    return v1
end
function v2.registerPlaceableSystem(p1, p2) -- Line: 286 -- upvalues: u26 (val)
    u26[p1] = p2
end
function v2.getPlaceableSystemFromPath(p1) -- Line: 295 -- upvalues: u26 (val)
    if not p1 then
        return nil
    end
    return u26[string.split(p1, "/")[1]]
end
function v2.getAllDescendants(p1) -- Line: 320
    local collectItems, v1, v2, v3, v4, v5
    local v6 = {}
    local v7 = {}
    local v8 = {}
    function collectItems(p1, p2) -- Line: 326 -- upvalues: collectItems (val)
        local v1 = p1
        local v2 = nil
        local v3 = nil
        for i, j in v1, v2, v3 do
            if not j.folder then
                table.insert(p2, j)
            else
                collectItems(j.content, p2)
            end
        end
    end
    local v9 = p1
    local v10 = nil
    local v11 = nil
    for i, j in v9, v10, v11 do
        if not j.folder then
            if #v8 == 0 then
                table.insert(v8, {})
            end
            table.insert(v8[1], j)
        else
            table.insert(v7, j)
            v1 = {}
            table.insert(v8, v1)
            collectItems(j.content, v1)
        end
    end
    v9 = 1
    v10 = v7
    v11 = nil
    local v12 = nil
    for k, n in v10, v11, v12 do
        v2 = table.clone(n)
        v2.layoutOrder = v9
        v9 = v9 + 1
        table.insert(v6, v2)
    end
    v10 = v8
    v11 = nil
    v12 = nil
    for m, i5 in v10, v11, v12 do
        v2 = i5
        v3 = nil
        v4 = nil
        for i6, i7 in v2, v3, v4 do
            v5 = table.clone(i7)
            v5.layoutOrder = v9
            v9 = v9 + 1
            table.insert(v6, v5)
        end
    end
    return v6
end
function v2.getItemModelFromPath(p1) -- Line: 388 -- upvalues: Builder (val)
    local v1 = Builder
    local v2 = string.split(p1, "/")
    local v3 = nil
    local v4 = nil
    for i, j in v2, v3, v4 do
        v1 = v1:FindFirstChild(j)
        if not v1 then
            return nil
        end
    end
    return v1
end
function v2.getSystemFromCategory(p1) -- Line: 310 -- upvalues: u26 (val)
    return u26[p1]
end
return v2