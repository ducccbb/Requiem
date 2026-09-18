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
--           File: ReplicatedStorage.Client.Interfaces.Routes.Pages.Book.Book
--                               Dumped in 0.00100 seconds
--                          Bytecode version 9  |  4 functions

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
local Components = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Screen = Components:WaitForChild("Screen")
local DynamicPage = require(Screen:WaitForChild("DynamicPage"))
local Components_2 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Utilities = Components_2:WaitForChild("Utilities")
local TransparencyGroup = require(Utilities:WaitForChild("TransparencyGroup"))
local Components_3 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Primitives = Components_3:WaitForChild("Primitives")
local Frame = require(Primitives:WaitForChild("Frame"))
local Components_4 = v1.Parent.Parent.Parent.Parent:WaitForChild("Components")
local Utilities_2 = Components_4:WaitForChild("Utilities")
local Scaler = require(Utilities_2:WaitForChild("Scaler"))
local Render = require(v1.Parent:WaitForChild("Render"))
local Hooks = v1.Parent.Parent.Parent.Parent:WaitForChild("Hooks")
local useInterfaceState = require(Hooks:WaitForChild("useInterfaceState"))
return function() -- Line: 35 -- upvalues: useInterfaceState (val), react (val), Render (val), Frame (val), DynamicPage (val), TransparencyGroup (val), Scaler (val)
    local book_2
    _, book_2 = useInterfaceState("book")
    local v1 = book_2
    if not v1 then
        v1 = {visible = false}
    end
    local u7 = v1
    local u11 = react.useRef(nil)
    local u15 = react.useRef(nil)
    react.useEffect(function() -- Line: 42 -- upvalues: u11 (val), u7 (ref), Render (upval), u15 (val)
        local u11
        local current = u11.current
        if not current or not u7.content or u7.content == "" then
            return
        end
        u11 = Render.createBookFromCode(u7.content, current)
        u15.current = u11
        return function() -- Line: 53 -- upvalues: u11 (val)
            if u11 then
                u11.destroy()
            end
        end
    end, {u7.visible, u7.content})
    return react.createElement(Frame, {}, {Page = react.createElement(DynamicPage, {Enabled = u7.visible}), Group = react.createElement(TransparencyGroup, {
        ZIndex = 3,
        Enabled = u7.visible,
        Tween = TweenInfo.new(0.3),
        Delays = {Enabled = 0.2, Disabled = 0},
    }, {Scaler = react.createElement(Scaler, {
        Enabled = u7.visible,
        Delay = {Enabled = 0.2, Disabled = 0},
    }), Container = react.createElement("Frame", {
        BackgroundTransparency = 1,
        ref = u11,
        Size = UDim2.fromScale(1, 1),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
    })})})
end