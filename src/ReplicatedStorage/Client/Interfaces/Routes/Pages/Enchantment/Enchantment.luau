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
--    File: ReplicatedStorage.Client.Interfaces.Routes.Pages.Enchantment.Enchantment
--                               Dumped in 0.00167 seconds
--                          Bytecode version 9  |  14 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Promise = require(Common:WaitForChild("Promise"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Network = Common_2:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Enchantments = require(Namespaces:WaitForChild("Enchantments"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_3:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Signals = require(Common_3:WaitForChild("Signals"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_5:WaitForChild("Common")
local Utilities = Common_4:WaitForChild("Utilities")
local Table = require(Utilities:WaitForChild("Table"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_6:WaitForChild("Client")
local Progression = Client:WaitForChild("Progression")
local Enchantments_2 = Progression:WaitForChild("Enchantments")
local ClientEnchantmentsHandler = require(Enchantments_2:WaitForChild("ClientEnchantmentsHandler"))
local Components = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Primitives = Components:WaitForChild("Primitives")
local Frame = require(Primitives:WaitForChild("Frame"))
local Pack = require(v1.Parent:WaitForChild("Pack"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_7:WaitForChild("Client")
local User = Client_2:WaitForChild("User")
local State = User:WaitForChild("State")
local ClientSettingsHandler = require(State:WaitForChild("ClientSettingsHandler"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_8:WaitForChild("Common")
local Utilities_2 = Common_5:WaitForChild("Utilities")
local Sounds = require(Utilities_2:WaitForChild("Sounds"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_9:WaitForChild("Common")
local Sounds_2 = Common_6:WaitForChild("Sounds")
local Universal = require(Sounds_2:WaitForChild("Universal"))
local Hooks = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useInterfaceState = require(Hooks:WaitForChild("useInterfaceState"))
local Hooks_2 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useStore = require(Hooks_2:WaitForChild("useStore"))
return function() -- Line: 54 -- upvalues: useInterfaceState (val), react (val), useStore (val), Enchantments (val), ClientEnchantmentsHandler (val), Table (val), Signals (val), ClientSettingsHandler (val), Sounds (val), Universal (val), Promise (val), Pack (val), Frame (val)
    local enchant, enchant_2, enchant_3, u12, u13, u17, u18, u22, u23, u28, u33, u38, v1, v2, v3, v4
    enchant, enchant_3, enchant_2 = useInterfaceState("enchant")
    local v5 = enchant_3
    if not v5 then
        v5 = {visible = false, id = 0}
    end
    local u8 = v5
    u12, u13 = react.useState(u8.visible)
    u17, u18 = react.useState(0)
    u22, u23 = react.useState(nil)
    v4, u28 = react.useState(false)
    v1, u33 = react.useState(false)
    v2, u38 = react.useState(false)
    local u42 = react.useRef(u22)
    local u46 = react.useRef(u17)
    local u50 = react.useRef(u12)
    u42.current = u22
    u46.current = u17
    u50.current = u12
    local u55 = useStore(Enchantments.UnclaimedStore, function(p1) -- Line: 74
        return p1
    end)
    local v6 = react.useMemo(function() -- Line: 78 -- upvalues: u55 (val)
        for i, v in ipairs(u55) do
            if v and v.enchantments and type(v.enchantments) == "table" then
                return true
            end
        end
        return false
    end, {u55})
    react.useEffect(function() -- Line: 88 -- upvalues: u12 (val), u23 (val), u18 (val), u17 (val), u55 (val), Enchantments (upval), enchant (val)
        if not u12 then
            u23(nil)
            u18(0)
            return
        end
        if u17 ~= 0 then
            return
        end
        for i, v in ipairs(u55) do
            if v and type(v.id) == "number" then
                u18(v.id)
                if type(v.enchantments) ~= "table" then
                    Enchantments.Open.post(v.id)
                elseif #v.enchantments == 0 then
                    Enchantments.Open.post(v.id)
                end
                return
            end
        end
        enchant({visible = false, id = -1})
    end, {u12, u55})
    react.useEffect(function() -- Line: 116 -- upvalues: u12 (val), u17 (val), u22 (val), u55 (val), ClientEnchantmentsHandler (upval), Table (upval), u23 (val), enchant (val)
        local v1, v2, v3, v4
        if not u12 or u17 == 0 or u22 then
            return
        end
        for i, v in ipairs(u55) do
            if v and v.id == u17 then
                if type(v.enchantments) == "table" and #v.enchantments ~= 0 then
                    v4 = {}
                    for i2, i3 in ipairs(v.enchantments) do
                        v1 = ClientEnchantmentsHandler.getEnchantmentHashFromName(i3)
                        v2 = ClientEnchantmentsHandler.getEnchantmentFromHash(v1)
                        v3 = Table.merge(v2, {Name = i3, hash = v1})
                        v3.Name = i3
                        table.insert(v4, v3)
                    end
                    u23(v4)
                    return
                end
                return
            end
        end
        enchant({visible = false, id = -1})
    end, {u12, u55, u17})
    react.useEffect(function() -- Line: 148 -- upvalues: u13 (val), u8 (ref), ClientEnchantmentsHandler (upval), u33 (val), u38 (val), Signals (upval)
        u13(u8.visible)
        local Insight = ClientEnchantmentsHandler.hasEnchantment("Insight")
        u33(Insight)
        local Deduction = ClientEnchantmentsHandler.hasEnchantment("Deduction")
        u38(Deduction)
        if u8.visible then
            Signals.Monologue:Fire("The time has come, Ymir — grant me your favor.")
        end
    end, {u8.visible})
    react.useEffect(function() -- Line: 162 -- upvalues: ClientSettingsHandler (upval), u28 (val)
        local v1 = ClientSettingsHandler.getSettingFromName("Dopamine Bubble")
        u28(v1)
        local u12 = ClientSettingsHandler.onSettingChanged:Connect(function(p1, p2) -- Line: 166 -- upvalues: u28 (upval)
            if p1 == "Dopamine Bubble" then
                u28(p2)
            end
        end)
        return function() -- Line: 172 -- upvalues: u12 (val)
            u12:Disconnect()
        end
    end, {})
    local v7 = u12
    if v7 then
        v7 = u22 ~= nil
    end
    if not v7 then
        v3 = nil
    else
        v3 = react.createElement(Pack, {
            DisplayOrder = 200,
            Enabled = u12,
            Pack = u22,
            BindId = tostring(u17),
            PreviewInsight = v1 or v2,
            AllowFlipAll = v2,
            onClaim = function(p1) -- Line: 177 -- upvalues: u42 (val), Enchantments (upval), u46 (val), Sounds (upval), Universal (upval), Promise (upval), u13 (val), u23 (val), u18 (val), enchant (val)
                local current = u42.current
                local v1 = current
                if v1 then
                    v1 = current[p1]
                end
                if not v1 then
                    return
                end
                Enchantments.Claim.post({name = v1.Name, packId = u46.current})
                local u19 = Sounds.playGlobalSoundEffect(Universal.Card, 0.1)
                task.delay(5, function() -- Line: 190 -- upvalues: u19 (val)
                    u19:Destroy()
                end)
                Promise.delay(2):andThen(function() -- Line: 201 -- upvalues: u13 (upval), u23 (upval), u18 (upval), enchant (upval)
                    u13(false)
                    u23(nil)
                    u18(0)
                    enchant({visible = false, id = -1})
                end)
            end,
        })
    end
    local v8 = {}
    local v9 = {BackgroundTransparency = 1, AnchorPoint = Vector2.new(0.5, 0.5)}
    local v10 = UDim2.fromScale(0.5, 0)
    v9.Position = v10 + UDim2.fromOffset(0, 56)
    v9.Size = UDim2.fromOffset(50, 50)
    v9.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    local v11 = v4
    if v11 then
        v11 = v6
        if v11 then
            v11 = not v7
        end
    end
    v9.Visible = v11
    v11 = {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(1, 0)}), Stroke = react.createElement("UIStroke", {Thickness = 2, Color = Color3.fromRGB(135, 27, 27)}), Icon = react.createElement("ImageLabel", {
        Image = "rbxassetid://12974438009",
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(0.5, 0.5),
        ImageColor3 = Color3.fromRGB(135, 27, 27),
    })}
    local v12 = {
        AutoButtonColor = false,
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 1),
        Text = "",
        ZIndex = 2,
    }
    v12[react.Event.MouseButton1Click] = function() -- Line: 211 -- upvalues: u50 (val), u46 (val), enchant_2 (val), enchant (val)
        if u50.current or u46.current ~= 0 then
            return
        end
        local v1 = enchant_2()
        if not v1 then
            enchant({visible = true, id = math.random(1, 50000)})
            return
        end
        if v1.visible then
            return
        end
        enchant({visible = true, id = math.random(1, 50000)})
    end
    v11.Button = react.createElement("TextButton", v12)
    v11.Gradient = react.createElement("ImageLabel", {
        Image = "rbxassetid://114110160149754",
        BackgroundTransparency = 1,
        ImageTransparency = 0.5,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        Size = UDim2.fromScale(1, 1),
        ImageColor3 = Color3.fromRGB(135, 27, 27),
    }, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(1, 0)})})
    v8.Bubble = react.createElement(Frame, v9, v11)
    v8.Opening = v3
    return react.createElement(react.Fragment, {}, v8)
end