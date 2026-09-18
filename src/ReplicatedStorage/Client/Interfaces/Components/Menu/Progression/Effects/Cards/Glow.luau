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
--File: ReplicatedStorage.Client.Interfaces.Components.Menu.Progression.Effects.Cards.Glow
--                               Dumped in 0.00121 seconds
--                          Bytecode version 9  |  5 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
return react.memo(function(p1) -- Line: 39 -- upvalues: react (val), RunService (val)
    local u4 = react.useRef(nil)
    react.useEffect(function() -- Line: 42 -- upvalues: RunService (upval), u4 (val), p1 (val)
        local u0 = false
        local u6 = RunService.RenderStepped:Connect(function() -- Line: 44 -- upvalues: u0 (ref), u4 (upval), p1 (upval)
            local v1
            if u0 then
                return
            end
            local current = u4.current
            local card = p1.card
            local current_2 = p1.overlayRef.current
            if not current or not card or not card.Parent or not current_2 then
                return
            end
            local AbsoluteSize = card.AbsoluteSize
            if AbsoluteSize.X <= 0 or AbsoluteSize.Y <= 0 then
                return
            end
            local v2 = card.AbsolutePosition + AbsoluteSize / 2 - current_2.AbsolutePosition
            local v3 = 1
            local v4 = 0
            if p1.pulse then
                local v5 = os.clock() + p1.phase
                v1 = (math.sin(v5 * (math.pi * 2 / 3.6)) + 1) * 0.5
                v3 = v1 * 0.2400000000000001 + 0.88
                v4 = 0.26 - v1 * 0.26
            end
            v1 = math.max(AbsoluteSize.X, AbsoluteSize.Y) * 1.35 * v3
            current.Position = UDim2.fromOffset(v2.X, v2.Y)
            current.Size = UDim2.fromOffset(v1, v1)
            current.ImageTransparency = v4
        end)
        return function() -- Line: 81 -- upvalues: u0 (ref), u6 (val)
            u0 = true
            u6:Disconnect()
        end
    end, {p1.card, p1.color, p1.pulse, p1.phase})
    return react.createElement("ImageLabel", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Image = "rbxassetid://17812826389",
        ImageTransparency = 0,
        ZIndex = 0,
        ref = u4,
        AnchorPoint = Vector2.new(0.5, 0.5),
        ImageColor3 = p1.color,
        Position = UDim2.fromOffset(0, 0),
        Size = UDim2.fromOffset(0, 0),
    })
end)