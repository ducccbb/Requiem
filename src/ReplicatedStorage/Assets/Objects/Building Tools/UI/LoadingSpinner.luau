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
--        File: ReplicatedStorage.Assets.Objects.Building Tools.UI.LoadingSpinner
--                              Dumped in 0.000353 seconds
--                          Bytecode version 9  |  6 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Parent = script.Parent.Parent
local Libraries = Parent:WaitForChild("Libraries")
local Vendor = Parent:WaitForChild("Vendor")
local UI = Parent:WaitForChild("UI")
local SupportLibrary = require(Libraries:WaitForChild("SupportLibrary"))
local Roact = require(Vendor:WaitForChild("Roact"))
local createElement = Roact.createElement
local ImageLabel = require(UI:WaitForChild("ImageLabel"))
local v2 = Roact.PureComponent:extend("LoadingSpinner")
function v2.init(p1) -- Line: 24 -- upvalues: Roact (val)
    p1.instance = Roact.createRef()
end
function v2.didMount(p1) -- Line: 28
    coroutine.wrap(function() -- Line: 29 -- upvalues: p1 (val)
        local current
        p1.Running = true
        while p1.Running do
            if not p1.instance.current then
                break
            end
            current = p1.instance.current
            current.Rotation = (current.Rotation + 12) % 360
            wait(0.01)
        end
    end)()
end
function v2.willUnmount(p1) -- Line: 39
    p1.Running = nil
end
function v2.render(p1) -- Line: 43 -- upvalues: SupportLibrary (val), Roact (val), createElement (val), ImageLabel (val)
    local props = p1.props
    if not props then
        props = {}
    end
    local v1 = {}
    v1[Roact.Ref] = p1.instance
    v1.Image = "rbxassetid://1932255814"
    v1.AspectRatio = 1
    local v2 = SupportLibrary.Merge({}, props, v1)
    return createElement(ImageLabel, v2)
end
return v2