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
--        File: ReplicatedStorage.Client.Interfaces.Components.Primitives.Hitbox
--                              Dumped in 0.000256 seconds
--                          Bytecode version 9  |  2 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local Utilities = script.Parent.Parent:WaitForChild("Utilities")
local FillProps = require(Utilities:WaitForChild("FillProps"))
return react.memo(function(p1) -- Line: 27 -- upvalues: react (val), FillProps (val)
    local Native = p1.Native
    if not Native then
        Native = {}
    end
    local v1 = {
        TextTransparency = 1,
        Text = "",
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        AutoButtonColor = false,
        Visible = p1.Enabled,
    }
    v1[react.Event.MouseButton1Click] = p1.Clicked
    return react.createElement("TextButton", FillProps(Native, v1))
end)