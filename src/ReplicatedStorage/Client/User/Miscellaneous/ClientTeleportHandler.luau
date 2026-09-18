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
--        File: ReplicatedStorage.Client.User.Miscellaneous.ClientTeleportHandler
--                              Dumped in 0.000409 seconds
--                          Bytecode version 9  |  3 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Utilities = Common:WaitForChild("Utilities")
local Character = require(Utilities:WaitForChild("Character"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Network = Common_2:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Player = require(Namespaces:WaitForChild("Player"))
local State = v1.Parent.Parent:WaitForChild("State")
local ClientStateHandler = require(State:WaitForChild("ClientStateHandler"))
local States = ClientStateHandler.States
local Editor = v1.Parent.Parent:WaitForChild("Editor")
local Universal = Editor:WaitForChild("Universal")
local UserFreecamHandler = require(Universal:WaitForChild("UserFreecamHandler"))
local function onTeleportPlayerToCFrame(p1) -- Line: 22 -- upvalues: Character (val), ClientStateHandler (val), States (val), UserFreecamHandler (val)
    local v1
    _, v1 = Character.getCharacterAsync():await()
    if ClientStateHandler.isStateBusy(States.FREECAM) then
        local v2 = CFrame.new(p1.Position + p1.LookVector * 5, p1.Position)
        UserFreecamHandler.onTeleportCamera:Fire(v2)
        return
    end
    local v3 = p1 * CFrame.new(0, 0.5, -4.5)
    local v4 = math.rad(180)
    v1.HumanoidRootPart.CFrame = v3 * CFrame.Angles(0, v4, 0)
end
Player.Teleport.listen(onTeleportPlayerToCFrame)
return {
    onTeleportClient = function(p1) -- Line: 38 -- upvalues: onTeleportPlayerToCFrame (val)
        local v1
        if typeof(p1) ~= "Vector3" then
            v1 = p1
        else
            v1 = CFrame.new(p1)
        end
        onTeleportPlayerToCFrame(v1)
    end,
}