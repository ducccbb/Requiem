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
--File: ReplicatedStorage.Packages._Index.jakeywastaken_smartbone-2@0.3.1.smartbone-2.Dependencies.Iris.Internal
--                               Dumped in 0.00270 seconds
--                          Bytecode version 9  |  26 functions

require(script.Parent.Types)
return function(p1) -- Line: 3
    local u1 = {
        _started = false,
        _cycleTick = 0,
        _globalRefreshRequested = false,
        _localRefreshActive = false,
        _widgets = {},
        _widgetCount = 0,
        _stackIndex = 1,
        _rootInstance = nil,
    }
    u1._rootWidget = {ID = "R", type = "Root", ZIndex = 0, Instance = u1._rootInstance}
    u1._lastWidget = u1._rootWidget
    u1._rootConfig = {}
    u1._config = u1._rootConfig
    u1._IDStack = {"R"}
    u1._usedIDs = {}
    u1._pushedId = nil
    u1._nextWidgetId = nil
    u1._states = {}
    u1._postCycleCallbacks = {}
    local v1 = {}
    u1._connectedFunctions = v1
    u1._cycleCoroutine = coroutine.create(function() -- Line: 49 -- upvalues: u1 (val)
        local _connectedFunctions, v1, v2, v3, v4
        while true do
            _connectedFunctions = u1._connectedFunctions
            v1 = nil
            v2 = nil
            for i, j in _connectedFunctions, v1, v2 do
                debug.profilebegin("Iris/Connection")
                v3, v4 = pcall(j)
                debug.profileend()
                if not v3 then
                    u1._stackIndex = 1
                    coroutine.yield(false, v4)
                end
                if u1._stackIndex ~= 1 then
                    u1._stackIndex = 1
                    error("Callback has too few calls to Iris.End()", 0)
                end
            end
            coroutine.yield(true)
        end
    end)
    v1 = {}
    v1.__index = v1
    function v1.get(p1) -- Line: 80
        return p1.value
    end
    function v1.set(p1, p2) -- Line: 84 -- upvalues: u1 (val)
        if p2 == p1.value then
            return p1.value
        end
        p1.value = p2
        local ConnectedWidgets = p1.ConnectedWidgets
        local v1 = nil
        local v2 = nil
        for i, j in ConnectedWidgets, v1, v2 do
            u1._widgets[j.type].UpdateState(j)
        end
        local ConnectedFunctions = p1.ConnectedFunctions
        v1 = nil
        v2 = nil
        for k, n in ConnectedFunctions, v1, v2 do
            n(p2)
        end
        return p1.value
    end
    function v1.onChange(p1, p2) -- Line: 99
        table.insert(p1.ConnectedFunctions, p2)
    end
    u1.StateClass = v1
    function u1._cycle() -- Line: 111 -- upvalues: p1 (val), u1 (val)
        local v1
        if p1.Disabled then
            return
        end
        u1._rootWidget.lastCycleTick = u1._cycleTick
        if u1._rootInstance == nil then
            p1.ForceRefresh()
        elseif u1._rootInstance.Parent ~= nil then
        end
        local _lastVDOM = u1._lastVDOM
        local v2 = nil
        local v3 = nil
        for i, j in _lastVDOM, v2, v3 do
            if j.lastCycleTick ~= u1._cycleTick then
                u1._DiscardWidget(j)
            end
        end
        u1._lastVDOM = u1._VDOM
        u1._VDOM = u1._generateEmptyVDOM()
        task.spawn(function() -- Line: 135 -- upvalues: u1 (upval)
            local _postCycleCallbacks = u1._postCycleCallbacks
            local v1 = nil
            local v2 = nil
            for i, j in _postCycleCallbacks, v1, v2 do
                j()
            end
        end)
        if u1._globalRefreshRequested then
            u1._generateSelectionImageObject()
            u1._globalRefreshRequested = false
            local _lastVDOM_2 = u1._lastVDOM
            v2 = nil
            v3 = nil
            for k, n in _lastVDOM_2, v2, v3 do
                u1._DiscardWidget(n)
            end
            u1._generateRootInstance()
            u1._lastVDOM = u1._generateEmptyVDOM()
        end
        local v4 = u1
        v4._cycleTick = v4._cycleTick + 1
        u1._widgetCount = 0
        table.clear(u1._usedIDs)
        if u1.parentInstance:IsA("GuiBase2d") then
            v4 = math.min(u1.parentInstance.AbsoluteSize.X, u1.parentInstance.AbsoluteSize.Y)
            if v4 < 100 then
                error("Iris Parent Instance is too small")
            end
        end
        v4 = u1.parentInstance:IsA("GuiBase2d")
        if not v4 then
            v4 = u1.parentInstance:IsA("CoreGui")
            if not v4 then
                v4 = u1.parentInstance:IsA("PluginGui")
                if not v4 then
                    v4 = u1.parentInstance:IsA("PlayerGui")
                end
            end
        end
        if v4 == false then
            error("Iris Parent Instance cant contain GUI")
        end
        if game:GetService("RunService"):IsStudio() then
            local _connectedFunctions = u1._connectedFunctions
            v3 = nil
            v1 = nil
            for m, i5 in _connectedFunctions, v3, v1 do
                i5()
            end
            return
        end
        v2 = coroutine.status(u1._cycleCoroutine)
        if v2 == "suspended" then
            local v5
            _, v1, v5 = coroutine.resume(u1._cycleCoroutine)
            if v1 ~= false then
                return
            end
            error(v5, 0)
            return
        end
        if v2 == "running" then
            error("Iris cycleCoroutine took to long to yield. Connected functions should not yield.")
            return
        end
        error("unrecoverable state")
    end
    function u1._NoOp() end
    function u1.WidgetConstructor(a1, p2) -- Line: 210 -- upvalues: u1 (val), p1 (val)
        local v1, v2
        local v3 = {
            All = {
                Required = {
                    "Generate",
                    "Discard",
                    "Update",
                    "Args",
                    "Events",
                    "hasChildren",
                    "hasState",
                },
                Optional = {},
            },
            IfState = {
                Required = {"GenerateState", "UpdateState"},
                Optional = {},
            },
            IfChildren = {
                Required = {"ChildAdded"},
                Optional = {"ChildDiscarded"},
            },
        }
        local v4 = {}
        local Required = v3.All.Required
        local v5 = nil
        local v6 = nil
        local v7 = p2
        for i, j in Required, v5, v6 do
            v2 = v7[j] ~= nil
            assert(v2, (("field %* is missing from widget %*, it is required for all widgets"):format(j, v1)))
            v4[j] = v7[j]
        end
        local Optional = v3.All.Optional
        v5 = nil
        v6 = nil
        for k, n in Optional, v5, v6 do
            if v7[n] ~= nil then
                v4[n] = v7[n]
            else
                v4[n] = u1._NoOp
            end
        end
        if v7.hasState then
            local Required_2 = v3.IfState.Required
            v5 = nil
            v6 = nil
            for m, i5 in Required_2, v5, v6 do
                v2 = v7[i5] ~= nil
                assert(v2, (("field %* is missing from widget %*, it is required for all widgets with state"):format(i5, v1)))
                v4[i5] = v7[i5]
            end
            local Optional_2 = v3.IfState.Optional
            v5 = nil
            v6 = nil
            for i6, i7 in Optional_2, v5, v6 do
                if v7[i7] ~= nil then
                    v4[i7] = v7[i7]
                else
                    v4[i7] = u1._NoOp
                end
            end
        end
        if v7.hasChildren then
            local Required_3 = v3.IfChildren.Required
            v5 = nil
            v6 = nil
            for i8, i9 in Required_3, v5, v6 do
                v2 = v7[i9] ~= nil
                assert(v2, (("field %* is missing from widget %*, it is required for all widgets with children"):format(i9, v1)))
                v4[i9] = v7[i9]
            end
            local Optional_3 = v3.IfChildren.Optional
            v5 = nil
            v6 = nil
            for i10, i11 in Optional_3, v5, v6 do
                if v7[i11] ~= nil then
                    v4[i11] = v7[i11]
                else
                    v4[i11] = u1._NoOp
                end
            end
        end
        u1._widgets[v1] = v4
        p1.Args[v1] = v4.Args
        local v8 = {}
        local Args = v4.Args
        v6 = nil
        local v9 = nil
        for i12, i13 in Args, v6, v9 do
            v8[i13] = i12
        end
        v4.ArgNames = v8
        local Events = v4.Events
        v6 = nil
        v9 = nil
        for i14, i15 in Events, v6, v9 do
            if p1.Events[i14] == nil then
                p1.Events[i14] = function() -- Line: 301 -- upvalues: u1 (upval), i14 (val)
                    return u1._EventCall(u1._lastWidget, i14)
                end
            end
        end
    end
    function u1._Insert(p1, p2, p3) -- Line: 308 -- upvalues: u1 (val)
        local v1
        local v2 = nil
        local v3 = u1._getID(3)
        local v4 = u1._widgets[p1]
        local v5 = u1
        v5._widgetCount = v5._widgetCount + 1
        if u1._VDOM[v3] then
            return u1._ContinueWidget(v3, p1)
        end
        v5 = {}
        if p2 ~= nil then
            local v6
            if type(p2) == "table" then
                v6 = p2
            else
                v6 = {p2}
            end
            v1 = v6
            local v7 = nil
            local v8 = nil
            for i, j in v1, v7, v8 do
                v5[v4.ArgNames[i]] = j
            end
        end
        table.freeze(v5)
        if u1._lastVDOM[v3] and p1 == u1._lastVDOM[v3].type then
            if not u1._localRefreshActive then
                v2 = u1._lastVDOM[v3]
            else
                u1._DiscardWidget(u1._lastVDOM[v3])
            end
        end
        if v2 == nil then
            v2 = u1._GenNewWidget(p1, v5, p3, v3)
        end
        if u1._deepCompare(v2.providedArguments, v5) == false then
            v2.arguments = u1._deepCopy(v5)
            v2.providedArguments = v5
            v4.Update(v2)
        end
        v2.lastCycleTick = u1._cycleTick
        if v4.hasChildren then
            v1 = u1
            v1._stackIndex = v1._stackIndex + 1
            u1._IDStack[u1._stackIndex] = v2.ID
        end
        u1._VDOM[v3] = v2
        u1._lastWidget = v2
        return v2
    end
    function u1._GenNewWidget(p1, p2, p3, p4) -- Line: 375 -- upvalues: u1 (val)
        local Parent, stateMT
        local v1 = u1._IDStack[u1._stackIndex]
        local v2 = u1._widgets[p1]
        local u100 = {}
        setmetatable(u100, u100)
        u100.ID = p4
        u100.type = p1
        u100.parentWidget = u1._VDOM[v1]
        u100.trackedEvents = {}
        local v3 = u100.parentWidget.ZIndex + u1._widgetCount * 64
        u100.ZIndex = v3 + u1._config.ZIndexOffset
        u100.Instance = v2.Generate(u100)
        if not u1._config.Parent then
            Parent = u1._widgets[u100.parentWidget.type].ChildAdded(u100.parentWidget, u100)
        else
            Parent = u1._config.Parent
        end
        u100.Instance.Parent = Parent
        u100.providedArguments = p2
        u100.arguments = u1._deepCopy(p2)
        v2.Update(u100)
        if not v2.hasState then
            stateMT = u100
        else
            if not p3 then
                u100.state = {}
            else
                local v4
                v3 = p3
                local v5 = nil
                local v6 = nil
                local v7 = p3
                for i, j in v3, v5, v6 do
                    if type(j) ~= "table" then
                        v7[i] = u1._widgetState(u100, i, j)
                    else
                        v4 = getmetatable(j)
                        if v4 == u1.StateClass then end
                    end
                end
                u100.state = v7
                v3 = v7
                v5 = nil
                v6 = nil
                for k, n in v3, v5, v6 do
                    n.ConnectedWidgets[u100.ID] = u100
                end
            end
            v2.GenerateState(u100)
            v2.UpdateState(u100)
            u100.stateMT = {}
            setmetatable(u100.state, u100.stateMT)
            u100.__index = u100.state
            stateMT = u100.stateMT
        end
        function stateMT.__index(p1, p2) -- Line: 432 -- upvalues: u1 (upval), u100 (val)
            return function() -- Line: 433 -- upvalues: u1 (upval), u100 (upval), p2 (val)
                return u1._EventCall(u100, p2)
            end
        end
        return u100
    end
    function u1._ContinueWidget(p1, p2) -- Line: 440 -- upvalues: u1 (val)
        local v1 = u1._widgets[p2]
        local v2 = u1._VDOM[p1]
        if v1.hasChildren then
            local v3 = u1
            v3._stackIndex = v3._stackIndex + 1
            u1._IDStack[u1._stackIndex] = v2.ID
        end
        u1._lastWidget = v2
        return v2
    end
    function u1._DiscardWidget(p1) -- Line: 454 -- upvalues: u1 (val)
        local parentWidget = p1.parentWidget
        if parentWidget then
            u1._widgets[parentWidget.type].ChildDiscarded(parentWidget, p1)
        end
        u1._widgets[p1.type].Discard(p1)
    end
    function u1._widgetState(p1, p2, p3) -- Line: 465 -- upvalues: u1 (val)
        local v1 = p1.ID .. p2
        if u1._states[v1] then
            u1._states[v1].ConnectedWidgets[p1.ID] = p1
            return u1._states[v1]
        end
        local v2 = {value = p3}
        local v3 = {}
        v3[p1.ID] = p1
        v2.ConnectedWidgets = v3
        v2.ConnectedFunctions = {}
        u1._states[v1] = v2
        setmetatable(u1._states[v1], u1.StateClass)
        return u1._states[v1]
    end
    function u1._EventCall(p1, p2) -- Line: 481 -- upvalues: u1 (val)
        local v1 = u1._widgets[p1.type].Events[p2]
        local v2 = v1 ~= nil
        assert(v2, (("widget %* has no event of name %*"):format(p1.type, p2)))
        if p1.trackedEvents[p2] == nil then
            v1.Init(p1)
            p1.trackedEvents[p2] = true
        end
        return v1.Get(p1)
    end
    function u1._GetParentWidget() -- Line: 493 -- upvalues: u1 (val)
        return u1._VDOM[u1._IDStack[u1._stackIndex]]
    end
    function u1._generateEmptyVDOM() -- Line: 499 -- upvalues: u1 (val)
        return {R = u1._rootWidget}
    end
    function u1._generateRootInstance() -- Line: 505 -- upvalues: u1 (val)
        u1._rootInstance = u1._widgets.Root.Generate(u1._widgets.Root)
        u1._rootInstance.Parent = u1.parentInstance
        u1._rootWidget.Instance = u1._rootInstance
    end
    function u1._generateSelectionImageObject() -- Line: 512 -- upvalues: u1 (val)
        if u1.SelectionImageObject then
            u1.SelectionImageObject:Destroy()
        end
        local Frame = Instance.new("Frame")
        Frame.Position = UDim2.fromOffset(-1, -1)
        Frame.Size = UDim2.new(1, 2, 1, 2)
        Frame.BackgroundColor3 = u1._config.SelectionImageObjectColor
        Frame.BackgroundTransparency = u1._config.SelectionImageObjectTransparency
        Frame.BorderSizePixel = 0
        local UIStroke = Instance.new("UIStroke")
        UIStroke.Thickness = 1
        UIStroke.Color = u1._config.SelectionImageObjectBorderColor
        UIStroke.Transparency = u1._config.SelectionImageObjectBorderTransparency
        UIStroke.LineJoinMode = Enum.LineJoinMode.Round
        UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        UIStroke.Parent = Frame
        local UICorner = Instance.new("UICorner")
        UICorner.CornerRadius = UDim.new(0, 2)
        UICorner.Parent = Frame
        u1.SelectionImageObject = Frame
    end
    function u1._getID(p1) -- Line: 543 -- upvalues: u1 (val)
        local _pushedId, _usedIDs
        if u1._nextWidgetId then
            u1._nextWidgetId = nil
            return u1._nextWidgetId
        end
        local v1 = 1 + (p1 or 1)
        local v2 = ""
        local v3 = debug.info(v1, "l")
        while v3 ~= -1 do
            if v3 == nil then
                break
            end
            v2 = v2 .. "+" .. v3
            v1 = v1 + 1
            v3 = debug.info(v1, "l")
        end
        if not (u1._usedIDs[v2]) then
            u1._usedIDs[v2] = 1
        else
            _usedIDs = u1._usedIDs
            _usedIDs[v2] = _usedIDs[v2] + 1
        end
        if not u1._pushedId then
            _pushedId = u1._usedIDs[v2]
        else
            _pushedId = u1._pushedId
        end
        return v2 .. ":" .. _pushedId
    end
    function u1._deepCompare(p1, p2) -- Line: 570 -- upvalues: u1 (val)
        local v1, v2
        local v3 = p1
        local v4 = nil
        local v5 = nil
        local v6 = p2
        for i, j in v3, v4, v5 do
            v1 = v6[i]
            if type(j) ~= "table" then
                v2 = type(j)
                if v2 == type(v1) and j == v1 then
                    continue
                end
                return false
            end
            if v1 and type(v1) == "table" then
                if u1._deepCompare(j, v1) ~= false then
                    continue
                end
                return false
            end
            return false
        end
        return true
    end
    function u1._deepCopy(p1) -- Line: 592 -- upvalues: u1 (val)
        local v1 = {}
        for k, v in pairs(p1) do
            if type(v) == "table" then
                v = u1._deepCopy(v)
            end
            v1[k] = v
        end
        return v1
    end
    u1._lastVDOM = u1._generateEmptyVDOM()
    u1._VDOM = u1._generateEmptyVDOM()
    p1.Internal = u1
    p1._config = u1._config
    return u1
end