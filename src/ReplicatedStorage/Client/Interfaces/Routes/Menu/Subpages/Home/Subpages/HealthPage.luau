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
--File: ReplicatedStorage.Client.Interfaces.Routes.Menu.Subpages.Home.Subpages.HealthPage
--                               Dumped in 0.00120 seconds
--                          Bytecode version 9  |  6 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Types = Common:WaitForChild("Types")
local Injuries = require(Types:WaitForChild("Injuries"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Network = Common_2:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Vitality = require(Namespaces:WaitForChild("Vitality"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_4:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_5:WaitForChild("Common")
local Utilities = Common_3:WaitForChild("Utilities")
local Table = require(Utilities:WaitForChild("Table"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_6:WaitForChild("Client")
local Interfaces = Client:WaitForChild("Interfaces")
local Components = Interfaces:WaitForChild("Components")
local Universal = Components:WaitForChild("Universal")
local HeaderBodyComponent = require(Universal:WaitForChild("HeaderBodyComponent"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_7:WaitForChild("Client")
local Interfaces_2 = Client_2:WaitForChild("Interfaces")
local Components_2 = Interfaces_2:WaitForChild("Components")
local Universal_2 = Components_2:WaitForChild("Universal")
local ItemViewport = require(Universal_2:WaitForChild("ItemViewport"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_8:WaitForChild("Client")
local Interfaces_3 = Client_3:WaitForChild("Interfaces")
local Components_3 = Interfaces_3:WaitForChild("Components")
local Universal_3 = Components_3:WaitForChild("Universal")
local Progress = require(Universal_3:WaitForChild("Progress"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_9:WaitForChild("Client")
local Interfaces_4 = Client_4:WaitForChild("Interfaces")
local Hooks = Interfaces_4:WaitForChild("Hooks")
local useConstants = require(Hooks:WaitForChild("useConstants"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Client_5 = ReplicatedStorage_10:WaitForChild("Client")
local Interfaces_5 = Client_5:WaitForChild("Interfaces")
local Hooks_2 = Interfaces_5:WaitForChild("Hooks")
local useRem = require(Hooks_2:WaitForChild("useRem"))
local ReplicatedStorage_11 = game:GetService("ReplicatedStorage")
local Client_6 = ReplicatedStorage_11:WaitForChild("Client")
local Interfaces_6 = Client_6:WaitForChild("Interfaces")
local Hooks_3 = Interfaces_6:WaitForChild("Hooks")
local useStore = require(Hooks_3:WaitForChild("useStore"))
local ReplicatedStorage_12 = game:GetService("ReplicatedStorage")
local Client_7 = ReplicatedStorage_12:WaitForChild("Client")
local Interfaces_7 = Client_7:WaitForChild("Interfaces")
local Hooks_4 = Interfaces_7:WaitForChild("Hooks")
local useTheme = require(Hooks_4:WaitForChild("useTheme"))
return function(p1) -- Line: 40 -- upvalues: useRem (val), useTheme (val), useConstants (val), react (val), useStore (val), Vitality (val), ReplicatedStorage (val), Injuries (val), Table (val), HeaderBodyComponent (val), Progress (val), ItemViewport (val)
    local v1, v2, v3, v4, v5, v6, v7, v8
    local v9 = useRem()
    local v10 = useTheme()
    local v11 = useConstants()
    local v12 = react.useRef(nil)
    local v13 = useStore(Vitality.Store, function(p1) -- Line: 47
        return p1
    end)
    local v14 = react.useMemo(function() -- Line: 51 -- upvalues: ReplicatedStorage (upval)
        local Assets = ReplicatedStorage:WaitForChild("Assets")
        local Objects = Assets:WaitForChild("Objects")
        return Objects:WaitForChild("Dummy")
    end, {})
    local v15 = react.useMemo(function() -- Line: 56 -- upvalues: Injuries (upval)
        local v1 = {}
        local Head = Injuries.Limbs.Head
        local v2 = {}
        local v3 = UDim2.fromScale(0.44, 0.225)
        local v4 = UDim2.fromScale(0.3, 0.175)
        v2[1] = v3
        v2[2] = v4
        v2[3] = Vector2.new(1, 0.5)
        v1[Head] = v2
        local v5 = Injuries.Limbs["Left Arm"]
        v2 = {}
        v3 = UDim2.fromScale(0.306, 0.428)
        v4 = UDim2.fromScale(0.22, 0.428)
        v2[1] = v3
        v2[2] = v4
        v2[3] = Vector2.new(1, 0.5)
        v1[v5] = v2
        v5 = Injuries.Limbs["Left Leg"]
        v2 = {}
        v3 = UDim2.fromScale(0.397, 0.725)
        v4 = UDim2.fromScale(0.299, 0.733)
        v2[1] = v3
        v2[2] = v4
        v2[3] = Vector2.new(1, 0.5)
        v1[v5] = v2
        local Torso = Injuries.Limbs.Torso
        v2 = {}
        v3 = UDim2.fromScale(0.582, 0.275)
        v4 = UDim2.fromScale(0.72, 0.174)
        v2[1] = v3
        v2[2] = v4
        v2[3] = Vector2.new(0, 0.5)
        v1[Torso] = v2
        v5 = Injuries.Limbs["Right Arm"]
        v2 = {}
        v3 = UDim2.fromScale(0.694, 0.428)
        v4 = UDim2.fromScale(0.78, 0.428)
        v2[1] = v3
        v2[2] = v4
        v2[3] = Vector2.new(0, 0.5)
        v1[v5] = v2
        v5 = Injuries.Limbs["Right Leg"]
        v2 = {}
        v3 = UDim2.fromScale(0.603, 0.725)
        v4 = UDim2.fromScale(0.701, 0.733)
        v2[1] = v3
        v2[2] = v4
        v2[3] = Vector2.new(0, 0.5)
        v1[v5] = v2
        return v1
    end, {})
    local v16 = {}
    for k, v in pairs(v15) do
        if v12.current and v13 then
            v1 = Table.find(v13.limbs, function(p1) -- Line: 104 -- upvalues: k (val)
                local v1 = string.lower(p1.name)
                local v2 = v1 == string.lower(k)
                return v2
            end)
            if v1 then
                v2 = v13.limbs[v1]
                v3 = {BackgroundTransparency = 0}
                v5 = v9(300)
                v3.Size = UDim2.fromOffset(v5, v9(115))
                v3.AnchorPoint = v[3]
                v3.Position = v[2]
                v3.BackgroundColor3 = v10.PageBackground
                v4 = {Padding = react.createElement("UIPadding", v11.Padding.Universal.Large), Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, v9(10))}), Label = react.createElement(HeaderBodyComponent, {Header = k, Body = "Your " .. string.lower(k) .. " health and pain levels.", Position = UDim2.fromOffset(0, v9(15))})}
                v6 = {
                    Enabled = true,
                    Animated = true,
                    Padding = "None",
                    Range = {Min = 0, Max = 100},
                    Value = v2.health,
                    Color = Color3.fromRGB(81, 23, 23),
                }
                v7 = {BackgroundTransparency = 1}
                v8 = UDim2.fromScale(0.5, 0.5)
                v7.Position = v8 + UDim2.fromOffset(0, v9(10))
                v7.AnchorPoint = Vector2.new(0.5, 0.5)
                v6.Native = v7
                v4.Health = react.createElement(Progress, v6)
                v6 = {
                    Enabled = true,
                    Animated = true,
                    Padding = "None",
                    Range = {Min = 0, Max = 100},
                    Value = v2.pain,
                }
                v7 = {BackgroundTransparency = 1}
                v8 = UDim2.fromScale(0.5, 0.5)
                v7.Position = v8 + UDim2.fromOffset(0, v9(37))
                v7.AnchorPoint = Vector2.new(0.5, 0.5)
                v6.Native = v7
                v4.Pain = react.createElement(Progress, v6)
                v16[k] = react.createElement("Frame", v3, v4)
            end
        end
    end
    return react.createElement("Frame", {
        BackgroundTransparency = 1,
        Visible = p1.Enabled,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
        ref = v12,
    }, {Viewport = react.createElement(ItemViewport, {Spins = false, Model = v14})}, v16, {})
end