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
--    File: ReplicatedStorage.Client.Interfaces.Routes.Debug.Providers.DebugProvider
--                              Dumped in 0.000604 seconds
--                          Bytecode version 9  |  5 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local u29 = react.createContext(nil)
local u32 = react.createContext(nil)
local u35 = react.createContext(nil)
local u36 = {
    rows = {a = Color3.fromRGB(21, 21, 21), b = Color3.fromRGB(27, 27, 27)},
    chrome = {
        panelSurface = Color3.fromRGB(15, 15, 15),
        panelStroke = Color3.fromRGB(52, 52, 52),
        scrollThumb = Color3.fromRGB(92, 92, 92),
        headerSurface = Color3.fromRGB(22, 22, 22),
        searchSurface = Color3.fromRGB(22, 25, 30),
        searchStrokeFocused = Color3.fromRGB(132, 132, 132),
        searchStrokeHover = Color3.fromRGB(138, 145, 158),
        searchStrokeIdle = Color3.fromRGB(52, 56, 64),
    },
    text = {
        muted = Color3.fromRGB(160, 160, 160),
        body = Color3.fromRGB(206, 214, 228),
        headerTitle = Color3.fromRGB(206, 214, 228),
        sourceMuted = Color3.fromRGB(168, 178, 198),
        searchPlaceholder = Color3.fromRGB(115, 115, 122),
        searchInput = Color3.fromRGB(200, 202, 210),
    },
    accents = {
        attributeBlue = Color3.fromRGB(28, 176, 255),
        statusActive = Color3.fromRGB(120, 220, 150),
        statusIdle = Color3.fromRGB(160, 160, 160),
        categoryBlocking = Color3.fromRGB(255, 214, 120),
        configConstantKey = Color3.fromRGB(192, 160, 255),
    },
    logs = {channelServer = Color3.fromRGB(100, 220, 120), channelClient = Color3.fromRGB(88, 176, 255)},
    enchantments = {
        rarity = {
            Common = Color3.fromRGB(170, 170, 170),
            Uncommon = Color3.fromRGB(120, 220, 140),
            Rare = Color3.fromRGB(90, 170, 255),
            Epic = Color3.fromRGB(188, 120, 255),
            Legendary = Color3.fromRGB(255, 186, 84),
            Mythic = Color3.fromRGB(255, 110, 110),
            Unique = Color3.fromRGB(255, 120, 210),
        },
        addButtonOutline = Color3.fromRGB(115, 200, 135),
        addButtonText = Color3.fromRGB(170, 245, 188),
        removeButtonOutline = Color3.fromRGB(220, 120, 120),
        removeButtonText = Color3.fromRGB(245, 170, 170),
    },
}
local v2 = {}
function v2.DebugProvider(p1) -- Line: 138 -- upvalues: react (val), u36 (val), u29 (val), u32 (val), u35 (val)
    local u10, u4, u5, u9
    u4, u5 = react.useState(false)
    u9, u10 = react.useState({})
    local v1 = react.useMemo(function() -- Line: 144 -- upvalues: u5 (val), u4 (val)
        return {setEnabled = u5, enabled = u4}
    end, {u4})
    local v2 = react.useMemo(function() -- Line: 151 -- upvalues: u10 (val), u9 (val)
        return {setPages = u10, pages = u9}
    end, {u9})
    local v3 = react.useMemo(function() -- Line: 157 -- upvalues: u36 (upval)
        return {theme = u36}
    end, {})
    return react.createElement(u29.Provider, {value = v1}, {PagesProvider = react.createElement(u32.Provider, {value = v2}, {ThemeProvider = react.createElement(u35.Provider, {value = v3}, p1.children)})})
end
v2.DefaultTheme = u36
v2.EnabledContext = u29
v2.PagesContext = u32
v2.ThemeContext = u35
return v2