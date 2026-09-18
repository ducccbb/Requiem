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
--                     File: ReplicatedStorage.Client.User.Chat.Chat
--                               Dumped in 0.0521 seconds
--                         Bytecode version 9  |  454 functions

local Name, TextChatMessage, v1
local u0 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local ContentProvider = game:GetService("ContentProvider")
local GuiService = game:GetService("GuiService")
local HttpService = game:GetService("HttpService")
local LogService = game:GetService("LogService")
local Players = game:GetService("Players")
local ReplicatedFirst = game:GetService("ReplicatedFirst")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local StarterGui = game:GetService("StarterGui")
local TextChatService = game:GetService("TextChatService")
local TextService = game:GetService("TextService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Effects_2 = Common:WaitForChild("Effects")
local Effects = require(Effects_2:WaitForChild("Effects"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Alive = require(Common_2:WaitForChild("Alive"))
local State = u0.Parent.Parent:WaitForChild("State")
local ClientStatusHandler = require(State:WaitForChild("ClientStatusHandler"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_4:WaitForChild("Common")
local Network = Common_3:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Player = require(Namespaces:WaitForChild("Player"))
if not (u0:IsDescendantOf(ReplicatedStorage)) and not (u0:IsDescendantOf(ReplicatedFirst)) then
    error("OpenTextChatService must be installed in ReplicatedStorage or ReplicatedFirst. Please refer to the usage guide.\nhttps://devforum.roblox.com/t/3605944")
end
local v3 = os.clock()
while true do
    task.wait()
    if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
        break
    end
    v1 = os.clock() - v3
    if 5 < v1 then
        break
    end
end
if TextChatService.ChatVersion ~= Enum.ChatVersion.TextChatService then
    error("TextChatService.ChatVersion must be set to TextChatService", 2)
end
if RunService:IsServer() then
    error("Attempt to use OpenTextChatService in a server context. This module is client-sided only.", 2)
end
if not (u0:GetAttribute("Initialized")) then
    u0:SetAttribute("Initialized", true)
else
    error("OpenTextChatService has already been initialized in a different environment.", 2)
end
local u212 = u0:GetAttribute("Demo") == true
local u219 = u0:GetAttribute("Debug") == true
local Assets_2 = ReplicatedStorage:WaitForChild("Assets")
local Chat = Assets_2:WaitForChild("Chat")
local Modules = Chat:WaitForChild("Modules")
local Assets = Chat:WaitForChild("Assets")
local LocalPlayer = game.Players.LocalPlayer
local PlayerGui = LocalPlayer.PlayerGui
local AutoComplete = require(Modules.AutoComplete)
local WaitForChildWhichIsA = require(Modules.Util).WaitForChildWhichIsA
local u258 = WaitForChildWhichIsA(workspace, "Camera")
local DefaultBubbleChatConfiguration = Chat:FindFirstChild("DefaultBubbleChatConfiguration")
local TextChatConfiguration = Chat:FindFirstChild("TextChatConfiguration")
local u275 = WaitForChildWhichIsA(TextChatService, "ChatWindowConfiguration")
local u279 = WaitForChildWhichIsA(TextChatService, "ChatInputBarConfiguration")
local u283 = WaitForChildWhichIsA(TextChatService, "ChannelTabsConfiguration")
local u287 = WaitForChildWhichIsA(TextChatService, "BubbleChatConfiguration")
local ExperienceChat = Assets.ExperienceChat
local BubbleChat = Assets.BubbleChat
local appLayout = ExperienceChat.appLayout
local channelBar = appLayout.channelBar
local chatInputBar = appLayout.chatInputBar
local chatWindow = appLayout.chatWindow
local TextContainer = chatInputBar.Background.Container.TextContainer
local TargetChannelChip = TextContainer.TargetChannelChip
local TextBoxContainer = TextContainer.TextBoxContainer
local TextBox = TextContainer.TextBoxContainer.TextBox
local Border = chatInputBar.Background.Border
local Border_2 = channelBar.DropdownMenu.Border
local ContentContainer = channelBar.HorizontalBar.ContentContainer
local ScrollView = channelBar.DropdownMenu.ScrollView
local RCTScrollContentView = chatWindow.scrollingView.bottomLockedScrollView.RCTScrollView.RCTScrollContentView
local Padding = RCTScrollContentView["$layout"].Padding
local AutocompleteDropdown = chatInputBar.AutocompleteDropdown
local ScrollView_2 = AutocompleteDropdown.ScrollBarFrame.ScrollViewFrame.ScrollView
local OffsetFrame = ScrollView_2.OffsetFrame
local u320 = {AutoScrollThreshold = 1, RayDown = Vector3.new(0, -10, 0), RaycastInterval = 0.25}
local v4 = {}
local v5 = {}
v5[Enum.HorizontalAlignment.Left] = Vector3.new(0, 8, 0)
v5[Enum.HorizontalAlignment.Center] = Vector3.new(0.5, 0, 0.5)
v5[Enum.HorizontalAlignment.Right] = Vector3.new(1, -8, 1)
v4[Enum.HorizontalAlignment] = v5
v5 = {}
v5[Enum.VerticalAlignment.Top] = Vector3.new(0, 4, 0)
v5[Enum.VerticalAlignment.Center] = Vector3.new(0.5, 0, 0.5)
v5[Enum.VerticalAlignment.Bottom] = Vector3.new(1, -4, 1)
v4[Enum.VerticalAlignment] = v5
u320.Alignment = v4
u320.LongChatBounds = Vector2.new(math.huge, math.huge)
u320.BubbleChatBounds = Vector2.new(315, math.huge)
u320.DisplayBubbleOffset = Vector3.new(0, 1, 0.1)
u320.ZeroVector2 = Vector2.new(0, 0)
u320.CaretPadding = UDim.new(0, 8)
u320.NoPadding = UDim.new(0, 0)
v4 = {}
local v6 = utf8.char(57344)
v5 = utf8.char(57345)
v4[1] = v6
v4[2] = v5
v4[3] = utf8.char(57346)
u320.SpecialCharacters = v4
u320.ColorSequenceWhite = ColorSequence.new(Color3.new(255, 255, 255))
u320.NumberSequenceZero = NumberSequence.new(0)
u320.GuiInset = Vector2.new(58, 0)
u320.RBXAll = Instance.new("TextChannel")
u320.RBXAll.Name = "RBXAll"
local BindableEvent = Instance.new("BindableEvent")
local Event = BindableEvent.Event
local BindableEvent_2 = Instance.new("BindableEvent")
local BindableEvent_3 = Instance.new("BindableEvent")
local Event_2 = BindableEvent_3.Event
local BindableEvent_4 = Instance.new("BindableEvent")
local BindableEvent_5 = Instance.new("BindableEvent")
local Event_3 = BindableEvent_5.Event
function u320.KeyCodeToChar(p1) -- Line: 240
    if p1.Value >= 127 then
        return p1.Name
    end
    if 33 < p1.Value then
        return (string.char(p1.Value))
    end
    return p1.Name
end
function u320.DeepPipe(p1, p2, p3) -- Line: 248 -- upvalues: u320 (val)
    local v1 = u320.MultiConnection.new()
    for k, v in pairs(p1:GetDescendants()) do
        task.spawn(function() -- Line: 252 -- upvalues: p2 (val), v (val), v (val)
            p2.Instances[v] = p2.new(v)
        end)
    end
    if p3 ~= nil then
        p3()
    end
    v1:AddConnection(p1.DescendantAdded:Connect(function(p1) -- Line: 259 -- upvalues: p2 (val), p3 (val)
        if p2.Instances[p1] == nil then
            p2.Instances[p1] = p2.new(p1)
            if p3 ~= nil then
                p3()
            end
        end
    end))
    v1:AddConnection(p1.DescendantRemoving:Connect(function(p1) -- Line: 268 -- upvalues: p2 (val), p3 (val)
        if p2.Instances[p1] ~= nil then
            p2.Instances[p1]:CleanUp()
            p2.Instances[p1] = nil
            if p3 ~= nil then
                p3()
            end
        end
    end))
    return v1
end
function u320.Pipe(p1, p2, p3) -- Line: 281 -- upvalues: u320 (val)
    local v1 = u320.MultiConnection.new()
    for k, v in pairs(p1:GetChildren()) do
        task.spawn(function() -- Line: 285 -- upvalues: p2 (val), v (val), v (val)
            p2.Instances[v] = p2.new(v)
        end)
    end
    if p3 ~= nil then
        p3()
    end
    v1:AddConnection(p1.ChildAdded:Connect(function(p1) -- Line: 292 -- upvalues: p2 (val), p3 (val)
        if p2.Instances[p1] == nil then
            p2.Instances[p1] = p2.new(p1)
            if p3 ~= nil then
                p3()
            end
        end
    end))
    v1:AddConnection(p1.ChildRemoved:Connect(function(p1) -- Line: 301 -- upvalues: p2 (val), p3 (val)
        if p2.Instances[p1] ~= nil then
            p2.Instances[p1]:CleanUp()
            p2.Instances[p1] = nil
            if p3 ~= nil then
                p3()
            end
        end
    end))
    return v1
end
function u320.Observe(p1, p2) -- Line: 314 -- upvalues: u320 (val)
    local v1 = u320.MultiConnection.new()
    local u6 = {}
    for k, v in pairs(p1:GetChildren()) do
        task.spawn(function() -- Line: 318 -- upvalues: u6 (val), v (val), p2 (val)
            u6[v] = p2(v)
        end)
    end
    v1:AddConnection(p1.ChildAdded:Connect(function(p1) -- Line: 322 -- upvalues: u6 (val), p2 (val)
        u6[p1] = p2(p1)
    end))
    v1:AddConnection(p1.ChildRemoved:Connect(function(p1) -- Line: 325 -- upvalues: u6 (val)
        if u6[p1] ~= nil then
            u6[p1]()
            u6[p1] = nil
        end
    end))
    return v1
end
function u320.GetCoreGuiEnabled(p1) -- Line: 334 -- upvalues: StarterGui (val)
    return StarterGui:GetCoreGuiEnabled(p1)
end
function u320.SetCoreGuiEnabled(p1, p2) -- Line: 338 -- upvalues: StarterGui (val)
    StarterGui:SetCoreGuiEnabled(p1, p2)
end
function u320.GetCore(p1) -- Line: 342 -- upvalues: StarterGui (val)
    local u13, v1
    local u12 = p1
    while true do
        v1 = pcall(function() -- Line: 346 -- upvalues: u13 (ref), StarterGui (upval), u12 (val)
            u13 = StarterGui:GetCore(u12)
        end)
        if not v1 then
            task.wait()
        end
        if v1 then
            break
        end
    end
    return nil
end
function u320.SetCore(p1, p2) -- Line: 356 -- upvalues: StarterGui (val)
    local u12, u13, v1
    u12, u13 = p1, p2
    while true do
        v1 = pcall(function() -- Line: 359 -- upvalues: StarterGui (upval), u12 (val), u13 (val)
            StarterGui:SetCore(u12, u13)
        end)
        if not v1 then
            task.wait()
        end
        if v1 then
            break
        end
    end
end
u320.CoreGuiEnabled = u320.GetCoreGuiEnabled(Enum.CoreGuiType.Chat)
function u320.GetChatCoreGuiEnabled() -- Line: 369 -- upvalues: u320 (val)
    return u320.GetCoreGuiEnabled(Enum.CoreGuiType.Chat)
end
function u320.SetChatCoreGuiEnabled(p1) -- Line: 373 -- upvalues: u320 (val), BindableEvent_5 (val)
    u320.SetCoreGuiEnabled(Enum.CoreGuiType.Chat, p1)
    if u320.CoreGuiEnabled ~= p1 then
        u320.CoreGuiEnabled = p1
        BindableEvent_5:Fire()
    end
end
u320.ChatActive = nil
function u320.GetChatActive() -- Line: 382 -- upvalues: u320 (val)
    return u320.GetCore("ChatActive")
end
function u320.SetChatActive(p1) -- Line: 386 -- upvalues: u320 (val), BindableEvent_3 (val)
    u320.SetCore("ChatActive", p1)
    if u320.ChatActive ~= p1 then
        u320.ChatActive = p1
        BindableEvent_3:Fire()
    end
end
function u320.SetCoreGuiChatConnections() -- Line: 394 -- upvalues: u320 (val), BindableEvent (val), BindableEvent_2 (val), BindableEvent_4 (val)
    u320.SetCore("CoreGuiChatConnections", {
        ChatWindow = {
            ToggleVisibility = BindableEvent,
            SetVisible = BindableEvent,
            TopbarEnabledChanged = BindableEvent,
            CoreGuiEnabled = BindableEvent,
            VisibilityStateChanged = BindableEvent_2,
            MessagesChanged = BindableEvent_4,
        },
    })
end
function u320.CoreGuiChatConnectionsOwnership() -- Line: 407 -- upvalues: Event (val), u320 (val)
    local u0
    local v1 = Event:Connect(function() -- Line: 409 -- upvalues: u0 (ref)
        u0 = true
    end)
    local v2 = u320.GetChatCoreGuiEnabled()
    u320.SetChatCoreGuiEnabled(not v2)
    u320.SetChatCoreGuiEnabled(v2)
    task.wait()
    v1:Disconnect()
    return false
end
function u320.GetTextBounds(p1, p2, p3, p4, p5) -- Line: 420 -- upvalues: TextService (val)
    local GetTextBoundsParams = Instance.new("GetTextBoundsParams")
    GetTextBoundsParams.Font = p4
    GetTextBoundsParams.RichText = true
    GetTextBoundsParams.Size = p2
    GetTextBoundsParams.Text = p1
    GetTextBoundsParams.Width = p5.X
    local u32 = nil
    if not (pcall(function() -- Line: 434 -- upvalues: u32 (ref), TextService (upval), GetTextBoundsParams (val)
    local v1, v2
    u32 = TextService:GetTextBoundsAsync(GetTextBoundsParams)
    return
end)) then
        local GothamBold
        if p3 == Enum.Font.Unknown then
            GothamBold = Enum.Font.GothamBold
        elseif p3 == nil then
            GothamBold = Enum.Font.GothamBold
        else
            GothamBold = p3
        end
        u32 = TextService:GetTextSize(p1, p2, GothamBold, p5)
    end
    return u32
end
function u320.TransparencyMask(p1, p2) -- Line: 444
    return (1 - p2) * p1 + p2
end
function u320.FilterSpecialCharacters(p1) -- Line: 448 -- upvalues: u320 (val)
    local v1 = p1
    for k, v in pairs(u320.SpecialCharacters) do
        if v1 ~= "" then
            v1 = string.gsub(v1, v, "#")
        end
    end
    return v1
end
function u320.GetAbsoluteSize(p1, p2, p3) -- Line: 458
    local v1, v2
    local v3 = p2.X.Offset + p2.X.Scale * p1.X
    local v4 = p2.Y.Offset + p2.Y.Scale * p1.Y
    if not p3 then
        v1 = v3
    else
        v1 = math.clamp(v3, p3.MinSize.X, p3.MaxSize.X)
    end
    if not p3 then
        v2 = v4
    else
        v2 = math.clamp(v4, p3.MinSize.Y, p3.MaxSize.Y)
    end
    return Vector2.new(v1, v2)
end
function u320.LightAbsoluteSize(p1, p2, p3, p4, p5, p6) -- Line: 467
    local huge = p4
    if not huge then
        huge = math.huge
    end
    local v1 = math.clamp(p2.X.Offset + p2.X.Scale * p1.X, p3 or 0, huge)
    local huge_2 = p6
    if not huge_2 then
        huge_2 = math.huge
    end
    return Vector2.new(v1, (math.clamp(p2.Y.Offset + p2.Y.Scale * p1.Y, p5 or 0, huge_2)))
end
function u320.GetAbsolutePosition(p1, p2, p3, p4, p5, p6) -- Line: 481 -- upvalues: u320 (val)
    local v1 = u320.GetAbsoluteSize(p1, p3, p6)
    return Vector2.new(p4.X.Offset + p4.X.Scale * p1.X, p4.Y.Offset + p4.Y.Scale * p1.Y) + p2 - Vector2.new(p5.X * v1.X, p5.Y * v1.Y)
end
function u320.GetViewportSize() -- Line: 497 -- upvalues: u258 (val), GuiService (val)
    local ViewportSize = u258.ViewportSize
    local v1 = table.pack(GuiService:GetGuiInset())
    return Vector2.new(ViewportSize.X - v1[1].X - v1[2].X, ViewportSize.Y - v1[1].Y - v1[2].Y)
end
function u320.LightViewportSize() -- Line: 503 -- upvalues: u258 (val)
    local ViewportSize = u258.ViewportSize
    return Vector2.new(ViewportSize.X, ViewportSize.Y - 58)
end
u320.VirtualClassBuilder = {__type = "virtualClassBuilder"}
function u320.VirtualClassBuilder:Build(p2, p3) -- Line: 510
    if self.Builders[p3.ClassName] ~= nil then
        self.Builders[p3.ClassName](p2, p3)
    end
end
function u320.VirtualClassBuilder:Add(p2, p3) -- Line: 515
    self.Builders[p2] = p3
    return self
end
function u320.VirtualClassBuilder.new() -- Line: 522 -- upvalues: u320 (val)
    local v1 = setmetatable({}, {__index = u320.VirtualClassBuilder})
    v1.Builders = {}
    return v1
end
u320.VirtualConnection = {__type = "virtualConnection"}
function u320.VirtualConnection:Disconnect() -- Line: 530
    for k, v in pairs(self.virtualEvent.__connections) do
        if v == self then
            self.virtualEvent.__connections[k] = nil
        end
    end
end
function u320.VirtualConnection.new(p1, p2) -- Line: 537 -- upvalues: u320 (val)
    local v1 = {__connections = {}, __virtualBindable = p1, __function = p2}
    local v2 = {__index = u320.VirtualBindable}
    return (setmetatable(v1, v2))
end
u320.VirtualEvent = {__type = "virtualEvent"}
function u320.VirtualEvent:Destroy() -- Line: 545
    self.__connections = {}
end
function u320.VirtualEvent:Connect(p2) -- Line: 548 -- upvalues: u320 (val)
    local v1 = u320.VirtualConnection.new(self, p2)
    table.insert(self.__connections, v1)
    return v1
end
function u320.VirtualEvent:Fire(, ...) -- Line: 553
    local v1 = table.pack(...)
    for k, v in pairs(self.__connections) do
        task.spawn(v.__function, table.unpack(v1))
    end
end
function u320.VirtualEvent.new() -- Line: 559 -- upvalues: u320 (val)
    local v1 = {__connections = {}}
    local v2 = {__index = u320.VirtualEvent}
    return (setmetatable(v1, v2))
end
function u320.MethodCall(p1, p2) -- Line: 564
    return function(a1, ...) -- Line: 565 -- upvalues: p1 (val), p2 (val)
        return p1[p2](p1, ...)
    end
end
function u320.IsVirtual(p1) -- Line: 570
    if typeof(p1) ~= "table" then
        return false
    end
    if p1.__type == "virtualClass" then
        return true
    end
    return false
end
u320.VirtualClass = {__type = "virtualClass"}
function u320.VirtualClass:__cleanup() -- Line: 580
    self.__clean = true
end
function u320.VirtualClass.__call(p1) -- Line: 583
    return p1:GetInstance()
end
function u320.VirtualClass:GetInstance() -- Line: 586
    return self.__mirror
end
function u320.VirtualClass.__unm(p1) -- Line: 589
    return p1:GetInstance()
end
function u320.VirtualClass.__tostring(p1) -- Line: 592 -- upvalues: u219 (val), HttpService (val)
    if u219 then
        return (tostring(HttpService:JSONEncode(p1)))
    end
    return (("%* (Virtual)"):format((tostring(p1.__mirror))))
end
function u320.VirtualClass.__index(p1, p2) -- Line: 595 -- upvalues: u320 (val)
    local v1
    local v2 = getmetatable(p1)
    if rawget(v2, p2) ~= nil then
        return (rawget(v2, p2))
    end
    if rawget(p1, p2) ~= nil then
        return (rawget(p1, p2))
    end
    if p1.__getters[p2] ~= nil then
        v1 = p1.__getters[p2]
        return (v1(p1, p2))
    end
    if p1.__getters.FindFirstChild == nil then
        v1 = p1.__mirror[p2]
        local v3 = typeof(v1) == "function"
        if not v3 then
            return v1
        end
        local v4 = debug.info(v1, "n") ~= ""
        if v4 then
            return u320.MethodCall(p1.__mirror, p2)
        end
        return v1
    else
        v1 = p1.__getters.FindFirstChild(p1)
        v1 = v1(p1, p2)
        if v1 ~= nil then
            return v1
        end
    end
end
function u320.VirtualClass.__newindex(p1, p2, p3) -- Line: 624
    if p1.__setters[p2] == nil then
        p1.__mirror[p2] = p3
        return
    end
    local v1 = p1.__setters[p2](p1, p2, p3)
    if v1 == nil then
        v1 = true
    end
    if p1.__signals[p2] == nil then
        return
    end
    if p1.__signals[p2].Bindable ~= nil and v1 then
        p1.__signals[p2].Bindable:Fire()
    end
    p1.__changedBindable:Fire(p2)
end
function u320.VirtualClass:__addgetter(p2, p3) -- Line: 640
    self.__getters[p2] = p3
    return self
end
function u320.VirtualClass:__addsetter(p2, p3) -- Line: 644
    self.__setters[p2] = p3
    return self
end
function u320.VirtualClass:__addsignal(p2, p3) -- Line: 648
    local Event
    local v1 = nil
    if p3 ~= nil then
        Event = p3
    else
        v1 = Instance.new("BindableEvent")
        Event = v1.Event
    end
    if self.__signals[p2] == nil then
        self.__signals[p2] = {Signal = Event, Bindable = v1}
    end
    return self
end
function u320.VirtualClass:GetPropertyChangedSignal(p2) -- Line: 659
    if self.__signals[p2] == nil then
        return self.__mirror:GetPropertyChangedSignal(p2)
    end
    if rawget(self, "__clean") ~= true then
        return self.__signals[p2].Signal
    end
    return self.__mirror:GetPropertyChangedSignal(p2)
end
function u320.VirtualClass.new(p1) -- Line: 666 -- upvalues: u320 (val)
    local u1 = {__changedBindable = Instance.new("BindableEvent")}
    u1.Changed = u1.__changedBindable.Event
    p1.Changed:Connect(function(p1) -- Line: 670 -- upvalues: u1 (val)
        u1.__changedBindable:Fire(p1)
    end)
    u1.__mirror = p1
    u1.__class = {}
    u1.__getters = {}
    u1.__setters = {}
    u1.__signals = {}
    return (setmetatable(u1, u320.VirtualClass))
end
u320.VirtualTree = {}
function u320.VirtualTree:__cleanup() -- Line: 684
    for k, v in pairs(self.__connections) do
        v:Disconnect()
    end
end
function u320.VirtualTree:__autoresolve(p2) -- Line: 689 -- upvalues: u320 (val)
    if not (u320.IsVirtual(p2)) then
        return p2
    end
    if self.__autoresolveclasses == nil then
        return p2.__mirror
    end
    if table.find(self.__autoresolveclasses, p2.ClassName) then
        return p2
    end
    return p2.__mirror
end
function u320.VirtualTree:__adddefaults(p2) -- Line: 700 -- upvalues: u320 (val), HttpService (val)
    local __connections, __connections_2
    rawset(p2, "__util", {})
    rawset(p2, "__connections", {})
    rawset(p2, "__coroutines", {})
    local v1 = {}
    rawset(p2, "__waitbindables", v1)
    rawset(p2, "__cleanup", function(p1) -- Line: 706
        rawset(p1, "__clean", true)
        for k, v in pairs(p1.__connections) do
            v:Disconnect()
        end
        for k2, i in pairs(p1.__coroutines) do
            task.cancel(i)
        end
        for k3, j in pairs(p1.__waitbindables) do
            p1.__waitbindables[k3]:Fire()
            p1.__waitbindables[k3]:Destroy()
        end
        p1.__connections = {}
        p1.__coroutines = {}
        p1.__waitbindables = {}
    end)
    local __util = p2.__util
    __util.AncestryChanged = u320.VirtualEvent.new()
    local __util_2 = p2.__util
    __util_2.DescendantAdded = u320.VirtualEvent.new()
    local __util_3 = p2.__util
    __util_3.DescendantRemoving = u320.VirtualEvent.new()
    local __util_4 = p2.__util
    __util_4.DescendantChanged = u320.VirtualEvent.new()
    local __util_5 = p2.__util
    __util_5.ChildAdded = u320.VirtualEvent.new()
    local __util_6 = p2.__util
    __util_6.ChildRemoved = u320.VirtualEvent.new()
    local __util_7 = p2.__util
    __util_7.ChildChanged = u320.VirtualEvent.new()
    p2:__addgetter("AncestryChanged", function() -- Line: 731 -- upvalues: p2 (val)
        return p2.__util.AncestryChanged
    end)
    p2:__addsetter("AncestryChanged", function(p1, a2) -- Line: 734 -- upvalues: p2 (val)
        local v1 = ("%* is not a valid member of %* \"%*\""):format(a2, p2.__mirror.ClassName, p2.__mirror.Name)
        error(v1, 2)
    end)
    p2:__addgetter("DescendantAdded", function() -- Line: 737 -- upvalues: p2 (val)
        return p2.__util.DescendantAdded
    end)
    p2:__addsetter("DescendantAdded", function(p1, a2) -- Line: 740 -- upvalues: p2 (val)
        local v1 = ("%* is not a valid member of %* \"%*\""):format(a2, p2.__mirror.ClassName, p2.__mirror.Name)
        error(v1, 2)
    end)
    p2:__addgetter("DescendantRemoving", function() -- Line: 743 -- upvalues: p2 (val)
        return p2.__util.DescendantRemoving
    end)
    p2:__addsetter("DescendantRemoving", function(p1, a2) -- Line: 746 -- upvalues: p2 (val)
        local v1 = ("%* is not a valid member of %* \"%*\""):format(a2, p2.__mirror.ClassName, p2.__mirror.Name)
        error(v1, 2)
    end)
    p2:__addgetter("ChildAdded", function() -- Line: 749 -- upvalues: p2 (val)
        return p2.__util.ChildAdded
    end)
    p2:__addsetter("ChildAdded", function(p1, a2) -- Line: 752 -- upvalues: p2 (val)
        local v1 = ("%* is not a valid member of %* \"%*\""):format(a2, p2.__mirror.ClassName, p2.__mirror.Name)
        error(v1, 2)
    end)
    p2:__addgetter("ChildRemoved", function() -- Line: 755 -- upvalues: p2 (val)
        return p2.__util.ChildRemoved
    end)
    p2:__addsetter("ChildRemoved", function(p1, a2) -- Line: 758 -- upvalues: p2 (val)
        local v1 = ("%* is not a valid member of %* \"%*\""):format(a2, p2.__mirror.ClassName, p2.__mirror.Name)
        error(v1, 2)
    end)
    rawset(p2, "__parent", function(p1) -- Line: 761 -- upvalues: self (val)
        if p1.__mirror.Parent == nil then
            return nil
        end
        return self.__descendants[p1.__mirror.Parent]
    end)
    p2:__addgetter("Parent", function(p1) -- Line: 767 -- upvalues: self (val)
        return self:__autoresolve(p1:__parent())
    end)
    p2:__addsetter("Parent", function(p1, p2) -- Line: 770 -- upvalues: u320 (upval)
        local __mirror
        if not (u320.IsVirtual(p2)) then
            __mirror = p2
        else
            __mirror = p2.__mirror
        end
        p1.__mirror.Parent = __mirror
    end)
    rawset(p2, "__getchildren", function(p1) -- Line: 776 -- upvalues: self (val)
        local v1 = {}
        for k, v in pairs(p1.__mirror:GetChildren()) do
            table.insert(v1, self.__descendants[v])
        end
        return v1
    end)
    p2:__addgetter("GetChildren", function(p1) -- Line: 783 -- upvalues: self (val)
        return function(a1) -- Line: 784 -- upvalues: p1 (val), self (upval)
            local v1 = p1:__getchildren()
            for k, v in pairs(v1) do
                v1[k] = self:__autoresolve(v)
            end
            return v1
        end
    end)
    rawset(p2, "__findfirstchild", function(p1, p2, p3) -- Line: 792
        local v1
        for k, v in pairs(p1:__getchildren()) do
            if v.Name == p2 then
                return v
            end
        end
        if not p3 then
            return nil
        end
        for k2, i in pairs(p1:__getchildren()) do
            v1 = i:__findfirstchild(p2, p3)
            if v1 ~= nil then
                return v1
            end
        end
        return nil
    end)
    p2:__addgetter("FindFirstChild", function(p1) -- Line: 808 -- upvalues: self (val)
        return function(a1, p2, p3) -- Line: 809 -- upvalues: self (upval), p1 (val)
            return self:__autoresolve(p1:__findfirstchild(p2, p3))
        end
    end)
    rawset(p2, "__findfirstchildofclass", function(p1, p2) -- Line: 813
        for k, v in pairs(p1:__getchildren()) do
            if v.ClassName == p2 then
                return v
            end
        end
        return nil
    end)
    p2:__addgetter("FindFirstChildOfClass", function(p1) -- Line: 821 -- upvalues: self (val)
        return function(a1, p2) -- Line: 822 -- upvalues: self (upval), p1 (val)
            return self:__autoresolve(p1:__findfirstchildofclass(p2))
        end
    end)
    rawset(p2, "__findfirstchildwhichisa", function(p1, p2, p3) -- Line: 826
        local v1
        for k, v in pairs(p1:__getchildren()) do
            if v:IsA(p2) then
                return v
            end
        end
        if not p3 then
            return nil
        end
        for k2, i in pairs(p1:__getchildren()) do
            v1 = i:__findfirstchildwhichisa(p2, p3)
            if v1 ~= nil then
                return v1
            end
        end
        return nil
    end)
    p2:__addgetter("FindFirstChildWhichIsA", function(p1) -- Line: 842 -- upvalues: self (val)
        return function(a1, p2, p3) -- Line: 843 -- upvalues: self (upval), p1 (val)
            return self:__autoresolve(p1:__findfirstchildwhichisa(p2, p3))
        end
    end)
    rawset(p2, "__isdescendantof", function(p1, p2) -- Line: 847 -- upvalues: u320 (upval), self (val)
        local v1
        if not (u320.IsVirtual(p2)) then
            v1 = self.__descendants[p2]
        else
            v1 = p2
        end
        local Parent = p1.Parent
        while Parent ~= nil do
            if Parent == v1 then
                return true
            end
            Parent = Parent.Parent
        end
        return false
    end)
    p2:__addgetter("IsDescendantOf", function(p1) -- Line: 858
        return function(a1, p2) -- Line: 859 -- upvalues: p1 (val)
            return p1:__isdescendantof(p2)
        end
    end)
    rawset(p2, "__isancestorof", function(p1, p2) -- Line: 863 -- upvalues: u320 (upval), self (val)
        local v1
        if not (u320.IsVirtual(p2)) then
            v1 = self.__descendants[p2]
        else
            v1 = p2
        end
        if v1 == nil then
            return false
        end
        return v1:__isdescendantof(p1)
    end)
    p2:__addgetter("IsAncestorOf", function(p1) -- Line: 872
        return function(a1, p2) -- Line: 873 -- upvalues: p1 (val)
            return p1:__isancestorof(p2)
        end
    end)
    rawset(p2, "__getdescendants", function(p1) -- Line: 877
        local add
        local u1 = {}
        function add(a1) -- Line: 879 -- upvalues: p1 (val), u1 (val), add (val)
            if a1 ~= p1 then
                table.insert(u1, a1)
            end
            for k, v in pairs(a1:__getchildren()) do
                add(v)
            end
        end
        add(p1)
        return u1
    end)
    p2:__addgetter("GetDescendants", function(p1) -- Line: 890 -- upvalues: self (val)
        return function(a1) -- Line: 891 -- upvalues: p1 (val), self (upval)
            local v1 = p1:__getdescendants()
            for k, v in pairs(v1) do
                v[k] = self:__autoresolve(v)
            end
            return v1
        end
    end)
    rawset(p2, "__findfirstancestor", function(p1, p2) -- Line: 899
        local Parent = p1:__parent()
        while Parent ~= nil do
            if Parent.Name == p2 then
                return Parent
            end
            Parent = Parent.Parent
        end
        return nil
    end)
    p2:__addgetter("FindFirstAncestor", function(p1) -- Line: 909 -- upvalues: self (val)
        return function(a1, p2) -- Line: 910 -- upvalues: self (upval), p1 (val)
            return self:__autoresolve(p1:__findfirstancestor(p2))
        end
    end)
    rawset(p2, "__findfirstancestorofclass", function(p1, p2) -- Line: 914
        local Parent = p1:__parent()
        while Parent ~= nil do
            if Parent.ClassName == p2 then
                return Parent
            end
            Parent = Parent.Parent
        end
        return nil
    end)
    p2:__addgetter("FindFirstAncestorOfClass", function(p1) -- Line: 924 -- upvalues: self (val)
        return function(a1, p2) -- Line: 925 -- upvalues: self (upval), p1 (val)
            return self:__autoresolve(p1:__findfirstancestorofclass(p2))
        end
    end)
    rawset(p2, "__findfirstancestorwhichisa", function(p1, p2) -- Line: 929
        local Parent = p1:__parent()
        while Parent ~= nil do
            if Parent:IsA("ClassName") then
                return Parent
            end
            Parent = Parent.Parent
        end
        return nil
    end)
    p2:__addgetter("FindFirstAncestorWhichIsA", function(p1) -- Line: 939 -- upvalues: self (val)
        return function(a1, p2) -- Line: 940 -- upvalues: self (upval), p1 (val)
            return self:__autoresolve(p1:__findfirstancestorwhichisa(p2))
        end
    end)
    rawset(p2, "__waitforchild", function(p1, p2, p3) -- Line: 946 -- upvalues: HttpService (upval)
        local __coroutines, v1
        local u6 = p1:FindFirstChild(p2)
        if u6 ~= nil then
            return u6
        end
        local u11 = HttpService:GenerateGUID(false)
        local v2 = HttpService:GenerateGUID(false)
        local v3 = HttpService:GenerateGUID(false)
        local v4 = HttpService:GenerateGUID(false)
        local __waitbindables = p1.__waitbindables
        __waitbindables[u11] = Instance.new("BindableEvent")
        local __connections = p1.__connections
        __connections[v3] = p1.__util.ChildAdded:Connect(function(a1) -- Line: 957 -- upvalues: p2 (val), u6 (ref), p1 (val), u11 (val)
            if a1.Name == p2 then
                u6 = a1
                p1.__waitbindables[u11]:Fire()
            end
        end)
        local __connections_2 = p1.__connections
        __connections_2[v2] = p1.__util.ChildChanged:Connect(function(a1, a2) -- Line: 963 -- upvalues: p2 (val), u6 (ref), p1 (val), u11 (val)
            if a1.Name == p2 then
                u6 = a1
                p1.__waitbindables[u11]:Fire()
            end
        end)
        if p3 == math.huge then
            v1 = nil
        elseif tostring(p3) ~= "nan" then
            v1 = p3
        end
        if v1 ~= nil then
            __coroutines = p1.__coroutines
            __coroutines[v4] = task.delay(v1, p1.__waitbindables[u11].Fire, p1.__waitbindables[u11])
        end
        p1.__waitbindables[u11].Event:Wait()
        if p1.__waitbindables[u11] ~= nil then
            p1.__waitbindables[u11]:Destroy()
            p1.__waitbindables[u11] = nil
        end
        if p1.__connections[v3] ~= nil then
            p1.__connections[v3]:Disconnect()
            p1.__connections[v3] = nil
        end
        if p1.__connections[v2] ~= nil then
            p1.__connections[v2]:Disconnect()
            p1.__connections[v2] = nil
        end
        if v1 ~= nil and p1.__coroutines[v4] ~= nil then
            task.cancel(p1.__coroutines[v4])
            p1.__coroutines[v4] = nil
        end
        return u6
    end)
    p2:__addgetter("WaitForChild", function(p1) -- Line: 998 -- upvalues: self (val)
        return function(a1, p2, p3) -- Line: 999 -- upvalues: self (upval), p1 (val)
            return self:__autoresolve(p1:__waitforchild(p2, p3))
        end
    end)
    __connections = p2.__connections
    __connections.AncestryChanged = p2.__mirror.AncestryChanged:Connect(function(p1, a2) -- Line: 1004 -- upvalues: p2 (val), self (val), self (val)
        local v1 = self:__autoresolve(self.__descendants[p1])
        p2.__util.AncestryChanged:Fire(v1, self.__descendants[a2])
    end)
    __connections_2 = p2.__connections
    __connections_2.DescendantRemoving = p2.__mirror.DescendantRemoving:Connect(function(p1) -- Line: 1010 -- upvalues: p2 (val), self (val), self (val)
        p2.__util.DescendantRemoving:Fire(self:__autoresolve(self.__descendants[p1]))
    end)
    local __connections_3 = p2.__connections
    __connections_3.ChildRemoved = p2.__mirror.ChildRemoved:Connect(function(p1) -- Line: 1013 -- upvalues: p2 (val), self (val), self (val)
        p2.__util.ChildRemoved:Fire(self:__autoresolve(self.__descendants[p1]))
    end)
    local __connections_4 = p2.__connections
    __connections_4.Changed = p2.Changed:Connect(function(p1) -- Line: 1016 -- upvalues: self (val), p2 (val)
        self:__descendantchanged(p2, p1, true)
    end)
    if self.__virtualBuilder ~= nil then
        self.__virtualBuilder:Build(self, p2)
    end
end
function u320.VirtualTree:__descendantadded(p2, p3) -- Line: 1024 -- upvalues: u320 (val)
    local v1
    if p3 ~= nil then
        v1 = p3
    else
        v1 = true
    end
    local v2 = u320.VirtualClass.new(p2)
    self:__adddefaults(v2)
    self.__descendants[v2.__mirror] = v2
    if v1 then
        local Parent = v2.Parent
        if u320.IsVirtual(Parent) then
            Parent.__util.ChildAdded:Fire(self:__autoresolve(v2))
            while u320.IsVirtual(Parent) do
                Parent.__util.DescendantAdded:Fire(self:__autoresolve(v2))
                Parent = Parent.Parent
            end
        end
    end
end
function u320.VirtualTree:__descendantchanged(p2, p3, p4) -- Line: 1042 -- upvalues: u320 (val)
    local v1
    if p4 ~= nil then
        v1 = p4
    else
        v1 = true
    end
    if v1 then
        local Parent = p2.Parent
        if u320.IsVirtual(Parent) then
            local v2 = self:__autoresolve(p2)
            Parent.__util.ChildChanged:Fire(v2, p3)
            while u320.IsVirtual(Parent) do
                v2 = self:__autoresolve(p2)
                Parent.__util.DescendantChanged:Fire(v2, p3)
                Parent = Parent.Parent
            end
        end
    end
end
function u320.VirtualTree:__descendantremoving(p2, p3) -- Line: 1057
    if p3 ~= nil then end
    local v1 = self.__descendants[p2]
    if v1 == nil then
        return
    end
    v1:__cleanup()
    task.delay(0, function() -- Line: 1066 -- upvalues: self (val), p2 (val)
        self.__descendants[p2] = nil
    end)
end
function u320.VirtualTree.__getdescedents(p1) -- Line: 1070
    return p1.__descendants
end
function u320.VirtualTree:GetRoot() -- Line: 1073
    return self.__root
end
function u320.VirtualTree.new(p1, p2, p3) -- Line: 1076 -- upvalues: u320 (val)
    local u8 = setmetatable({}, {__index = u320.VirtualTree})
    u8.__root = u320.VirtualClass.new(p1)
    u8.__connections = {}
    u8.__descendants = {}
    u8.__virtualBuilder = p2
    u8.__autoresolveclasses = p3
    u8.__descendants[p1] = u8.__root
    u8:__adddefaults(u8.__root)
    for k, v in pairs(u8.__root.__mirror:GetDescendants()) do
        u8:__descendantadded(v, false)
    end
    local __connections = u8.__connections
    __connections.DescendantAdded = u8.__root.__mirror.DescendantAdded:Connect(function(p1) -- Line: 1094 -- upvalues: u8 (val)
        u8:__descendantadded(p1)
    end)
    local __connections_2 = u8.__connections
    __connections_2.DescendantRemoving = u8.__root.__mirror.DescendantRemoving:Connect(function(p1) -- Line: 1097 -- upvalues: u8 (val)
        u8:__descendantremoving(p1)
    end)
    return u8
end
TextChatConfiguration.Parent = TextChatService
local Root = u320.VirtualTree.new(TextChatService, nil, {
    "ChatWindowConfiguration",
    "ChatInputBarConfiguration",
    "ChannelTabsConfiguration",
    "BubbleChatConfiguration",
    "TextChatService",
    "Configuration",
}):GetRoot()
Name = TextChatConfiguration.Name
local u585 = Root:FindFirstChild(Name)
local ChatWindowConfiguration = Root:FindFirstChildWhichIsA("ChatWindowConfiguration")
local ChatInputBarConfiguration = Root:FindFirstChildWhichIsA("ChatInputBarConfiguration")
local ChannelTabsConfiguration = Root:FindFirstChildWhichIsA("ChannelTabsConfiguration")
local BubbleChatConfiguration = Root:FindFirstChildWhichIsA("BubbleChatConfiguration")
u585:__addgetter("OptionToViewUntranslatedMessage", function(p1, p2) -- Line: 1128 -- upvalues: TextChatConfiguration (val)
    return TextChatConfiguration:GetAttribute(p2)
end)
u585:__addsetter("OptionToViewUntranslatedMessage", function(p1, p2, p3) -- Line: 1131 -- upvalues: TextChatConfiguration (val)
    TextChatConfiguration:SetAttribute(p2, p3)
end)
u585:__addsignal("OptionToViewUntranslatedMessage", TextChatConfiguration:GetAttributeChangedSignal("OptionToViewUntranslatedMessage"))
u585:__addgetter("BackgroundFadeOutTime", function(p1, p2) -- Line: 1138 -- upvalues: TextChatConfiguration (val)
    return TextChatConfiguration:GetAttribute(p2)
end)
u585:__addsetter("BackgroundFadeOutTime", function(p1, p2, p3) -- Line: 1141 -- upvalues: TextChatConfiguration (val)
    TextChatConfiguration:SetAttribute(p2, p3)
end)
u585:__addsignal("BackgroundFadeOutTime", TextChatConfiguration:GetAttributeChangedSignal("BackgroundFadeOutTime"))
u585:__addgetter("TextFadeOutTime", function(p1, p2) -- Line: 1148 -- upvalues: TextChatConfiguration (val)
    return TextChatConfiguration:GetAttribute(p2)
end)
u585:__addsetter("TextFadeOutTime", function(p1, p2, p3) -- Line: 1151 -- upvalues: TextChatConfiguration (val)
    TextChatConfiguration:SetAttribute(p2, p3)
end)
u585:__addsignal("TextFadeOutTime", TextChatConfiguration:GetAttributeChangedSignal("TextFadeOutTime"))
u585:__addgetter("MaxMessages", function(p1, p2) -- Line: 1158 -- upvalues: TextChatConfiguration (val)
    return TextChatConfiguration:GetAttribute(p2)
end)
u585:__addsetter("MaxMessages", function(p1, p2, p3) -- Line: 1161 -- upvalues: TextChatConfiguration (val)
    TextChatConfiguration:SetAttribute(p2, p3)
end)
u585:__addsignal("MaxMessages", TextChatConfiguration:GetAttributeChangedSignal("MaxMessages"))
u585:__addgetter("FilterSpecialCharacters", function(p1, p2) -- Line: 1165 -- upvalues: TextChatConfiguration (val)
    return TextChatConfiguration:GetAttribute(p2)
end)
u585:__addsetter("FilterSpecialCharacters", function(p1, p2, p3) -- Line: 1168 -- upvalues: TextChatConfiguration (val)
    TextChatConfiguration:SetAttribute(p2, p3)
end)
u585:__addsignal("FilterSpecialCharacters", TextChatConfiguration:GetAttributeChangedSignal("FilterSpecialCharacters"))
u585:__addgetter("OpenBubbleChatEnabled", function(p1, p2) -- Line: 1175
    return p1.__class[p2]
end)
u585:__addsetter("OpenBubbleChatEnabled", function(p1, p2, p3) -- Line: 1178
    error("Unable to assign property OpenBubbleChatEnabled. Property is read only", 2)
end)
u585:__addsignal("OpenBubbleChatEnabled")
local __class = u585.__class
__class.OpenBubbleChatEnabled = TextChatConfiguration:GetAttribute("OpenBubbleChatEnabled")
u585:__addgetter("OpenTextChatEnabled", function(p1, p2) -- Line: 1183
    return p1.__class[p2]
end)
u585:__addsetter("OpenTextChatEnabled", function(p1, p2, p3) -- Line: 1186
    error("Unable to assign property OpenBubbleChatEnabled. Property is read only", 2)
end)
u585:__addsignal("OpenTextChatEnabled")
local __class_2 = u585.__class
__class_2.OpenTextChatEnabled = TextChatConfiguration:GetAttribute("OpenTextChatEnabled")
Root:__addgetter("ChatAbsolutePosition", function(p1, p2) -- Line: 1193
    error("TextChatService.ChatAbsolutePosition is not accessible when TextChatConfiguration.OpenTextChatEnabled is set to false", 2)
end)
Root:__addsetter("ChatAbsolutePosition", function(p1, p2, p3) -- Line: 1199
    error("TextChatService.ChatAbsolutePosition is not accessible when TextChatConfiguration.OpenTextChatEnabled is set to false", 2)
end)
Root:__addsignal("ChatAbsolutePosition")
Root:__addgetter("ChatAbsoluteSize", function(p1, p2) -- Line: 1206
    error("TextChatService.ChatAbsoluteSize is not accessible when TextChatConfiguration.OpenTextChatEnabled is set to false", 2)
end)
Root:__addsetter("ChatAbsoluteSize", function(p1, p2, p3) -- Line: 1212
    error("TextChatService.ChatAbsoluteSize is not accessible when TextChatConfiguration.OpenTextChatEnabled is set to false", 2)
end)
Root:__addsignal("ChatAbsoluteSize")
Root:__addgetter("ChatBackgroundFaded", function(p1, p2) -- Line: 1219
    error("TextChatService.ChatBackgroundFaded is not accessible when TextChatConfiguration.OpenTextChatEnabled is set to false", 2)
end)
Root:__addsetter("ChatBackgroundFaded", function(p1, p2, p3) -- Line: 1225
    error("TextChatService.ChatBackgroundFaded is not accessible when TextChatConfiguration.OpenTextChatEnabled is set to false", 2)
end)
Root:__addsignal("ChatBackgroundFaded")
Root:__addgetter("ChatTextFaded", function(p1, p2) -- Line: 1232
    error("TextChatService.ChatTextFaded is not accessible when TextChatConfiguration.OpenTextChatEnabled is set to false", 2)
end)
Root:__addsetter("ChatTextFaded", function(p1, p2, p3) -- Line: 1238
    error("TextChatService.ChatTextFaded is not accessible when TextChatConfiguration.OpenTextChatEnabled is set to false", 2)
end)
Root:__addsignal("ChatTextFaded")
Root:__addgetter("OpenChat", function(p1) -- Line: 1245 -- upvalues: u320 (val)
    return function(p1) -- Line: 1246 -- upvalues: u320 (upval)
        task.spawn(u320.SetChatActive, true)
    end
end)
Root:__addgetter("CloseChat", function(p1) -- Line: 1250 -- upvalues: u320 (val)
    return function(p1) -- Line: 1251 -- upvalues: u320 (upval)
        task.spawn(u320.SetChatActive, false)
    end
end)
Root:__addgetter("ChatVisible", function(p1, p2) -- Line: 1255 -- upvalues: u320 (val)
    warn("TextChatService.ChatVisible is deprecated, Please use TextChatService.ChatActive instead")
    return u320.ChatActive
end)
Root:__addsetter("ChatVisible", function(p1, p2, p3) -- Line: 1259 -- upvalues: u320 (val)
    warn("TextChatService.ChatVisible is deprecated, Please use TextChatService.ChatActive instead")
    if p3 then
        u320.SetChatActive(true)
        return
    end
    u320.SetChatActive(false)
end)
Root:__addsignal("ChatVisible", Event_2)
Root:__addgetter("ChatActive", function(p1, p2) -- Line: 1268 -- upvalues: u320 (val)
    return u320.ChatActive
end)
Root:__addsetter("ChatActive", function(p1, p2, p3) -- Line: 1271 -- upvalues: u320 (val)
    if p3 then
        task.spawn(u320.SetChatActive, true)
        u320.ChatActive = true
        return
    end
    task.spawn(u320.SetChatActive, false)
    u320.ChatActive = false
end)
Root:__addsignal("ChatActive", Event_2)
Root:__addgetter("CoreGuiEnabled", function(p1, p2) -- Line: 1281 -- upvalues: u320 (val)
    return u320.GetCoreGuiEnabled(Enum.CoreGuiType.Chat)
end)
Root:__addsetter("CoreGuiEnabled", function(p1, p2, p3) -- Line: 1284 -- upvalues: u320 (val)
    if p3 then
        u320.SetChatCoreGuiEnabled(true)
        return
    end
    u320.SetChatCoreGuiEnabled(false)
end)
Root:__addsignal("CoreGuiEnabled", Event_3)
Root:__addgetter("CreateUserWhisperAsync", function(p1) -- Line: 1292 -- upvalues: u320 (val)
    return function(p1, p2) -- Line: 1293 -- upvalues: u320 (upval)
        return u320.CreateUserWhsiper(p2)
    end
end)
function u320.UpdateTextBox() -- Line: 1298 -- upvalues: ChatInputBarConfiguration (val), u279 (val), TextBox (val), PlayerGui (val)
    local v1
    local TextBox_2 = ChatInputBarConfiguration.TextBox
    local v2 = u279
    if TextBox_2 == nil then
        if not (TextBox:IsDescendantOf(PlayerGui)) then end
        v1 = nil
    elseif not (TextBox_2:IsDescendantOf(PlayerGui)) then
        v1 = nil
    else
        v1 = TextBox_2
    end
    v2.TextBox = v1
end
function u320.OwnsTextBox() -- Line: 1312 -- upvalues: u279 (val), ChatInputBarConfiguration (val)
    local v1 = if u279.TextBox == nil then ChatInputBarConfiguration.TextBox == nil else false
    return v1
end
u320.MultiConnection = {__type = "multiConnection"}
function u320.MultiConnection:CleanUp() -- Line: 1319
    for k, v in pairs(self.Connections) do
        v:Disconnect()
    end
    self.Connections = {}
end
function u320.MultiConnection:Disconnect() -- Line: 1325
    self:CleanUp()
end
function u320.MultiConnection:AddConnection(p2) -- Line: 1328
    table.insert(self.Connections, p2)
    return self
end
function u320.MultiConnection.new() -- Line: 1332 -- upvalues: u320 (val)
    local v1 = setmetatable({}, {__index = u320.MultiConnection})
    v1.Connections = {}
    return v1
end
u320.InstanceBind = {__type = "propertyBind"}
function u320.InstanceBind:Disconnect() -- Line: 1339
    self.Connection:Disconnect()
end
function u320.InstanceBind:Update() -- Line: 1342 -- upvalues: u219 (val)
    local v1
    if u219 then
        local FullName_2
        local FullName = self.BindInstance:GetFullName()
        if self.UpdateDependency ~= nil then
            FullName_2 = self.UpdateDependency:GetFullName()
        else
            FullName_2 = nil
        end
        print("InstanceBind", FullName, self.Properties, FullName_2, self.UpdateProperty)
    end
    self.BindState = true
    local v2 = self
    for k, v in pairs(self.Properties) do
        v1 = v2.BindInstance[v]
        for k2, i in pairs(v2.UpdateInstances) do
            if i[v] ~= v1 then
                i[v] = v1
            end
        end
    end
    if v2.UpdateFunction ~= nil then
        v2.UpdateFunction()
    end
end
function u320.InstanceBind:CanUpdate() -- Line: 1365
    if self.UpdateDependency == nil then
        return true
    end
    local v1 = self.UpdateDependency[self.UpdateProperty]
    local v2 = if v1 ~= nil then if v1 ~= false then self.BindState == false else false else false
    return v2
end
function u320.InstanceBind.new(p1, p2, p3, p4, p5, p6) -- Line: 1372 -- upvalues: u320 (val)
    local Connection_2, PropertyChangedSignal_2
    local v1 = {}
    local u11 = setmetatable(v1, {__index = u320.InstanceBind})
    if typeof(p2) == "table" then
        v1 = p2
    else
        v1 = {p2}
    end
    u11.Properties = v1
    u11.BindState = true
    u11.BindInstance = p1
    u11.UpdateDependency = p4
    if u11.UpdateDependency ~= nil then
        v1 = p5 or "Parent"
    else
        v1 = nil
    end
    u11.UpdateProperty = v1
    if typeof(p3) == "table" then
        v1 = p3
    else
        v1 = {p3}
    end
    u11.UpdateInstances = v1
    u11.Connection = u320.MultiConnection.new()
    if p6 == nil then
        v1 = nil
    else
        function v1() -- Line: 1389 -- upvalues: p6 (val), u11 (val)
            p6(u11)
        end
    end
    u11.UpdateFunction = v1
    for k, v in pairs(u11.Properties) do
        Connection_2 = u11.Connection
        PropertyChangedSignal_2 = u11.BindInstance:GetPropertyChangedSignal(v)
        Connection_2:AddConnection(PropertyChangedSignal_2:Connect(function() -- Line: 1394 -- upvalues: u11 (val)
            u11.BindState = false
            if u11:CanUpdate() then
                u11:Update()
            end
        end))
    end
    if u11.UpdateDependency ~= nil then
        local Connection = u11.Connection
        local PropertyChangedSignal = u11.UpdateDependency:GetPropertyChangedSignal(u11.UpdateProperty)
        Connection:AddConnection(PropertyChangedSignal:Connect(function() -- Line: 1403 -- upvalues: u11 (val)
            if u11:CanUpdate() then
                u11:Update()
            end
        end))
    end
    u11:Update()
    return u11
end
u320.PropertyBind = {__type = "propertyBind"}
function u320.PropertyBind:Disconnect() -- Line: 1415
    self.Connection:Disconnect()
end
function u320.PropertyBind:Update() -- Line: 1418 -- upvalues: u219 (val)
    if u219 then
        local FullName_2
        local FullName = self.BindInstance:GetFullName()
        if self.UpdateDependency ~= nil then
            FullName_2 = self.UpdateDependency:GetFullName()
        else
            FullName_2 = nil
        end
        print("PropertyBind", FullName, self.Properties, FullName_2, self.UpdateProperty)
    end
    self.BindState = true
    self.UpdateFunction()
end
function u320.PropertyBind:CanUpdate() -- Line: 1431
    if self.UpdateDependency == nil then
        return true
    end
    local v1 = self.UpdateDependency[self.UpdateProperty]
    local v2 = if v1 ~= nil then if v1 ~= false then self.BindState == false else false else false
    return v2
end
function u320.PropertyBind.new(p1, p2, p3, p4, p5) -- Line: 1438 -- upvalues: u320 (val)
    local Connection_2, PropertyChangedSignal_2
    local v1 = {}
    local u10 = setmetatable(v1, {__index = u320.PropertyBind})
    if typeof(p2) == "table" then
        v1 = p2
    else
        v1 = {p2}
    end
    u10.Properties = v1
    u10.BindState = true
    u10.BindInstance = p1
    u10.UpdateDependency = p3
    if u10.UpdateDependency ~= nil then
        v1 = p4 or "Parent"
    else
        v1 = nil
    end
    u10.UpdateProperty = v1
    if p5 == nil then
        v1 = nil
    else
        function v1() -- Line: 1452 -- upvalues: p5 (val), u10 (val)
            p5(u10)
        end
    end
    u10.UpdateFunction = v1
    u10.Connection = u320.MultiConnection.new()
    for k, v in pairs(u10.Properties) do
        Connection_2 = u10.Connection
        PropertyChangedSignal_2 = u10.BindInstance:GetPropertyChangedSignal(v)
        Connection_2:AddConnection(PropertyChangedSignal_2:Connect(function() -- Line: 1458 -- upvalues: u10 (val)
            u10.BindState = false
            if u10:CanUpdate() then
                u10:Update()
            end
        end))
    end
    if u10.UpdateDependency ~= nil then
        local Connection = u10.Connection
        local PropertyChangedSignal = u10.UpdateDependency:GetPropertyChangedSignal(u10.UpdateProperty)
        Connection:AddConnection(PropertyChangedSignal:Connect(function() -- Line: 1467 -- upvalues: u10 (val)
            if u10:CanUpdate() then
                u10:Update()
            end
        end))
    end
    return u10
end
u320.StyleBind = {}
function u320.StyleBind:Disconnect() -- Line: 1478
    self.Connection:Disconnect()
end
function u320.StyleBind:Add(p2, p3) -- Line: 1481
    local v1 = self.BindInstance[self.Property]
    if typeof(p3) ~= "table" then
        table.insert(self.Binds, {
            Instance = p2,
            Properties = {p3},
        })
        if p2[p3] == v1 then
            return self
        end
        p2[p3] = v1
        return self
    end
    table.insert(self.Binds, {Instance = p2, Properties = p3})
    for k, v in pairs(p3) do
        if p2[v] ~= v1 then
            p2[v] = v1
        end
    end
    return self
end
function u320.StyleBind:UpdateBinds() -- Line: 1498
    local v1 = self.BindInstance[self.Property]
    for k, v in pairs(self.Binds) do
        for k2, i in pairs(v.Properties) do
            if v.Instance[i] ~= v1 then
                v.Instance[i] = v1
            end
        end
    end
    return self
end
function u320.StyleBind:Update() -- Line: 1509 -- upvalues: u219 (val)
    if u219 then
        local FullName_2
        local FullName = self.BindInstance:GetFullName()
        if self.UpdateDependency ~= nil then
            FullName_2 = self.UpdateDependency:GetFullName()
        else
            FullName_2 = nil
        end
        print("StyleBind", FullName, self.Property, FullName_2, self.UpdateProperty)
    end
    self.BindState = true
    self:UpdateBinds()
end
function u320.StyleBind:CanUpdate() -- Line: 1522
    if self.UpdateDependency == nil then
        return true
    end
    local v1 = self.UpdateDependency[self.UpdateProperty]
    local v2 = if v1 ~= nil then if v1 ~= false then self.BindState == false else false else false
    return v2
end
function u320.StyleBind.new(p1, p2, p3, p4) -- Line: 1529 -- upvalues: u320 (val)
    local u9 = setmetatable({}, {__index = u320.StyleBind})
    u9.Property = p2
    u9.BindState = true
    local v1 = {}
    u9.Binds = v1
    u9.BindInstance = p1
    u9.UpdateDependency = p3
    if u9.UpdateDependency ~= nil then
        v1 = p4 or "Parent"
    else
        v1 = nil
    end
    u9.UpdateProperty = v1
    u9.Connection = u320.MultiConnection.new()
    local Connection = u9.Connection
    local PropertyChangedSignal = u9.BindInstance:GetPropertyChangedSignal(p2)
    Connection:AddConnection(PropertyChangedSignal:Connect(function() -- Line: 1543 -- upvalues: u9 (val)
        u9.BindState = false
        if u9:CanUpdate() then
            u9:Update()
        end
    end))
    if u9.UpdateDependency ~= nil then
        local Connection_2 = u9.Connection
        local PropertyChangedSignal_2 = u9.UpdateDependency:GetPropertyChangedSignal("Parent")
        Connection_2:AddConnection(PropertyChangedSignal_2:Connect(function() -- Line: 1550 -- upvalues: u9 (val)
            if u9:CanUpdate() then
                u9:Update()
            end
        end))
    end
    return u9
end
u320.Transparency = {}
function u320.Transparency:Disconnect() -- Line: 1560
    self.FadedChangedBindable:Destroy()
    self.TransparencyChangedBindable:Destroy()
    self.Connection:Disconnect()
    return self
end
function u320.Transparency:Add(p2, p3) -- Line: 1566
    local v1, v2, v3, v4, v5, v6
    if typeof(p2) == "table" then
        v2 = p2
    else
        v2 = {p2}
    end
    v1, v5 = self, p3
    for k, v in pairs(v2) do
        v1:Remove(v)
        v6 = nil
        if v5 == nil then
            v6 = Instance.new("UIGradient")
            v6.Parent = v
            v6.Name = "Transparency"
            v6.Transparency = NumberSequence.new(v1.Transparency)
        end
        v3 = {Instance = v, Gradient = v6}
        if v5 == nil then
            v4 = nil
        elseif typeof(v5) ~= "string" then
            v4 = v5
        else
            v4 = {v5}
        end
        v3.Properties = v4
        v1.Binds[v] = v3
    end
end
function u320.Transparency:Remove(p2) -- Line: 1588
    local v1, v2
    if typeof(p2) == "table" then
        v1 = p2
    else
        v1 = {p2}
    end
    local v3 = self
    for k, v in pairs(v1) do
        v2 = v3.Binds[v]
        if v2 ~= nil then
            if v2.Gradient ~= nil then
                v2.Gradient:Destroy()
            end
            v3.Binds[v] = nil
        end
    end
end
function u320.Transparency:SmoothDamp(p2) -- Line: 1602 -- upvalues: TweenService (val), u320 (val)
    local v1, v2
    v1, v2 = TweenService:SmoothDamp(self.Current, self.Target, self.Velocity, 0.15, 1000, p2)
    self.Current = v1
    self.Velocity = v2
    self.Transparency = math.round(self.Current * 1000) / 1000
    if self.Transparency ~= self.LastTransparency then
        local v3
        self.LastTransparency = self.Transparency
        v1 = NumberSequence.new(self.Transparency)
        local v4 = self
        for k, v in pairs(self.Binds) do
            if v.Gradient ~= nil then
                v.Gradient.Transparency = v1
                v3 = if v4.Transparency == 0 then v.Gradient.Color ~= u320.ColorSequenceWhite else true
                v.Gradient.Enabled = v3
            end
            if v.Properties ~= nil then
                for k2, i in pairs(v.Properties) do
                    v.Instance[i] = v4.Transparency
                end
            end
        end
        v4.TransparencyChangedBindable:Fire(v4.Transparency)
    end
end
function u320.Transparency:SetCurrent(p2, p3) -- Line: 1622
    self.Current = p2
    self.Transparency = math.round(self.Current * 1000) / 1000
    self.Velocity = p3
end
function u320.Transparency:SetTarget(p2) -- Line: 1627
    if self.Target ~= p2 then
        self.Target = p2
        local v1 = p2 == 1
        self.Faded = v1
        if self.Faded ~= self.Faded then
            self.FadedChangedBindable:Fire()
        end
    end
end
function u320.Transparency:Update(p2) -- Line: 1638
    self.BindState = true
    self:SmoothDamp(p2)
end
function u320.Transparency:CanUpdate() -- Line: 1642
    if self.UpdateDependency == nil then
        return true
    end
    local v1 = self.UpdateDependency[self.UpdateProperty]
    local v2 = if v1 ~= nil then if v1 ~= false then self.BindState == false else false else false
    return v2
end
function u320.Transparency.new(p1, p2, p3) -- Line: 1649 -- upvalues: u320 (val), RunService (val)
    local u8 = setmetatable({}, {__index = u320.Transparency})
    u8.FadedChangedBindable = Instance.new("BindableEvent")
    u8.FadedChanged = u8.FadedChangedBindable.Event
    u8.TransparencyChangedBindable = Instance.new("BindableEvent")
    u8.TransparencyChanged = u8.TransparencyChangedBindable.Event
    u8.BindState = true
    local v1 = {}
    u8.Binds = v1
    u8.InitialTransparency = p1
    u8.UpdateDependency = p2
    if u8.UpdateDependency ~= nil then
        v1 = p3 or "Parent"
    else
        v1 = nil
    end
    u8.UpdateProperty = v1
    u8.Connection = u320.MultiConnection.new()
    u8.Current = p1
    u8.Transparency = math.round(u8.Current * 1000) / 1000
    u8.Target = p1
    u8.Velocity = 0
    u8.Connection:AddConnection(RunService.Heartbeat:Connect(function(p1) -- Line: 1669 -- upvalues: u8 (val)
        u8.BindState = false
        if u8:CanUpdate() then
            u8:Update(p1)
        end
    end))
    return u8
end
function u320.IsWhisper(p1) -- Line: 1680
    if p1 == nil then
        return false
    end
    return string.match(p1.Name, "RBXWhisper:%d+_%d+")
end
function u320.IsTeam(p1) -- Line: 1687
    if p1 == nil then
        return false
    end
    return string.match(p1.Name, "RBXTeam.*")
end
function u320.GetChannelName(p1) -- Line: 1694 -- upvalues: u320 (val), LocalPlayer (val), Players (val)
    if p1 == nil then
        return ""
    end
    local Name = p1.Name
    if Name == "RBXGeneral" then
        return "General"
    end
    if u320.IsTeam(p1) then
        return "Team"
    end
    if not (u320.IsWhisper(p1)) then
        return Name
    end
    local v1 = string.gmatch(Name, "%d+")
    local UserId = LocalPlayer.UserId
    while UserId == LocalPlayer.UserId do
        UserId = v1()
    end
    local PlayerByUserId = Players:GetPlayerByUserId(UserId)
    if PlayerByUserId ~= nil then
        return PlayerByUserId.DisplayName
    end
    return Name
end
function u320.CreateUserWhsiper(p1) -- Line: 1719 -- upvalues: LocalPlayer (val), Players (val), TextChatService (val), ReplicatedStorage (val)
    local UserId, UserId_2
    if typeof(p1) ~= "number" or LocalPlayer.UserId == p1 or Players:GetPlayerByUserId(p1) == nil then
        return
    end
    if LocalPlayer.UserId >= p1 then
        UserId = p1
    else
        UserId = LocalPlayer.UserId
    end
    if LocalPlayer.UserId >= p1 then
        UserId_2 = LocalPlayer.UserId
    else
        UserId_2 = p1
    end
    local v1 = ("RBXWhisper:%*_%*"):format(UserId, UserId_2)
    for k, v in pairs(TextChatService:GetDescendants()) do
        if v.Name == v1 and v:IsA("TextChannel") then
            return v
        end
    end
    local RBXWhisper = ReplicatedStorage:WaitForChild("RBXWhisper")
    return RBXWhisper:InvokeServer(p1)
end
u320.Channels = {}
function u320.GetTextChannels() -- Line: 1744 -- upvalues: u320 (val)
    return u320.Channels
end
function u320.SetTextChannels() -- Line: 1748 -- upvalues: u320 (val)
    local v1 = {}
    for k, v in pairs(u320.TextChannel.Instances) do
        if v.TextChannel.Name ~= "RBXSystem" and v.TextChannel ~= u320.RBXAll then
            table.insert(v1, v)
        end
    end
    table.sort(v1, function(p1, p2) -- Line: 1755
        local v1 = p2.TextChannel.Name < p1.TextChannel.Name
        return v1
    end)
    u320.Channels = v1
end
function u320.UpdateChannelTabs() -- Line: 1763 -- upvalues: Assets (val), u320 (val), channelBar (val), ChatInputBarConfiguration (val)
    local DropdownChannelTab, PrimaryChannelTab, v1, v2, v3, v4
    local v5 = false
    local X = Assets.Elements.PrimaryChannelTab.UISizeConstraint.MinSize.X
    local v6 = {}
    for k, v in pairs((u320.GetTextChannels())) do
        if not v.LocalPlayerAdded then
            v:SetPrimaryVisibility(false)
            v:SetDropDownVisibility(false)
        else
            table.insert(v6, v)
        end
    end
    local v7 = #v6
    local v8 = v7 * X
    local X_2 = channelBar.AbsoluteSize.X
    if X_2 < v8 then
        while X_2 - channelBar.DropdownButton.Size.X.Offset < v8 do
            v5 = true
            v7 = v7 - 1
            v8 = v7 * X
        end
    end
    local v9 = {}
    local v10 = {}
    local v11 = {}
    local TargetTextChannel = ChatInputBarConfiguration.TargetTextChannel
    for k2, i in pairs(v6) do
        if #v9 < v7 then
            table.insert(v9, i)
        elseif 1 > #v9 then
            table.insert(v10, i)
        elseif i.TextChannel == TargetTextChannel then
            table.insert(v10, table.remove(v9, #v9))
            if #v9 >= v7 then
                v2 = v10
            else
                v2 = v9
            end
            table.insert(v2, i)
        end
    end
    for k3, j in pairs(v9) do
        table.insert(v11, j)
    end
    for k4, k5 in pairs(v10) do
        table.insert(v11, k5)
    end
    for k6, n in pairs(v11) do
        PrimaryChannelTab = n.PrimaryChannelTab
        DropdownChannelTab = n.DropdownChannelTab
        PrimaryChannelTab.LayoutOrder = k6
        v4 = k6 <= v7
        n:SetPrimaryVisibility(v4)
        v3 = if k6 >= v7 then if k6 ~= 1 then v5 else true else true
        PrimaryChannelTab.Divider.Visible = v3
        DropdownChannelTab.LayoutOrder = k6
        v4 = v7 < k6
        n:SetDropDownVisibility(v4)
        v3 = k6 < #v11
        DropdownChannelTab.Divider.Visible = v3
    end
    channelBar.DropdownButton.Visible = v5
    local ContentContainer = channelBar.HorizontalBar.ContentContainer
    if not v5 then
        v1 = UDim2.new(1, 0, 1, 0)
    else
        v1 = UDim2.new(1, -channelBar.DropdownButton.Size.X.Offset, 1, 0)
    end
    ContentContainer.Size = v1
    local v12 = Assets.Elements.DropdownChannelTab.Size.Y.Offset * math.min(#v10, 3)
    channelBar.DropdownMenu.Size = UDim2.fromOffset(Assets.Elements.DropdownChannelTab.Size.X.Offset, v12)
    local Visible = false
    for k7, m in pairs(v10) do
        Visible = m.PrimaryChannelTab.UnreadDot.Visible
        if Visible then
            break
        end
    end
    channelBar.DropdownButton.UnreadDot.Visible = Visible
end
function u320.UpdateTextChatMessages() -- Line: 1838 -- upvalues: ChannelTabsConfiguration (val), ChatInputBarConfiguration (val), u320 (val)
    local TargetTextChannel
    if not ChannelTabsConfiguration.Enabled then
        TargetTextChannel = u320.RBXAll
    else
        TargetTextChannel = ChatInputBarConfiguration.TargetTextChannel
    end
    local v1 = u320.TextChannel.Instances[TargetTextChannel]
    if v1 ~= nil then
        v1.PrimaryChannelTab.UnreadDot.Visible = false
        v1.DropdownChannelTab.UnreadDot.Visible = false
        for k, v in pairs(v1.TextChatMessages) do
            v:SetVisibility(true)
        end
    end
    if u320.LastTargetTextChannel == TargetTextChannel then
        return
    end
    local v2 = u320.TextChannel.Instances[u320.LastTargetTextChannel]
    u320.LastTargetTextChannel = TargetTextChannel
    if v2 ~= nil then
        for k2, i in pairs(v2.TextChatMessages) do
            i:SetVisibility(false)
        end
    end
end
function u320.ParseAutoComplete(p1, p2) -- Line: 1863
    local v1 = nil
    local v2 = nil
    local v3 = nil
    local v4 = string.sub(p1, 1, p2 - 1)
    local v5 = false
    local v6 = string.split(v4, ":")
    if v6[#v6] == "" then
        v5 = true
        table.remove(v6, #v6)
    end
    local v7 = v6[math.max(2, #v6)]
    table.remove(v6, #v6)
    if v7 ~= nil then
        local v8
        v1 = string.len((table.concat(v6, ":"))) + 1
        if not v5 then
            v8 = ""
        else
            v8 = ":"
        end
        v2 = (":%*%*"):format(v7, v8)
        v3 = string.len(v2)
    end
    local v9 = string.sub(p1, 1, 1) == "/"
    if v9 then
        v1 = 1
        v2 = string.sub(p1, 1, p2 - 1)
        v3 = string.len(v2)
    end
    return v1, v2, v3
end
function u320.FillAutoComplete(p1, p2, p3, p4) -- Line: 1889
    local Text = p1.Text
    local v1 = string.sub(Text, 1, p2 - 1)
    p1.Text = v1 .. p4 .. string.sub(Text, p2 + p3)
    p1.CursorPosition = p2 + string.len(p4)
end
u320.InstanceCache = {__type = "insatnceCache"}
function u320.InstanceCache:Get() -- Line: 1900
    local v1 = table.remove(self.Cache, 1)
    if not v1 then
        v1 = self.Instance:Clone()
    end
    return v1
end
function u320.InstanceCache:Relieve(p2) -- Line: 1903
    local v1 = #self.Cache
    if v1 >= self.Cap then
        p2:Destroy()
    else
        table.insert(self.Cache, p2)
    end
    p2.Parent = nil
end
function u320.InstanceCache.new(p1, p2) -- Line: 1911 -- upvalues: u320 (val)
    local v1 = {Cap = p2, Cache = {}, Instance = p1}
    local v2 = {__index = u320.InstanceCache}
    return (setmetatable(v1, v2))
end
local u950 = u320.InstanceCache.new(Assets.Elements.TextChatAutoComplete, 100)
if not u212 then
    TextChatMessage = Assets.Elements.TextChatMessage
else
    TextChatMessage = Assets.Demo.TextChatMessage
end
local u962 = u320.InstanceCache.new(TextChatMessage, 100)
local u970 = u320.InstanceCache.new(Assets.Elements.BubbleChatMessage, 100)
u320.TextChatMessage = {}
function u320.TextChatMessage:CleanUp() -- Line: 1930
    self.Connection:Disconnect()
end
function u320.TextChatMessage:Destroy() -- Line: 1933 -- upvalues: u962 (val)
    self:CleanUp()
    self:RemoveTransparency()
    if self.ChatMessage ~= nil then
        u962:Relieve(self.ChatMessage)
        self.ChatMessage = nil
    end
end
function u320.TextChatMessage:SetMessage(p2) -- Line: 1941 -- upvalues: ChannelTabsConfiguration (val), ChatInputBarConfiguration (val), u320 (val)
    local TargetTextChannel
    self.Message = p2
    if not ChannelTabsConfiguration.Enabled then
        TargetTextChannel = u320.RBXAll
    else
        TargetTextChannel = ChatInputBarConfiguration.TargetTextChannel
    end
    local v1 = self.TextChannel.TextChannel == TargetTextChannel
    self:SetVisibility(v1)
    local BodyText = self.BodyText
    BodyText.TextColor3 = self:GetProperty("TextColor3")
    local PrefixText = self.PrefixText
    PrefixText.TextColor3 = self:GetProperty("TextColor3", true)
    local BodyText_2 = self.BodyText
    BodyText_2.FontFace = self:GetProperty("FontFace")
    local PrefixText_2 = self.PrefixText
    PrefixText_2.FontFace = self:GetProperty("FontFace", true)
    local BodyText_3 = self.BodyText
    BodyText_3.TextSize = self:GetProperty("TextSize")
    local PrefixText_3 = self.PrefixText
    PrefixText_3.TextSize = self:GetProperty("TextSize", true)
    local BodyText_4 = self.BodyText
    BodyText_4.TextStrokeColor3 = self:GetProperty("TextStrokeColor3")
    local PrefixText_4 = self.PrefixText
    PrefixText_4.TextStrokeColor3 = self:GetProperty("TextStrokeColor3", true)
    local BodyText_5 = self.BodyText
    BodyText_5.TextStrokeTransparency = self:GetProperty("TextStrokeTransparency")
    local PrefixText_5 = self.PrefixText
    PrefixText_5.TextStrokeTransparency = self:GetProperty("TextStrokeTransparency", true)
    self:UpdateChat()
end
function u320.TextChatMessage:GetProperty(p2, p3) -- Line: 1959 -- upvalues: ChatWindowConfiguration (val)
    local v1, v2
    if p3 ~= nil then
        v1 = p3
    else
        v1 = false
    end
    if p2 == "Text" then
        v2 = self.Message[p2]
    elseif p2 ~= "Translation" and p2 ~= "PrefixText" then
        v2 = ChatWindowConfiguration[p2]
    end
    local ChatWindowMessageProperties = self.Message.ChatWindowMessageProperties
    if ChatWindowMessageProperties == nil then
        return v2
    end
    local PrefixTextProperties = ChatWindowMessageProperties.PrefixTextProperties
    if PrefixTextProperties == nil then
        if ChatWindowMessageProperties[p2] ~= "" then
            v2 = ChatWindowMessageProperties[p2]
        end
        return v2
    end
    if v1 then
        if PrefixTextProperties[p2] ~= "" then
            return PrefixTextProperties[p2]
        end
        return v2
    end
    if ChatWindowMessageProperties[p2] ~= "" then
        v2 = ChatWindowMessageProperties[p2]
    end
    return v2
end
function u320.TextChatMessage:UpdateChat() -- Line: 1980 -- upvalues: u320 (val), Root (val), u585 (val), ChatWindowConfiguration (val)
    local UIGradient, v1, v2, v3
    local Property = self:GetProperty("Text")
    local Property_2 = self:GetProperty("Translation")
    local Property_3 = self:GetProperty("PrefixText", true)
    if self.TextChannel.TextChannel ~= u320.RBXAll then
        local v4 = string.gsub(Property_3, "%[To .+%] ", "")
        v4 = string.gsub(v4, "%[From .+%] ", "")
        Property_3 = string.gsub(v4, "%[Team%] ", "")
    end
    print(self, self.Message, Property, Property_2, Property_3)
    local ChatTranslationEnabled = Root.ChatTranslationEnabled
    if ChatTranslationEnabled then
        ChatTranslationEnabled = Property_2 ~= ""
    end
    local OptionToViewUntranslatedMessage = ChatTranslationEnabled
    if OptionToViewUntranslatedMessage then
        OptionToViewUntranslatedMessage = u585.OptionToViewUntranslatedMessage
    end
    local TextSize = ChatWindowConfiguration.TextSize
    local v5 = TextSize - 2
    local v6 = u320.GetTextBounds(Property_3, TextSize, nil, ChatWindowConfiguration.FontFace, u320.LongChatBounds)
    local v7 = u320.GetTextBounds("  ", TextSize, nil, ChatWindowConfiguration.FontFace, u320.LongChatBounds).X / 2
    local v8 = math.round(v5 / v7)
    local Family = ChatWindowConfiguration.FontFace.Family
    local Name = ChatWindowConfiguration.FontFace.Weight.Name
    local TextSize_2 = ChatWindowConfiguration.TextSize
    local v9 = Property_3
    if Property_3 == "" then
        v2 = ""
    else
        v2 = " "
    end
    if not OptionToViewUntranslatedMessage then
        v3 = ""
    else
        v3 = string.rep(" ", v8 + 1)
    end
    local v10 = ("<font transparency='1.0' family='%*' weight='%*' size='%*'><stroke transparency='1.0'>%*</stroke></font>%*%*"):format(Family, Name, TextSize_2, v9, v2, v3)
    if not ChatTranslationEnabled then
        self.Translated = false
    end
    if not self.Translated then
        v1 = Property
    elseif ChatTranslationEnabled then
        v1 = Property_2
    end
    local v11 = v10
    if not u585.FilterSpecialCharacters then
        v9 = v1
    elseif self.Message.TextSource ~= nil then
        v9 = u320.FilterSpecialCharacters(v1 or "")
    end
    self.ChatMessage.TextMessage.Translate.Size = UDim2.fromOffset(v5, v5)
    if Property_3 == nil then
        v2 = 0
    else
        v2 = v7
    end
    v11 = v6.X + v2
    self.ChatMessage.TextMessage.Translate.Position = UDim2.fromOffset(v11, 0)
    self.ChatMessage.TextMessage.Translate.Visible = OptionToViewUntranslatedMessage
    if self.Message.ChatWindowMessageProperties == nil then
        UIGradient = nil
    elseif self.Message.ChatWindowMessageProperties.PrefixTextProperties == nil then
        UIGradient = nil
    else
        UIGradient = self.Message.ChatWindowMessageProperties.PrefixTextProperties:FindFirstChildWhichIsA("UIGradient")
    end
    local UIGradient_2 = self.PrefixText:FindFirstChildWhichIsA("UIGradient")
    if UIGradient == nil then
        UIGradient_2.Color = u320.ColorSequenceWhite
        UIGradient_2.Offset = u320.ZeroVector2
        UIGradient_2.Rotation = 0
    else
        UIGradient_2.Color = UIGradient.Color
        UIGradient_2.Offset = UIGradient.Offset
        UIGradient_2.Rotation = UIGradient.Rotation
    end
    self.PrefixText.Text = Property_3
    self.BodyText.Text = ("%*%*"):format(v11, v9)
end
function u320.TextChatMessage:AddTransparency() -- Line: 2046 -- upvalues: u320 (val)
    u320.TextFadeTransparency:Add({self.ChatMessage.TextMessage.Translate, self.PrefixText, self.BodyText})
end
function u320.TextChatMessage:RemoveTransparency() -- Line: 2049 -- upvalues: u320 (val)
    u320.TextFadeTransparency:Remove({self.ChatMessage.TextMessage.Translate, self.PrefixText, self.BodyText})
end
function u320.TextChatMessage:SetVisibility(p2) -- Line: 2052 -- upvalues: RCTScrollContentView (val)
    if self.Visible ~= p2 then
        local v1
        self.Visible = p2
        if not p2 then
            v1 = nil
        else
            v1 = RCTScrollContentView
        end
        self.ChatMessage.Parent = v1
    end
end
function u320.TextChatMessage.new(p1, p2) -- Line: 2058 -- upvalues: u320 (val), Root (val), u962 (val), u585 (val), ChatWindowConfiguration (val), u212 (val), GuiService (val), ChatInputBarConfiguration (val)
    local u7 = setmetatable({}, {__index = u320.TextChatMessage})
    u7.TextChannel = p1
    u7.Connection = u320.MultiConnection.new()
    u7.Translated = Root.ChatTranslationEnabled
    u7.ChatMessage = u962:Get()
    u7.ChatMessage.Visible = true
    u7.ChatMessage.Parent = nil
    u7.BodyText = u7.ChatMessage.TextMessage.BodyText
    u7.PrefixText = u7.ChatMessage.TextMessage.PrefixText
    u7:AddTransparency()
    u7:SetMessage(p2)
    u7.Connection:AddConnection(u320.PropertyBind.new(u585, {"OptionToViewUntranslatedMessage"}, u7.ChatMessage, "Parent", function() -- Line: 2085 -- upvalues: u7 (val), Root (upval)
        u7.Translated = Root.ChatTranslationEnabled
        u7:UpdateChat()
    end))
    u7.Connection:AddConnection(u7.ChatMessage.TextMessage.Translate.Activated:Connect(function() -- Line: 2091 -- upvalues: u7 (val), Root (upval), u585 (upval)
        u7.ChatMessage.TextMessage.Translate.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        u7.ChatMessage.TextMessage.Translate.ImageColor3 = Color3.fromRGB(25, 27, 29)
        local ChatTranslationEnabled = Root.ChatTranslationEnabled
        if ChatTranslationEnabled then
            ChatTranslationEnabled = u7:GetProperty("Translation") ~= ""
        end
        if ChatTranslationEnabled and u585.OptionToViewUntranslatedMessage then
            u7.Translated = not u7.Translated
            u7:UpdateChat()
        end
    end))
    u7.Connection:AddConnection(u7.ChatMessage.TextMessage.Translate.MouseLeave:Connect(function() -- Line: 2101 -- upvalues: u7 (val)
        u7.ChatMessage.TextMessage.Translate.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        u7.ChatMessage.TextMessage.Translate.ImageColor3 = Color3.fromRGB(25, 27, 29)
    end))
    u7.Connection:AddConnection(u7.ChatMessage.TextMessage.Translate.MouseEnter:Connect(function() -- Line: 2105 -- upvalues: u7 (val)
        u7.ChatMessage.TextMessage.Translate.BackgroundColor3 = Color3.fromRGB(57, 59, 61)
        u7.ChatMessage.TextMessage.Translate.ImageColor3 = Color3.fromRGB(255, 255, 255)
    end))
    u7.Connection:AddConnection(u7.ChatMessage.TextMessage.Translate.MouseButton1Down:Connect(function() -- Line: 2109 -- upvalues: u7 (val)
        u7.ChatMessage.TextMessage.Translate.BackgroundColor3 = Color3.fromRGB(57, 59, 61)
        u7.ChatMessage.TextMessage.Translate.ImageColor3 = Color3.fromRGB(255, 255, 255)
    end))
    u7.Connection:AddConnection(u320.PropertyBind.new(Root, {"ChatTranslationEnabled"}, u7.ChatMessage, "Parent", function() -- Line: 2119 -- upvalues: u7 (val), Root (upval)
        u7.Translated = Root.ChatTranslationEnabled
        u7:UpdateChat()
    end))
    u7.Connection:AddConnection(u320.PropertyBind.new(u585, {"FilterSpecialCharacters"}, u7.ChatMessage, "Parent", function() -- Line: 2131 -- upvalues: u7 (val)
        u7:UpdateChat()
    end))
    u7.Connection:AddConnection(u320.PropertyBind.new(ChatWindowConfiguration, {"TextColor3"}, u7.ChatMessage, "Parent", function() -- Line: 2137 -- upvalues: u7 (val)
        u7.BodyText.TextColor3 = u7:GetProperty("TextColor3")
        u7.PrefixText.TextColor3 = u7:GetProperty("TextColor3", true)
    end))
    u7.Connection:AddConnection(u320.PropertyBind.new(ChatWindowConfiguration, {"FontFace"}, u7.ChatMessage, "Parent", function() -- Line: 2143 -- upvalues: u7 (val)
        u7.BodyText.FontFace = u7:GetProperty("FontFace")
        u7.PrefixText.FontFace = u7:GetProperty("FontFace", true)
        if u7.Message.ChatWindowMessageProperties == nil then
            u7:UpdateChat()
        end
    end))
    u7.Connection:AddConnection(u320.PropertyBind.new(ChatWindowConfiguration, {"TextSize"}, u7.ChatMessage, "Parent", function() -- Line: 2152 -- upvalues: u7 (val)
        u7.BodyText.TextSize = u7:GetProperty("TextSize")
        u7.PrefixText.TextSize = u7:GetProperty("TextSize", true)
        if u7.Message.ChatWindowMessageProperties == nil then
            u7:UpdateChat()
        end
    end))
    u7.Connection:AddConnection(u320.PropertyBind.new(ChatWindowConfiguration, {"TextStrokeColor3"}, u7.ChatMessage, "Parent", function() -- Line: 2166 -- upvalues: u7 (val)
        u7.BodyText.TextStrokeColor3 = u7:GetProperty("TextStrokeColor3")
        u7.PrefixText.TextStrokeColor3 = u7:GetProperty("TextStrokeColor3", true)
    end))
    u7.Connection:AddConnection(u320.PropertyBind.new(ChatWindowConfiguration, {"TextStrokeTransparency"}, u7.ChatMessage, "Parent", function() -- Line: 2178 -- upvalues: u7 (val)
        u7.BodyText.TextStrokeTransparency = u7:GetProperty("TextStrokeTransparency")
        u7.PrefixText.TextStrokeTransparency = u7:GetProperty("TextStrokeTransparency", true)
    end))
    if not u212 then
        u7.Connection:AddConnection(u7.PrefixText.Activated:Connect(function() -- Line: 2202 -- upvalues: u7 (val), u320 (upval), ChatInputBarConfiguration (upval)
            if u7.Message.TextSource == nil then
                return
            end
            local v1 = u320.CreateUserWhsiper(u7.Message.TextSource.UserId)
            if v1 == nil then
                return
            end
            ChatInputBarConfiguration.TargetTextChannel = v1
        end))
        return u7
    end
    if u7.Message.TextSource == nil then
        return u7
    end
    u7.Connection:AddConnection(u7.PrefixText.MouseEnter:Connect(function() -- Line: 2188 -- upvalues: u7 (val)
        u7.PrefixText.Text = string.gsub(u7.PrefixText.Text, "<u>", "")
        u7.PrefixText.Text = string.gsub(u7.PrefixText.Text, "</u>", "")
        u7.PrefixText.Text = ("<u>%*</u>"):format(u7.PrefixText.Text)
    end))
    u7.Connection:AddConnection(u7.PrefixText.MouseLeave:Connect(function() -- Line: 2193 -- upvalues: u7 (val)
        u7.PrefixText.Text = string.gsub(u7.PrefixText.Text, "<u>", "")
        u7.PrefixText.Text = string.gsub(u7.PrefixText.Text, "</u>", "")
    end))
    u7.Connection:AddConnection(u7.PrefixText.Activated:Connect(function() -- Line: 2197 -- upvalues: GuiService (upval), u7 (val)
        GuiService:InspectPlayerFromUserId(u7.Message.TextSource.UserId)
    end))
    return u7
end
u320.TextChannel = {}
u320.TextChannel.Instances = {}
function u320.TextChannel:CleanUp() -- Line: 2219
    local v1 = #self.TextChatMessages
    local v2 = 1
    for i = 1, v1, v2 do
        table.remove(self.TextChatMessages, 1):Destroy()
    end
    self.Connection:Disconnect()
    self:RemoveTransparency()
    self.PrimaryChannelTab:Destroy()
    self.DropdownChannelTab:Destroy()
end
function u320.TextChannel:Clear(p2) -- Line: 2228
    local v1 = #self.TextChatMessages
    local v2 = 1
    for i = 1, v1, v2 do
        table.remove(self.TextChatMessages, 1):Destroy()
    end
end
function u320.TextChannel:AddMessage(p2) -- Line: 2233 -- upvalues: u585 (val), u320 (val), channelBar (val), ChatInputBarConfiguration (val)
    for k, v in pairs(self.TextChatMessages) do
        if v.Message.MessageId == p2.MessageId then
            if p2.Text == "" then
                table.remove(self.TextChatMessages, k):Destroy()
                return
            end
            if p2.Status ~= Enum.TextChatMessageStatus.Success and p2.Status ~= Enum.TextChatMessageStatus.Sending then
                table.remove(self.TextChatMessages, k):Destroy()
                return
            end
            v:SetMessage(p2)
            return
        end
    end
    if p2.Text == "" then
        return
    elseif p2.Status == Enum.TextChatMessageStatus.Success then
        self.TextChatLayoutOrder = self.TextChatLayoutOrder + 1
        local v1 = #self.TextChatMessages
        if u585.MaxMessages <= v1 then
            table.remove(self.TextChatMessages, #self.TextChatMessages):Destroy()
        end
        v1 = u320.TextChatMessage.new(self, p2)
        table.insert(self.TextChatMessages, 1, v1)
        v1.ChatMessage.LayoutOrder = self.TextChatLayoutOrder
        if ChatInputBarConfiguration.TargetTextChannel ~= self.TextChannel then
            self.PrimaryChannelTab.UnreadDot.Visible = true
            self.DropdownChannelTab.UnreadDot.Visible = true
            if self.DropdownChannelTab.Parent ~= nil then
                channelBar.DropdownButton.UnreadDot.Visible = true
            end
        end
        return
    elseif p2.Status ~= Enum.TextChatMessageStatus.Sending then
        return
    end
end
function u320.TextChannel:AddTransparency() -- Line: 2275 -- upvalues: u320 (val)
    u320.BackgroundFadeTransparency:Add({
        self.PrimaryChannelTab,
        self.PrimaryChannelTab.Divider,
        self.PrimaryChannelTab.Highlight,
        self.PrimaryChannelTab.UnreadDot,
        self.PrimaryBodyText,
        self.DropdownChannelTab,
        self.DropdownChannelTab.Divider,
        self.DropdownChannelTab.Highlight,
        self.DropdownChannelTab.UnreadDot,
        self.DropdownBodyText,
    })
end
function u320.TextChannel:RemoveTransparency() -- Line: 2289 -- upvalues: u320 (val)
    u320.BackgroundFadeTransparency:Remove({
        self.PrimaryChannelTab,
        self.PrimaryChannelTab.Divider,
        self.PrimaryChannelTab.Highlight,
        self.PrimaryChannelTab.UnreadDot,
        self.PrimaryBodyText,
        self.DropdownChannelTab,
        self.DropdownChannelTab.Divider,
        self.DropdownChannelTab.Highlight,
        self.DropdownChannelTab.UnreadDot,
        self.DropdownBodyText,
    })
end
function u320.TextChannel:SetDropDownVisibility(p2) -- Line: 2303 -- upvalues: ScrollView (val)
    if self.DropdownVisible ~= p2 then
        local v1
        self.DropdownVisible = p2
        if not p2 then
            v1 = nil
        else
            v1 = ScrollView
        end
        self.DropdownChannelTab.Parent = v1
    end
end
function u320.TextChannel:SetPrimaryVisibility(p2) -- Line: 2309 -- upvalues: ContentContainer (val)
    if self.PrimaryVisible ~= p2 then
        local v1
        self.PrimaryVisible = p2
        if not p2 then
            v1 = nil
        else
            v1 = ContentContainer
        end
        self.PrimaryChannelTab.Parent = v1
    end
end
function u320.TextChannel.new(p1) -- Line: 2315 -- upvalues: u320 (val), Assets (val), ChatInputBarConfiguration (val), u585 (val), ChannelTabsConfiguration (val), channelBar (val), LocalPlayer (val)
    local DropdownChannelTab, HoverBackgroundColor3, SelectedTabTextColor3, SelectedTabTextColor3_2, SelectedTabTextColor3_3, SelectedTabTextColor3_4
    if not (p1:IsA("TextChannel")) then
        return
    end
    local u10 = setmetatable({}, {__index = u320.TextChannel})
    u10.Instances = nil
    u10.Connection = u320.MultiConnection.new()
    u10.TextChannel = p1
    local v1 = {}
    u10.TextChatMessages = v1
    u10.PrimaryChannelTab = Assets.Elements.PrimaryChannelTab:Clone()
    u10.PrimaryChannelTab.Parent = nil
    u10.PrimaryVisible = false
    u10.PrimaryChannelTab.Visible = true
    u10.DropdownChannelTab = Assets.Elements.DropdownChannelTab:Clone()
    u10.DropdownChannelTab.Parent = nil
    u10.PrimaryBodyText = u10.PrimaryChannelTab.TextLabel
    u10.DropdownBodyText = u10.DropdownChannelTab.TextLabel
    u10.DropdownVisible = false
    u10.DropdownChannelTab.Visible = true
    u10.ChannelName = u320.GetChannelName(u10.TextChannel)
    u10.PrimaryBodyText.Text = u10.ChannelName
    u10.DropdownBodyText.Text = u10.ChannelName
    v1 = u10.TextChannel == ChatInputBarConfiguration.TargetTextChannel
    u10.TextChatLayoutOrder = 0
    u10.LocalPlayerAdded = false
    u10:AddTransparency()
    u10.Connection:AddConnection(u320.PropertyBind.new(u585, {"MaxMessages"}, nil, nil, function() -- Line: 2352 -- upvalues: u10 (val), u585 (upval)
        local v1
        while true do
            v1 = #u10.TextChatMessages
            if u585.MaxMessages >= v1 then
                break
            end
            table.remove(u10.TextChatMessages, #u10.TextChatMessages):Destroy()
        end
    end))
    local Connection_2 = u10.Connection
    local v2 = u320.StyleBind.new(ChannelTabsConfiguration, "TextStrokeColor3", u10.PrimaryChannelTab, "Parent")
    local PrimaryBodyText = u10.PrimaryBodyText
    Connection_2:AddConnection(v2:Add(PrimaryBodyText, "TextStrokeColor3"))
    local Connection_3 = u10.Connection
    v2 = u320.StyleBind.new(ChannelTabsConfiguration, "TextStrokeTransparency", u10.PrimaryChannelTab, "Parent")
    Connection_3:AddConnection(v2:Add(u10.PrimaryBodyText, "TextStrokeTransparency"))
    local Connection_4 = u10.Connection
    v2 = u320.StyleBind.new(ChannelTabsConfiguration, "TextSize", u10.PrimaryChannelTab, "Parent")
    Connection_4:AddConnection(v2:Add(u10.PrimaryBodyText, "TextSize"))
    local Connection_5 = u10.Connection
    v2 = u320.StyleBind.new(ChannelTabsConfiguration, "FontFace", u10.PrimaryChannelTab, "Parent")
    Connection_5:AddConnection(v2:Add(u10.PrimaryBodyText, "FontFace"))
    local Connection_6 = u10.Connection
    v2 = u320.StyleBind.new(ChannelTabsConfiguration, "TextColor3", u10.DropdownChannelTab, "Parent")
    local DropdownBodyText = u10.DropdownBodyText
    Connection_6:AddConnection(v2:Add(DropdownBodyText, "TextColor3"))
    local Connection_7 = u10.Connection
    v2 = u320.StyleBind.new(ChannelTabsConfiguration, "TextStrokeColor3", u10.DropdownChannelTab, "Parent")
    Connection_7:AddConnection(v2:Add(u10.DropdownBodyText, "TextStrokeColor3"))
    local Connection_8 = u10.Connection
    v2 = u320.StyleBind.new(ChannelTabsConfiguration, "TextStrokeTransparency", u10.DropdownChannelTab, "Parent")
    Connection_8:AddConnection(v2:Add(u10.DropdownBodyText, "TextStrokeTransparency"))
    local Connection_9 = u10.Connection
    v2 = u320.StyleBind.new(ChannelTabsConfiguration, "TextSize", u10.DropdownChannelTab, "Parent")
    Connection_9:AddConnection(v2:Add(u10.DropdownBodyText, "TextSize"))
    local Connection_10 = u10.Connection
    v2 = u320.StyleBind.new(ChannelTabsConfiguration, "FontFace", u10.DropdownChannelTab, "Parent")
    Connection_10:AddConnection(v2:Add(u10.DropdownBodyText, "FontFace"))
    u10.Connection:AddConnection(u10.PrimaryChannelTab.Activated:Connect(function() -- Line: 2403 -- upvalues: ChatInputBarConfiguration (upval), u10 (val), channelBar (upval), u320 (upval)
        ChatInputBarConfiguration.TargetTextChannel = u10.TextChannel
        channelBar.DropdownMenu.Visible = false
        u320.UpdateChannelTabs()
    end))
    u10.Connection:AddConnection(u10.DropdownChannelTab.Activated:Connect(function() -- Line: 2408 -- upvalues: ChatInputBarConfiguration (upval), u10 (val), channelBar (upval), u320 (upval)
        ChatInputBarConfiguration.TargetTextChannel = u10.TextChannel
        channelBar.DropdownMenu.Visible = false
        u320.UpdateChannelTabs()
    end))
    u10.Connection:AddConnection(u320.PropertyBind.new(ChannelTabsConfiguration, {"HoverBackgroundColor3", "BackgroundColor3"}, u10.DropdownChannelTab, "Parent", function() -- Line: 2419 -- upvalues: u10 (val), ChannelTabsConfiguration (upval)
        local HoverBackgroundColor3
        local DropdownChannelTab = u10.DropdownChannelTab
        if not u10.MouseInsideDropdown then
            HoverBackgroundColor3 = ChannelTabsConfiguration.BackgroundColor3
        else
            HoverBackgroundColor3 = ChannelTabsConfiguration.HoverBackgroundColor3
            if not HoverBackgroundColor3 then
                HoverBackgroundColor3 = ChannelTabsConfiguration.BackgroundColor3
            end
        end
        DropdownChannelTab.BackgroundColor3 = HoverBackgroundColor3
    end))
    DropdownChannelTab = u10.DropdownChannelTab
    if not u10.MouseInsideDropdown then
        HoverBackgroundColor3 = ChannelTabsConfiguration.BackgroundColor3
    else
        HoverBackgroundColor3 = ChannelTabsConfiguration.HoverBackgroundColor3
    end
    DropdownChannelTab.BackgroundColor3 = HoverBackgroundColor3
    u10.Connection:AddConnection(u10.DropdownChannelTab.MouseEnter:Connect(function() -- Line: 2429 -- upvalues: u10 (val), ChannelTabsConfiguration (upval)
        u10.MouseInsideDropdown = true
        u10.DropdownChannelTab.BackgroundColor3 = ChannelTabsConfiguration.HoverBackgroundColor3
    end))
    u10.Connection:AddConnection(u10.DropdownChannelTab.MouseLeave:Connect(function() -- Line: 2433 -- upvalues: u10 (val), ChannelTabsConfiguration (upval)
        u10.MouseInsideDropdown = false
        u10.DropdownChannelTab.BackgroundColor3 = ChannelTabsConfiguration.BackgroundColor3
    end))
    u10.Connection:AddConnection(u320.PropertyBind.new(ChannelTabsConfiguration, {"TextColor3", "SelectedTabTextColor3"}, u10.PrimaryChannelTab, "Parent", function() -- Line: 2443 -- upvalues: u10 (val), ChatInputBarConfiguration (upval), ChannelTabsConfiguration (upval)
        local SelectedTabTextColor3
        local PrimaryBodyText = u10.PrimaryBodyText
        if u10.TextChannel ~= ChatInputBarConfiguration.TargetTextChannel then
            SelectedTabTextColor3 = ChannelTabsConfiguration.TextColor3
        else
            SelectedTabTextColor3 = ChannelTabsConfiguration.SelectedTabTextColor3
            if not SelectedTabTextColor3 then
                SelectedTabTextColor3 = ChannelTabsConfiguration.TextColor3
            end
        end
        PrimaryBodyText.TextColor3 = SelectedTabTextColor3
    end))
    local PrimaryBodyText_5 = u10.PrimaryBodyText
    if not v1 then
        SelectedTabTextColor3 = ChannelTabsConfiguration.TextColor3
    else
        SelectedTabTextColor3 = ChannelTabsConfiguration.SelectedTabTextColor3
    end
    PrimaryBodyText_5.TextColor3 = SelectedTabTextColor3
    u10.Connection:AddConnection(u320.PropertyBind.new(ChannelTabsConfiguration, {"TextColor3", "SelectedTabTextColor3"}, u10.DropdownChannelTab, "Parent", function() -- Line: 2458 -- upvalues: u10 (val), ChatInputBarConfiguration (upval), ChannelTabsConfiguration (upval)
        local SelectedTabTextColor3
        local DropdownBodyText = u10.DropdownBodyText
        if u10.TextChannel ~= ChatInputBarConfiguration.TargetTextChannel then
            SelectedTabTextColor3 = ChannelTabsConfiguration.TextColor3
        else
            SelectedTabTextColor3 = ChannelTabsConfiguration.SelectedTabTextColor3
            if not SelectedTabTextColor3 then
                SelectedTabTextColor3 = ChannelTabsConfiguration.TextColor3
            end
        end
        DropdownBodyText.TextColor3 = SelectedTabTextColor3
    end))
    local DropdownBodyText_6 = u10.DropdownBodyText
    if not v1 then
        SelectedTabTextColor3_2 = ChannelTabsConfiguration.TextColor3
    else
        SelectedTabTextColor3_2 = ChannelTabsConfiguration.SelectedTabTextColor3
    end
    DropdownBodyText_6.TextColor3 = SelectedTabTextColor3_2
    u10.Connection:AddConnection(u320.PropertyBind.new(ChatInputBarConfiguration, {"TargetTextChannel"}, u10.PrimaryChannelTab, "Parent", function() -- Line: 2473 -- upvalues: u10 (val), ChatInputBarConfiguration (upval), ChannelTabsConfiguration (upval)
        local SelectedTabTextColor3
        local PrimaryBodyText = u10.PrimaryBodyText
        if u10.TextChannel ~= ChatInputBarConfiguration.TargetTextChannel then
            SelectedTabTextColor3 = ChannelTabsConfiguration.TextColor3
        else
            SelectedTabTextColor3 = ChannelTabsConfiguration.SelectedTabTextColor3
            if not SelectedTabTextColor3 then
                SelectedTabTextColor3 = ChannelTabsConfiguration.TextColor3
            end
        end
        PrimaryBodyText.TextColor3 = SelectedTabTextColor3
        local v1 = u10.TextChannel == ChatInputBarConfiguration.TargetTextChannel
        u10.PrimaryChannelTab.Highlight.Visible = v1
    end))
    local PrimaryBodyText_6 = u10.PrimaryBodyText
    if not v1 then
        SelectedTabTextColor3_3 = ChannelTabsConfiguration.TextColor3
    else
        SelectedTabTextColor3_3 = ChannelTabsConfiguration.SelectedTabTextColor3
    end
    PrimaryBodyText_6.TextColor3 = SelectedTabTextColor3_3
    u10.PrimaryChannelTab.Highlight.Visible = v1
    u10.Connection:AddConnection(u320.PropertyBind.new(ChatInputBarConfiguration, {"TargetTextChannel"}, u10.DropdownChannelTab, "Parent", function() -- Line: 2491 -- upvalues: u10 (val), ChatInputBarConfiguration (upval), ChannelTabsConfiguration (upval)
        local SelectedTabTextColor3
        local DropdownBodyText = u10.DropdownBodyText
        if u10.TextChannel ~= ChatInputBarConfiguration.TargetTextChannel then
            SelectedTabTextColor3 = ChannelTabsConfiguration.TextColor3
        else
            SelectedTabTextColor3 = ChannelTabsConfiguration.SelectedTabTextColor3
            if not SelectedTabTextColor3 then
                SelectedTabTextColor3 = ChannelTabsConfiguration.TextColor3
            end
        end
        DropdownBodyText.TextColor3 = SelectedTabTextColor3
        local v1 = u10.TextChannel == ChatInputBarConfiguration.TargetTextChannel
        u10.DropdownChannelTab.Highlight.Visible = v1
    end))
    local DropdownBodyText_7 = u10.DropdownBodyText
    if not v1 then
        SelectedTabTextColor3_4 = ChannelTabsConfiguration.TextColor3
    else
        SelectedTabTextColor3_4 = ChannelTabsConfiguration.SelectedTabTextColor3
        if not SelectedTabTextColor3_4 then
            SelectedTabTextColor3_4 = ChannelTabsConfiguration.TextColor3
        end
    end
    DropdownBodyText_7.TextColor3 = SelectedTabTextColor3_4
    u10.DropdownChannelTab.Highlight.Visible = v1
    u10.Connection:AddConnection(u320.PropertyBind.new(u10.TextChannel, {"Name"}, nil, nil, function() -- Line: 2503 -- upvalues: u10 (val), u320 (upval)
        u10.ChannelName = u320.GetChannelName(u10.TextChannel)
        u10.PrimaryBodyText.Text = u10.ChannelName
        u10.DropdownBodyText.Text = u10.ChannelName
    end))
    u10.Connection:AddConnection(u320.Observe(u10.TextChannel, function(p1) -- Line: 2510 -- upvalues: LocalPlayer (upval), u10 (val), u320 (upval)
        if not (p1:IsA("TextSource")) then
            return
        end
        if p1.UserId ~= LocalPlayer.UserId then
            return nil
        end
        u10.LocalPlayerAdded = true
        u320.SetTextChannels()
        u320.UpdateChannelTabs()
        return function() -- Line: 2518 -- upvalues: u10 (upval), u320 (upval)
            u10.LocalPlayerAdded = false
            u320.SetTextChannels()
            u320.UpdateChannelTabs()
        end
    end))
    u320.SetTextChannels()
    u320.UpdateChannelTabs()
    return u10
end
u320.TextChatAutoComplete = {__type = "TextChatAutoComplete"}
u320.TextChatAutoComplete.Instances = {}
function u320.TextChatAutoComplete:CleanUp() -- Line: 2535 -- upvalues: u950 (val)
    if self.TextChatAutoComplete ~= nil then
        u950:Relieve(self.TextChatAutoComplete)
        self.TextChatAutoComplete = nil
    end
    if self.BodyText ~= nil then
        self.BodyText = nil
    end
    self.Connection:Disconnect()
end
function u320.TextChatAutoComplete:Destroy() -- Line: 2545 -- upvalues: u320 (val)
    self:CleanUp()
    u320.TextChatAutoComplete.Instances[self] = nil
end
function u320.TextChatAutoComplete:AddConnections() -- Line: 2549 -- upvalues: u950 (val), OffsetFrame (val), u320 (val), ChatInputBarConfiguration (val)
    self:CleanUp()
    self.TextChatAutoComplete = u950:Get()
    self.BodyText = self.TextChatAutoComplete.TextLabelButton.TextLabel
    self.BodyText.Text = self.ReplaceText
    self.TextChatAutoComplete.Visible = true
    self.TextChatAutoComplete.Parent = OffsetFrame
    local Connection = self.Connection
    local v1 = u320.StyleBind.new(ChatInputBarConfiguration, "TextColor3", self.TextChatAutoComplete, "Parent")
    Connection:AddConnection(v1:Add(self.BodyText, "TextColor3"))
    local Connection_2 = self.Connection
    v1 = u320.StyleBind.new(ChatInputBarConfiguration, "FontFace", self.TextChatAutoComplete, "Parent")
    Connection_2:AddConnection(v1:Add(self.BodyText, "FontFace"))
    local Connection_3 = self.Connection
    v1 = u320.StyleBind.new(ChatInputBarConfiguration, "TextSize", self.TextChatAutoComplete, "Parent")
    Connection_3:AddConnection(v1:Add(self.BodyText, "TextSize"))
    local Connection_4 = self.Connection
    v1 = u320.StyleBind.new(ChatInputBarConfiguration, "TextStrokeColor3", self.TextChatAutoComplete, "Parent")
    Connection_4:AddConnection(v1:Add(self.BodyText, "TextStrokeColor3"))
    local Connection_5 = self.Connection
    v1 = u320.StyleBind.new(ChatInputBarConfiguration, "TextStrokeTransparency", self.TextChatAutoComplete, "Parent")
    Connection_5:AddConnection(v1:Add(self.BodyText, "TextStrokeTransparency"))
    self.Connection:AddConnection(self.TextChatAutoComplete.MouseEnter:Connect(function() -- Line: 2584 -- upvalues: u320 (upval), self (val)
        if u320.CurrentAutoComplete ~= nil and u320.CurrentAutoComplete ~= self then
            u320.CurrentAutoComplete = nil
            u320.CurrentAutoComplete:UpdateAppearance()
        end
        u320.CurrentAutoComplete = self
        self:UpdateAppearance()
    end))
    self.Connection:AddConnection(self.TextChatAutoComplete.TextLabelButton.MouseButton1Down:Connect(function() -- Line: 2594 -- upvalues: self (val)
        self:Replace()
    end))
    self:UpdateAppearance()
end
function u320.TextChatAutoComplete:Replace() -- Line: 2600 -- upvalues: u320 (val), TextBox (val)
    if not self.Visible then
        return
    end
    u320.FillAutoComplete(TextBox, self.ReplaceIndex, self.ReplaceLength, self.ReplaceWith)
end
function u320.TextChatAutoComplete:UpdateAppearance() -- Line: 2607 -- upvalues: u320 (val), ScrollView_2 (val), AutocompleteDropdown (val)
    local v1
    if not self.Visible then
        return
    end
    if u320.CurrentAutoComplete ~= self then
        v1 = 1
    else
        v1 = 0.85
    end
    self.TextChatAutoComplete.TextLabelButton.BackgroundTransparency = v1
    if u320.CurrentAutoComplete ~= self then
        return
    end
    local Offset = self.TextChatAutoComplete.Size.Y.Offset
    v1 = (self.TextChatAutoComplete.LayoutOrder - 1) * Offset
    local CanvasPosition = ScrollView_2.CanvasPosition
    local Size = AutocompleteDropdown.Size
    if v1 < CanvasPosition.Y then
        ScrollView_2.CanvasPosition = Vector2.new(CanvasPosition.X, v1)
        return
    end
    if CanvasPosition.Y + Size.Y.Offset < v1 + Offset then
        ScrollView_2.CanvasPosition = Vector2.new(CanvasPosition.X, v1 + Offset - Size.Y.Offset)
    end
end
function u320.TextChatAutoComplete:SetVisibility(p2) -- Line: 2630
    if self.Visible == p2 then
        return
    end
    self.Visible = p2
    if p2 then
        self:AddConnections()
        return
    end
    self:CleanUp()
end
function u320.TextChatAutoComplete.new(p1, p2, p3, p4, p5, p6, p7, p8) -- Line: 2640 -- upvalues: u320 (val)
    local v1 = setmetatable({}, {__index = u320.TextChatAutoComplete})
    v1.Instances = nil
    v1.Connection = u320.MultiConnection.new()
    v1.ReplaceWith = p1
    v1.ReplaceMatch = p2
    v1.ReplaceText = p3
    v1.MinReplaceLength = p4
    v1.OnlyAtStart = p5
    v1.CompleteWhenMatched = p6
    v1.AutoCompleteEnabled = p7
    v1.MatchWithoutSufix = p8
    v1.Visible = false
    u320.TextChatAutoComplete.Instances[v1] = v1
    return v1
end
u320.TextChatCommand = {}
u320.TextChatCommand.Instances = {}
function u320.TextChatCommand:CleanUp() -- Line: 2672
    self.Connection:Disconnect()
    self.TextChatAutoComplete:Destroy()
end
function u320.TextChatCommand.new(p1) -- Line: 2676 -- upvalues: u320 (val)
    if not (p1:IsA("TextChatCommand")) then
        return
    end
    local u10 = setmetatable({}, {__index = u320.TextChatCommand})
    u10.Instances = nil
    u10.Connection = u320.MultiConnection.new()
    u10.Command = p1
    u10.TextChatAutoComplete = u320.TextChatAutoComplete.new(u10.Command.PrimaryAlias, u10.Command.PrimaryAlias, u10.Command.PrimaryAlias, 1, true, false, u10.Command.AutocompleteVisible, false)
    u10.Connection:AddConnection(u10.Command.Triggered:Connect(function() -- Line: 2696 -- upvalues: u10 (val), u320 (upval)
        if u10.Command.PrimaryAlias == "/clear" and u10.Command.Enabled then
            for k, v in pairs(u320.TextChannel.Instances) do
                v:Clear()
            end
        end
    end))
    u10.Connection:AddConnection(u320.PropertyBind.new(u10.Command, {"AutocompleteVisible"}, u10.Command, "Parent", function() -- Line: 2704 -- upvalues: u10 (val)
        u10.TextChatAutoComplete.AutoCompleteEnabled = u10.Command.AutocompleteVisible
    end))
    u10.Connection:AddConnection(u320.PropertyBind.new(u10.Command, {"PrimaryAlias"}, u10.Command, "Parent", function() -- Line: 2709 -- upvalues: u10 (val)
        local PrimaryAlias = u10.Command.PrimaryAlias
        u10.TextChatAutoComplete.ReplaceWith = PrimaryAlias
        u10.TextChatAutoComplete.ReplaceText = PrimaryAlias
        u10.TextChatAutoComplete.ReplaceMatch = PrimaryAlias
        u10.TextChatAutoComplete.BodyText.Text = PrimaryAlias
    end))
    return u10
end
u320.BubbleChatMessage = {__type = "bubbleChatMessage"}
function u320.BubbleChatMessage:CleanUp() -- Line: 2722
    for k, v in pairs(self.InstanceBinds) do
        v:Disconnect()
    end
    self.Connection:Disconnect()
    self.InstanceBinds = {}
end
function u320.BubbleChatMessage:Destroy() -- Line: 2729 -- upvalues: u970 (val)
    self:CleanUp()
    local v1 = table.find(self.BubbleChatContainer.BubbleChatMessages, self)
    if v1 ~= nil then
        table.remove(self.BubbleChatContainer.BubbleChatMessages, v1)
    end
    if self.ChatMessage ~= nil then
        u970:Relieve(self.ChatMessage)
        self.ChatMessage = nil
    end
    if #self.BubbleChatContainer.BubbleChatMessages == 0 then
        self.BubbleChatContainer:Destroy()
    end
end
function u320.BubbleChatMessage:UpdateTransparency(p2, p3) -- Line: 2743 -- upvalues: u320 (val)
    local v1
    local v2 = math.round(u320.TransparencyMask(self.BackgroundTransparency, self.Current.Z) * 100) / 100
    self.LastTransparency = v2
    if not self.HasImage then
        v1 = 1
    else
        v1 = v2
    end
    self.ChatBubbleFrame.BackgroundTransparency = v1
    if not self.HasImage then
        v1 = v2
    else
        v1 = 1
    end
    self.ChatBubbleFrame.ImageTransparency = v1
    self.Caret.ImageTransparency = v2
end
function u320.BubbleChatMessage:SmoothDamp(p2, p3) -- Line: 2751 -- upvalues: TweenService (val), u320 (val)
    local v1, v2
    v1, v2 = TweenService:SmoothDamp(self.Current, self.Target, self.Velocity, 0.15, 1000, p2)
    self.Current = v1
    self.Velocity = v2
    v1 = math.round(u320.TransparencyMask(self.BackgroundTransparency, self.Current.Z) * 100) / 100
    local v3 = math.round(self.Current.X)
    v2 = UDim2.fromOffset(v3, (math.round(self.Current.Y)))
    if v2 ~= self.LastSize then
        self.LastSize = v2
        self.ChatMessage.Size = v2
    end
    if v1 ~= self.LastTransparency then
        local v4
        self.LastTransparency = v1
        if not self.HasImage then
            v4 = 1
        else
            v4 = v1
        end
        self.ChatBubbleFrame.BackgroundTransparency = v4
        if not self.HasImage then
            v4 = v1
        else
            v4 = 1
        end
        self.ChatBubbleFrame.ImageTransparency = v4
        self.Caret.ImageTransparency = v1
    end
end
function u320.BubbleChatMessage:SetMessage(p2) -- Line: 2767 -- upvalues: BubbleChatConfiguration (val)
    self.Message = p2
    self.BackgroundTransparency = self:GetProperty("BackgroundTransparency")
    self.ChatMessage.ChatBubbleFrame.BackgroundColor3 = self:GetProperty("BackgroundColor3")
    self.ChatMessage.Caret.ImageColor3 = self:GetProperty("BackgroundColor3")
    local BodyText = self.BodyText
    BodyText.FontFace = self:GetProperty("FontFace")
    local BodyText_2 = self.BodyText
    BodyText_2.TextColor3 = self:GetProperty("TextColor3")
    local BodyText_3 = self.BodyText
    BodyText_3.TextSize = self:GetProperty("TextSize")
    local Property = self:GetProperty("TailVisible")
    if Property then
        Property = self.LastMessage
    end
    self.ChatMessage.Caret.Visible = Property
    self.Font = BubbleChatConfiguration.Font
    self.FontFace = self:GetProperty("FontFace")
    self.TextSize = self:GetProperty("TextSize")
    self:UpdateChat()
end
function u320.BubbleChatMessage:UpdateVisibility(p2) -- Line: 2781
    self.ChatMessage.Visible = self.InDistanceRange
    local InChatRange = self.InChatRange
    if InChatRange then
        InChatRange = not (self.Destroying or p2)
        if InChatRange then
            InChatRange = self.InDistanceRange
            if InChatRange then
                InChatRange = self.Enabled
                if not InChatRange then
                    InChatRange = self.Player == nil
                end
            end
        end
    end
    if self.Destroying then
        if not p2 then
            return
        end
        if p2 then
            self.Destroying = true
        end
        self.Visible = InChatRange
        if InChatRange then
            self.Velocity = 0
            self:UpdateChat()
            self.Current = Vector3.new(self.Target.X, 0, 1)
            self.ChatMessage.Size = UDim2.fromOffset(self.Current.X, self.Current.Y)
            return
        end
        self.Velocity = 0
        self:UpdateChat()
        if p2 then
            task.delay(1, self.Destroy, self)
        end
        return
    elseif self.Visible ~= InChatRange then
    end
end
function u320.BubbleChatMessage:GetProperty(p2) -- Line: 2806 -- upvalues: BubbleChatConfiguration (val)
    local v1
    if p2 == "Text" then
        v1 = self.Message[p2]
    elseif p2 == "Translation" then
        v1 = self.Message[p2]
    elseif p2 == "PrefixText" then
        v1 = self.Message[p2]
    else
        v1 = BubbleChatConfiguration[p2]
    end
    local BubbleChatMessageProperties = self.Message.BubbleChatMessageProperties
    if BubbleChatMessageProperties ~= nil and BubbleChatMessageProperties[p2] ~= "" then
        v1 = BubbleChatMessageProperties[p2]
    end
    return v1
end
function u320.BubbleChatMessage:UpdateChat() -- Line: 2821 -- upvalues: u585 (val), u320 (val), BubbleChatConfiguration (val)
    local Property, v1, v2
    local Padding = self.ChatMessage.ChatBubbleFrame.Padding
    if not self.Visible then
        self.BodyText.Text = ""
        self.Target = Vector3.new((Padding.PaddingLeft.Offset + Padding.PaddingRight.Offset) * 2, Padding.PaddingBottom.Offset + Padding.PaddingTop.Offset + BubbleChatConfiguration.TextSize, 1)
        return
    end
    local ChatTranslationEnabled = self.ChatTranslationEnabled
    if ChatTranslationEnabled then
        if self:GetProperty("Translation") or "" ~= "" then
            ChatTranslationEnabled = true
        else
            ChatTranslationEnabled = false
        end
    end
    if not ChatTranslationEnabled then
        Property = self:GetProperty("Text")
    else
        Property = self:GetProperty("Translation")
    end
    if Property or "" == "" then
        Property = self.Message.Text or ""
    end
    if not u585.FilterSpecialCharacters then
        v2 = Property
    elseif self.Message.TextSource == nil then
        v2 = Property
    else
        v2 = u320.FilterSpecialCharacters(Property or "")
    end
    local v3 = ("%*"):format(v2)
    self.BodyText.Text = v3
    local v4 = u320.GetTextBounds(v3, self.TextSize, self.Font, self.FontFace, u320.BubbleChatBounds)
    if not self.Visible then
        v1 = 1
    else
        v1 = 0
    end
    local v5 = Vector3.new(v4.X, v4.Y, v1)
    local v6 = v5 * Vector3.new(1 + (Padding.PaddingLeft.Scale + Padding.PaddingRight.Scale) * 2, 1 + Padding.PaddingTop.Scale + Padding.PaddingBottom.Scale, 1)
    self.Target = v6 + Vector3.new((Padding.PaddingLeft.Offset + Padding.PaddingRight.Offset) * 2, Padding.PaddingBottom.Offset + Padding.PaddingTop.Offset, 0)
end
function u320.BubbleChatMessage:ReBind(p2) -- Line: 2858 -- upvalues: u320 (val)
    local InstanceBinds
    if self.InstanceBinds[p2.ClassName] ~= nil then
        self.InstanceBinds[p2.ClassName]:Disconnect()
        self.InstanceBinds[p2.ClassName] = nil
    end
    InstanceBinds = self.InstanceBinds
    InstanceBinds[p2.ClassName] = u320.InstanceBind.new(p2, self.BindMap[p2.ClassName].Properties, self.BindMap[p2.ClassName].Instances, self.ChatMessage, "Parent", function() -- Line: 2869 -- upvalues: self (val)
        self:UpdateChat()
    end)
end
function u320.BubbleChatMessage:UnBind(p2) -- Line: 2874 -- upvalues: DefaultBubbleChatConfiguration (val)
    if self.InstanceBinds[p2.ClassName] ~= nil then
        self.InstanceBinds[p2.ClassName]:Disconnect()
        self.InstanceBinds[p2.ClassName] = nil
    end
    local v1 = DefaultBubbleChatConfiguration:FindFirstChildWhichIsA(p2.ClassName)
    if not v1 then
        v1 = Instance.new(p2.ClassName)
    end
    self:ReBind(v1)
end
function u320.BubbleChatMessage:AddInstanceBinds() -- Line: 2881 -- upvalues: BubbleChatConfiguration (val), DefaultBubbleChatConfiguration (val)
    local v1
    for k, v in pairs(self.BindMap) do
        v1 = BubbleChatConfiguration:FindFirstChildWhichIsA(k)
        if not v1 then
            v1 = DefaultBubbleChatConfiguration:FindFirstChildWhichIsA(k)
            if not v1 then
                v1 = Instance.new(k)
            end
        end
        v2:ReBind(v1)
    end
end
function u320.BubbleChatMessage.new(p1, p2) -- Line: 2889 -- upvalues: u320 (val), u970 (val), BubbleChatConfiguration (val), Root (val), RunService (val), u258 (val), u287 (val), u585 (val)
    local ChatBubbleFrame, Property
    local u7 = setmetatable({}, {__index = u320.BubbleChatMessage})
    u7.Connection = u320.MultiConnection.new()
    u7.BubbleChatContainer = p1
    u7.Timestamp = p2.Timestamp.UnixTimestampMillis / 1000
    u7.Visible = false
    u7.InChatRange = false
    u7.InDistanceRange = false
    u7.LastMessage = true
    u7.Velocity = 0
    u7.Current = Vector3.new(0, 0, 0)
    u7.Target = u7.Current
    u7.ChatMessage = u970:Get()
    u7.ChatMessage.Visible = true
    u7.BodyText = u7.ChatMessage.ChatBubbleFrame.Text
    u7.ChatBubbleFrame = u7.ChatMessage.ChatBubbleFrame
    u7.Caret = u7.ChatMessage.Caret
    u7.BubbleDuration = BubbleChatConfiguration.BubbleDuration
    u7.BackgroundTransparency = BubbleChatConfiguration.BubbleDuration
    u7.MinimizeDistance = BubbleChatConfiguration.MinimizeDistance
    u7.ChatTranslationEnabled = Root.ChatTranslationEnabled
    u7.Font = BubbleChatConfiguration.Font
    u7.FontFace = BubbleChatConfiguration.FontFace
    u7.TextSize = BubbleChatConfiguration.TextSize
    u7.Enabled = true
    u7.Player = u7.BubbleChatContainer.Player
    u7.InstanceBinds = {}
    local v1 = {
        UICorner = {
            Instances = {u7.ChatMessage.ChatBubbleFrame.UICorner},
            Properties = {"CornerRadius"},
        },
        UIGradient = {
            Instances = {u7.ChatMessage.ChatBubbleFrame.Gradient, u7.ChatMessage.Caret.Gradient},
            Properties = {
                "Color",
                "Enabled",
                "Offset",
                "Rotation",
                "Transparency",
            },
        },
        UIPadding = {
            Instances = {u7.ChatMessage.ChatBubbleFrame.Padding},
            Properties = {"PaddingBottom", "PaddingLeft", "PaddingRight", "PaddingTop"},
        },
        ImageLabel = {
            Instances = {u7.ChatMessage.ChatBubbleFrame},
            Properties = {
                "Image",
                "ImageColor3",
                "ImageRectOffset",
                "ImageRectSize",
                "ResampleMode",
                "ScaleType",
            },
        },
    }
    u7.BindMap = v1
    u7:AddInstanceBinds()
    v1 = u7.ChatBubbleFrame.Image == ""
    u7.HasImage = v1
    u7:SetMessage(p2)
    if u7.Player ~= nil then
        u7.Enabled = BubbleChatConfiguration.Enabled
        u7.Connection:AddConnection(u320.PropertyBind.new(BubbleChatConfiguration, {"Enabled"}, u7.ChatMessage, "Parent", function() -- Line: 2950 -- upvalues: u7 (val), BubbleChatConfiguration (upval)
            u7.Enabled = BubbleChatConfiguration.Enabled
            u7:UpdateVisibility()
        end))
    end
    u7.Connection:AddConnection(RunService.Heartbeat:Connect(function(p1) -- Line: 2956 -- upvalues: u7 (val), u258 (upval)
        local v1
        u7:SmoothDamp(p1)
        if not u7.Destroying then
            v1 = u7.Timestamp + u7.BubbleDuration
            if v1 < os.time() then
                u7:UpdateVisibility(true)
            end
        end
        if u7.BubbleChatContainer.Adornee ~= nil then
            v1 = (u258.CFrame.Position - u7.BubbleChatContainer.Adornee.Position).Magnitude < u7.MinimizeDistance
            if v1 ~= u7.InDistanceRange then
                u7.InDistanceRange = v1
                u7:UpdateVisibility()
            end
        end
    end))
    u7.Connection:AddConnection(u287.ChildAdded:Connect(function(p1) -- Line: 2972 -- upvalues: u7 (val)
        if u7.BindMap[p1.ClassName] ~= nil then
            u7:ReBind(p1)
        end
    end))
    u7.Connection:AddConnection(u287.ChildRemoved:Connect(function(p1) -- Line: 2977 -- upvalues: u7 (val)
        if u7.BindMap[p1.ClassName] ~= nil then
            u7:UnBind(p1)
        end
    end))
    u7.Connection:AddConnection(u320.PropertyBind.new(BubbleChatConfiguration, {"BubbleDuration"}, u7.ChatMessage, "Parent", function() -- Line: 2988 -- upvalues: u7 (val), BubbleChatConfiguration (upval)
        u7.BubbleDuration = BubbleChatConfiguration.BubbleDuration
    end))
    u7.BubbleDuration = BubbleChatConfiguration.BubbleDuration
    u7.Connection:AddConnection(u320.PropertyBind.new(BubbleChatConfiguration, {"MinimizeDistance"}, u7.ChatMessage, "Parent", function() -- Line: 3000 -- upvalues: u7 (val), BubbleChatConfiguration (upval)
        u7.MinimizeDistance = BubbleChatConfiguration.MinimizeDistance
    end))
    u7.MinimizeDistance = BubbleChatConfiguration.MinimizeDistance
    u7.Connection:AddConnection(u320.PropertyBind.new(u7.ChatBubbleFrame, {"Image"}, u7.ChatMessage, "Parent", function() -- Line: 3007 -- upvalues: u7 (val)
        local v1 = u7.ChatBubbleFrame.Image == ""
        u7.HasImage = v1
        u7:UpdateTransparency()
    end))
    u7.Connection:AddConnection(u320.PropertyBind.new(BubbleChatConfiguration, {"BackgroundTransparency"}, u7.ChatMessage, "Parent", function() -- Line: 3018 -- upvalues: u7 (val)
        u7.BackgroundTransparency = u7:GetProperty("BackgroundTransparency")
    end))
    u7.BackgroundTransparency = u7:GetProperty("BackgroundTransparency")
    u7.Connection:AddConnection(u320.PropertyBind.new(BubbleChatConfiguration, {"BackgroundColor3"}, u7.ChatMessage, "Parent", function() -- Line: 3030 -- upvalues: u7 (val)
        u7.ChatBubbleFrame.BackgroundColor3 = u7:GetProperty("BackgroundColor3")
        u7.ChatMessage.Caret.ImageColor3 = u7:GetProperty("BackgroundColor3")
    end))
    ChatBubbleFrame = u7.ChatBubbleFrame
    ChatBubbleFrame.BackgroundColor3 = u7:GetProperty("BackgroundColor3")
    u7.ChatMessage.Caret.ImageColor3 = u7:GetProperty("BackgroundColor3")
    u7.Connection:AddConnection(u320.PropertyBind.new(BubbleChatConfiguration, {"FontFace"}, u7.ChatMessage, "Parent", function() -- Line: 3039 -- upvalues: u7 (val), BubbleChatConfiguration (upval)
        u7.Font = BubbleChatConfiguration.Font
        u7.BodyText.FontFace = u7:GetProperty("FontFace")
        u7.FontFace = u7:GetProperty("FontFace")
        u7:UpdateChat()
    end))
    u7.Font = BubbleChatConfiguration.Font
    local BodyText = u7.BodyText
    BodyText.FontFace = u7:GetProperty("FontFace")
    u7.FontFace = u7:GetProperty("FontFace")
    u7.Connection:AddConnection(u320.PropertyBind.new(BubbleChatConfiguration, {"TextColor3"}, u7.ChatMessage, "Parent", function() -- Line: 3050 -- upvalues: u7 (val)
        u7.BodyText.TextColor3 = u7:GetProperty("TextColor3")
    end))
    local BodyText_2 = u7.BodyText
    BodyText_2.TextColor3 = u7:GetProperty("TextColor3")
    u7.Connection:AddConnection(u320.PropertyBind.new(BubbleChatConfiguration, {"TextSize"}, u7.ChatMessage, "Parent", function() -- Line: 3056 -- upvalues: u7 (val)
        u7.TextSize = u7:GetProperty("TextSize")
        u7.BodyText.TextSize = u7:GetProperty("TextSize")
        u7:UpdateChat()
    end))
    u7.TextSize = u7:GetProperty("TextSize")
    local BodyText_3 = u7.BodyText
    BodyText_3.TextSize = u7:GetProperty("TextSize")
    u7.Connection:AddConnection(u320.PropertyBind.new(BubbleChatConfiguration, {"TailVisible"}, u7.ChatMessage, "Parent", function() -- Line: 3065 -- upvalues: u7 (val)
        local Property = u7:GetProperty("TailVisible")
        if Property then
            Property = u7.LastMessage
        end
        u7.ChatMessage.Caret.Visible = Property
    end))
    Property = u7:GetProperty("TailVisible")
    if Property then
        Property = u7.LastMessage
    end
    u7.ChatMessage.Caret.Visible = Property
    u7.Connection:AddConnection(u320.PropertyBind.new(Root, {"ChatTranslationEnabled"}, u7.ChatMessage, "Parent", function() -- Line: 3076 -- upvalues: u7 (val), Root (upval)
        u7.ChatTranslationEnabled = Root.ChatTranslationEnabled
        u7:UpdateChat()
    end))
    u7.ChatTranslationEnabled = Root.ChatTranslationEnabled
    u7.Connection:AddConnection(u320.PropertyBind.new(u585, {"FilterSpecialCharacters"}, u7.ChatMessage, "Parent", function() -- Line: 3089 -- upvalues: u7 (val)
        u7:UpdateChat()
    end))
    return u7
end
u320.DistantBubble = {__type = "distantBubble"}
function u320.DistantBubble:CleanUp() -- Line: 3099
    for k, v in pairs(self.InstanceBinds) do
        v:Disconnect()
    end
    self.Connection:Disconnect()
    self.InstanceBinds = {}
end
function u320.DistantBubble:Destroy() -- Line: 3106
    self:CleanUp()
    self.ChatMessage:Destroy()
end
function u320.DistantBubble:UpdateTransparency(p2, p3) -- Line: 3110 -- upvalues: u320 (val)
    local v1
    local v2 = math.round(u320.TransparencyMask(self.BackgroundTransparency, self.Current.Z) * 100) / 100
    self.LastTransparency = v2
    if not self.HasImage then
        v1 = 1
    else
        v1 = v2
    end
    self.ChatBubbleFrame.BackgroundTransparency = v1
    if not self.HasImage then
        v1 = v2
    else
        v1 = 1
    end
    self.ChatBubbleFrame.ImageTransparency = v1
    self.Caret.ImageTransparency = v2
end
function u320.DistantBubble:SmoothDamp(p2) -- Line: 3118 -- upvalues: TweenService (val), u320 (val)
    local v1, v2
    v1, v2 = TweenService:SmoothDamp(self.Current, self.Target, self.Velocity, 0.15, 1000, p2)
    self.Current = v1
    self.Velocity = v2
    v1 = math.round(u320.TransparencyMask(self.BackgroundTransparency, self.Current.Z) * 100) / 100
    local v3 = math.round(self.Current.X)
    v2 = UDim2.fromOffset(v3, (math.round(self.Current.Y)))
    if v2 ~= self.LastSize then
        self.LastSize = v2
        self.ChatMessage.Size = v2
    end
    if v1 ~= self.LastTransparency then
        local v4
        self.LastTransparency = v1
        if not self.HasImage then
            v4 = 1
        else
            v4 = v1
        end
        self.ChatBubbleFrame.BackgroundTransparency = v4
        if not self.HasImage then
            v4 = v1
        else
            v4 = 1
        end
        self.ChatBubbleFrame.ImageTransparency = v4
        self.Caret.ImageTransparency = v1
    end
end
function u320.DistantBubble:UpdateVisibility() -- Line: 3134
    self.ChatMessage.Visible = not self.InDistanceRange
    local Enabled = not self.InDistanceRange
    if Enabled then
        Enabled = self.Enabled
        if not Enabled then
            Enabled = self.Player == nil
        end
    end
    if self.Visible == Enabled then
        return
    end
    self.Visible = Enabled
    if not Enabled then
        self.Velocity = 0
        self:UpdateChat()
        return
    end
    self.Velocity = 0
    self:UpdateChat()
    self.Current = Vector3.new(0, self.Target.Y, 1)
    self.ChatMessage.Size = UDim2.fromOffset(self.Current.X, self.Current.Y)
end
function u320.DistantBubble:UpdateChat() -- Line: 3150 -- upvalues: u320 (val)
    if self.Visible then
        local Padding = self.ChatMessage.ChatBubbleFrame.Padding
        local v1 = u320.GetTextBounds(self.BodyText.Text, self.TextSize, self.Font, self.FontFace, u320.BubbleChatBounds)
        local v2 = Vector3.new(v1.X, v1.Y, 0)
        local v3 = v2 * Vector3.new(1 + (Padding.PaddingLeft.Scale + Padding.PaddingRight.Scale) * 2.5, 1 + (Padding.PaddingTop.Scale + Padding.PaddingBottom.Scale) * 0.75, 1)
        self.Target = v3 + Vector3.new((Padding.PaddingLeft.Offset + Padding.PaddingRight.Offset) * 2.5 * self.TextSize / 20, (Padding.PaddingBottom.Offset + Padding.PaddingTop.Offset) * 0.75 * self.TextSize / 20, 0)
    end
end
function u320.DistantBubble:ReBind(p2) -- Line: 3168 -- upvalues: u320 (val)
    local InstanceBinds
    if self.InstanceBinds[p2.ClassName] ~= nil then
        self.InstanceBinds[p2.ClassName]:Disconnect()
        self.InstanceBinds[p2.ClassName] = nil
    end
    InstanceBinds = self.InstanceBinds
    InstanceBinds[p2.ClassName] = u320.InstanceBind.new(p2, self.BindMap[p2.ClassName].Properties, self.BindMap[p2.ClassName].Instances, self.ChatMessage, "Parent", function() -- Line: 3179 -- upvalues: self (val)
        self:UpdateChat()
    end)
end
function u320.DistantBubble:UnBind(p2) -- Line: 3184 -- upvalues: DefaultBubbleChatConfiguration (val)
    if self.InstanceBinds[p2.ClassName] ~= nil then
        self.InstanceBinds[p2.ClassName]:Disconnect()
        self.InstanceBinds[p2.ClassName] = nil
    end
    local v1 = DefaultBubbleChatConfiguration[p2.ClassName]
    if not v1 then
        v1 = Instance.new(p2.ClassName)
    end
    self:ReBind(v1)
end
function u320.DistantBubble:AddInstanceBinds() -- Line: 3191 -- upvalues: BubbleChatConfiguration (val), DefaultBubbleChatConfiguration (val)
    local v1
    for k, v in pairs(self.BindMap) do
        v1 = BubbleChatConfiguration:FindFirstChildWhichIsA(k)
        if not v1 then
            v1 = DefaultBubbleChatConfiguration:FindFirstChildWhichIsA(k)
            if not v1 then
                v1 = Instance.new(k)
            end
        end
        v2:ReBind(v1)
    end
end
function u320.DistantBubble.new(p1) -- Line: 3199 -- upvalues: u320 (val), Assets (val), BubbleChatConfiguration (val), Root (val), RunService (val), u258 (val), u287 (val)
    local u6 = setmetatable({}, {__index = u320.DistantBubble})
    u6.Connection = u320.MultiConnection.new()
    u6.BubbleChatContainer = p1
    u6.Visible = false
    u6.InDistanceRange = false
    u6.Velocity = 0
    u6.Current = Vector3.new(0, 0, 0)
    u6.Target = u6.Current
    u6.ChatMessage = Assets.Elements.BubbleChatMessage:Clone()
    u6.ChatMessage.Visible = false
    u6.BodyText = u6.ChatMessage.ChatBubbleFrame.Text
    u6.BodyText.Text = "..."
    u6.UIScale = Instance.new("UIScale")
    u6.UIScale.Scale = 0.75
    u6.UIScale.Parent = u6.ChatMessage
    u6.ChatBubbleFrame = u6.ChatMessage.ChatBubbleFrame
    u6.Caret = u6.ChatMessage.Caret
    u6.BubbleDuration = BubbleChatConfiguration.BubbleDuration
    u6.BackgroundTransparency = BubbleChatConfiguration.BubbleDuration
    u6.MinimizeDistance = BubbleChatConfiguration.MinimizeDistance
    u6.ChatTranslationEnabled = Root.ChatTranslationEnabled
    u6.FontFace = BubbleChatConfiguration.FontFace
    u6.Font = BubbleChatConfiguration.Font
    u6.TextSize = BubbleChatConfiguration.TextSize
    u6.Enabled = BubbleChatConfiguration.Enabled
    u6.Player = u6.BubbleChatContainer.Player
    u6.InstanceBinds = {}
    local v1 = {
        UICorner = {
            Instances = {u6.ChatMessage.ChatBubbleFrame.UICorner},
            Properties = {"CornerRadius"},
        },
        UIGradient = {
            Instances = {u6.ChatMessage.ChatBubbleFrame.Gradient, u6.ChatMessage.Caret.Gradient},
            Properties = {
                "Color",
                "Enabled",
                "Offset",
                "Rotation",
                "Transparency",
            },
        },
        UIPadding = {
            Instances = {u6.ChatMessage.ChatBubbleFrame.Padding},
            Properties = {"PaddingBottom", "PaddingLeft", "PaddingRight", "PaddingTop"},
        },
        ImageLabel = {
            Instances = {u6.ChatMessage.ChatBubbleFrame},
            Properties = {
                "Image",
                "ImageColor3",
                "ImageRectOffset",
                "ImageRectSize",
                "ResampleMode",
                "ScaleType",
            },
        },
    }
    u6.BindMap = v1
    u6:AddInstanceBinds()
    v1 = u6.ChatBubbleFrame.Image == ""
    u6.HasImage = v1
    if u6.Player ~= nil then
        u6.Enabled = BubbleChatConfiguration.Enabled
        u6.Connection:AddConnection(u320.PropertyBind.new(BubbleChatConfiguration, {"Enabled"}, u6.ChatMessage, "Parent", function() -- Line: 3258 -- upvalues: u6 (val), BubbleChatConfiguration (upval)
            u6.Enabled = BubbleChatConfiguration.Enabled
            u6:UpdateVisibility()
        end))
    end
    u6.Connection:AddConnection(RunService.Heartbeat:Connect(function(p1) -- Line: 3264 -- upvalues: u6 (val), u258 (upval)
        u6:SmoothDamp(p1)
        if u6.BubbleChatContainer.Adornee ~= nil then
            local v1 = (u258.CFrame.Position - u6.BubbleChatContainer.Adornee.Position).Magnitude < u6.MinimizeDistance
            if v1 ~= u6.InDistanceRange then
                u6.InDistanceRange = v1
                u6:UpdateVisibility()
            end
        end
    end))
    u6.Connection:AddConnection(u287.ChildAdded:Connect(function(p1) -- Line: 3275 -- upvalues: u6 (val)
        if u6.BindMap[p1.ClassName] ~= nil then
            u6:ReBind(p1)
        end
    end))
    u6.Connection:AddConnection(u287.ChildRemoved:Connect(function(p1) -- Line: 3280 -- upvalues: u6 (val)
        if u6.BindMap[p1.ClassName] ~= nil then
            u6:UnBind(p1)
        end
    end))
    u6.Connection:AddConnection(u320.PropertyBind.new(BubbleChatConfiguration, {"BackgroundTransparency"}, u6.ChatMessage, "Parent", function() -- Line: 3291 -- upvalues: u6 (val), BubbleChatConfiguration (upval)
        u6.BackgroundTransparency = BubbleChatConfiguration.BackgroundTransparency
    end))
    u6.BackgroundTransparency = BubbleChatConfiguration.BackgroundTransparency
    u6.Connection:AddConnection(u320.PropertyBind.new(BubbleChatConfiguration, {"BubbleDuration"}, u6.ChatMessage, "Parent", function() -- Line: 3303 -- upvalues: u6 (val), BubbleChatConfiguration (upval)
        u6.BubbleDuration = BubbleChatConfiguration.BubbleDuration
    end))
    u6.BubbleDuration = BubbleChatConfiguration.BubbleDuration
    u6.Connection:AddConnection(u320.PropertyBind.new(BubbleChatConfiguration, {"MinimizeDistance"}, u6.ChatMessage, "Parent", function() -- Line: 3315 -- upvalues: u6 (val), BubbleChatConfiguration (upval)
        u6.MinimizeDistance = BubbleChatConfiguration.MinimizeDistance
    end))
    u6.MinimizeDistance = BubbleChatConfiguration.MinimizeDistance
    u6.Connection:AddConnection(u320.PropertyBind.new(u6.ChatBubbleFrame, {"Image"}, u6.ChatMessage, "Parent", function() -- Line: 3322 -- upvalues: u6 (val)
        local v1 = u6.ChatBubbleFrame.Image == ""
        u6.HasImage = v1
        u6:UpdateTransparency()
    end))
    local Connection_9 = u6.Connection
    local v2 = u320.StyleBind.new(BubbleChatConfiguration, "BackgroundColor3", u6.ChatMessage, "Parent")
    v2 = v2:Add(u6.ChatMessage.ChatBubbleFrame, "BackgroundColor3")
    Connection_9:AddConnection(v2:Add(u6.ChatMessage.Caret, "ImageColor3"))
    local Connection_10 = u6.Connection
    v2 = u320.StyleBind.new(BubbleChatConfiguration, "FontFace", u6.ChatMessage, "Parent")
    Connection_10:AddConnection(v2:Add(u6.BodyText, "FontFace"))
    local Connection_11 = u6.Connection
    v2 = u320.StyleBind.new(BubbleChatConfiguration, "TextColor3", u6.ChatMessage, "Parent")
    Connection_11:AddConnection(v2:Add(u6.BodyText, "TextColor3"))
    local Connection_12 = u6.Connection
    v2 = u320.StyleBind.new(BubbleChatConfiguration, "TextSize", u6.ChatMessage, "Parent")
    Connection_12:AddConnection(v2:Add(u6.BodyText, "TextSize"))
    u6.Connection:AddConnection(u320.PropertyBind.new(BubbleChatConfiguration, {"TailVisible"}, u6.ChatMessage, "Parent", function() -- Line: 3349 -- upvalues: u6 (val), BubbleChatConfiguration (upval)
        u6.ChatMessage.Caret.Visible = BubbleChatConfiguration.TailVisible
    end))
    u6.ChatMessage.Caret.Visible = BubbleChatConfiguration.TailVisible
    u6.Connection:AddConnection(u320.PropertyBind.new(BubbleChatConfiguration, {"FontFace", "TextSize"}, u6.ChatMessage, "Parent", function() -- Line: 3360 -- upvalues: u6 (val), BubbleChatConfiguration (upval)
        u6.Font = BubbleChatConfiguration.Font
        u6.FontFace = BubbleChatConfiguration.FontFace
        u6.TextSize = BubbleChatConfiguration.TextSize
        u6:UpdateChat()
    end))
    u6.Font = BubbleChatConfiguration.Font
    u6.FontFace = BubbleChatConfiguration.FontFace
    u6.TextSize = BubbleChatConfiguration.TextSize
    u6.Connection:AddConnection(u320.PropertyBind.new(Root, {"ChatTranslationEnabled"}, u6.ChatMessage, "Parent", function() -- Line: 3377 -- upvalues: u6 (val), Root (upval)
        u6.ChatTranslationEnabled = Root.ChatTranslationEnabled
        u6:UpdateChat()
    end))
    u6.ChatTranslationEnabled = Root.ChatTranslationEnabled
    return u6
end
u320.BubbleChatContainer = {__type = "bubbleChatContainer"}
u320.BubbleChatContainer.Instances = {}
function u320.BubbleChatContainer:CleanUp() -- Line: 3390
    self.Connection:Disconnect()
end
function u320.BubbleChatContainer:Destroy() -- Line: 3393 -- upvalues: u320 (val)
    u320.BubbleChatContainer.Instances[self.PartOrCharacter] = nil
    self:CleanUp()
    local v1 = #self.BubbleChatMessages
    local v2 = 1
    for i = 1, v1, v2 do
        table.remove(self.BubbleChatMessages, 1):Destroy()
    end
    self.Container:Destroy()
    self.DistantBubble:Destroy()
end
function u320.BubbleChatContainer:AddMessage(p2) -- Line: 3402 -- upvalues: u320 (val)
    local Property_2, v1, v2
    for k, v in pairs(self.BubbleChatMessages) do
        if v.Message.MessageId == p2.MessageId and p2.Text ~= "" then
            if p2.Status ~= Enum.TextChatMessageStatus.Success and p2.Status ~= Enum.TextChatMessageStatus.Sending then
                table.insert(self.BubbleChatMessages, table.remove(self.BubbleChatMessages, k))
                v:UpdateVisibility(true)
                v.LastMessage = false
                v.Caret.Visible = false
                v.ChatMessage.LayoutOrder = 0
                v2 = self.BubbleChatMessages[1]
                if v2 ~= nil then
                    v2.LastMessage = true
                    Property_2 = v2:GetProperty("TailVisible")
                    if Property_2 then
                        Property_2 = v2.LastMessage
                    end
                    v2.Caret.Visible = Property_2
                end
                return
            end
            v:SetMessage(p2)
            return
        end
    end
    if p2.Text == "" then
        v1 = #self.BubbleChatMessages
        if v1 <= 0 then
            self:Destroy()
        end
        return
    elseif p2.Status == Enum.TextChatMessageStatus.Success then
        self.BubbleChatLayoutOrder = self.BubbleChatLayoutOrder + 1
        v1 = u320.BubbleChatMessage.new(self, p2)
        local ChatMessage = v1.ChatMessage
        local v3 = self.BubbleChatMessages[1]
        if v3 ~= nil then
            v3.LastMessage = false
            v3.Caret.Visible = false
        end
        table.insert(self.BubbleChatMessages, 1, v1)
        ChatMessage.LayoutOrder = self.BubbleChatLayoutOrder
        ChatMessage.Parent = self.BubbleChatList
        local Property = v1:GetProperty("TailVisible")
        if Property then
            Property = v1.LastMessage
        end
        ChatMessage.Caret.Visible = Property
        self:UpdateMessages()
        return
    elseif p2.Status ~= Enum.TextChatMessageStatus.Sending then
        v1 = #self.BubbleChatMessages
        if v1 <= 0 then
            self:Destroy()
        end
        return
    end
end
function u320.BubbleChatContainer:UpdateMessages() -- Line: 3455 -- upvalues: BubbleChatConfiguration (val)
    local v1
    for k, v in pairs(self.BubbleChatMessages) do
        v1 = k <= BubbleChatConfiguration.MaxBubbles
        v.InChatRange = v1
        v:UpdateVisibility()
    end
end
function u320.BubbleChatContainer:UpdateTarget() -- Line: 3461 -- upvalues: u320 (val)
    local Position, v1
    if self.Adornee == nil then
        return
    end
    local v2 = self.Adornee.Position ~= self.LastPosition
    local Visible = not self.Updated
    if Visible then
        Visible = false
        v1 = self.LastUpdate + u320.RaycastInterval
        if v1 < os.clock() then
            Visible = self.Visible
        end
    end
    if v2 then
        if Visible then
            self.Updated = true
            self.LastUpdate = os.clock()
            v1 = workspace:Raycast(self.Adornee.Position - u320.RayDown, u320.RayDown, self.RaycastParams)
            if v1 == nil then
                Position = self.Adornee.Position
            else
                Position = v1.Position - self.Adornee.Position
            end
            self.Target = Position
            self.LastPosition = self.Adornee.Position
            return
        end
        self.Updated = false
        return
    end
    if not Visible then
        return
    end
    if not Visible then
        self.Updated = false
        return
    end
    self.Updated = true
    self.LastUpdate = os.clock()
    v1 = workspace:Raycast(self.Adornee.Position - u320.RayDown, u320.RayDown, self.RaycastParams)
    if v1 == nil then
        Position = self.Adornee.Position
    else
        Position = v1.Position - self.Adornee.Position
    end
    self.Target = Position
    self.LastPosition = self.Adornee.Position
end
function u320.BubbleChatContainer:SmoothDamp(p2) -- Line: 3481 -- upvalues: TweenService (val)
    if self.Adornee ~= nil and self.Visible then
        local v1, v2
        v1, v2 = TweenService:SmoothDamp(self.Current, self.Target, self.Velocity, 2, 1000, p2)
        self.Current = v1
        self.Velocity = v2
        self.Container.StudsOffsetWorldSpace = self.Current
    end
end
function u320.BubbleChatContainer:SetVisibility(p2) -- Line: 3487 -- upvalues: BubbleChat (val)
    if self.Visible ~= p2 then
        local v1
        self.Visible = p2
        if not p2 then
            v1 = nil
        else
            v1 = BubbleChat
        end
        self.Container.Parent = v1
    end
end
function u320.BubbleChatContainer.new(p1) -- Line: 3493 -- upvalues: u320 (val), Assets (val), Players (val), LocalPlayer (val), BubbleChatConfiguration (val), RunService (val), u212 (val)
    local CaretPadding, CaretPadding_2, LocalPlayerStudsOffset, v1
    local u6 = setmetatable({}, {__index = u320.BubbleChatContainer})
    u6.Instances = nil
    u6.Connection = u320.MultiConnection.new()
    u6.PartOrCharacter = p1
    local v2 = {}
    u6.BubbleChatMessages = v2
    u6.RaycastParams = RaycastParams.new()
    u6.RaycastParams.FilterType = Enum.RaycastFilterType.Include
    u6.RaycastParams.FilterDescendantsInstances = {u6.PartOrCharacter}
    u6.Container = Assets.Elements.BubbleChatContainer:Clone()
    u6.Container.Enabled = true
    u6.Current = Vector3.new(0, 0, 0)
    u6.Target = u6.Current
    u6.Velocity = 0
    u6.BubbleChatLayoutOrder = 1
    u6.Player = Players:GetPlayerFromCharacter(p1)
    v2 = u6.Player == LocalPlayer
    u6.IsLocalPlayer = v2
    u6.LastUpdate = 0
    u6.Updated = false
    u6.BubbleChatList = u6.Container.BubbleChatList
    u6.DistantBubble = u320.DistantBubble.new(u6)
    u6.DistantBubble.ChatMessage.Parent = u6.BubbleChatList
    if not (u6.PartOrCharacter:IsA("BasePart")) then
        u6.Adornee = u6.PartOrCharacter:FindFirstChild(BubbleChatConfiguration.AdorneeName)
        u6.Container.Adornee = u6.Adornee
        v1 = u6.Adornee ~= nil
        u6:SetVisibility(v1)
        u6.Connection:AddConnection(u320.PropertyBind.new(BubbleChatConfiguration, {"AdorneeName"}, u6.Container, "Parent", function() -- Line: 3537 -- upvalues: u6 (val), BubbleChatConfiguration (upval)
            local PartOrCharacter
            if not (u6.PartOrCharacter:IsA("BasePart")) then
                PartOrCharacter = u6.PartOrCharacter:FindFirstChild(BubbleChatConfiguration.AdorneeName)
            else
                PartOrCharacter = u6.PartOrCharacter
            end
            u6.Adornee = PartOrCharacter
            u6.Container.Adornee = u6.Adornee
            local v1 = u6.Adornee ~= nil
            u6:SetVisibility(v1)
            u6.Current = u6.Target
        end))
    else
        u6.Adornee = u6.PartOrCharacter
        u6.Container.Adornee = u6.Adornee
        v1 = u6.Adornee ~= nil
        u6:SetVisibility(v1)
    end
    u6:UpdateTarget()
    u6.Current = u6.Target
    u6.Connection:AddConnection(RunService.Heartbeat:Connect(function(p1) -- Line: 3553 -- upvalues: u6 (val)
        u6:UpdateTarget()
        u6:SmoothDamp(p1)
    end))
    u6.Connection:AddConnection(u6.PartOrCharacter.Destroying:Connect(function(p1) -- Line: 3557 -- upvalues: u6 (val)
        u6:Destroy()
    end))
    u6.Connection:AddConnection(u320.PropertyBind.new(BubbleChatConfiguration, {"TailVisible"}, u6.Container, "Parent", function() -- Line: 3561 -- upvalues: u6 (val), BubbleChatConfiguration (upval), u320 (upval)
        local CaretPadding_2
        local CaretPadding = u6.Container.BubbleChatList.CaretPadding
        if not BubbleChatConfiguration.TailVisible then
            CaretPadding_2 = u320.NoPadding
        else
            CaretPadding_2 = u320.CaretPadding
            if not CaretPadding_2 then
                CaretPadding_2 = u320.NoPadding
            end
        end
        CaretPadding.PaddingBottom = CaretPadding_2
    end))
    CaretPadding = u6.Container.BubbleChatList.CaretPadding
    if not BubbleChatConfiguration.TailVisible then
        CaretPadding_2 = u320.NoPadding
    else
        CaretPadding_2 = u320.CaretPadding
    end
    CaretPadding.PaddingBottom = CaretPadding_2
    u6.Connection:AddConnection(u320.PropertyBind.new(BubbleChatConfiguration, {"MaxBubbles"}, u6.Container, "Parent", function() -- Line: 3571 -- upvalues: u6 (val)
        u6:UpdateMessages()
    end))
    u6.Connection:AddConnection(u320.PropertyBind.new(BubbleChatConfiguration, {"BubblesSpacing"}, u6.Container, "Parent", function() -- Line: 3576 -- upvalues: u6 (val), BubbleChatConfiguration (upval)
        u6.Container.BubbleChatList.Layout.Padding = UDim.new(0, BubbleChatConfiguration.BubblesSpacing)
    end))
    u6.Container.BubbleChatList.Layout.Padding = UDim.new(0, BubbleChatConfiguration.BubblesSpacing)
    u6.Connection:AddConnection(u320.PropertyBind.new(BubbleChatConfiguration, {"VerticalStudsOffset"}, u6.Container, "Parent", function() -- Line: 3587 -- upvalues: u6 (val), BubbleChatConfiguration (upval), u320 (upval)
        local LocalPlayerStudsOffset
        if not u6.IsLocalPlayer then
            LocalPlayerStudsOffset = u320.DisplayBubbleOffset
        else
            LocalPlayerStudsOffset = BubbleChatConfiguration.LocalPlayerStudsOffset
        end
        u6.Container.StudsOffset = LocalPlayerStudsOffset + Vector3.new(0, BubbleChatConfiguration.VerticalStudsOffset, 0)
    end))
    u6.Connection:AddConnection(u320.PropertyBind.new(BubbleChatConfiguration, {"LocalPlayerStudsOffset"}, u6.Container, "Parent", function() -- Line: 3602 -- upvalues: u6 (val), BubbleChatConfiguration (upval), u320 (upval)
        local LocalPlayerStudsOffset
        if not u6.IsLocalPlayer then
            LocalPlayerStudsOffset = u320.DisplayBubbleOffset
        else
            LocalPlayerStudsOffset = BubbleChatConfiguration.LocalPlayerStudsOffset
        end
        u6.Container.StudsOffset = LocalPlayerStudsOffset + Vector3.new(0, BubbleChatConfiguration.VerticalStudsOffset, 0)
    end))
    if not u6.IsLocalPlayer then
        LocalPlayerStudsOffset = u320.DisplayBubbleOffset
    else
        LocalPlayerStudsOffset = BubbleChatConfiguration.LocalPlayerStudsOffset
    end
    u6.Container.StudsOffset = LocalPlayerStudsOffset + Vector3.new(0, BubbleChatConfiguration.VerticalStudsOffset, 0)
    local Connection_9 = u6.Connection
    v1 = u320.StyleBind.new(BubbleChatConfiguration, "MaxDistance", u6.Container, "Parent")
    Connection_9:AddConnection(v1:Add(u6.Container, "MaxDistance"))
    if u212 then
        local Container_2 = u6.Container
        Container_2.StudsOffset = Vector3.new(-2, 0, 0)
    end
    u320.BubbleChatContainer.Instances[u6.PartOrCharacter] = u6
    return u6
end
u320.ExperienceChat = {__type = "experienceChat"}
function u320.ExperienceChat:CleanUp() -- Line: 3630 -- upvalues: u320 (val), chatWindow (val), chatInputBar (val), appLayout (val), TextBox (val), RCTScrollContentView (val), TargetChannelChip (val), channelBar (val)
    self.Connection:Disconnect()
    u320.BackgroundFadeTransparency:Remove({
        chatWindow,
        chatInputBar,
        appLayout.topBorder,
        appLayout.bottomBorder,
        appLayout.topPadding,
        chatInputBar.Background,
        TextBox,
        RCTScrollContentView,
        TargetChannelChip,
        chatInputBar.Background.Container.SendButton.SendIcon,
        channelBar.HorizontalBar.Background,
        channelBar.HorizontalBar.BottomBorder,
        channelBar.HorizontalBar.TopCorner,
        channelBar.DropdownButton.TextButton,
        channelBar.DropdownButton.TextButton.DropdownIconImage,
        channelBar.DropdownButton.UnreadDot,
    })
end
function u320.ExperienceChat:CloseBackgroundFade() -- Line: 3651
    if self.BackgroundFadeCoroutine ~= nil then
        task.cancel(self.BackgroundFadeCoroutine)
        self.BackgroundFadeCoroutine = nil
    end
end
function u320.ExperienceChat:StartBackgroundFade() -- Line: 3657 -- upvalues: u585 (val), u320 (val)
    self:CloseBackgroundFade()
    local BackgroundFadeOutTime = u585.BackgroundFadeOutTime
    if tostring(BackgroundFadeOutTime) == "nan" then
        warn("BackgroundFadeOutTime cannot be NaN")
        return
    end
    if BackgroundFadeOutTime ~= math.huge then
        self.BackgroundFadeCoroutine = task.delay(BackgroundFadeOutTime, u320.BackgroundFadeTransparency.SetTarget, u320.BackgroundFadeTransparency, 1)
    end
end
function u320.ExperienceChat:CloseTextFade() -- Line: 3669
    if self.TextFadeCoroutine ~= nil then
        task.cancel(self.TextFadeCoroutine)
        self.TextFadeCoroutine = nil
    end
end
function u320.ExperienceChat:StartTextFade() -- Line: 3675 -- upvalues: u585 (val), u320 (val)
    self:CloseTextFade()
    local v1 = math.max(u585.TextFadeOutTime, u585.BackgroundFadeOutTime)
    if tostring(v1) == "nan" then
        warn("BackgroundFadeOutTime cannot be NaN")
        return
    end
    if v1 ~= math.huge then
        self.TextFadeCoroutine = task.delay(v1, u320.TextFadeTransparency.SetTarget, u320.TextFadeTransparency, 1)
    end
end
function u320.ExperienceChat:RegisterActivity(p2) -- Line: 3688 -- upvalues: ChatInputBarConfiguration (val), u320 (val)
    local v1
    if p2 ~= nil then
        v1 = p2
    else
        v1 = false
    end
    local IsFocused = ChatInputBarConfiguration.IsFocused
    if not v1 then
        u320.BackgroundFadeTransparency:SetCurrent(0, 0)
        u320.BackgroundFadeTransparency:SetTarget(0)
        if not IsFocused then
            self:StartBackgroundFade()
        else
            self:CloseBackgroundFade()
        end
    end
    u320.TextFadeTransparency:SetCurrent(0, 0)
    u320.TextFadeTransparency:SetTarget(0)
    if IsFocused then
        self:CloseTextFade()
        return
    end
    self:StartTextFade()
end
function u320.ExperienceChat.UpdateAutoCompleteBounds(p1) -- Line: 3708 -- upvalues: u320 (val), appLayout (val), OffsetFrame (val), Assets (val), AutocompleteDropdown (val)
    local v1 = u320.GetAbsoluteSize(u320.GetViewportSize(), appLayout.Size, appLayout.uiSizeConstraint)
    local v2 = math.min(v1.Y, (#OffsetFrame:GetChildren() - 1) * Assets.Elements.TextChatAutoComplete.Size.Y.Offset)
    local v3 = math.min(v2, 105)
    AutocompleteDropdown.Size = UDim2.new(0.95, 0, 0, v3)
end
function u320.ExperienceChat:UpdateAutoComplete() -- Line: 3717 -- upvalues: ChatInputBarConfiguration (val), AutocompleteDropdown (val), u320 (val), UserInputService (val), TextBox (val)
    task.wait()
    if not ChatInputBarConfiguration.IsFocused then
        if AutocompleteDropdown.Visible ~= false then
            for k, v in pairs(u320.TextChatAutoComplete.Instances) do
                v:SetVisibility(false)
            end
            AutocompleteDropdown.Visible = false
        end
        return
    elseif ChatInputBarConfiguration.AutocompleteEnabled then
        local CurrentAutoComplete, ReplaceMatch, v1, v2, v3, v4
        if not UserInputService.KeyboardEnabled or not (u320.OwnsTextBox()) then
            return
        end
        v2, v3, v4 = u320.ParseAutoComplete(TextBox.Text, TextBox.CursorPosition)
        local v5 = false
        local v6 = {}
        if v3 ~= nil then
            local v7, v8, v9, v10
            v1 = self
            for k2, i in pairs(u320.TextChatAutoComplete.Instances) do
                v7 = false
                v8 = false
                if i.AutoCompleteEnabled then
                    if v2 ~= 1 and i.OnlyAtStart then
                        v10 = v7
                        if v10 then
                            v10 = not v8
                        end
                        i:SetVisibility(v10)
                        continue
                    end
                    if i.MinReplaceLength <= v4 then
                        ReplaceMatch = i.ReplaceMatch
                        v9 = string.sub(ReplaceMatch, 0, v4)
                        v7 = string.match(v3, v9) ~= nil
                        v10 = v7
                        if v10 then
                            v10 = string.len(ReplaceMatch) <= v4
                        end
                        v8 = v10
                        v5 = v5 or v7
                        if v7 and not v8 then
                            i.ReplaceIndex = v2
                            i.ReplaceWord = v3
                            i.ReplaceLength = v4
                            table.insert(v6, i)
                        end
                        if v8 and i.CompleteWhenMatched then
                            u320.FillAutoComplete(TextBox, v2, v4, i.ReplaceWith)
                            break
                        end
                    end
                end
            end
        end
        table.sort(v6, function(p1, p2) -- Line: 3772
            local v1
            local v2 = string.len(p1.ReplaceMatch)
            local ReplaceMatch = p2.ReplaceMatch
            local v3 = string.len(ReplaceMatch)
            if v2 ~= v3 then
                v1 = v2 < v3
                return v1
            end
            v1 = p1.ReplaceMatch < ReplaceMatch
            return v1
        end)
        for k3, j in pairs(v6) do
            if j.Visible then
                j.TextChatAutoComplete.LayoutOrder = k3
            end
        end
        local v11 = 0 < #v6
        AutocompleteDropdown.Visible = v11
        v1:UpdateAutoCompleteBounds()
        if u320.CurrentAutoComplete ~= v6[1] then
            CurrentAutoComplete = u320.CurrentAutoComplete
            u320.CurrentAutoComplete = nil
            if CurrentAutoComplete ~= nil then
                CurrentAutoComplete:UpdateAppearance()
            end
            u320.CurrentAutoComplete = v6[1]
            if v6[1] ~= nil then
                v6[1]:UpdateAppearance()
            end
        end
        return
    end
end
function u320.ExperienceChat:HandleInput(p2) -- Line: 3802 -- upvalues: UserInputService (val), u320 (val), ChatInputBarConfiguration (val), TextBox (val), ChannelTabsConfiguration (val)
    if not UserInputService.KeyboardEnabled then
        return
    end
    if u320.CurrentAutoComplete ~= nil then
        if p2.KeyCode == Enum.KeyCode.Up then
            for k2, i in pairs(u320.TextChatAutoComplete.Instances) do
                if i.Visible == true and i.TextChatAutoComplete.LayoutOrder == u320.CurrentAutoComplete.TextChatAutoComplete.LayoutOrder - 1 then
                    u320.CurrentAutoComplete = i
                    u320.CurrentAutoComplete:UpdateAppearance()
                    i:UpdateAppearance()
                    if p2.KeyCode == ChatInputBarConfiguration.KeyboardKeyCode and ChatInputBarConfiguration.Enabled and u320.OwnsTextBox() and u320.GetChatCoreGuiEnabled() then
                        task.wait()
                        TextBox:CaptureFocus()
                        u320.SetChatActive(true)
                    end
                    if p2.KeyCode == Enum.KeyCode.Backspace and ChatInputBarConfiguration.Enabled and ChatInputBarConfiguration.IsFocused and TextBox.Text == "" and not ChannelTabsConfiguration.Enabled then
                        if u320.IsWhisper(ChatInputBarConfiguration.TargetTextChannel) then
                            if u320.OwnsTextBox() then
                                ChatInputBarConfiguration.TargetTextChannel = self.LastNonWhisper
                            end
                        elseif u320.IsTeam(ChatInputBarConfiguration.TargetTextChannel) and u320.OwnsTextBox() then
                            ChatInputBarConfiguration.TargetTextChannel = self.LastNonWhisper
                        end
                    end
                    return
                end
            end
        elseif p2.KeyCode == Enum.KeyCode.Down then
            for k, v in pairs(u320.TextChatAutoComplete.Instances) do
                if v.Visible == true and v.TextChatAutoComplete.LayoutOrder == u320.CurrentAutoComplete.TextChatAutoComplete.LayoutOrder + 1 then
                    u320.CurrentAutoComplete = v
                    u320.CurrentAutoComplete:UpdateAppearance()
                    v:UpdateAppearance()
                    break
                end
            end
        end
    end
end
local function getChatTransformations(p1) -- Line: 3860 -- upvalues: ClientStatusHandler (val)
    local v1, v2
    if not (ClientStatusHandler.hasPlayerStatus(ClientStatusHandler.Statuses.POISONED)) then
        return p1
    end
    local v3 = string.split(p1, " ")
    local v4 = {}
    for i, v in ipairs(v3) do
        v2 = math.random()
        if v2 < 0.25 then
            v1 = string.len(v)
            if 2 < v1 then
                v1 = math.random(1, (math.min(2, string.len(v) - 1)))
                table.insert(v4, string.sub(v, 1, v1) .. "-" .. v)
            end
        elseif v2 < 0.35 then
            v1 = string.len(v)
            if 1 < v1 then
                table.insert(v4, string.sub(v, 1, (math.random(1, string.len(v) - 1))) .. "-")
            end
        elseif v2 >= 0.45 then
            table.insert(v4, v)
        else
            table.insert(v4, v .. ", " .. v)
        end
    end
    return table.concat(v4, " ")
end
function u320.ExperienceChat.SendChatInputBarTextBox(p1) -- Line: 3895 -- upvalues: u320 (val), TextBox (val), ChatInputBarConfiguration (val), getChatTransformations (val), Player (val)
    if not (u320.OwnsTextBox()) then
        return
    end
    if TextBox.Text == "" or ChatInputBarConfiguration.TargetTextChannel == nil then
        TextBox.Text = ""
        TextBox:ReleaseFocus()
        return
    end
    TextBox.Text = ""
    TextBox:ReleaseFocus()
    local v1 = getChatTransformations(TextBox.Text)
    Player.Chat.post(v1)
end
function u320.ExperienceChat:RegisterTextChatMessage(p2) -- Line: 3916 -- upvalues: u320 (val), ChannelTabsConfiguration (val)
    local v1 = false
    if u320.TextChannel.Instances[p2.TextChannel] ~= nil then
        v1 = true
        u320.TextChannel.Instances[p2.TextChannel]:AddMessage(p2)
    end
    if p2.TextChannel.Name == "RBXSystem" then
        for k, v in pairs(u320.TextChannel.Instances) do
            if v.TextChannel.Name == "RBXGeneral" then
                v1 = true
                v:AddMessage(p2)
            end
        end
    end
    u320.TextChannel.Instances[u320.RBXAll]:AddMessage(p2)
    if not ChannelTabsConfiguration.Enabled then
        self:RegisterActivity(true)
    elseif v1 then
        self:RegisterActivity(true)
    end
end
function u320.ExperienceChat.CotentViewChildChanged(p1, p2) -- Line: 3939 -- upvalues: RCTScrollContentView (val), u320 (val), Padding (val)
    if not (p2:IsA("GuiObject")) then
        return
    end
    local Parent = RCTScrollContentView.Parent
    local AbsoluteWindowSize = Parent.AbsoluteWindowSize
    local CanvasPosition = Parent.CanvasPosition
    local AbsoluteCanvasSize = Parent.AbsoluteCanvasSize
    local v1 = CanvasPosition.Y + AbsoluteWindowSize.Y
    local v2 = AbsoluteCanvasSize.Y - u320.AutoScrollThreshold - p2.AbsoluteSize.Y
    if v2 - Padding.Offset <= v1 then
        Parent.CanvasPosition = Vector2.new(CanvasPosition.X, AbsoluteCanvasSize.Y - AbsoluteWindowSize.Y)
    end
end
function u320.ExperienceChat:FocusChanged(p2) -- Line: 3956 -- upvalues: u320 (val), TextBox (val)
    if u320.OwnsTextBox() then
        TextBox.Text = string.gsub(TextBox.Text, "%c", "")
        if p2 then
            if u320.CurrentAutoComplete == nil then
                self:SendChatInputBarTextBox()
            else
                u320.CurrentAutoComplete:Replace()
                task.delay(0, function() -- Line: 3962 -- upvalues: TextBox (upval), self (val)
                    TextBox.Text = string.gsub(TextBox.Text, "%c", "")
                    self:UpdateTextBoxPlaceholder()
                end)
            end
        end
    end
    self:TextBoxTextChanged()
    self:UpdateTextBoxPlaceholder()
end
function u320.ExperienceChat:TextBoxTextChanged() -- Line: 3974 -- upvalues: ChatInputBarConfiguration (val), TextBox (val), u320 (val), chatInputBar (val)
    local TextColor3, v1, v2
    local v3 = self.LastTextInput or ""
    local Text = TextBox.Text
    local v4 = string.len(Text)
    if 200 < v4 then
        TextBox.Text = v3
        Text = v3
    end
    v4 = Text == ""
    if TextBox.Text == "" then
        v2 = 0.5
    else
        v2 = 0
    end
    TextBox.TextTransparency = u320.TransparencyMask(v2, u320.BackgroundFadeTransparency.Transparency)
    if v4 then
        v1 = 0.5
    else
        v1 = 0
    end
    chatInputBar.Background.Container.SendButton.SendIcon.ImageTransparency = v1
    local SendIcon = chatInputBar.Background.Container.SendButton.SendIcon
    if v4 then
        TextColor3 = ChatInputBarConfiguration.PlaceholderColor3
    else
        TextColor3 = ChatInputBarConfiguration.TextColor3
        if not TextColor3 then
            TextColor3 = ChatInputBarConfiguration.PlaceholderColor3
        end
    end
    SendIcon.ImageColor3 = TextColor3
    self:UpdateAutoComplete()
    self.LastTextInput = Text
end
function u320.ExperienceChat:BoundsChanged() -- Line: 3994 -- upvalues: appLayout (val), u212 (val), u320 (val), ChatWindowConfiguration (val)
    local v1
    if not u212 then
        v1 = u320.Alignment[Enum.HorizontalAlignment][ChatWindowConfiguration.HorizontalAlignment]
    else
        v1 = Vector3.new(0, 8, 0)
    end
    local v2 = u320.Alignment[Enum.VerticalAlignment][ChatWindowConfiguration.VerticalAlignment]
    appLayout.Position = UDim2.new(v1.X, v1.Y, v2.X, v2.Y + -v2.Z * (appLayout.layout.AbsoluteContentSize.Y - appLayout.AbsoluteSize.Y))
    appLayout.AnchorPoint = Vector2.new(v1.Z, v2.Z)
    self:UpdateAutoCompleteBounds()
end
function u320.ExperienceChat.UpdateTextBoxPlaceholder(p1) -- Line: 4011 -- upvalues: ChatInputBarConfiguration (val), TextBox (val), GuiService (val), UserInputService (val), u320 (val)
    local v1
    if ChatInputBarConfiguration.IsFocused then
        TextBox.PlaceholderText = ""
        return
    end
    if GuiService:IsTenFootInterface() then
        v1 = "Use that \"Chat\" button in the menu to chat"
    elseif UserInputService.KeyboardEnabled then
        v1 = ("To chat click here or press %* key"):format((string.lower(u320.KeyCodeToChar(ChatInputBarConfiguration.KeyboardKeyCode))))
    else
        v1 = "Tap here to chat"
    end
    TextBox.PlaceholderText = v1
end
function u320.ExperienceChat:TargetTextChannelChanged() -- Line: 4025 -- upvalues: ChatInputBarConfiguration (val), u320 (val)
    if ChatInputBarConfiguration.TargetTextChannel ~= nil and not (u320.IsWhisper(ChatInputBarConfiguration.TargetTextChannel)) and not (u320.IsTeam(ChatInputBarConfiguration.TargetTextChannel)) then
        self.LastNonWhisper = ChatInputBarConfiguration.TargetTextChannel
    end
    self:UpdateTextBoxChip()
end
function u320.ExperienceChat.UpdateTextBoxChip(p1) -- Line: 4037 -- upvalues: ChannelTabsConfiguration (val), u320 (val), ChatInputBarConfiguration (val), TargetChannelChip (val), TextBoxContainer (val)
    local v1, v2
    if ChannelTabsConfiguration.Enabled then
        TargetChannelChip.Visible = false
        TextBoxContainer.Size = UDim2.new(1, -8, 0, 0)
        return
    end
    if u320.IsWhisper(ChatInputBarConfiguration.TargetTextChannel) then
        if not (u320.IsWhisper(ChatInputBarConfiguration.TargetTextChannel)) then
            v1 = ("[%*]"):format((u320.GetChannelName(ChatInputBarConfiguration.TargetTextChannel)))
        else
            v1 = ("[To %*]"):format((u320.GetChannelName(ChatInputBarConfiguration.TargetTextChannel)))
        end
        TargetChannelChip.Visible = true
        TargetChannelChip.Text = v1
        v2 = u320.GetTextBounds(v1, TargetChannelChip.TextSize, nil, TargetChannelChip.FontFace, u320.LongChatBounds)
        TargetChannelChip.Size = UDim2.new(0, v2.X, 1, 0)
        TextBoxContainer.Size = UDim2.new(1, -8 - v2.X, 0, 0)
        return
    end
    if not (u320.IsTeam(ChatInputBarConfiguration.TargetTextChannel)) then
        TargetChannelChip.Visible = false
        TextBoxContainer.Size = UDim2.new(1, -8, 0, 0)
        return
    end
    if not (u320.IsWhisper(ChatInputBarConfiguration.TargetTextChannel)) then
        v1 = ("[%*]"):format((u320.GetChannelName(ChatInputBarConfiguration.TargetTextChannel)))
    else
        v1 = ("[To %*]"):format((u320.GetChannelName(ChatInputBarConfiguration.TargetTextChannel)))
    end
    TargetChannelChip.Visible = true
    TargetChannelChip.Text = v1
    v2 = u320.GetTextBounds(v1, TargetChannelChip.TextSize, nil, TargetChannelChip.FontFace, u320.LongChatBounds)
    TargetChannelChip.Size = UDim2.new(0, v2.X, 1, 0)
    TextBoxContainer.Size = UDim2.new(1, -8 - v2.X, 0, 0)
end
function u320.ExperienceChat.PopulateAutoComplete(p1) -- Line: 4064 -- upvalues: AutoComplete (val), u320 (val)
    local v1, v2
    local v3 = {}
    for k, v in pairs(AutoComplete.Emojis) do
        table.insert(v3, {Name = k, Emoji = v})
    end
    table.sort(v3, function(p1, p2) -- Line: 4069
        local v1
        local v2 = string.len(p1.Name)
        local v3 = string.len(p2.Name)
        if v2 == v3 then
            v1 = p1.Name < p2.Name
            return v1
        end
        v1 = v2 < v3
        return v1
    end)
    for k2, i in pairs(v3) do
        v2 = (":%*:"):format(i.Name)
        v1 = ("%* %*"):format(i.Emoji, i.Name)
        u320.TextChatAutoComplete.new(i.Emoji, v2, v1, 3, false, true, true, true)
    end
end
function u320.ExperienceChat.new() -- Line: 4091 -- upvalues: u320 (val), ExperienceChat (val), Root (val), appLayout (val), ChatWindowConfiguration (val), u275 (val), ChatInputBarConfiguration (val), chatInputBar (val), UserInputService (val), TextBox (val), BubbleChatConfiguration (val), PlayerGui (val), u279 (val), ChannelTabsConfiguration (val), channelBar (val), u283 (val), TextChatService (val), chatWindow (val), RCTScrollContentView (val), TargetChannelChip (val), Border (val), Border_2 (val), AutocompleteDropdown (val), Event (val)
    local v1
    local v2 = {__index = u320.ExperienceChat}
    local u5 = setmetatable({}, v2)
    u5.Connection = u320.MultiConnection.new()
    u320.BackgroundFadeTransparency = u320.Transparency.new(1, ExperienceChat, "Enabled")
    u320.TextFadeTransparency = u320.Transparency.new(1, ExperienceChat, "Enabled")
    Root:__addgetter("ChatAbsolutePosition", function(p1, p2) -- Line: 4100 -- upvalues: appLayout (upval)
        return appLayout.AbsolutePosition
    end)
    Root:__addsetter("ChatAbsolutePosition", function(p1, p2, p3) -- Line: 4103
        error("Unable to assign property ChatAbsolutePosition. Property is read only", 2)
    end)
    Root:__addsignal("ChatAbsolutePosition", appLayout:GetPropertyChangedSignal("AbsolutePosition"))
    Root:__addgetter("ChatAbsoluteSize", function(p1, p2) -- Line: 4107 -- upvalues: appLayout (upval)
        return appLayout.layout.AbsoluteContentSize
    end)
    Root:__addsetter("ChatAbsoluteSize", function(p1, p2, p3) -- Line: 4110
        error("Unable to assign property ChatAbsoluteSize. Property is read only", 2)
    end)
    Root:__addsignal("ChatAbsoluteSize", appLayout.layout:GetPropertyChangedSignal("AbsoluteContentSize"))
    Root:__addgetter("ChatTextFaded", function(p1, p2) -- Line: 4117 -- upvalues: u320 (upval)
        local v1 = u320.TextFadeTransparency.Target == 1
        return v1
    end)
    Root:__addsetter("ChatTextFaded", function(p1, p2, p3) -- Line: 4120
        error("Unable to assign property ChatTextFaded. Property is read only", 2)
    end)
    Root:__addsignal("ChatTextFaded", u320.TextFadeTransparency.FadedChanged)
    Root:__addgetter("ChatTextTransparency", function(p1, p2) -- Line: 4124 -- upvalues: u320 (upval)
        return u320.TextFadeTransparency.Transparency
    end)
    Root:__addsetter("ChatTextTransparency", function(p1, p2, p3) -- Line: 4127
        error("Unable to assign property ChatTextTransparency. Property is read only", 2)
    end)
    Root:__addsignal("ChatTextTransparency", u320.TextFadeTransparency.TransparencyChanged)
    Root:__addgetter("ChatBackgroundFaded", function(p1, p2) -- Line: 4131 -- upvalues: u320 (upval)
        local v1 = u320.BackgroundFadeTransparency.Target == 1
        return v1
    end)
    Root:__addsetter("ChatBackgroundFaded", function(p1, p2, p3) -- Line: 4134
        error("Unable to assign property ChatBackgroundFaded. Property is read only", 2)
    end)
    Root:__addsignal("ChatBackgroundFaded", u320.BackgroundFadeTransparency.FadedChanged)
    Root:__addgetter("ChatBackgroundTransparency", function(p1, p2) -- Line: 4138 -- upvalues: u320 (upval)
        return u320.BackgroundFadeTransparency.Transparency
    end)
    Root:__addsetter("ChatBackgroundTransparency", function(p1, p2, p3) -- Line: 4141
        error("Unable to assign property ChatBackgroundTransparency. Property is read only", 2)
    end)
    Root:__addsignal("ChatBackgroundTransparency", u320.BackgroundFadeTransparency.TransparencyChanged)
    ChatWindowConfiguration:__addgetter("AbsolutePosition", function(p1, p2) -- Line: 4147 -- upvalues: appLayout (upval)
        return appLayout.AbsolutePosition
    end)
    ChatWindowConfiguration:__addsetter("AbsolutePosition", function(p1, p2, p3) -- Line: 4150
        error("Unable to assign property AbsolutePosition. Property is read only", 2)
    end)
    ChatWindowConfiguration:__addsignal("AbsolutePosition", appLayout:GetPropertyChangedSignal("AbsolutePosition"))
    ChatWindowConfiguration:__addgetter("AbsoluteSize", function(p1, p2) -- Line: 4154 -- upvalues: appLayout (upval)
        return appLayout.AbsoluteSize
    end)
    ChatWindowConfiguration:__addsetter("AbsoluteSize", function(p1, p2, p3) -- Line: 4157
        error("Unable to assign property AbsoluteSize. Property is read only", 2)
    end)
    ChatWindowConfiguration:__addsignal("AbsoluteSize", appLayout:GetPropertyChangedSignal("AbsoluteSize"))
    ChatWindowConfiguration:__addgetter("Enabled", function(p1, p2) -- Line: 4161
        return p1.__class[p2]
    end)
    ChatWindowConfiguration:__addsetter("Enabled", function(p1, p2, p3) -- Line: 4164
        p1.__class[p2] = p3
    end)
    ChatWindowConfiguration:__addsignal("Enabled")
    ChatWindowConfiguration.__class.Enabled = u275.Enabled
    ChatInputBarConfiguration:__addgetter("AbsolutePosition", function(p1, p2) -- Line: 4171 -- upvalues: chatInputBar (upval)
        return chatInputBar.AbsolutePosition
    end)
    ChatInputBarConfiguration:__addsetter("AbsolutePosition", function(p1, p2, p3) -- Line: 4174
        error("Unable to assign property AbsolutePosition. Property is read only", 2)
    end)
    ChatInputBarConfiguration:__addsignal("AbsolutePosition", chatInputBar:GetPropertyChangedSignal("AbsolutePosition"))
    ChatInputBarConfiguration:__addgetter("AbsoluteSize", function(p1, p2) -- Line: 4181 -- upvalues: chatInputBar (upval)
        return chatInputBar.AbsoluteSize
    end)
    ChatInputBarConfiguration:__addsetter("AbsoluteSize", function(p1, p2, p3) -- Line: 4184
        error("Unable to assign property AbsoluteSize. Property is read only", 2)
    end)
    ChatInputBarConfiguration:__addsignal("AbsoluteSize", chatInputBar:GetPropertyChangedSignal("AbsoluteSize"))
    ChatInputBarConfiguration:__addgetter("IsFocused", function(p1, p2) -- Line: 4188 -- upvalues: UserInputService (upval), TextBox (upval)
        local FocusedTextBox = UserInputService:GetFocusedTextBox()
        local v1 = FocusedTextBox == TextBox
        return v1
    end)
    ChatInputBarConfiguration:__addsetter("IsFocused", function(p1, p2, p3) -- Line: 4191
        error("Unable to assign property IsFocused. Property is read only", 2)
    end)
    ChatInputBarConfiguration:__addsignal("IsFocused")
    u5.Connection:AddConnection(TextBox.Focused:Connect(function(p1) -- Line: 4195 -- upvalues: TextBox (upval), BubbleChatConfiguration (upval)
        if p1 == TextBox then
            BubbleChatConfiguration.__signals.IsFocused:Fire()
        end
    end))
    u5.Connection:AddConnection(TextBox.FocusLost:Connect(function(p1) -- Line: 4200 -- upvalues: TextBox (upval), BubbleChatConfiguration (upval)
        if p1 == TextBox then
            BubbleChatConfiguration.__signals.IsFocused:Fire()
        end
    end))
    ChatInputBarConfiguration:__addgetter("TextBox", function(p1, p2) -- Line: 4205
        return p1.__class[p2]
    end)
    ChatInputBarConfiguration:__addsetter("TextBox", function(p1, p2, p3) -- Line: 4208 -- upvalues: TextBox (upval), PlayerGui (upval), u320 (upval)
        local v1
        if p3 == TextBox then
            error("Expected TextBox got TextBox for ChatInputBarConfiguration.TextBox.", 2)
            return
        end
        if typeof(p3) == "nil" then
            if typeof(p3) ~= "Instance" then
                if p1.__class[p2] ~= p3 then
                    p1.__class[p2] = p3
                    u320.UpdateTextBox()
                    return true
                end
                return false
            end
            if not (p3:IsA("TextBox")) then
                v1 = ("Expected TextBox got %* for ChatInputBarConfiguration.TextBox."):format(p3.ClassName)
                error(v1, 2)
                return
            end
            if not (p3:IsDescendantOf(PlayerGui)) then
                error("ChatInputBarConfiguration.TextBox should be a descendant of PlayerGui.", 2)
                return
            end
            if p1.__class[p2] == p3 then
                return false
            end
            p1.__class[p2] = p3
            u320.UpdateTextBox()
            return true
        elseif typeof(p3) ~= "Instance" then
            v1 = ("Unable to assign property TextBox. TextBox expected, got %*"):format((typeof(p3)))
            error(v1, 2)
            return
        end
    end)
    ChatInputBarConfiguration:__addsignal("TextBox")
    ChatInputBarConfiguration.__class.TextBox = u279.TextBox
    ChatInputBarConfiguration:__addgetter("Enabled", function(p1, p2) -- Line: 4238
        return p1.__class[p2]
    end)
    ChatInputBarConfiguration:__addsetter("Enabled", function(p1, p2, p3) -- Line: 4241
        p1.__class[p2] = p3
    end)
    ChatInputBarConfiguration:__addsignal("Enabled")
    ChatInputBarConfiguration.__class.Enabled = u279.Enabled
    ChannelTabsConfiguration:__addgetter("AbsolutePosition", function(p1, p2) -- Line: 4248 -- upvalues: chatInputBar (upval)
        return chatInputBar.AbsolutePosition
    end)
    ChannelTabsConfiguration:__addsetter("AbsolutePosition", function(p1, p2, p3) -- Line: 4251
        error("Unable to assign property AbsolutePosition. Property is read only")
    end)
    ChannelTabsConfiguration:__addsignal("AbsolutePosition", channelBar:GetPropertyChangedSignal("AbsolutePosition"))
    ChannelTabsConfiguration:__addgetter("AbsoluteSize", function(p1, p2) -- Line: 4258 -- upvalues: chatInputBar (upval)
        return chatInputBar.AbsoluteSize
    end)
    ChannelTabsConfiguration:__addsetter("AbsoluteSize", function(p1, p2, p3) -- Line: 4261
        error("Unable to assign property AbsoluteSize. Property is read only")
    end)
    ChannelTabsConfiguration:__addsignal("AbsoluteSize", channelBar:GetPropertyChangedSignal("AbsoluteSize"))
    ChannelTabsConfiguration:__addgetter("Enabled", function(p1, p2) -- Line: 4265
        return p1.__class[p2]
    end)
    ChannelTabsConfiguration:__addsetter("Enabled", function(p1, p2, p3) -- Line: 4268
        p1.__class[p2] = p3
    end)
    ChannelTabsConfiguration:__addsignal("Enabled")
    ChannelTabsConfiguration.__class.Enabled = u283.Enabled
    u275.Enabled = false
    u279.Enabled = false
    u283.Enabled = false
    ExperienceChat.Enabled = false
    ExperienceChat.Parent = PlayerGui
    u320.TextChannel.Instances[u320.RBXAll] = u320.TextChannel.new(u320.RBXAll)
    u5.Connection:AddConnection(u320.DeepPipe(TextChatService, u320.TextChannel, function() -- Line: 4283 -- upvalues: u320 (upval)
        u320.SetTextChannels()
        u320.UpdateChannelTabs()
    end))
    u5.Connection:AddConnection(u320.DeepPipe(TextChatService, u320.TextChatCommand))
    u5.Connection:AddConnection(Root.SendingMessage:Connect(function(p1) -- Line: 4290 -- upvalues: u5 (val)
        u5:RegisterTextChatMessage(p1)
    end))
    u5.Connection:AddConnection(Root.MessageReceived:Connect(function(p1) -- Line: 4293 -- upvalues: u5 (val)
        u5:RegisterTextChatMessage(p1)
    end))
    task.spawn(u320.BackgroundFadeTransparency.Add, u320.BackgroundFadeTransparency, {
        chatWindow,
        chatInputBar,
        appLayout.topBorder,
        appLayout.bottomBorder,
        appLayout.topPadding,
        chatInputBar.Background,
        TextBox,
        RCTScrollContentView,
        TargetChannelChip,
        chatInputBar.Background.Container.SendButton.SendIcon,
        channelBar.HorizontalBar.Background,
        channelBar.HorizontalBar.BottomBorder,
        channelBar.HorizontalBar.TopCorner,
        channelBar.DropdownButton.TextButton,
        channelBar.DropdownButton.TextButton.DropdownIconImage,
        channelBar.DropdownButton.UnreadDot,
    })
    u5.Connection:AddConnection(u320.BackgroundFadeTransparency.TransparencyChanged:Connect(function(p1) -- Line: 4318 -- upvalues: TextBox (upval), u320 (upval), Border (upval), Border_2 (upval)
        local v1
        if TextBox.Text == "" then
            v1 = 0.5
        else
            v1 = 0
        end
        TextBox.TextTransparency = u320.TransparencyMask(v1, p1)
        Border.Transparency = u320.TransparencyMask(0.8, p1)
        Border_2.Transparency = p1
    end))
    local Connection_8 = u5.Connection
    v1 = u320.StyleBind.new(ChatInputBarConfiguration, "BackgroundColor3", ExperienceChat, "Enabled")
    v1 = v1:Add(AutocompleteDropdown.ScrollBarFrame, "BackgroundColor3")
    Connection_8:AddConnection(v1:Add(chatInputBar.Background, "BackgroundColor3"))
    local Connection_9 = u5.Connection
    v1 = u320.StyleBind.new(ChatInputBarConfiguration, "BackgroundTransparency", ExperienceChat, "Enabled")
    Connection_9:AddConnection(v1:Add(chatInputBar.Background, "Transparency"))
    local Connection_10 = u5.Connection
    v1 = u320.StyleBind.new(ChatInputBarConfiguration, "TextColor3", ExperienceChat, "Enabled")
    Connection_10:AddConnection(v1:Add(TextBox, "TextColor3"))
    local Connection_11 = u5.Connection
    v1 = u320.StyleBind.new(ChatInputBarConfiguration, "PlaceholderColor3", ExperienceChat, "Enabled")
    Connection_11:AddConnection(v1:Add(TextBox, "PlaceholderColor3"))
    local Connection_12 = u5.Connection
    v1 = u320.StyleBind.new(ChatInputBarConfiguration, "FontFace", ExperienceChat, "Enabled")
    Connection_12:AddConnection(v1:Add(TextBox, "FontFace"))
    local Connection_13 = u5.Connection
    v1 = u320.StyleBind.new(ChatInputBarConfiguration, "TextSize", ExperienceChat, "Enabled")
    Connection_13:AddConnection(v1:Add(TextBox, "TextSize"))
    local Connection_14 = u5.Connection
    v1 = u320.StyleBind.new(ChatInputBarConfiguration, "TextStrokeTransparency", ExperienceChat, "Enabled")
    Connection_14:AddConnection(v1:Add(TextBox, "TextStrokeTransparency"))
    u5.Connection:AddConnection(u320.PropertyBind.new(ChatInputBarConfiguration, {"KeyboardKeyCode"}, ExperienceChat, "Enabled", function() -- Line: 4369 -- upvalues: u5 (val)
        u5:UpdateTextBoxPlaceholder()
    end))
    local Connection_16 = u5.Connection
    v1 = u320.StyleBind.new(ChannelTabsConfiguration, "BackgroundColor3", ExperienceChat, "Enabled")
    v1 = v1:Add(channelBar.HorizontalBar.Background, "BackgroundColor3")
    Connection_16:AddConnection(v1:Add(channelBar.HorizontalBar.TopCorner, "ImageColor3"))
    local Connection_17 = u5.Connection
    v1 = u320.StyleBind.new(ChannelTabsConfiguration, "BackgroundTransparency", ExperienceChat, "Enabled")
    v1 = v1:Add(channelBar.HorizontalBar.Background, "BackgroundTransparency")
    Connection_17:AddConnection(v1:Add(channelBar.HorizontalBar.TopCorner, "ImageTransparency"))
    local Connection_18 = u5.Connection
    v1 = u320.StyleBind.new(ChatWindowConfiguration, "BackgroundColor3", ExperienceChat, "Enabled")
    v1 = v1:Add(chatInputBar, "BackgroundColor3")
    v1 = v1:Add(chatWindow, "BackgroundColor3")
    v1 = v1:Add(appLayout.topPadding, "BackgroundColor3")
    v1 = v1:Add(appLayout.bottomBorder, "ImageColor3")
    Connection_18:AddConnection(v1:Add(appLayout.topBorder, "ImageColor3"))
    local Connection_19 = u5.Connection
    v1 = u320.StyleBind.new(ChatWindowConfiguration, "BackgroundTransparency", ExperienceChat, "Enabled")
    v1 = v1:Add(chatInputBar, "Transparency")
    v1 = v1:Add(chatWindow, "Transparency")
    v1 = v1:Add(appLayout.topPadding, "Transparency")
    v1 = v1:Add(appLayout.bottomBorder, "ImageTransparency")
    Connection_19:AddConnection(v1:Add(appLayout.topBorder, "ImageTransparency"))
    u5.Connection:AddConnection(u320.PropertyBind.new(ChatWindowConfiguration, {"WidthScale", "HeightScale"}, ExperienceChat, "Enabled", function() -- Line: 4413 -- upvalues: appLayout (upval), ChatWindowConfiguration (upval)
        appLayout.Size = UDim2.fromScale(0.4 * ChatWindowConfiguration.WidthScale, 0.25 * ChatWindowConfiguration.HeightScale)
    end))
    appLayout.Size = UDim2.fromScale(0.4 * ChatWindowConfiguration.WidthScale, 0.25 * ChatWindowConfiguration.HeightScale)
    u5.Connection:AddConnection(u320.PropertyBind.new(ChatWindowConfiguration, {"VerticalAlignment", "HorizontalAlignment"}, ExperienceChat, "Enabled", function() -- Line: 4431 -- upvalues: u5 (val)
        u5:BoundsChanged()
    end))
    u5.Connection:AddConnection(u320.PropertyBind.new(appLayout.layout, {"AbsoluteContentSize"}, ExperienceChat, "Enabled", function() -- Line: 4437 -- upvalues: u5 (val), u320 (upval)
        u5:BoundsChanged()
        u320.UpdateChannelTabs()
    end))
    task.spawn(u5.BoundsChanged, u5)
    u5.Connection:AddConnection(u320.PropertyBind.new(ChatWindowConfiguration, {"Enabled"}, ExperienceChat, "Enabled", function() -- Line: 4446 -- upvalues: chatWindow (upval), ChatWindowConfiguration (upval)
        chatWindow.Visible = ChatWindowConfiguration.Enabled
    end))
    task.spawn(function() -- Line: 4450 -- upvalues: chatWindow (upval), ChatWindowConfiguration (upval)
        chatWindow.Visible = ChatWindowConfiguration.Enabled
    end)
    u5.Connection:AddConnection(u320.PropertyBind.new(ChatInputBarConfiguration, {"Enabled"}, ExperienceChat, "Enabled", function() -- Line: 4454 -- upvalues: chatInputBar (upval), ChatInputBarConfiguration (upval), u320 (upval)
        local Enabled = ChatInputBarConfiguration.Enabled
        if Enabled then
            Enabled = ChatInputBarConfiguration.TextBox == nil
        end
        chatInputBar.Visible = Enabled
        u320.UpdateTextBox()
    end))
    task.spawn(function() -- Line: 4460 -- upvalues: chatInputBar (upval), ChatInputBarConfiguration (upval), u320 (upval)
        local Enabled = ChatInputBarConfiguration.Enabled
        if Enabled then
            Enabled = ChatInputBarConfiguration.TextBox == nil
        end
        chatInputBar.Visible = Enabled
        u320.UpdateTextBox()
    end)
    u5.Connection:AddConnection(u320.PropertyBind.new(ChatInputBarConfiguration, {"TextBox"}, ExperienceChat, "Enabled", function() -- Line: 4465 -- upvalues: chatInputBar (upval), ChatInputBarConfiguration (upval)
        local Enabled = ChatInputBarConfiguration.Enabled
        if Enabled then
            Enabled = ChatInputBarConfiguration.TextBox == nil
        end
        chatInputBar.Visible = Enabled
    end))
    task.spawn(function() -- Line: 4470 -- upvalues: chatInputBar (upval), ChatInputBarConfiguration (upval)
        local Enabled = ChatInputBarConfiguration.Enabled
        if Enabled then
            Enabled = ChatInputBarConfiguration.TextBox == nil
        end
        chatInputBar.Visible = Enabled
    end)
    u5.Connection:AddConnection(u320.PropertyBind.new(ChannelTabsConfiguration, {"Enabled"}, ExperienceChat, "Enabled", function() -- Line: 4474 -- upvalues: channelBar (upval), ChannelTabsConfiguration (upval), appLayout (upval)
        channelBar.Visible = ChannelTabsConfiguration.Enabled
        appLayout.topPadding.Visible = ChannelTabsConfiguration.Enabled
        appLayout.topBorder.Visible = not ChannelTabsConfiguration.Enabled
    end))
    task.spawn(function() -- Line: 4480 -- upvalues: channelBar (upval), ChannelTabsConfiguration (upval), appLayout (upval)
        channelBar.Visible = ChannelTabsConfiguration.Enabled
        appLayout.topPadding.Visible = ChannelTabsConfiguration.Enabled
        appLayout.topBorder.Visible = not ChannelTabsConfiguration.Enabled
    end)
    u5.Connection:AddConnection(u320.PropertyBind.new(ChannelTabsConfiguration, {"Enabled"}, ExperienceChat, "Enabled", function() -- Line: 4486 -- upvalues: u320 (upval), u5 (val)
        u320.UpdateTextChatMessages()
        u5:UpdateTextBoxChip()
    end))
    u5.Connection:AddConnection(Event:Connect(function() -- Line: 4493 -- upvalues: u320 (upval), ExperienceChat (upval), u5 (val)
        local v1 = u320.GetChatActive()
        if v1 then
            v1 = u320.GetChatCoreGuiEnabled()
        end
        ExperienceChat.Enabled = v1
        u320.UpdateTextBox()
        u5:RegisterActivity()
    end))
    task.spawn(function() -- Line: 4499 -- upvalues: u320 (upval), ExperienceChat (upval)
        local v1 = u320.GetChatActive()
        if v1 then
            v1 = u320.GetChatCoreGuiEnabled()
        end
        ExperienceChat.Enabled = v1
        u320.UpdateTextBox()
    end)
    u5.Connection:AddConnection(u320.PropertyBind.new(TextBox, {"Text"}, ExperienceChat, "Enabled", function() -- Line: 4507 -- upvalues: u5 (val)
        u5:TextBoxTextChanged()
    end))
    u5.Connection:AddConnection(u320.PropertyBind.new(ChatInputBarConfiguration, {"AutocompleteEnabled"}, nil, nil, function() -- Line: 4512 -- upvalues: u5 (val)
        u5:UpdateAutoComplete()
    end))
    u5.Connection:AddConnection(TextBox.Focused:Connect(function() -- Line: 4516 -- upvalues: u5 (val)
        u5:FocusChanged()
        u5:RegisterActivity()
    end))
    u5.Connection:AddConnection(TextBox.FocusLost:Connect(function(p1) -- Line: 4520 -- upvalues: u5 (val)
        u5:FocusChanged(p1)
        u5:RegisterActivity()
    end))
    u5.Connection:AddConnection(UserInputService.TextBoxFocused:Connect(function() -- Line: 4524 -- upvalues: u5 (val)
        u5:FocusChanged()
    end))
    u5.Connection:AddConnection(UserInputService.TextBoxFocusReleased:Connect(function() -- Line: 4527 -- upvalues: u5 (val)
        u5:FocusChanged()
    end))
    task.spawn(u5.FocusChanged, u5)
    u5.Connection:AddConnection(UserInputService.InputBegan:Connect(function(p1) -- Line: 4531 -- upvalues: u5 (val)
        u5:HandleInput(p1)
    end))
    u5.Connection:AddConnection(chatInputBar.Background.Container.SendButton.Activated:Connect(function() -- Line: 4534 -- upvalues: u5 (val)
        u5:SendChatInputBarTextBox()
    end))
    task.spawn(u5.RegisterActivity, u5)
    task.spawn(function() -- Line: 4540 -- upvalues: appLayout (upval), u5 (val)
        for k, v in pairs(appLayout:GetChildren()) do
            if v:IsA("GuiObject") then
                u5.Connection:AddConnection(v.MouseEnter:Connect(function() -- Line: 4543 -- upvalues: u5 (upval)
                    u5:RegisterActivity()
                end))
                u5.Connection:AddConnection(v.MouseLeave:Connect(function() -- Line: 4546 -- upvalues: u5 (upval)
                    u5:RegisterActivity()
                end))
            end
        end
    end)
    u5.Connection:AddConnection(RCTScrollContentView.ChildAdded:Connect(function(p1) -- Line: 4554 -- upvalues: u5 (val)
        u5:CotentViewChildChanged(p1)
    end))
    u5.Connection:AddConnection(RCTScrollContentView.ChildRemoved:Connect(function(p1) -- Line: 4557 -- upvalues: u5 (val)
        u5:CotentViewChildChanged(p1)
    end))
    u5.Connection:AddConnection(chatWindow.MouseEnter:Connect(function() -- Line: 4560 -- upvalues: RCTScrollContentView (upval)
        RCTScrollContentView.Parent.ScrollBarImageTransparency = 0
    end))
    u5.Connection:AddConnection(chatWindow.MouseLeave:Connect(function() -- Line: 4563 -- upvalues: RCTScrollContentView (upval)
        RCTScrollContentView.Parent.ScrollBarImageTransparency = 1
    end))
    u5.Connection:AddConnection(u320.PropertyBind.new(ChatInputBarConfiguration, {"TargetTextChannel"}, nil, nil, function() -- Line: 4569 -- upvalues: u5 (val), u320 (upval), RCTScrollContentView (upval)
        u5:TargetTextChannelChanged()
        u320.UpdateTextChatMessages()
        u320.UpdateChannelTabs()
        local Parent = RCTScrollContentView.Parent
        Parent.CanvasPosition = Vector2.new(Parent.CanvasPosition.X, Parent.AbsoluteCanvasSize.Y - Parent.AbsoluteWindowSize.Y)
    end))
    task.spawn(u5.TargetTextChannelChanged, u5)
    u5.Connection:AddConnection(TargetChannelChip.Activated:Connect(function() -- Line: 4581 -- upvalues: ChannelTabsConfiguration (upval), u320 (upval), ChatInputBarConfiguration (upval), u5 (val)
        if not ChannelTabsConfiguration.Enabled then
            if u320.IsWhisper(ChatInputBarConfiguration.TargetTextChannel) then
                ChatInputBarConfiguration.TargetTextChannel = u5.LastNonWhisper
            elseif u320.IsTeam(ChatInputBarConfiguration.TargetTextChannel) then
                ChatInputBarConfiguration.TargetTextChannel = u5.LastNonWhisper
            end
        end
    end))
    u5.Connection:AddConnection(channelBar.DropdownButton.TextButton.Activated:Connect(function() -- Line: 4592 -- upvalues: channelBar (upval)
        channelBar.DropdownMenu.Visible = not channelBar.DropdownMenu.Visible
    end))
    u5.Connection:AddConnection(channelBar.DropdownButton.TextButton.MouseEnter:Connect(function() -- Line: 4595 -- upvalues: channelBar (upval)
        channelBar.DropdownButton.TextButton.BackgroundTransparency = 0.3
    end))
    u5.Connection:AddConnection(channelBar.DropdownButton.TextButton.MouseLeave:Connect(function() -- Line: 4598 -- upvalues: channelBar (upval)
        channelBar.DropdownButton.TextButton.BackgroundTransparency = 1
    end))
    task.spawn(u5.PopulateAutoComplete, u5)
    return u5
end
u320.BubbleChat = {__type = "bubbleChat"}
function u320.BubbleChat:CleanUp() -- Line: 4609
    self.Connection:Disconnect()
end
function u320.BubbleChat.RegisterTextChatMessage(p1, p2, p3) -- Line: 4612 -- upvalues: u320 (val)
    if u320.BubbleChatContainer.Instances[p2] == nil then
        u320.BubbleChatContainer.new(p2)
    end
    u320.BubbleChatContainer.Instances[p2]:AddMessage(p3)
end
function u320.BubbleChat.new() -- Line: 4618 -- upvalues: u320 (val), BubbleChatConfiguration (val), u287 (val), BubbleChat (val), PlayerGui (val), HttpService (val), Alive (val), Players (val), Effects (val), Player (val)
    local v1 = {}
    local u5 = setmetatable(v1, {__index = u320.BubbleChat})
    u5.Connection = u320.MultiConnection.new()
    BubbleChatConfiguration:__addsetter("MaxBubbles", function(p1, p2, p3) -- Line: 4623
        p1.__class[p2] = p3
    end)
    BubbleChatConfiguration:__addgetter("MaxBubbles", function(p1, p2) -- Line: 4626
        return p1.__class[p2]
    end)
    BubbleChatConfiguration.__class.MaxBubbles = u287.MaxBubbles
    BubbleChatConfiguration:__addsignal("MaxBubbles")
    BubbleChatConfiguration:__addsetter("Enabled", function(p1, p2, p3) -- Line: 4631
        p1.__class[p2] = p3
    end)
    BubbleChatConfiguration:__addgetter("Enabled", function(p1, p2) -- Line: 4634
        return p1.__class[p2]
    end)
    BubbleChatConfiguration:__addsignal("Enabled")
    BubbleChatConfiguration.__class.Enabled = u287.Enabled
    u287.Enabled = false
    u287.MaxBubbles = 0
    BubbleChat.Enabled = true
    BubbleChat.Parent = PlayerGui
    Player.Chat.listen(function(p1, p2) -- Line: 4647 -- upvalues: HttpService (upval), u320 (upval), Alive (upval), Players (upval), Effects (upval), u5 (val)
        local u6 = HttpService:GenerateGUID(false)
        local function createPsuedoTextChatMessage() -- Line: 4653 -- upvalues: p2 (val), u6 (val), u320 (upval), p1 (val)
            local UserId
            local v1 = {
                Metadata = "",
                Translation = "",
                BubbleChatMessageProperties = {
                    BackgroundTransparency = 0.1,
                    TailVisible = true,
                    TextSize = 16,
                    BackgroundColor3 = Color3.fromRGB(250, 250, 250),
                    FontFace = Font.new("rbxassetid://16658221428", Enum.FontWeight.Medium, Enum.FontStyle.Normal),
                    TextColor3 = Color3.fromRGB(57, 59, 61),
                    Text = p2,
                },
                MessageId = u6,
                Status = Enum.TextChatMessageStatus.Sending,
                Text = p2,
                TextChannel = u320.RBXAll,
            }
            local v2 = {CanSend = true}
            if not (p1:IsA("Player")) then
                UserId = 0
            else
                UserId = p1.UserId
            end
            v2.UserId = UserId
            v1.TextSource = v2
            v1.Timestamp = DateTime.now()
            return v1
        end
        if not (p1:IsA("Player")) then
            if p1:IsA("BasePart") then
                u5:RegisterTextChatMessage(p1, createPsuedoTextChatMessage())
            end
            return
        end
        local v1 = Alive.getAliveCharacter(p1)
        if v1 == nil then
            return
        end
        local Head = v1:WaitForChild("Head", 1)
        if Head == nil then
            return
        end
        local Character = Players.LocalPlayer.Character
        if not Character then
            return
        end
        local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart", 1)
        if not HumanoidRootPart then
            return
        end
        local v2 = string.find(p2, "<b>[T]</b>", 1, true) ~= nil
        if (Head.Position - HumanoidRootPart.Position).Magnitude < 300 and p2 and not v2 then
            Effects.emitClientEffect("Speaking", Head, p2)
        end
        u5:RegisterTextChatMessage(Head, createPsuedoTextChatMessage())
    end)
    return u5
end
u320.TextChatService = {__type = "textChatService"}
function u320.TextChatService:CleanUp() -- Line: 4728
    self.Connection:Disconnect()
end
function u320.TextChatService:VisibilityChanged() -- Line: 4731 -- upvalues: u320 (val), BindableEvent_3 (val), BindableEvent_5 (val), BindableEvent_2 (val), BindableEvent_4 (val)
    local v1 = u320.GetChatActive()
    local v2 = u320.GetChatCoreGuiEnabled()
    local v3 = v1 and v2
    if u320.ChatActive ~= v1 then
        u320.ChatActive = v1
        BindableEvent_3:Fire()
    end
    if u320.CoreGuiEnabled ~= v2 then
        u320.CoreGuiEnabled = v2
        BindableEvent_5:Fire()
    end
    BindableEvent_2:Fire(v3)
    if v3 then
        BindableEvent_4:Fire(-1)
    end
    if self.db < 2 then
        self.db = self.db + 1
        return
    end
    self.db = 0
    u320.SetChatCoreGuiEnabled(not v2)
    u320.SetChatCoreGuiEnabled(v2)
end
function u320.TextChatService.new() -- Line: 4755 -- upvalues: u320 (val), ContentProvider (val), u0 (val), LogService (val), Event (val), u212 (val), Assets (val), PlayerGui (val), u275 (val), u287 (val), BubbleChatConfiguration (val), u279 (val), u283 (val)
    local u5 = setmetatable({}, {__index = u320.TextChatService})
    u5.Connection = u320.MultiConnection.new()
    task.spawn(ContentProvider.PreloadAsync, ContentProvider, u0:GetDescendants())
    LogService.MessageOut:Connect(function(p1, p2) -- Line: 4763
        if p2 ~= Enum.MessageType.MessageError then
            return
        end
        if string.find(p1, "attempt to perform arithmetic %(unm%) on") ~= nil then
            error("If the error above concerns OpenTextChatService, ensure that you are applying the unary resolve opperator (-) to a virtual class and not another type.\nhttps://devforum.roblox.com/t/3605944", 2)
            return
        end
        if string.find(p1, "Instance expected, got table") ~= nil then
            error("If the error above concerns OpenTextChatService, ensure that you use the unary resolve opperator (-) to resolve virtual classes into real instances.\nhttps://devforum.roblox.com/t/3605944", 2)
        end
    end)
    u5.db = 2
    u5.Connection:AddConnection(Event:Connect(function() -- Line: 4781 -- upvalues: u5 (val)
        u5:VisibilityChanged()
    end))
    task.spawn(u5.VisibilityChanged, u5)
    task.spawn(function() -- Line: 4786 -- upvalues: u320 (upval)
        u320.SetCoreGuiChatConnections()
        task.wait(3)
        if not (u320.CoreGuiChatConnectionsOwnership()) then
            error("CoreGuiChatConnections cannot be set while using OpenTextChatService.\nhttps://devforum.roblox.com/t/3605944", 2)
        end
    end)
    if u212 then
        Assets.Demo.Overlay.Parent = PlayerGui
        u320.SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false)
        u275.HorizontalAlignment = Enum.HorizontalAlignment.Right
        u287.LocalPlayerStudsOffset = Vector3.new(2, 0, 0)
        u287.MaxBubbles = BubbleChatConfiguration.MaxBubbles
        u287.Enabled = true
        u279.Enabled = true
        u275.Enabled = true
        u283.Enabled = true
    end
    return u5
end
function u320.InitializeOpenChat() -- Line: 4814 -- upvalues: u585 (val), u320 (val)
    if u585.OpenBubbleChatEnabled then
        u320.BubbleChat.new()
    end
    if u585.OpenTextChatEnabled then
        u320.ExperienceChat.new()
    end
    u320.TextChatService.new()
end
u320.InitializeOpenChat()
return Root