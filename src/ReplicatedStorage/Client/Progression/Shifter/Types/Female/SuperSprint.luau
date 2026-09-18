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
--      File: ReplicatedStorage.Client.Progression.Shifter.Types.Female.SuperSprint
--                              Dumped in 0.000442 seconds
--                          Bytecode version 9  |  4 functions

local u72
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Observers = Common:WaitForChild("Observers")
local useAnimatorObserver = require(Observers:WaitForChild("useAnimatorObserver"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Types = Common_2:WaitForChild("Types")
require(Types:WaitForChild("Shifter"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Statistics = Common_3:WaitForChild("Statistics")
_, u72 = require(Statistics:WaitForChild("useWalkSpeed"))()
local u73 = {}
local function cleanUpSuperSprint(p1, p2) -- Line: 30
    if p2 then
        p2()
    end
    if p1 then
        p1(TweenInfo.new(0.3))
    end
end
return {
    onAbilityRequested = function(p1) -- Line: 45 -- upvalues: u73 (val), cleanUpSuperSprint (val), u72 (val), useAnimatorObserver (val)
        local Animator, Humanoid, v1, v2
        if p1.state.superSprint then
            v1 = u72("super_sprint", p1.runSpeed + 35, "set", 10)
            Humanoid = p1.model:WaitForChild("Humanoid")
            Animator = Humanoid:WaitForChild("Animator")
            v2 = useAnimatorObserver.bind(Animator, {Sprint = p1.animations.SuperSprint}, 4, p1.easing or 0.75, true)
            u73[p1.owner] = {remove = v1, unbindSuperSprint = v2}
            return
        end
        if u73[p1.owner] then
            cleanUpSuperSprint(u73[p1.owner].remove, u73[p1.owner].unbindSuperSprint)
            return
        end
        v1 = u72("super_sprint", p1.runSpeed + 35, "set", 10)
        Humanoid = p1.model:WaitForChild("Humanoid")
        Animator = Humanoid:WaitForChild("Animator")
        v2 = useAnimatorObserver.bind(Animator, {Sprint = p1.animations.SuperSprint}, 4, p1.easing or 0.75, true)
        u73[p1.owner] = {remove = v1, unbindSuperSprint = v2}
    end,
    onAbilityReplicated = function(p1) end,
}