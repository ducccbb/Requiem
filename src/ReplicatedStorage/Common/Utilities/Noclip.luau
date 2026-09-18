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
--                    File: ReplicatedStorage.Common.Utilities.Noclip
--                              Dumped in 0.000763 seconds
--                          Bytecode version 9  |  8 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
v1 = {}
local u18 = game:GetService("UserInputService")
local u24 = game:GetService("RunService")
game:GetService("PhysicsService")
local u30 = {
    A = Vector3.new(-1, 0, 0),
    D = Vector3.new(1, 0, 0),
    W = Vector3.new(0, 0, -1),
    S = Vector3.new(0, 0, 1),
    Q = Vector3.new(0, -1, 0),
    Space = Vector3.new(0, 1, 0),
}
function v1:Stepped(p2) -- Line: 22 -- upvalues: u30 (val)
    local Gyro = self.Gyro
    self.Speed = self.Speed + 0.01 * (p2 * 60)
    local v1 = -math.rad(7.5)
    Gyro.CFrame = workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(v1, 0, 0)
    local v2 = CFrame.new()
    for k, v in pairs(self.PressedKeydowns) do
        if v then
            v2 = v2 * CFrame.new(u30[k] * self.Speed)
        end
    end
    if 1 > self.KeysDown then
        self.Speed = 0
        return
    end
    self.Location = (Gyro.CFrame - Gyro.CFrame.Position) * v2
    local BodyPosition = self.BodyPosition
    BodyPosition.Position = BodyPosition.Position + self.Location.p
end
function v1:UpdateInputs(p2, p3) -- Line: 46
    if p3 then
        self.PressedKeydowns[p2.Name] = true
        self.KeysDown = self.KeysDown + 1
        return
    end
    self.PressedKeydowns[p2.Name] = false
    self.KeysDown = self.KeysDown - 1
end
function v1.Disable(p1) -- Line: 58
    for k, v in pairs(p1.Connections) do
        v:Disconnect()
    end
    p1.Speed = 0
    p1.Humanoid.PlatformStand = false
    p1.Direction = CFrame.new(0, 0, 0)
    p1.KeysDown = 0
    p1.Gyro:Destroy()
    p1.BodyPosition:Destroy()
    for k2, i in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
        if i:IsA("BasePart") then
            i.CollisionGroup = "Default"
        end
    end
end
function v1.Enable(p1) -- Line: 84 -- upvalues: u18 (val), u30 (val), u24 (val)
    p1.Speed = 1
    local Character = game:GetService("Players").LocalPlayer.Character
    local Humanoid = Character
    if Humanoid then
        Humanoid = Character:FindFirstChild("Humanoid")
    end
    p1.Humanoid = Humanoid
    if not Character or not p1.Humanoid then
        return
    end
    local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
    p1.Humanoid.PlatformStand = true
    p1.PressedKeydowns = {}
    p1.Direction = CFrame.new(0, 0, 0)
    p1.KeysDown = 0
    for k, v in pairs(Character:GetDescendants()) do
        if v:IsA("BasePart") then
            v.CollisionGroup = "Noclip"
        end
    end
    p1.Connections = {}
    local Connections = p1.Connections
    Connections.InputBegan = u18.InputBegan:Connect(function(a1, p2) -- Line: 112 -- upvalues: u30 (upval), p1 (val)
        if not (u30[a1.KeyCode.Name]) then
            return
        end
        p1:UpdateInputs(a1.KeyCode, true)
    end)
    local Connections_2 = p1.Connections
    Connections_2.InputEnded = u18.InputEnded:Connect(function(a1, p2) -- Line: 119 -- upvalues: u30 (upval), p1 (val)
        if not (u30[a1.KeyCode.Name]) then
            return
        end
        p1:UpdateInputs(a1.KeyCode, false)
    end)
    local Connections_3 = p1.Connections
    Connections_3.Stepped = u24.RenderStepped:Connect(function(a1) -- Line: 126 -- upvalues: p1 (val)
        p1:Stepped(a1)
    end)
    p1.Gyro = Instance.new("BodyGyro")
    p1.Gyro.Parent = HumanoidRootPart
    p1.Gyro.Name = "NoClipGyro"
    local Gyro = p1.Gyro
    Gyro.maxTorque = Vector3.new(9000000000, 9000000000, 9000000000)
    p1.Gyro.CFrame = HumanoidRootPart.CFrame
    p1.Gyro.D = 250
    p1.BodyPosition = Instance.new("BodyPosition")
    local BodyPosition = p1.BodyPosition
    BodyPosition.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    p1.BodyPosition.Position = HumanoidRootPart.Position
    p1.BodyPosition.P = 10000
    p1.BodyPosition.D = 500
    p1.BodyPosition.Parent = HumanoidRootPart
end
return v1