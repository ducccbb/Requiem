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
--File: ReplicatedStorage.Packages._Index.pyseph_packetprofiler@2.3.0.packetprofiler.Components.TopbarButton
--                              Dumped in 0.000251 seconds
--                          Bytecode version 9  |  2 functions

local Packages = require(script.Parent.Parent.Modules.Packages)
local Roact = require(Packages.Directory.Roact)
return function(p1) -- Line: 9 -- upvalues: Roact (val)
    local v1
    local createElement = Roact.createElement
    local v2 = {AutoLocalize = false}
    if p1.Theme.Name ~= "Light" then
        v1 = Color3.new(1, 1, 1)
    else
        v1 = Color3.new(0, 0, 0)
        if not v1 then
            v1 = Color3.new(1, 1, 1)
        end
    end
    v2.TextColor3 = v1
    v2.Size = UDim2.fromOffset(0, 10)
    v2.BackgroundColor3 = p1.Theme:GetColor("Item")
    v2.TextSize = 11
    v2.BorderSizePixel = 0
    v2.Font = Enum.Font.Code
    v2.Text = p1.Text
    v2.AutomaticSize = Enum.AutomaticSize.X
    v2.TextXAlignment = Enum.TextXAlignment.Left
    v2.TextYAlignment = Enum.TextYAlignment.Center
    v2.LayoutOrder = p1.LayoutOrder
    v2[Roact.Event.Activated] = p1.OnClick
    return createElement("TextButton", v2)
end