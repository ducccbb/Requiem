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
--File: ReplicatedStorage.Packages._Index.pyseph_packetprofiler@2.3.0.packetprofiler.Components.StudioSettings
--                              Dumped in 0.000622 seconds
--                          Bytecode version 9  |  3 functions

local Packages = require(script.Parent.Parent.Modules.Packages)
local Signal = require(Packages.Directory.Signal)
if Packages.IsPlugin then
    local Studio = settings():GetService("Studio")
    return {
        Theme = {
            GetColor = function(p1, p2) -- Line: 11 -- upvalues: Studio (val)
                for k, v in pairs(Enum.StudioStyleGuideColor:GetEnumItems()) do
                    if v.Name == p2 then
                        return Studio.Theme:GetColor(v)
                    end
                end
                error(tostring(p2) .. "is not a valid member of \"Enum.StudioStyleGuideColor\"")
            end,
        },
        ThemeChanged = Studio.ThemeChanged,
    }
end
local u22 = {
    MainBackground = Color3.fromHex("#2e2e2e"),
    Titlebar = Color3.fromHex("#353535"),
    Dropdown = Color3.fromHex("#2e2e2e"),
    Tooltip = Color3.fromHex("#353535"),
    Notification = Color3.fromHex("#2e2e2e"),
    ScrollBar = Color3.fromHex("#383838"),
    ScrollBarBackground = Color3.fromHex("#292929"),
    TabBar = Color3.fromHex("#2e2e2e"),
    Tab = Color3.fromHex("#353535"),
    FilterButtonDefault = Color3.fromHex("#2e2e2e"),
    FilterButtonHover = Color3.fromHex("#252525"),
    FilterButtonChecked = Color3.fromHex("#1c1c1c"),
    FilterButtonAccent = Color3.fromHex("#353535"),
    FilterButtonBorder = Color3.fromHex("#2e2e2e"),
    FilterButtonBorderAlt = Color3.fromHex("#353535"),
    RibbonTab = Color3.fromHex("#353535"),
    RibbonTabTopBar = Color3.fromHex("#35b5ff"),
    Button = Color3.fromHex("#3c3c3c"),
    MainButton = Color3.fromHex("#00a2ff"),
    RibbonButton = Color3.fromHex("#2e2e2e"),
    ViewPortBackground = Color3.fromHex("#252525"),
    InputFieldBackground = Color3.fromHex("#252525"),
    Item = Color3.fromHex("#2e2e2e"),
    TableItem = Color3.fromHex("#2a2a2a"),
    CategoryItem = Color3.fromHex("#353535"),
    GameSettingsTableItem = Color3.fromHex("#2a2a2a"),
    GameSettingsTooltip = Color3.fromHex("#353535"),
    EmulatorBar = Color3.fromHex("#2e2e2e"),
    EmulatorDropDown = Color3.fromHex("#2e2e2e"),
    ColorPickerFrame = Color3.fromHex("#2e2e2e"),
    CurrentMarker = Color3.fromHex("#424242"),
    Border = Color3.fromHex("#222222"),
    DropShadow = Color3.fromHex("#000000"),
    Shadow = Color3.fromHex("#404040"),
    Light = Color3.fromHex("#404040"),
    Dark = Color3.fromHex("#222222"),
    Mid = Color3.fromHex("#222222"),
    MainText = Color3.fromHex("#cccccc"),
    SubText = Color3.fromHex("#aaaaaa"),
    TitlebarText = Color3.fromHex("#aaaaaa"),
    BrightText = Color3.fromHex("#e5e5e5"),
    DimmedText = Color3.fromHex("#666666"),
    LinkText = Color3.fromHex("#35b5ff"),
    WarningText = Color3.fromHex("#ff8e3c"),
    ErrorText = Color3.fromHex("#ff4444"),
    InfoText = Color3.fromHex("#80d7ff"),
    SensitiveText = Color3.fromHex("#d15dff"),
    ScriptSideWidget = Color3.fromHex("#252525"),
    ScriptBackground = Color3.fromHex("#27292d"),
    ScriptText = Color3.fromHex("#abd4ff"),
    ScriptSelectionText = Color3.fromHex("#d9e5ff"),
    ScriptSelectionBackground = Color3.fromHex("#30343c"),
    ScriptFindSelectionBackground = Color3.fromHex("#8d7600"),
    ScriptMatchingWordSelectionBackground = Color3.fromHex("#555555"),
    ScriptOperator = Color3.fromHex("#c678dd"),
    ScriptNumber = Color3.fromHex("#61afef"),
    ScriptString = Color3.fromHex("#98c379"),
    ScriptComment = Color3.fromHex("#5c6370"),
    ScriptKeyword = Color3.fromHex("#c678dd"),
    ScriptBuiltInFunction = Color3.fromHex("#61afef"),
    ScriptWarning = Color3.fromHex("#cd9731"),
    ScriptError = Color3.fromHex("#f44747"),
    ScriptWhitespace = Color3.fromHex("#555555"),
    ScriptRuler = Color3.fromHex("#666666"),
    DocViewCodeBackground = Color3.fromHex("#424242"),
    DebuggerCurrentLine = Color3.fromHex("#2a3c4c"),
    DebuggerErrorLine = Color3.fromHex("#b267e6"),
    ScriptEditorCurrentLine = Color3.fromHex("#2d3241"),
    DiffFilePathText = Color3.fromHex("#aaaaaa"),
    DiffTextHunkInfo = Color3.fromHex("#aaaaaa"),
    DiffTextNoChange = Color3.fromHex("#cccccc"),
    DiffTextAddition = Color3.fromHex("#cccccc"),
    DiffTextDeletion = Color3.fromHex("#cccccc"),
    DiffTextSeparatorBackground = Color3.fromHex("#313949"),
    DiffTextNoChangeBackground = Color3.fromHex("#1b1f20"),
    DiffTextAdditionBackground = Color3.fromHex("#303f2c"),
    DiffTextDeletionBackground = Color3.fromHex("#481e18"),
    DiffLineNum = Color3.fromHex("#aaaaaa"),
    DiffLineNumSeparatorBackground = Color3.fromHex("#3c537b"),
    DiffLineNumNoChangeBackground = Color3.fromHex("#1b2023"),
    DiffLineNumAdditionBackground = Color3.fromHex("#374d31"),
    DiffLineNumDeletionBackground = Color3.fromHex("#5b221b"),
    DiffFilePathBackground = Color3.fromHex("#353535"),
    DiffFilePathBorder = Color3.fromHex("#222222"),
    ChatIncomingBgColor = Color3.fromHex("#eaeaea"),
    ChatIncomingTextColor = Color3.fromHex("#393b3d"),
    ChatOutgoingBgColor = Color3.fromHex("#424242"),
    ChatOutgoingTextColor = Color3.fromHex("#cccccc"),
    ChatModeratedMessageColor = Color3.fromHex("#ff4444"),
    Separator = Color3.fromHex("#222222"),
    ButtonBorder = Color3.fromHex("#353535"),
    ButtonText = Color3.fromHex("#cccccc"),
    InputFieldBorder = Color3.fromHex("#1a1a1a"),
    CheckedFieldBackground = Color3.fromHex("#252525"),
    CheckedFieldBorder = Color3.fromHex("#1a1a1a"),
    CheckedFieldIndicator = Color3.fromHex("#35b5ff"),
    HeaderSection = Color3.fromHex("#353535"),
    Midlight = Color3.fromHex("#222222"),
    StatusBar = Color3.fromHex("#2e2e2e"),
    DialogButton = Color3.fromHex("#3c3c3c"),
    DialogButtonText = Color3.fromHex("#cccccc"),
    DialogButtonBorder = Color3.fromHex("#3c3c3c"),
    DialogMainButton = Color3.fromHex("#00a2ff"),
    DialogMainButtonText = Color3.fromHex("#ffffff"),
    InfoBarWarningBackground = Color3.fromHex("#fdfbac"),
    InfoBarWarningText = Color3.fromHex("#000000"),
    ScriptMethod = Color3.fromHex("#6abaff"),
    ScriptProperty = Color3.fromHex("#c1e1de"),
    ScriptNil = Color3.fromHex("#d19a66"),
    ScriptBool = Color3.fromHex("#d19a66"),
    ScriptFunction = Color3.fromHex("#c678dd"),
    ScriptLocal = Color3.fromHex("#f86d7c"),
    ScriptSelf = Color3.fromHex("#f86d7c"),
    ScriptLuauKeyword = Color3.fromHex("#c678dd"),
    ScriptFunctionName = Color3.fromHex("#8cd1ff"),
    ScriptTodo = Color3.fromHex("#666666"),
    ScriptBracket = Color3.fromHex("#ffd700"),
    AttributeCog = Color3.fromHex("#aaaaaa"),
}
return {
    Theme = {
        GetColor = function(p1, p2) -- Line: 154 -- upvalues: u22 (val)
            return u22[p2]
        end,
    },
    ThemeChanged = Signal.new(),
}