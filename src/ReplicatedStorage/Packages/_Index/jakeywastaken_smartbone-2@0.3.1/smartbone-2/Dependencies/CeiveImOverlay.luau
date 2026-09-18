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
--File: ReplicatedStorage.Packages._Index.jakeywastaken_smartbone-2@0.3.1.smartbone-2.Dependencies.CeiveImOverlay
--                               Dumped in 0.00115 seconds
--                          Bytecode version 9  |  10 functions

local GuiService = game:GetService("GuiService")
local u7 = Font.new("rbxasset://fonts/families/PressStart2P.json")
local u8 = {}
u8.__index = u8
function u8.new(p1, p2, p3) -- Line: 22 -- upvalues: GuiService (val), u8 (val)
    local v1, v2
    if p3 ~= nil then
        v1 = p3
    else
        v1 = true
    end
    local v3 = v1
    v1 = UDim2.fromOffset(25, 5 + GuiService:GetGuiInset().Y)
    local v4 = UDim2.new(1, -25, 1, -5)
    local v5 = UDim2.fromOffset(0, 0)
    local v6 = UDim2.fromScale(1, 1)
    local v7 = setmetatable({}, u8)
    v7.DefaultY = p1 or 5
    v7.TextSize = p2 or 11
    v7.BackFrame = Instance.new("Frame")
    local BackFrame = v7.BackFrame
    if not v3 then
        v2 = v5
    else
        v2 = v1
    end
    BackFrame.Position = v2
    local BackFrame_2 = v7.BackFrame
    if not v3 then
        v2 = v6
    else
        v2 = v4
        if not v2 then
            v2 = v6
        end
    end
    BackFrame_2.Size = v2
    v7.BackFrame.Name = "BackFrame"
    v7.BackFrame.Transparency = 1
    v7.ListLayout = Instance.new("UIListLayout")
    v7.ListLayout.Padding = UDim.new(0, 2)
    v7.ListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    v7.ListLayout.Parent = v7.BackFrame
    v7.m_Indent = 0
    v7.DidUpdate = false
    v7.m_State = ""
    v7.m_PreviousState = ""
    v7.m_RenderGroup = {}
    v7.m_ItemPool = {}
    return v7
end
function u8.Begin(p1, p2, p3, p4) -- Line: 64
    if not p2 or type(p2) ~= "string" then
        warn("Expected text to ImOverlay::Begin", debug.traceback())
        return
    end
    if not p3 then
        if p4 then
            if typeof(p4) ~= "Color3" then
                warn("TextColor should be a Color3", debug.traceback())
                return
            end
            p1:Text(p2, p3, p4)
            p1.m_Indent = p1.m_Indent + 1
            return
        end
        p1:Text(p2, p3, p4)
        p1.m_Indent = p1.m_Indent + 1
        return
    end
    if typeof(p3) ~= "Color3" then
        warn("BackgroundColor should be a Color3", debug.traceback())
        return
    end
    if not p4 then
        p1:Text(p2, p3, p4)
        p1.m_Indent = p1.m_Indent + 1
        return
    end
    if typeof(p4) ~= "Color3" then
        warn("TextColor should be a Color3", debug.traceback())
        return
    end
    p1:Text(p2, p3, p4)
    p1.m_Indent = p1.m_Indent + 1
end
function u8.End(p1) -- Line: 84
    local v1 = p1.m_Indent - 1
    if v1 < 0 then
        error("Too many callbacks to ImOverlay::End")
        return
    end
    p1.m_Indent = p1.m_Indent - 1
end
function u8:Text(p2, p3, p4) -- Line: 93
    if not p2 then
        warn("Expected text to ImOverlay::Text", debug.traceback())
        return
    else
        if type(p2) ~= "string" then
            warn("Expected text to ImOverlay::Text", debug.traceback())
            return
        end
        if not p3 then
            if not p4 then
                local v1 = p3
                if not v1 then
                    v1 = Color3.new()
                end
                local v2 = v1
                v1 = p4
                if not v1 then
                    v1 = Color3.new(1, 1, 1)
                end
                local v3 = v1
                table.insert(self.m_RenderGroup, {Text = p2, TextColor = v3, BackgroundColor = v2, Indent = self.m_Indent})
                self.m_State = self.m_State .. ("%*|%*|%*|%*"):format(p2, v3, v2, self.m_Indent)
                return
            elseif typeof(p4) ~= "Color3" then
                warn("TextColor should be a Color3", debug.traceback())
                return
            end
        elseif typeof(p3) ~= "Color3" then
            warn("BackgroundColor should be a Color3", debug.traceback())
            return
        end
    end
end
function u8:m_Pool() -- Line: 122
    debug.profilebegin("ImOverlay::m_Pool")
    for i, j in self.BackFrame:GetChildren() do
        if not (j:IsA("UIListLayout")) and j.Visible then
            j.Visible = false
            table.insert(self.m_ItemPool, j)
        end
    end
    debug.profileend()
end
function u8:m_Cleanup() -- Line: 137
    debug.profilebegin("ImOverlay::m_Cleanup")
    self.m_State = ""
    self.m_Indent = 0
    self.m_RenderGroup = {}
    debug.profileend()
end
function u8:m_CreateLabel(p2, p3, p4, p5) -- Line: 145 -- upvalues: u7 (val)
    debug.profilebegin("ImOverlay::m_CreateLabel")
    local Frame = Instance.new("Frame")
    Frame.Name = "Background"
    Frame.AutomaticSize = Enum.AutomaticSize.XY
    Frame.BackgroundColor3 = p4
    Frame.BackgroundTransparency = 0.4
    Frame.BorderSizePixel = 0
    local TextLabel = Instance.new("TextLabel")
    TextLabel.Name = "TaskText"
    TextLabel.FontFace = u7
    TextLabel.Text = p2
    TextLabel.TextColor3 = p3
    TextLabel.TextSize = self.TextSize
    TextLabel.TextXAlignment = Enum.TextXAlignment.Left
    TextLabel.AutomaticSize = Enum.AutomaticSize.XY
    TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.BackgroundTransparency = 1
    TextLabel.Position = UDim2.fromOffset(p5 * 50, 0)
    TextLabel.Size = UDim2.fromOffset(0, self.DefaultY)
    TextLabel.Parent = Frame
    local UIPadding = Instance.new("UIPadding")
    UIPadding.Name = "UIPadding"
    UIPadding.PaddingBottom = UDim.new(0, 2)
    UIPadding.Parent = TextLabel
    local UIPadding_2 = Instance.new("UIPadding")
    UIPadding_2.Name = "UIPadding"
    UIPadding_2.PaddingRight = UDim.new(0, 5)
    UIPadding_2.PaddingLeft = UDim.new(0, 5)
    UIPadding_2.Parent = Frame
    debug.profileend()
    return Frame
end
function u8.Render(p1) -- Line: 182
    local TaskText, v1
    debug.profilebegin("ImOverlay::Render")
    if p1.m_State == "" then
        p1:m_Pool()
        p1:m_Cleanup()
        p1.DidUpdate = false
        debug.profileend()
        return
    end
    p1.m_State = p1.m_State .. ("%*|%*"):format(p1.DefaultY, p1.TextSize)
    if p1.m_State == p1.m_PreviousState then
        p1:m_Cleanup()
        p1.DidUpdate = false
        debug.profileend()
        return
    end
    p1:m_Pool()
    p1.m_PreviousState = p1.m_State
    p1.DidUpdate = true
    local m_RenderGroup = p1.m_RenderGroup
    local v2 = nil
    local v3 = nil
    for i, j in m_RenderGroup, v2, v3 do
        debug.profilebegin("Render Item")
        if #p1.m_ItemPool ~= 0 then
            debug.profilebegin("Edit Label")
            v1 = table.remove(p1.m_ItemPool, #p1.m_ItemPool)
            TaskText = v1.TaskText
            v1.LayoutOrder = i
            v1.BackgroundColor3 = j.BackgroundColor
            TaskText.Text = j.Text
            TaskText.TextColor3 = j.TextColor
            TaskText.Position = UDim2.fromOffset(50 * j.Indent, 0)
            v1.Visible = true
            v1.Parent = p1.BackFrame
            debug.profileend()
            debug.profileend()
        else
            v1 = p1:m_CreateLabel(j.Text, j.TextColor, j.BackgroundColor, j.Indent)
            v1.LayoutOrder = i
            v1.Parent = p1.BackFrame
            debug.profileend()
        end
    end
    p1:m_Cleanup()
    debug.profileend()
end
function u8:Destroy() -- Line: 239
    self.BackFrame:Destroy()
    setmetatable(self, nil)
end
return u8