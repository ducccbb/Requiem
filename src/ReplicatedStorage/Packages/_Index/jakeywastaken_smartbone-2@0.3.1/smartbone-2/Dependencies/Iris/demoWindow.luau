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
--File: ReplicatedStorage.Packages._Index.jakeywastaken_smartbone-2@0.3.1.smartbone-2.Dependencies.Iris.demoWindow
--                               Dumped in 0.00649 seconds
--                          Bytecode version 9  |  32 functions

require(script.Parent.Types)
return function(p1) -- Line: 3
    local recursiveMenu, recursiveTree, recursiveWindow
    local u3 = p1.State(true)
    local u6 = p1.State(false)
    local u9 = p1.State(false)
    local u12 = p1.State(false)
    local u15 = p1.State(false)
    local u18 = p1.State(false)
    local function helpMarker(a1) -- Line: 12 -- upvalues: p1 (val)
        p1.PushConfig({TextColor = p1._config.TextDisabledColor})
        local v1 = p1.Text({"(?)"})
        p1.PopConfig()
        p1.PushConfig({ContentWidth = UDim.new(0, 350)})
        if v1.hovered() then
            p1.Tooltip({a1})
        end
        p1.PopConfig()
    end
    local u20 = {
        Basic = function() -- Line: 26 -- upvalues: p1 (val)
            p1.Tree({"Basic"})
            p1.SeparatorText({"Basic"})
            local v1 = p1.State(1)
            p1.Button({"Button"})
            p1.SmallButton({"SmallButton"})
            p1.Text({"Text"})
            p1.TextWrapped({string.rep("Text Wrapped ", 5)})
            p1.TextColored({"Colored Text", Color3.fromRGB(255, 128, 0)})
            p1.Text({"Rich Text: <b>bold text</b> <i>italic text</i> <u>underline text</u> <s>strikethrough text</s> <font color= \"rgb(240, 40, 10)\">red text</font> <font size=\"32\">bigger text</font>", true, nil, true})
            p1.SameLine()
            p1.RadioButton({"Index '1'", 1}, {index = v1})
            p1.RadioButton({"Index 'two'", "two"}, {index = v1})
            local v2 = {"Index 'false'", false}
            local v3 = {index = v1}
            if p1.RadioButton(v2, v3).active() == false then
                v2 = {"Select last"}
                if p1.SmallButton(v2).clicked() then
                    v1:set(false)
                end
            end
            p1.End()
            p1.Text({"The Index is: " .. tostring(v1.value)})
            p1.SeparatorText({"Inputs"})
            p1.InputNum({})
            p1.DragNum({})
            p1.SliderNum({})
            p1.End()
        end,
        Tree = function() -- Line: 57 -- upvalues: p1 (val), helpMarker (val)
            p1.Tree({"Trees"})
            local v1 = {"Tree using SpanAvailWidth"}
            v1[p1.Args.Tree.SpanAvailWidth] = true
            p1.Tree(v1)
            helpMarker("SpanAvailWidth determines if the Tree is selectable from its entire with, or only the text area")
            p1.End()
            local v2 = p1.Tree({"Tree with Children"})
            p1.Text({"Im inside the first tree!"})
            p1.Button({"Im a button inside the first tree!"})
            p1.Tree({"Im a tree inside the first tree!"})
            p1.Text({"I am the innermost text!"})
            p1.End()
            p1.End()
            p1.Checkbox({"Toggle above tree"}, {isChecked = v2.state.isUncollapsed})
            p1.End()
        end,
        CollapsingHeader = function() -- Line: 76 -- upvalues: p1 (val)
            p1.Tree({"Collapsing Headers"})
            p1.CollapsingHeader({"A header"})
            p1.Text({"This is under the first header!"})
            p1.End()
            local v1 = p1.State(true)
            p1.CollapsingHeader({"Another header"}, {isUncollapsed = v1})
            local v2 = {"Shhh... secret button!"}
            if p1.Button(v2).clicked() then
                v1:set(true)
            end
            p1.End()
            p1.End()
        end,
        Group = function() -- Line: 91 -- upvalues: p1 (val)
            p1.Tree({"Groups"})
            p1.SameLine()
            p1.Group()
            p1.Text({"I am in group A"})
            p1.Button({"Im also in A"})
            p1.End()
            p1.Separator()
            p1.Group()
            p1.Text({"I am in group B"})
            p1.Button({"Im also in B"})
            p1.Button({"Also group B"})
            p1.End()
            p1.End()
            p1.End()
        end,
        Indent = function() -- Line: 110 -- upvalues: p1 (val)
            p1.Tree({"Indents"})
            p1.Text({"Not Indented"})
            p1.Indent()
            p1.Text({"Indented"})
            p1.Indent({7})
            p1.Text({"Indented by 7 more pixels"})
            p1.End()
            p1.Indent({-7})
            p1.Text({"Indented by 7 less pixels"})
            p1.End()
            p1.End()
            p1.End()
        end,
        Input = function() -- Line: 126 -- upvalues: p1 (val), helpMarker (val)
            p1.Tree({"Input"})
            local v1 = p1.State(false)
            local v2 = p1.State(0)
            local v3 = p1.State(100)
            local v4 = p1.State(1)
            local v5 = p1.State("%d")
            p1.PushConfig({ContentWidth = UDim.new(1, -120)})
            local v6 = {"Input Number"}
            v6[p1.Args.InputNum.NoButtons] = v1.value
            v6[p1.Args.InputNum.Min] = v2.value
            v6[p1.Args.InputNum.Max] = v3.value
            v6[p1.Args.InputNum.Increment] = v4.value
            v6[p1.Args.InputNum.Format] = {v5.value}
            local v7 = p1.InputNum(v6)
            p1.PopConfig()
            p1.Text({"The Value is: " .. v7.number.value})
            local v8 = {"Randomize Number"}
            if p1.Button(v8).clicked() then
                v7.number:set(math.random(1, 99))
            end
            v6 = p1.Checkbox({"NoField"}, {isChecked = p1.State(false)})
            v8 = p1.Checkbox({"NoButtons"}, {isChecked = v1})
            if v6.checked() and v8.isChecked.value == true then
                v8.isChecked:set(false)
            end
            if v8.checked() and v6.isChecked.value == true then
                v6.isChecked:set(false)
            end
            p1.PushConfig({ContentWidth = UDim.new(1, -120)})
            p1.InputVector2({"InputVector2"})
            p1.InputVector3({"InputVector3"})
            p1.InputUDim({"InputUDim"})
            p1.InputUDim2({"InputUDim2"})
            local v9 = p1.State(false)
            local v10 = p1.State(false)
            local v11 = p1.State(Color3.new())
            local v12 = p1.State(0)
            p1.SliderNum({"Transparency", 0.01, 0, 1}, {number = v12})
            local v13 = {}
            local v14 = v9:get()
            v13[1] = "InputColor3"
            v13[2] = v14
            v13[3] = v10:get()
            p1.InputColor3(v13, {color = v11})
            v13 = {}
            v14 = v9:get()
            v13[1] = "InputColor4"
            v13[2] = v14
            v13[3] = v10:get()
            p1.InputColor4(v13, {color = v11, transparency = v12})
            p1.SameLine()
            p1.Text({v11:get():ToHex()})
            p1.Checkbox({"Use Floats"}, {isChecked = v9})
            p1.Checkbox({"Use HSV"}, {isChecked = v10})
            p1.End()
            p1.PopConfig()
            p1.Separator()
            p1.SameLine()
            p1.Text({"Slider Numbers"})
            helpMarker("ctrl + click slider number widgets to input a number")
            p1.End()
            p1.PushConfig({ContentWidth = UDim.new(1, -120)})
            p1.SliderNum({"Slide Int", 1, 1, 8})
            p1.SliderNum({"Slide Float", 0.01, 0, 100})
            p1.SliderNum({
                "Small Numbers",
                0.001,
                -2,
                1,
                "%f radians",
            })
            p1.SliderNum({
                "Odd Ranges",
                0.001,
                -3.141592653589793,
                3.141592653589793,
                "%f radians",
            })
            p1.SliderNum({"Big Numbers", 10000, 100000, 10000000})
            p1.SliderNum({"Few Numbers", 1, 0, 3})
            p1.PopConfig()
            p1.Separator()
            p1.SameLine()
            p1.Text({"Drag Numbers"})
            helpMarker("ctrl + click or double click drag number widgets to input a number, hold shift/alt while dragging to increase/decrease speed")
            p1.End()
            p1.PushConfig({ContentWidth = UDim.new(1, -120)})
            p1.DragNum({"Drag Int"})
            p1.DragNum({"Slide Float", 0.001, -10, 10})
            p1.DragNum({
                "Percentage",
                1,
                0,
                100,
                "%d %%",
            })
            p1.PopConfig()
            p1.End()
        end,
        InputText = function() -- Line: 203 -- upvalues: p1 (val)
            p1.Tree({"Input Text"})
            p1.PushConfig({ContentWidth = UDim.new(0, 250)})
            local v1 = {"Input Text Test"}
            v1[p1.Args.InputText.TextHint] = "Input Text here"
            local v2 = p1.InputText(v1)
            p1.PopConfig()
            p1.Text({"The text is: " .. v2.text.value})
            p1.End()
        end,
        MultiInput = function() -- Line: 212 -- upvalues: p1 (val)
            p1.Tree({"Multi-Component Input"})
            local v1 = p1.State(Vector2.new())
            local v2 = p1.State((Vector3.new()))
            local v3 = p1.State(UDim.new())
            local v4 = p1.State(UDim2.new())
            local v5 = p1.State(Color3.new())
            local v6 = p1.State(Rect.new(0, 0))
            p1.SeparatorText({"Input"})
            p1.InputVector2({}, {number = v1})
            p1.InputVector3({}, {number = v2})
            p1.InputUDim({}, {number = v3})
            p1.InputUDim2({}, {number = v4})
            p1.InputRect({}, {number = v6})
            p1.SeparatorText({"Drag"})
            p1.DragVector2({}, {number = v1})
            p1.DragVector3({}, {number = v2})
            p1.DragUDim({}, {number = v3})
            p1.DragUDim2({}, {number = v4})
            p1.DragRect({}, {number = v6})
            p1.SeparatorText({"Slider"})
            p1.SliderVector2({}, {number = v1})
            p1.SliderVector3({}, {number = v2})
            p1.SliderUDim({}, {number = v3})
            p1.SliderUDim2({}, {number = v4})
            p1.SliderRect({}, {number = v6})
            p1.SeparatorText({"Color"})
            p1.InputColor3({}, {color = v5})
            p1.InputColor4({}, {color = v5})
            p1.End()
        end,
        Tooltip = function() -- Line: 254 -- upvalues: p1 (val)
            p1.PushConfig({ContentWidth = UDim.new(0, 250)})
            p1.Tree({"Tooltip"})
            local v1 = {"Hover over me to reveal a tooltip"}
            if p1.Text(v1).hovered() then
                p1.Tooltip({"I am some helpful tooltip text"})
            end
            local v2 = p1.State("Hello ")
            v1 = p1.State(1)
            local v3 = {"# of repeat", 1, 1, 50}
            local v4 = {number = v1}
            if p1.InputNum(v3, v4).numberChanged() then
                v2:set(string.rep("Hello ", v1:get()))
            end
            v3 = {"Show dynamic text tooltip"}
            if p1.Checkbox(v3).isChecked.value then
                p1.Tooltip({v2:get()})
            end
            p1.End()
            p1.PopConfig()
        end,
        Selectable = function() -- Line: 272 -- upvalues: p1 (val)
            p1.Tree({"Selectable"})
            local v1 = p1.State(2)
            p1.Selectable({"Selectable #1", 1}, {index = v1})
            p1.Selectable({"Selectable #2", 2}, {index = v1})
            local v2 = {"Double click Selectable", 3, true}
            local v3 = {index = v1}
            if p1.Selectable(v2, v3).doubleClicked() then
                v1:set(3)
            end
            p1.Selectable({"Impossible to select", 4, true}, {index = v1})
            v2 = {"Select last"}
            if p1.Button(v2).clicked() then
                v1:set(4)
            end
            p1.Selectable({"Independent Selectable"})
            p1.End()
        end,
        Combo = function() -- Line: 288 -- upvalues: p1 (val)
            p1.Tree({"Combo"})
            p1.PushConfig({ContentWidth = UDim.new(1, -120)})
            local v1 = p1.State("No Selection")
            p1.SameLine()
            local v2 = p1.Checkbox({"No Preview"})
            local v3 = p1.Checkbox({"No Button"})
            if v2.checked() and v3.isChecked.value == true then
                v3.isChecked:set(false)
            end
            if v3.checked() and v2.isChecked.value == true then
                v2.isChecked:set(false)
            end
            p1.End()
            local v4 = {}
            local v5 = v3.isChecked:get()
            v4[1] = "Basic Usage"
            v4[2] = v5
            v4[3] = v2.isChecked:get()
            p1.Combo(v4, {index = v1})
            p1.Selectable({"Select 1", "One"}, {index = v1})
            p1.Selectable({"Select 2", "Two"}, {index = v1})
            p1.Selectable({"Select 3", "Three"}, {index = v1})
            p1.End()
            p1.ComboArray({"Using ComboArray"}, {index = "No Selection"}, {"Red", "Green", "Blue"})
            local v6 = p1.State("7 AM")
            p1.Combo({"Combo with Inner widgets"}, {index = v6})
            p1.Tree({"Morning Shifts"})
            p1.Selectable({"Shift at 7 AM", "7 AM"}, {index = v6})
            p1.Selectable({"Shift at 11 AM", "11 AM"}, {index = v6})
            p1.Selectable({"Shist at 3 PM", "3 PM"}, {index = v6})
            p1.End()
            p1.Tree({"Night Shifts"})
            p1.Selectable({"Shift at 6 PM", "6 PM"}, {index = v6})
            p1.Selectable({"Shift at 9 PM", "9 PM"}, {index = v6})
            p1.End()
            p1.End()
            v4 = p1.ComboEnum({"Using ComboEnum"}, {index = Enum.UserInputState.Begin}, Enum.UserInputState)
            p1.Text({"Selected: " .. v4.index:get().Name})
            p1.PopConfig()
            p1.End()
        end,
    }
    local u32 = {
        "Basic",
        "Tree",
        "CollapsingHeader",
        "Group",
        "Indent",
        "Input",
        "MultiInput",
        "InputText",
        "Tooltip",
        "Selectable",
        "Combo",
    }
    function recursiveTree() -- Line: 331 -- upvalues: p1 (val), recursiveTree (val)
        local v1 = {"Recursive Tree"}
        if p1.Tree(v1).state.isUncollapsed.value then
            recursiveTree()
        end
        p1.End()
    end
    function recursiveWindow(a1) -- Line: 339 -- upvalues: p1 (val), recursiveWindow (val)
        p1.Window({"Recursive Window"}, {size = p1.State(Vector2.new(175, 100)), isOpened = a1})
        local v1 = p1.Checkbox({"Recurse Again"})
        p1.End()
        if v1.isChecked.value then
            recursiveWindow(v1.isChecked)
        end
    end
    local function runtimeInfo() -- Line: 349 -- upvalues: p1 (val), u9 (val), helpMarker (val)
        local v1, v2, v3, v4
        local v5 = p1.Window({"Runtime Info"}, {isOpened = u9})
        local _lastVDOM = p1.Internal._lastVDOM
        local _states = p1.Internal._states
        local v6 = p1.State(3)
        local v7 = p1.State(0)
        local v8 = p1.State(os.clock())
        p1.SameLine()
        local v9 = {""}
        v9[p1.Args.InputNum.Format] = "%d Seconds"
        v9[p1.Args.InputNum.Max] = 10
        p1.InputNum(v9, {number = v6})
        v9 = {"Disable"}
        if p1.Button(v9).clicked() then
            p1.Disabled = true
            v9 = v6:get()
            task.delay(v9, function() -- Line: 362 -- upvalues: p1 (upval)
                p1.Disabled = false
            end)
        end
        p1.End()
        local v10 = os.clock()
        v7.value = v7.value + (v10 - v8.value - v7.value) * 0.2
        v8.value = v10
        local v11 = {}
        local v12 = v7.value * 1000
        v11[1] = string.format("Average %.3f ms/frame (%.1f FPS)", v12, 1 / v7.value)
        p1.Text(v11)
        p1.Text({string.format("Window Position: (%d, %d), Window Size: (%d, %d)", v5.position.value.X, v5.position.value.Y, v5.size.value.X, v5.size.value.Y)})
        p1.SameLine()
        p1.Text({"Enter an ID to learn more about it."})
        helpMarker("every widget and state has an ID which Iris tracks to remember which widget is which. below lists all widgets and states, with their respective IDs")
        p1.End()
        p1.PushConfig({ItemWidth = UDim.new(1, -150)})
        local value = p1.InputText({"ID field"}, {text = p1.State(v5.ID)}).text.value
        p1.PopConfig()
        p1.Indent()
        v11 = _lastVDOM[value]
        local v13 = _states[value]
        if v11 then
            local state
            v12 = {1}
            v12[p1.Args.Table.RowBg] = false
            p1.Table(v12)
            p1.Text({string.format("The ID, \"%s\", is a widget", value)})
            p1.NextRow()
            p1.Text({string.format("Widget is type: %s", v11.type)})
            p1.NextRow()
            p1.Tree({"Widget has Args:"}, {isUncollapsed = p1.State(true)})
            local arguments = v11.arguments
            v12 = nil
            v2 = nil
            for k, n in arguments, v12, v2 do
                p1.Text({k .. " - " .. tostring(n)})
            end
            p1.End()
            p1.NextRow()
            if v11.state then
                p1.Tree({"Widget has State:"}, {isUncollapsed = p1.State(true)})
                state = v11.state
                v12 = nil
                v2 = nil
                for m, i5 in state, v12, v2 do
                    p1.Text({m .. " - " .. tostring(i5.value)})
                end
                p1.End()
            end
            p1.End()
        elseif not v13 then
            p1.Text({string.format("The ID, \"%s\", is not a state or widget", value)})
        else
            v12 = {1}
            v12[p1.Args.Table.RowBg] = false
            p1.Table(v12)
            p1.Text({string.format("The ID, \"%s\", is a state", value)})
            p1.NextRow()
            v12 = {}
            v4 = typeof(v13.value)
            v12[1] = string.format("Value is type: %s, Value = %s", v4, (tostring(v13.value)))
            p1.Text(v12)
            p1.NextRow()
            p1.Tree({"state has connected widgets:"}, {isUncollapsed = p1.State(true)})
            local ConnectedWidgets = v13.ConnectedWidgets
            v12 = nil
            v2 = nil
            for i, j in ConnectedWidgets, v12, v2 do
                p1.Text({i .. " - " .. j.type})
            end
            p1.End()
            p1.NextRow()
            p1.Text({string.format("state has: %d connected functions", #v13.ConnectedFunctions)})
            p1.End()
        end
        p1.End()
        v12 = {"Widgets"}
        if p1.Tree(v12).isUncollapsed.value then
            v1 = 0
            v12 = ""
            v2 = _lastVDOM
            v3 = nil
            v4 = nil
            for i6, i7 in v2, v3, v4 do
                v1 = v1 + 1
                v12 = v12 .. "\n" .. i7.ID .. " - " .. i7.type
            end
            p1.Text({"Number of Widgets: " .. v1})
            p1.Text({v12})
        end
        p1.End()
        v12 = {"States"}
        if p1.Tree(v12).isUncollapsed.value then
            v1 = 0
            v12 = ""
            v2 = _states
            v3 = nil
            v4 = nil
            for i8, i9 in v2, v3, v4 do
                v1 = v1 + 1
                v12 = v12 .. "\n" .. i8 .. " - " .. tostring(i9.value)
            end
            p1.Text({"Number of States: " .. v1})
            p1.Text({v12})
        end
        p1.End()
        p1.End()
    end
    function recursiveMenu() -- Line: 464 -- upvalues: p1 (val), recursiveMenu (val)
        local v1 = {"Recursive"}
        if p1.Menu(v1).state.isOpened.value then
            p1.MenuItem({"New", Enum.KeyCode.N, Enum.ModifierKey.Ctrl})
            p1.MenuItem({"Open", Enum.KeyCode.O, Enum.ModifierKey.Ctrl})
            p1.MenuItem({"Save", Enum.KeyCode.S, Enum.ModifierKey.Ctrl})
            p1.Separator()
            p1.MenuToggle({"Autosave"})
            p1.MenuToggle({"Checked"})
            p1.Separator()
            p1.Menu({"Options"})
            p1.MenuItem({"Red"})
            p1.MenuItem({"Yellow"})
            p1.MenuItem({"Green"})
            p1.MenuItem({"Blue"})
            p1.Separator()
            recursiveMenu()
            p1.End()
        end
        p1.End()
    end
    local function mainMenuBar() -- Line: 488 -- upvalues: p1 (val), recursiveMenu (val), u6 (val), u15 (val), u18 (val), u9 (val), u12 (val)
        p1.MenuBar()
        p1.Menu({"File"})
        p1.MenuItem({"New", Enum.KeyCode.N, Enum.ModifierKey.Ctrl})
        p1.MenuItem({"Open", Enum.KeyCode.O, Enum.ModifierKey.Ctrl})
        p1.MenuItem({"Save", Enum.KeyCode.S, Enum.ModifierKey.Ctrl})
        recursiveMenu()
        p1.MenuItem({"Quit", Enum.KeyCode.Q, Enum.ModifierKey.Alt})
        p1.End()
        p1.Menu({"Examples"})
        p1.MenuToggle({"Recursive Window"}, {isChecked = u6})
        p1.MenuToggle({"Windowless"}, {isChecked = u15})
        p1.MenuToggle({"Main Menu Bar"}, {isChecked = u18})
        p1.End()
        p1.Menu({"Tools"})
        p1.MenuToggle({"Runtime Info"}, {isChecked = u9})
        p1.MenuToggle({"Style Editor"}, {isChecked = u12})
        p1.End()
        p1.End()
    end
    local function mainMenuBarExample() -- Line: 511 -- upvalues: p1 (val), mainMenuBar (val)
        mainMenuBar()
    end
    local function u51() -- Line: 526 -- upvalues: p1 (val), u12 (val)
        local v1
        local v2 = p1.State(1)
        local v3 = {}
        local v4 = {"Sizing"}
        v4[2] = function() -- Line: 532 -- upvalues: p1 (upval)
            local v1, v2
            local v3 = p1.State({})
            local v4 = {"Update Config"}
            if p1.Button(v4).clicked() then
                p1.UpdateGlobalConfig(v3:get())
                v3:set({})
            end
            local v5 = {}
            v4 = {"ItemWidth", nil, UDim.new(), UDim.new(1, 200)}
            local v6 = {"ContentWidth", nil, UDim.new(), UDim.new(1, 200)}
            v5[1] = v4
            v5[2] = v6
            v4 = v5
            v6 = nil
            local v7 = nil
            for i, j in v4, v6, v7 do
                v2 = {table.unpack(j)}
                v1 = p1.SliderUDim(v2, {number = p1.WeakState(p1._config[j[1]])})
                if v1.numberChanged() then
                    v2 = v3:get()
                    v2[j[1]] = v1.number:get()
                end
            end
            v4 = {}
            v7 = {"WindowResizePadding", nil, Vector2.zero, Vector2.one * 20}
            local v8 = {"FramePadding", nil, Vector2.zero, Vector2.one * 20}
            local v9 = {"ItemSpacing", nil, Vector2.zero, Vector2.one * 20}
            v1 = {"ItemInnerSpacing", nil, Vector2.zero, Vector2.one * 20}
            v2 = {"CellPadding", nil, Vector2.zero, Vector2.one * 20}
            local v10 = {"DisplaySafeAreaPadding", nil, Vector2.zero, Vector2.one * 20}
            v4[1] = {"WindowPadding", nil, Vector2.zero, Vector2.one * 20}
            v4[2] = v7
            v4[3] = v8
            v4[4] = v9
            v4[5] = v1
            v4[6] = v2
            v4[7] = v10
            v6 = v4
            v7 = nil
            v8 = nil
            for k, n in v6, v7, v8 do
                v10 = {table.unpack(n)}
                v2 = p1.SliderVector2(v10, {number = p1.WeakState(p1._config[n[1]])})
                if v2.numberChanged() then
                    v10 = v3:get()
                    v10[n[1]] = v2.number:get()
                end
            end
            v6 = {}
            v10 = {"PopupBorderSize", 0.1, 0, 1}
            local v11 = {"PopupRounding", 1, 0, 12}
            local v12 = {"GrabMinSize", 1, 0, 20}
            v6[1] = {"TextSize", 1, 4, 20}
            v6[2] = {"FrameBorderSize", 0.1, 0, 1}
            v6[3] = {"FrameRounding", 1, 0, 12}
            v6[4] = {"GrabRounding", 1, 0, 12}
            v6[5] = {"WindowBorderSize", 0.1, 0, 1}
            v6[6] = v10
            v6[7] = v11
            v6[8] = {"ScrollbarSize", 1, 0, 20}
            v6[9] = v12
            v7 = v6
            v8 = nil
            v9 = nil
            for m, i5 in v7, v8, v9 do
                v11 = {table.unpack(i5)}
                v10 = p1.SliderNum(v11, {number = p1.WeakState(p1._config[i5[1]])})
                if v10.numberChanged() then
                    v11 = v3:get()
                    v11[i5[1]] = v10.number:get()
                end
            end
            v8 = {"WindowTitleAlign"}
            v9 = nil
            v1 = nil
            for i6, i7 in v8, v9, v1 do
                v12 = {index = p1.WeakState(p1._config[i7])}
                v11 = p1.ComboEnum({i7}, v12, p1._config[i7].EnumType)
                if v11.closed() then
                    v12 = {}
                    v12[i7] = v11.index:get()
                    p1.UpdateGlobalConfig(v12)
                end
            end
        end
        v1 = {"Colors"}
        v1[2] = function() -- Line: 599 -- upvalues: p1 (upval)
            local v1, v2, v3
            local v4 = p1.State({})
            local v5 = {"Update Config"}
            if p1.Button(v5).clicked() then
                p1.UpdateGlobalConfig(v4:get())
                v4:set({})
            end
            v5 = {"BorderColor", "BorderActiveColor"}
            local v6 = nil
            local v7 = nil
            for i, j in v5, v6, v7 do
                v3 = {color = p1.WeakState(p1._config[j])}
                v1 = p1.InputColor3({j}, v3)
                if v1.numberChanged() then
                    v3 = {}
                    v3[j] = v1.color:get()
                    p1.UpdateGlobalConfig(v3)
                end
            end
            v6 = {
                "Text",
                "TextDisabled",
                "WindowBg",
                "ScrollbarGrab",
                "TitleBg",
                "TitleBgActive",
                "TitleBgCollapsed",
                "MenubarBg",
                "FrameBg",
                "FrameBgHovered",
                "FrameBgActive",
                "Button",
                "ButtonHovered",
                "ButtonActive",
                "SliderGrab",
                "SliderGrabActive",
                "Header",
                "HeaderHovered",
                "HeaderActive",
                "SelectionImageObject",
                "SelectionImageObjectBorder",
                "TableBorderStrong",
                "TableBorderLight",
                "TableRowBg",
                "TableRowBgAlt",
                "NavWindowingHighlight",
                "NavWindowingDimBg",
                "Separator",
                "CheckMark",
            }
            v7 = nil
            local v8 = nil
            for k, n in v6, v7, v8 do
                v3 = {n}
                v2 = p1.InputColor4(v3, {color = p1.WeakState(p1._config[n .. "Color"]), transparency = p1.WeakState(p1._config[n .. "Transparency"])})
                if v2.numberChanged() then
                    v3 = v4:get()
                    v3[n .. "Color"] = v2.color:get()
                    v3 = v4:get()
                    v3[n .. "Transparency"] = v2.transparency:get()
                end
            end
        end
        v3[1] = v4
        v3[2] = v1
        p1.Window({"Style Editor"}, {isOpened = u12})
        p1.Text({"Customize the look of Iris in realtime."})
        p1.SameLine()
        v1 = {"Light Theme"}
        if p1.SmallButton(v1).clicked() then
            p1.UpdateGlobalConfig(p1.TemplateConfig.colorLight)
        end
        v1 = {"Dark Theme"}
        if p1.SmallButton(v1).clicked() then
            p1.UpdateGlobalConfig(p1.TemplateConfig.colorDark)
        end
        p1.End()
        p1.SameLine()
        v1 = {"Classic Size"}
        if p1.SmallButton(v1).clicked() then
            p1.UpdateGlobalConfig(p1.TemplateConfig.sizeDefault)
        end
        v1 = {"Larger Size"}
        if p1.SmallButton(v1).clicked() then
            p1.UpdateGlobalConfig(p1.TemplateConfig.sizeClear)
        end
        p1.End()
        v1 = {"Reset Everything"}
        if p1.SmallButton(v1).clicked() then
            p1.UpdateGlobalConfig(p1.TemplateConfig.colorDark)
            p1.UpdateGlobalConfig(p1.TemplateConfig.sizeDefault)
        end
        p1.Separator()
        p1.SameLine()
        for i, v in ipairs(v3) do
            p1.RadioButton({v[1], i}, {index = v2})
        end
        p1.End()
        v3[v2:get()][2]()
        p1.End()
    end
    local function widgetEventInteractivity() -- Line: 699 -- upvalues: p1 (val)
        local clicked
        p1.CollapsingHeader({"Widget Event Interactivity"})
        local v1 = p1.State(0)
        local v2 = {"Click to increase Number"}
        if p1.Button(v2).clicked() then
            v1:set(v1:get() + 1)
        end
        p1.Text({"The Number is: " .. v1:get()})
        p1.Separator()
        local v3 = p1.State(false)
        clicked = p1.State("clicked")
        p1.SameLine()
        p1.RadioButton({"clicked", "clicked"}, {index = clicked})
        p1.RadioButton({"rightClicked", "rightClicked"}, {index = clicked})
        p1.RadioButton({"doubleClicked", "doubleClicked"}, {index = clicked})
        p1.RadioButton({"ctrlClicked", "ctrlClicked"}, {index = clicked})
        p1.End()
        p1.SameLine()
        local v4 = p1.Button({clicked:get() .. " to reveal text"})
        if v4[clicked:get()]() then
            v3:set(not v3:get())
        end
        if v3:get() then
            p1.Text({"Here i am!"})
        end
        p1.End()
        p1.Separator()
        local v5 = p1.State(0)
        p1.SameLine()
        local v6 = {"Click to show text for 20 frames"}
        if p1.Button(v6).clicked() then
            v5:set(20)
        end
        v4 = v5:get()
        if 0 < v4 then
            p1.Text({"Here i am!"})
        end
        p1.End()
        v5:set((math.max(0, v5:get() - 1)))
        p1.Text({"Text Timer: " .. v5:get()})
        v4 = p1.Checkbox({"Event-tracked checkbox"})
        p1.Indent()
        p1.Text({"unchecked: " .. tostring(v4.unchecked())})
        p1.Text({"checked: " .. tostring(v4.checked())})
        p1.End()
        p1.SameLine()
        local v7 = {"Hover over me"}
        if p1.Button(v7).hovered() then
            p1.Text({"The button is hovered"})
        end
        p1.End()
        p1.End()
    end
    local function widgetStateInteractivity() -- Line: 755 -- upvalues: p1 (val)
        p1.CollapsingHeader({"Widget State Interactivity"})
        local v1 = p1.Checkbox({"Widget-Generated State"})
        p1.Text({(("isChecked: %*\n"):format(v1.state.isChecked.value))})
        local v2 = p1.State(false)
        local v3 = p1.Checkbox({"User-Generated State"}, {isChecked = v2})
        p1.Text({(("isChecked: %*\n"):format(v3.state.isChecked.value))})
        local v4 = p1.Checkbox({"Widget Coupled State"})
        local v5 = p1.Checkbox({"Coupled to above Checkbox"}, {isChecked = v4.state.isChecked})
        p1.Text({(("isChecked: %*\n"):format(v5.state.isChecked.value))})
        local v6 = p1.State(false)
        p1.Checkbox({"Widget and Code Coupled State"}, {isChecked = v6})
        local v7 = {"Click to toggle above checkbox"}
        if p1.Button(v7).clicked() then
            v6:set(not v6:get())
        end
        p1.Text({(("isChecked: %*\n"):format(v6.value))})
        v7 = p1.State(true)
        local v8 = p1.ComputedState(v7, function(p1) -- Line: 777
            return not p1
        end)
        p1.Checkbox({"ComputedState (dynamic coupling)"}, {isChecked = v7})
        p1.Checkbox({"Inverted of above checkbox"}, {isChecked = v8})
        p1.Text({(("isChecked: %*\n"):format(v8.value))})
        p1.End()
    end
    local function dynamicStyle() -- Line: 787 -- upvalues: p1 (val), helpMarker (val)
        p1.CollapsingHeader({"Dynamic Styles"})
        local v1 = p1.State(0)
        p1.SameLine()
        local v2 = {"Change Color"}
        if p1.Button(v2).clicked() then
            v1:set(math.random())
        end
        p1.Text({"Hue: " .. math.floor(v1:get() * 255)})
        helpMarker("Using PushConfig with a changing value, this can be done with any config field")
        p1.End()
        v2 = {}
        local v3 = v1:get()
        v2.TextColor = Color3.fromHSV(v3, 1, 1)
        p1.PushConfig(v2)
        p1.Text({"Text with a unique and changable color"})
        p1.PopConfig()
        p1.End()
    end
    local function tablesDemo() -- Line: 803 -- upvalues: p1 (val), helpMarker (val)
        local v1, v2, v3, v4
        local v5 = p1.State(false)
        local v6 = {"Tables & Columns"}
        local v7 = {isUncollapsed = v5}
        p1.CollapsingHeader(v6, v7)
        if v5.value == false then
            p1.End()
            return
        end
        p1.SameLine()
        p1.Text({"Table using NextRow and NextColumn syntax:"})
        helpMarker("calling Iris.NextRow() in the outer loop, and Iris.NextColumn()in the inner loop")
        p1.End()
        p1.Table({3})
        local v8 = 4
        v6 = 1
        for i = 1, v8, v6 do
            p1.NextRow()
            v2 = 3
            v3 = 1
            for j = 1, v2, v3 do
                p1.NextColumn()
                p1.Text({(("Row: %*, Column: %*"):format(i, j))})
            end
        end
        p1.End()
        p1.Text({""})
        p1.SameLine()
        p1.Text({"Table using NextColumn only syntax:"})
        helpMarker("only calling Iris.NextColumn() in the inner loop, the result is identical")
        p1.End()
        p1.Table({2})
        v8 = 4
        v6 = 1
        for k = 1, v8, v6 do
            v2 = 2
            v3 = 1
            for n = 1, v2, v3 do
                p1.NextColumn()
                p1.Text({(("Row: %*, Column: %*"):format(k, n))})
            end
        end
        p1.End()
        p1.Separator()
        v8 = p1.State(false)
        v6 = p1.State(false)
        v7 = p1.State(true)
        v2 = p1.State(true)
        v3 = p1.State(3)
        p1.Text({"Table with Customizable Arguments"})
        local v9 = {4}
        v9[p1.Args.Table.RowBg] = v8.value
        v9[p1.Args.Table.BordersOuter] = v6.value
        v9[p1.Args.Table.BordersInner] = v7.value
        p1.Table(v9)
        local v10 = v3:get()
        v9 = 1
        for m = 1, v10, v9 do
            v4 = 4
            v1 = 1
            for i5 = 1, v4, v1 do
                p1.NextColumn()
                if not v2.value then
                    p1.Text({(("Month: %*, Week: %*"):format(m, i5))})
                else
                    p1.Button({(("Month: %*, Week: %*"):format(m, i5))})
                end
            end
        end
        p1.End()
        p1.Checkbox({"RowBg"}, {isChecked = v8})
        p1.Checkbox({"BordersOuter"}, {isChecked = v6})
        p1.Checkbox({"BordersInner"}, {isChecked = v7})
        p1.SameLine()
        p1.RadioButton({"Buttons", true}, {index = v2})
        p1.RadioButton({"Text", false}, {index = v2})
        p1.End()
        v9 = {"Number of rows"}
        v9[p1.Args.InputNum.Min] = 0
        v9[p1.Args.InputNum.Max] = 100
        v9[p1.Args.InputNum.Format] = "%d"
        p1.InputNum(v9, {number = v3})
        p1.End()
    end
    local function layoutDemo() -- Line: 888 -- upvalues: p1 (val), helpMarker (val)
        p1.CollapsingHeader({"Widget Layout"})
        p1.Tree({"Content Width"})
        local v1 = p1.State(50)
        local v2 = p1.State(Enum.Axis.X)
        p1.Text({"The Content Width is a size property which determines the width of input fields."})
        p1.SameLine()
        p1.Text({"By default the value is UDim.new(0.65, 0)"})
        helpMarker("This is the default value from Dear ImGui.\nIt is 65% of the window width.")
        p1.End()
        p1.Text({"This works well, but sometimes we know how wide elements are going to be and want to maximise the space."})
        p1.Text({"Therefore, we can use Iris.PushConfig() to change the width"})
        p1.Separator()
        p1.SameLine()
        p1.Text({"Content Width = 150 pixels"})
        helpMarker("UDim.new(0, 150)")
        p1.End()
        p1.PushConfig({ContentWidth = UDim.new(0, 150)})
        p1.DragNum({"number", 1, 0, 100}, {number = v1})
        p1.ComboEnum({"axis"}, {index = v2}, Enum.Axis)
        p1.PopConfig()
        p1.SameLine()
        p1.Text({"Content Width = 50% window width"})
        helpMarker("UDim.new(0.5, 0)")
        p1.End()
        p1.PushConfig({ContentWidth = UDim.new(0.5, 0)})
        p1.DragNum({"number", 1, 0, 100}, {number = v1})
        p1.ComboEnum({"axis"}, {index = v2}, Enum.Axis)
        p1.PopConfig()
        p1.SameLine()
        p1.Text({"Content Width = -150 pixels from the right side"})
        helpMarker("UDim.new(1, -150)")
        p1.End()
        p1.PushConfig({ContentWidth = UDim.new(1, -150)})
        p1.DragNum({"number", 1, 0, 100}, {number = v1})
        p1.InputEnum({"axis"}, {index = v2}, Enum.Axis)
        p1.PopConfig()
        p1.End()
        p1.End()
    end
    local function windowlessDemo() -- Line: 935 -- upvalues: p1 (val), helpMarker (val)
        p1.PushConfig({ItemWidth = UDim.new(0, 150)})
        p1.SameLine()
        p1.TextWrapped({"Windowless widgets"})
        helpMarker("Widgets which are placed outside of a window will appear on the top left side of the screen.")
        p1.End()
        p1.Button({})
        p1.Tree({})
        p1.InputText({})
        p1.End()
        p1.PopConfig()
    end
    return function() -- Line: 949 -- upvalues: p1 (val), u3 (val), mainMenuBar (val), widgetEventInteractivity (val), widgetStateInteractivity (val), recursiveTree (val), dynamicStyle (val), u32 (val), u20 (val), tablesDemo (val), layoutDemo (val), u6 (val), recursiveWindow (val), u9 (val), runtimeInfo (val), u12 (val), u51 (ref), u15 (val), windowlessDemo (val), u18 (val)
        local v1 = p1.State(false)
        local v2 = p1.State(false)
        local v3 = p1.State(false)
        local v4 = p1.State(true)
        local v5 = p1.State(false)
        local v6 = p1.State(false)
        local v7 = p1.State(false)
        local v8 = p1.State(false)
        local v9 = p1.State(false)
        if u3.value == false then
            p1.Checkbox({"Open main window"}, {isChecked = u3})
            return
        end
        local v10 = {"Iris Demo Window"}
        v10[p1.Args.Window.NoTitleBar] = v1.value
        v10[p1.Args.Window.NoBackground] = v2.value
        v10[p1.Args.Window.NoCollapse] = v3.value
        v10[p1.Args.Window.NoClose] = v4.value
        v10[p1.Args.Window.NoMove] = v5.value
        v10[p1.Args.Window.NoScrollbar] = v6.value
        v10[p1.Args.Window.NoResize] = v7.value
        v10[p1.Args.Window.NoNav] = v8.value
        v10[p1.Args.Window.NoMenu] = v9.value
        p1.Window(v10, {size = p1.State(Vector2.new(600, 550)), position = p1.State(Vector2.new(100, 25)), isOpened = u3})
        mainMenuBar()
        p1.Text({"Iris says hello. (2.1.1)"})
        p1.CollapsingHeader({"Window Options"})
        p1.Table({3, false, false, false})
        p1.NextColumn()
        p1.Checkbox({"NoTitleBar"}, {isChecked = v1})
        p1.NextColumn()
        p1.Checkbox({"NoBackground"}, {isChecked = v2})
        p1.NextColumn()
        p1.Checkbox({"NoCollapse"}, {isChecked = v3})
        p1.NextColumn()
        p1.Checkbox({"NoClose"}, {isChecked = v4})
        p1.NextColumn()
        p1.Checkbox({"NoMove"}, {isChecked = v5})
        p1.NextColumn()
        p1.Checkbox({"NoScrollbar"}, {isChecked = v6})
        p1.NextColumn()
        p1.Checkbox({"NoResize"}, {isChecked = v7})
        p1.NextColumn()
        p1.Checkbox({"NoNav"}, {isChecked = v8})
        p1.NextColumn()
        p1.Checkbox({"NoMenu"}, {isChecked = v9})
        p1.End()
        p1.End()
        widgetEventInteractivity()
        widgetStateInteractivity()
        p1.CollapsingHeader({"Recursive Tree"})
        v10 = {"Recursive Tree"}
        if p1.Tree(v10).state.isUncollapsed.value then
            recursiveTree()
        end
        p1.End()
        p1.End()
        dynamicStyle()
        p1.Separator()
        p1.CollapsingHeader({"Widgets"})
        local v11 = u32
        v10 = nil
        local v12 = nil
        for i, j in v11, v10, v12 do
            u20[j]()
        end
        p1.End()
        tablesDemo()
        layoutDemo()
        p1.End()
        if u6.value then
            recursiveWindow(u6)
        end
        if u9.value then
            runtimeInfo()
        end
        if u12.value then
            u51()
        end
        if u15.value then
            windowlessDemo()
        end
        if u18.value then
            mainMenuBar()
        end
    end
end