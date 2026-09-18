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
--File: ReplicatedStorage.Packages._Index.jakeywastaken_smartbone-2@0.3.1.smartbone-2.Dependencies.Iris.API
--                               Dumped in 0.00120 seconds
--                          Bytecode version 9  |  11 functions

require(script.Parent.Types)
return function(p1) -- Line: 3
    local function wrapper(a1) -- Line: 5 -- upvalues: p1 (val)
        return function(a1_2, p2) -- Line: 6 -- upvalues: p1 (upval), a1 (val)
            return p1.Internal._Insert(a1, a1_2, p2)
        end
    end
    local u2 = "Window"
    function p1.Window(a1, p2) -- Line: 6 -- upvalues: p1 (val), u2 (val)
        return p1.Internal._Insert(u2, a1, p2)
    end
    p1.SetFocusedWindow = p1.Internal.SetFocusedWindow
    local u6 = "Tooltip"
    function p1.Tooltip(a1, p2) -- Line: 6 -- upvalues: p1 (val), u6 (val)
        return p1.Internal._Insert(u6, a1, p2)
    end
    local u8 = "MenuBar"
    function p1.MenuBar(a1, p2) -- Line: 6 -- upvalues: p1 (val), u8 (val)
        return p1.Internal._Insert(u8, a1, p2)
    end
    local u10 = "Menu"
    function p1.Menu(a1, p2) -- Line: 6 -- upvalues: p1 (val), u10 (val)
        return p1.Internal._Insert(u10, a1, p2)
    end
    local u12 = "MenuItem"
    function p1.MenuItem(a1, p2) -- Line: 6 -- upvalues: p1 (val), u12 (val)
        return p1.Internal._Insert(u12, a1, p2)
    end
    local u14 = "MenuToggle"
    function p1.MenuToggle(a1, p2) -- Line: 6 -- upvalues: p1 (val), u14 (val)
        return p1.Internal._Insert(u14, a1, p2)
    end
    local u16 = "Separator"
    function p1.Separator(a1, p2) -- Line: 6 -- upvalues: p1 (val), u16 (val)
        return p1.Internal._Insert(u16, a1, p2)
    end
    local u18 = "Indent"
    function p1.Indent(a1, p2) -- Line: 6 -- upvalues: p1 (val), u18 (val)
        return p1.Internal._Insert(u18, a1, p2)
    end
    local u20 = "SameLine"
    function p1.SameLine(a1, p2) -- Line: 6 -- upvalues: p1 (val), u20 (val)
        return p1.Internal._Insert(u20, a1, p2)
    end
    local u22 = "Group"
    function p1.Group(a1, p2) -- Line: 6 -- upvalues: p1 (val), u22 (val)
        return p1.Internal._Insert(u22, a1, p2)
    end
    local u24 = "Text"
    function p1.Text(a1, p2) -- Line: 6 -- upvalues: p1 (val), u24 (val)
        return p1.Internal._Insert(u24, a1, p2)
    end
    function p1.TextWrapped(a1) -- Line: 41 -- upvalues: p1 (val)
        a1[2] = true
        return p1.Internal._Insert("Text", a1)
    end
    function p1.TextColored(a1) -- Line: 46 -- upvalues: p1 (val)
        a1[3] = a1[2]
        a1[2] = nil
        return p1.Internal._Insert("Text", a1)
    end
    local u28 = "SeparatorText"
    function p1.SeparatorText(a1, p2) -- Line: 6 -- upvalues: p1 (val), u28 (val)
        return p1.Internal._Insert(u28, a1, p2)
    end
    local u30 = "InputText"
    function p1.InputText(a1, p2) -- Line: 6 -- upvalues: p1 (val), u30 (val)
        return p1.Internal._Insert(u30, a1, p2)
    end
    local u32 = "Button"
    function p1.Button(a1, p2) -- Line: 6 -- upvalues: p1 (val), u32 (val)
        return p1.Internal._Insert(u32, a1, p2)
    end
    local u34 = "SmallButton"
    function p1.SmallButton(a1, p2) -- Line: 6 -- upvalues: p1 (val), u34 (val)
        return p1.Internal._Insert(u34, a1, p2)
    end
    local u36 = "Checkbox"
    function p1.Checkbox(a1, p2) -- Line: 6 -- upvalues: p1 (val), u36 (val)
        return p1.Internal._Insert(u36, a1, p2)
    end
    local u38 = "RadioButton"
    function p1.RadioButton(a1, p2) -- Line: 6 -- upvalues: p1 (val), u38 (val)
        return p1.Internal._Insert(u38, a1, p2)
    end
    local u40 = "Tree"
    function p1.Tree(a1, p2) -- Line: 6 -- upvalues: p1 (val), u40 (val)
        return p1.Internal._Insert(u40, a1, p2)
    end
    local u42 = "CollapsingHeader"
    function p1.CollapsingHeader(a1, p2) -- Line: 6 -- upvalues: p1 (val), u42 (val)
        return p1.Internal._Insert(u42, a1, p2)
    end
    local u44 = "InputNum"
    function p1.InputNum(a1, p2) -- Line: 6 -- upvalues: p1 (val), u44 (val)
        return p1.Internal._Insert(u44, a1, p2)
    end
    local u46 = "InputVector2"
    function p1.InputVector2(a1, p2) -- Line: 6 -- upvalues: p1 (val), u46 (val)
        return p1.Internal._Insert(u46, a1, p2)
    end
    local u48 = "InputVector3"
    function p1.InputVector3(a1, p2) -- Line: 6 -- upvalues: p1 (val), u48 (val)
        return p1.Internal._Insert(u48, a1, p2)
    end
    local u50 = "InputUDim"
    function p1.InputUDim(a1, p2) -- Line: 6 -- upvalues: p1 (val), u50 (val)
        return p1.Internal._Insert(u50, a1, p2)
    end
    local u52 = "InputUDim2"
    function p1.InputUDim2(a1, p2) -- Line: 6 -- upvalues: p1 (val), u52 (val)
        return p1.Internal._Insert(u52, a1, p2)
    end
    local u54 = "InputRect"
    function p1.InputRect(a1, p2) -- Line: 6 -- upvalues: p1 (val), u54 (val)
        return p1.Internal._Insert(u54, a1, p2)
    end
    local u56 = "DragNum"
    function p1.DragNum(a1, p2) -- Line: 6 -- upvalues: p1 (val), u56 (val)
        return p1.Internal._Insert(u56, a1, p2)
    end
    local u58 = "DragVector2"
    function p1.DragVector2(a1, p2) -- Line: 6 -- upvalues: p1 (val), u58 (val)
        return p1.Internal._Insert(u58, a1, p2)
    end
    local u60 = "DragVector3"
    function p1.DragVector3(a1, p2) -- Line: 6 -- upvalues: p1 (val), u60 (val)
        return p1.Internal._Insert(u60, a1, p2)
    end
    local u62 = "DragUDim"
    function p1.DragUDim(a1, p2) -- Line: 6 -- upvalues: p1 (val), u62 (val)
        return p1.Internal._Insert(u62, a1, p2)
    end
    local u64 = "DragUDim2"
    function p1.DragUDim2(a1, p2) -- Line: 6 -- upvalues: p1 (val), u64 (val)
        return p1.Internal._Insert(u64, a1, p2)
    end
    local u66 = "DragRect"
    function p1.DragRect(a1, p2) -- Line: 6 -- upvalues: p1 (val), u66 (val)
        return p1.Internal._Insert(u66, a1, p2)
    end
    local u68 = "InputColor3"
    function p1.InputColor3(a1, p2) -- Line: 6 -- upvalues: p1 (val), u68 (val)
        return p1.Internal._Insert(u68, a1, p2)
    end
    local u70 = "InputColor4"
    function p1.InputColor4(a1, p2) -- Line: 6 -- upvalues: p1 (val), u70 (val)
        return p1.Internal._Insert(u70, a1, p2)
    end
    local u72 = "SliderNum"
    function p1.SliderNum(a1, p2) -- Line: 6 -- upvalues: p1 (val), u72 (val)
        return p1.Internal._Insert(u72, a1, p2)
    end
    local u74 = "SliderVector2"
    function p1.SliderVector2(a1, p2) -- Line: 6 -- upvalues: p1 (val), u74 (val)
        return p1.Internal._Insert(u74, a1, p2)
    end
    local u76 = "SliderVector3"
    function p1.SliderVector3(a1, p2) -- Line: 6 -- upvalues: p1 (val), u76 (val)
        return p1.Internal._Insert(u76, a1, p2)
    end
    local u78 = "SliderUDim"
    function p1.SliderUDim(a1, p2) -- Line: 6 -- upvalues: p1 (val), u78 (val)
        return p1.Internal._Insert(u78, a1, p2)
    end
    local u80 = "SliderUDim2"
    function p1.SliderUDim2(a1, p2) -- Line: 6 -- upvalues: p1 (val), u80 (val)
        return p1.Internal._Insert(u80, a1, p2)
    end
    local u82 = "SliderRect"
    function p1.SliderRect(a1, p2) -- Line: 6 -- upvalues: p1 (val), u82 (val)
        return p1.Internal._Insert(u82, a1, p2)
    end
    local u84 = "Selectable"
    function p1.Selectable(a1, p2) -- Line: 6 -- upvalues: p1 (val), u84 (val)
        return p1.Internal._Insert(u84, a1, p2)
    end
    local u86 = "Combo"
    function p1.Combo(a1, p2) -- Line: 6 -- upvalues: p1 (val), u86 (val)
        return p1.Internal._Insert(u86, a1, p2)
    end
    function p1.ComboArray(a1, p2, p3) -- Line: 112 -- upvalues: p1 (val)
        local v1
        if p2 ~= nil then
            v1 = p2
        else
            v1 = p1.State(p3[1])
        end
        local v2 = p1.Internal._Insert("Combo", a1, v1)
        local v3 = p3
        local v4 = nil
        local v5 = nil
        for i, j in v3, v4, v5 do
            p1.Internal._Insert("Selectable", {j, j}, {index = v2.state.index})
        end
        p1.End()
        return v2
    end
    function p1.ComboEnum(a1, p2, p3) -- Line: 129 -- upvalues: p1 (val)
        local v1
        if p2 ~= nil then
            v1 = p2
        else
            v1 = p1.State(p3[1])
        end
        local v2 = p1.Internal._Insert("Combo", a1, v1)
        for i, j in p3:GetEnumItems() do
            p1.Internal._Insert("Selectable", {j.Name, j}, {index = v2.state.index})
        end
        p1.End()
        return v2
    end
    p1.InputEnum = p1.ComboEnum
    local u91 = "Table"
    function p1.Table(a1, p2) -- Line: 6 -- upvalues: p1 (val), u91 (val)
        return p1.Internal._Insert(u91, a1, p2)
    end
    function p1.NextColumn() -- Line: 149 -- upvalues: p1 (val)
        local v1 = p1.Internal._GetParentWidget()
        v1.RowColumnIndex = v1.RowColumnIndex + 1
    end
    function p1.SetColumnIndex(a1) -- Line: 153 -- upvalues: p1 (val)
        local v1 = p1.Internal._GetParentWidget()
        local v2 = v1.InitialNumColumns <= a1
        assert(v2, "Iris.SetColumnIndex Argument must be in column range")
        v2 = math.floor(v1.RowColumnIndex / v1.InitialNumColumns)
        v1.RowColumnIndex = v2 + (a1 - 1)
    end
    function p1.NextRow() -- Line: 159 -- upvalues: p1 (val)
        local v1 = p1.Internal._GetParentWidget()
        local InitialNumColumns = v1.InitialNumColumns
        v1.RowColumnIndex = math.floor((v1.RowColumnIndex + 1) / InitialNumColumns) * InitialNumColumns
    end
end