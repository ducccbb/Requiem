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
--       File: ReplicatedStorage.Common.Effects.Types.Miscellaneous.HideAtmosphere
--                              Dumped in 0.000156 seconds
--                          Bytecode version 9  |  2 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Lighting = game:GetService("Lighting")
local Atmosphere = Lighting:FindFirstChildWhichIsA("Atmosphere")
return function(p1) -- Line: 14 -- upvalues: Atmosphere (val), Lighting (val)
    if p1.state then
        Atmosphere.Parent = Lighting
        workspace:SetAttribute("Atmosphere", true)
        return
    end
    Atmosphere.Parent = nil
    workspace:SetAttribute("Atmosphere", false)
end