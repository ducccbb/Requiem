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
--   File: ReplicatedStorage.Client.Interfaces.Routes.Editor.Staff.Pages.Spawner.Prop
--                               Dumped in 0.00194 seconds
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
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Administration = require(Namespaces:WaitForChild("Administration"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_2:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Administration_2 = Common_2:WaitForChild("Administration")
local Permissions = require(Administration_2:WaitForChild("Permissions"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_4:WaitForChild("Client")
local Interfaces = Client:WaitForChild("Interfaces")
local Components = Interfaces:WaitForChild("Components")
local Editor = Components:WaitForChild("Editor")
local Universal = Editor:WaitForChild("Universal")
local Container = require(Universal:WaitForChild("Container"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_5:WaitForChild("Client")
local Interfaces_2 = Client_2:WaitForChild("Interfaces")
local Components_2 = Interfaces_2:WaitForChild("Components")
local Editor_2 = Components_2:WaitForChild("Editor")
local Universal_2 = Editor_2:WaitForChild("Universal")
local Layouts = Universal_2:WaitForChild("Layouts")
local Divider = require(Layouts:WaitForChild("Divider"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_6:WaitForChild("Client")
local Interfaces_3 = Client_3:WaitForChild("Interfaces")
local Components_3 = Interfaces_3:WaitForChild("Components")
local Editor_3 = Components_3:WaitForChild("Editor")
local Universal_3 = Editor_3:WaitForChild("Universal")
local Dropdown = require(Universal_3:WaitForChild("Dropdown"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_7:WaitForChild("Client")
local Interfaces_4 = Client_4:WaitForChild("Interfaces")
local Components_4 = Interfaces_4:WaitForChild("Components")
local Editor_4 = Components_4:WaitForChild("Editor")
local Universal_4 = Editor_4:WaitForChild("Universal")
local Slider = require(Universal_4:WaitForChild("Slider"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Client_5 = ReplicatedStorage_8:WaitForChild("Client")
local User = Client_5:WaitForChild("User")
local Editor_5 = User:WaitForChild("Editor")
local Universal_5 = Editor_5:WaitForChild("Universal")
local UserPlacementHandler = require(Universal_5:WaitForChild("UserPlacementHandler"))
local Hooks = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useEditorEnabled = require(Hooks:WaitForChild("useEditorEnabled"))
local Hooks_2 = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useEditorTools = require(Hooks_2:WaitForChild("useEditorTools"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Client_6 = ReplicatedStorage_9:WaitForChild("Client")
local Interfaces_5 = Client_6:WaitForChild("Interfaces")
local Hooks_3 = Interfaces_5:WaitForChild("Hooks")
local useOrder = require(Hooks_3:WaitForChild("useOrder"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Client_7 = ReplicatedStorage_10:WaitForChild("Client")
local Interfaces_6 = Client_7:WaitForChild("Interfaces")
local Hooks_4 = Interfaces_6:WaitForChild("Hooks")
local useStore = require(Hooks_4:WaitForChild("useStore"))
local u298 = {}
u298["World Building"] = {
    Contains = {
        "Civilian Crowd",
        "Market Stand",
        "Small Fire",
        "Chair",
        "Chair 2",
        "Elegant Chair 1",
        "Elegant Chair 2",
        "Elegant Chair 3",
        "Barrel",
        "Barrel Group",
        "Crate",
        "Long Crate",
        "Large Crate",
        "Chest",
        "Large Crate 2",
        "Medium Crate",
        "Small Crate",
        "Market Boxes",
        "Box Pile 1",
        "Box Pile 2",
        "Box Pile 3",
        "Box Pile 4",
        "Wooden Fence 1",
        "Wooden Fence 2",
        "Wooden Fence 3",
        "Cobblestone Fence",
        "Cobblestone Fence 2",
        "Long Cobblestone Fence",
        "Wood Pile",
        "Wooden Planks",
        "Firewood",
        "Bed 1",
        "Bed 2",
        "Table 1",
        "Table 2",
        "Table 3",
        "Round Table",
        "Large Tents",
        "Tent",
        "Campfire",
        "Posted Lantern",
    },
}
u298["Clothing Givers"] = {
    Contains = {"Parka Giver", "Cloak Giver", "Tailor Stand"},
}
local v3 = {
    Contains = {
        "Musket",
        "Flintlock",
        "Sabres",
        "Handcuffs",
        "Compass",
        "Spyglass",
        "Bandages",
        "Lantern",
        "Axe",
        "Pickaxe",
        "Hammer",
        "Cell Keys",
        "Cannonball",
    },
}
local v4 = {}
v4["*"] = {Slider = NumberRange.new(0, 100)}
v3.Properties = v4
u298["Item Givers"] = v3
v3 = {
    Contains = {"Gear Spawner", "Gas Tank", "Blade Box"},
}
v4 = {}
v4["Gas Tank"] = {Slider = NumberRange.new(0, 40000)}
v4["Blade Box"] = {Slider = NumberRange.new(0, 100)}
v3.Properties = v4
u298["Gear Givers"] = v3
v3 = {
    Contains = {
        "Transport Cart",
        "Blade Cart",
        "Gas Cart",
        "Trap Cart",
        "Resupply Cart",
        "Resupply Cart v2",
        "Blank Cart",
        "Repair Cart",
        "Barrel Cart",
        "Supply Cart",
    },
}
v4 = {}
v4["Blade Cart"] = {Slider = NumberRange.new(0, 100)}
v4["Gas Cart"] = {Slider = NumberRange.new(0, 40000)}
v4["Resupply Cart"] = {Slider = NumberRange.new(0, 40000)}
v4["Resupply Cart v2"] = {Slider = NumberRange.new(0, 80000)}
v4["Supply Cart"] = {Slider = NumberRange.new(0, 100)}
v3.Properties = v4
u298["Cart Spawner"] = v3
v3 = {}
v4 = {"Large Iceburst Crystal", "Marley Blimp", "Titania Blimp", "Pamphlet"}
v3.Contains = v4
u298["Lore Team"] = v3
return react.memo(function() -- Line: 161 -- upvalues: useOrder (val), useEditorTools (val), useEditorEnabled (val), react (val), useStore (val), Administration (val), Permissions (val), u298 (val), UserPlacementHandler (val), Dropdown (val), Divider (val), Slider (val), Container (val)
    local u10, u14, u15, u9
    local v1 = useOrder()
    local u3 = useEditorTools()
    local u5 = useEditorEnabled()
    u9, u10 = react.useState("World Building")
    u14, u15 = react.useState("Civilian Crowd")
    local u19 = react.useRef(50)
    local v2 = useStore(Administration.Store, function(p1) -- Line: 174
        return p1
    end)
    local u31 = v2
    if u31 then
        u31 = Permissions.Roles.Writer <= v2.permission
    end
    local u42 = react.useCallback(function(p1) -- Line: 181 -- upvalues: u298 (upval), u9 (val), u14 (val), Administration (upval), u19 (val), UserPlacementHandler (upval)
        local Properties = u298[u9].Properties
        if Properties then
            if not (u298[u9].Properties[u14]) then
                Properties = u298[u9].Properties["*"]
                if Properties then
                    Properties = u298[u9].Properties["*"].Slider
                end
            else
                Properties = u298[u9].Properties[u14].Slider
            end
        end
        if u14 ~= "Pamphlet" then
            local current
            local unreliablePost = Administration.Prop.unreliablePost
            local Pivot = p1:GetPivot()
            if not Properties then
                current = nil
            else
                current = u19.current
                if not current then
                    current = nil
                end
            end
            unreliablePost(Pivot, u9, u14, current)
        else
            Administration.Pamphlet.unreliablePost(p1:GetPivot())
        end
        UserPlacementHandler.onSuccessfulPlacement()
    end, {u9, u14, u19.current})
    local v3 = {}
    local v4 = if u3 == "Prop" then u5 else false
    v3[1] = v4
    v3[2] = u9
    v3[3] = u14
    react.useEffect(function() -- Line: 207 -- upvalues: u5 (val), u3 (val), UserPlacementHandler (upval), u9 (val), u14 (val), u42 (val)
        if not u5 or u3 ~= "Prop" then
            return
        end
        local v1 = UserPlacementHandler.getModelFromAssets((("Placeables/%*/%*"):format(u9, u14)))
        if not v1 and u9 == "Item Givers" then
            v1 = UserPlacementHandler.getModelFromAssets("Placeables/Item Givers/Default")
        end
        if not v1 then
            return warn((("Could not find model for category %* and contains %*"):format(u9, u14)))
        end
        UserPlacementHandler.setPropSettings(UserPlacementHandler.Presets.WireframeBox)
        local u39 = UserPlacementHandler.onBeginModelPlacement(v1):Connect(u42)
        return function() -- Line: 229 -- upvalues: UserPlacementHandler (upval), u39 (val)
            UserPlacementHandler.onEndModelPlacement()
            u39:Disconnect()
        end
    end, v3)
    local u66 = react.useCallback(function(p1) -- Line: 235 -- upvalues: u19 (val)
        u19.current = p1
    end, {u19})
    local v5 = react.useMemo(function() -- Line: 240 -- upvalues: u298 (upval), u31 (val)
        local v1 = {}
        for k, v in pairs(u298) do
            if k ~= "Lore Team" then
                table.insert(v1, k)
            elseif not u31 then
            end
        end
        table.sort(v1)
        return v1
    end, {u31})
    local v6 = {u9}
    local u80 = react.useMemo(function() -- Line: 254 -- upvalues: u9 (val), u298 (upval)
        if u9 == "" then
            return nil
        end
        if u298[u9] then
            return u298[u9]
        end
        return nil
    end, v6)
    v4 = react.useMemo(function() -- Line: 262 -- upvalues: u80 (val)
        if u80 then
            return u80.Contains
        end
        return {}
    end, {u80})
    if 0 >= #v4 then
        v6 = ""
    else
        v6 = v4[1]
    end
    local v7 = react.useMemo(function() -- Line: 273 -- upvalues: u14 (val), u80 (val)
        local Properties
        if u14 == "" or not u80 or not u80.Properties then
            return nil
        end
        Properties = u80.Properties
        if not (Properties[u14]) then
            if Properties["*"] then
                if Properties["*"].Slider then
                    return Properties["*"].Slider
                end
                return nil
            end
            return nil
        end
        if Properties[u14].Slider then
            return Properties[u14].Slider
        end
        if not (Properties["*"]) then
            return nil
        end
        if Properties["*"].Slider then
            return Properties["*"].Slider
        end
        return nil
    end, {u14, u80})
    local v8 = react.useCallback(function(p1) -- Line: 288 -- upvalues: u10 (val), u298 (upval), u15 (val), u66 (val)
        u10(p1)
        local v1 = u298[p1]
        if not v1 then
            u15("")
        elseif not v1.Contains then
            u15("")
        else
            local v2 = #v1.Contains
            if 0 >= v2 then
                u15("")
            else
                u15(v1.Contains[1])
            end
        end
        u66(50)
    end, {})
    local v9 = react.useCallback(function(p1) -- Line: 300 -- upvalues: u15 (val), u66 (val)
        u15(p1)
        u66(50)
    end, {})
    local v10 = react.useCallback(function(p1) -- Line: 305 -- upvalues: u66 (val)
        u66(p1)
    end, {})
    local v11 = {Category = react.createElement(Dropdown, {
        Header = "Category",
        Default = "World Building",
        Width = 130,
        Divider = 150,
        Options = v5,
        Changed = v8,
        Native = {ZIndex = 4, LayoutOrder = v1()},
    })}
    if u9 ~= "" and 0 < #v4 then
        v11["Contains" .. u9] = react.createElement(Dropdown, {
            Header = "Selection",
            Width = 130,
            Divider = 150,
            Default = v6,
            Options = v4,
            Changed = v9,
            Native = {ZIndex = 3, LayoutOrder = v1()},
        })
    end
    if v7 then
        v11.Divider = react.createElement(Divider, {
            Size = 5,
            Native = {LayoutOrder = v1()},
        })
        v11.Slider = react.createElement(Slider, {
            Header = "Amount",
            Default = 50,
            Divider = 130,
            Range = v7,
            Changed = v10,
            Native = {LayoutOrder = v1()},
        })
    end
    local v12 = {Draggable = true, Layout = "Vertical", Spacing = 10, Position = UDim2.fromScale(0.1, 0.5)}
    local v13 = {}
    local v14 = u3 == "Prop"
    v13.Visible = v14
    v12.Native = v13
    return react.createElement(Container, v12, v11)
end)