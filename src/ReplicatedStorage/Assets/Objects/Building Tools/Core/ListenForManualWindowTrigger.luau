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
--File: ReplicatedStorage.Assets.Objects.Building Tools.Core.ListenForManualWindowTrigger
--                              Dumped in 0.000408 seconds
--                          Bytecode version 9  |  5 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
v1 = script:FindFirstAncestorWhichIsA("Tool")
local Core = require(v1.Core)
local UI = v1:WaitForChild("UI")
local Vendor = v1:WaitForChild("Vendor")
local Roact = require(Vendor:WaitForChild("Roact"))
local ToolManualWindow = require(UI:WaitForChild("ToolManualWindow"))
return function(p1, p2, p3) -- Line: 17 -- upvalues: Roact (val), ToolManualWindow (val), Core (val)
    local HelpButton = p3:WaitForChild("HelpButton")
    local u7 = false
    local u8 = nil
    local function BeginHover() -- Line: 23 -- upvalues: u7 (ref), HelpButton (val)
        if not u7 then
            HelpButton.TextTransparency = 0
            local Background = HelpButton:WaitForChild("Background")
            Background.BackgroundTransparency = 0
        end
    end
    local function EndHover() -- Line: 30 -- upvalues: u7 (ref), HelpButton (val)
        if not u7 then
            HelpButton.TextTransparency = 0.5
            local Background = HelpButton:WaitForChild("Background")
            Background.BackgroundTransparency = 0.75
        end
    end
    local function ToggleManual() -- Line: 37 -- upvalues: HelpButton (val), u7 (ref), EndHover (val), u8 (ref), Roact (upval), BeginHover (val), ToolManualWindow (upval), p1 (val), p2 (val), Core (upval)
        local v1
        if not u7 then
            v1 = 0.5
        else
            v1 = 0
        end
        HelpButton.TextTransparency = v1
        local Background = HelpButton:WaitForChild("Background")
        if not u7 then
            v1 = 0.75
        else
            v1 = 0
        end
        Background.BackgroundTransparency = v1
        if u7 then
            EndHover()
            u7 = false
            u8 = Roact.unmount(u8)
            return
        end
        BeginHover()
        u7 = true
        local v2 = Roact.createElement(ToolManualWindow, {Text = p1, ThemeColor = p2})
        u8 = Roact.mount(v2, Core.UI, "ToolManualWindow")
    end
    p3.Activated:Connect(ToggleManual)
    HelpButton.Activated:Connect(ToggleManual)
    p3.InputBegan:Connect(BeginHover)
    p3.InputEnded:Connect(EndHover)
    HelpButton.InputBegan:Connect(BeginHover)
    HelpButton.InputEnded:Connect(EndHover)
end