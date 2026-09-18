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
--            File: ReplicatedStorage.Client.Interfaces.Routes.Screen.Console
--                              Dumped in 0.000655 seconds
--                          Bytecode version 9  |  6 functions

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
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Signals = require(Common:WaitForChild("Signals"))
return function() -- Line: 28 -- upvalues: react (val), Signals (val)
    local u4, v1, v2
    local v3 = {}
    v1, u4 = react.useState(v3)
    local v4 = {}
    react.useEffect(function() -- Line: 31 -- upvalues: Signals (upval), u4 (val)
        local u5 = Signals.Console:Connect(function(p1) -- Line: 32 -- upvalues: u4 (upval)
            if type(p1) ~= "table" or type(p1.message) ~= "string" then
                return
            end
            local v1 = tostring(os.clock())
            local u19 = v1 .. "-" .. tostring(math.random(1, 100000))
            u4(function(a1) -- Line: 39 -- upvalues: u19 (val), p1 (val)
                local v1 = table.clone(a1)
                local v2 = {id = u19, message = p1.message}
                local color = p1.color
                if not color then
                    color = Color3.fromRGB(255, 255, 255)
                end
                v2.color = color
                table.insert(v1, v2)
                while 50 < #v1 do
                    table.remove(v1, 1)
                end
                return v1
            end)
        end)
        return function() -- Line: 55 -- upvalues: u5 (val)
            u5:Disconnect()
        end
    end, v4)
    v2 = {Layout = react.createElement("UIListLayout", {Padding = UDim.new(0, 2), SortOrder = Enum.SortOrder.LayoutOrder, VerticalAlignment = Enum.VerticalAlignment.Center})}
    for i, v in ipairs(v1) do
        v2[v.id] = react.createElement("TextLabel", {
            TextSize = 14,
            BackgroundTransparency = 0,
            BorderSizePixel = 0,
            FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json"),
            Text = v.message,
            TextColor3 = v.color,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextYAlignment = Enum.TextYAlignment.Center,
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
            AutomaticSize = Enum.AutomaticSize.XY,
            LayoutOrder = i,
        }, {Padding = react.createElement("UIPadding", {PaddingLeft = UDim.new(0, 4), PaddingRight = UDim.new(0, 4), PaddingTop = UDim.new(0, 2), PaddingBottom = UDim.new(0, 2)})})
    end
    local v5 = {BackgroundTransparency = 1, BorderSizePixel = 0, AnchorPoint = Vector2.new(0, 0.5)}
    local v6 = UDim2.fromOffset(12, 0)
    v5.Position = v6 + UDim2.fromScale(0, 0.5)
    v5.AutomaticSize = Enum.AutomaticSize.XY
    v5.Size = UDim2.fromOffset(0, 0)
    return react.createElement("Frame", v5, v2)
end