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
--File: ReplicatedStorage.Packages._Index.pepeeltoro41_ui-labs@2.4.2.ui-labs.StoryCreators
--                              Dumped in 0.000369 seconds
--                          Bytecode version 9  |  8 functions

local v1 = {}
require(script.Parent.Types)
local function CombineTableInfo(p1, p2) -- Line: 11
    for k, v in pairs(p2) do
        p1[k] = v
    end
    return p1
end
function v1.CreateRoactStory(p1, p2) -- Line: 18
    local v1 = {use = "roact", story = p2}
    for k, v in pairs(p1) do
        v1[k] = v
    end
    return v1
end
function v1.CreateReactStory(p1, p2) -- Line: 30
    local v1 = {use = "react", story = p2}
    for k, v in pairs(p1) do
        v1[k] = v
    end
    return v1
end
function v1.CreateFusionStory(p1, p2) -- Line: 42
    local v1 = {use = "fusion", story = p2}
    for k, v in pairs(p1) do
        v1[k] = v
    end
    return v1
end
function v1.CreateIrisStory(p1, p2) -- Line: 54
    local v1 = {use = "iris", story = p2}
    for k, v in pairs(p1) do
        v1[k] = v
    end
    return v1
end
function v1.CreateVideStory(p1, p2) -- Line: 63
    local v1 = {use = "Vide", story = p2}
    for k, v in pairs(p1) do
        v1[k] = v
    end
    return v1
end
function v1.CreateGenericStory(p1, p2) -- Line: 72
    local v1 = {render = p2}
    for k, v in pairs(p1) do
        v1[k] = v
    end
    return v1
end
return v1