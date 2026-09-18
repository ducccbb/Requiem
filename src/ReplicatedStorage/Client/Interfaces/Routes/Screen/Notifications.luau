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
--         File: ReplicatedStorage.Client.Interfaces.Routes.Screen.Notifications
--                              Dumped in 0.000753 seconds
--                          Bytecode version 9  |  7 functions

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
local Signals = require(Common:WaitForChild("Signals"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Network = Common_2:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Notify = require(Namespaces:WaitForChild("Notify"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Utilities = Common_3:WaitForChild("Utilities")
local Sounds = require(Utilities:WaitForChild("Sounds"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_5:WaitForChild("Common")
local Sounds_2 = Common_4:WaitForChild("Sounds")
local Universal = require(Sounds_2:WaitForChild("Universal"))
local Components = script.Parent.Parent.Parent:WaitForChild("Components")
local Screen = Components:WaitForChild("Screen")
local Notification = require(Screen:WaitForChild("Notification"))
return function() -- Line: 42 -- upvalues: react (val), Sounds (val), Universal (val), Signals (val), Notify (val), Notification (val)
    local u4, v1
    local v2 = {}
    v1, u4 = react.useState(v2)
    react.useEffect(function() -- Line: 45 -- upvalues: Sounds (upval), Universal (upval), u4 (val), Signals (upval), Notify (upval)
        local function onNotify(p1) -- Line: 46 -- upvalues: Sounds (upval), Universal (upval), u4 (upval)
            Sounds.playGlobalSoundEffect(Universal.Notification, 0.1, 0.7, 3)
            local u12 = math.random(1, 5000)
            u4(function(a1) -- Line: 50 -- upvalues: u12 (val), p1 (val)
                local v1 = table.clone(a1)
                v1[u12] = {header = p1.header, description = p1.description, id = u12, icon = p1.icon}
                return v1
            end)
            task.delay(10, function() -- Line: 62 -- upvalues: u4 (upval), u12 (val)
                u4(function(p1) -- Line: 63 -- upvalues: u12 (upval)
                    local v1 = table.clone(p1)
                    v1[u12] = nil
                    return v1
                end)
            end)
        end
        Signals.Notify:Connect(onNotify)
        Notify.Popup.listen(onNotify)
    end, {})
    local v3 = {}
    local v4 = v1
    local v5 = nil
    local v6 = nil
    for i, j in v4, v5, v6 do
        v3[j.id] = react.createElement(Notification, {header = j.header, description = j.description, icon = j.icon})
    end
    return react.createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromOffset(20, 150),
        Size = UDim2.fromOffset(316, 152),
        AnchorPoint = Vector2.new(0, 0),
    }, {uIListLayout2 = react.createElement("UIListLayout", {SortOrder = Enum.SortOrder.LayoutOrder, VerticalAlignment = Enum.VerticalAlignment.Top, Padding = UDim.new(0, 5)})}, v3)
end