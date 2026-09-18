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
--        File: ReplicatedStorage.Client.User.Editor.Builder.UserBuildingHandler
--                               Dumped in 0.00164 seconds
--                          Bytecode version 9  |  13 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Building = require(Namespaces:WaitForChild("Building"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_2:WaitForChild("Common")
local Signals = require(Common_2:WaitForChild("Signals"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_3:WaitForChild("Common")
local Utilities = Common_3:WaitForChild("Utilities")
local Table = require(Utilities:WaitForChild("Table"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_4:WaitForChild("Packages")
local trove = require(Packages:WaitForChild("trove"))
local ReplicatedStorage_5 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_5:WaitForChild("Common")
local Chunk = Common_4:WaitForChild("Chunk")
local Zone = require(Chunk:WaitForChild("Zone"))
local State = v1.Parent.Parent.Parent:WaitForChild("State")
local ClientSettingsHandler = require(State:WaitForChild("ClientSettingsHandler"))
local State_2 = v1.Parent.Parent.Parent:WaitForChild("State")
local ClientStateHandler = require(State_2:WaitForChild("ClientStateHandler"))
local States = ClientStateHandler.States
local u145 = {}
local Tools = v1.Parent:WaitForChild("Tools")
u145.Stamp = require(Tools:WaitForChild("Stamp"))
local Tools_2 = v1.Parent:WaitForChild("Tools")
u145.Mouse = require(Tools_2:WaitForChild("Mouse"))
local Tools_3 = v1.Parent:WaitForChild("Tools")
u145.Select = require(Tools_3:WaitForChild("Select"))
local Tools_4 = v1.Parent:WaitForChild("Tools")
u145.Move = require(Tools_4:WaitForChild("Move"))
local Tools_5 = v1.Parent:WaitForChild("Tools")
u145.Rotate = require(Tools_5:WaitForChild("Rotate"))
local Tools_6 = v1.Parent:WaitForChild("Tools")
u145.AddPlot = require(Tools_6:WaitForChild("AddPlot"))
local Tools_7 = v1.Parent:WaitForChild("Tools")
u145.RemovePlot = require(Tools_7:WaitForChild("RemovePlot"))
local u223 = false
local u224 = false
local u225 = false
local u226 = 0
local u227 = ""
local u228 = "Mouse"
local u230 = trove.new()
local u232 = trove.new()
local u233 = nil
local u234 = {}
local function onBuildingStepped(p1) -- Line: 71 -- upvalues: u227 (ref), u228 (ref), Signals (val), u145 (val), u223 (ref), u234 (ref)
    local v1 = u227
    if v1 then
        local v2 = string.sub(u227, -1) == "*"
        v1 = not v2
    end
    if not v1 then
        if not v1 and u228 == "Stamp" then
            Signals.Editor.Building.UpdateTool:Fire("Mouse")
        end
    elseif u228 ~= "Stamp" then
        Signals.Editor.Building.UpdateTool:Fire("Stamp")
        u145.Select.onResetTool()
    end
    if u145[u228] and u145[u228].onToolStepped then
        u145[u228].onToolStepped(p1, u223, u234)
    end
end
local function onRefreshToolTrove() -- Line: 95 -- upvalues: u233 (ref), u145 (val), u228 (ref), u227 (ref), u223 (ref), u234 (ref)
    if u233 then
        u233:Clean()
        u233 = nil
    end
    if u145[u228] and u145[u228].onToolSelected then
        u233 = u145[u228].onToolSelected(u227, u223, u234)
    end
end
local function onRefreshAccessPlots() -- Line: 230 -- upvalues: u232 (val), Players (val), Zone (val), HttpService (val), Table (val), ClientSettingsHandler (val), u224 (ref), ClientStateHandler (val), States (val), Signals (val), Building (val), u234 (ref)
    local v1, v2
    u232:Clean()
    local u123 = {}
    local v3 = {}
    local UserId = Players.LocalPlayer.UserId
    local v4 = Zone.getZoneRegionFolder()
    for i, j in v4:GetChildren() do
        if j:IsA("BasePart") then
            v1 = HttpService:JSONDecode(j:GetAttribute("zone"))
            if v1 then
                if v1.owner == UserId then
                    table.insert(v3, (Zone.getZoneFromPosition(j.Position)))
                elseif not (table.find(v1.access, UserId)) then
                end
            end
        end
    end
    for k, n in v4:GetChildren() do
        if n:IsA("BasePart") then
            v1 = HttpService:JSONDecode(n:GetAttribute("zone"))
            if v1 then
                if v1.owner == UserId then
                    v2 = Zone.showZonePartialBoundingBox(n, nil, v3)
                    u123 = Table.join(u123, v2)
                elseif not (table.find(v1.access, UserId)) then
                end
            end
        end
    end
    u232:Add(function() -- Line: 281 -- upvalues: u123 (ref)
        local v1 = u123
        local v2 = nil
        local v3 = nil
        for i, j in v1, v2, v3 do
            j:Destroy()
        end
    end)
    u232:Add(ClientSettingsHandler.onKeybindPressed("Plot Editor"):Connect(function() -- Line: 287 -- upvalues: u224 (upval), ClientStateHandler (upval), States (upval), Signals (upval), Players (upval), Zone (upval), HttpService (upval), UserId (val), Building (upval)
        if u224 then
            ClientStateHandler.updateState(States.FREECAM, false)
            Signals.Editor.Building.UpdateEnabled:Fire(false)
            return
        end
        local Character = Players.LocalPlayer.Character
        local HumanoidRootPart = Character
        if HumanoidRootPart then
            HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
        end
        if not HumanoidRootPart then
            return
        end
        local v1 = Zone.getZoneFromWorldPosition(HumanoidRootPart.Position)
        local v2 = Zone.getZoneId(v1)
        local v3 = Zone.getZoneRegionFolder():FindFirstChild(v2)
        local v4 = v3
        if v4 then
            v4 = HttpService:JSONDecode(v3:GetAttribute("zone"))
        end
        if not v4 then
            Signals.Toast:Fire({message = "You must be on a plot to use the plot editor.", type = "error"})
            return
        end
        local v5 = if v4.owner ~= UserId then table.find(v4.access, UserId) else true
        if not v5 then
            Signals.Toast:Fire({message = "You do not have access to this plot.", type = "error"})
            return
        end
        ClientStateHandler.updateState(States.FREECAM, true)
        Signals.Editor.Building.UpdateSandboxMode:Fire(false)
        Building.SetSandboxMode.post(false)
        Signals.Editor.Building.UpdateEnabled:Fire(true)
    end))
    u234 = v3
end
Signals.Editor.Building.UpdateEnabled:Connect(function(p1) -- Line: 113 -- upvalues: u230 (val), u224 (ref), u145 (val), u233 (ref), onRefreshToolTrove (val), RunService (val), onBuildingStepped (val)
    u230:Clean()
    u224 = p1
    u145.Select.onResetTool()
    if u233 then
        u233:Clean()
        u233 = nil
    end
    if p1 then
        onRefreshToolTrove()
        u230:Add(RunService.RenderStepped:Connect(onBuildingStepped))
    end
end)
Signals.Editor.Building.UpdateSandboxMode:Connect(function(p1) -- Line: 342 -- upvalues: u223 (ref)
    u223 = p1
end)
Signals.Editor.Building.OnSelectionUpdated:Connect(function(p1) -- Line: 352 -- upvalues: u227 (ref), onRefreshToolTrove (val)
    u227 = p1
    onRefreshToolTrove()
end)
Signals.Editor.Building.OnToolUpdated:Connect(function(p1) -- Line: 365 -- upvalues: u228 (ref), onRefreshToolTrove (val)
    u228 = p1
    onRefreshToolTrove()
end)
Signals.Editor.Building.Place:Connect(function(p1) -- Line: 145 -- upvalues: u225 (ref), u226 (ref), u223 (ref), Building (val)
    Building.Place.post({
        location = p1.location,
        asset = p1.asset,
        isUsingTreasury = u225,
        treasuryId = u226,
        sandboxMode = u223,
    })
end)
Signals.Editor.Building.OnTreasuryUpdated:Connect(function(p1) -- Line: 371 -- upvalues: u225 (ref), u226 (ref)
    u225 = p1.isUsing
    u226 = p1.treasuryId
end)
Building.OnPermissionsUpdated.listen(onRefreshAccessPlots)
onRefreshAccessPlots()
return {
    isSandboxMode = u223,
    getAccessibleZoneBoundary = function(p1) -- Line: 164 -- upvalues: Zone (val), Players (val), HttpService (val)
        local v1
        local Position = p1.Position
        local v2 = Zone.getZoneRegionFolder()
        local UserId = Players.LocalPlayer.UserId
        local v3 = Zone.getZoneFromWorldPosition(Position)
        if v3 then
            local v4 = v2:FindFirstChild(Zone.getZoneId(v3))
            if not v4 then
                v3 = nil
            end
            v1 = v4
            if v1 then
                v1 = HttpService:JSONDecode(v4:GetAttribute("zone"))
            end
            if not v1 then
                v3 = nil
            end
            if not v1 then
                v3 = nil
            elseif v1.owner ~= UserId and not (table.find(v1.access, UserId)) then
            end
        end
        if not v3 then
            local Magnitude, v5
            local huge = math.huge
            v1 = nil
            for i, j in v2:GetChildren() do
                if j:IsA("BasePart") then
                    v5 = HttpService:JSONDecode(j:GetAttribute("zone"))
                    if v5 then
                        if v5.owner == UserId then
                            Magnitude = (j.Position - Position).Magnitude
                            if Magnitude < huge then
                                huge = Magnitude
                                v1 = Zone.getZoneFromPosition(j.Position)
                            end
                        elseif not (table.find(v5.access, UserId)) then
                        end
                    end
                end
            end
            v3 = v1
        end
        return v3
    end,
}