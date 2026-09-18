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
--           File: ReplicatedStorage.Client.Interfaces.Routes.Screen.Requests
--                              Dumped in 0.000629 seconds
--                          Bytecode version 9  |  9 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Player = require(Namespaces:WaitForChild("Player"))
local Components = script.Parent.Parent.Parent:WaitForChild("Components")
local Screen = Components:WaitForChild("Screen")
local Request = require(Screen:WaitForChild("Request"))
return function() -- Line: 28 -- upvalues: react (val), Player (val), Request (val)
    local u4, v1
    local v2 = {}
    v1, u4 = react.useState(v2)
    react.useEffect(function() -- Line: 61 -- upvalues: Player (upval), u4 (val)
        Player.Ask.listen(function(p1) -- Line: 62 -- upvalues: u4 (upval)
            u4(function(a1) -- Line: 63 -- upvalues: p1 (val)
                local v1 = table.clone(a1)
                v1[p1.id] = {header = p1.header, description = p1.description, id = p1.id}
                return v1
            end)
            task.delay(4, function() -- Line: 74 -- upvalues: u4 (upval), p1 (val)
                u4(function(a1) -- Line: 75 -- upvalues: p1 (upval)
                    local v1 = table.clone(a1)
                    v1[p1.id] = nil
                    return v1
                end)
            end)
        end)
    end)
    local v3 = {}
    local v4 = v1
    local v5 = nil
    local v6 = nil
    for i, j in v4, v5, v6 do
        v3[j.id] = react.createElement(Request, {
            header = j.header,
            description = j.description,
            onAllow = function() -- Line: 91 -- upvalues: Player (upval), j (val)
                Player.Ask.unreliablePost({result = true, id = j.id})
            end,
            onDeny = function() -- Line: 98 -- upvalues: Player (upval), j (val)
                Player.Ask.unreliablePost({result = false, id = j.id})
            end,
        })
    end
    v6 = {BackgroundTransparency = 1, BorderSizePixel = 0, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BorderColor3 = Color3.fromRGB(0, 0, 0)}
    local v7 = UDim2.fromScale(1, 1)
    v6.Position = v7 + UDim2.fromOffset(-1, -50)
    v6.Size = UDim2.fromOffset(316, 152)
    v6.AnchorPoint = Vector2.new(1, 1)
    return react.createElement("Frame", v6, {uIListLayout2 = react.createElement("UIListLayout", {SortOrder = Enum.SortOrder.LayoutOrder, VerticalAlignment = Enum.VerticalAlignment.Bottom})}, v3)
end