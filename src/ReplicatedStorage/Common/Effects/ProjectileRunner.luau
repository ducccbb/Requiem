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
--                File: ReplicatedStorage.Common.Effects.ProjectileRunner
--                               Dumped in 0.00144 seconds
--                          Bytecode version 9  |  7 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local function getRootPart(p1) -- Line: 37
    local Root = p1:FindFirstChild("Root")
    if not Root then
        Root = p1.PrimaryPart
        if not Root then
            Root = p1:FindFirstChildWhichIsA("BasePart")
        end
    end
    return Root
end
local u23 = {}
local u24 = nil
local function tickAll(p1) -- Line: 72 -- upvalues: u23 (val), Workspace (val), u24 (ref)
    local currentPos, v1, v2, v3, v4
    local v5 = 1
    local v6 = p1
    while v5 <= #u23 do
        v1 = u23[v5]
        if not v1.stopped then
            v1.elapsed = v1.elapsed + v6
            currentPos = v1.currentPos
            v1.currentPos = v1.currentPos + v1.currentVel * v1.timeStep
            v1.currentVel = v1.currentVel + v1.gravity * v1.timeStep
            if not v1.updateFrame then
                v2 = CFrame.new(v1.currentPos)
            else
                v2 = v1.updateFrame(v1.currentPos, v1.currentVel)
            end
            v1.rootPart.CFrame = v2
            v3 = false
            if v1.minTimeBeforeCollision <= v1.elapsed then
                v4 = Workspace:Spherecast(currentPos, v1.sphereRadius, (v1.currentPos - currentPos) * v1.directionScale, v1.raycastParams)
                if v4 and v1.onHit(v4.Position, v4.Instance, v1.currentVel.Unit, v1.model, v4) then
                    v3 = true
                end
            end
            if not v3 and v1.endPos and (v1.currentPos - v1.endPos).Magnitude < v1.endPosDistance then
                v3 = true
                if v1.onReachedEnd then
                    v1.onReachedEnd()
                end
            end
            if not v3 and v1.maxTime <= v1.elapsed then
                v3 = true
                if v1.onTimeout then
                    v1.onTimeout()
                end
            end
            if not v3 then
                v5 = v5 + 1
            else
                v1.stopped = true
                table.remove(u23, v5)
            end
        else
            table.remove(u23, v5)
        end
    end
    if #u23 == 0 and u24 then
        u24:Disconnect()
        u24 = nil
    end
end
return {
    run = function(p1, p2, p3, p4, p5, p6, p7, p8, p9) -- Line: 142 -- upvalues: getRootPart (val), Workspace (val), u23 (val), u24 (ref), RunService (val), tickAll (val)
        local v1 = getRootPart(p1)
        if not v1 then
            warn("[ProjectileRunner] No root part found in model:", p1:GetFullName())
            return function() end
        end
        if not p1.Parent then
            p1.Parent = Workspace
        end
        local sphereRadius = p3.sphereRadius
        local timeStep = p3.timeStep
        local maxTime = p3.maxTime
        local v2 = p3.minTimeBeforeCollision or 0
        local v3 = p3.directionScale or 1
        local endPos = p3.endPos
        local v4 = p3.endPosDistance or 0.1
        local v5 = RaycastParams.new()
        v5.FilterType = Enum.RaycastFilterType.Exclude
        local v6 = {p1}
        if p5 then
            table.insert(v6, p5)
        end
        if p4 then
            local v7 = p4
            local v8 = nil
            local v9 = nil
            for i, j in v7, v8, v9 do
                table.insert(v6, j)
            end
        end
        v5.FilterDescendantsInstances = v6
        local u65 = {
            elapsed = 0,
            stopped = false,
            model = p1,
            rootPart = v1,
            sphereRadius = sphereRadius,
            timeStep = timeStep,
            maxTime = maxTime,
            minTimeBeforeCollision = v2,
            directionScale = v3,
            endPos = endPos,
            endPosDistance = v4,
            currentPos = p2,
        }
        local velocity = p3.velocity
        if not velocity then
            velocity = Vector3.zero
        end
        u65.currentVel = velocity
        local gravity = p3.gravity
        if not gravity then
            gravity = Vector3.new(0, -Workspace.Gravity, 0)
        end
        u65.gravity = gravity
        u65.raycastParams = v5
        u65.onHit = p6
        u65.onTimeout = p7
        u65.onReachedEnd = p8
        u65.updateFrame = p9
        table.insert(u23, u65)
        if not u24 then
            u24 = RunService.Heartbeat:Connect(tickAll)
        end
        local function stop() -- Line: 210 -- upvalues: u65 (val)
            if u65.stopped then
                return
            end
            u65.stopped = true
        end
        task.delay(maxTime + 1, function() -- Line: 217 -- upvalues: u65 (val), stop (val), p7 (val)
            if u65.stopped then
                return
            end
            stop()
            if p7 then
                p7()
            end
        end)
        return stop
    end,
    getRootPart = getRootPart,
}