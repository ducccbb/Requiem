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
--File: ReplicatedStorage.Packages._Index.pyseph_packetprofiler@2.3.0.packetprofiler.Components.ChartResize
--                               Dumped in 0.00123 seconds
--                          Bytecode version 9  |  14 functions

local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local GuiService = game:GetService("GuiService")
local Packages = require(script.Parent.Parent.Modules.Packages)
local Roact = require(Packages.Directory.Roact)
local u30 = Roact.Component:extend("ChartResize")
function u30.init(p1) -- Line: 13 -- upvalues: Roact (val), Packages (val), UserInputService (val), RunService (val), GuiService (val)
    local v1, v2
    v1, v2 = Roact.createBinding(UDim2.fromOffset(650, 290))
    p1.Size = v1
    p1.SetSize = v2
    if not Packages.IsPlugin then
        v1 = {}
        p1.Connections = v1
        local MouseIcon = UserInputService.MouseIcon
        local u14 = nil
        local u15 = false
        local u16 = false
        local u17 = {SizeWE = "rbxassetid://18699453492", SizeNS = "rbxassetid://18700045701", SizeAll = "rbxassetid://18700129047"}
        function p1.AddIcon(p1) -- Line: 29 -- upvalues: u16 (ref), u15 (ref), MouseIcon (ref), UserInputService (upval), u17 (val)
            if u16 or u15 == p1 then
                return
            end
            if u15 == false then
                MouseIcon = UserInputService.MouseIcon
            end
            u15 = p1
            UserInputService.MouseIcon = u17[p1]
        end
        function p1.RemoveIcon() -- Line: 40 -- upvalues: u16 (ref), u15 (ref), UserInputService (upval), MouseIcon (ref)
            if u16 or not u15 then
                return
            end
            u15 = false
            UserInputService.MouseIcon = MouseIcon
        end
        function p1.SetSizeTarget(a1) -- Line: 50 -- upvalues: p1 (val), RunService (upval), GuiService (upval), UserInputService (upval), u15 (ref)
            if not a1 then
                return
            end
            local Connections = p1.Connections
            local v1 = nil
            local v2 = nil
            for i, j in Connections, v1, v2 do
                j:Disconnect()
            end
            table.clear(p1.Connections)
            table.insert(p1.Connections, RunService.RenderStepped:Connect(function() -- Line: 60 -- upvalues: GuiService (upval), UserInputService (upval), a1 (val), p1 (upval)
                local v1
                local GuiInset = GuiService:GetGuiInset()
                local MouseLocation = UserInputService:GetMouseLocation()
                local v2 = a1.AbsolutePosition + GuiInset
                local AbsoluteSize = a1.AbsoluteSize
                local v3 = v2.Y + AbsoluteSize.Y + 8
                local v4 = v2.X + AbsoluteSize.X
                local v5 = if MouseLocation.X >= v2.X - 8 then if v4 >= MouseLocation.X then if MouseLocation.Y >= v2.Y then v3 < MouseLocation.Y else true else true else true
                if v5 then
                    p1.RemoveIcon()
                    return
                end
                local v6 = if v3 - 8 < MouseLocation.Y then MouseLocation.Y < v3 + 8 else false
                local v7 = if MouseLocation.X < v2.X + 8 then v2.X - 8 < MouseLocation.X else false
                if v6 then
                    if not v6 then
                        v1 = "SizeWE"
                    elseif not v7 then
                        v1 = "SizeNS"
                    else
                        v1 = "SizeAll"
                    end
                    p1.AddIcon(v1)
                    return
                end
                if not v7 then
                    p1.RemoveIcon()
                    return
                end
                if not v6 then
                    v1 = "SizeWE"
                elseif not v7 then
                    v1 = "SizeNS"
                else
                    v1 = "SizeAll"
                end
                p1.AddIcon(v1)
            end))
            table.insert(p1.Connections, UserInputService.InputBegan:Connect(function(a1) -- Line: 87 -- upvalues: u15 (upval), p1 (upval)
                if a1.UserInputType == Enum.UserInputType.MouseButton1 and u15 then
                    p1.StartResizing()
                end
            end))
            table.insert(p1.Connections, UserInputService.InputEnded:Connect(function(a1) -- Line: 92 -- upvalues: p1 (upval)
                if a1.UserInputType == Enum.UserInputType.MouseButton1 then
                    p1.StopResizing()
                end
            end))
        end
        function p1.StartResizing() -- Line: 99 -- upvalues: u16 (ref), p1 (val), UserInputService (upval), u14 (ref), RunService (upval), u15 (ref)
            if u16 then
                return
            end
            u16 = true
            local u6 = p1.Size:getValue()
            local MouseLocation = UserInputService:GetMouseLocation()
            local u14 = Vector2.new(MouseLocation.X, MouseLocation.Y)
            u14 = RunService.RenderStepped:Connect(function() -- Line: 110 -- upvalues: UserInputService (upval), u14 (val), u15 (upval), u6 (val), p1 (upval)
                local MouseLocation = UserInputService:GetMouseLocation()
                local v1 = MouseLocation - u14
                if u15 == "SizeNS" then
                    v1 = v1 * Vector2.new(0, 1)
                elseif u15 == "SizeWE" then
                    v1 = v1 * Vector2.new(1, 0)
                end
                local v2 = math.max(u6.X.Offset - v1.X, 300)
                local v3 = u6.Y.Offset + v1.Y
                local v4 = UDim2.fromOffset(v2, (math.max(v3, 100)))
                p1.SetSize(v4)
            end)
        end
        function p1.StopResizing() -- Line: 126 -- upvalues: u16 (ref), p1 (val), u14 (ref)
            if not u16 then
                return
            end
            u16 = false
            p1.RemoveIcon()
            u14:Disconnect()
            u14 = nil
        end
    end
end
function u30.render(p1) -- Line: 140 -- upvalues: Roact (val)
    return Roact.oneChild(p1.props[Roact.Children])({
        UISize = p1.Size,
        StartResizing = p1.StartResizing,
        StopResizing = p1.StopResizing,
        AddIcon = p1.AddIcon,
        RemoveIcon = p1.RemoveIcon,
        SetSizeTarget = p1.SetSizeTarget,
    })
end
function u30.willUnmount(p1) -- Line: 152
    local Connections
    if p1.StopResizing then
        p1.StopResizing()
    end
    if p1.Connections then
        Connections = p1.Connections
        local v1 = nil
        local v2 = nil
        for i, j in Connections, v1, v2 do
            j:Disconnect()
        end
        table.clear(p1.Connections)
    end
end
return function(p1) -- Line: 166 -- upvalues: Roact (val), u30 (val)
    return Roact.createElement(u30, {}, {PacketChart = p1})
end