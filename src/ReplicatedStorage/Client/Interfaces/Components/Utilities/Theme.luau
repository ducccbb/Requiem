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
--         File: ReplicatedStorage.Client.Interfaces.Components.Utilities.Theme
--                               Dumped in 0.00202 seconds
--                          Bytecode version 9  |  11 functions

local deepCopy, flattenTheme
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local u12 = {
    Requiem = {
        PageTransparency = 0.25,
        Primary = Color3.fromRGB(255, 255, 255),
        Secondary = Color3.fromRGB(20, 23, 27),
        Accent = Color3.fromRGB(170, 170, 170),
        Background = Color3.fromRGB(5, 4, 5),
        BackgroundSecondary = Color3.fromRGB(5, 4, 5),
        PageBackground = Color3.fromRGB(0, 0, 0),
        Stroke = Color3.fromRGB(67, 71, 84),
        Bar = Color3.fromRGB(160, 160, 160),
        SideBar = {
            Button = {BackgroundSelected = Color3.fromRGB(21, 21, 21), BackgroundHover = Color3.fromRGB(15, 15, 15)},
        },
        Text = {Primary = Color3.fromRGB(255, 255, 255), Secondary = Color3.fromRGB(160, 160, 160)},
        Divider = {Primary = Color3.fromRGB(255, 255, 255)},
        Container = {Background = Color3.fromRGB(11, 11, 11), Stroke = Color3.fromRGB(20, 20, 20)},
        Input = {Background = Color3.fromRGB(7, 7, 7)},
    },
    Charcoal = {
        PageTransparency = 0.2,
        Primary = Color3.fromRGB(255, 255, 255),
        Secondary = Color3.fromRGB(30, 32, 36),
        Accent = Color3.fromRGB(165, 165, 168),
        Background = Color3.fromRGB(16, 16, 18),
        BackgroundSecondary = Color3.fromRGB(20, 20, 22),
        PageBackground = Color3.fromRGB(14, 14, 16),
        Stroke = Color3.fromRGB(72, 75, 88),
        Bar = Color3.fromRGB(160, 160, 160),
        SideBar = {
            Button = {BackgroundSelected = Color3.fromRGB(34, 34, 36), BackgroundHover = Color3.fromRGB(28, 28, 30)},
        },
        Text = {Primary = Color3.fromRGB(255, 255, 255), Secondary = Color3.fromRGB(160, 160, 160)},
        Divider = {Primary = Color3.fromRGB(55, 55, 58)},
        Container = {Background = Color3.fromRGB(24, 24, 26), Stroke = Color3.fromRGB(36, 36, 38)},
        Input = {Background = Color3.fromRGB(20, 20, 22)},
    },
    Midnight = {
        PageTransparency = 0.35,
        Primary = Color3.fromRGB(225, 232, 245),
        Secondary = Color3.fromRGB(12, 18, 36),
        Accent = Color3.fromRGB(65, 95, 150),
        Background = Color3.fromRGB(4, 6, 14),
        BackgroundSecondary = Color3.fromRGB(6, 9, 20),
        PageBackground = Color3.fromRGB(2, 4, 12),
        Stroke = Color3.fromRGB(28, 40, 68),
        Bar = Color3.fromRGB(55, 75, 115),
        SideBar = {
            Button = {BackgroundSelected = Color3.fromRGB(14, 20, 40), BackgroundHover = Color3.fromRGB(10, 14, 32)},
        },
        Text = {Primary = Color3.fromRGB(220, 228, 245), Secondary = Color3.fromRGB(95, 115, 150)},
        Divider = {Primary = Color3.fromRGB(20, 30, 52)},
        Container = {Background = Color3.fromRGB(7, 10, 24), Stroke = Color3.fromRGB(18, 26, 48)},
        Input = {Background = Color3.fromRGB(3, 5, 14)},
    },
    Stationary = {
        PageTransparency = 0.35,
        Primary = Color3.fromRGB(245, 235, 235),
        Secondary = Color3.fromRGB(32, 14, 16),
        Accent = Color3.fromRGB(165, 55, 60),
        Background = Color3.fromRGB(10, 4, 5),
        BackgroundSecondary = Color3.fromRGB(14, 6, 7),
        PageBackground = Color3.fromRGB(6, 2, 3),
        Stroke = Color3.fromRGB(72, 38, 42),
        Bar = Color3.fromRGB(120, 60, 65),
        SideBar = {
            Button = {BackgroundSelected = Color3.fromRGB(32, 14, 16), BackgroundHover = Color3.fromRGB(24, 10, 12)},
        },
        Text = {Primary = Color3.fromRGB(240, 230, 230), Secondary = Color3.fromRGB(155, 115, 118)},
        Divider = {Primary = Color3.fromRGB(45, 22, 26)},
        Container = {Background = Color3.fromRGB(14, 6, 8), Stroke = Color3.fromRGB(38, 18, 22)},
        Input = {Background = Color3.fromRGB(8, 3, 4)},
    },
    Freedom = {
        PageTransparency = 0.05,
        Primary = Color3.fromRGB(35, 35, 42),
        Secondary = Color3.fromRGB(45, 45, 52),
        Accent = Color3.fromRGB(130, 130, 140),
        Background = Color3.fromRGB(245, 245, 247),
        BackgroundSecondary = Color3.fromRGB(235, 235, 240),
        PageBackground = Color3.fromRGB(255, 255, 255),
        Stroke = Color3.fromRGB(200, 200, 210),
        Bar = Color3.fromRGB(175, 175, 185),
        SideBar = {
            Button = {BackgroundSelected = Color3.fromRGB(225, 225, 232), BackgroundHover = Color3.fromRGB(238, 238, 243)},
        },
        Text = {Primary = Color3.fromRGB(30, 30, 36), Secondary = Color3.fromRGB(110, 110, 120)},
        Divider = {Primary = Color3.fromRGB(225, 225, 232)},
        Container = {Background = Color3.fromRGB(250, 250, 252), Stroke = Color3.fromRGB(215, 215, 225)},
        Input = {Background = Color3.fromRGB(240, 240, 245)},
    },
    Slate = {
        PageTransparency = 0.3,
        Primary = Color3.fromRGB(230, 234, 240),
        Secondary = Color3.fromRGB(38, 44, 54),
        Accent = Color3.fromRGB(95, 115, 140),
        Background = Color3.fromRGB(22, 26, 32),
        BackgroundSecondary = Color3.fromRGB(28, 32, 40),
        PageBackground = Color3.fromRGB(18, 21, 27),
        Stroke = Color3.fromRGB(55, 62, 75),
        Bar = Color3.fromRGB(100, 110, 125),
        SideBar = {
            Button = {BackgroundSelected = Color3.fromRGB(36, 42, 52), BackgroundHover = Color3.fromRGB(30, 35, 44)},
        },
        Text = {Primary = Color3.fromRGB(225, 230, 238), Secondary = Color3.fromRGB(130, 140, 155)},
        Divider = {Primary = Color3.fromRGB(42, 48, 58)},
        Container = {Background = Color3.fromRGB(26, 30, 38), Stroke = Color3.fromRGB(48, 54, 66)},
        Input = {Background = Color3.fromRGB(20, 24, 30)},
    },
    Moss = {
        PageTransparency = 0.35,
        Primary = Color3.fromRGB(230, 240, 232),
        Secondary = Color3.fromRGB(14, 28, 18),
        Accent = Color3.fromRGB(70, 120, 85),
        Background = Color3.fromRGB(6, 12, 8),
        BackgroundSecondary = Color3.fromRGB(9, 16, 11),
        PageBackground = Color3.fromRGB(4, 8, 5),
        Stroke = Color3.fromRGB(32, 58, 40),
        Bar = Color3.fromRGB(60, 95, 72),
        SideBar = {
            Button = {BackgroundSelected = Color3.fromRGB(16, 28, 20), BackgroundHover = Color3.fromRGB(12, 22, 15)},
        },
        Text = {Primary = Color3.fromRGB(225, 238, 228), Secondary = Color3.fromRGB(100, 130, 108)},
        Divider = {Primary = Color3.fromRGB(24, 42, 30)},
        Container = {Background = Color3.fromRGB(10, 18, 12), Stroke = Color3.fromRGB(22, 40, 28)},
        Input = {Background = Color3.fromRGB(6, 10, 7)},
    },
}
local u622 = {
    "Requiem",
    "Charcoal",
    "Midnight",
    "Stationary",
    "Freedom",
    "Slate",
    "Moss",
}
local u630 = {}
local function isThemeValue(p1) -- Line: 319
    local v1 = if typeof(p1) ~= "Color3" then type(p1) == "number" else true
    return v1
end
function deepCopy(p1) -- Line: 323 -- upvalues: deepCopy (val)
    if type(p1) ~= "table" then
        return p1
    end
    local v1 = {}
    local v2 = p1
    local v3 = nil
    local v4 = nil
    for i, j in v2, v3, v4 do
        v1[i] = deepCopy(j)
    end
    return v1
end
local function setAtPath(p1, p2, p3) -- Line: 336
    local v1, v2
    local v3 = string.split(p2, ".")
    local v4 = p1
    local v5 = #v3 - 1
    local v6 = 1
    for i = 1, v5, v6 do
        v2 = v3[i]
        if type(v4[v2]) ~= "table" then
            v4[v2] = {}
        end
        v4 = v4[v2]
    end
    v4[v3[#v3]] = v1
end
function flattenTheme(p1, p2, p3) -- Line: 352 -- upvalues: isThemeValue (val), flattenTheme (val)
    local v1
    local v2 = p3 or ""
    local v3 = p1
    local v4 = nil
    local v5 = nil
    for i, j in v3, v4, v5 do
        if v2 ~= "" then
            v1 = ("%*.%*"):format(v2, i)
        else
            v1 = i
        end
        if isThemeValue(j) then
            v6[v1] = j
        elseif type(j) == "table" then
            flattenTheme(j, v6, v1)
        end
    end
end
;(function() -- Line: 366 -- upvalues: u630 (val), flattenTheme (val), u12 (val)
    table.clear(u630)
    local v1 = {}
    flattenTheme(u12.Requiem, v1)
    local v2 = v1
    local v3 = nil
    local v4 = nil
    for i in v2, v3, v4 do
        u630[i] = true
    end
end)()
local function getTheme(p1) -- Line: 385 -- upvalues: u12 (val)
    return u12[p1 or "Requiem"]
end
return {
    MAX_WIDTH = 1600,
    SIDE_PADDING = 220,
    RIGHT_PADDING = 80,
    Requiem = u12.Requiem,
    Charcoal = u12.Charcoal,
    Midnight = u12.Midnight,
    Stationary = u12.Stationary,
    Freedom = u12.Freedom,
    Slate = u12.Slate,
    Moss = u12.Moss,
    getTheme = getTheme,
    resolve = function(p1, p2) -- Line: 433 -- upvalues: deepCopy (val), getTheme (val), isThemeValue (val), u630 (val), setAtPath (val)
        local v1 = deepCopy(getTheme(p1))
        if not p2 then
            return v1
        end
        local v2 = p2
        local v3 = nil
        local v4 = nil
        for i, j in v2, v3, v4 do
            if isThemeValue(j) and u630[i] then
                if not (string.find(i, ".", 1, true)) then
                    v1[i] = j
                else
                    setAtPath(v1, i, j)
                end
            end
        end
        return v1
    end,
    getStoryControls = function(p1, p2) -- Line: 394 -- upvalues: flattenTheme (val), getTheme (val)
        local v1 = {}
        local v2 = getTheme(p1)
        flattenTheme(v2, v1)
        if p2 then
            local v3 = p2
            v2 = nil
            local v4 = nil
            for i, j in v3, v2, v4 do
                v1[i] = j
            end
        end
        return v1
    end,
    getThemeChooseControl = function(p1) -- Line: 412 -- upvalues: u622 (val)
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local Packages = ReplicatedStorage:WaitForChild("Packages")
        local v1 = require(Packages:WaitForChild("ui-labs"))
        local v2 = 1
        local v3 = u622
        local v4 = nil
        local v5 = nil
        for i, j in v3, v4, v5 do
            if j == p1 or "Requiem" then
                v2 = i
                break
            end
        end
        return v1.Choose(u622, v2)
    end,
    getContentLayout = function(p1) -- Line: 462
        local v1 = p1(220)
        local v2 = p1(80)
        return {centerOffsetX = (v1 - v2) / 2, widthOffset = -(v1 + v2)}
    end,
    THEME_NAMES = u622,
}