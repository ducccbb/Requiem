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
-- File: ReplicatedStorage.Client.Interfaces.Components.Universal.CustomizationViewport
--                               Dumped in 0.00489 seconds
--                          Bytecode version 9  |  14 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Administration = require(Namespaces:WaitForChild("Administration"))
local Accessories = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Accessories")
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Utilities = Common_2:WaitForChild("Utilities")
local Character = require(Utilities:WaitForChild("Character"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Utilities_2 = Common_3:WaitForChild("Utilities")
local Customization = require(Utilities_2:WaitForChild("Customization"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_5:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_6:WaitForChild("Common")
local Utilities_3 = Common_4:WaitForChild("Utilities")
local Table = require(Utilities_3:WaitForChild("Table"))
local Editor = v1.Parent.Parent:WaitForChild("Editor")
local Universal = Editor:WaitForChild("Universal")
local Checkbox = require(Universal:WaitForChild("Checkbox"))
local Utilities_4 = v1.Parent.Parent:WaitForChild("Utilities")
local FillProps = require(Utilities_4:WaitForChild("FillProps"))
local Hooks = v1.Parent.Parent.Parent:WaitForChild("Hooks")
local useRem = require(Hooks:WaitForChild("useRem"))
return function(p1) -- Line: 76 -- upvalues: react (val), useRem (val), ReplicatedStorage (val), Customization (val), Administration (val), Table (val), Accessories (val), Character (val), FillProps (val), Checkbox (val)
    local u36, u37, u41, v1
    local u4 = react.useRef(nil)
    local u8 = react.useRef(nil)
    local u12 = react.useRef(nil)
    local u16 = react.useRef(nil)
    local u20 = react.useRef(nil)
    local v2 = {}
    local u24 = react.useRef(v2)
    local u28 = react.useRef(false)
    local u32 = react.useRef({})
    u36, u37 = react.useState(false)
    u41, v1 = react.useState(false)
    local v3 = useRem()
    react.useEffect(function() -- Line: 91 -- upvalues: u4 (val), u16 (val), ReplicatedStorage (upval), u20 (val), u12 (val), Customization (upval), u8 (val), u37 (val), u28 (val), u24 (val)
        if not u4.current then
            return
        end
        local Camera = Instance.new("Camera")
        u16.current = Camera
        local WorldModel = Instance.new("WorldModel")
        WorldModel.Parent = u4.current
        u4.current.CurrentCamera = Camera
        local v1 = ReplicatedStorage.Assets.Characters.Blank:Clone()
        v1.Parent = WorldModel
        local HumanoidRootPart = v1:FindFirstChild("HumanoidRootPart")
        u20.current = HumanoidRootPart
        local v2 = HumanoidRootPart.CFrame * CFrame.new(0, 0.35, -4.5)
        local v3 = math.rad(5)
        local v4 = math.rad(180)
        Camera.CFrame = v2 * CFrame.Angles(v3, v4, 0)
        u12.current = Customization.createFacePanel(v1)
        u8.current = v1
        u37(true)
        return function() -- Line: 115 -- upvalues: u8 (upval), u12 (upval), u20 (upval), u28 (upval), u24 (upval), u37 (upval), WorldModel (val), Camera (val)
            u8.current = nil
            u12.current = nil
            u20.current = nil
            u28.current = false
            u24.current = {}
            u37(false)
            WorldModel:Destroy()
            Camera:Destroy()
        end
    end, {})
    react.useEffect(function() -- Line: 130 -- upvalues: u36 (val), u8 (val), u12 (val), Customization (upval), p1 (val)
        if not u36 or not u8.current or not u12.current then
            return
        end
        Customization.updateFacePanel(u12.current, {
            Eyes = {
                Color = {R = math.floor(p1.EyeColor.R), G = math.floor(p1.EyeColor.G), B = math.floor(p1.EyeColor.B)},
                Frame = tonumber(p1.Frame) or 1,
                Type = tonumber(p1.Eyes) or 1,
            },
            Mouth = tonumber(p1.Mouth) or 1,
            Eyebrow = tonumber(p1.Eyebrows) or 1,
            Burns = tonumber(p1.Burns) or 1,
            Freckles = tonumber(p1.Freckles) or 1,
            Moles = tonumber(p1.Moles) or 1,
            Scars = tonumber(p1.Scars) or 1,
        })
    end, {
        u36,
        p1.Eyes,
        p1.Mouth,
        p1.Eyebrows,
        p1.EyeColor,
        p1.Scars,
        p1.Burns,
        p1.Freckles,
        p1.Moles,
        p1.Frame,
    })
    react.useEffect(function() -- Line: 171 -- upvalues: u36 (val), u8 (val), p1 (val), Customization (upval)
        local v1, v2, v3, v4, v5, v6
        if not u36 or not u8.current or not p1.Shirt or not p1.Pants then
            return
        end
        if p1.BranchId == nil then
            v5, v6 = Customization.getShirtFromName(p1.Shirt)
            v1 = v5
            v2 = v6
            v5, v6 = Customization.getPantsFromName(p1.Pants)
            v3 = v5
            v4 = v6
        else
            v5, v6 = Customization.getShirtFromNameForBranch(p1.Shirt, p1.BranchId)
            v1 = v5
            v2 = v6
            v5, v6 = Customization.getPantsFromNameForBranch(p1.Pants, p1.BranchId)
            v3 = v5
            v4 = v6
        end
        if not v1 or not v2 or not v3 or not v4 then
            return
        end
        Customization.updateOutfit(u8.current, {
            Shirt = {Category = v1, Name = v2},
            Pants = {Category = v3, Name = v4},
        })
    end, {u36, p1.Shirt, p1.Pants, p1.BranchId})
    react.useEffect(function() -- Line: 197 -- upvalues: p1 (val), u36 (val), u8 (val), Administration (upval), u24 (val), u28 (val), Table (upval)
        local Accessories, current, v1, v2
        if p1.AccessorySource ~= "Marketplace" or not u36 or not u8.current or not p1.Accessories then
            return
        end
        if #p1.Accessories == 0 then
            Administration.Accessory.post(nil)
            u24.current = {}
            u28.current = true
            return
        end
        if not u28.current then
            u28.current = true
            u24.current = p1.Accessories
            Accessories = p1.Accessories
            v1 = nil
            v2 = nil
            for k, n in Accessories, v1, v2 do
                if typeof(n) == "number" then
                    Administration.Accessory.post(n)
                end
            end
            return
        end
        current = u24.current
        if not current then
            current = {}
        end
        local v3 = Table.diff(p1.Accessories, current)
        u24.current = p1.Accessories
        v1 = v3
        v2 = nil
        local v4 = nil
        for i, j in v1, v2, v4 do
            if typeof(j) == "number" then
                Administration.Accessory.post(j)
            end
        end
    end, {u36, p1.AccessorySource, p1.Accessories})
    local u89 = react.useCallback(function() -- Line: 236 -- upvalues: u8 (val), p1 (val), u32 (val), Table (upval), Customization (upval)
        local current, v1
        if not u8.current then
            return
        end
        local v2 = {}
        for i, j in u8.current:GetDescendants() do
            if j:IsA("Model") then
                if j:GetAttribute("CustomizationAccessory") == true then
                    table.insert(v2, j)
                end
            elseif not (j:IsA("Folder")) then
            end
        end
        if not p1.UseHairColor then
            Customization.restoreAccessoryTextures(u32.current)
            return
        end
        current = u32.current
        if not current then
            current = {}
        end
        local v3 = u32
        local merge = Table.merge
        local updateAccessoryColors = Customization.updateAccessoryColors
        if not p1.UseHairColor then
            v1 = Color3.fromRGB(255, 255, 255)
        elseif not p1.HairColor then
            v1 = Color3.fromRGB(255, 255, 255)
        else
            v1 = Color3.fromRGB(p1.HairColor.R, p1.HairColor.G, p1.HairColor.B)
            if not v1 then
                v1 = Color3.fromRGB(255, 255, 255)
            end
        end
        local v4 = updateAccessoryColors(v2, v1)
        v3.current = merge(v4, current)
    end, {u36, p1.UseHairColor, p1.HairColor})
    react.useEffect(function() -- Line: 270 -- upvalues: u36 (val), u8 (val), u89 (val)
        if not u36 or not u8.current then
            return
        end
        u89()
    end, {u36, p1.UseHairColor, p1.HairColor, u89})
    react.useEffect(function() -- Line: 279 -- upvalues: p1 (val), u36 (val), u8 (val), Administration (upval), Customization (upval), u89 (val)
        if p1.AccessorySource ~= "Marketplace" or not u36 or not u8.current then
            return
        end
        return (Administration.Accessory.listen(function(p1) -- Line: 288 -- upvalues: u8 (upval), Customization (upval), u89 (upval)
    local v1, v2
    if u8.current then
        v1 = p1:Clone()
        Customization.addAccessoryToViewportFrameRig(u8.current, v1)
        u89()
        return
    else
        return
    end
end))
    end, {u36, p1.AccessorySource, u89})
    react.useEffect(function() -- Line: 302 -- upvalues: p1 (val), u36 (val), u8 (val), Customization (upval), u89 (val)
        if p1.AccessorySource ~= "Marketplace" or not u36 or not u8.current or not p1.Accessories then
            return
        end
        if #p1.Accessories == 0 then
            Customization.clearCharacterAccessories(u8.current)
            u89()
        end
    end, {u36, p1.AccessorySource, p1.Accessories, u89})
    react.useEffect(function() -- Line: 318 -- upvalues: p1 (val), u36 (val), u8 (val), Customization (upval), Accessories (upval), Character (upval), u89 (val)
        local v1, v2, v3
        if p1.AccessorySource ~= "Local" or not u36 or not u8.current or not p1.Accessories then
            return
        end
        Customization.clearCharacterAccessories(u8.current)
        local Accessories_2 = p1.Accessories
        local v4 = nil
        local v5 = nil
        for i, j in Accessories_2, v4, v5 do
            if j ~= nil and j ~= "" then
                v1 = Accessories:FindFirstChild(j)
                if v1 then
                    v2 = v1:Clone()
                    if not (v2:IsA("Model")) then
                        Customization.addAccessoryToViewportFrameRig(u8.current, v2)
                    else
                        v2:ScaleTo(u8.current:GetScale())
                        v3 = Character.attachRigModelToCharacter(u8.current, v2)
                        if v3 then
                            v3:SetAttribute("CustomizationAccessory", true)
                        end
                    end
                end
            end
        end
        u89()
    end, {u36, p1.AccessorySource, p1.Accessories, u89})
    react.useEffect(function() -- Line: 355 -- upvalues: u4 (val), u16 (val), u20 (val), u41 (val)
        local current, v1, v2
        if not u4.current or not u16.current then
            return
        end
        current = u20.current
        if not current then
            return
        end
        if u41 then
            v1 = current.CFrame * CFrame.new(0, 1.5, -1.5)
            v2 = math.rad(180)
            u16.current.CFrame = v1 * CFrame.Angles(0, v2, 0)
            return
        end
        v1 = current.CFrame * CFrame.new(0, 0.35, -4.5)
        local v3 = math.rad(5)
        v2 = math.rad(180)
        u16.current.CFrame = v1 * CFrame.Angles(v3, v2, 0)
    end, {
        u4,
        u16,
        u41,
        u20,
        u36,
    })
    local Native = p1.Native
    if not Native then
        Native = {}
    end
    local v4 = {BackgroundTransparency = 0.8}
    local v5 = v3(320)
    v4.Size = UDim2.fromOffset(v5, v3(320))
    v4.AnchorPoint = Vector2.new(0.5, 0.5)
    v4.Position = UDim2.fromScale(0.5, 0.4)
    v4.ImageColor3 = Color3.fromRGB(255, 255, 255)
    v4.Ambient = Color3.fromRGB(255, 255, 255)
    v4.LightDirection = Vector3.new(8, 4, 0)
    v4.LightColor = Color3.fromRGB(255, 255, 255)
    v4.ref = u4
    local v6 = FillProps(Native, v4)
    return react.createElement("ViewportFrame", v6, {Corner = react.createElement("UICorner", {CornerRadius = UDim.new(0, 5)}), Stroke = react.createElement("UIStroke", {Thickness = 1, Color = Color3.fromRGB(60, 60, 60), Enabled = not p1.Strokeless}), FaceView = react.createElement(Checkbox, {
        Default = false,
        Label = "Face View",
        Toggled = v1,
        Native = {AnchorPoint = Vector2.new(0, 0), Position = UDim2.fromOffset(15, 15)},
    })})
end