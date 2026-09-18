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
--         File: ReplicatedStorage.Client.Interfaces.Routes.Pages.Corpse.Corpse
--                               Dumped in 0.00214 seconds
--                          Bytecode version 9  |  13 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Types = Common:WaitForChild("Types")
local Item = require(Types:WaitForChild("Item"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Network = Common_2:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Inventory = require(Namespaces:WaitForChild("Inventory"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Utilities = Common_3:WaitForChild("Utilities")
local Number = require(Utilities:WaitForChild("Number"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_4:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_5:WaitForChild("Common")
local Utilities_2 = Common_4:WaitForChild("Utilities")
local Table = require(Utilities_2:WaitForChild("Table"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_6:WaitForChild("Common")
local Utilities_3 = Common_5:WaitForChild("Utilities")
local Character = require(Utilities_3:WaitForChild("Character"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_7:WaitForChild("Client")
local User = Client:WaitForChild("User")
local Equipment = User:WaitForChild("Equipment")
local Tools = Equipment:WaitForChild("Tools")
local ClientInventoryHandler = require(Tools:WaitForChild("ClientInventoryHandler"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_8:WaitForChild("Client")
local User_2 = Client_2:WaitForChild("User")
local State = User_2:WaitForChild("State")
local ClientStateHandler = require(State:WaitForChild("ClientStateHandler"))
local States = ClientStateHandler.States
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Common_6 = ReplicatedStorage_9:WaitForChild("Common")
local Animations = Common_6:WaitForChild("Animations")
local Default = require(Animations:WaitForChild("Default"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Common_7 = ReplicatedStorage_10:WaitForChild("Common")
local Observers = Common_7:WaitForChild("Observers")
local useAnimatorObserver = require(Observers:WaitForChild("useAnimatorObserver"))
local Components = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Utilities_4 = Components:WaitForChild("Utilities")
local Color = require(Utilities_4:WaitForChild("Color"))
local Components_2 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Inputs = Components_2:WaitForChild("Inputs")
local Button = require(Inputs:WaitForChild("Button"))
local Components_3 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Screen = Components_3:WaitForChild("Screen")
local DynamicPage = require(Screen:WaitForChild("DynamicPage"))
local Components_4 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Primitives = Components_4:WaitForChild("Primitives")
local ScrollingFrame = require(Primitives:WaitForChild("ScrollingFrame"))
local Hooks = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useConstants = require(Hooks:WaitForChild("useConstants"))
local Hooks_2 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useRem = require(Hooks_2:WaitForChild("useRem"))
local Hooks_3 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useStore = require(Hooks_3:WaitForChild("useStore"))
local Hooks_4 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useTextScale = require(Hooks_4:WaitForChild("useTextScale"))
local Hooks_5 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useTheme = require(Hooks_5:WaitForChild("useTheme"))
local function ItemStack(p1) -- Line: 64 -- upvalues: useTheme (val), useRem (val), useTextScale (val), useConstants (val), react (val), ClientInventoryHandler (val), Item (val), Number (val), Color (val), Button (val), Inventory (val)
    local u16, u17, u18, v1
    local v2 = useTheme()
    local v3 = useRem()
    local v4 = useTextScale()
    local v5 = useConstants()
    _, v1, u16, u17, u18 = react.useMemo(function() -- Line: 73 -- upvalues: p1 (val), ClientInventoryHandler (upval)
        local id, v1, v2, v3
        local Item = p1.Item
        id = if typeof(Item) == "table" then Item.id else false
        if not id then
            v1 = "Unknown"
        else
            v1 = ClientInventoryHandler.getItemNameFromHash(Item.id)
        end
        if not id then
            v2 = nil
        else
            v2 = ClientInventoryHandler.getItemModel(Item.id)
        end
        if not id then
            v3 = {}
        else
            v3 = ClientInventoryHandler.getItemDataFromName(v1)
            if not v3 then
                v3 = {}
            end
        end
        local tags = p1.Item.tags
        if not tags then
            tags = {}
        end
        return v2, v3.description, v1, v3.display_name, tags
    end, {p1.Item})
    local v6 = react.useMemo(function() -- Line: 86 -- upvalues: Item (upval), u17 (val), u16 (val), u18 (val), p1 (val), Number (upval)
        local v1
        local v2 = {}
        local v3 = u17
        if not v3 then
            v3 = u16
        end
        v2.Name = v3
        v3 = u18
        if not v3 then
            v3 = {}
        end
        v2.Tags = v3
        local v4 = Item.getDisplayName(v2)
        if not v4 then
            v4 = u16
        end
        v2 = ""
        v3 = p1.Item.meta[1]
        local v5 = v3
        if v5 then
            v5 = typeof(v3) == "number"
        end
        local v6 = false
        if p1.Item.stack == 1 then
            v6 = v5
            if v6 then
                v6 = 1 < v3
            end
        end
        local v7 = v5
        if v7 then
            v7 = if 1 <= v3 then if v2 ~= "Marcs" then v2 == "Pouch" else true else false
        end
        if v2 == "Marcs" then
            if not v7 then
                v1 = ""
            else
                v1 = Number.FormatWithCommas(v3) .. " "
                if not v1 then
                    v1 = ""
                end
            end
            return v1 .. v4
        elseif v2 ~= "Pouch" then
            local v8
            v1 = "%* %*"
            local v9 = v4
            if not v6 then
                v8 = ""
            else
                v8 = ("<font transparency=\"0.5\">(x%*)</font>"):format((Number.FormatWithCommas(p1.Item.meta[1]))) .. " "
                if not v8 then
                    v8 = ""
                end
            end
            return (v1:format(v9, v8))
        end
    end, {p1.Item, u16, u17})
    local v7 = {}
    local v8 = UDim2.fromScale(1, 0)
    v7.Size = v8 + UDim2.fromOffset(0, v3(85))
    v7.BackgroundTransparency = v2.PageTransparency
    v7.BackgroundColor3 = v2.PageBackground
    local v9 = {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 10)})}
    local v10 = {BackgroundTransparency = 1, RichText = true}
    local v11 = UDim2.fromScale(1, 0)
    local v12 = -v3(70)
    v10.Size = v11 + UDim2.fromOffset(v12, v3(20))
    v10.Text = v6
    v10.TextColor3 = Color.Darken(v2.Primary, 0.8)
    v10.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
    v10.TextXAlignment = Enum.TextXAlignment.Left
    v10.TextSize = v4(v5.TextSize.Header)
    v11 = v3(20)
    v10.Position = UDim2.fromOffset(v11, v3(27))
    v9.Header = react.createElement("TextLabel", v10)
    v10 = {BackgroundTransparency = 1}
    v11 = UDim2.fromScale(1, 0)
    v12 = -v3(70)
    v10.Size = v11 + UDim2.fromOffset(v12, v3(20))
    v10.Text = v1 or ""
    v10.TextColor3 = Color.Darken(v2.Primary, 0.6)
    v10.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json")
    v10.TextXAlignment = Enum.TextXAlignment.Left
    v10.TextSize = v4(v5.TextSize.Body)
    v11 = v3(20)
    v10.Position = UDim2.fromOffset(v11, v3(42))
    v9.Body = react.createElement("TextLabel", v10)
    v9.Button = react.createElement(Button, {
        Text = "Loot",
        Padding = "Medium",
        Type = 1,
        Clicked = function() -- Line: 181 -- upvalues: Inventory (upval), p1 (val)
            Inventory.Loot.post({hash = p1.Item.id, offset = p1.Item.offset})
        end,
        Native = {AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.fromScale(0.98, 0.5)},
    })
    return react.createElement("Frame", v7, v9)
end
return function() -- Line: 200 -- upvalues: useStore (val), Inventory (val), react (val), ClientStateHandler (val), States (val), Character (val), useAnimatorObserver (val), Default (val), RunService (val), Table (val), ItemStack (val), DynamicPage (val), ScrollingFrame (val)
    local u8, u9
    local u4 = useStore(Inventory.Container, function(p1) -- Line: 201
        return p1
    end)
    u8, u9 = react.useState(false)
    local u13 = react.useRef(nil)
    react.useEffect(function() -- Line: 209 -- upvalues: u4 (val), u9 (val)
        local items
        if not u4 then
            if not u4 then
                local v1
                if not u4 then
                    v1 = false
                else
                    v1 = not (u4.id == 0)
                end
                u9(v1)
                return
            else
                items = u4.items
                if not items then
                    items = {}
                end
                if #items == 0 then
                    return u9(false)
                end
            end
        elseif not (next(u4.items)) then
            return u9(false)
        end
    end, {u4.id, u4.items})
    react.useEffect(function() -- Line: 218 -- upvalues: u8 (val), ClientStateHandler (upval), States (upval), u13 (val), Character (upval), u9 (val), useAnimatorObserver (upval), Default (upval), RunService (upval), Inventory (upval)
        if not u8 then
            ClientStateHandler.updateState(States.LOOTING, false)
            if u13.current then
                u13.current:Stop(0.2)
            end
            return
        end
        local u17 = Character.getCharacter()
        if not u17 then
            return u9(false)
        end
        ClientStateHandler.updateState(States.LOOTING, true)
        u13.current = useAnimatorObserver.play(Default.Container, 0.2)
        local Position = u17.HumanoidRootPart.Position
        local u36 = nil
        u36 = RunService.RenderStepped:Connect(function() -- Line: 246 -- upvalues: u17 (val), Position (val), u36 (ref), u9 (upval), Inventory (upval)
            if 2.5 >= (u17.HumanoidRootPart.Position - Position).Magnitude then
                return
            end
            u36:Disconnect()
            u9(false)
            Inventory.Loot.post({hash = 0, offset = 0})
        end)
        return function() -- Line: 261 -- upvalues: u36 (ref)
            u36:Disconnect()
        end
    end, {u8})
    local v1 = react.useMemo(function() -- Line: 267 -- upvalues: Table (upval), u4 (val), react (upval), ItemStack (upval)
        return (Table.map(u4.items, function(p1) -- Line: 268 -- upvalues: react (upval), ItemStack (upval)
    local v1
    v1 = {}
    v1.Item = p1
    return react.createElement(ItemStack, v1)
end))
    end, {u4.items})
    return react.createElement(DynamicPage, {Enabled = u8}, {Content = react.createElement(ScrollingFrame, {BackgroundTransparency = 1, Size = UDim2.fromScale(0.35, 0.5), AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5)}, {Layout = react.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical,
        SortOrder = Enum.SortOrder.LayoutOrder,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        Padding = UDim.new(0, 10),
    })}, v1)})
end