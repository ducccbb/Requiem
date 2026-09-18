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
-- File: ReplicatedStorage.Client.Interfaces.Routes.Pages.Crafting.Subpages.CraftingPage
--                              Dumped in 0.000785 seconds
--                          Bytecode version 9  |  4 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
require(Namespaces:WaitForChild("Inventory"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Promise = require(Common_2:WaitForChild("Promise"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_3:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage_4:WaitForChild("Client")
local Interfaces = Client:WaitForChild("Interfaces")
local Components = Interfaces:WaitForChild("Components")
local Primitives = Components:WaitForChild("Primitives")
local Frame = require(Primitives:WaitForChild("Frame"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Client_2 = ReplicatedStorage_5:WaitForChild("Client")
local Interfaces_2 = Client_2:WaitForChild("Interfaces")
local Components_2 = Interfaces_2:WaitForChild("Components")
local Universal = Components_2:WaitForChild("Universal")
local Progress = require(Universal:WaitForChild("Progress"))
local ReplicatedStorage_6 = game:GetService("ReplicatedStorage")
local Client_3 = ReplicatedStorage_6:WaitForChild("Client")
local Interfaces_3 = Client_3:WaitForChild("Interfaces")
local Components_3 = Interfaces_3:WaitForChild("Components")
local Primitives_2 = Components_3:WaitForChild("Primitives")
local VerticalListLayout = require(Primitives_2:WaitForChild("VerticalListLayout"))
local ReplicatedStorage_7 = game:GetService("ReplicatedStorage")
local Client_4 = ReplicatedStorage_7:WaitForChild("Client")
local Interfaces_4 = Client_4:WaitForChild("Interfaces")
local Hooks = Interfaces_4:WaitForChild("Hooks")
local useAsyncEffect = require(Hooks:WaitForChild("useAsyncEffect"))
local ReplicatedStorage_8 = game:GetService("ReplicatedStorage")
local Client_5 = ReplicatedStorage_8:WaitForChild("Client")
local Interfaces_5 = Client_5:WaitForChild("Interfaces")
local Hooks_2 = Interfaces_5:WaitForChild("Hooks")
local useMotion = require(Hooks_2:WaitForChild("useMotion"))
local ReplicatedStorage_9 = game:GetService("ReplicatedStorage")
local Client_6 = ReplicatedStorage_9:WaitForChild("Client")
local Interfaces_6 = Client_6:WaitForChild("Interfaces")
local Hooks_3 = Interfaces_6:WaitForChild("Hooks")
local useOrder = require(Hooks_3:WaitForChild("useOrder"))
local ReplicatedStorage_10 = game:GetService("ReplicatedStorage")
local Client_7 = ReplicatedStorage_10:WaitForChild("Client")
local Interfaces_7 = Client_7:WaitForChild("Interfaces")
local Hooks_4 = Interfaces_7:WaitForChild("Hooks")
local useRem = require(Hooks_4:WaitForChild("useRem"))
return function(p1) -- Line: 38 -- upvalues: useRem (val), useOrder (val), useMotion (val), useAsyncEffect (val), Promise (val), react (val), Frame (val), VerticalListLayout (val), Progress (val)
    local results, u8, v1
    local v2 = useOrder()
    v1, u8 = useMotion(0)
    useAsyncEffect(function() -- Line: 44 -- upvalues: p1 (val), u8 (val), Promise (upval)
        if not p1.Recipe or not p1.Enabled then
            return
        end
        u8:immediate(0)
        u8:linear(1, {speed = 1 / p1.Recipe.speed})
        return Promise.delay(p1.Recipe.speed):andThen(function() -- Line: 54 -- upvalues: p1 (upval)
            p1.Completed(true)
        end)
    end, {p1.Enabled, p1.Recipe, p1.Recipe})
    local createElement = react.createElement
    local v3 = {Visible = p1.Enabled}
    local v4 = {Layout = react.createElement(VerticalListLayout, {VerticalAlignment = Enum.VerticalAlignment.Top, Spacing = useRem()(10)})}
    local createElement_2 = react.createElement
    local v5 = {Body = "Crafting your item...", Enabled = true}
    if not p1.Recipe then
        results = ""
    else
        results = p1.Recipe.results
        if not results then
            results = ""
        end
    end
    v5.Header = "Crafting " .. results
    v5.Value = v1
    v5.Native = {LayoutOrder = v2()}
    v4.Progress = createElement_2(Progress, v5)
    return createElement(Frame, v3, v4)
end