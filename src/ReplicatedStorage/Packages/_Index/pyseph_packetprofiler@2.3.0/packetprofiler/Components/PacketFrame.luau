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
--File: ReplicatedStorage.Packages._Index.pyseph_packetprofiler@2.3.0.packetprofiler.Components.PacketFrame
--                              Dumped in 0.000340 seconds
--                          Bytecode version 9  |  4 functions

local Packages = require(script.Parent.Parent.Modules.Packages)
local Roact = require(Packages.Directory.Roact)
local v1 = Roact.Component:extend("PacketFrame")
function v1.render(p1) -- Line: 9 -- upvalues: Roact (val)
    local props = p1.props
    return Roact.createElement("ImageLabel", {
        Image = "rbxassetid://10370998310",
        BorderSizePixel = 0,
        Size = props.PacketsChanged:map(function(a1) -- Line: 12 -- upvalues: props (val), Roact (upval), p1 (val)
            local v1 = a1[props.Index]
            if not v1 then
                return Roact.Constant.SkipBindingUpdate
            end
            local v2 = math.min(v1.TotalSize / p1.props.MaxFrameSize, 1)
            local v3 = UDim2.fromScale(1 / props.MaxFrames, v2)
            if v3 == p1.PreviousFrameSize then
                return Roact.Constant.SkipBindingUpdate
            end
            p1.PreviousFrameSize = v3
            return v3
        end),
        AnchorPoint = Vector2.new(0, 1),
        Position = UDim2.fromScale(1 - props.Index / props.MaxFrames, 1),
        Visible = props.PacketsChanged:map(function(a1) -- Line: 31 -- upvalues: props (val), p1 (val), Roact (upval)
            local v1 = a1[props.Index] ~= nil
            if v1 == p1.PreviousIsVisible then
                return Roact.Constant.SkipBindingUpdate
            end
            p1.PreviousIsVisible = v1
            return v1
        end),
        BorderColor3 = Color3.new(1, 1, 1),
    })
end
return v1