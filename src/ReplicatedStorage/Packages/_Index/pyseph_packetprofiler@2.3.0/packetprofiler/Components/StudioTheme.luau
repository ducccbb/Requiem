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
--File: ReplicatedStorage.Packages._Index.pyseph_packetprofiler@2.3.0.packetprofiler.Components.StudioTheme
--                              Dumped in 0.000248 seconds
--                          Bytecode version 9  |  6 functions

local Parent = script.Parent.Parent
local Packages = require(Parent.Modules.Packages)
local Roact = require(Packages.Directory.Roact)
local StudioSettings = require(Parent.Components.StudioSettings)
local u19 = Roact.Component:extend("StudioThemeProvider")
function u19.init(p1) -- Line: 11 -- upvalues: StudioSettings (val)
    p1:setState({CurrentTheme = StudioSettings.Theme})
    p1.StudioThemeChanged = StudioSettings.ThemeChanged:Connect(function() -- Line: 15 -- upvalues: p1 (val), StudioSettings (upval)
        p1:setState({CurrentTheme = StudioSettings.Theme})
    end)
end
function u19.render(p1) -- Line: 22 -- upvalues: Roact (val)
    return Roact.oneChild(p1.props[Roact.Children])(p1.state.CurrentTheme)
end
function u19.willUnmount(p1) -- Line: 27
    p1.StudioThemeChanged:Disconnect()
end
return function(p1) -- Line: 31 -- upvalues: Roact (val), u19 (val)
    return Roact.createElement(u19, {}, {Component = p1})
end