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
--           File: ReplicatedStorage.Client.Interfaces.Routes.Screen.Watermark
--                              Dumped in 0.000436 seconds
--                          Bytecode version 9  |  5 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
return function() -- Line: 16 -- upvalues: react (val), Players (val)
    local u12, v1
    local v2 = workspace:GetAttribute("Watermark") == true
    v1, u12 = react.useState(v2)
    react.useEffect(function() -- Line: 19 -- upvalues: u12 (val)
        local function updateVisible() -- Line: 20 -- upvalues: u12 (upval)
            local v1 = workspace:GetAttribute("Watermark") == true
            u12(v1)
        end
        updateVisible()
        local AttributeChangedSignal = workspace:GetAttributeChangedSignal("Watermark")
        local u11 = AttributeChangedSignal:Connect(updateVisible)
        return function() -- Line: 28 -- upvalues: u11 (val)
            u11:Disconnect()
        end
    end, {})
    local v3 = {
        TextSize = 88,
        TextTransparency = 0.9,
        TextWrapped = true,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Rotation = -30,
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json"),
    }
    local v4 = "REQUIEM " .. string.upper(Players.LocalPlayer.Name) .. "   "
    v3.Text = v4:rep(300)
    v3.TextColor3 = Color3.fromRGB(255, 255, 255)
    v3.AnchorPoint = Vector2.new(0.5, 0.5)
    v3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    v3.BorderColor3 = Color3.fromRGB(0, 0, 0)
    v3.Position = UDim2.fromScale(0.5, 0.5)
    v3.Size = UDim2.fromScale(1.5, 1.8)
    v3.Visible = v1
    return react.createElement("TextLabel", v3)
end