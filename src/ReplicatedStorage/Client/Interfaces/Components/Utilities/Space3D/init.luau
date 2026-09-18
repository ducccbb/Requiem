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
--        File: ReplicatedStorage.Client.Interfaces.Components.Utilities.Space3D
--                              Dumped in 0.000186 seconds
--                          Bytecode version 9  |  1 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local Component = require(v1.Component)
local Provider = require(v1.Provider)
local Screen = require(v1.Screen)
local Surface = require(v1.Surface)
local v3 = {
    Component = Component,
    Screen = Screen,
    Surface = Surface,
    Provider = Provider.Provider,
    Context = Provider.Context,
}
local Routes = v1.Parent.Parent.Parent:WaitForChild("Routes")
local Pages = Routes:WaitForChild("Pages")
local Enchantment = Pages:WaitForChild("Enchantment")
v3.Pack = require(Enchantment:WaitForChild("Pack"))
return v3