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
--    File: ReplicatedStorage.Client.Interfaces.Components.Utilities.Space3D.Surface
--                              Dumped in 0.000809 seconds
--                          Bytecode version 9  |  9 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Packages_2 = ReplicatedStorage_2:WaitForChild("Packages")
local u41 = require(Packages_2:WaitForChild("react-roblox"))
local FillProps = require(v1.Parent.Parent:WaitForChild("FillProps"))
local Provider = require(v1.Parent.Provider)
require(v1.Parent.Types)
return function(p1) -- Line: 33 -- upvalues: react (val), Provider (val), FillProps (val), u41 (val)
    local u9, v1
    local u5 = react.useContext(Provider.Context)
    u9, v1 = react.useState(nil)
    local u14 = react.useRef(nil)
    local u19 = react.useMemo(function() -- Line: 38
        local Frame = Instance.new("Frame")
        Frame.Name = "Space3DHost"
        Frame.BackgroundTransparency = 1
        Frame.BorderSizePixel = 0
        Frame.Size = UDim2.fromScale(1, 1)
        return Frame
    end, {})
    local u22 = p1.Enabled ~= false
    local u26 = p1.Compat == true
    local u31 = react.useRef(p1.OnComponent)
    u31.current = p1.OnComponent
    local function bindComponent(a1) -- Line: 52 -- upvalues: u14 (val), p1 (val), u31 (val)
        u14.current = a1
        if a1 and p1.Offset then
            a1.offset = p1.Offset
        end
        if u31.current then
            u31.current(a1)
        end
    end
    react.useEffect(function() -- Line: 62 -- upvalues: u5 (val), u9 (val), u19 (val), bindComponent (val), u22 (val), u26 (val), u14 (val)
        local u23
        if not u5 or not u9 then
            return
        end
        u19.Parent = u9
        u19.Size = UDim2.fromScale(1, 1)
        u19.Position = UDim2.fromScale(0.5, 0.5)
        u19.AnchorPoint = Vector2.new(0.5, 0.5)
        local u45 = u5.getComponent(u19)
        if not u45 then
            u23 = false
            task.defer(function() -- Line: 76 -- upvalues: u23 (ref), u19 (upval), u9 (upval), u5 (upval), bindComponent (upval), u22 (upval), u26 (upval)
                if u23 or u19.Parent ~= u9 then
                    return
                end
                local v1 = u5.getComponent(u19)
                if not v1 or u23 then
                    return
                end
                bindComponent(v1)
                if not u22 then
                    v1:Disable()
                    return
                end
                if u26 then
                    v1:EnableCompatibility()
                    return
                end
                v1:Enable()
            end)
            return function() -- Line: 99 -- upvalues: u23 (ref), u14 (upval), bindComponent (upval)
                u23 = true
                local current = u14.current
                if current then
                    current:Disable()
                    bindComponent(nil)
                end
            end
        end
        bindComponent(u45)
        u23 = u22
        if not u23 then
            u45:Disable()
        else
            u23 = u26
            if not u23 then
                u45:Enable()
            else
                u45:EnableCompatibility()
            end
        end
        function u23() -- Line: 121 -- upvalues: u45 (val), bindComponent (upval)
            u45:Disable()
            bindComponent(nil)
        end
        return u23
    end, {
        u5,
        u9,
        u19,
        u22,
        u26,
    })
    local v2 = {p1.Offset}
    react.useEffect(function() -- Line: 127 -- upvalues: u14 (val), p1 (val)
        local current = u14.current
        if current and p1.Offset then
            current.offset = p1.Offset
        end
    end, v2)
    if not u5 then
        warn("[Space3D] Surface must be used inside Space3D.Provider")
        local Native = p1.Native
        if not Native then
            Native = {}
        end
        v2 = FillProps(Native, {BackgroundTransparency = 1})
        return react.createElement("Frame", v2, p1.children)
    end
    local v3 = {}
    local Native_2 = p1.Native
    if not Native_2 then
        Native_2 = {}
    end
    v3.Anchor = react.createElement("Frame", FillProps(Native_2, {BackgroundTransparency = 1, BorderSizePixel = 0, ref = v1}))
    local v4 = react.createElement(react.Fragment, {}, p1.children)
    v3.Portal = u41.createPortal(v4, u19)
    return react.createElement(react.Fragment, {}, v3)
end