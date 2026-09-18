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
--                    File: ReplicatedStorage.Client.Interfaces.Error
--                              Dumped in 0.000398 seconds
--                          Bytecode version 9  |  7 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Packages_2 = ReplicatedStorage_2:WaitForChild("Packages")
local u41 = require(Packages_2:WaitForChild("react-boundary"))
local createElement = react.createElement
local function u43(p1) -- Line: 13 -- upvalues: react (val), createElement (val)
    local u5, v1
    v1, u5 = react.useState(true)
    react.useEffect(function() -- Line: 16 -- upvalues: p1 (val), u5 (val)
        print("[Requiem] Error Dump:")
        print(p1.error.name)
        print(p1.error.message)
        print(p1.error.stack)
        local u21 = task.delay(5, function() -- Line: 23 -- upvalues: u5 (upval)
            u5(false)
        end)
        return function() -- Line: 28 -- upvalues: u21 (val)
            task.cancel(u21)
        end
    end, {})
    return createElement("TextLabel", {
        BackgroundTransparency = 1,
        Text = "ERROR",
        TextScaled = true,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Size = UDim2.fromOffset(250, 30),
        Position = UDim2.fromScale(0.5, 0.5),
        TextColor3 = Color3.fromRGB(255, 0, 0),
        Visible = v1,
    })
end
return {
    Fallback = u43,
    Boundary = function(p1) -- Line: 45 -- upvalues: react (val), u41 (val), u43 (val)
        return react.createElement(u41.ErrorBoundary, {
            FallbackComponent = u43,
            onReset = function(p1) -- Line: 48
                warn("Boundary was reset:", p1)
            end,
        }, p1.children)
    end,
}