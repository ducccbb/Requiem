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
--File: ReplicatedStorage.Packages._Index.jakeywastaken_smartbone-2@0.3.1.smartbone-2.Dependencies.Iris.widgets.Table
--                               Dumped in 0.00114 seconds
--                          Bytecode version 9  |  8 functions

require(script.Parent.Parent.Types)
return function(p1, p2) -- Line: 3
    local u2 = {}
    table.insert(p1._postCycleCallbacks, function() -- Line: 7 -- upvalues: u2 (val)
        local v1 = u2
        local v2 = nil
        local v3 = nil
        for i, j in v1, v2, v3 do
            j.RowColumnIndex = 0
        end
    end)
    local WidgetConstructor = p1.WidgetConstructor
    local v1 = {
        hasState = false,
        hasChildren = true,
        Args = {NumColumns = 1, RowBg = 2, BordersOuter = 3, BordersInner = 4},
        Events = {hovered = p2.EVENTS.hover(function(p1) -- Line: 23
            return p1.Instance
        end)},
        Generate = function(a1) -- Line: 27 -- upvalues: u2 (val), p1 (val), p2 (val)
            u2[a1.ID] = a1
            a1.InitialNumColumns = -1
            a1.RowColumnIndex = 0
            a1.ColumnInstances = {}
            a1.CellInstances = {}
            local Frame = Instance.new("Frame")
            Frame.Name = "Iris_Table"
            Frame.Size = UDim2.new(p1._config.ItemWidth, UDim.new(0, 0))
            Frame.AutomaticSize = Enum.AutomaticSize.Y
            Frame.BackgroundTransparency = 1
            Frame.BorderSizePixel = 0
            Frame.ZIndex = a1.ZIndex + 1024
            Frame.LayoutOrder = a1.ZIndex
            Frame.ClipsDescendants = true
            p2.UIListLayout(Frame, Enum.FillDirection.Horizontal, UDim.new(0, 0))
            p2.UIStroke(Frame, 1, p1._config.TableBorderStrongColor, p1._config.TableBorderStrongTransparency)
            return Frame
        end,
    }
    function v1.Update(a1) -- Line: 51 -- upvalues: p2 (val), p1 (val)
        local InitialNumColumns, v1, v2, v3
        local Instance = a1.Instance
        if a1.arguments.BordersOuter ~= false then
            Instance.UIStroke.Thickness = 1
        else
            Instance.UIStroke.Thickness = 0
        end
        if a1.InitialNumColumns == -1 then
            local Frame, v4
            if a1.arguments.NumColumns == nil then
                error("Iris.Table NumColumns argument is required", 5)
            end
            a1.InitialNumColumns = a1.arguments.NumColumns
            InitialNumColumns = a1.InitialNumColumns
            v2 = 1
            for i = 1, InitialNumColumns, v2 do
                v4 = a1.ZIndex + 1 + i
                Frame = Instance.new("Frame")
                Frame.Name = ("Column_%*"):format(i)
                Frame.Size = UDim2.new(1 / a1.InitialNumColumns, 0, 0, 0)
                Frame.AutomaticSize = Enum.AutomaticSize.Y
                Frame.BackgroundTransparency = 1
                Frame.BorderSizePixel = 0
                Frame.ZIndex = v4
                Frame.LayoutOrder = v4
                Frame.ClipsDescendants = true
                p2.UIListLayout(Frame, Enum.FillDirection.Vertical, UDim.new(0, 0))
                a1.ColumnInstances[i] = Frame
                Frame.Parent = Instance
            end
        elseif a1.arguments.NumColumns ~= a1.InitialNumColumns then
            error("Iris.Table NumColumns Argument must be static")
        end
        if a1.arguments.RowBg ~= false then
            local TableRowBgAltTransparency
            local CellInstances_2 = a1.CellInstances
            v2 = nil
            v3 = nil
            v1 = a1
            for j, k in CellInstances_2, v2, v3 do
                if math.ceil(j / v1.InitialNumColumns) % 2 ~= 0 then
                    TableRowBgAltTransparency = p1._config.TableRowBgTransparency
                else
                    TableRowBgAltTransparency = p1._config.TableRowBgAltTransparency
                end
                k.BackgroundTransparency = TableRowBgAltTransparency
            end
        else
            local CellInstances = a1.CellInstances
            v2 = nil
            v3 = nil
            for n, m in CellInstances, v2, v3 do
                m.BackgroundTransparency = 1
            end
            v1 = a1
        end
        if v1.arguments.BordersInner == false then
            local CellInstances_3 = v1.CellInstances
            v2 = nil
            v3 = nil
            for i7, i8 in CellInstances_3, v2, v3 do
                i8.UIStroke.Thickness = 0
            end
            return
        end
        local CellInstances_4 = v1.CellInstances
        v2 = nil
        v3 = nil
        for i5, i6 in CellInstances_4, v2, v3 do
            i6.UIStroke.Thickness = 0.5
        end
    end
    function v1.Discard(p1) -- Line: 113 -- upvalues: u2 (val)
        u2[p1.ID] = nil
        p1.Instance:Destroy()
    end
    function v1.ChildAdded(a1) -- Line: 117 -- upvalues: p2 (val), p1 (val)
        if a1.RowColumnIndex == 0 then
            a1.RowColumnIndex = 1
        end
        local v1 = a1.CellInstances[a1.RowColumnIndex]
        if v1 then
            return v1
        end
        local v2 = a1.ColumnInstances[(a1.RowColumnIndex - 1) % a1.InitialNumColumns + 1]
        local v3 = v2.ZIndex + a1.RowColumnIndex
        local Frame = Instance.new("Frame")
        Frame.Name = ("Cell_%*"):format(a1.RowColumnIndex)
        Frame.Size = UDim2.new(1, 0, 0, 0)
        Frame.AutomaticSize = Enum.AutomaticSize.Y
        Frame.BackgroundTransparency = 1
        Frame.BorderSizePixel = 0
        Frame.ZIndex = v3
        Frame.LayoutOrder = v3
        Frame.ClipsDescendants = true
        p2.UIPadding(Frame, p1._config.CellPadding)
        p2.UIListLayout(Frame, Enum.FillDirection.Vertical, UDim.new(0, p1._config.ItemSpacing.Y))
        if a1.arguments.BordersInner ~= false then
            p2.UIStroke(Frame, 0.5, p1._config.TableBorderLightColor, p1._config.TableBorderLightTransparency)
        else
            p2.UIStroke(Frame, 0, p1._config.TableBorderLightColor, p1._config.TableBorderLightTransparency)
        end
        if a1.arguments.RowBg ~= false then
            local TableRowBgAltColor, TableRowBgAltTransparency
            local v4 = math.ceil(a1.RowColumnIndex / a1.InitialNumColumns)
            if v4 % 2 ~= 0 then
                TableRowBgAltColor = p1._config.TableRowBgColor
            else
                TableRowBgAltColor = p1._config.TableRowBgAltColor
            end
            if v4 % 2 ~= 0 then
                TableRowBgAltTransparency = p1._config.TableRowBgTransparency
            else
                TableRowBgAltTransparency = p1._config.TableRowBgAltTransparency
            end
            Frame.BackgroundColor3 = TableRowBgAltColor
            Frame.BackgroundTransparency = TableRowBgAltTransparency
        end
        a1.CellInstances[a1.RowColumnIndex] = Frame
        Frame.Parent = v2
        return Frame
    end
    WidgetConstructor("Table", v1)
end