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
--    File: ReplicatedStorage.Client.Interfaces.Routes.Editor.Staff.Pages.Destruction
--                               Dumped in 0.00283 seconds
--                          Bytecode version 9  |  31 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local CollectionService = game:GetService("CollectionService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Administration = require(Namespaces:WaitForChild("Administration"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_2:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_3:WaitForChild("Client")
local User = Client:WaitForChild("User")
local Editor = User:WaitForChild("Editor")
local Universal = Editor:WaitForChild("Universal")
local HoverSelect = require(Universal:WaitForChild("HoverSelect"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_4:WaitForChild("Client")
local User_2 = Client_2:WaitForChild("User")
local Editor_2 = User_2:WaitForChild("Editor")
local Universal_2 = Editor_2:WaitForChild("Universal")
local UserDestructionHandler = require(Universal_2:WaitForChild("UserDestructionHandler"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_5:WaitForChild("Client")
local User_3 = Client_3:WaitForChild("User")
local Editor_3 = User_3:WaitForChild("Editor")
local Universal_3 = Editor_3:WaitForChild("Universal")
local UserPlacementHandler = require(Universal_3:WaitForChild("UserPlacementHandler"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_6:WaitForChild("Client")
local Interfaces = Client_4:WaitForChild("Interfaces")
local Components = Interfaces:WaitForChild("Components")
local Inputs = Components:WaitForChild("Inputs")
local Button = require(Inputs:WaitForChild("Button"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Client_5 = ReplicatedStorage_7:WaitForChild("Client")
local Interfaces_2 = Client_5:WaitForChild("Interfaces")
local Components_2 = Interfaces_2:WaitForChild("Components")
local Editor_4 = Components_2:WaitForChild("Editor")
local Universal_4 = Editor_4:WaitForChild("Universal")
local Container = require(Universal_4:WaitForChild("Container"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Client_6 = ReplicatedStorage_8:WaitForChild("Client")
local Interfaces_3 = Client_6:WaitForChild("Interfaces")
local Components_3 = Interfaces_3:WaitForChild("Components")
local Editor_5 = Components_3:WaitForChild("Editor")
local Universal_5 = Editor_5:WaitForChild("Universal")
local Dropdown = require(Universal_5:WaitForChild("Dropdown"))
local Hooks = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useEditorEnabled = require(Hooks:WaitForChild("useEditorEnabled"))
local Hooks_2 = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useEditorTools = require(Hooks_2:WaitForChild("useEditorTools"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Client_7 = ReplicatedStorage_9:WaitForChild("Client")
local Interfaces_4 = Client_7:WaitForChild("Interfaces")
local Hooks_3 = Interfaces_4:WaitForChild("Hooks")
local useOrder = require(Hooks_3:WaitForChild("useOrder"))
local function getWorkspaceBlimps() -- Line: 44 -- upvalues: CollectionService (val)
    local v1 = {}
    for i, j in CollectionService:GetTagged("Blimp") do
        if j:IsA("Model") and j:IsDescendantOf(workspace) then
            table.insert(v1, j)
        end
    end
    table.sort(v1, function(p1, p2) -- Line: 53
        local FullName = p1:GetFullName()
        local v1 = FullName < p2:GetFullName()
        return v1
    end)
    return v1
end
local function buildBlimpDropdownState() -- Line: 64 -- upvalues: getWorkspaceBlimps (val)
    local v1
    local v2 = getWorkspaceBlimps()
    local v3 = {}
    local v4 = {}
    if #v2 == 0 then
        return {"No Blimps"}, v4
    end
    local v5 = v2
    local v6 = nil
    local v7 = nil
    for i, j in v5, v6, v7 do
        v1 = ("%* (%*)"):format(j.Name, i)
        v4[v1] = j
        table.insert(v3, v1)
    end
    return v3, v4
end
return react.memo(function() -- Line: 84 -- upvalues: useOrder (val), useEditorTools (val), useEditorEnabled (val), react (val), Administration (val), buildBlimpDropdownState (val), CollectionService (val), UserDestructionHandler (val), HoverSelect (val), UserPlacementHandler (val), Container (val), Dropdown (val), Button (val)
    local Delete, Delete_2, u14, u15, u22, u27, u31, u32, v1, v2
    local v3 = useOrder()
    local u3 = useEditorTools()
    local u5 = useEditorEnabled()
    Delete, Delete_2 = react.useState("Delete")
    u14, u15 = react.useState(nil)
    local function setSelectedOre(p1) -- Line: 92 -- upvalues: u15 (val)
        u15(p1)
    end
    v2, u22 = react.useState({"No Blimps"})
    v1, u27 = react.useState("No Blimps")
    u31, u32 = react.useState(nil)
    local u36 = react.useRef({})
    local u40 = react.useRef(nil)
    u40.current = u31
    local u45 = react.useCallback(function(p1) -- Line: 103 -- upvalues: Administration (upval)
        Administration.Destroy.unreliablePost(p1)
    end, {})
    local u50 = react.useCallback(function(p1) -- Line: 107 -- upvalues: Administration (upval)
        if not p1 then
            return
        end
        Administration.CrashBlimp.unreliablePost(p1)
    end, {})
    local u55 = react.useCallback(function() -- Line: 115 -- upvalues: buildBlimpDropdownState (upval), u22 (val), u36 (val), u40 (val), u27 (val), u32 (val)
        local v1, v2, v3
        v1, v2 = buildBlimpDropdownState()
        u22(v1)
        u36.current = v2
        local current = u40.current
        if not current or not current.Parent or not (current:IsDescendantOf(workspace)) then
            v3 = v1[1]
            if v3 then
                if v3 ~= "No Blimps" then
                    u27(v3)
                    u32(v2[v3])
                    return
                end
                u27("No Blimps")
                u32(nil)
                return
            end
            u27("No Blimps")
            u32(nil)
            return
        end
        v3 = v2
        local v4 = nil
        local v5 = nil
        for i, j in v3, v4, v5 do
            if j == current then
                u27(i)
                u32(j)
                return
            end
        end
        v3 = v1[1]
        if not v3 then
            u27("No Blimps")
            u32(nil)
            return
        end
        if v3 ~= "No Blimps" then
            u27(v3)
            u32(v2[v3])
            return
        end
        u27("No Blimps")
        u32(nil)
    end, {})
    local v4 = {}
    local v5 = Delete == "Artillery"
    v4[1] = v5
    v4[2] = u55
    react.useEffect(function() -- Line: 143 -- upvalues: Delete (val), u32 (val), u55 (val), CollectionService (upval)
        if Delete ~= "Artillery" then
            u32(nil)
            return
        end
        u55()
        local InstanceAddedSignal = CollectionService:GetInstanceAddedSignal("Blimp")
        local u14 = InstanceAddedSignal:Connect(u55)
        local InstanceRemovedSignal = CollectionService:GetInstanceRemovedSignal("Blimp")
        local u23 = InstanceRemovedSignal:Connect(u55)
        return function() -- Line: 154 -- upvalues: u14 (val), u23 (val), u32 (upval)
            u14:Disconnect()
            u23:Disconnect()
            u32(nil)
        end
    end, v4)
    v4 = {}
    v5 = false
    if u3 == "Destruction" then
        v5 = u5
        if v5 then
            v5 = Delete == "Artillery"
        end
    end
    v4[1] = v5
    v4[2] = u31
    react.useEffect(function() -- Line: 161 -- upvalues: u5 (val), u3 (val), Delete (val), u31 (val)
        if not u5 or u3 ~= "Destruction" or Delete ~= "Artillery" then
            return
        end
        local Highlight = Instance.new("Highlight")
        Highlight.FillTransparency = 1
        Highlight.OutlineTransparency = 0
        Highlight.OutlineColor = Color3.fromRGB(25, 153, 255)
        if u31 and u31.Parent then
            Highlight.Parent = u31
            Highlight.Adornee = u31
        end
        return function() -- Line: 176 -- upvalues: Highlight (val)
            Highlight:Destroy()
        end
    end, v4)
    v4 = {}
    v5 = false
    if u3 == "Destruction" then
        v5 = u5
        if v5 then
            v5 = Delete == "Delete"
        end
    end
    v4[1] = v5
    v4[2] = Delete
    react.useEffect(function() -- Line: 182 -- upvalues: u5 (val), u3 (val), Delete (val), UserDestructionHandler (upval), u45 (val)
        if not u5 or u3 ~= "Destruction" or Delete ~= "Delete" then
            return
        end
        local u9 = UserDestructionHandler.onBeginModelDestruction():Connect(u45)
        return function() -- Line: 190 -- upvalues: UserDestructionHandler (upval), u9 (val)
            UserDestructionHandler.onEndModelDestruction()
            u9:Disconnect()
        end
    end, v4)
    v4 = {}
    v5 = false
    if u3 == "Destruction" then
        v5 = u5
        if v5 then
            v5 = Delete == "Crash"
        end
    end
    v4[1] = v5
    v4[2] = Delete
    v4[3] = u50
    react.useEffect(function() -- Line: 197 -- upvalues: u5 (val), u3 (val), Delete (val), HoverSelect (upval), u50 (val)
        if not u5 or u3 ~= "Destruction" or Delete ~= "Crash" then
            return
        end
        return HoverSelect({
            tag = "Blimp",
            accept = function(p1) -- Line: 204
                return p1:IsDescendantOf(workspace)
            end,
            hoverOutlineColor = Color3.fromRGB(255, 200, 100),
            selectOutlineColor = Color3.fromRGB(255, 120, 0),
            onSelectedChanged = u50,
        })
    end, v4)
    v4 = {}
    v5 = false
    if u3 == "Destruction" then
        v5 = u5
        if v5 then
            v5 = Delete == "Explosion"
        end
    end
    v4[1] = v5
    v4[2] = Delete
    react.useEffect(function() -- Line: 214 -- upvalues: u5 (val), u3 (val), Delete (val), UserPlacementHandler (upval), Administration (upval)
        if not u5 or u3 ~= "Destruction" or Delete ~= "Explosion" then
            return
        end
        UserPlacementHandler.setPropSettings(UserPlacementHandler.Presets.WireframeSphere)
        local v1 = UserPlacementHandler.getModelFromAssets("Particles/Explosion")
        if not v1 then
            return warn("Could not find model for goal point")
        end
        local u23 = UserPlacementHandler.onBeginModelPlacement(v1):Connect(function(p1) -- Line: 227 -- upvalues: Administration (upval)
            local v1 = p1:GetPivot().Position - Vector3.new(0, 40, 0)
            Administration.Explosion.unreliablePost(v1)
        end)
        return function() -- Line: 232 -- upvalues: UserPlacementHandler (upval), u23 (val)
            UserPlacementHandler.onEndModelPlacement()
            u23:Disconnect()
        end
    end, v4)
    v4 = {}
    v5 = false
    if u3 == "Destruction" then
        v5 = u5
        if v5 then
            v5 = Delete == "Artillery"
        end
    end
    v4[1] = v5
    v4[2] = Delete
    react.useEffect(function() -- Line: 239 -- upvalues: u5 (val), u3 (val), Delete (val), UserPlacementHandler (upval), u40 (val), Administration (upval)
        if not u5 or u3 ~= "Destruction" or Delete ~= "Artillery" then
            return
        end
        UserPlacementHandler.setPropSettings(UserPlacementHandler.Presets.WireframeSphere)
        local v1 = UserPlacementHandler.getModelFromAssets("Particles/Explosion")
        if not v1 then
            return warn("Could not find model for goal point")
        end
        local u23 = UserPlacementHandler.onBeginModelPlacement(v1):Connect(function(p1) -- Line: 252 -- upvalues: u40 (upval), Administration (upval)
            local current = u40.current
            if not current or not current.Parent then
                return warn("[Destruction] Select a blimp before firing artillery")
            end
            local v1 = p1:GetPivot().Position - Vector3.new(0, 40, 0)
            Administration.Explosion.unreliablePost(v1, {
                fullDamageRadius = 0,
                falloffEndRadius = 60,
                maxDamage = 200,
                damageDelay = 0.1,
                titanNapeDamageMultiplier = 20,
                damageShifters = true,
                artillery = true,
                artilleryBlimp = current,
            })
        end)
        return function() -- Line: 274 -- upvalues: UserPlacementHandler (upval), u23 (val)
            UserPlacementHandler.onEndModelPlacement()
            u23:Disconnect()
        end
    end, v4)
    v4 = {}
    v5 = false
    if u3 == "Destruction" then
        v5 = u5
        if v5 then
            v5 = Delete == "Fire"
        end
    end
    v4[1] = v5
    v4[2] = Delete
    react.useEffect(function() -- Line: 281 -- upvalues: u5 (val), u3 (val), Delete (val), UserPlacementHandler (upval), Administration (upval)
        if not u5 or u3 ~= "Destruction" or Delete ~= "Fire" then
            return
        end
        local v1 = UserPlacementHandler.getModelFromAssets("Objects/Fire")
        if not v1 then
            return warn("Could not find model for fire placement")
        end
        UserPlacementHandler.setPropSettings(UserPlacementHandler.Presets.WireframeBox)
        local u23 = UserPlacementHandler.onBeginModelPlacement(v1):Connect(function(p1) -- Line: 293 -- upvalues: Administration (upval), UserPlacementHandler (upval)
            Administration.Fire.unreliablePost(p1:GetPivot())
            UserPlacementHandler.onSuccessfulPlacement()
        end)
        return function() -- Line: 298 -- upvalues: UserPlacementHandler (upval), u23 (val)
            UserPlacementHandler.onEndModelPlacement()
            u23:Disconnect()
        end
    end, v4)
    v4 = {}
    v5 = false
    if u3 == "Destruction" then
        v5 = u5
        if v5 then
            v5 = Delete == "Trigger"
        end
    end
    v4[1] = v5
    v4[2] = Delete
    react.useEffect(function() -- Line: 305 -- upvalues: u5 (val), u3 (val), Delete (val), HoverSelect (upval), setSelectedOre (val)
        if not u5 or u3 ~= "Destruction" or Delete ~= "Trigger" then
            return
        end
        local v1 = {tag = "Ore"}
        function v1.accept(p1) -- Line: 312
            local v1 = string.find(p1.Name, "Iceburst") ~= nil
            return v1
        end
        v1.hoverOutlineColor = Color3.fromRGB(255, 255, 255)
        v1.selectOutlineColor = Color3.fromRGB(230, 36, 36)
        v1.onSelectedChanged = setSelectedOre
        return HoverSelect(v1)
    end, v4)
    v4 = {Draggable = true, Layout = "Vertical", Spacing = 10, Position = UDim2.fromScale(0.1, 0.5)}
    v5 = {}
    local v6 = u3 == "Destruction"
    v5.Visible = v6
    v4.Native = v5
    v5 = {Variant = react.createElement(Dropdown, {
        Header = "Variant",
        Default = "Delete",
        Divider = 150,
        Width = 120,
        Options = {
            "Delete",
            "Crash",
            "Explosion",
            "Artillery",
            "Fire",
            "Trigger",
        },
        Changed = function(p1) -- Line: 338 -- upvalues: Delete_2 (val)
            Delete_2(p1)
        end,
        Native = {LayoutOrder = v3()},
    })}
    local v7 = {
        Header = "Blimp",
        Divider = 150,
        Width = 120,
        Default = v1,
        Options = v2,
        Changed = function(p1) -- Line: 352 -- upvalues: u27 (val), u36 (val), u32 (val)
            u27(p1)
            u32(u36.current[p1])
        end,
    }
    local v8 = {LayoutOrder = v3()}
    local v9 = Delete == "Artillery"
    v8.Visible = v9
    v7.Native = v8
    v5.Blimp = react.createElement(Dropdown, v7)
    v7 = {Text = "Explode Selected Ore", Type = 4, Height = 24}
    v8 = u14 == nil
    v7.Disabled = v8
    v8 = Delete == "Trigger"
    v7.Visible = v8
    v7.Native = {LayoutOrder = v3()}
    function v7.Clicked() -- Line: 374 -- upvalues: u14 (val), setSelectedOre (val), Administration (upval)
        if not u14 then
            return
        end
        if not u14.Parent then
            setSelectedOre(nil)
            return
        end
        Administration.Explosion.unreliablePost(u14:GetPivot().Position, {fullDamageRadius = 50, maxDamage = 100, damageDelay = 0.1})
    end
    v5.ExplodeSelected = react.createElement(Button, v7)
    return react.createElement(Container, v4, v5)
end)