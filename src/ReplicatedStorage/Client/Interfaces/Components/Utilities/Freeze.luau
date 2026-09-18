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
--         File: ReplicatedStorage.Client.Interfaces.Components.Utilities.Freeze
--                              Dumped in 0.000289 seconds
--                          Bytecode version 9  |  4 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local createElement = react.createElement
local u28 = {
    andThen = function() end,
}
local function Suspender(p1) -- Line: 15 -- upvalues: u28 (val), createElement (val), react (val)
    if not p1.freeze then
        return createElement(react.Fragment, nil, p1.children)
    end
    error(u28)
end
return table.freeze({
    Freeze = function(p1) -- Line: 32 -- upvalues: createElement (val), react (val), Suspender (val)
        local v1 = {}
        local placeholder = p1.placeholder
        if not placeholder then
            placeholder = createElement(react.Fragment)
        end
        v1.fallback = placeholder
        return createElement(react.Suspense, v1, {Suspender = createElement(Suspender, {freeze = p1.freeze}, p1.children)})
    end,
})